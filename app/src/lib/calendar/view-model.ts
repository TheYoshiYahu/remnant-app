/**
 * view-model.ts — pure presentation helpers for the EPIC calendar view.
 *
 * Sits ON TOP of the engine (computeBiblicalDate + the lower-level building
 * blocks). No React, no I/O — every function here is pure and testable, so the
 * route component (routes/Calendar.tsx) stays a thin render layer over this.
 *
 * The engine answers "what biblical date is this instant?"; this module turns
 * that into the things a UI needs: a month grid, the moon rendered as art, the
 * Leviticus-23 color theology, a live countdown, and the side-by-side
 * compare-reckonings table that is the showpiece.
 */

import {
  computeBiblicalDate,
  manualSightingFeed,
  JERUSALEM,
  type CalendarConfig,
  type CalendarDeps,
  type CrescentCriterion,
  type CrescentMode,
  type EngineResult,
  type EnochIntercalation,
  type FirstfruitsRule,
  type GeoLocation,
  type ManualOverride,
  type Moed,
  type MoedKind,
  type YearReckoning,
} from "./index.ts";
import { moonIllumination } from "./astro.ts";

const DAY_MS = 86_400_000;

// ---------------------------------------------------------------------------
// The reckoning state — a flat, UI-friendly shape the controls bind to.
// `buildConfig` projects it down into the engine's CalendarConfig union.
// ---------------------------------------------------------------------------

export type MonthKind = "conjunction" | "crescent" | "rabbinic" | "enoch";

// ---------------------------------------------------------------------------
// Orientation — the manual "I am sure of ONE thing" anchor menu. The user
// supplies a single fact and the engine derives the rest. Every functional
// mode collapses to a biblical MONTH/DAY pinned to a Gregorian instant — i.e.
// the engine's `dateAnchor` override (year left to the engine).
// ---------------------------------------------------------------------------

/** Fixed-date feasts a user can anchor against (rule-independent month/day). */
export type FeastKey =
  | "passover"
  | "unleavened-bread"
  | "trumpets"
  | "atonement"
  | "tabernacles";

export interface FeastAnchorDef {
  key: FeastKey;
  label: string;
  /** Biblical month/day this feast always falls on. */
  month: number;
  day: number;
}

export const FEAST_ANCHORS: FeastAnchorDef[] = [
  { key: "passover", label: "Passover", month: 1, day: 14 },
  { key: "unleavened-bread", label: "Unleavened Bread", month: 1, day: 15 },
  { key: "trumpets", label: "Trumpets", month: 7, day: 1 },
  { key: "atonement", label: "Atonement", month: 7, day: 10 },
  { key: "tabernacles", label: "Tabernacles", month: 7, day: 15 },
];

/**
 * Orientation override. `greg` is an ISO `YYYY-MM-DD` Gregorian date (the one
 * fact the user is sure of); for the `today` mode it is captured at the moment
 * the user declares it. `source` is the stubbed "inherit a published calendar"
 * slot — selectable, but not yet functional (it applies no override).
 */
export type Orientation =
  | { mode: "feast"; feast: FeastKey; greg: string }
  | { mode: "today"; month: number; day: number; greg: string }
  | { mode: "monthStart"; month: number; greg: string }
  | { mode: "newYear"; greg: string }
  | { mode: "source" };

export interface ReckoningState {
  month: MonthKind;
  /** crescent-only */
  criterion: CrescentCriterion;
  /** crescent-only */
  crescentMode: CrescentMode;
  /** lunar-only */
  year: YearReckoning["kind"];
  /** enoch-only */
  enochIntercalation: EnochIntercalation;
  qumranFestivals: boolean;
  firstfruits: FirstfruitsRule;
  location: GeoLocation;
  /** manual orientation anchor (the universal escape hatch). */
  orientation?: Orientation;
  /** evenings the partner has tapped "I sighted it" (local-confirm). */
  confirmedSightings: Date[];
}

/** Midday instant of an ISO `YYYY-MM-DD` — a stable daytime anchor for the day. */
export function anchorInstantFromGreg(greg: string): Date {
  return new Date(`${greg}T12:00:00Z`);
}

/**
 * Project an orientation onto the engine's override. Every functional mode is a
 * biblical month/day pinned to a Gregorian instant → a `dateAnchor`. The
 * `source` stub (and any malformed date) yields no override.
 */
export function orientationToOverride(o: Orientation): ManualOverride | undefined {
  if (o.mode === "source") return undefined;
  const greg = o.greg;
  if (!greg || !/^\d{4}-\d{2}-\d{2}$/.test(greg)) return undefined;
  const anchorInstant = anchorInstantFromGreg(greg);
  switch (o.mode) {
    case "feast": {
      const def = FEAST_ANCHORS.find((f) => f.key === o.feast);
      if (!def) return undefined;
      return { kind: "dateAnchor", month: def.month, day: def.day, anchorInstant };
    }
    case "today":
      return { kind: "dateAnchor", month: o.month, day: o.day, anchorInstant };
    case "monthStart":
      return { kind: "dateAnchor", month: o.month, day: 1, anchorInstant };
    case "newYear":
      return { kind: "dateAnchor", month: 1, day: 1, anchorInstant };
  }
}

export const DEFAULT_RECKONING: ReckoningState = {
  month: "crescent",
  criterion: "odeh",
  crescentMode: "local-confirm",
  year: "equinox",
  enochIntercalation: "equinox-reanchor",
  qumranFestivals: false,
  firstfruits: "fixed-16",
  location: JERUSALEM,
  confirmedSightings: [],
};

export function buildConfig(s: ReckoningState): CalendarConfig {
  let month: CalendarConfig["month"];
  switch (s.month) {
    case "conjunction":
      month = { kind: "conjunction" };
      break;
    case "crescent":
      month = { kind: "crescent", criterion: s.criterion, mode: s.crescentMode };
      break;
    case "rabbinic":
      month = { kind: "rabbinic" };
      break;
    case "enoch":
      month = { kind: "enoch", intercalation: s.enochIntercalation };
      break;
  }
  const cfg: CalendarConfig = {
    month,
    year: { kind: s.year } as YearReckoning,
    location: s.location,
    firstfruits: s.firstfruits,
    qumranFestivals: s.qumranFestivals,
  };
  if (s.orientation) {
    const override = orientationToOverride(s.orientation);
    if (override) cfg.override = override;
  }
  return cfg;
}

export function buildDeps(s: ReckoningState): CalendarDeps {
  if (s.confirmedSightings.length === 0) return {};
  return { sightingFeed: manualSightingFeed(s.confirmedSightings) };
}

export function compute(s: ReckoningState, at: Date): EngineResult {
  return computeBiblicalDate(at, buildConfig(s), buildDeps(s));
}

// ---------------------------------------------------------------------------
// Month names (the engine supplies monthName for rabbinic + Enoch; for the
// lunar families it leaves it blank, so we name the ordinal months here).
// ---------------------------------------------------------------------------

const ORDINAL_MONTHS = [
  "First Month (Abib)",
  "Second Month",
  "Third Month",
  "Fourth Month",
  "Fifth Month",
  "Sixth Month",
  "Seventh Month (Ethanim)",
  "Eighth Month",
  "Ninth Month",
  "Tenth Month",
  "Eleventh Month",
  "Twelfth Month",
  "Thirteenth Month (Adar II)",
];

export function monthDisplayName(r: EngineResult): string {
  const bd = r.biblicalDate;
  if (bd.monthName) return bd.monthName;
  return ORDINAL_MONTHS[bd.month - 1] ?? `Month ${bd.month}`;
}

// ---------------------------------------------------------------------------
// The month grid.
// ---------------------------------------------------------------------------

export interface DayCell {
  /** Biblical day-of-month (1-based). */
  day: number;
  /** Midpoint instant of the biblical day (≈ its daytime). */
  civil: Date;
  /** 0=Sun … 6=Sat — weekday of the daytime Gregorian date. */
  weekday: number;
  /** Illuminated fraction of the moon at the day's midpoint, 0..1. */
  illum: number;
  /** True if the moon is waxing at the day's midpoint. */
  waxing: boolean;
  /** Weekly Sabbath (the seventh day). */
  isSabbath: boolean;
  /** Today (the query day). */
  isToday: boolean;
  /** Moedim that fall on this day (start day or within a multi-day span). */
  moedim: Moed[];
}

export interface MonthGrid {
  year: number;
  month: number;
  monthName: string;
  cells: DayCell[];
  /** Leading blank count so day 1 lands under its weekday column. */
  leadBlanks: number;
  /** The sunset instant that opened the month. */
  monthStart: Date;
  result: EngineResult;
}

function illumAt(instant: Date): { illum: number; waxing: boolean } {
  const a = moonIllumination(instant);
  const b = moonIllumination(new Date(instant.getTime() + 3 * 3600 * 1000));
  return { illum: a, waxing: b >= a };
}

/**
 * Collect this reckoning's moedim that touch the focused biblical year, keyed
 * by month. The engine returns only *upcoming* moedim from a query instant, so
 * we union three queries spanning the year (≈ −190d / focus / +190d) to catch
 * feasts that already passed this cycle as well as the ones ahead.
 */
function collectMoedim(s: ReckoningState, focus: Date): Map<number, Moed[]> {
  const byMonth = new Map<number, Moed[]>();
  const seen = new Set<string>();
  const queries = [-190, 0, 190].map(
    (off) => new Date(focus.getTime() + off * DAY_MS),
  );
  for (const q of queries) {
    for (const m of compute(s, q).moedim) {
      const key = `${m.kind}:${m.month}/${m.day}`;
      if (seen.has(key)) continue;
      seen.add(key);
      const list = byMonth.get(m.month) ?? [];
      list.push(m);
      byMonth.set(m.month, list);
    }
  }
  return byMonth;
}

function moedimOnDay(byMonth: Map<number, Moed[]>, month: number, day: number): Moed[] {
  const list = byMonth.get(month);
  if (!list) return [];
  return list.filter((m) => {
    const end = m.endDay ?? m.day;
    return day >= m.day && day <= end;
  });
}

/**
 * Build the grid for the biblical month that contains `focus`. Robust across
 * every reckoning (lunar 29/30, Enoch 30/31): we anchor on the month-start
 * sunset and sample each biblical day at its midpoint, which maps 1:1 to a
 * day-of-month because biblical days are ~24h sunset→sunset.
 */
export function buildMonthGrid(s: ReckoningState, focus: Date, today: Date): MonthGrid {
  const result = compute(s, focus);
  const { year, month } = result.biblicalDate;
  const monthStart = result.monthStart.startInstant;
  const byMonth = collectMoedim(s, focus);

  const todayRes = compute(s, today);
  const isTodayMonth =
    todayRes.biblicalDate.year === year && todayRes.biblicalDate.month === month;
  const todayDay = isTodayMonth ? todayRes.biblicalDate.day : -1;

  const cells: DayCell[] = [];
  for (let i = 0; i < 34; i++) {
    const civil = new Date(monthStart.getTime() + (i + 0.5) * DAY_MS);
    const r = computeBiblicalDate(civil, buildConfig(s), buildDeps(s));
    const bd = r.biblicalDate;
    if (bd.year === year && bd.month === month) {
      // Guard against an accidental duplicate day at a boundary sample.
      if (cells.length && cells[cells.length - 1].day === bd.day) continue;
      const { illum, waxing } = illumAt(civil);
      const weekday = civil.getUTCDay();
      cells.push({
        day: bd.day,
        civil,
        weekday,
        illum,
        waxing,
        isSabbath: weekday === 6,
        isToday: bd.day === todayDay,
        moedim: moedimOnDay(byMonth, month, bd.day),
      });
    } else if (cells.length > 0) {
      break; // rolled into the next month
    }
  }

  const leadBlanks = cells.length ? cells[0].weekday : 0;
  return {
    year,
    month,
    monthName: monthDisplayName(result),
    cells,
    leadBlanks,
    monthStart,
    result,
  };
}

/** Step the focus instant to the next / previous biblical month, robustly. */
export function nextMonthFocus(grid: MonthGrid): Date {
  // monthStart + 33 days is guaranteed inside the following month (max len 31).
  return new Date(grid.monthStart.getTime() + 33 * DAY_MS);
}
export function prevMonthFocus(grid: MonthGrid): Date {
  // 2 days before this month's start lands inside the previous month.
  return new Date(grid.monthStart.getTime() - 2 * DAY_MS);
}

// ---------------------------------------------------------------------------
// Moedim — the Leviticus 23 color theology. Carries the app's binary:
// ARGAMAN (purple) = judgment/curse, EMERALD = blessing/hope. Purple marks
// ONLY the judgment feast (the Day of Atonement — the affliction of soul);
// every harvest/ingathering feast carries emerald (blessing). The remaining
// registers are the app's established accents:
//   emerald  — blessing / hope (Firstfruits, Tabernacles, New Wine)
//   gold     — priestly register (Unleavened Bread, Trumpets, New Oil)
//   scarlet  — blood / atonement memorial (Passover lamb)
//   argaman  — JUDGMENT (Day of Atonement) — purple, and purple alone, here
//   techelet — divine outpouring (Weeks/Shavuot, the eighth day)
//   bronze   — the altar fire (Wood Offering)
// All hexes below are the exact chrome-metal register values from index.css.
// ---------------------------------------------------------------------------

export type MoedRegister =
  | "emerald"
  | "gold"
  | "scarlet"
  | "argaman"
  | "techelet"
  | "bronze";

export interface MoedTheme {
  register: MoedRegister;
  /** Bright pale tone for glowing text/borders on the black surface. */
  glow: string;
  /** Deep tone for the cell wash. */
  deep: string;
}

const REGISTER_TONE: Record<MoedRegister, { glow: string; deep: string }> = {
  emerald: { glow: "#2EFFA1", deep: "#04321E" },
  gold: { glow: "#FCECAF", deep: "#645028" },
  scarlet: { glow: "#FFBFC5", deep: "#3A0F12" },
  argaman: { glow: "#D4B0E0", deep: "#3D1B5C" },
  techelet: { glow: "#93C0FF", deep: "#0A2D84" },
  bronze: { glow: "#E8B98C", deep: "#3D2418" },
};

const MOED_REGISTER: Record<MoedKind, MoedRegister> = {
  passover: "scarlet",
  "unleavened-bread": "gold",
  firstfruits: "emerald",
  weeks: "techelet",
  trumpets: "gold",
  atonement: "argaman",
  tabernacles: "emerald",
  "shemini-atzeret": "techelet",
  "new-wine": "emerald", // a harvest blessing — NOT judgment, so never purple
  "new-oil": "gold",
  "wood-offering": "bronze",
};

export function moedTheme(kind: MoedKind): MoedTheme {
  const register = MOED_REGISTER[kind];
  return { register, ...REGISTER_TONE[register] };
}

/** Short label for a tight calendar cell. */
export const MOED_SHORT: Record<MoedKind, string> = {
  passover: "Pesach",
  "unleavened-bread": "Matzot",
  firstfruits: "Bikkurim",
  weeks: "Shavuot",
  trumpets: "Yom Teruah",
  atonement: "Yom Kippur",
  tabernacles: "Sukkot",
  "shemini-atzeret": "Shemini",
  "new-wine": "New Wine",
  "new-oil": "New Oil",
  "wood-offering": "Wood",
};

// ---------------------------------------------------------------------------
// Moon rendered as art — an SVG path for the lit region of the disk.
// ---------------------------------------------------------------------------

/**
 * SVG path (in a centred coordinate box of radius r) for the illuminated part
 * of the lunar disk. Waxing lights the right limb; a transform mirrors it for
 * waning. Derivation in CALENDAR_DESIGN-adjacent notes: the terminator is a
 * half-ellipse whose signed horizontal semi-axis is r·(1−2·illum).
 */
export function moonLitPath(r: number, illum: number): string {
  const clamped = Math.max(0, Math.min(1, illum));
  const b = r * (1 - 2 * clamped); // signed terminator semi-axis
  const termSweep = b >= 0 ? 0 : 1; // crescent bulges right, gibbous bulges left
  return [
    `M 0 ${-r}`,
    `A ${r} ${r} 0 0 1 0 ${r}`, // bright right limb (top→bottom through +x)
    `A ${Math.abs(b).toFixed(3)} ${r} 0 0 ${termSweep} 0 ${-r}`, // terminator back up
    "Z",
  ].join(" ");
}

export interface MoonArt {
  illum: number;
  waxing: boolean;
  litPath: string;
  /** Human phase label. */
  phase: string;
}

export function moonArt(instant: Date, r = 50): MoonArt {
  const { illum, waxing } = illumAt(instant);
  return {
    illum,
    waxing,
    litPath: moonLitPath(r, illum),
    phase: phaseName(illum, waxing),
  };
}

function phaseName(illum: number, waxing: boolean): string {
  if (illum < 0.03) return "New Moon (dark)";
  if (illum > 0.97) return "Full Moon";
  if (Math.abs(illum - 0.5) < 0.06) return waxing ? "First Quarter" : "Last Quarter";
  if (illum < 0.5) return waxing ? "Waxing Crescent" : "Waning Crescent";
  return waxing ? "Waxing Gibbous" : "Waning Gibbous";
}

// ---------------------------------------------------------------------------
// Live countdown.
// ---------------------------------------------------------------------------

export interface Countdown {
  days: number;
  hours: number;
  minutes: number;
  seconds: number;
  total: number;
}

export function countdownTo(target: Date, now: Date): Countdown {
  let total = Math.max(0, target.getTime() - now.getTime());
  const days = Math.floor(total / DAY_MS);
  total -= days * DAY_MS;
  const hours = Math.floor(total / 3_600_000);
  total -= hours * 3_600_000;
  const minutes = Math.floor(total / 60_000);
  total -= minutes * 60_000;
  const seconds = Math.floor(total / 1000);
  return { days, hours, minutes, seconds, total: target.getTime() - now.getTime() };
}

// ---------------------------------------------------------------------------
// Sabbath status for the hero panel.
// ---------------------------------------------------------------------------

export interface SabbathStatus {
  /** True if `now` is within a weekly Sabbath (Fri sunset → Sat sunset, approx). */
  active: boolean;
  label: string;
}

/**
 * A light-touch weekly-Sabbath read off the day cell's weekday. Precise sunset
 * boundaries live in the engine; for the hero badge we report the seventh-day
 * status of the current biblical day.
 */
export function sabbathStatus(todayCell: DayCell | undefined): SabbathStatus {
  if (todayCell?.isSabbath) {
    return { active: true, label: "Sabbath — the seventh day. Rest." };
  }
  return { active: false, label: "A working day" };
}

// ---------------------------------------------------------------------------
// Formatting — Jerusalem-local civil dates (sunset instants are precise; we
// localise only for display).
// ---------------------------------------------------------------------------

const JLM_TZ = "Asia/Jerusalem";

export function fmtCivil(d: Date, opts?: Intl.DateTimeFormatOptions): string {
  return new Intl.DateTimeFormat("en-US", {
    timeZone: JLM_TZ,
    ...opts,
  }).format(d);
}

/** "Tue · Apr 21" for a sunset instant — the evening that opens the day. */
export function fmtEvening(d: Date): string {
  return fmtCivil(d, { weekday: "short", month: "short", day: "numeric" });
}

/** Small Gregorian overlay for a grid cell: "Apr 21". */
export function fmtOverlay(d: Date): string {
  return new Intl.DateTimeFormat("en-US", {
    timeZone: "UTC",
    month: "short",
    day: "numeric",
  }).format(d);
}

export function fmtFull(d: Date): string {
  return fmtCivil(d, {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
  });
}

// ---------------------------------------------------------------------------
// COMPARE RECKONINGS — the showpiece.
// ---------------------------------------------------------------------------

export interface CompareColumn {
  key: MonthKind;
  label: string;
  sublabel: string;
  /** the chrome-metal register class suffix for the column header. */
  register: string;
}

export const COMPARE_COLUMNS: CompareColumn[] = [
  { key: "conjunction", label: "Dark Moon", sublabel: "conjunction", register: "techelet" },
  { key: "crescent", label: "First Crescent", sublabel: "sighted", register: "gold" },
  { key: "rabbinic", label: "Rabbinic", sublabel: "calculated", register: "argaman" },
  { key: "enoch", label: "Enoch", sublabel: "364-day", register: "emerald" },
];

/** The seven Leviticus-23 feasts, in liturgical order, for the compare grid. */
const COMPARE_FEASTS: MoedKind[] = [
  "passover",
  "unleavened-bread",
  "firstfruits",
  "weeks",
  "trumpets",
  "atonement",
  "tabernacles",
];

export interface CompareCell {
  /** sunset instant the feast begins under this reckoning, or null if absent. */
  instant: Date | null;
  label: string;
}

export interface CompareRow {
  kind: MoedKind;
  name: string;
  cells: Record<MonthKind, CompareCell>;
  /** True when the reckonings disagree on the civil date (the jaw-dropper). */
  divergent: boolean;
}

export interface CompareResult {
  rows: CompareRow[];
  /** The Gregorian year the next feast cycle opens in (for the header). */
  cycleYear: number;
}

function feastConfig(base: ReckoningState, key: MonthKind): ReckoningState {
  return { ...base, month: key };
}

/**
 * For each feast, where it lands under each reckoning across the SAME upcoming
 * cycle, side by side. We first find the next Passover under every column, then
 * anchor a single query just before the earliest of them so all seven feasts of
 * that one biblical year resolve as "upcoming" in every column — the rows line
 * up on one coherent cycle rather than mixing this year's autumn with next
 * year's spring.
 */
export function buildCompare(base: ReckoningState, now: Date): CompareResult {
  // 1. Next Passover per column, to locate the shared cycle.
  let earliestPassover = Infinity;
  for (const col of COMPARE_COLUMNS) {
    const res = compute(feastConfig(base, col.key), now);
    const p = res.moedim.find((m) => m.kind === "passover");
    if (p) earliestPassover = Math.min(earliestPassover, p.startInstant.getTime());
  }
  // 2. Anchor ~5 weeks before the earliest Passover so the whole cycle is ahead.
  const anchor =
    earliestPassover === Infinity
      ? now
      : new Date(earliestPassover - 35 * DAY_MS);

  const perColumn = new Map<MonthKind, Map<MoedKind, Moed>>();
  for (const col of COMPARE_COLUMNS) {
    const res = compute(feastConfig(base, col.key), anchor);
    const firstOf = new Map<MoedKind, Moed>();
    for (const m of res.moedim) {
      if (!firstOf.has(m.kind)) firstOf.set(m.kind, m);
    }
    perColumn.set(col.key, firstOf);
  }

  const niceName: Partial<Record<MoedKind, string>> = {
    passover: "Passover",
    "unleavened-bread": "Unleavened Bread",
    firstfruits: "Firstfruits",
    weeks: "Weeks (Shavuot)",
    trumpets: "Trumpets",
    atonement: "Atonement",
    tabernacles: "Tabernacles",
  };

  const rows = COMPARE_FEASTS.map((kind): CompareRow => {
    const cells = {} as Record<MonthKind, CompareCell>;
    const dayKeys = new Set<string>();
    for (const col of COMPARE_COLUMNS) {
      const m = perColumn.get(col.key)?.get(kind) ?? null;
      if (m) {
        cells[col.key] = { instant: m.startInstant, label: fmtEvening(m.startInstant) };
        dayKeys.add(fmtCivil(m.startInstant, { year: "numeric", month: "2-digit", day: "2-digit" }));
      } else {
        cells[col.key] = { instant: null, label: "—" };
      }
    }
    return {
      kind,
      name: niceName[kind] ?? kind,
      cells,
      divergent: dayKeys.size > 1,
    };
  });

  const cycleYear =
    earliestPassover === Infinity
      ? new Date(now).getUTCFullYear()
      : Number(fmtCivil(new Date(earliestPassover), { year: "numeric" }));

  return { rows, cycleYear };
}
