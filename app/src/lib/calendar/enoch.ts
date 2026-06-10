/**
 * enoch.ts — the Enoch / Qumran 364-day solar calendar.
 *
 * This is its OWN engine, not a lunar sub-option: it rejects the moon
 * entirely (1 Enoch 72–82; Jubilees 6). The structure:
 *
 *   364 days = 4 quarters × 91 days; each quarter runs months of 30, 30, 31.
 *   ⇒ month length = (month % 3 === 0) ? 31 : 30  (months 3,6,9,12 get the 31st)
 *   ⇒ 364 = 52 weeks exactly ⇒ every date has a FIXED weekday, every year.
 *   The year begins on the 4th day, Wednesday (Gen 1:14–19 — luminaries), at
 *   or after the spring equinox.
 *
 * Intercalation sub-dial (CALENDAR_DESIGN.md §1):
 *   - equinox-reanchor: New Year = first Wednesday on/after the spring equinox,
 *     recomputed yearly. Because both ends are Wednesdays and 364 ≡ 0 (mod 7),
 *     the gap to the next New Year is always 0 or 7 days — a leap week emerges
 *     naturally, and the fixed-weekday grid is preserved.
 *   - leap-week: count fixed 364-day years from an epoch, inserting a 7-day
 *     leap week every N years (configurable).
 *   - none: pure 364, no correction — weekday fixed forever, seasons drift.
 *
 * Enoch years are numbered by the Gregorian year their New-Year anchor falls
 * in (so "Enoch year 2026" began in spring 2026). The leap-week / none modes
 * anchor off a base Gregorian year's equinox-Wednesday.
 */

import type { EnochIntercalation, GeoLocation } from "./types.ts";
import { springEquinox } from "./astro.ts";
import {
  dateUTCToRD,
  rdToGregorian,
  weekdayOfRD,
} from "./molad.ts";

/** Base year whose equinox-Wednesday anchors the leap-week / none counts. */
const ENOCH_BASE_GREG_YEAR = 2000;
const WEDNESDAY = 3; // 0 = Sunday
const DEFAULT_LEAP_WEEK_PERIOD = 7;

// ---------------------------------------------------------------------------
// Month/day ↔ day-of-year on the fixed 364-day grid
// ---------------------------------------------------------------------------

/** Length of an Enoch month: 31 for months 3,6,9,12; else 30. */
export function enochMonthLength(month: number): number {
  return month % 3 === 0 ? 31 : 30;
}

/** Day-of-year (1..364) for a fixed-grid month/day. */
export function enochDayOfYear(month: number, day: number): number {
  let doy = day;
  for (let m = 1; m < month; m++) doy += enochMonthLength(m);
  return doy;
}

export interface EnochMonthDay {
  month: number; // 1..12, or 13 for the intercalary leap week
  day: number;
  isIntercalary: boolean;
}

/** Month/day from a day-of-year (1..364, or 365..371 in a leap-week year). */
export function enochMonthDayFromDayOfYear(doy: number): EnochMonthDay {
  if (doy > 364) {
    return { month: 13, day: doy - 364, isIntercalary: true };
  }
  let d = doy;
  for (let m = 1; m <= 12; m++) {
    const len = enochMonthLength(m);
    if (d <= len) return { month: m, day: d, isIntercalary: false };
    d -= len;
  }
  return { month: 12, day: 31, isIntercalary: false };
}

/**
 * Fixed-grid weekday of a date (0 = Sunday … 6 = Saturday). 1/1 is always
 * Wednesday (3). Independent of year — this IS the 364-day invariant.
 */
export function enochWeekday(month: number, day: number): number {
  return (WEDNESDAY + (enochDayOfYear(month, day) - 1)) % 7;
}

// ---------------------------------------------------------------------------
// Year-start anchoring
// ---------------------------------------------------------------------------

/** First Wednesday on/after the spring equinox of a Gregorian year (as RD). */
export function equinoxWednesdayRD(gregYear: number): number {
  let rd = dateUTCToRD(springEquinox(gregYear));
  while (weekdayOfRD(rd) !== WEDNESDAY) rd++;
  return rd;
}

export interface EnochConfig {
  intercalation: EnochIntercalation;
  leapWeekPeriodYears?: number;
}

interface YearSpan {
  yearStartRD: number;
  nextYearStartRD: number;
  /** Gregorian year of the New-Year anchor — the Enoch year number. */
  enochYear: number;
}

function leapWeekAnchorRD(k: number, anchor0: number, period: number): number {
  // Years 0..k-1 contribute 364 each, plus a 7-day leap week after every
  // `period`-th year. k may be negative (queries before the base).
  return anchor0 + 364 * k + 7 * Math.floor(k / period);
}

/** Locate the Enoch year (start/next/number) containing an RD fixed day. */
export function enochYearSpan(
  rd: number,
  cfg: EnochConfig,
  loc: GeoLocation,
): YearSpan {
  void loc; // anchoring is day-granular; location reserved for future tuning
  if (cfg.intercalation === "equinox-reanchor") {
    const gy = rdToGregorian(rd).year;
    for (let g = gy + 1; g >= gy - 2; g--) {
      const a = equinoxWednesdayRD(g);
      if (a <= rd) {
        return {
          yearStartRD: a,
          nextYearStartRD: equinoxWednesdayRD(g + 1),
          enochYear: g,
        };
      }
    }
    // Defensive fallback (should not happen for sane inputs).
    const a = equinoxWednesdayRD(gy - 2);
    return { yearStartRD: a, nextYearStartRD: equinoxWednesdayRD(gy - 1), enochYear: gy - 2 };
  }

  const anchor0 = equinoxWednesdayRD(ENOCH_BASE_GREG_YEAR);

  if (cfg.intercalation === "none") {
    const k = Math.floor((rd - anchor0) / 364);
    const start = anchor0 + 364 * k;
    return {
      yearStartRD: start,
      nextYearStartRD: start + 364,
      enochYear: rdToGregorian(start).year,
    };
  }

  // leap-week
  const period = cfg.leapWeekPeriodYears ?? DEFAULT_LEAP_WEEK_PERIOD;
  let k = Math.floor((rd - anchor0) / 364.7); // estimate, then correct
  while (leapWeekAnchorRD(k + 1, anchor0, period) <= rd) k++;
  while (leapWeekAnchorRD(k, anchor0, period) > rd) k--;
  const start = leapWeekAnchorRD(k, anchor0, period);
  return {
    yearStartRD: start,
    nextYearStartRD: leapWeekAnchorRD(k + 1, anchor0, period),
    enochYear: rdToGregorian(start).year,
  };
}

// ---------------------------------------------------------------------------
// Full date from an RD fixed day
// ---------------------------------------------------------------------------

export interface EnochDate {
  enochYear: number;
  month: number;
  day: number;
  dayOfYear: number;
  /** 0 = Sunday … 6 = Saturday. */
  weekday: number;
  yearLengthDays: number; // 364 or 371
  isIntercalary: boolean; // in the leap week
  yearStartRD: number;
}

export function enochDateFromRD(
  rd: number,
  cfg: EnochConfig,
  loc: GeoLocation,
): EnochDate {
  const span = enochYearSpan(rd, cfg, loc);
  const dayOfYear = rd - span.yearStartRD + 1;
  const yearLengthDays = span.nextYearStartRD - span.yearStartRD;
  const md = enochMonthDayFromDayOfYear(dayOfYear);
  return {
    enochYear: span.enochYear,
    month: md.month,
    day: md.day,
    dayOfYear,
    weekday: weekdayOfRD(rd),
    yearLengthDays,
    isIntercalary: md.isIntercalary,
    yearStartRD: span.yearStartRD,
  };
}

const ENOCH_MONTH_NAMES = [
  "",
  "I",
  "II",
  "III",
  "IV",
  "V",
  "VI",
  "VII",
  "VIII",
  "IX",
  "X",
  "XI",
  "XII",
  "Intercalary Week",
];

export function enochMonthName(month: number): string {
  return ENOCH_MONTH_NAMES[month] ?? `M${month}`;
}
