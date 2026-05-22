/**
 * HighlightPicker — Session 113 wheel.
 *
 * Long-press-triggered popover that lets the partner mark a verse with
 * one of the 13 palette colors × 3 mark styles. Locked per
 * DESIGN_LANGUAGE.md §6, §7, §8:
 *
 *   - Free tier: neon_yellow + fill style only. The other 12 colors
 *     and the underline / outline styles render dimmed with the
 *     upgrade affordance.
 *   - $1.99-and-above: all 13 colors × 3 styles, plus the free-form
 *     color-meaning dictionary (gear icon → inline editor).
 *
 * Props give the picker the verse it was opened on, the partner's
 * effective tier, the current mark (if any), and callbacks for save /
 * delete / close / labels-changed.
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
  /** The partner's current mark on this verse, or null if unmarked. */
  current: Highlight | null;
  /** Caller's effective tier. */
  userTier: ContentTier;
  /** Callback after a successful save — parent updates the highlights map. */
  onSaved: (h: Highlight) => void;
  /** Callback after a successful delete — parent removes from the map. */
  onDeleted: (verseId: number) => void;
  /** Callback when the picker should close (background tap, save, delete). */
  onClose: () => void;
}

const PRO_TIERS: ContentTier[] = [
  "study_notes",
  "extras",
  "complete_study",
  "everything",
];

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

export default function HighlightPicker({
  verseId,
  current,
  userTier,
  onSaved,
  onDeleted,
  onClose,
}: HighlightPickerProps) {
  const paid = isPaid(userTier);

  const [selectedColor, setSelectedColor] = useState<HighlightColor>(
    current?.color ?? "neon_yellow"
  );
  const [selectedStyle, setSelectedStyle] = useState<MarkStyle>(
    current?.style ?? "fill"
  );
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

  async function handleSave(
    color: HighlightColor = selectedColor,
    style: MarkStyle = selectedStyle
  ) {
    setError(null);
    setSaving(true);
    try {
      const saved = await createOrReplaceHighlight({
        verse_id: verseId,
        color,
        style,
      });
      onSaved(saved);
      onClose();
    } catch (e) {
      setError(String(e));
    } finally {
      setSaving(false);
    }
  }

  async function handleDelete() {
    if (!current) {
      onClose();
      return;
    }
    setError(null);
    setSaving(true);
    try {
      await deleteHighlight(current.id);
      onDeleted(verseId);
      onClose();
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
        <div className="mb-3 flex items-baseline justify-between">
          <h3 className="text-sm font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
            Mark verse
          </h3>
          {paid ? (
            <button
              type="button"
              onClick={() => setEditingLabels(true)}
              className="font-sans text-xs text-[var(--reader-muted)] hover:text-[var(--reader-text)] hover:underline"
              aria-label="Edit color labels"
              title="Edit color meanings"
            >
              ⚙ Labels
            </button>
          ) : (
            <a
              href="/pricing"
              className="font-sans text-xs text-[var(--reader-muted)] hover:text-[var(--reader-text)] hover:underline"
              title="Unlock label customization with Notes ($1.99/mo)"
            >
              ⚙ Labels — $1.99
            </a>
          )}
        </div>

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

        {error && (
          <p className="mb-3 text-sm text-red-600">{error}</p>
        )}

        <div className="flex flex-wrap justify-between gap-2">
          {current ? (
            <button
              type="button"
              onClick={handleDelete}
              disabled={saving}
              className="rounded border border-red-200 px-3 py-1.5 text-sm text-red-700 hover:bg-red-50 disabled:opacity-50"
            >
              Remove mark
            </button>
          ) : (
            <span />
          )}
          <div className="flex gap-2">
            <button
              type="button"
              onClick={onClose}
              className="rounded border border-[var(--reader-rule)] px-3 py-1.5 text-sm"
            >
              Cancel
            </button>
            <button
              type="button"
              onClick={() => handleSave()}
              disabled={saving}
              className="rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-[var(--reader-bg)] disabled:opacity-50"
            >
              {saving ? "Saving…" : current ? "Update" : "Mark verse"}
            </button>
          </div>
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
 *  marked verse span with the given (color, style). */
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
