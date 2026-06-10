/**
 * time.ts — biblical-day helpers shared across reckonings.
 *
 * A biblical day runs sunset→sunset at the location. These helpers translate
 * between instants, sunset-bounded day counts, and the rabbinic/Enoch RD grid.
 */

import type { GeoLocation } from "./types.ts";
import { nextSunset, sunsetOnOrBefore } from "./astro.ts";
import { dateUTCToRD, rdToGregorian } from "./molad.ts";

/**
 * The day-of-month for `query`, given the sunset that began day 1 of the month.
 * Counts sunset boundaries; day 1 spans [monthStartSunset, next sunset).
 */
export function biblicalDayNumber(
  monthStartSunset: Date,
  query: Date,
  loc: GeoLocation,
): number {
  let day = 1;
  let s = monthStartSunset;
  for (let i = 0; i < 60; i++) {
    const nx = nextSunset(s, loc);
    if (nx.getTime() > query.getTime()) break;
    day++;
    s = nx;
  }
  return day;
}

/** Advance `n` biblical days (sunset boundaries) forward from a day-start sunset. */
export function addBiblicalDays(
  dayStartSunset: Date,
  n: number,
  loc: GeoLocation,
): Date {
  let s = dayStartSunset;
  for (let i = 0; i < n; i++) s = nextSunset(s, loc);
  return s;
}

/** Walk `n` biblical days BACKWARD from a day-start sunset. */
export function subBiblicalDays(
  dayStartSunset: Date,
  n: number,
  loc: GeoLocation,
): Date {
  let s = dayStartSunset;
  for (let i = 0; i < n; i++) {
    s = sunsetOnOrBefore(new Date(s.getTime() - 1000), loc);
  }
  return s;
}

/**
 * The current biblical day's RD fixed-day number for `query` (rabbinic/Enoch).
 * The biblical day in progress maps to the Gregorian daytime AFTER the most
 * recent sunset, so its RD is that of (recent-sunset date + 1).
 */
export function currentBiblicalRD(query: Date, loc: GeoLocation): number {
  const recent = sunsetOnOrBefore(query, loc);
  return dateUTCToRD(recent) + 1;
}

/** The sunset instant that BEGINS the biblical day identified by an RD. */
export function rdToStartInstant(rd: number, loc: GeoLocation): Date {
  const g = rdToGregorian(rd);
  // 06:00 UTC on the daytime date — the most recent sunset is the prior
  // evening's, which is exactly when this biblical day began.
  const morning = new Date(Date.UTC(g.year, g.month - 1, g.day, 6, 0, 0));
  return sunsetOnOrBefore(morning, loc);
}
