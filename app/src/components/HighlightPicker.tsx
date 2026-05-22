/**
 * HighlightPicker — Session 113 wheel, rebuilt at Session 117 for
 * multi-mark.
 *
 * Long-press-triggered popover that lets the partner mark a verse with
 * one or more (color, style) combinations. Locked per
 * DESIGN_LANGUAGE.md §6, §7, §8:
 *
 *   - Free tier: neon_yellow + fill style only. The other 12 colors
 *     and the underline / outline styles render dimmed with the
 *     upgrade affordance.
 *   - $1.99-and-above: all 13 colors × 3 styles, plus the free-form
 *     color-meaning dictionary (paid-tier "+ Add color labels" gear).
 *
 * S117 multi-mark — schema unique is (user_id, verse_id, color, style),
 * so different (color, style) combos coexist on a single verse:
 * crimson fill + emerald underline + sky_blue outline all live on the
 * same verse simultaneously, and multiple underlines in different
 * colors stack via PWA-side nested spans with text-underline-offset
 * increments. The same exact (color, style) tuple on the same verse is
 * a no-op (insert-or-no-op semantics on the API side). Picker enforces
 * a 3-mark hard cap per verse for readability.
 *
 * Props give the picker the verse it was opened on, the partner's
 * existing marks on that verse (array, possibly empty), the effective
 * tier, and callbacks for save / per-mark-delete / close / labels-
 * changed.
 */

import { useEffect, useState } from "react";
import {
  HIGHLIGHT_HEX,
  HIGHLIGHT_PALETTE_ORDER,
  MARK_STYLES,
  type ContentTier,
  type Highlight,
  type HighlightColor,
  type HighlightLabel,
  type MarkStyle,
  createOrReplaceHighlight,
  deleteHighlight,
  getHighlightLabels,
  updateHighlightLabels,
} from "../lib/api";

interface HighlightPickerProps {
  verseId: number;
  /** The partner's existing marks on this verse (empty array if none). */
  current: Highlight[];
  /** Caller's effective tier. */
  userTier: ContentTier;
  /** Callback after a successful save — parent appends/dedup-merges into the highlights map. */
  onSaved: (h: Highlight) => void;
  /** Callback after a successful delete — parent removes the matching mark by id. */
  onDeleted: (highlightId: string) => void;
  /** Callback when the picker should close (background tap, save, delete). */
  onClose: () => void;
}

const PRO_TIERS: ContentTier[] = [
  "study_notes",
  "extras",
  "complete_study",
  "everything",
];

/** S117 — hard cap on marks per verse. Picker prevents Add at this count.
 *  Schema doesn't enforce; the cap lives in the UI per the design lock at
 *  DESIGN_LANGUAGE.md §8 (S117 update). */
const MAX_MARKS_PER_VERSE = 3;

function isPaid(tier: ContentTier): boolean {
  return PRO_TIERS.includes(tier);
}

/** Compose the fill-alpha hex (8-digit) from a 6-digit hex + alpha 0..1. */
function fillHexFor(color: HighlightColor): string {
  const hex = HIGHLIGHT_HEX[color];
  const alpha = color === "parchment" ? 0.22 : 0.33;
  const a = Math.round(alpha * 255)
    .toString(16)
    .padStart(2, "0");
  return `${hex}${a}`;
}

/** Pretty-print a style name for chip labels. */
function prettyStyle(style: MarkStyle): string {
  return style; // 'fill' | 'underline' | 'outline' — already reader-friendly
}

export default function HighlightPicker({
  verseId,
  current,
  userTier,
  onSaved,
  onDeleted,
  onClose,
}: HighlightPickerProps) {
  const paid = isPaid(userTier);
  const capReached = current.length >= MAX_MARKS_PER_VERSE;

  // S117 — initial picker state defaults to neon_yellow + fill. Earlier
  // versions seeded from `current` (the single existing mark) because
  // re-marking replaced; under multi-mark there's no "the existing
  // mark" to seed from (there can be 0..3 of them), so we default and
  // let the partner pick whatever new combo they want to add.
  const [selectedColor, setSelectedColor] =
    useState<HighlightColor>("neon_yellow");
  const [selectedStyle, setSelectedStyle] = useState<MarkStyle>("fill");
  const [labels, setLabels] = useState<HighlightLabel[]>([]);
  const [editingLabels, setEditingLabels] = useState<boolean>(false);
  const [labelDraft, setLabelDraft] = useState<Record<HighlightColor, string>>(
    {} as Record<HighlightColor, string>
  );
  const [error, setError] = useState<string | null>(null);
  const [saving, setSaving] = useState<boolean>(false);

  // Load the partner's labels on mount (both for the dictionary surface
  // under each swatch + for the editor's initial values).
  useEffect(() => {
    let cancelled = false;
    getHighlightLabels()
      .then((r) => {
        if (cancelled) return;
        setLabels(r.labels);
      })
      .catch(() => {
        // Anonymous / 401 — picker still works for free callers via
        // the cookie, but if labels fail we just render empty strings.
      });
    return () => {
      cancelled = true;
    };
  }, []);

  // When entering edit mode, seed the draft from current labels.
  useEffect(() => {
    if (!editingLabels) return;
    const draft = {} as Record<HighlightColor, string>;
    for (const l of labels) draft[l.color] = l.label;
    setLabelDraft(draft);
  }, [editingLabels, labels]);

  // ---- Color + style selection helpers ----------------------------------

  function colorIsLocked(color: HighlightColor): boolean {
    if (color === "neon_yellow") return false;
    return !paid;
  }
  function styleIsLocked(style: MarkStyle): boolean {
    if (style === "fill") return false;
    return !paid;
  }

  function labelFor(color: HighlightColor): string {
    const found = labels.find((l) => l.color === color);
    return found?.label ?? "";
  }

  /** S117 — true when the selected (color, style) tuple is already a
   *  mark on this verse. Mark button disables in this state so the
   *  partner can't queue a no-op insert (the API would no-op too, but
   *  the picker should communicate the state clearly). */
  function selectedTupleAlreadyMarked(): boolean {
    return current.some(
      (m) => m.color === selectedColor && m.style === selectedStyle
    );
  }

  async function handleSave() {
    if (capReached) return; // belt-and-suspenders — UI also disables
    if (selectedTupleAlreadyMarked()) return;
    setError(null);
    setSaving(true);
    try {
      const saved = await createOrReplaceHighlight({
        verse_id: verseId,
        color: selectedColor,
        style: selectedStyle,
      });
      onSaved(saved);
      onClose();
    } catch (e) {
      setError(String(e));
    } finally {
      setSaving(false);
    }
  }

  /** S117 — per-mark delete via chip ×. The chip carries the mark's id
   *  through the closure; the API delete is by id. */
  async function handleDeleteMark(mark: Highlight) {
    setError(null);
    setSaving(true);
    try {
      await deleteHighlight(mark.id);
      onDeleted(mark.id);
      // Don't close — partner may want to add a replacement or remove
      // another. The chip disappears via the parent state update; the
      // picker stays open.
    } catch (e) {
      setError(String(e));
    } finally {
      setSaving(false);
    }
  }

  async function handleSaveLabels() {
    setError(null);
    setSaving(true);
    try {
      const entries = Object.entries(labelDraft).map(([color, label]) => ({
        color: color as HighlightColor,
        label,
      }));
      const r = await updateHighlightLabels({ labels: entries });
      setLabels(r.labels);
      setEditingLabels(false);
    } catch (e) {
      setError(String(e));
    } finally {
      setSaving(false);
    }
  }

  // ---- Render -----------------------------------------------------------

  if (editingLabels) {
    return (
      <div
        className="fixed inset-0 z-40 flex items-center justify-center bg-black/40 p-4"
        onClick={onClose}
      >
        <div
          className="max-h-[85vh] w-full max-w-md overflow-y-auto rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 shadow-xl"
          onClick={(e) => e.stopPropagation()}
        >
          <div className="mb-3 flex items-baseline justify-between">
            <h3 className="text-lg font-semibold">Color meanings</h3>
            <button
              type="button"
              onClick={() => setEditingLabels(false)}
              className="font-sans text-sm text-[var(--reader-muted)] hover:underline"
            >
              Cancel
            </button>
          </div>
          <p className="mb-3 text-base text-[var(--reader-muted)]">
            Assign your own meaning to each color. Leave blank to clear.
          </p>
          <div className="space-y-2">
            {HIGHLIGHT_PALETTE_ORDER.map((color) => (
              <div key={color} className="flex items-center gap-2">
                <span
                  className="swatch"
                  style={{ backgroundColor: HIGHLIGHT_HEX[color] }}
                />
                <input
                  type="text"
                  value={labelDraft[color] ?? ""}
                  onChange={(e) =>
                    setLabelDraft({ ...labelDraft, [color]: e.target.value })
                  }
                  placeholder="Add a meaning…"
                  className="flex-1 rounded border border-[var(--reader-rule)] px-2 py-1 text-sm"
                />
              </div>
            ))}
          </div>
          {error && (
            <p className="mt-3 text-sm text-red-600">{error}</p>
          )}
          <div className="mt-4 flex justify-end gap-2">
            <button
              type="button"
              onClick={() => setEditingLabels(false)}
              className="rounded border border-[var(--reader-rule)] px-3 py-1.5 text-sm"
            >
              Cancel
            </button>
            <button
              type="button"
              onClick={handleSaveLabels}
              disabled={saving}
              className="rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-[var(--reader-bg)] disabled:opacity-50"
            >
              {saving ? "Saving…" : "Save"}
            </button>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div
      className="fixed inset-0 z-40 flex items-end justify-center bg-black/40 p-4 sm:items-center"
      onClick={onClose}
    >
      <div
        className="w-full max-w-md rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header row — title + (paid only) "Add color labels" gear. The
            free-tier "$1.99 — Labels" tag is intentionally hidden at S117:
            the bottom-of-picker upgrade prompt already explains what
            $1.99 unlocks; inline-pricing a single button gave the wrong
            impression that every action was individually-priced. */}
        <div className="mb-3 flex items-baseline justify-between">
          <h3 className="text-sm font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
            Mark verse
          </h3>
          {paid && (
            <button
              type="button"
              onClick={() => setEditingLabels(true)}
              className="font-sans text-xs text-[var(--reader-muted)] hover:text-[var(--reader-text)] hover:underline"
              aria-label="Add color labels"
              title="Assign your own meaning to each color"
            >
              + Add color labels
            </button>
          )}
        </div>

        {/* S117 chips row — existing marks on this verse, each with × to
            remove. Empty when no marks; tight row that takes minimal
            vertical space when populated. */}
        {current.length > 0 && (
          <div className="mb-3 flex flex-wrap gap-1.5">
            {current.map((mark) => (
              <span
                key={mark.id}
                className="inline-flex items-center gap-1.5 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-xs"
                title={`${mark.color} — ${prettyStyle(mark.style)}`}
              >
                <span
                  className="inline-block h-3 w-3 rounded-full border border-[var(--reader-rule)]"
                  style={{ backgroundColor: HIGHLIGHT_HEX[mark.color] }}
                  aria-hidden="true"
                />
                <span className="text-[var(--reader-text)]">
                  {prettyStyle(mark.style)}
                </span>
                <button
                  type="button"
                  onClick={() => handleDeleteMark(mark)}
                  disabled={saving}
                  className="ml-0.5 text-[var(--reader-muted)] hover:text-[var(--reader-text)] disabled:opacity-50"
                  aria-label={`Remove ${mark.color} ${mark.style} mark`}
                  title={`Remove ${mark.color} ${mark.style} mark`}
                >
                  ×
                </button>
              </span>
            ))}
          </div>
        )}

        {/* S117 cap-reached notice — replaces the swatch/style picker when
            the verse already has MAX_MARKS_PER_VERSE marks. Partner must
            remove one to add another. */}
        {capReached ? (
          <p className="mb-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2 text-sm text-[var(--reader-muted)]">
            This verse has {MAX_MARKS_PER_VERSE} marks — the maximum. Remove
            one of the chips above to add another.
          </p>
        ) : (
          <>
            {/* Style toggle row */}
            <div className="mb-3 flex gap-2">
              {MARK_STYLES.map((style) => {
                const locked = styleIsLocked(style);
                const selected = style === selectedStyle;
                return (
                  <button
                    key={style}
                    type="button"
                    onClick={() => {
                      if (locked) {
                        window.location.href = "/pricing";
                        return;
                      }
                      setSelectedStyle(style);
                    }}
                    className={`flex-1 rounded border px-2 py-1.5 text-xs font-medium capitalize ${
                      selected
                        ? "border-[var(--reader-text)] bg-[var(--reader-text)] text-[var(--reader-bg)]"
                        : "border-[var(--reader-rule)] bg-[var(--reader-surface)] text-[var(--reader-text)]"
                    } ${locked ? "opacity-50" : ""}`}
                    title={
                      locked
                        ? `${style} — unlock with Notes ($1.99/mo)`
                        : style
                    }
                  >
                    {style}
                    {locked && " 🔒"}
                  </button>
                );
              })}
            </div>

            {/* Color swatch grid */}
            <div className="mb-3 grid grid-cols-7 gap-2">
              {HIGHLIGHT_PALETTE_ORDER.map((color) => {
                const locked = colorIsLocked(color);
                const selected = color === selectedColor;
                const labelText = labelFor(color);
                return (
                  <button
                    key={color}
                    type="button"
                    onClick={() => {
                      if (locked) {
                        window.location.href = "/pricing";
                        return;
                      }
                      setSelectedColor(color);
                    }}
                    className={`swatch ${selected ? "is-selected" : ""} ${
                      locked ? "is-locked" : ""
                    }`}
                    style={{ backgroundColor: HIGHLIGHT_HEX[color] }}
                    title={
                      locked
                        ? `${color} — unlock with Notes ($1.99/mo)`
                        : labelText
                          ? `${color} — ${labelText}`
                          : color
                    }
                    aria-label={
                      locked
                        ? `${color} — unlock with Notes`
                        : labelText || color
                    }
                  />
                );
              })}
            </div>

            {/* Label for the currently selected color, if set */}
            {labelFor(selectedColor) && (
              <p className="mb-3 text-xs italic text-[var(--reader-muted)]">
                {labelFor(selectedColor)}
              </p>
            )}
          </>
        )}

        {error && (
          <p className="mb-3 text-sm text-red-600">{error}</p>
        )}

        <div className="flex flex-wrap justify-end gap-2">
          <button
            type="button"
            onClick={onClose}
            className="rounded border border-[var(--reader-rule)] px-3 py-1.5 text-sm"
          >
            {current.length > 0 ? "Done" : "Cancel"}
          </button>
          {!capReached && (
            <button
              type="button"
              onClick={handleSave}
              disabled={saving || selectedTupleAlreadyMarked()}
              className="rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-[var(--reader-bg)] disabled:opacity-50"
              title={
                selectedTupleAlreadyMarked()
                  ? "This color and style is already on the verse"
                  : "Add this mark to the verse"
              }
            >
              {saving
                ? "Saving…"
                : selectedTupleAlreadyMarked()
                  ? "Already marked"
                  : current.length > 0
                    ? "Add mark"
                    : "Mark verse"}
            </button>
          )}
        </div>

        {!paid && (
          <p className="mt-3 text-center text-xs text-[var(--reader-muted)]">
            Unlock 12 more colors + underline + outline styles with{" "}
            <a href="/pricing" className="underline">
              Notes ($1.99/mo)
            </a>
            .
          </p>
        )}
      </div>
    </div>
  );
}

/** Read-only helper: compute the inline style props for rendering a
 *  marked verse span with the given (color, style). Underline-offset
 *  is set per-mark by the verse-render layer in App.tsx based on the
 *  mark's index among the underline marks on that verse (multi-underline
 *  stacking — first underline at the CSS-default 2px, then 7px, 12px). */
export function markCssVarsFor(color: HighlightColor): React.CSSProperties {
  return {
    ["--mark-color" as string]: HIGHLIGHT_HEX[color],
    ["--mark-color-fill" as string]: fillHexFor(color),
  };
}

/** Tailwind/utility class name for a given mark style. */
export function markClassFor(style: MarkStyle): string {
  return `mark-${style}`;
}
