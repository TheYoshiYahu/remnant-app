/**
 * Biblical calendar engine — public API.
 *
 * The configurable computation core for the Remnant of Promise app's calendar
 * features. See CALENDAR_DESIGN.md at the repo root for the full spec.
 *
 * COMPUTE, DON'T SCRAPE: everything deterministic (conjunction, equinox,
 * crescent prediction, rabbinic arithmetic, the Enoch 364-day count) is
 * computed locally and offline. Only genuinely empirical inputs (actual
 * crescent sightings, aviv/barley reports) come from injected feeds.
 *
 * Quick start:
 *   import { computeBiblicalDate, JERUSALEM } from "@/lib/calendar";
 *   const result = computeBiblicalDate(new Date(), {
 *     month: { kind: "crescent", criterion: "odeh", mode: "predicted" },
 *     year:  { kind: "equinox" },
 *     location: JERUSALEM,
 *   });
 */

export { computeBiblicalDate } from "./engine.ts";
export { JERUSALEM } from "./types.ts";

export type {
  BiblicalDate,
  CalendarConfig,
  CrescentCriterion,
  CrescentMode,
  EngineResult,
  EnochIntercalation,
  FirstfruitsRule,
  GeoLocation,
  ManualOverride,
  Moed,
  MoedKind,
  MonthReckoning,
  MonthStart,
  PendingDetail,
  YearReckoning,
  YearStartInfo,
} from "./types.ts";

export type {
  AvivReportFeed,
  CalendarDeps,
  SightingReport,
  VerifiedSightingFeed,
} from "./feeds.ts";
export {
  manualAvivFeed,
  manualSightingFeed,
  NULL_AVIV_FEED,
  NULL_SIGHTING_FEED,
} from "./feeds.ts";

// Lower-level building blocks, exposed for advanced UIs / inspection.
export {
  type VisibilityCategory,
  type VisibilityEvaluation,
  type CrescentPrediction,
  evaluateVisibility,
  predictFirstCrescent,
} from "./crescent.ts";
export {
  applyDechiyot,
  isHebrewLeapYear,
  moladTishrei,
} from "./molad.ts";
export {
  enochDateFromRD,
  enochWeekday,
  enochMonthName,
} from "./enoch.ts";
