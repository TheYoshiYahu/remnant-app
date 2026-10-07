/**
 * reading-plan/paced.ts — "Read at your own pace" (S442, YEAR_PLAN_STUDY_SPEC.md
 * step 2). Partner feature.
 *
 * The chronological ORDER never changes; this module only decides how the
 * chapters still ahead of the reader are spread over the days ahead.
 * `position` (the seq of the last chapter read) is the single source of truth
 * for where the reader is.
 *
 * Three pace modes:
 *   - byDate  — spread what's left evenly from today to a finish date
 *               (default: plan start + 364 days, i.e. a year).
 *   - perDay  — a fixed number of chapters a day; the finish date falls out.
 *   - weekly  — a chapter goal for any week (e.g. 10 this week, 1 next week);
 *               weeks without a goal share the rest evenly toward the finish
 *               date. If the goals would run past the end of the plan, the
 *               last week just takes what's left; if they leave chapters over
 *               with no un-goaled days before the finish date, the plan runs
 *               on past it at the plan's average pace.
 *
 * "Today" is anchored: the split is computed from the position the reader had
 * at the START of today (`anchorPosition`), so reading today's portion — or
 * reading ahead — never re-shuffles today's list under them. Tomorrow simply
 * re-spreads from wherever they got to. Nobody is "behind" or "ahead".
 *
 * Pure + deterministic: no React, no DOM, no JSON import (the caller passes
 * the ordered sequence), so the test can run under bare Node.
 */

/** A chapter in the reading order (same shape as pacing.ts DayReadingItem). */
export interface PacedItem {
  seq: number;
  book_id: string;
  book_title: string;
  chapter: number;
  source: "canon" | "extra";
}

export type PaceMode = "byDate" | "perDay" | "weekly";

export interface PaceSettings {
  mode: PaceMode;
  /** byDate / weekly: civil "YYYY-MM-DD" finish date. Default start + 364. */
  endDateISO?: string;
  /** perDay: chapters a day (>= 1). */
  perDay?: number;
  /** weekly: plan-week start "YYYY-MM-DD" → chapter goal for that week (>= 1). */
  weeklyGoals?: Record<string, number>;
}

export interface PacedDay {
  dateISO: string;
  /** 1-indexed day since the plan began (not capped at 365). */
  dayNumber: number;
  /** Start date of the plan week this day falls in (weeks run from the start date). */
  weekStartISO: string;
  /** 1-indexed plan week. */
  weekNumber: number;
  items: PacedItem[];
}

export interface PacedPlan {
  /** Today onward, only days that carry reading. */
  days: PacedDay[];
  /** Chapters still ahead as of the start of today. */
  remaining: number;
  /** Last day with reading (null when everything is read). */
  finishDateISO: string | null;
  /** The finish date the pace is aiming at (byDate/weekly), or the computed one (perDay). */
  targetDateISO: string;
  /** remaining / days-with-reading, for the plain-words consequence line. */
  avgPerDay: number;
}

export const DEFAULT_PLAN_LENGTH_DAYS = 365;

// ---------------------------------------------------------------------------
// Civil-date helpers (local, string based — no time-of-day drift)
// ---------------------------------------------------------------------------

const ISO_RE = /^\d{4}-\d{2}-\d{2}$/;

export function isISODate(s: unknown): s is string {
  return typeof s === "string" && ISO_RE.test(s);
}

function toDate(iso: string): Date {
  const [y, m, d] = iso.split("-").map(Number);
  return new Date(y, m - 1, d);
}

function toISO(d: Date): string {
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}-${String(d.getDate()).padStart(2, "0")}`;
}

export function addDaysISO(iso: string, n: number): string {
  const d = toDate(iso);
  return toISO(new Date(d.getFullYear(), d.getMonth(), d.getDate() + n));
}

/** Whole civil days from a to b (b - a). */
export function diffDaysISO(a: string, b: string): number {
  return Math.round((toDate(b).getTime() - toDate(a).getTime()) / 86400000);
}

/** Start date of the plan week containing `iso` (weeks run from the plan start). */
export function weekStartFor(startISO: string, iso: string): string {
  const d = Math.max(0, diffDaysISO(startISO, iso));
  return addDaysISO(startISO, Math.floor(d / 7) * 7);
}

export function defaultEndDateISO(startISO: string): string {
  return addDaysISO(startISO, DEFAULT_PLAN_LENGTH_DAYS - 1);
}

/** Sizes for splitting `total` into `buckets` counts differing by at most 1 (larger first). */
export function evenCounts(total: number, buckets: number): number[] {
  if (buckets <= 0) return [];
  const base = Math.floor(total / buckets);
  const rem = total % buckets;
  return Array.from({ length: buckets }, (_, i) => base + (i < rem ? 1 : 0));
}

// ---------------------------------------------------------------------------
// The engine
// ---------------------------------------------------------------------------

export interface PacePlanInput {
  /** The whole ordered sequence for the plan's scope (ascending seq). */
  sequence: PacedItem[];
  /** Plan Day 1. */
  startISO: string;
  /** Today. */
  todayISO: string;
  /** Position (last chapter read) at the start of today. */
  anchorPosition: number;
  /** Position at the start of the current plan week (weekly mode's goal count). */
  weekAnchorPosition?: number;
  pace: PaceSettings;
}

export function pacePlan(input: PacePlanInput): PacedPlan {
  const { sequence, startISO, pace } = input;
  const todayISO =
    diffDaysISO(startISO, input.todayISO) < 0 ? startISO : input.todayISO;
  const anchor = input.anchorPosition;
  const remainingItems = sequence.filter((e) => e.seq > anchor);
  const R = remainingItems.length;

  const endISO = (() => {
    const e = isISODate(pace.endDateISO) ? pace.endDateISO : defaultEndDateISO(startISO);
    return diffDaysISO(todayISO, e) < 0 ? todayISO : e;
  })();

  // counts[i] = chapters on day today+i
  let counts: number[];

  if (pace.mode === "perDay") {
    const k = Math.max(1, Math.floor(pace.perDay ?? 1));
    const n = Math.ceil(R / k);
    counts = Array.from({ length: n }, (_, i) => Math.min(k, R - i * k));
  } else if (pace.mode === "weekly") {
    counts = weeklyCounts(input, todayISO, endISO, R);
  } else {
    const D = diffDaysISO(todayISO, endISO) + 1;
    counts = evenCounts(R, D);
  }

  // Slice the remaining chapters day by day, in order.
  const days: PacedDay[] = [];
  let cursor = 0;
  counts.forEach((c, i) => {
    if (c <= 0 || cursor >= R) return;
    const dateISO = addDaysISO(todayISO, i);
    const dayIdx = diffDaysISO(startISO, dateISO);
    days.push({
      dateISO,
      dayNumber: dayIdx + 1,
      weekStartISO: addDaysISO(startISO, Math.floor(dayIdx / 7) * 7),
      weekNumber: Math.floor(dayIdx / 7) + 1,
      items: remainingItems.slice(cursor, cursor + c),
    });
    cursor += c;
  });

  const finishDateISO = days.length ? days[days.length - 1].dateISO : null;
  const span = finishDateISO ? diffDaysISO(todayISO, finishDateISO) + 1 : 0;
  return {
    days,
    remaining: R,
    finishDateISO,
    targetDateISO: pace.mode === "perDay" ? (finishDateISO ?? todayISO) : endISO,
    avgPerDay: span > 0 ? R / span : 0,
  };
}

function weeklyCounts(
  input: PacePlanInput,
  todayISO: string,
  endISO: string,
  R: number,
): number[] {
  const { startISO, sequence } = input;
  const goals = input.pace.weeklyGoals ?? {};
  const currentWeek = weekStartFor(startISO, todayISO);

  // Weeks considered: the current one through the week holding the finish
  // date, extended to the last week that carries a goal.
  let lastWeek = weekStartFor(startISO, endISO);
  for (const [wk, g] of Object.entries(goals)) {
    if (isISODate(wk) && g >= 1 && diffDaysISO(lastWeek, wk) > 0) lastWeek = wk;
  }

  interface Week {
    start: string;
    dayOffsets: number[]; // offsets from today
    goal: number | null;
  }
  const weeks: Week[] = [];
  for (let wk = currentWeek; diffDaysISO(wk, lastWeek) >= 0; wk = addDaysISO(wk, 7)) {
    const offs: number[] = [];
    for (let d = 0; d < 7; d += 1) {
      const off = diffDaysISO(todayISO, addDaysISO(wk, d));
      if (off >= 0) offs.push(off);
    }
    const g = goals[wk];
    weeks.push({ start: wk, dayOffsets: offs, goal: g && g >= 1 ? Math.floor(g) : null });
  }

  // This week's goal counts what was already read since the week began.
  const weekAnchor = input.weekAnchorPosition ?? input.anchorPosition;
  const readThisWeek = sequence.filter(
    (e) => e.seq > weekAnchor && e.seq <= input.anchorPosition,
  ).length;

  const endOff = diffDaysISO(todayISO, endISO);
  const weekCounts: number[] = weeks.map(() => 0);
  let left = R;
  // Goal weeks claim their goals first, in order; the last ones take what's left.
  weeks.forEach((w, i) => {
    if (w.goal == null) return;
    const want = w.start === currentWeek ? Math.max(0, w.goal - readThisWeek) : w.goal;
    const take = Math.min(want, left);
    weekCounts[i] = take;
    left -= take;
  });

  // Un-goaled days up to the finish date share the rest evenly.
  const freeDays: number[] = [];
  weeks.forEach((w) => {
    if (w.goal != null) return;
    for (const off of w.dayOffsets) if (off <= endOff) freeDays.push(off);
  });

  const counts: number[] = [];
  const setDay = (off: number, c: number) => {
    while (counts.length <= off) counts.push(0);
    counts[off] += c;
  };

  // Spread each goal week across its own days.
  weeks.forEach((w, i) => {
    if (w.goal == null || weekCounts[i] === 0) return;
    const parts = evenCounts(weekCounts[i], w.dayOffsets.length);
    w.dayOffsets.forEach((off, j) => setDay(off, parts[j]));
  });

  if (left > 0 && freeDays.length > 0) {
    const parts = evenCounts(left, freeDays.length);
    freeDays.forEach((off, j) => setDay(off, parts[j]));
    left = 0;
  }

  if (left > 0) {
    // No un-goaled days before the finish date: carry on past the last
    // considered day at the plan's average pace (at least 1 a day).
    const span = Math.max(1, endOff + 1);
    const rate = Math.max(1, Math.ceil(R / span));
    let off = Math.max(counts.length, endOff + 1);
    while (left > 0) {
      const c = Math.min(rate, left);
      setDay(off, c);
      left -= c;
      off += 1;
    }
  }

  return counts;
}

/**
 * The seq of the chapter just before `seq` in the sequence (0 when it is the
 * first). Used to mark "everything before this chapter" as read.
 */
export function seqBefore(sequence: PacedItem[], seq: number): number {
  let prev = 0;
  for (const e of sequence) {
    if (e.seq >= seq) return prev;
    prev = e.seq;
  }
  return prev;
}

/**
 * Should opening (slug, chapter) in the reader advance the plan position?
 * Only when it is the next unread chapter or a few past it — so reading in
 * order (or skipping slightly ahead) moves the plan along, while browsing
 * somewhere else entirely never does. Returns the new position, or null.
 */
export function positionAfterOpening(
  sequence: PacedItem[],
  position: number,
  slug: string,
  chapter: number,
  window = 3,
): number | null {
  const nextIdx = sequence.findIndex((e) => e.seq > position);
  if (nextIdx < 0) return null;
  for (let i = nextIdx + 1; i <= nextIdx + window && i < sequence.length; i += 1) {
    const e = sequence[i];
    if (e.book_id === slug && e.chapter === chapter) return sequence[i - 1].seq;
  }
  return null;
}
