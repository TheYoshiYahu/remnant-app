/**
 * Biblical calendar engine — shared types.
 *
 * See CALENDAR_DESIGN.md at the repo root for the full spec. The engine is
 * built around TWO INDEPENDENT DIALS: a month-start reckoning (dial A) and a
 * year-start reckoning (dial B). Everything here is pure data — no behavior.
 */

// ---------------------------------------------------------------------------
// Location & geometry
// ---------------------------------------------------------------------------

export interface GeoLocation {
  /** Degrees north, positive = N. */
  latitudeDeg: number;
  /** Degrees east, positive = E. */
  longitudeDeg: number;
  /** Metres above sea level. Affects sunset / visibility slightly. */
  elevationM: number;
  /** Optional human label for display ("Jerusalem"). */
  label?: string;
}

/** The Temple Mount, Jerusalem — the canonical reference location. */
export const JERUSALEM: GeoLocation = {
  latitudeDeg: 31.7683,
  longitudeDeg: 35.2137,
  elevationM: 754,
  label: "Jerusalem",
};

// ---------------------------------------------------------------------------
// Dial A — month-start reckoning
// ---------------------------------------------------------------------------

/** Which established first-crescent visibility criterion to evaluate. */
export type CrescentCriterion = "yallop" | "odeh";

/**
 * Sighting sub-modes for the crescent reckoning.
 *  - predicted: trust the computed first-visible evening (self-resolving).
 *  - local-confirm: the user taps "I sighted it"; pending until they do.
 *  - jerusalem-verified: defer to a verified-sighting feed; pending until it reports.
 */
export type CrescentMode = "predicted" | "local-confirm" | "jerusalem-verified";

/** Enoch 364-day intercalation sub-dial. See CALENDAR_DESIGN.md §1. */
export type EnochIntercalation = "equinox-reanchor" | "leap-week" | "none";

export type MonthReckoning =
  | { kind: "conjunction" }
  | {
      kind: "crescent";
      criterion: CrescentCriterion;
      mode: CrescentMode;
    }
  | { kind: "rabbinic" }
  | {
      kind: "enoch";
      intercalation: EnochIntercalation;
      /** leap-week period in years (only used when intercalation === "leap-week"). */
      leapWeekPeriodYears?: number;
    };

// ---------------------------------------------------------------------------
// Dial B — year-start reckoning (lunar families only)
// ---------------------------------------------------------------------------

export type YearReckoning =
  | { kind: "aviv" } // empirical (feed / manual); falls back to equinox when absent
  | { kind: "equinox" }; // computed: first month-start on/after the spring equinox

// ---------------------------------------------------------------------------
// Firstfruits / Wave Sheaf variant (Leviticus 23:11 "morrow after the Sabbath")
// ---------------------------------------------------------------------------

/**
 *  - fixed-16: rabbinic — Firstfruits is always Abib 16.
 *  - after-weekly-sabbath: Qumran / Karaite — the day after the weekly Sabbath
 *    that falls within Unleavened Bread (a Sunday).
 */
export type FirstfruitsRule = "fixed-16" | "after-weekly-sabbath";

// ---------------------------------------------------------------------------
// Manual override — the universal escape hatch
// ---------------------------------------------------------------------------

export type ManualOverride =
  | { kind: "monthStart"; startInstant: Date }
  | {
      kind: "fullDate";
      year: number;
      month: number;
      day: number;
      anchorInstant: Date;
    }
  /**
   * Orientation anchor — the universal "I am sure of ONE thing" escape hatch.
   * The user states that some Gregorian instant carries a known biblical
   * MONTH/DAY (a feast date, today's date, a sighted month-start, the new year);
   * the engine keeps its own computed YEAR and offset-propagates the rest. This
   * is `fullDate` with the year left to the engine, so every orientation in the
   * UI (feast / today / month-start / new-year) reduces to this one variant.
   */
  | {
      kind: "dateAnchor";
      month: number;
      day: number;
      anchorInstant: Date;
    };

// ---------------------------------------------------------------------------
// Top-level configuration
// ---------------------------------------------------------------------------

export interface CalendarConfig {
  month: MonthReckoning;
  /** Year dial — applies to the lunar families (conjunction/crescent). */
  year: YearReckoning;
  location: GeoLocation;
  /** Honored above every computed reckoning. */
  override?: ManualOverride;
  /** Which Firstfruits rule to use when emitting moedim. Default fixed-16. */
  firstfruits?: FirstfruitsRule;
  /** Emit the Qumran extra festivals (New Wine/Oil/Wood) for Enoch configs. */
  qumranFestivals?: boolean;
}

// ---------------------------------------------------------------------------
// Outputs
// ---------------------------------------------------------------------------

export interface BiblicalDate {
  /** Scheme-dependent year number (see each reckoning's docs). */
  year: number;
  /** 1-based month index (1 = Abib / first month). */
  month: number;
  /** 1-based day of month. */
  day: number;
  /** Optional traditional month name. */
  monthName?: string;
}

export interface PendingDetail {
  /** Candidate month-start if the crescent IS sighted this evening. */
  tonightIfSighted: Date;
  /** Candidate month-start if it is NOT (the following evening). */
  elseTomorrow: Date;
  /** Human explanation of why the state is unresolved. */
  reason: string;
}

export interface MonthStart {
  /** The sunset instant that began the current month. */
  startInstant: Date;
  status: "confirmed" | "pending";
  pending?: PendingDetail;
}

export interface YearStartInfo {
  startInstant: Date;
  /** True when an empirical year-start (aviv) was unavailable and we fell back. */
  assumed?: boolean;
}

export type MoedKind =
  | "passover"
  | "unleavened-bread"
  | "firstfruits"
  | "weeks"
  | "trumpets"
  | "atonement"
  | "tabernacles"
  | "shemini-atzeret"
  | "new-wine"
  | "new-oil"
  | "wood-offering";

export interface Moed {
  kind: MoedKind;
  name: string;
  /** Biblical month/day this appointed time begins. */
  month: number;
  day: number;
  /** Civil instant (sunset) the appointed time begins. */
  startInstant: Date;
  /** For multi-day feasts, the inclusive end day-of-month. */
  endDay?: number;
  /** True if this is a Qumran-extra (behind the qumranFestivals flag). */
  extra?: boolean;
}

export interface EngineResult {
  config: CalendarConfig;
  queryInstant: Date;
  biblicalDate: BiblicalDate;
  monthStart: MonthStart;
  yearStart?: YearStartInfo;
  moedim: Moed[];
  /** Honest caveats: assumed aviv, ignored year dial, manual override, etc. */
  notes: string[];
}
