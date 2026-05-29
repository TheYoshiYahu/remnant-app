/**
 * §29 — BookmarksIndex helpers.
 *
 * Five pure helpers per DESIGN_LANGUAGE.md §29 "Helper API + sanity-test
 * surface". No React imports, no global state, no async. Each function is
 * independently sanity-testable via the JS port in
 * `_s166_bookmarks_index_sanity.mjs` (≥25 cases per the §29 verification
 * target).
 *
 * The BookmarksIndex React component consumes these via the
 * `useBookmarksIndex()` hook which calls `GET /v1/bookmarks/index` and
 * caches the response. Each row is fed through `formatBookmarkRow` for
 * render; `formatSavedDateDisplay` handles the timestamp. `groupBookmarksByBook`
 * is reserved for the v1.1+ group-by-book toggle (not wired into V1 render
 * but ships ready for the next-wheel surface).
 */

// ─────────────────────────────────────────────────────────────────────
// Types
// ─────────────────────────────────────────────────────────────────────

export type BookmarkColorTint =
  | "neon_yellow"
  | "crimson"
  | "tangerine"
  | "honey"
  | "sage"
  | "emerald"
  | "teal"
  | "sky_blue"
  | "periwinkle"
  | "lilac"
  | "magenta"
  | "rose"
  | "parchment";

export interface BookmarkIndexEntry {
  id: string;
  verse_id: number;
  book_slug: string;
  book_title: string;
  chapter_number: number;
  verse_number: number;
  verse_text: string;
  short_description: string | null;
  tags: string[] | null;
  color_tint: BookmarkColorTint | null;
  created_at: string;
  updated_at: string;
}

export interface BookmarkRowDisplay {
  refLine: string;
  preview: string;
  shortDescription: string | null;
  tags: string[];
  colorTint: BookmarkColorTint | null;
  savedDateDisplay: string;
  tagsCountDisplay: string | null;
}

// ─────────────────────────────────────────────────────────────────────
// formatSavedDateDisplay
// ─────────────────────────────────────────────────────────────────────

/**
 * Format an ISO timestamp from `created_at` to the partner-facing
 * "Saved {Month Day, Year}" display string. Defensive against null /
 * undefined / unparseable inputs — returns empty string when the date
 * can't be resolved so the row renders with no saved-date footer
 * rather than crashing.
 */
export function formatSavedDateDisplay(
  isoDate: string | null | undefined,
  locale: string = "en-US",
): string {
  if (!isoDate) return "";
  const d = new Date(isoDate);
  if (Number.isNaN(d.getTime())) return "";
  const formatted = d.toLocaleDateString(locale, {
    year: "numeric",
    month: "short",
    day: "numeric",
  });
  return `Saved ${formatted}`;
}

// ─────────────────────────────────────────────────────────────────────
// truncateVersePreview
// ─────────────────────────────────────────────────────────────────────

/**
 * Truncate verse text to a max character count, breaking at word
 * boundaries with an ellipsis. CSS `line-clamp-2` handles the visual
 * truncation in the BookmarksIndex row render; this helper is the
 * defensive secondary for screen-reader contexts where line-clamp
 * doesn't apply.
 */
export function truncateVersePreview(
  text: string | null | undefined,
  maxChars: number = 180,
): string {
  if (!text) return "";
  if (text.length <= maxChars) return text;
  const slice = text.slice(0, maxChars);
  const lastSpace = slice.lastIndexOf(" ");
  // Break at last word boundary if it's not too far back; otherwise hard-cut.
  if (lastSpace > maxChars * 0.6) {
    return slice.slice(0, lastSpace) + "…";
  }
  return slice + "…";
}

// ─────────────────────────────────────────────────────────────────────
// formatBookmarkRow
// ─────────────────────────────────────────────────────────────────────

/**
 * Given a BookmarkIndexEntry, return the render-ready row structure.
 * Pulls together the reference line, the truncated preview, the
 * optional short_description, the tag chips (always an array — null
 * tags from the API normalize to []), the color tint enum, the
 * saved-date display, and the optional tags-count display string.
 */
export function formatBookmarkRow(
  bookmark: BookmarkIndexEntry,
): BookmarkRowDisplay {
  const refLine = `${bookmark.book_title} ${bookmark.chapter_number}:${bookmark.verse_number}`;
  const preview = truncateVersePreview(bookmark.verse_text);
  const tags = bookmark.tags ?? [];
  const tagsCountDisplay = tags.length > 0
    ? `${tags.length} tag${tags.length === 1 ? "" : "s"}`
    : null;

  return {
    refLine,
    preview,
    shortDescription: bookmark.short_description,
    tags,
    colorTint: bookmark.color_tint,
    savedDateDisplay: formatSavedDateDisplay(bookmark.created_at),
    tagsCountDisplay,
  };
}

// ─────────────────────────────────────────────────────────────────────
// compareBookmarksByDate
// ─────────────────────────────────────────────────────────────────────

/**
 * Comparator for sorting by `created_at` descending (newest first).
 * Null timestamps sort to the end (treated as oldest); equal
 * timestamps preserve insertion order. Used at API-response cache
 * sort to defend against any out-of-order rows the backend might
 * emit (the endpoint sorts server-side, but the cache may re-merge
 * optimistic-add rows that don't yet have a server timestamp).
 */
export function compareBookmarksByDate(
  a: BookmarkIndexEntry,
  b: BookmarkIndexEntry,
): number {
  const at = a.created_at ? Date.parse(a.created_at) : -Infinity;
  const bt = b.created_at ? Date.parse(b.created_at) : -Infinity;
  if (Number.isNaN(at) && Number.isNaN(bt)) return 0;
  if (Number.isNaN(at)) return 1;
  if (Number.isNaN(bt)) return -1;
  return bt - at; // descending
}

// ─────────────────────────────────────────────────────────────────────
// groupBookmarksByBook
// ─────────────────────────────────────────────────────────────────────

/**
 * Group bookmarks by `book_slug`, preserving the input array order
 * (which the API returns in canonical-order when the v1.1+ group-by-book
 * toggle is on). Reserved for the v1.1+ group-by-book toggle UI per
 * §29's Gate #3; ships at V1 unused so the next-wheel surface lands
 * with zero schema or helper churn.
 *
 * Returns a Map keyed by book_slug. Iteration order matches first-
 * encountered order in the input — when the API sorts by canonical
 * book order, the Map iterates Genesis → Revelation. When sorted by
 * created_at (the V1 default), the Map iterates by the order each
 * book first appeared in the input, which is partner-perceptibly
 * arbitrary; the V1 surface doesn't use this helper, so that's fine.
 */
export function groupBookmarksByBook(
  bookmarks: BookmarkIndexEntry[],
): Map<string, BookmarkIndexEntry[]> {
  const grouped = new Map<string, BookmarkIndexEntry[]>();
  for (const bm of bookmarks) {
    const slug = bm.book_slug;
    if (!grouped.has(slug)) {
      grouped.set(slug, []);
    }
    grouped.get(slug)!.push(bm);
  }
  return grouped;
}
