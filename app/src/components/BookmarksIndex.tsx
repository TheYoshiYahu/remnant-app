/**
 * BookmarksIndex — Session 166, DESIGN_LANGUAGE.md §29 (Free tier).
 *
 * Bottom slide-up panel listing every bookmark the requesting partner has
 * across the canon, sorted newest-first. Opens from the chrome-header
 * `Bookmarks` button (left of Notes). Single-purpose surface: read +
 * navigate. Edit/delete live in the §22 per-verse BookmarkSheet that the
 * partner reaches by tapping a row → navigating to the verse → long-press
 * → menu → Bookmark.
 *
 * Per §29 Gate #2: same bordered-chrome modal family as NotesPanel —
 * bg-black/40 backdrop, items-end on mobile (slide-up from bottom),
 * centered on desktop (sm:items-center), max-w-6xl per S166 modal-family
 * bump, max-h-[70vh] mobile cap, body scrolls. Per Gate #3: chronological
 * newest-first list (groupBookmarksByBook + filters defer to v1.1+ per
 * §29's deliberate non-prescription block). Per Gate #4: navigate-on-tap;
 * no per-row edit chrome.
 */

import { useEffect, useState } from "react";
import {
  listBookmarksIndex,
  type BookmarkIndexEntry,
} from "../lib/api";
import {
  formatBookmarkRow,
  type BookmarkColorTint,
} from "../lib/bookmarks-helpers";

interface BookmarksIndexProps {
  /** Called when the partner taps a row — navigates to the verse and
   *  closes the panel. Wired in App.tsx to `jumpToVerseRef`. */
  onNavigate: (
    bookSlug: string,
    chapterNumber: number,
    verseNumber: number,
  ) => void;
  /** Called when the panel should close (tap-outside, ✕, Escape). */
  onClose: () => void;
}

// §6 13-color palette hex values — mirrors HIGHLIGHT_HEX in HighlightPicker.
// Inlined here to avoid a circular import and to keep the helper module
// pure (no React imports per the §29 helper-API contract).
const COLOR_HEX: Record<BookmarkColorTint, string> = {
  neon_yellow: "#FFEA00",
  crimson: "#DC143C",
  tangerine: "#FF8C00",
  honey: "#E6B800",
  sage: "#9CAF88",
  emerald: "#10B981",
  teal: "#14B8A6",
  sky_blue: "#0EA5E9",
  periwinkle: "#A5B4FC",
  lilac: "#C084FC",
  magenta: "#D946EF",
  rose: "#F472B6",
  parchment: "#E8D9B5",
};

export default function BookmarksIndex({
  onNavigate,
  onClose,
}: BookmarksIndexProps) {
  const [bookmarks, setBookmarks] = useState<BookmarkIndexEntry[] | null>(null);
  const [error, setError] = useState<string | null>(null);

  // Fetch on mount. The hook lives in the component so each open is a
  // fresh fetch — partners arrive at the top of the list (newest-first)
  // every time per §29 Gate #3 / *Persistence* in Defaultable surface.
  useEffect(() => {
    let cancelled = false;
    listBookmarksIndex()
      .then((res) => {
        if (!cancelled) setBookmarks(res.bookmarks);
      })
      .catch((e) => {
        if (!cancelled) {
          setError(
            e instanceof Error
              ? e.message
              : "Couldn't load bookmarks — try again.",
          );
        }
      });
    return () => {
      cancelled = true;
    };
  }, []);

  // Escape-to-close. ✕ button and tap-outside backdrop are the other two
  // close paths; this handles keyboard users per §13 / §29 accessibility.
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") onClose();
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  function handleRowTap(bm: BookmarkIndexEntry) {
    onNavigate(bm.book_slug, bm.chapter_number, bm.verse_number);
    onClose();
  }

  return (
    <div
      className="fixed inset-0 z-40 flex items-end justify-center bg-black/40 p-0 sm:items-center sm:p-4"
      onClick={onClose}
      role="dialog"
      aria-label="Your bookmarks"
    >
      <div
        className="flex h-[70vh] w-full max-w-6xl flex-col overflow-hidden rounded-t-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-xl sm:max-h-[80vh] sm:rounded-lg"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header — title + ✕ close. Same register as NotesPanel. */}
        <div className="flex items-baseline justify-between border-b border-[var(--reader-rule)] px-4 py-3">
          <h2 className="text-lg font-semibold">Bookmarks</h2>
          <button
            type="button"
            className="ml-2 text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
            onClick={onClose}
            aria-label="Close bookmarks index"
          >
            ✕
          </button>
        </div>

        {/* List scroll region. */}
        <div className="flex-1 overflow-y-auto px-4 py-3">
          {error ? (
            <p className="py-8 text-center text-sm text-red-600" role="status">
              {error}
            </p>
          ) : bookmarks === null ? (
            // Loading skeleton — three rows of shimmer.
            <ul className="space-y-4" aria-busy="true">
              {[0, 1, 2].map((i) => (
                <li
                  key={i}
                  className="animate-pulse rounded border border-[var(--reader-rule)] bg-[var(--reader-surface-elev)] p-3"
                >
                  <div className="mb-2 h-4 w-32 rounded bg-[var(--reader-rule)]" />
                  <div className="h-3 w-full rounded bg-[var(--reader-rule)]" />
                </li>
              ))}
            </ul>
          ) : bookmarks.length === 0 ? (
            <p
              className="py-8 text-center italic text-[var(--reader-muted)]"
              role="status"
            >
              Tap any verse → Bookmark to save it here.
            </p>
          ) : (
            <ul className="space-y-0">
              {bookmarks.map((bm, idx) => {
                const row = formatBookmarkRow(bm);
                const dotColor = row.colorTint
                  ? COLOR_HEX[row.colorTint]
                  : "var(--reader-accent)";
                return (
                  <li key={bm.id}>
                    {idx > 0 && (
                      <hr className="my-0 border-[var(--reader-rule)]" />
                    )}
                    <button
                      type="button"
                      onClick={() => handleRowTap(bm)}
                      aria-label={`Bookmark on ${row.refLine}: ${
                        row.shortDescription ?? "no description"
                      }`}
                      className="w-full px-1 py-3 text-left hover:bg-[var(--reader-surface-elev)] focus:bg-[var(--reader-surface-elev)] focus:outline-none"
                    >
                      <div
                        className="mb-1 text-base font-semibold"
                        style={{ color: "var(--reader-accent)" }}
                      >
                        {row.refLine}
                      </div>
                      <p className="mb-1 line-clamp-2 text-base italic text-[var(--reader-muted)]">
                        {row.preview}
                      </p>
                      {row.shortDescription && (
                        <p className="mb-1 line-clamp-3 text-base leading-relaxed">
                          {row.shortDescription}
                        </p>
                      )}
                      {row.tags.length > 0 && (
                        <div className="mb-1 flex flex-wrap gap-1">
                          {row.tags.map((t) => (
                            <span
                              key={t}
                              className="rounded-full border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-2 py-0.5 text-xs text-[var(--reader-muted)]"
                            >
                              {t}
                            </span>
                          ))}
                        </div>
                      )}
                      <div className="flex items-center justify-between text-xs text-[var(--reader-muted)]">
                        <span
                          aria-hidden="true"
                          className="inline-block h-2.5 w-2.5 rounded-full"
                          style={{ backgroundColor: dotColor }}
                        />
                        <span>
                          {row.savedDateDisplay}
                          {row.tagsCountDisplay
                            ? ` • ${row.tagsCountDisplay}`
                            : ""}
                        </span>
                      </div>
                    </button>
                  </li>
                );
              })}
            </ul>
          )}
        </div>
      </div>
    </div>
  );
}
