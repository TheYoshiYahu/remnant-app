/**
 * crescent.ts — predicted first-crescent visibility.
 *
 * Two established criteria are implemented faithfully:
 *   - Yallop (1997), RGO NAO Technical Note 69 — the `q` test.
 *   - Odeh (2004), Experimental Astronomy 18 — the `V` test.
 *
 * Both evaluate the young crescent at the "best time"
 * (sunset + 4/9·(moonset − sunset), Bruin's lag fraction) using the
 * topocentric arc of vision (ARCV) and the crescent width W. This is a
 * physical-model prediction — the genuinely empirical question ("was it
 * actually seen?") is answered by a sighting (manual tap or verified feed),
 * which the engine layers on top via the PENDING/CONFIRMED state.
 */

import type { CrescentCriterion, GeoLocation } from "./types.ts";
import {
  elongationDeg,
  moonSemiDiameterArcmin,
  moonTopo,
  nextMoonset,
  nextSunset,
  sunTopo,
} from "./astro.ts";

const DEG2RAD = Math.PI / 180;

export type VisibilityCategory =
  | "easy" // unmistakable naked-eye crescent
  | "visible" // naked-eye visible (perfect conditions)
  | "possible" // borderline — may need optical aid to find; the PENDING band
  | "optical-aid" // only with binoculars/telescope
  | "not-visible"; // below the visibility limit

export interface VisibilityEvaluation {
  criterion: CrescentCriterion;
  /** Sunset that opens this evening (candidate day boundary). */
  eveningSunset: Date;
  /** Best-time instant the geometry is evaluated at. */
  bestTime: Date;
  /** Arc of vision (topocentric moon−sun altitude), degrees. */
  arcvDeg: number;
  /** Arc of light (sun–moon elongation), degrees. */
  arclDeg: number;
  /** Difference in azimuth |moon−sun|, degrees. */
  dazDeg: number;
  /** Crescent width, arcminutes. */
  widthArcmin: number;
  /** Moon lag (moonset − sunset), minutes. Negative ⇒ moon already set. */
  moonLagMinutes: number;
  /** Moon altitude at best time, degrees. */
  moonAltDeg: number;
  /** The criterion value: Yallop q or Odeh V. */
  value: number;
  category: VisibilityCategory;
  /** True if the criterion predicts a naked-eye sighting (not borderline). */
  visibleNakedEye: boolean;
}

// ---------------------------------------------------------------------------
// Core geometry at the best time
// ---------------------------------------------------------------------------

interface Geometry {
  bestTime: Date;
  arcvDeg: number;
  arclDeg: number;
  dazDeg: number;
  widthArcmin: number;
  moonLagMinutes: number;
  moonAltDeg: number;
}

/** Compute crescent geometry for the evening that opens at `eveningSunset`. */
function geometry(eveningSunset: Date, loc: GeoLocation): Geometry | null {
  const moonset = nextMoonset(eveningSunset, loc, 1);
  if (!moonset) return null; // moon doesn't set within a day (polar) — bail
  const lagMs = moonset.getTime() - eveningSunset.getTime();
  const moonLagMinutes = lagMs / 60_000;
  if (lagMs <= 0) {
    // Moon sets before/at sunset — the crescent cannot be seen after dark.
    return {
      bestTime: eveningSunset,
      arcvDeg: NaN,
      arclDeg: NaN,
      dazDeg: NaN,
      widthArcmin: NaN,
      moonLagMinutes,
      moonAltDeg: NaN,
    };
  }
  // Bruin / Yallop best time.
  const bestTime = new Date(eveningSunset.getTime() + (4 / 9) * lagMs);

  const sun = sunTopo(bestTime, loc);
  const moon = moonTopo(bestTime, loc);
  const arcvDeg = moon.altitudeDeg - sun.altitudeDeg;
  let dazDeg = Math.abs(moon.azimuthDeg - sun.azimuthDeg);
  if (dazDeg > 180) dazDeg = 360 - dazDeg;
  const arclDeg = elongationDeg(bestTime);

  const sdArcmin = moonSemiDiameterArcmin(bestTime, loc);
  // Yallop crescent width: W = s.d.·(1 − cos ARCL), s.d. in arcmin.
  const widthArcmin = sdArcmin * (1 - Math.cos(arclDeg * DEG2RAD));

  return {
    bestTime,
    arcvDeg,
    arclDeg,
    dazDeg,
    widthArcmin,
    moonLagMinutes,
    moonAltDeg: moon.altitudeDeg,
  };
}

// ---------------------------------------------------------------------------
// Yallop q
// ---------------------------------------------------------------------------

function yallop(arcvDeg: number, widthArcmin: number) {
  const W = widthArcmin;
  const limit = 11.8371 - 6.3226 * W + 0.7319 * W * W - 0.1018 * W * W * W;
  const q = (arcvDeg - limit) / 10;
  // Yallop's six zones (TN69):
  let category: VisibilityCategory;
  if (q > 0.216) category = "easy"; // A
  else if (q > -0.014) category = "visible"; // B
  else if (q > -0.16) category = "possible"; // C — naked eye after find w/ aid
  else if (q > -0.293) category = "optical-aid"; // D / E
  else category = "not-visible"; // F (Danjon)
  return { value: q, category };
}

// ---------------------------------------------------------------------------
// Odeh V
// ---------------------------------------------------------------------------

function odeh(arcvDeg: number, widthArcmin: number) {
  const W = widthArcmin;
  const limit = -0.1018 * W * W * W + 0.7319 * W * W - 6.3226 * W + 7.1651;
  const V = arcvDeg - limit;
  // Odeh's four zones (2004):
  let category: VisibilityCategory;
  if (V >= 5.65) category = "easy"; // A — naked eye
  else if (V >= 2.0) category = "possible"; // B — could be naked eye (borderline)
  else if (V >= -0.96) category = "optical-aid"; // C — optical aid only
  else category = "not-visible"; // D
  return { value: V, category };
}

// ---------------------------------------------------------------------------
// Evaluation + first-crescent prediction
// ---------------------------------------------------------------------------

export function evaluateVisibility(
  eveningSunset: Date,
  loc: GeoLocation,
  criterion: CrescentCriterion,
): VisibilityEvaluation {
  const g = geometry(eveningSunset, loc);
  const notVisible = (lag: number): VisibilityEvaluation => ({
    criterion,
    eveningSunset,
    bestTime: eveningSunset,
    arcvDeg: NaN,
    arclDeg: NaN,
    dazDeg: NaN,
    widthArcmin: NaN,
    moonLagMinutes: lag,
    moonAltDeg: NaN,
    value: NaN,
    category: "not-visible",
    visibleNakedEye: false,
  });
  if (!g) return notVisible(NaN);
  if (!Number.isFinite(g.arcvDeg)) return notVisible(g.moonLagMinutes);

  const { value, category } =
    criterion === "yallop"
      ? yallop(g.arcvDeg, g.widthArcmin)
      : odeh(g.arcvDeg, g.widthArcmin);

  return {
    criterion,
    eveningSunset,
    bestTime: g.bestTime,
    arcvDeg: g.arcvDeg,
    arclDeg: g.arclDeg,
    dazDeg: g.dazDeg,
    widthArcmin: g.widthArcmin,
    moonLagMinutes: g.moonLagMinutes,
    moonAltDeg: g.moonAltDeg,
    value,
    category,
    visibleNakedEye: category === "easy" || category === "visible",
  };
}

export interface CrescentPrediction {
  conjunction: Date;
  /** First evening predicted naked-eye visible — the default month start. */
  firstVisibleEvening: Date;
  firstVisibleEval: VisibilityEvaluation;
  /**
   * If the evening BEFORE first-visible was only "possible" (borderline), the
   * honest ambiguity lives here: the month begins that evening IF the crescent
   * is actually sighted, ELSE on firstVisibleEvening.
   */
  marginalEvening?: Date;
  marginalEval?: VisibilityEvaluation;
  /** All evenings evaluated, for inspection/UI. */
  evenings: VisibilityEvaluation[];
}

/**
 * Predict the first crescent visibility after a conjunction. Walks up to six
 * successive evenings from the first sunset after conjunction.
 */
export function predictFirstCrescent(
  conjunction: Date,
  loc: GeoLocation,
  criterion: CrescentCriterion,
): CrescentPrediction {
  const evenings: VisibilityEvaluation[] = [];
  let evening = nextSunset(conjunction, loc);
  for (let i = 0; i < 6; i++) {
    evenings.push(evaluateVisibility(evening, loc, criterion));
    evening = nextSunset(evening, loc);
  }

  const firstVisibleIdx = evenings.findIndex((e) => e.visibleNakedEye);
  // Defensive fallback: if no naked-eye evening (extreme latitude/criterion),
  // take the first "possible" evening, else the 2nd evening (typical age).
  let idx = firstVisibleIdx;
  if (idx < 0) idx = evenings.findIndex((e) => e.category === "possible");
  if (idx < 0) idx = Math.min(1, evenings.length - 1);

  const firstVisibleEval = evenings[idx];
  const prior = idx > 0 ? evenings[idx - 1] : undefined;
  const marginal = prior && prior.category === "possible" ? prior : undefined;

  return {
    conjunction,
    firstVisibleEvening: firstVisibleEval.eveningSunset,
    firstVisibleEval,
    marginalEvening: marginal?.eveningSunset,
    marginalEval: marginal,
    evenings,
  };
}
