/**
 * Pure helpers for the W6 Search V1 UI per DESIGN_LANGUAGE.md §23
 * (locked S125, Wheel 6 of the pre-launch sweep).
 *
 * No React imports, no async, no globals. The SearchModal feeds typed
 * shapes through these helpers; node sanity tests at
 * /Users/mtm/Desktop/App/_s125_search_sanity.mjs use inlined copies of
 * the same functions per the S121 W2 / W3 / S122 / S123 forward
 * standard (pure helpers + sanity tests on every wheel that surfaces
 * non-trivial pure logic).
 *
 * Five user-facing helpers:
 *
 *   groupResultsByBook   — flat hits → ordered [{bookSlug, bookTitle, hits[]}]
 *                          preserving first-occurrence order per gate (b).
 *   highlightQueryMatches — verse text + query → render segments for
 *                           <mark>-style emphasis on matched substrings.
 *   isResultLocked       — hit + partner tier → locked? (drives the
 *                          gate-(c) snippet swap).
 *   tierBadgeLabel       — content_tier value → 'Notes' | 'Library' | null
 *                          (Notes for $1.99, Library for $4.99; higher
 *                          tiers stay invisible per the S118 product-
 *                          surface decision).
 *   formatHitCount       — group size → '1 hit' | 'N hits'.
 *   formatTotalSummary   — groups → 'N hits across M books' footer text.
 */

import type { PartnerTier, VerseSearchHit } from "./api";

// ----- Types --------------------------------------------------------------

export interface BookGroup {
  bookSlug: string;
  bookTitle: string;
  hits: VerseSearchHit[];
}

export type Segment =
  | { type: "plain"; text: string }
  | { type: "match"; text: string };

// Mirror of the api/models.py content_tier enum. The book tier_required
// strings on the response use these values verbatim.
export type ContentTier =
  | "free"
  | "study_notes"
  | "extras"
  | "complete_study"
  | "everything";

// ----- groupResultsByBook -------------------------------------------------

/**
 * Group a flat array of hits by source book, preserving the first-
 * occurrence order of each book (which mirrors the server-side
 * similarity-first ordering: the strongest-matching book appears
 * first, and within each book the hits stay in the server's order —
 * the client does NOT re-sort).
 *
 * Empty input → empty output. Duplicate hits (same verse_id twice) are
 * preserved as the server returned them; deduplication is not the
 * client's job at V1.
 */
export function groupResultsByBook(hits: VerseSearchHit[]): BookGroup[] {
  const groups: BookGroup[] = [];
  const indexBySlug = new Map<string, number>();
  for (const hit of hits) {
    const existingIdx = indexBySlug.get(hit.book_slug);
    if (existingIdx === undefined) {
      indexBySlug.set(hit.book_slug, groups.length);
      groups.push({
        bookSlug: hit.book_slug,
        bookTitle: hit.book_title,
        hits: [hit],
      });
    } else {
      groups[existingIdx].hits.push(hit);
    }
  }
  return groups;
}

// ----- highlightQueryMatches ---------------------------------------------

/**
 * Split a verse snippet into plain + match segments for <mark>-style
 * rendering. Multi-token queries (whitespace-separated) match each
 * token independently — covers the trigram-similarity case where the
 * endpoint returned a hit but the literal phrase isn't contiguous in
 * the verse. Case-insensitive.
 *
 * Empty query (or whitespace-only) → single plain segment wrapping the
 * full text. No matches found → same.
 *
 * Overlapping tokens (e.g. "the the") are deduplicated so the matcher
 * doesn't double-mark or infinite-loop.
 */
export function highlightQueryMatches(text: string, query: string): Segment[] {
  if (!text) return [];
  const tokens = Array.from(
    new Set(
      query
        .toLowerCase()
        .split(/\s+/)
        .filter((t) => t.length > 0),
    ),
  );
  if (tokens.length === 0) {
    return [{ type: "plain", text }];
  }

  // Walk the text, at each position pick the longest matching token (if
  // any) so overlapping tokens don't fragment the output.
  const lower = text.toLowerCase();
  const segments: Segment[] = [];
  let cursor = 0;
  let plainStart = 0;
  while (cursor < text.length) {
    let matchedLen = 0;
    for (const token of tokens) {
      if (token.length > matchedLen && lower.startsWith(token, cursor)) {
        matchedLen = token.length;
      }
    }
    if (matchedLen > 0) {
      if (cursor > plainStart) {
        segments.push({ type: "plain", text: text.slice(plainStart, cursor) });
      }
      segments.push({
        type: "match",
        text: text.slice(cursor, cursor + matchedLen),
      });
      cursor += matchedLen;
      plainStart = cursor;
    } else {
      cursor += 1;
    }
  }
  if (plainStart < text.length) {
    segments.push({ type: "plain", text: text.slice(plainStart) });
  }
  return segments;
}

// ----- isResultLocked + tierBadgeLabel -----------------------------------

const TIER_LADDER: ContentTier[] = [
  "free",
  "study_notes",
  "extras",
  "complete_study",
  "everything",
];

function tierRank(tier: ContentTier | PartnerTier | null): number {
  if (!tier) return 0; // anonymous = free
  const idx = TIER_LADDER.indexOf(tier as ContentTier);
  return idx === -1 ? 0 : idx;
}

/**
 * Does this hit's source book sit above the partner's current tier?
 *
 * Anonymous partners (`partnerTier === null`) are treated as free. A
 * book whose `tier_required` is at or below the partner's tier renders
 * as a normal snippet row; above → the gate-(c) tier-aware snippet
 * card swap fires.
 */
export function isResultLocked(
  hit: Pick<VerseSearchHit, "tier_required">,
  partnerTier: PartnerTier | null,
): boolean {
  const hitTier = hit.tier_required as ContentTier;
  return tierRank(hitTier) > tierRank(partnerTier);
}

/**
 * Map a content_tier value to the partner-facing tier badge label. Per
 * §23 the tier name register matches §20 — Notes for $1.99 content,
 * Library for $4.99 content. Higher tiers ($9.99 / $14.99) stay
 * invisible per the S118 product-surface decision until those tiers
 * are scoped. 'free' returns null (no badge shown — those rows aren't
 * locked).
 */
export function tierBadgeLabel(
  tierRequired: string,
): "Notes" | "Library" | null {
  if (tierRequired === "study_notes") return "Notes";
  if (tierRequired === "extras") return "Library";
  return null;
}

// ----- formatHitCount + formatTotalSummary -------------------------------

export function formatHitCount(group: Pick<BookGroup, "hits">): string {
  const n = group.hits.length;
  return n === 1 ? "1 hit" : `${n} hits`;
}

export function formatTotalSummary(groups: BookGroup[]): string {
  const hitCount = groups.reduce((acc, g) => acc + g.hits.length, 0);
  const bookCount = groups.length;
  const hitWord = hitCount === 1 ? "hit" : "hits";
  const bookWord = bookCount === 1 ? "book" : "books";
  return `${hitCount} ${hitWord} across ${bookCount} ${bookWord}`;
}
