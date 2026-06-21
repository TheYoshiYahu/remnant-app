/**
 * reading-plan/pacing.ts — the "Read the Scriptures in a Year" pacing layer
 * (roadmap minion B-1, see NEXT_SESSION_HUB_DEVOTIONALS_YEARPLAN_ROADMAP.md
 * Part B).
 *
 * The chronological-reading.json file is an ORDER, not a SCHEDULE. This
 * module turns that order into a fixed 365-day plan by chunking the active
 * sequence into exactly 365 day-buckets, scope-aware:
 *
 *   - scope "canon" → canon rows only (~1,189 chapters, ~3-4/day)
 *   - scope "all"   → canon + woven extras (~1,963 chapters, ~5-6/day)
 *
 * (Counts are read live from the JSON; see `sequenceForScope` / the test.)
 *
 * Remainder chapters are spread across the EARLY buckets so bucket sizes
 * differ by at most 1 — there is no giant final day. Concretely, with
 * `total` rows over 365 days, the first `total % 365` buckets get
 * `ceil(total/365)` rows and the rest get `floor(total/365)`.
 *
 * Scope matches ArrangedReading.tsx's canon/extras toggle so the two stay
 * compatible (that component filters `source === "canon"` for canon-only;
 * "all" is the full entries array, extras woven in). We do NOT modify that
 * component — we read the same JSON the same way.
 *
 * Pure + deterministic: no React, no DOM, no Date.now side effects beyond
 * what the caller passes in.
 */

import chronologicalPlan from "../../data/chronological-reading.json";

// ---------------------------------------------------------------------------
// Domain
// ---------------------------------------------------------------------------

/** A single chapter row from chronological-reading.json. */
export interface PlanEntry {
  seq: number;
  era: string;
  edition_id: string;
  book_id: string;
  book_title: string;
  chapter: number;
  source: "canon" | "extra";
}

/** Which slice of the library the plan paces over. */
export type PlanScope = "canon" | "all";

/** The trimmed row we expose per day (the full PlanEntry is also fine, but
 *  this is the documented minimal shape B-2/B-3 can rely on). */
export interface DayReadingItem {
  seq: number;
  book_id: string;
  book_title: string;
  chapter: number;
  source: "canon" | "extra";
}

/** Number of day-buckets the year plan always produces. */
export const DAYS_IN_PLAN = 365;

const ENTRIES = (chronologicalPlan as { entries: PlanEntry[] }).entries;

// ---------------------------------------------------------------------------
// Sequence selection
// ---------------------------------------------------------------------------

/**
 * The active ordered sequence for a scope. Mirrors ArrangedReading.tsx:
 *   - "canon" → rows where source === "canon"
 *   - "all"   → every row (extras woven into the order)
 * The JSON is already in seq order; we keep it as-is.
 */
export function sequenceForScope(scope: PlanScope): PlanEntry[] {
  if (scope === "all") return ENTRIES;
  return ENTRIES.filter((e) => e.source === "canon");
}

function toItem(e: PlanEntry): DayReadingItem {
  return {
    seq: e.seq,
    book_id: e.book_id,
    book_title: e.book_title,
    chapter: e.chapter,
    source: e.source,
  };
}

// ---------------------------------------------------------------------------
// Chunking
// ---------------------------------------------------------------------------

/**
 * Chunk an arbitrary ordered list into exactly `buckets` groups whose sizes
 * differ by at most 1, with the larger buckets coming first (remainder
 * front-loaded). Order within and across buckets is preserved.
 *
 * Exported (and pure) so the standalone sanity test can import/re-use the
 * exact same algorithm against the raw JSON.
 */
export function chunkEvenly<T>(items: T[], buckets: number): T[][] {
  if (buckets <= 0) return [];
  const total = items.length;
  const base = Math.floor(total / buckets); // floor size every bucket gets
  const remainder = total % buckets; // this many early buckets get +1

  const out: T[][] = [];
  let cursor = 0;
  for (let i = 0; i < buckets; i += 1) {
    const size = base + (i < remainder ? 1 : 0);
    out.push(items.slice(cursor, cursor + size));
    cursor += size;
  }
  return out;
}

/**
 * Build the full year plan for a scope: exactly DAYS_IN_PLAN buckets, each an
 * ordered list of the day's reading items. Buckets early in the year may hold
 * one more chapter than later buckets (remainder front-loaded); no bucket is
 * ever more than 1 larger than another.
 */
export function buildYearPlan(scope: PlanScope): DayReadingItem[][] {
  const seq = sequenceForScope(scope);
  return chunkEvenly(seq, DAYS_IN_PLAN).map((bucket) => bucket.map(toItem));
}

// ---------------------------------------------------------------------------
// Day-N math
// ---------------------------------------------------------------------------

/**
 * Compute which plan day "today" falls on, given the plan's start date.
 *
 * CONVENTION (B-2/B-3 take note): Day N is **1-indexed**. The start date is
 * Day 1 (the reader's first day). N = (whole days elapsed since start) + 1.
 * The result is CLAMPED to [1, DAYS_IN_PLAN]:
 *   - before the start date → 1 (don't run the plan "negative")
 *   - on/after day 365      → 365 (the plan caps; it does not wrap or loop)
 *
 * Dates are compared by CIVIL DAY (local midnight), so partial days and
 * time-of-day never shift the count — only the calendar date matters. Pass
 * Date objects; the local Y/M/D is what's used.
 *
 * To index into buildYearPlan()'s array, use `dayNumber - 1`.
 */
export function dayNumberFor(startDate: Date, today: Date): number {
  const startMid = civilMidnight(startDate);
  const todayMid = civilMidnight(today);
  const msPerDay = 24 * 60 * 60 * 1000;
  const elapsedDays = Math.round((todayMid - startMid) / msPerDay);
  const n = elapsedDays + 1; // start date is Day 1
  if (n < 1) return 1;
  if (n > DAYS_IN_PLAN) return DAYS_IN_PLAN;
  return n;
}

/** Local civil midnight (ms) for a date — strips time-of-day so day math is
 *  calendar-stable regardless of tz/hour. */
function civilMidnight(d: Date): number {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate()).getTime();
}

/**
 * Convenience: the reading items for a given plan + day number (1-indexed).
 * Returns [] for out-of-range day numbers (defensive; dayNumberFor already
 * clamps, but a caller could pass an arbitrary N).
 */
export function readingForDay(
  plan: DayReadingItem[][],
  dayNumber: number,
): DayReadingItem[] {
  const idx = dayNumber - 1;
  if (idx < 0 || idx >= plan.length) return [];
  return plan[idx];
}
