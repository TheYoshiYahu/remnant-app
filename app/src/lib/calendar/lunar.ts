/**
 * lunar.ts — primitives shared by the conjunction & crescent reckonings.
 *
 * A "month-start function" maps a conjunction to the sunset that begins that
 * lunar month. The two lunar reckonings differ ONLY in this function:
 *   - conjunction: the sunset of the day in which the conjunction falls.
 *   - crescent: the first evening the crescent is predicted visible.
 * Everything else (locating the current lunation, month index, year-start)
 * is shared.
 */

import type {
  CalendarConfig,
  CrescentCriterion,
  GeoLocation,
} from "./types.ts";
import {
  conjunctionOnOrBefore,
  nextConjunction,
  springEquinox,
  sunsetOnOrBefore,
} from "./astro.ts";
import { predictFirstCrescent } from "./crescent.ts";

export type MonthStartFn = (conjunction: Date) => Date;

/** Build the month-start function for a lunar config. */
export function monthStartFnFor(
  config: CalendarConfig,
  loc: GeoLocation,
): MonthStartFn {
  if (config.month.kind === "conjunction") {
    return (conj) => sunsetOnOrBefore(conj, loc);
  }
  if (config.month.kind === "crescent") {
    const crit: CrescentCriterion = config.month.criterion;
    return (conj) => predictFirstCrescent(conj, loc, crit).firstVisibleEvening;
  }
  throw new Error("monthStartFnFor: not a lunar reckoning");
}

export interface Lunation {
  conjunction: Date;
  start: Date; // month-start sunset
}

const MS = 1000;

/** The lunation (conjunction + month-start) whose start ≤ query < next start. */
export function currentLunation(
  query: Date,
  monthStart: MonthStartFn,
): Lunation {
  let conj = conjunctionOnOrBefore(query);
  let start = monthStart(conj);
  if (start.getTime() > query.getTime()) {
    // The month hasn't visibly begun yet — we're still in the prior month.
    conj = conjunctionOnOrBefore(new Date(conj.getTime() - MS));
    start = monthStart(conj);
  }
  return { conjunction: conj, start };
}

/** The lunation following a given one. */
export function nextLunation(
  lun: Lunation,
  monthStart: MonthStartFn,
): Lunation {
  const conj = nextConjunction(new Date(lun.conjunction.getTime() + MS));
  return { conjunction: conj, start: monthStart(conj) };
}

/** The lunation `n` months after `lun` (n ≥ 0). */
export function advanceLunations(
  lun: Lunation,
  n: number,
  monthStart: MonthStartFn,
): Lunation {
  let cur = lun;
  for (let i = 0; i < n; i++) cur = nextLunation(cur, monthStart);
  return cur;
}

// ---------------------------------------------------------------------------
// Year-start (dial B)
// ---------------------------------------------------------------------------

export interface YearStart {
  /** The conjunction beginning month 1 (Abib). */
  conjunction: Date;
  start: Date; // month-1 start sunset
  /** Gregorian year used for the equinox anchor — the biblical year number. */
  gregYear: number;
  /** True when an empirical aviv datum was unavailable and we used equinox. */
  assumed: boolean;
}

/**
 * Month 1 (Abib) per the EQUINOX rule: the first month whose start (per the
 * month dial) is on or after the spring equinox of `gregYear`.
 */
export function equinoxYearStart(
  gregYear: number,
  monthStart: MonthStartFn,
): { conjunction: Date; start: Date } {
  const eq = springEquinox(gregYear);
  let conj = conjunctionOnOrBefore(eq);
  let start = monthStart(conj);
  while (start.getTime() < eq.getTime()) {
    conj = nextConjunction(new Date(conj.getTime() + MS));
    start = monthStart(conj);
  }
  return { conjunction: conj, start };
}

/**
 * The biblical year-start whose month-1 start ≤ `referenceStart`. Tries the
 * Gregorian years around the reference and returns the latest qualifying one.
 * If an aviv datum is supplied for that year, it overrides the equinox anchor.
 */
export function locateYearStart(
  referenceStart: Date,
  monthStart: MonthStartFn,
  yearReckoning: CalendarConfig["year"],
  avivDeclared: (gregYear: number) => Date | null,
): YearStart {
  const gyGuess = referenceStart.getUTCFullYear();
  for (let g = gyGuess + 1; g >= gyGuess - 1; g--) {
    const ys = resolveYearStart(g, monthStart, yearReckoning, avivDeclared);
    if (ys.start.getTime() <= referenceStart.getTime()) return ys;
  }
  // Fallback: deepest year tried.
  return resolveYearStart(gyGuess - 1, monthStart, yearReckoning, avivDeclared);
}

export function resolveYearStart(
  gregYear: number,
  monthStart: MonthStartFn,
  yearReckoning: CalendarConfig["year"],
  avivDeclared: (gregYear: number) => Date | null,
): YearStart {
  if (yearReckoning.kind === "aviv") {
    const declared = avivDeclared(gregYear);
    if (declared) {
      return {
        conjunction: declared,
        start: monthStart(declared),
        gregYear,
        assumed: false,
      };
    }
    // No barley report — fall back to equinox, flagged.
    const eq = equinoxYearStart(gregYear, monthStart);
    return { ...eq, gregYear, assumed: true };
  }
  const eq = equinoxYearStart(gregYear, monthStart);
  return { ...eq, gregYear, assumed: false };
}

/** 1-based month index of `lun` within its biblical year. */
export function monthIndexOf(
  yearStart: YearStart,
  lun: Lunation,
  monthStart: MonthStartFn,
): number {
  let index = 1;
  let cur: Lunation = {
    conjunction: yearStart.conjunction,
    start: yearStart.start,
  };
  while (cur.conjunction.getTime() < lun.conjunction.getTime() - MS) {
    cur = nextLunation(cur, monthStart);
    index++;
    if (index > 14) break; // safety
  }
  return index;
}
