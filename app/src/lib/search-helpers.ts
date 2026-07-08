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
 *   tierBadgeLabel       — content_tier value → 'Study Notes' | 'Library' | null
 *                          (Study Notes for study_notes content, Library
 *                          for extras content; higher tiers stay invisible
 *                          per the S118 product-surface decision). S140
 *                          confirmed display labels: Study Notes / Library
 *                          / Companion / Scribe.
 *   formatHitCount       — group size → '1 hit' | 'N hits'.
 *   formatTotalSummary   — groups → 'N hits across M books' footer text.
 *   teaserOfVerse        — verse text + query → ~25-word teaser centered
 *                          on the match so the free reader actually sees
 *                          what matched in a tier-locked result.
 *                          Powers the S140 free-tier cross-edition search
 *                          funnel — a free reader who searches "Watchers"
 *                          sees canon hits open AND a teaser of every
 *                          1 Enoch / Jubilees hit with the matched word
 *                          visible and the Library-tier chip inline.
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
 * S352 — is this hit an EXTRA-CANONICAL row?
 *
 * The result-gating model changed at S352: search is free for everyone
 * and every hit (canon AND extra-canon) is shown, but extra-canonical
 * rows are only *clickable* for partners in trial or at the Companion
 * tier. "Extra-canonical" = the source book sits at or above the
 * `extras` (Library) tier on the content ladder; canon books are `free`
 * or `study_notes` and stay clickable for everyone.
 */
export function isExtraCanonical(
  hit: Pick<VerseSearchHit, "tier_required">,
): boolean {
  return tierRank(hit.tier_required as ContentTier) >= tierRank("extras");
}

/**
 * S352 — should this hit's row be LOCKED (rendered but not clickable)?
 *
 * Canon rows are never locked. Extra-canonical rows are locked unless
 * `canOpenExtraCanon` is true (the partner is in trial or at the
 * Companion tier — resolved by the caller). Tapping a locked row shows
 * the no-link "start a trial or partner to open" prompt inline; there
 * is NO checkout link (web-first commerce lives on the site, and native
 * reader apps carry no purchase steering).
 */
export function isExtraCanonLocked(
  hit: Pick<VerseSearchHit, "tier_required">,
  canOpenExtraCanon: boolean,
): boolean {
  return isExtraCanonical(hit) && !canOpenExtraCanon;
}

/**
 * Map a content_tier value to the partner-facing tier badge label. Per
 * §23 the tier name register matches §20 — Study Notes for study_notes
 * content, Library for extras content. Higher tiers (Companion / Scribe)
 * stay invisible per the S118 product-surface decision until those tiers
 * are scoped. 'free' returns null (no badge shown — those rows aren't
 * locked). S140 confirmed display labels: Study Notes / Library /
 * Companion / Scribe.
 */
export function tierBadgeLabel(
  tierRequired: string,
): "Study Notes" | "Library" | null {
  if (tierRequired === "study_notes") return "Study Notes";
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

// ----- teaserOfVerse ------------------------------------------------------
//
// Given a verse text and the search query, return a ~25-word teaser
// centered on the first occurrence of the query (case-insensitive). If
// the match falls within the first 25 words, the teaser is the first
// 25 words with a trailing "…". If the match is deeper into the verse,
// the teaser pulls ~10 words before + the match + ~14 words after, with
// a leading "…" to signal the cut. If no match is found (defensive
// fallback — shouldn't happen since this only runs on hits), the teaser
// is the first 25 words with a trailing "…". Used for tier-locked
// search-result rendering so the free reader sees what their search
// matched in a paid-tier edition.

const TEASER_WORD_TARGET = 25;
const TEASER_WORDS_BEFORE = 10;

export function teaserOfVerse(verseText: string, query: string): string {
  const words = verseText.split(/\s+/);
  if (words.length <= TEASER_WORD_TARGET) return verseText;

  const trimmedQuery = (query || "").trim();
  if (!trimmedQuery) {
    return words.slice(0, TEASER_WORD_TARGET).join(" ") + "…";
  }

  const lowerText = verseText.toLowerCase();
  const lowerQuery = trimmedQuery.toLowerCase();
  const matchCharIdx = lowerText.indexOf(lowerQuery);
  if (matchCharIdx === -1) {
    return words.slice(0, TEASER_WORD_TARGET).join(" ") + "…";
  }

  // Find which word index the match falls inside.
  let charCursor = 0;
  let matchWordIdx = 0;
  for (let i = 0; i < words.length; i++) {
    const wordEnd = charCursor + words[i].length;
    if (matchCharIdx <= wordEnd) {
      matchWordIdx = i;
      break;
    }
    charCursor = wordEnd + 1; // +1 for the whitespace
  }

  if (matchWordIdx < TEASER_WORD_TARGET) {
    return words.slice(0, TEASER_WORD_TARGET).join(" ") + "…";
  }

  const start = Math.max(0, matchWordIdx - TEASER_WORDS_BEFORE);
  const end = Math.min(words.length, start + TEASER_WORD_TARGET);
  const leading = start > 0 ? "…" : "";
  const trailing = end < words.length ? "…" : "";
  return leading + words.slice(start, end).join(" ") + trailing;
}
