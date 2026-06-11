/**
 * astro.ts — a thin, typed wrapper over `astronomy-engine`.
 *
 * COMPUTE, DON'T SCRAPE: every function here is a deterministic local
 * computation (conjunction, equinox, sunset/moonset, topocentric sun/moon
 * geometry). No network, any year, any location. We deliberately do NOT
 * hand-roll ephemeris math — astronomy-engine is a high-accuracy pure-JS
 * ephemeris (VSOP87/ELP-class). The rest of the engine speaks only to this
 * module, so swapping the backend later touches one file.
 */

import * as Astronomy from "astronomy-engine";
import type { GeoLocation } from "./types.ts";

const MS_PER_DAY = 86_400_000;

export function addDays(d: Date, days: number): Date {
  return new Date(d.getTime() + days * MS_PER_DAY);
}

function observer(loc: GeoLocation): Astronomy.Observer {
  return new Astronomy.Observer(
    loc.latitudeDeg,
    loc.longitudeDeg,
    loc.elevationM,
  );
}

// ---------------------------------------------------------------------------
// Memoisation — the engine re-derives the SAME sunsets and equinoxes thousands
// of times when it builds a month grid or the compare table (every grid cell
// re-runs the whole reckoning, and the day-of-month count walks sunset by
// sunset). Each function here is a deterministic pure computation, so caching
// is transparent: identical inputs → identical outputs, only faster. Keys carry
// the location (+ year / UTC-day) and the cache lives for the session — bounded,
// a handful of entries per calendar day actually viewed.
// ---------------------------------------------------------------------------

function locKey(loc: GeoLocation): string {
  return `${loc.latitudeDeg},${loc.longitudeDeg},${loc.elevationM}`;
}

const sunsetDayCache = new Map<string, Date>();

/**
 * The single sunset belonging to the UTC calendar day (y, m0 0-based, d) at
 * `loc` — the first solar setting after that day's 00:00 UTC. At Jerusalem (and
 * any non-polar longitude near the prime meridian) exactly one sunset falls on
 * each UTC day, after midnight UTC, so this is unambiguous and lets the two
 * public helpers below resolve any instant's bounding sunsets with at most two
 * cached lookups instead of an iterative SearchRiseSet sweep.
 */
function sunsetForUTCDay(y: number, m0: number, d: number, loc: GeoLocation): Date {
  const key = `${y}-${m0}-${d}@${locKey(loc)}`;
  const hit = sunsetDayCache.get(key);
  if (hit) return hit;
  const midnight = new Date(Date.UTC(y, m0, d));
  const t = Astronomy.SearchRiseSet(Astronomy.Body.Sun, observer(loc), SET, midnight, 2);
  if (!t) throw new Error("sunsetForUTCDay: search failed");
  sunsetDayCache.set(key, t.date);
  return t.date;
}

// ---------------------------------------------------------------------------
// Lunar conjunction (true astronomical new moon)
// ---------------------------------------------------------------------------

// Conjunction searches (SearchMoonPhase) are expensive and the engine calls
// them relentlessly: advanceLunations walks month-by-month for every feast, and
// a month grid replays the identical conjunction chain on all 34 cells. Both
// helpers below are pure functions of their instant argument, so we memoise by
// exact millisecond — same chain → cache hits across cells and across rebuilds,
// with zero risk of a same-day straddle that a coarser key would invite.
const nextConjCache = new Map<number, Date>();
const conjBeforeCache = new Map<number, Date>();

/** The first sun–moon conjunction (new moon) strictly after `after`. */
export function nextConjunction(after: Date): Date {
  const k = after.getTime();
  const hit = nextConjCache.get(k);
  if (hit) return hit;
  // MoonPhase 0 == new moon (geocentric ecliptic longitude of moon == sun).
  const t = Astronomy.SearchMoonPhase(0, after, 40);
  if (!t) throw new Error("nextConjunction: search failed");
  nextConjCache.set(k, t.date);
  return t.date;
}

/** The most recent conjunction at or before `at`. */
export function conjunctionOnOrBefore(at: Date): Date {
  const k = at.getTime();
  const hit = conjBeforeCache.get(k);
  if (hit) return hit;
  // A synodic month is ~29.53 d; search from 31 d before to be safe, then walk
  // forward collecting conjunctions <= at.
  let cursor = addDays(at, -31);
  let last: Date | null = null;
  for (let i = 0; i < 3; i++) {
    const t = Astronomy.SearchMoonPhase(0, cursor, 40);
    if (!t) break;
    if (t.date.getTime() <= at.getTime()) {
      last = t.date;
      cursor = new Date(t.date.getTime() + 60_000); // step past it
    } else {
      break;
    }
  }
  if (!last) throw new Error("conjunctionOnOrBefore: not found");
  conjBeforeCache.set(k, last);
  return last;
}

// ---------------------------------------------------------------------------
// Spring (March) equinox
// ---------------------------------------------------------------------------

const equinoxCache = new Map<number, Date>();

/** Instant of the northward (March) equinox for the given Gregorian year. */
export function springEquinox(gregorianYear: number): Date {
  const hit = equinoxCache.get(gregorianYear);
  if (hit) return hit;
  const d = Astronomy.Seasons(gregorianYear).mar_equinox.date;
  equinoxCache.set(gregorianYear, d);
  return d;
}

// ---------------------------------------------------------------------------
// Sunset / sunrise / moonset (day boundary = sunset)
// ---------------------------------------------------------------------------

const SET = -1; // SearchRiseSet direction: setting
const RISE = +1; // rising

function searchSet(
  body: Astronomy.Body,
  loc: GeoLocation,
  from: Date,
  limitDays: number,
): Date | null {
  const t = Astronomy.SearchRiseSet(body, observer(loc), SET, from, limitDays);
  return t ? t.date : null;
}

/** First sunset strictly after `instant` at the location. */
export function nextSunset(instant: Date, loc: GeoLocation): Date {
  const y = instant.getUTCFullYear();
  const m0 = instant.getUTCMonth();
  const d = instant.getUTCDate();
  const today = sunsetForUTCDay(y, m0, d, loc);
  if (today.getTime() > instant.getTime()) return today;
  // Today's sunset has already passed → the next UTC day's sunset.
  const t = new Date(Date.UTC(y, m0, d + 1));
  return sunsetForUTCDay(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate(), loc);
}

/** The most recent sunset at or before `instant` (start of the biblical day). */
export function sunsetOnOrBefore(instant: Date, loc: GeoLocation): Date {
  const y = instant.getUTCFullYear();
  const m0 = instant.getUTCMonth();
  const d = instant.getUTCDate();
  const today = sunsetForUTCDay(y, m0, d, loc);
  if (today.getTime() <= instant.getTime()) return today;
  // Today's sunset is still ahead → the previous UTC day's sunset.
  const t = new Date(Date.UTC(y, m0, d - 1));
  return sunsetForUTCDay(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate(), loc);
}

/** First sunrise strictly after `instant`. */
export function nextSunrise(instant: Date, loc: GeoLocation): Date {
  const t = Astronomy.SearchRiseSet(
    Astronomy.Body.Sun,
    observer(loc),
    RISE,
    new Date(instant.getTime() + 1000),
    2,
  );
  if (!t) throw new Error("nextSunrise: search failed");
  return t.date;
}

/** First moonset strictly after `instant`, or null if none within `limitDays`. */
export function nextMoonset(
  instant: Date,
  loc: GeoLocation,
  limitDays = 2,
): Date | null {
  return searchSet(Astronomy.Body.Moon, loc, new Date(instant.getTime() + 1000), limitDays);
}

// ---------------------------------------------------------------------------
// Topocentric geometry (for crescent visibility)
// ---------------------------------------------------------------------------

export interface TopoPosition {
  /** Topocentric altitude above the true horizon, degrees. */
  altitudeDeg: number;
  /** Topocentric azimuth, degrees clockwise from north. */
  azimuthDeg: number;
}

function topo(
  body: Astronomy.Body,
  instant: Date,
  loc: GeoLocation,
): TopoPosition {
  const obs = observer(loc);
  // ofdate + topocentric correction; refraction "normal" for visible horizon.
  const eq = Astronomy.Equator(body, instant, obs, true, true);
  const hor = Astronomy.Horizon(instant, obs, eq.ra, eq.dec, "normal");
  return { altitudeDeg: hor.altitude, azimuthDeg: hor.azimuth };
}

export const sunTopo = (instant: Date, loc: GeoLocation): TopoPosition =>
  topo(Astronomy.Body.Sun, instant, loc);

export const moonTopo = (instant: Date, loc: GeoLocation): TopoPosition =>
  topo(Astronomy.Body.Moon, instant, loc);

/** Sun–moon elongation (arc of light, ARCL) in degrees at `instant`. */
export function elongationDeg(instant: Date): number {
  return Astronomy.AngleFromSun(Astronomy.Body.Moon, instant);
}

/**
 * Topocentric apparent semidiameter of the Moon, in arcminutes, at `instant`
 * as seen from `loc`. Used by the Yallop/Odeh crescent-width term.
 */
export function moonSemiDiameterArcmin(instant: Date, loc: GeoLocation): number {
  const obs = observer(loc);
  // Topocentric distance to the Moon, in AU → km.
  const v = Astronomy.GeoVector(Astronomy.Body.Moon, instant, true);
  const obsVec = Astronomy.ObserverVector(instant, obs, true);
  const dx = v.x - obsVec.x;
  const dy = v.y - obsVec.y;
  const dz = v.z - obsVec.z;
  const distAu = Math.sqrt(dx * dx + dy * dy + dz * dz);
  const distKm = distAu * Astronomy.KM_PER_AU;
  const moonRadiusKm = 1737.4;
  const sdRad = Math.asin(moonRadiusKm / distKm);
  return (sdRad * 180) / Math.PI * 60; // degrees → arcminutes
}

/** Illuminated fraction of the lunar disk (0..1) at `instant`. */
export function moonIllumination(instant: Date): number {
  return Astronomy.Illumination(Astronomy.Body.Moon, instant).phase_fraction;
}
