/**
 * Chapter navigation (S121, Wheel 2 of the pre-launch sweep).
 *
 * Pure helpers that compute the prev/next navigation target given the
 * loaded book list, the current selection, and the chapter list for
 * the current book. The actual fetching for "prev book's last chapter"
 * happens in the React handler in App.tsx because we don't pre-load
 * every book's chapter count.
 *
 * Architecture per DESIGN_LANGUAGE.md §19:
 *
 *   - Within a book: prev/next chapter is a simple decrement/increment.
 *   - At book boundary within the same witness_category: cross to the
 *     adjacent book (per canonical_order); chapter 1 forward, last
 *     chapter backward.
 *   - At witness_category edges (Genesis 1 prev, Revelation 22 next
 *     for canon; equivalent edges for other categories): bounce. The
 *     helper returns null, and the caller renders the disabled-arrow
 *     bounce affordance.
 *   - Stays WITHIN the current witness_category. Crossing from canon
 *     into apocrypha is a deliberate picker action, not a swipe.
 *
 * No verse-level reasoning here — the navigation handler in App.tsx
 * resets currentVerse to 1 on any nav action, mirroring the existing
 * picker handlers' S116 behavior.
 */

import type { BookSummary, BookChaptersResponse } from "./api";

/**
 * What "last chapter" looks like at the schema layer. The chapter
 * list response just exposes chapter_number, so the last chapter is
 * the max chapter_number in the list.
 */
export function lastChapterNumber(resp: BookChaptersResponse): number {
  if (!resp.chapters || resp.chapters.length === 0) return 1;
  let max = resp.chapters[0].chapter_number;
  for (const c of resp.chapters) {
    if (c.chapter_number > max) max = c.chapter_number;
  }
  return max;
}

/**
 * Find the books that share the witness_category with the given slug,
 * sorted by canonical_order ascending. Returns an empty array if the
 * slug isn't found in the input list.
 */
export function booksInSameCategory(
  books: BookSummary[],
  slug: string
): BookSummary[] {
  const current = books.find((b) => b.slug === slug);
  if (!current) return [];
  return books
    .filter((b) => b.witness_category === current.witness_category)
    .sort((a, b) => a.canonical_order - b.canonical_order);
}

/**
 * Index of the given slug within its same-category sorted list.
 * Returns -1 if not found.
 */
export function bookIndexInCategory(
  books: BookSummary[],
  slug: string
): number {
  const list = booksInSameCategory(books, slug);
  return list.findIndex((b) => b.slug === slug);
}

/**
 * Target shape returned by the nav helpers.
 *
 *   - `chapter: number` — the destination chapter number is known.
 *     Caller can set state immediately.
 *   - `chapter: "last"` — the destination book is set but the chapter
 *     count needs to be fetched. Caller does an async
 *     listChapters(target.bookSlug) first to learn the count, then
 *     sets state with the resolved last chapter number.
 */
export interface NavTarget {
  bookSlug: string;
  chapter: number | "last";
}

/**
 * Compute the next-chapter target.
 *
 *   - If currentChapter < last chapter of the current book → same book,
 *     chapter + 1.
 *   - If currentChapter === last chapter AND there's a next book in
 *     the same witness_category → next book, chapter 1.
 *   - Otherwise (at the category's last book's last chapter) → null
 *     (bounce).
 *
 * `currentChaptersResp` is the chapter list for the CURRENT book; we
 * use it to learn the current book's chapter count. The next book's
 * chapter 1 is always 1 so no second fetch is needed for forward
 * navigation.
 */
export function nextChapterTarget(
  books: BookSummary[],
  currentBookSlug: string,
  currentChapter: number,
  currentChaptersResp: BookChaptersResponse | null
): NavTarget | null {
  if (!currentChaptersResp) return null;
  const lastCh = lastChapterNumber(currentChaptersResp);

  if (currentChapter < lastCh) {
    return { bookSlug: currentBookSlug, chapter: currentChapter + 1 };
  }

  // At the last chapter of the current book — try to cross to the
  // next book in the same witness_category.
  const sameCat = booksInSameCategory(books, currentBookSlug);
  const idx = sameCat.findIndex((b) => b.slug === currentBookSlug);
  if (idx === -1) return null; // shouldn't happen if books loaded
  if (idx === sameCat.length - 1) return null; // bounce at category edge

  const nextBook = sameCat[idx + 1];
  return { bookSlug: nextBook.slug, chapter: 1 };
}

/**
 * Compute the prev-chapter target.
 *
 *   - If currentChapter > 1 → same book, chapter - 1.
 *   - If currentChapter === 1 AND there's a prev book in the same
 *     witness_category → prev book, "last" (caller resolves the
 *     actual chapter number via listChapters).
 *   - Otherwise (at the category's first book's chapter 1) → null
 *     (bounce).
 */
export function prevChapterTarget(
  books: BookSummary[],
  currentBookSlug: string,
  currentChapter: number
): NavTarget | null {
  if (currentChapter > 1) {
    return { bookSlug: currentBookSlug, chapter: currentChapter - 1 };
  }

  // At chapter 1 — try to cross back to the previous book in the same
  // witness_category.
  const sameCat = booksInSameCategory(books, currentBookSlug);
  const idx = sameCat.findIndex((b) => b.slug === currentBookSlug);
  if (idx === -1) return null;
  if (idx === 0) return null; // bounce at category edge

  const prevBook = sameCat[idx - 1];
  return { bookSlug: prevBook.slug, chapter: "last" };
}

/**
 * Resolve the display label for a navigation target (used by the
 * bottom-of-chapter continuation row: "← Genesis 1" / "Genesis 3 →").
 *
 * For same-book targets, returns the current book's title + chapter
 * number. For cross-book targets going forward (chapter: 1), returns
 * the next book's title + " 1". For cross-book targets going backward
 * (chapter: "last"), we don't yet know the last chapter number until
 * the prev-book chapters list is fetched, so we return just the book
 * title (the chapter number resolves after the fetch and re-render).
 */
export function targetLabel(
  books: BookSummary[],
  target: NavTarget
): string {
  const book = books.find((b) => b.slug === target.bookSlug);
  const title = book?.title ?? target.bookSlug;
  if (target.chapter === "last") return title;
  return `${title} ${target.chapter}`;
}
