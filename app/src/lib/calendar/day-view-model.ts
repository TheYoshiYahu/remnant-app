/**
 * day-view-model.ts — the v2 layer above the v1 view-model.
 *
 * Adds three things the v1 month grid didn't need, all pure and testable:
 *
 *   1. A BASE-LAYER toggle: one grid, but either the Gregorian month or the
 *      Hebrew month can "own" the structure, with the other layer overlaid.
 *      `buildLayerGrid(reck, focus, today, base)` returns a single LayerGrid
 *      shape the route renders the same way for both bases.
 *
 *   2. SUNSET geometry: biblical days run sunset→sunset, so each civil box is
 *      split by a sunset seam into a morning half and an evening half. Each
 *      LayerCell carries its exact sunset boundaries + a parity for the
 *      alternating diagonal half-shade, so a single biblical day's evening-half
 *      (one box) and morning-half (the next) read as one diagonal band — and the
 *      weekly Sabbath reads as one Friday-evening→Saturday-day band.
 *
 *   3. A comprehensive DAY DETAIL for the tap-through planner view.
 *
 * Everything here sits ON TOP of the engine (computeBiblicalDate) and the v1
 * view-model — no React, no I/O.
 */

import { computeBiblicalDate, type BiblicalDate, type EngineResult, type Moed } from "./index.ts";
import { moonIllumination, nextSunset, sunsetOnOrBefore } from "./astro.ts";
import {
  buildConfig,
  buildDeps,
  compute,
  fmtCivil,
  monthDisplayName,
  type ReckoningState,
} from "./view-model.ts";
import {
  eventsOnBiblicalDate,
  type BiblicalHistoryEvent,
} from "./biblical-history.ts";

const DAY_MS = 86_400_000;

export type BaseLayer = "gregorian" | "hebrew";

// ---------------------------------------------------------------------------
// Sunset geometry
// ---------------------------------------------------------------------------

export interface SunsetBoundaries {
  /** The sunset instant that OPENED this biblical day (the day's beginning). */
  opens: Date;
  /** The next sunset — when this biblical day ENDS and the next begins. */
  closes: Date;
}

/**
 * The sunset boundaries of the biblical day whose DAYTIME contains `daytime`.
 * `daytime` should be a midday-ish instant so `sunsetOnOrBefore` lands on the
 * previous evening's sunset (the day's start) and `nextSunset` on this evening's
 * (its end / the next day's start).
 */
export function sunsetBoundaries(daytime: Date, loc: ReckoningState["location"]): SunsetBoundaries {
  return {
    opens: sunsetOnOrBefore(daytime, loc),
    closes: nextSunset(daytime, loc),
  };
}


function illumAt(instant: Date): { illum: number; waxing: boolean } {
  const a = moonIllumination(instant);
  const b = moonIllumination(new Date(instant.getTime() + 3 * 3600 * 1000));
  return { illum: a, waxing: b >= a };
}

// ---------------------------------------------------------------------------
// The unified layer cell + grid
// ---------------------------------------------------------------------------

export interface LayerCell {
  key: string;
  /** Daytime biblical date of this box. */
  biblical: BiblicalDate;
  /** Midday instant of the box's daytime (a stable representative). */
  daytime: Date;
  /** 0=Sun … 6=Sat weekday of the box's daytime. */
  weekday: number;
  /** Sunset boundaries of the daytime biblical day. */
  sunset: SunsetBoundaries;
  /** Morning half belongs to the weekly Sabbath (Saturday daytime). */
  morningSabbath: boolean;
  /** Evening half opens the weekly Sabbath (Friday evening → the 7th day). */
  eveningSabbath: boolean;
  /** True when this box is outside the owning month (Gregorian-base fillers). */
  filler: boolean;
  /** True when this box is the query "today". */
  isToday: boolean;
  /**
   * Overlay flip marker. Gregorian-base: the biblical month changed at this box.
   * Hebrew-base: the Gregorian month changed at this box. Drives the seam tick.
   */
  overlayFlip: boolean;
  /** The overlaid secondary-layer label (Hebrew date, or Gregorian date). */
  overlayLabel: string;
  /** The primary owning-layer number to render large. */
  primaryLabel: string;
  illum: number;
  waxing: boolean;
  moedim: Moed[];
}

export interface LayerGrid {
  base: BaseLayer;
  /** Heading for the owning layer ("April 2026" or "Seventh Month · Year 5993"). */
  title: string;
  /** Sub-heading naming the overlaid layer span. */
  subtitle: string;
  cells: LayerCell[];
  /** Leading blanks so the first cell lands under its weekday column. */
  leadBlanks: number;
  /** Focus instants to page to the previous / next owning month. */
  prevFocus: Date;
  nextFocus: Date;
  result: EngineResult;
}

/**
 * Collect this reckoning's moedim across the year around `focus`, keyed by
 * biblical month → list. Mirrors the v1 view-model's union-of-three-queries so
 * feasts both behind and ahead of the focus resolve.
 */
function collectMoedim(s: ReckoningState, focus: Date): Map<number, Moed[]> {
  const byMonth = new Map<number, Moed[]>();
  const seen = new Set<string>();
  for (const off of [-190, 0, 190]) {
    const q = new Date(focus.getTime() + off * DAY_MS);
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
  return list.filter((m) => day >= m.day && day <= (m.endDay ?? m.day));
}

/** Short Gregorian overlay ("Apr 21") in UTC, matching the v1 cell overlay. */
function gregOverlay(d: Date): string {
  return new Intl.DateTimeFormat("en-US", {
    timeZone: "UTC",
    month: "short",
    day: "numeric",
  }).format(d);
}

/** Build a single cell from a midday instant. */
function makeCell(
  s: ReckoningState,
  daytime: Date,
  byMonth: Map<number, Moed[]>,
  today: { year: number; month: number; day: number } | null,
  base: BaseLayer,
  prevBiblicalMonth: number | null,
  prevGregMonth: number | null,
  filler: boolean,
): LayerCell {
  const r = computeBiblicalDate(daytime, buildConfig(s), buildDeps(s));
  const bd = r.biblicalDate;
  const weekday = daytime.getUTCDay();
  const sunset = sunsetBoundaries(daytime, s.location);
  const { illum, waxing } = illumAt(daytime);
  const isToday =
    !!today && today.year === bd.year && today.month === bd.month && today.day === bd.day;

  const overlayFlip =
    base === "gregorian"
      ? prevBiblicalMonth !== null && bd.month !== prevBiblicalMonth
      : prevGregMonth !== null && daytime.getUTCMonth() !== prevGregMonth;

  const overlayLabel =
    base === "gregorian"
      ? `${bd.day} · ${monthAbbrev(bd)}`
      : gregOverlay(daytime);
  const primaryLabel =
    base === "gregorian" ? String(daytime.getUTCDate()) : String(bd.day);

  return {
    key: `${base}-${daytime.getTime()}`,
    biblical: bd,
    daytime,
    weekday,
    sunset,
    morningSabbath: weekday === 6,
    eveningSabbath: weekday === 5,
    filler,
    isToday,
    overlayFlip,
    overlayLabel,
    primaryLabel,
    illum,
    waxing,
    moedim: moedimOnDay(byMonth, bd.month, bd.day),
  };
}

const MONTH_ABBR = [
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
  "XIII",
];
function monthAbbrev(bd: BiblicalDate): string {
  if (bd.monthName) return bd.monthName.split(" ")[0];
  return MONTH_ABBR[bd.month - 1] ?? `M${bd.month}`;
}

// ---------------------------------------------------------------------------
// Gregorian-base grid
// ---------------------------------------------------------------------------

function todayBiblical(s: ReckoningState, today: Date) {
  const bd = compute(s, today).biblicalDate;
  return { year: bd.year, month: bd.month, day: bd.day };
}

function buildGregorianGrid(s: ReckoningState, focus: Date, today: Date): LayerGrid {
  const year = focus.getUTCFullYear();
  const month = focus.getUTCMonth();
  const first = new Date(Date.UTC(year, month, 1, 12));
  const daysInMonth = new Date(Date.UTC(year, month + 1, 0)).getUTCDate();

  const byMonth = collectMoedim(s, first);
  const todayBd = todayBiblical(s, today);

  // Start on the Sunday on/before the 1st; end on the Saturday on/after the last.
  const firstWeekday = first.getUTCDay();
  const gridStart = new Date(Date.UTC(year, month, 1 - firstWeekday, 12));
  const last = new Date(Date.UTC(year, month, daysInMonth, 12));
  const trailing = 6 - last.getUTCDay();
  const totalDays = firstWeekday + daysInMonth + trailing;

  const cells: LayerCell[] = [];
  let prevBiblicalMonth: number | null = null;
  for (let i = 0; i < totalDays; i++) {
    const daytime = new Date(gridStart.getTime() + i * DAY_MS);
    const inMonth = daytime.getUTCMonth() === month;
    const cell = makeCell(
      s,
      daytime,
      byMonth,
      todayBd,
      "gregorian",
      prevBiblicalMonth,
      null,
      !inMonth,
    );
    prevBiblicalMonth = cell.biblical.month;
    cells.push(cell);
  }

  const titleFmt = new Intl.DateTimeFormat("en-US", {
    timeZone: "UTC",
    month: "long",
    year: "numeric",
  });
  // Biblical span across the month, for the subtitle.
  const firstBd = cells.find((c) => !c.filler)?.biblical;
  const lastBd = [...cells].reverse().find((c) => !c.filler)?.biblical;
  const subtitle =
    firstBd && lastBd
      ? `Overlaid: ${monthAbbrev(firstBd)} ${firstBd.day} – ${monthAbbrev(lastBd)} ${lastBd.day}, biblical`
      : "";

  return {
    base: "gregorian",
    title: titleFmt.format(first),
    subtitle,
    cells,
    leadBlanks: 0,
    prevFocus: new Date(Date.UTC(year, month - 1, 15, 12)),
    nextFocus: new Date(Date.UTC(year, month + 1, 15, 12)),
    result: compute(s, first),
  };
}

// ---------------------------------------------------------------------------
// Hebrew-base grid — the structure starts on the 1st of the biblical month,
// wherever it lands in the Gregorian week.
// ---------------------------------------------------------------------------

function buildHebrewGrid(s: ReckoningState, focus: Date, today: Date): LayerGrid {
  const result = compute(s, focus);
  const { year, month } = result.biblicalDate;
  const monthStart = result.monthStart.startInstant;
  const byMonth = collectMoedim(s, focus);
  const todayBd = todayBiblical(s, today);

  const cells: LayerCell[] = [];
  let prevGregMonth: number | null = null;
  for (let i = 0; i < 34; i++) {
    // Midday of the i-th biblical day: monthStart (a sunset) + (i + 0.5) days.
    const daytime = new Date(monthStart.getTime() + (i + 0.5) * DAY_MS);
    const bd = computeBiblicalDate(daytime, buildConfig(s), buildDeps(s)).biblicalDate;
    if (bd.year === year && bd.month === month) {
      if (cells.length && cells[cells.length - 1].biblical.day === bd.day) continue;
      const cell = makeCell(s, daytime, byMonth, todayBd, "hebrew", null, prevGregMonth, false);
      prevGregMonth = daytime.getUTCMonth();
      cells.push(cell);
    } else if (cells.length > 0) {
      break;
    }
  }

  const leadBlanks = cells.length ? cells[0].weekday : 0;
  const firstG = cells[0]?.daytime;
  const lastG = cells[cells.length - 1]?.daytime;
  const subtitle =
    firstG && lastG
      ? `Overlaid: ${gregOverlay(firstG)} – ${gregOverlay(lastG)}, Gregorian`
      : "";

  return {
    base: "hebrew",
    title: `${monthDisplayName(result)} · Year ${year}`,
    subtitle,
    cells,
    leadBlanks,
    prevFocus: new Date(monthStart.getTime() - 2 * DAY_MS),
    nextFocus: new Date(monthStart.getTime() + 33 * DAY_MS),
    result,
  };
}

export function buildLayerGrid(
  s: ReckoningState,
  focus: Date,
  today: Date,
  base: BaseLayer,
): LayerGrid {
  return base === "gregorian"
    ? buildGregorianGrid(s, focus, today)
    : buildHebrewGrid(s, focus, today);
}

// ---------------------------------------------------------------------------
// Day detail — the comprehensive planner day-view payload.
// ---------------------------------------------------------------------------

export interface DayDetail {
  biblical: BiblicalDate;
  /** Display name of the biblical month. */
  monthName: string;
  /** Full Gregorian date string ("Tuesday, April 21, 2026"). */
  gregorianFull: string;
  /** Exact local sunset that begins this biblical day. */
  opensAt: Date;
  /** Exact local sunset that ends it. */
  closesAt: Date;
  weekday: number;
  isSabbath: boolean;
  moedim: Moed[];
  history: BiblicalHistoryEvent[];
  illum: number;
  waxing: boolean;
}

/** Assemble the full day-view payload for a tapped cell. */
export function buildDayDetail(s: ReckoningState, cell: LayerCell): DayDetail {
  return {
    biblical: cell.biblical,
    monthName: monthDisplayName(
      computeBiblicalDate(cell.daytime, buildConfig(s), buildDeps(s)),
    ),
    gregorianFull: new Intl.DateTimeFormat("en-US", {
      timeZone: "UTC",
      weekday: "long",
      year: "numeric",
      month: "long",
      day: "numeric",
    }).format(cell.daytime),
    opensAt: cell.sunset.opens,
    closesAt: cell.sunset.closes,
    weekday: cell.weekday,
    isSabbath: cell.morningSabbath,
    moedim: cell.moedim,
    history: eventsOnBiblicalDate(cell.biblical.month, cell.biblical.day),
    illum: cell.illum,
    waxing: cell.waxing,
  };
}

/** "5:21 PM" exact local (Jerusalem) sunset time for the day-view. */
export function fmtSunsetClock(d: Date): string {
  return fmtCivil(d, { hour: "numeric", minute: "2-digit" });
}

/** "Tue · Apr 21, 5:21 PM" — sunset boundary with weekday + clock. */
export function fmtSunsetBoundary(d: Date): string {
  return fmtCivil(d, {
    weekday: "short",
    month: "short",
    day: "numeric",
    hour: "numeric",
    minute: "2-digit",
  });
}

// ---------------------------------------------------------------------------
// The Omer count — Leviticus 23:15-16, "count fifty days".
//
// The count runs from the wave-sheaf / Firstfruits day (day 1) to Shavuot /
// Weeks (day 50). Both anchors come from the engine's moedim for the ACTIVE
// reckoning, so the count shifts correctly when the reckoning changes (the
// lunar Sunday-within-Unleavened-Bread, Enoch's fixed 1/26, etc.). Outside the
// season this returns null and nothing is shown.
// ---------------------------------------------------------------------------

export interface OmerStatus {
  /** Day of the count, 1..50 (50 = Shavuot itself). */
  day: number;
  /** Completed weeks of the count. */
  weeks: number;
  /** Days into the current week (0..6). */
  daysInWeek: number;
  /** "4 weeks and 5 days" — the traditional breakdown. */
  breakdown: string;
  /** True on day 50 — Shavuot, the Feast of Weeks crowns the count. */
  isShavuot: boolean;
}

function omerBreakdown(weeks: number, daysInWeek: number): string {
  const parts: string[] = [];
  if (weeks > 0) parts.push(`${weeks} ${weeks === 1 ? "week" : "weeks"}`);
  if (daysInWeek > 0) parts.push(`${daysInWeek} ${daysInWeek === 1 ? "day" : "days"}`);
  if (parts.length === 0) return "the first day";
  return parts.join(" and ");
}

/**
 * The current Omer day for `now` under reckoning `s`, or null outside the count
 * season. We anchor a query ~55 days before `now` so this cycle's Firstfruits
 * and Weeks both resolve as upcoming moedim (Firstfruits → Weeks is ~49 days),
 * then count sunset-aligned days from the wave-sheaf instant (day 1).
 */
export function computeOmer(s: ReckoningState, now: Date): OmerStatus | null {
  const anchor = new Date(now.getTime() - 55 * DAY_MS);
  const moedim = compute(s, anchor).moedim;
  const firstfruits = moedim.find((m) => m.kind === "firstfruits");
  const weeks = moedim.find((m) => m.kind === "weeks");
  if (!firstfruits || !weeks) return null;

  const start = firstfruits.startInstant.getTime();
  const shavuot = weeks.startInstant.getTime();
  const t = now.getTime();
  // Show from the wave-sheaf evening through the end of the Shavuot day.
  if (t < start || t >= shavuot + DAY_MS) return null;

  const day = Math.floor((t - start) / DAY_MS) + 1; // day 1 on the wave-sheaf day
  const weeksN = Math.floor(day / 7);
  const daysInWeek = day % 7;
  return {
    day,
    weeks: weeksN,
    daysInWeek,
    breakdown: omerBreakdown(weeksN, daysInWeek),
    isShavuot: t >= shavuot,
  };
}
