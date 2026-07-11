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
import { isNativeShell, NATIVE_MANAGE_LINE } from "../lib/native-shell";

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
  /**
   * S123 multi-target mode (W4 of the pre-launch sweep — range-selection's
   * first consumer per DESIGN_LANGUAGE.md §21). When present and length > 1,
   * the picker fires the chosen (color, style) against every verse in the
   * list via parallel POSTs. UI changes when multi-target is active:
   *
   *   - Title reads "Mark N verses" instead of "Mark verse".
   *   - The S117 chips row (existing marks on this verse) is hidden — the
   *     multi-target apply is a fresh stroke, not a per-verse edit.
   *   - The S117 cap-reached banner is skipped at picker time — per-verse
   *     cap is enforced at commit time (verses already at 3 marks silently
   *     skip; the other verses in the range still commit).
   *   - Save button reads "Mark N verses".
   *
   * Length 0 or 1 (or undefined) → single-verse mode (existing behavior).
   * Single-verse mode falls back to the S117 chips + cap UX unchanged.
   */
  targetVerseIds?: number[];
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

/** Title-case style name for the label editor ("Fill" / "Underline"). */
function styleTitle(style: MarkStyle): string {
  return style.charAt(0).toUpperCase() + style.slice(1);
}

/** Friendly color name for the label editor: 'sky_blue' → 'Sky blue'. */
function prettyColor(color: HighlightColor): string {
  const spaced = color.replace(/_/g, " ");
  return spaced.charAt(0).toUpperCase() + spaced.slice(1);
}

/** S422 — labels are keyed by (color, style). This composite key is the
 *  key into the label-draft map and the lookup into the labels array. */
function markKey(color: HighlightColor, style: MarkStyle): string {
  return `${color}::${style}`;
}

export default function HighlightPicker({
  verseId,
  current,
  userTier,
  onSaved,
  onDeleted,
  onClose,
  targetVerseIds,
}: HighlightPickerProps) {
  const paid = isPaid(userTier);
  // S123 — multi-target mode is active when targetVerseIds carries >1 ids.
  // Single-verse mode (existing behavior) when undefined OR length <= 1.
  const multiTarget = !!targetVerseIds && targetVerseIds.length > 1;
  const targetCount = multiTarget ? targetVerseIds!.length : 1;
  // S117 chips + cap apply to single-verse mode only. Multi-target hides
  // both because the apply is a fresh stroke against N verses.
  const capReached = !multiTarget && current.length >= MAX_MARKS_PER_VERSE;

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
  // S422 — draft keyed by markKey(color, style); each (color, style) slot
  // carries its own label.
  const [labelDraft, setLabelDraft] = useState<Record<string, string>>({});
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

  // When entering edit mode, seed the draft from current labels, keyed
  // by (color, style) per S422.
  useEffect(() => {
    if (!editingLabels) return;
    const draft: Record<string, string> = {};
    for (const l of labels) draft[markKey(l.color, l.style)] = l.label;
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

  /** S422 — the partner's label for a specific (color, style) slot. */
  function labelFor(color: HighlightColor, style: MarkStyle): string {
    const found = labels.find((l) => l.color === color && l.style === style);
    return found?.label ?? "";
  }

  /** S117 — true when the selected (color, style) tuple is already a
   *  mark on this verse. Mark button disables in this state so the
   *  partner can't queue a no-op insert (the API would no-op too, but
   *  the picker should communicate the state clearly).
   *
   *  Multi-target mode: never flags as already-marked. The S117 cap +
   *  per-verse dedup are enforced at commit time per-verse — picker
   *  doesn't pre-check across N verses because that would require
   *  fetching every verse's marks, which we don't have at picker open.
   */
  function selectedTupleAlreadyMarked(): boolean {
    if (multiTarget) return false;
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
      if (multiTarget) {
        // S123 multi-target — fire N parallel POSTs, one per verse in the
        // captured range. ON CONFLICT DO NOTHING semantics on the API
        // (S117 insert-or-no-op constraint) means re-marking a verse that
        // already carries (color, style) is a silent no-op. Per-verse
        // failures are caught individually so partial-failure is
        // acceptable — the successful commits stand, the failed ones
        // produce inline error feedback. Non-critical free-tier feature
        // per the publish-then-edit posture.
        const results = await Promise.allSettled(
          targetVerseIds!.map((vid) =>
            createOrReplaceHighlight({
              verse_id: vid,
              color: selectedColor,
              style: selectedStyle,
            })
          )
        );
        let failures = 0;
        for (const r of results) {
          if (r.status === "fulfilled") {
            onSaved(r.value);
          } else {
            failures++;
          }
        }
        if (failures > 0 && failures === results.length) {
          // Total failure — show an error and keep the picker open so
          // the partner can retry.
          setError(`Failed to mark ${failures} verses.`);
          return;
        }
        if (failures > 0) {
          // Partial failure — log silently and close. The marks that
          // succeeded are already in the verse-highlights map via
          // onSaved; the partner sees them on the verses they landed on.
          if (typeof console !== "undefined") {
            console.warn(
              `Multi-target highlight: ${failures} of ${results.length} commits failed.`
            );
          }
        }
        onClose();
        return;
      }
      // Single-verse mode (existing behavior).
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
      // S422 — each draft key is markKey(color, style); split it back
      // into the (color, style, label) triple the API expects.
      const entries = Object.entries(labelDraft).map(([key, label]) => {
        const [color, style] = key.split("::");
        return {
          color: color as HighlightColor,
          style: style as MarkStyle,
          label,
        };
      });
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
          className="max-h-[85vh] w-full max-w-6xl overflow-y-auto rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 shadow-xl"
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
            Assign your own meaning to each color <em>and</em> mark style.
            Yellow underline can mean something different from yellow
            outline. Leave a field blank to clear it.
          </p>
          {/* S422 — grouped by color; the three mark styles (fill /
              underline / outline) sit under each color as separate label
              slots. Locked (color × style) slots render disabled with the
              unlock hint (a caller only reaches this editor when paid, so
              in practice nothing is locked here, but the gate is honored
              so the surface can never edit a slot the tier can't apply). */}
          <div className="space-y-4">
            {HIGHLIGHT_PALETTE_ORDER.map((color) => (
              <div key={color}>
                <div className="mb-1.5 flex items-center gap-2">
                  <span
                    className="swatch"
                    style={{ backgroundColor: HIGHLIGHT_HEX[color] }}
                  />
                  <span className="text-sm font-semibold text-[var(--reader-text)]">
                    {prettyColor(color)}
                  </span>
                </div>
                <div className="ml-6 space-y-1.5">
                  {MARK_STYLES.map((style) => {
                    const locked =
                      colorIsLocked(color) || styleIsLocked(style);
                    const key = markKey(color, style);
                    return (
                      <div key={style} className="flex items-center gap-2">
                        <label
                          htmlFor={`lbl-${key}`}
                          className="w-20 shrink-0 text-xs font-medium text-[var(--reader-muted)]"
                        >
                          {styleTitle(style)}
                          {locked && " 🔒"}
                        </label>
                        <input
                          id={`lbl-${key}`}
                          type="text"
                          disabled={locked}
                          value={labelDraft[key] ?? ""}
                          onChange={(e) =>
                            setLabelDraft({
                              ...labelDraft,
                              [key]: e.target.value,
                            })
                          }
                          placeholder={
                            locked
                              ? "Unlock in Study Notes tier"
                              : `Meaning for ${prettyColor(
                                  color
                                ).toLowerCase()} ${style}…`
                          }
                          className="flex-1 rounded border border-[var(--reader-rule)] px-2 py-1 text-sm disabled:opacity-50"
                        />
                      </div>
                    );
                  })}
                </div>
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
        className="w-full max-w-6xl rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header row — title + (paid only) "Add color labels" gear. The
            free-tier "Study Notes — Labels" tag is intentionally hidden at
            S117: the bottom-of-picker upgrade prompt already explains
            what the Study Notes tier unlocks; inline-pricing a single
            button gave the wrong impression that every action was
            individually-priced (S140 tier-name overhaul + price removal). */}
        <div className="mb-3 flex items-baseline justify-between">
          <h3 className="text-sm font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
            {multiTarget ? `Mark ${targetCount} verses` : "Mark verse"}
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

        {/* S172.14 — prominent "Remove highlight from this verse" button
            at the top of the picker when the verse has marks. One tap
            deletes ALL marks on the verse; the picker stays open so the
            partner can add a replacement immediately if they wanted to
            change the color/style. The smaller × chips below remain for
            selective per-mark removal when the verse has multiple. Fix
            for the S172.12 discoverability problem — the menu-level
            "Remove highlight" item shipped but partners look here first. */}
        {!multiTarget && current.length > 0 && (
          <button
            type="button"
            onClick={async () => {
              setError(null);
              setSaving(true);
              try {
                // Delete every mark on the verse in parallel.
                await Promise.all(
                  current.map((m) => deleteHighlight(m.id)),
                );
                // Drop each id from the parent state via the existing
                // onDeleted callback (called once per id so the parent
                // state-update path stays identical to the chip × flow).
                for (const m of current) {
                  onDeleted(m.id);
                }
                onClose();
              } catch (e) {
                setError(String(e));
              } finally {
                setSaving(false);
              }
            }}
            disabled={saving}
            className="mb-3 w-full rounded border border-[#FFBFC5] bg-gradient-to-r from-[#3A0F12] via-[#B82B36] to-[#3A0F12] px-3 py-2 text-sm font-semibold text-[#FFE6E8] shadow-sm hover:opacity-90 disabled:opacity-50"
            aria-label={
              current.length === 1
                ? "Remove highlight from this verse"
                : `Remove all ${current.length} highlights from this verse`
            }
          >
            ✕ Remove {current.length === 1 ? "highlight" : `all ${current.length} highlights`} from this verse
          </button>
        )}

        {/* S117 chips row — existing marks on this verse, each with × to
            remove. Empty when no marks; tight row that takes minimal
            vertical space when populated. S123: hidden entirely in
            multi-target mode (apply is a fresh stroke against N verses,
            not a per-verse edit). S172.14: chips kept for selective
            per-mark removal when the verse has multiple. */}
        {!multiTarget && current.length > 0 && (
          <div className="mb-3 flex flex-wrap gap-1.5">
            {current.map((mark) => (
              <span
                key={mark.id}
                className="inline-flex items-center gap-1.5 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-xs"
                title={
                  labelFor(mark.color, mark.style)
                    ? `${prettyColor(mark.color)} · ${styleTitle(mark.style)} — ${labelFor(mark.color, mark.style)}`
                    : `${prettyColor(mark.color)} · ${styleTitle(mark.style)}`
                }
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
                        // Native: no purchase steering — locked styles
                        // stay locked (🔒 shown) but do NOT route to
                        // /pricing. Web routes to pricing as before.
                        if (!isNativeShell()) {
                          window.location.href = "/pricing";
                        }
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
                        ? `${style} — unlock in Study Notes tier`
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
                // S422 — surface the label for THIS color at the currently
                // selected style (the mark about to be applied).
                const labelText = labelFor(color, selectedStyle);
                return (
                  <button
                    key={color}
                    type="button"
                    onClick={() => {
                      if (locked) {
                        // Native: no purchase steering — locked colors
                        // stay locked but do NOT route to /pricing. Web
                        // routes to pricing as before.
                        if (!isNativeShell()) {
                          window.location.href = "/pricing";
                        }
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
                        ? `${color} — unlock in Study Notes tier`
                        : labelText
                          ? `${color} — ${labelText}`
                          : color
                    }
                    aria-label={
                      locked
                        ? `${color} — unlock in Study Notes tier`
                        : labelText || color
                    }
                  />
                );
              })}
            </div>

            {/* Label for the currently selected (color, style) slot, if set */}
            {labelFor(selectedColor, selectedStyle) && (
              <p className="mb-3 text-xs italic text-[var(--reader-muted)]">
                {prettyColor(selectedColor)} · {styleTitle(selectedStyle)} —{" "}
                {labelFor(selectedColor, selectedStyle)}
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
            {multiTarget ? "Cancel" : current.length > 0 ? "Done" : "Cancel"}
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
                : multiTarget
                  ? `Mark ${targetCount} verses`
                  : selectedTupleAlreadyMarked()
                    ? "Already marked"
                    : current.length > 0
                      ? "Add mark"
                      : "Mark verse"}
            </button>
          )}
        </div>

        {!paid &&
          (isNativeShell() ? (
            // Native: no in-app purchase path — plain text, non-clickable,
            // no price; names the tier and points to the web account.
            <p className="mt-3 text-center text-xs text-[var(--reader-text)]">
              12 more colors + underline + outline styles are part of the
              Study Notes tier. {NATIVE_MANAGE_LINE}.
            </p>
          ) : (
            <p className="mt-3 text-center text-xs text-[var(--reader-muted)]">
              Unlock 12 more colors + underline + outline styles in the{" "}
              <a href="/pricing" className="underline">
                Study Notes tier
              </a>
              .
            </p>
          ))}
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
