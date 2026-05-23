/**
 * Range-selection mechanic (S123, Wheel 4 of the pre-launch sweep).
 *
 * Pure state machine + pure helpers for capturing a range of verses.
 * Three known consumers across the locked 14-wheel pre-launch sweep:
 *
 *   - W4 multi-verse highlight (this wheel — first consumer, ships
 *     here as the verification surface for the shared mechanic).
 *   - W7 multi-verse Copy (with watermark).
 *   - W7 range Share-with-watermark.
 *
 * The helper is fully general: the state shape supports cross-chapter
 * and cross-book selections (within a witness category — same boundary
 * rule as DESIGN_LANGUAGE.md §19 chapter navigation). W4 UX is
 * intentionally same-chapter only per the locked S123 scope, so the
 * same-chapter resolver is the only one shipped here. Cross-chapter
 * resolution lands as an async resolver function when W7 actually
 * needs it — the state shape and the comparator already accommodate it.
 *
 * Architecture per DESIGN_LANGUAGE.md §21:
 *
 *   - State machine: idle → selecting → captured → idle (commit / cancel).
 *   - One shared menu entry ("Start range here"), one capture flow, one
 *     branching action picker. The three known destinations all consume
 *     the same captured state.
 *   - Auto-normalize direction: if end comes before start, swap them
 *     silently. Partners get the range they meant; the helper does the
 *     reorder.
 *   - Range-of-one: start === end → captured 1-verse range. Treated
 *     identically to single-verse highlight at commit time.
 *   - Same-chapter only for W4 UX. Cross-chapter / cross-book covered by
 *     the helper's state shape + comparator for W7 inheritance.
 *
 * No React imports; no global state. Consumers hold the state in their
 * own component state and call these pure functions to advance the
 * machine. Component-agnostic — App.tsx (W4) and any W7 consumer share
 * exactly this surface.
 */

import type { Verse } from "./api";

export type RangeStatus = "idle" | "selecting" | "captured";

/**
 * Verse-reference for the range state. Carries everything needed to
 * resolve verse_ids across chapter / book boundaries (W7+) and to
 * format a display reference. Same-chapter case (W4) ignores bookSlug
 * and chapterNumber at resolve time but still tracks them for the
 * reference display and for the cross-chapter detection helpers.
 */
export interface RangeVerseRef {
  verseId: number;
  verseNumber: number;
  bookSlug: string;
  chapterNumber: number;
}

export interface RangeSelectionState {
  status: RangeStatus;
  start: RangeVerseRef | null;
  end: RangeVerseRef | null;
}

export const IDLE_STATE: RangeSelectionState = {
  status: "idle",
  start: null,
  end: null,
};

// ─────────────────────────────────────────────────────────────────────
// State transitions — pure functions that take state + inputs and
// return new state. No mutation; consumers swap state via React setState.
// ─────────────────────────────────────────────────────────────────────

/**
 * Begin selecting from an anchor verse. The state transitions from
 * idle (or any prior state) into selecting with the anchor pinned and
 * end cleared. Idempotent if called multiple times with the same anchor.
 */
export function startSelecting(start: RangeVerseRef): RangeSelectionState {
  return { status: "selecting", start, end: null };
}

/**
 * Commit an end verse to a selecting state. Auto-normalizes direction
 * so the returned captured state always has start positioned before end
 * across book → chapter → verse order — the partner taps two verses in
 * either order and gets the range they meant.
 *
 * Calling commitEnd on a non-selecting state (idle or already-captured)
 * is a no-op (returns the input state unchanged). The caller is expected
 * to ensure the state is in selecting before committing; this guard is
 * defensive against rapid double-taps or race conditions.
 *
 * Range-of-one: if the partner taps the same verse as the anchor
 * (end.verseId === start.verseId), the result is a captured 1-verse
 * range — treated identically to single-verse highlight at commit time
 * by downstream consumers.
 */
export function commitEnd(
  state: RangeSelectionState,
  end: RangeVerseRef
): RangeSelectionState {
  if (state.status !== "selecting" || state.start === null) {
    return state;
  }
  const [lo, hi] = orderRefs(state.start, end);
  return { status: "captured", start: lo, end: hi };
}

/**
 * Cancel back to idle. Caller may invoke from any state; the result is
 * always idle with both refs cleared. Used by the explicit Cancel
 * button, tap-outside, Escape key, and silent chapter-navigation
 * cancellation per §21.
 */
export function cancel(): RangeSelectionState {
  return IDLE_STATE;
}

// ─────────────────────────────────────────────────────────────────────
// Predicates — query the state without mutating.
// ─────────────────────────────────────────────────────────────────────

/**
 * True if the captured (or in-progress) range is reversed — i.e., the
 * end verse comes before the start in book → chapter → verse order.
 * Exposed for tests against the auto-normalize behavior. After
 * commitEnd, this should always be false; if it isn't, commitEnd has
 * a bug.
 */
export function isReversed(state: RangeSelectionState): boolean {
  if (state.start === null || state.end === null) return false;
  return compareRefs(state.start, state.end) > 0;
}

/**
 * True if the range's start and end are in the same chapter (and the
 * same book). For a 1-verse range (start === end), this is trivially
 * true. Used by the W4 same-chapter UX to validate end-verse taps and
 * by the resolver to take the same-chapter fast path.
 */
export function isSameChapter(state: RangeSelectionState): boolean {
  if (state.start === null || state.end === null) return false;
  return (
    state.start.bookSlug === state.end.bookSlug &&
    state.start.chapterNumber === state.end.chapterNumber
  );
}

/**
 * True if both endpoints are in the same book (regardless of chapter).
 * Used by W7's cross-chapter resolver when it lands — within-book
 * ranges only need a per-chapter verse-table walk; cross-book ranges
 * additionally need the witness_category canonical_order from §19.
 */
export function isSameBook(state: RangeSelectionState): boolean {
  if (state.start === null || state.end === null) return false;
  return state.start.bookSlug === state.end.bookSlug;
}

/**
 * Total verse count for a same-chapter captured range. Returns 0 for
 * non-captured states OR cross-chapter states (the helper can't know
 * the chapter sizes without verse data — use resolveSameChapterRange
 * for the verse-id list and inspect .length for cross-chapter when
 * W7's async resolver lands).
 */
export function sameChapterRangeSize(state: RangeSelectionState): number {
  if (state.status !== "captured" || state.start === null || state.end === null) {
    return 0;
  }
  if (!isSameChapter(state)) return 0;
  return state.end.verseNumber - state.start.verseNumber + 1;
}

// ─────────────────────────────────────────────────────────────────────
// Resolution — turn a captured state into the ordered verse_id list
// that consumers fire actions against.
// ─────────────────────────────────────────────────────────────────────

/**
 * Resolve a captured same-chapter range to its ordered verse_id list.
 * Takes the loaded chapter's verses (from ChapterDetail.verses) and
 * returns the subset whose verse_number falls within [start.verseNumber,
 * end.verseNumber] inclusive, in canonical (verse_number ascending)
 * order.
 *
 * Returns an empty array if:
 *   - state is not captured
 *   - state spans multiple chapters or books (cross-chapter resolution
 *     deferred to W7's injected async resolver)
 *   - chapterVerses is empty or doesn't contain any verses in the range
 *
 * The returned list is what downstream consumers iterate to fire
 * per-verse actions (W4: POST /v1/highlights per id; W7: POST a
 * batched share-with-watermark per id; etc.).
 */
export function resolveSameChapterRange(
  state: RangeSelectionState,
  chapterVerses: Pick<Verse, "id" | "verse_number">[]
): number[] {
  if (state.status !== "captured" || state.start === null || state.end === null) {
    return [];
  }
  if (!isSameChapter(state)) return [];
  const lo = state.start.verseNumber;
  const hi = state.end.verseNumber;
  const matched: Pick<Verse, "id" | "verse_number">[] = [];
  for (const v of chapterVerses) {
    if (v.verse_number >= lo && v.verse_number <= hi) {
      matched.push(v);
    }
  }
  // Sort by verse_number ascending so consumers always get canon order,
  // regardless of how chapterVerses was assembled upstream. (The seed
  // loads verses in verse_number order, so this is usually a no-op; the
  // sort is defensive against any upstream reordering.)
  matched.sort((a, b) => a.verse_number - b.verse_number);
  return matched.map((v) => v.id);
}

// ─────────────────────────────────────────────────────────────────────
// Ordering — the comparator + ordered-pair helper used internally and
// exposed for tests + future-consumer hooks.
// ─────────────────────────────────────────────────────────────────────

/**
 * Sort two verse-refs into [earlier, later] order. Exported for tests;
 * commitEnd uses this internally to auto-normalize direction.
 */
export function orderRefs(
  a: RangeVerseRef,
  b: RangeVerseRef
): [RangeVerseRef, RangeVerseRef] {
  return compareRefs(a, b) <= 0 ? [a, b] : [b, a];
}

/**
 * Compare two verse-refs in book → chapter → verse order. Returns
 * negative if a < b, positive if a > b, 0 if equivalent.
 *
 * For the same-chapter case (W4 scope), this collapses to verse_number
 * comparison. For cross-chapter within a single book, chapter_number
 * is the discriminator. For cross-book, bookSlug is compared
 * lexicographically — which is NOT canonical order across the canon.
 * W7's cross-book consumer is expected to wrap this with a
 * book-order-aware comparator that knows witness_category canonical_order
 * (per DESIGN_LANGUAGE.md §19); the W4 UX never exercises the
 * cross-book branch because the same-chapter constraint forbids it.
 *
 * Documented here so the future-consumer hook is visible.
 */
export function compareRefs(a: RangeVerseRef, b: RangeVerseRef): number {
  if (a.bookSlug !== b.bookSlug) {
    return a.bookSlug < b.bookSlug ? -1 : 1;
  }
  if (a.chapterNumber !== b.chapterNumber) {
    return a.chapterNumber - b.chapterNumber;
  }
  return a.verseNumber - b.verseNumber;
}
