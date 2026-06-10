/**
 * feeds.ts — the ONLY non-computed inputs (compute, don't scrape).
 *
 * Two things in this engine are genuinely empirical and cannot be derived from
 * physics: (1) whether the young crescent was ACTUALLY sighted, and (2) whether
 * the barley in Israel is *aviv*. Everything else is computed. These arrive
 * through the interfaces below — stubbed now, wired to a real feed or manual
 * entry later. The interfaces are injected into the engine as `deps`, keeping
 * `computeBiblicalDate` pure (no global I/O).
 */

import type { GeoLocation } from "./types.ts";

/** Tri-state: a sighting can be confirmed, denied, or simply unknown. */
export type SightingReport = "sighted" | "not-sighted" | "unknown";

/**
 * Source of verified crescent sightings (for the `jerusalem-verified` and
 * `local-confirm` sub-modes). A real implementation might call a community
 * sighting API or read the user's own taps; the stub returns "unknown" so the
 * engine honestly reports PENDING.
 */
export interface VerifiedSightingFeed {
  /**
   * Was the crescent sighted on the evening that opened at `eveningSunset`,
   * for an observer at `loc`? "unknown" ⇒ no datum ⇒ engine stays pending.
   */
  wasSighted(eveningSunset: Date, loc: GeoLocation): SightingReport;
}

/**
 * Source of aviv/barley reports — the empirical year-start input. A real
 * implementation reads field reports from Israel; the stub returns null so the
 * engine falls back to the equinox rule and flags `assumed`.
 */
export interface AvivReportFeed {
  /**
   * The conjunction/new-moon that has been DECLARED the first month (Abib) for
   * the agricultural year beginning near `gregorianYear`, or null if no report
   * is available.
   */
  declaredAbibNewMoon(gregorianYear: number, loc: GeoLocation): Date | null;
}

export interface CalendarDeps {
  sightingFeed?: VerifiedSightingFeed;
  avivFeed?: AvivReportFeed;
}

// ---------------------------------------------------------------------------
// Default stubs — honest "no data" sources
// ---------------------------------------------------------------------------

export const NULL_SIGHTING_FEED: VerifiedSightingFeed = {
  wasSighted: () => "unknown",
};

export const NULL_AVIV_FEED: AvivReportFeed = {
  declaredAbibNewMoon: () => null,
};

/**
 * A manual sighting feed backed by an in-memory list of confirmed evenings
 * (matched to the day). Useful for `local-confirm` ("I sighted it") and tests.
 */
export function manualSightingFeed(
  sightedEvenings: Date[],
  notSightedEvenings: Date[] = [],
): VerifiedSightingFeed {
  const sameDay = (a: Date, b: Date) =>
    a.getUTCFullYear() === b.getUTCFullYear() &&
    a.getUTCMonth() === b.getUTCMonth() &&
    a.getUTCDate() === b.getUTCDate();
  return {
    wasSighted(eveningSunset) {
      if (sightedEvenings.some((d) => sameDay(d, eveningSunset)))
        return "sighted";
      if (notSightedEvenings.some((d) => sameDay(d, eveningSunset)))
        return "not-sighted";
      return "unknown";
    },
  };
}

/** A manual aviv feed: a fixed map of gregorian year → declared Abib new moon. */
export function manualAvivFeed(
  declarations: Record<number, Date>,
): AvivReportFeed {
  return {
    declaredAbibNewMoon(gregorianYear) {
      return declarations[gregorianYear] ?? null;
    },
  };
}
