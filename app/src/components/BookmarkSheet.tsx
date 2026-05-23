/**
 * BookmarkSheet — Session 124 wheel, Wheel 5 of the pre-launch sweep.
 *
 * Long-press-triggered bordered-chrome modal for creating or editing a
 * bookmark on one verse. Locked per DESIGN_LANGUAGE.md §22 (Yoshi's
 * S124 gate: "richer card with metadata" chosen over a simple
 * short_description-only sheet).
 *
 * Card composition top-to-bottom:
 *   - Header: verse reference in §5 spectral-blue accent + ✕ close
 *   - Verse preview (italic muted, line-clamp-3)
 *   - Multi-line short_description textarea (auto-expanding 1-6 lines)
 *   - Tag chips input (partner-defined free text; suggestions from
 *     prior bookmarks)
 *   - Color tint picker (§6 13-color palette + "no tint" default,
 *     all 13 free at this surface per §22 inversion-of-§7 — bookmark
 *     color is personal organization, NOT marking vocabulary)
 *   - Footer: "Saved {date}" when editing + Save / Remove buttons
 *
 * Same modal register as HighlightPicker / RangeActionPicker / Strongs-
 * Lookup — bg-black/40 backdrop, bottom-sheet on mobile (items-end),
 * centered on desktop (sm:items-center), max-w-md width. Tap-outside /
 * ✕ / Escape close without commit (V1 forgives mis-tap; partner re-
 * opens to retry — see §22 "What this section deliberately does NOT
 * prescribe" → auto-save deferred).
 *
 * Props give the sheet the verse it was opened on, the partner's
 * existing bookmark on that verse (or null for create-mode), the verse
 * preview text for the preview block, and callbacks for save / delete /
 * close. Existing-tags suggestions are passed in via the suggestedTags
 * prop so the parent can aggregate across the partner's full bookmark
 * set rather than per-verse.
 */

import { useEffect, useRef, useState } from "react";
import {
  HIGHLIGHT_HEX,
  HIGHLIGHT_PALETTE_ORDER,
  type Bookmark,
  type BookmarkColorTint,
  createOrReplaceBookmark,
  deleteBookmark,
} from "../lib/api";

interface BookmarkSheetProps {
  verseId: number;
  /** Verse reference text for the header — e.g. "Hosea 1:10". */
  verseRef: string;
  /** Verse text for the preview block (line-clamp-3 italic muted). */
  versePreview: string;
  /** The partner's existing bookmark on this verse, or null for create-mode. */
  current: Bookmark | null;
  /** Suggested tags from the partner's prior bookmarks (autocomplete pool). */
  suggestedTags?: readonly string[];
  /** Callback after a successful save — parent updates bookmarksByVerse map. */
  onSaved: (b: Bookmark) => void;
  /** Callback after a successful delete — parent removes by id. */
  onDeleted: (bookmarkId: string) => void;
  /** Callback when the sheet should close (background tap, Save, Remove, ✕, Escape). */
  onClose: () => void;
}

/**
 * Format an ISO timestamp as a short human date — e.g. "May 23, 2026".
 * Used for the "Saved {date}" footer in edit mode.
 */
function formatSavedDate(iso: string): string {
  try {
    const d = new Date(iso);
    return d.toLocaleDateString(undefined, {
      year: "numeric",
      month: "short",
      day: "numeric",
    });
  } catch {
    return "";
  }
}

export default function BookmarkSheet({
  verseId,
  verseRef,
  versePreview,
  current,
  suggestedTags = [],
  onSaved,
  onDeleted,
  onClose,
}: BookmarkSheetProps) {
  const isEditing = current !== null;

  // Form state — pre-filled from `current` when editing, blank for create.
  const [description, setDescription] = useState<string>(
    current?.short_description ?? ""
  );
  const [tags, setTags] = useState<string[]>(current?.tags ?? []);
  const [tagInput, setTagInput] = useState<string>("");
  const [colorTint, setColorTint] = useState<BookmarkColorTint | null>(
    current?.color_tint ?? null
  );
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const textareaRef = useRef<HTMLTextAreaElement | null>(null);

  // Auto-expand textarea on content change (1-6 line range).
  useEffect(() => {
    const el = textareaRef.current;
    if (!el) return;
    el.style.height = "auto";
    const lineHeight = 28; // ~Lora 18/1.55 pixel approximation
    const minHeight = lineHeight * 1;
    const maxHeight = lineHeight * 6;
    el.style.height = `${Math.min(
      Math.max(el.scrollHeight, minHeight),
      maxHeight
    )}px`;
  }, [description]);

  // Escape-to-close.
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") {
        e.preventDefault();
        onClose();
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  // Suggestion dropdown — filter the parent-passed suggestion pool by the
  // current tagInput substring + drop tags already chosen on this card.
  const tagSuggestions = (() => {
    const q = tagInput.trim().toLowerCase();
    if (!q) return [];
    return suggestedTags
      .filter(
        (t) =>
          t.toLowerCase().includes(q) &&
          !tags.some((existing) => existing.toLowerCase() === t.toLowerCase())
      )
      .slice(0, 5);
  })();

  function addTag(raw: string) {
    const t = raw.trim();
    if (!t) return;
    if (tags.some((existing) => existing.toLowerCase() === t.toLowerCase())) {
      setTagInput("");
      return;
    }
    setTags([...tags, t]);
    setTagInput("");
  }

  function removeTag(t: string) {
    setTags(tags.filter((x) => x !== t));
  }

  function handleTagKeyDown(e: React.KeyboardEvent<HTMLInputElement>) {
    if (e.key === "Enter" || e.key === ",") {
      e.preventDefault();
      addTag(tagInput);
    } else if (e.key === "Backspace" && tagInput === "" && tags.length > 0) {
      // Backspace on empty input removes the trailing chip.
      removeTag(tags[tags.length - 1]);
    }
  }

  async function handleSave() {
    setSaving(true);
    setError(null);
    try {
      // Strip empty values so the server-side row stays clean.
      const body = {
        verse_id: verseId,
        short_description: description.trim() || null,
        tags: tags.length > 0 ? tags : null,
        color_tint: colorTint,
      };
      const saved = await createOrReplaceBookmark(body);
      onSaved(saved);
      onClose();
    } catch (e) {
      setError(
        e instanceof Error ? e.message : "Couldn't save bookmark — try again."
      );
      setSaving(false);
    }
  }

  async function handleRemove() {
    if (!current) return;
    setSaving(true);
    setError(null);
    try {
      await deleteBookmark(current.id);
      onDeleted(current.id);
      onClose();
    } catch (e) {
      setError(
        e instanceof Error ? e.message : "Couldn't remove bookmark — try again."
      );
      setSaving(false);
    }
  }

  return (
    <div
      className="fixed inset-0 z-40 flex items-end justify-center bg-black/40 p-4 sm:items-center"
      onClick={onClose}
      role="dialog"
      aria-label={isEditing ? "Edit bookmark" : "Create bookmark"}
    >
      <div
        className="max-h-[85vh] w-full max-w-md overflow-y-auto rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header — verse ref + ✕ close. */}
        <div className="mb-3 flex items-baseline justify-between">
          <h2
            className="text-lg font-semibold"
            style={{ color: "var(--reader-accent)" }}
          >
            {verseRef}
          </h2>
          <button
            type="button"
            className="ml-2 text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
            onClick={onClose}
            aria-label="Close"
          >
            ✕
          </button>
        </div>

        {/* Verse preview — italic muted, line-clamp-3. */}
        <p className="mb-4 italic text-[var(--reader-muted)] line-clamp-3">
          {versePreview}
        </p>

        {/* Short_description multi-line textarea. */}
        <label
          htmlFor="bookmark-description"
          className="mb-1 block text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]"
        >
          Why are you saving this?
        </label>
        <textarea
          id="bookmark-description"
          ref={textareaRef}
          className="mb-4 w-full resize-none rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] p-2 text-base leading-relaxed"
          placeholder="Why are you saving this verse?"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          rows={1}
        />

        {/* Tag chips input. */}
        <label
          htmlFor="bookmark-tag-input"
          className="mb-1 block text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]"
        >
          Tags
        </label>
        <div className="mb-1 flex flex-wrap items-center gap-1.5 rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] p-2">
          {tags.map((t) => (
            <span
              key={t}
              className="inline-flex items-center gap-1 rounded-full border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-0.5 text-sm"
            >
              {t}
              <button
                type="button"
                className="ml-0.5 text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
                onClick={() => removeTag(t)}
                aria-label={`Remove tag ${t}`}
              >
                ×
              </button>
            </span>
          ))}
          <input
            id="bookmark-tag-input"
            type="text"
            className="min-w-[6rem] flex-1 bg-transparent text-sm outline-none"
            placeholder={
              tags.length === 0
                ? "Type a tag and press Enter"
                : "Add another…"
            }
            value={tagInput}
            onChange={(e) => setTagInput(e.target.value)}
            onKeyDown={handleTagKeyDown}
          />
        </div>
        {tagSuggestions.length > 0 && (
          <div className="mb-4 flex flex-wrap gap-1">
            {tagSuggestions.map((s) => (
              <button
                key={s}
                type="button"
                className="rounded-full border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-2 py-0.5 text-xs text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
                onClick={() => addTag(s)}
              >
                + {s}
              </button>
            ))}
          </div>
        )}
        {tagSuggestions.length === 0 && <div className="mb-4" />}

        {/* Color tint picker — 13-color §6 palette + "no tint" default. */}
        <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
          Color tint
        </label>
        <div className="mb-4 flex flex-wrap items-center gap-1.5">
          {/* "No tint" affordance — leftmost, slash-through swatch. */}
          <button
            type="button"
            className={`relative h-7 w-7 rounded-full border ${
              colorTint === null
                ? "ring-2 ring-[var(--reader-accent)] ring-offset-1 ring-offset-[var(--reader-surface)]"
                : ""
            }`}
            style={{
              borderColor: "var(--reader-rule)",
              background: "transparent",
            }}
            onClick={() => setColorTint(null)}
            aria-label="Color tint: none"
            aria-pressed={colorTint === null}
            title="No tint"
          >
            <span
              className="absolute left-1/2 top-1/2 h-[2px] w-5 -translate-x-1/2 -translate-y-1/2 rotate-45"
              style={{ background: "var(--reader-muted)" }}
            />
          </button>
          {HIGHLIGHT_PALETTE_ORDER.map((c) => (
            <button
              key={c}
              type="button"
              className={`h-7 w-7 rounded-full border ${
                colorTint === c
                  ? "ring-2 ring-[var(--reader-accent)] ring-offset-1 ring-offset-[var(--reader-surface)]"
                  : ""
              }`}
              style={{
                background: HIGHLIGHT_HEX[c],
                borderColor: "var(--reader-rule)",
              }}
              onClick={() => setColorTint(c)}
              aria-label={`Color tint: ${c.replace("_", " ")}`}
              aria-pressed={colorTint === c}
              title={c.replace("_", " ")}
            />
          ))}
        </div>

        {/* Inline error (rare path — API failure mid-save). */}
        {error && (
          <p className="mb-3 rounded border border-red-500/40 bg-red-500/10 p-2 text-sm text-red-300">
            {error}
          </p>
        )}

        {/* Footer — Remove (edit mode only, left) + Save (right) +
            Saved-date display under footer when editing. */}
        <div className="mt-2 flex items-center justify-between gap-2">
          {isEditing ? (
            <button
              type="button"
              className="rounded border border-[var(--reader-rule)] px-3 py-1.5 text-sm text-[var(--reader-muted)] hover:text-[var(--reader-text)] disabled:opacity-50"
              onClick={handleRemove}
              disabled={saving}
            >
              Remove
            </button>
          ) : (
            <span />
          )}
          <button
            type="button"
            className="rounded bg-[var(--reader-accent)] px-4 py-1.5 text-sm font-semibold text-[var(--reader-bg)] disabled:opacity-50"
            onClick={handleSave}
            disabled={saving}
          >
            {saving ? "Saving…" : "Save"}
          </button>
        </div>
        {isEditing && current && (
          <p className="mt-2 text-right text-xs text-[var(--reader-muted)]">
            Saved {formatSavedDate(current.created_at)}
            {current.updated_at !== current.created_at
              ? ` · edited ${formatSavedDate(current.updated_at)}`
              : ""}
          </p>
        )}
      </div>
    </div>
  );
}
