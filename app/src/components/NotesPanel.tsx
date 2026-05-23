/**
 * NotesPanel — Session 124 wheel, Wheel 5 of the pre-launch sweep.
 *
 * Bottom slide-up panel for the Free-tier single global notepad with
 * verse-anchor injection. Locked per DESIGN_LANGUAGE.md §22 (Yoshi's
 * S124 gates: bottom slide-up panel placement + header-per-entry
 * verse-anchor injection).
 *
 * Panel composition top-to-bottom:
 *   - Header: "Notes" title + ✕ close
 *   - Saved-entries body region (vertical scroll of entry blocks; each
 *     verse-anchored entry renders with a bold spectral-blue verse-
 *     reference header + body + separating <hr/>; free-form entries
 *     render body without a header). Auto-scrolls to bottom on open.
 *   - Pending-anchor strip (only when opened via Add-note path):
 *     "Adding to: {verseRef}" in spectral-blue accent
 *   - Input region: multi-line auto-expanding textarea (3-8 lines) +
 *     Save button, pinned to panel footer
 *
 * Same modal register as HighlightPicker / BookmarkSheet / RangeAction-
 * Picker — bg-black/40 backdrop, items-end on mobile (slide-up from
 * bottom), centered on desktop (sm:items-center). Taller than the
 * picker modals (max-h-[70vh]) since the notepad needs room. Wider
 * (max-w-2xl on desktop) since prose reading happens here.
 *
 * V1 is append-only — saved entries are read-only in the panel.
 * Edit/delete per-entry is the W8 ($1.99 Notes tier) per-verse hub
 * affordance. Free partners revisit an old entry by re-anchoring
 * the same verse (a new entry block commits with the same header).
 */

import { useEffect, useRef, useState } from "react";
import { appendNote, type NoteEntry } from "../lib/api";

interface NotesPanelProps {
  /** The partner's saved notes (chronological — oldest first). */
  notes: NoteEntry[];
  /**
   * Pending verse anchor — set by the parent when the panel was opened
   * via the Add-note menu path. Null when opened via the chrome Notes
   * button (free-form path).
   */
  pendingAnchor: PendingAnchor | null;
  /** Callback after a successful save — parent appends the new entry. */
  onSaved: (entry: NoteEntry) => void;
  /** Callback when the panel should close. */
  onClose: () => void;
}

export interface PendingAnchor {
  verseId: number;
  verseRef: string;
}

export default function NotesPanel({
  notes,
  pendingAnchor,
  onSaved,
  onClose,
}: NotesPanelProps) {
  const [draft, setDraft] = useState<string>("");
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const textareaRef = useRef<HTMLTextAreaElement | null>(null);
  const scrollRef = useRef<HTMLDivElement | null>(null);

  // Auto-expand textarea on draft change (3-8 line range).
  useEffect(() => {
    const el = textareaRef.current;
    if (!el) return;
    el.style.height = "auto";
    const lineHeight = 28;
    const minHeight = lineHeight * 3;
    const maxHeight = lineHeight * 8;
    el.style.height = `${Math.min(
      Math.max(el.scrollHeight, minHeight),
      maxHeight
    )}px`;
  }, [draft]);

  // Scroll to bottom on open / when notes change (a new entry from a
  // parallel device sync would push the bottom further down).
  useEffect(() => {
    const el = scrollRef.current;
    if (!el) return;
    el.scrollTop = el.scrollHeight;
  }, [notes.length]);

  // Focus the textarea on mount so the partner can start typing
  // immediately after Add-note (or after opening from chrome).
  useEffect(() => {
    textareaRef.current?.focus();
  }, []);

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

  // Header text for a saved entry's verse-anchored header. Server-
  // resolved at fetch/insert time via the LEFT JOIN against verses /
  // chapters / books — every entry with verse_id set carries a
  // verse_ref (e.g., "Hosea 1:10") regardless of which chapter the
  // partner is currently viewing. Free-form entries (verse_id NULL)
  // get verse_ref NULL and render without a header.
  const headerForEntry = (entry: NoteEntry): string | null => {
    if (entry.verse_ref) return entry.verse_ref;
    // Defensive fallback — verse_id present but verse_ref null
    // shouldn't happen in V1 (canon edition only), but if it does,
    // render the bare verse id so the entry isn't header-less.
    if (entry.verse_id !== null) return `Verse #${entry.verse_id}`;
    return null;
  };

  async function handleSave() {
    const text = draft.trim();
    if (!text) return;
    setSaving(true);
    setError(null);
    try {
      const saved = await appendNote({
        verse_id: pendingAnchor?.verseId ?? null,
        body: text,
      });
      onSaved(saved);
      setDraft("");
      setSaving(false);
      // Re-focus textarea so the partner can continue (multi-add UX).
      textareaRef.current?.focus();
    } catch (e) {
      setError(
        e instanceof Error ? e.message : "Couldn't save the note — try again."
      );
      setSaving(false);
    }
  }

  function handleTextareaKeyDown(e: React.KeyboardEvent<HTMLTextAreaElement>) {
    // Cmd/Ctrl+Enter saves — keyboard shortcut for partners who prefer
    // not to mouse over to the Save button.
    if ((e.metaKey || e.ctrlKey) && e.key === "Enter") {
      e.preventDefault();
      handleSave();
    }
  }

  return (
    <div
      className="fixed inset-0 z-40 flex items-end justify-center bg-black/40 p-0 sm:items-center sm:p-4"
      onClick={onClose}
      role="dialog"
      aria-label="Notes"
    >
      <div
        className="flex h-[70vh] w-full max-w-2xl flex-col overflow-hidden rounded-t-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-xl sm:max-h-[80vh] sm:rounded-lg"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header — "Notes" title + ✕ close. */}
        <div className="flex items-baseline justify-between border-b border-[var(--reader-rule)] px-4 py-3">
          <h2 className="text-lg font-semibold">Notes</h2>
          <button
            type="button"
            className="ml-2 text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
            onClick={onClose}
            aria-label="Close"
          >
            ✕
          </button>
        </div>

        {/* Saved-entries scroll region. */}
        <div ref={scrollRef} className="flex-1 overflow-y-auto px-4 py-3">
          {notes.length === 0 ? (
            <p className="py-8 text-center italic text-[var(--reader-muted)]">
              Tap any verse → Add note to start a thread here.
            </p>
          ) : (
            <ul className="space-y-4">
              {notes.map((entry, idx) => {
                const header = headerForEntry(entry);
                return (
                  <li key={entry.id}>
                    {idx > 0 && (
                      <hr className="mb-4 border-[var(--reader-rule)]" />
                    )}
                    {header && (
                      <h3
                        className="mb-1 text-base font-semibold"
                        style={{ color: "var(--reader-accent)" }}
                      >
                        {header}
                      </h3>
                    )}
                    <p className="whitespace-pre-wrap text-base leading-relaxed">
                      {entry.body}
                    </p>
                  </li>
                );
              })}
            </ul>
          )}
        </div>

        {/* Pending-anchor strip — only shown when opened via Add-note. */}
        {pendingAnchor && (
          <div
            className="border-t border-[var(--reader-rule)] bg-[var(--reader-bg)] px-4 py-2 text-sm"
            role="status"
            aria-live="polite"
          >
            <span className="text-[var(--reader-muted)]">Adding to: </span>
            <span
              className="font-semibold"
              style={{ color: "var(--reader-accent)" }}
            >
              {pendingAnchor.verseRef}
            </span>
          </div>
        )}

        {/* Inline error. */}
        {error && (
          <div className="border-t border-red-500/40 bg-red-500/10 px-4 py-2 text-sm text-red-300">
            {error}
          </div>
        )}

        {/* Input region — pinned to panel footer. */}
        <div className="border-t border-[var(--reader-rule)] p-3">
          <div className="flex items-end gap-2">
            <textarea
              ref={textareaRef}
              className="flex-1 resize-none rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] p-2 text-base leading-relaxed"
              placeholder="Add to your notes…"
              value={draft}
              onChange={(e) => setDraft(e.target.value)}
              onKeyDown={handleTextareaKeyDown}
              rows={3}
              aria-label="Note input"
            />
            <button
              type="button"
              className="rounded bg-[var(--reader-accent)] px-4 py-1.5 text-sm font-semibold text-[var(--reader-bg)] disabled:opacity-50"
              onClick={handleSave}
              disabled={saving || draft.trim() === ""}
            >
              {saving ? "Saving…" : "Save"}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
