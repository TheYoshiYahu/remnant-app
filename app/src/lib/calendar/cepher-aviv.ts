/**
 * cepher-aviv.ts - INTERIM aviv/barley feed.
 *
 * The real barley signal (was the barley in Israel aviv?) is empirical and will
 * be wired to a maintained yearly source later. Until then, the "Aviv (barley)"
 * year toggle needs to produce the feast dates the assembly already trusts (the
 * Cepher calendar). Cepher places Abib at the DARK MOON (conjunction) NEAREST the
 * spring equinox - NOT the strict "first month whose start is on or after the
 * equinox," which pushes a dark moon that falls a day or two before the equinox a
 * full lunar month late (the bug: feasts landing in October).
 *
 * This feed returns the conjunction nearest the spring equinox for the year, so
 * the engine's aviv year-start lands on the Cepher month. Stand-in only - replace
 * declaredAbibNewMoon with the real barley-report source when ready.
 */

import type { AvivReportFeed } from "./feeds.ts";
import type { GeoLocation } from "./types.ts";
import { conjunctionOnOrBefore, nextConjunction, springEquinox } from "./astro.ts";

const MS = 1000;

export function cepherAvivFeed(): AvivReportFeed {
  return {
    declaredAbibNewMoon(gregorianYear: number, _loc: GeoLocation): Date | null {
      const eq = springEquinox(gregorianYear);
      const before = conjunctionOnOrBefore(eq);
      const after = nextConjunction(new Date(before.getTime() + MS));
      const dBefore = eq.getTime() - before.getTime();
      const dAfter = after.getTime() - eq.getTime();
      return dBefore <= dAfter ? before : after;
    },
  };
}
