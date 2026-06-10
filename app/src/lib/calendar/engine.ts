/**
 * engine.ts — the top-level orchestrator.
 *
 * `computeBiblicalDate(date, config, deps?)` is the single public entry point:
 * a pure function that, given an instant and a calendar configuration, returns
 * the current biblical Y/M/D, the current month-start (with a confirmed/pending
 * flag), the year-start, and the upcoming moedim. Empirical inputs (sightings,
 * aviv) arrive via injected `deps`; with none, the engine reports honestly
 * (pending / assumed) rather than fabricating.
 */

import type {
  BiblicalDate,
  CalendarConfig,
  EngineResult,
  FirstfruitsRule,
  GeoLocation,
  MonthStart,
} from "./types.ts";
import { type CalendarDeps, NULL_AVIV_FEED, NULL_SIGHTING_FEED } from "./feeds.ts";
import {
  addBiblicalDays,
  biblicalDayNumber,
  currentBiblicalRD,
  rdToStartInstant,
  subBiblicalDays,
} from "./time.ts";
import { conjunctionOnOrBefore } from "./astro.ts";
import { predictFirstCrescent } from "./crescent.ts";
import {
  type Lunation,
  type MonthStartFn,
  type YearStart,
  advanceLunations,
  currentLunation,
  locateYearStart,
  monthIndexOf,
  monthStartFnFor,
  resolveYearStart,
} from "./lunar.ts";
import {
  hebrewMonthName,
  hebrewToRD,
  rdToHebrew,
  weekdayOfRD,
} from "./molad.ts";
import {
  type EnochConfig,
  enochDateFromRD,
  enochDayOfYear,
  enochMonthName,
} from "./enoch.ts";
import { buildMoedimForYear, upcomingMoedim } from "./moedim.ts";

export function computeBiblicalDate(
  date: Date,
  config: CalendarConfig,
  deps: CalendarDeps = {},
): EngineResult {
  if (config.override) return applyOverride(date, config, deps);
  return computeCore(date, config, deps);
}

// ---------------------------------------------------------------------------
// Core dispatch (no override)
// ---------------------------------------------------------------------------

function computeCore(
  date: Date,
  config: CalendarConfig,
  deps: CalendarDeps,
): EngineResult {
  switch (config.month.kind) {
    case "conjunction":
    case "crescent":
      return computeLunar(date, config, deps);
    case "rabbinic":
      return computeRabbinic(date, config);
    case "enoch":
      return computeEnoch(date, config);
  }
}

// ---------------------------------------------------------------------------
// Lunar families (conjunction & crescent)
// ---------------------------------------------------------------------------

function computeLunar(
  query: Date,
  config: CalendarConfig,
  deps: CalendarDeps,
): EngineResult {
  const loc = config.location;
  const notes: string[] = [];
  const msFn = monthStartFnFor(config, loc);
  const avivFeed = deps.avivFeed ?? NULL_AVIV_FEED;
  const avivDeclared = (gy: number) => avivFeed.declaredAbibNewMoon(gy, loc);

  let lun: Lunation;
  let monthStart: MonthStart;
  // The instant from which the day-of-month is counted (may differ from the
  // reported best-estimate start when a crescent month is pending).
  let countStart: Date;

  if (config.month.kind === "crescent") {
    // Decide month membership by the EARLIEST possible start: in the pending
    // window the new month may already have begun (if the borderline crescent
    // was sighted), so we must not under-count.
    let conj = conjunctionOnOrBefore(query);
    monthStart = crescentMonthStart(conj, config, deps, loc);
    let earliest = earliestPossibleStart(monthStart);
    if (earliest.getTime() > query.getTime()) {
      // The new month cannot have begun yet — we are in the previous month.
      conj = conjunctionOnOrBefore(new Date(conj.getTime() - 1000));
      monthStart = crescentMonthStart(conj, config, deps, loc);
      earliest = earliestPossibleStart(monthStart);
    }
    lun = { conjunction: conj, start: msFn(conj) };
    countStart =
      monthStart.startInstant.getTime() <= query.getTime()
        ? monthStart.startInstant
        : earliest;
  } else {
    lun = currentLunation(query, msFn);
    monthStart = { startInstant: lun.start, status: "confirmed" };
    countStart = lun.start;
  }

  const yearStart = locateYearStart(lun.start, msFn, config.year, avivDeclared);
  if (yearStart.assumed) {
    notes.push(
      "Year-start uses the spring equinox as a stand-in: no aviv/barley report was available (set one via the aviv feed or a manual override).",
    );
  }
  const monthIndex = monthIndexOf(yearStart, lun, msFn);
  const day = biblicalDayNumber(countStart, query, loc);

  const biblicalDate: BiblicalDate = {
    year: yearStart.gregYear,
    month: monthIndex,
    day,
  };

  // Moedim across the prior/current/next biblical years.
  const ffRule: FirstfruitsRule = config.firstfruits ?? "fixed-16";
  const allMoedim = [yearStart.gregYear - 1, yearStart.gregYear, yearStart.gregYear + 1]
    .map((gy) => resolveYearStart(gy, msFn, config.year, avivDeclared))
    .flatMap((ys) =>
      buildMoedimForYear({
        resolve: (m, d) => lunarResolve(ys, m, d, msFn, loc),
        daytimeWeekday: (m, d) => daytimeWeekdayOf(lunarResolve(ys, m, d, msFn, loc)),
        labelOf: (instant) =>
          lunarLabel(instant, msFn, config, avivDeclared, loc),
        firstfruitsRule: ffRule,
        includeQumran: false,
        loc,
      }),
    );

  return {
    config,
    queryInstant: query,
    biblicalDate,
    monthStart,
    yearStart: { startInstant: yearStart.start, assumed: yearStart.assumed },
    moedim: upcomingMoedim(allMoedim, query),
    notes,
  };
}

/** Earliest the month could have begun (the "if sighted" branch when pending). */
function earliestPossibleStart(ms: MonthStart): Date {
  return ms.pending ? ms.pending.tonightIfSighted : ms.startInstant;
}

function crescentMonthStart(
  conjunction: Date,
  config: CalendarConfig,
  deps: CalendarDeps,
  loc: GeoLocation,
): MonthStart {
  if (config.month.kind !== "crescent") throw new Error("not crescent");
  const pred = predictFirstCrescent(conjunction, loc, config.month.criterion);
  const mode = config.month.mode;

  // No borderline night, or "predicted" mode → self-resolving.
  if (mode === "predicted" || !pred.marginalEvening) {
    return { startInstant: pred.firstVisibleEvening, status: "confirmed" };
  }

  const feed = deps.sightingFeed ?? NULL_SIGHTING_FEED;
  const report = feed.wasSighted(pred.marginalEvening, loc);
  if (report === "sighted") {
    return { startInstant: pred.marginalEvening, status: "confirmed" };
  }
  if (report === "not-sighted") {
    return { startInstant: pred.firstVisibleEvening, status: "confirmed" };
  }
  // Unknown — surface the honest ambiguity.
  return {
    startInstant: pred.firstVisibleEvening,
    status: "pending",
    pending: {
      tonightIfSighted: pred.marginalEvening,
      elseTomorrow: pred.firstVisibleEvening,
      reason:
        "Borderline crescent: the month begins the prior evening IF the crescent is sighted, else the next evening. Awaiting a sighting report.",
    },
  };
}

function lunarResolve(
  ys: YearStart,
  month: number,
  day: number,
  msFn: MonthStartFn,
  loc: GeoLocation,
): Date {
  const lun: Lunation = { conjunction: ys.conjunction, start: ys.start };
  const monthStart = advanceLunations(lun, month - 1, msFn).start;
  return addBiblicalDays(monthStart, day - 1, loc);
}

function lunarLabel(
  instant: Date,
  msFn: MonthStartFn,
  config: CalendarConfig,
  avivDeclared: (gy: number) => Date | null,
  loc: GeoLocation,
): { month: number; day: number } {
  const lun = currentLunation(instant, msFn);
  const ys = locateYearStart(lun.start, msFn, config.year, avivDeclared);
  return {
    month: monthIndexOf(ys, lun, msFn),
    day: biblicalDayNumber(lun.start, instant, loc),
  };
}

/** Daytime weekday (0 = Sunday) of the biblical day that opens at `startSunset`. */
function daytimeWeekdayOf(startSunset: Date): number {
  return (startSunset.getUTCDay() + 1) % 7;
}

// ---------------------------------------------------------------------------
// Rabbinic (fixed Hebrew calendar)
// ---------------------------------------------------------------------------

function computeRabbinic(query: Date, config: CalendarConfig): EngineResult {
  const loc = config.location;
  const notes: string[] = [
    "Rabbinic reckoning defines its own year-start (Nisan/Tishrei); the year dial is not applied.",
  ];
  const rd = currentBiblicalRD(query, loc);
  const heb = rdToHebrew(rd);
  const monthStartRD = hebrewToRD(heb.year, heb.month, 1);

  const biblicalDate: BiblicalDate = {
    year: heb.year,
    month: heb.month,
    day: heb.day,
    monthName: hebrewMonthName(heb.month, heb.year),
  };
  const monthStart: MonthStart = {
    startInstant: rdToStartInstant(monthStartRD, loc),
    status: "confirmed",
  };

  const ffRule: FirstfruitsRule = config.firstfruits ?? "fixed-16";
  // springAM = AM year whose Nisan is the Abib of the current biblical year.
  const springAM = heb.month <= 6 ? heb.year : heb.year - 1;
  const allMoedim = [springAM - 1, springAM, springAM + 1].flatMap((am) =>
    buildMoedimForYear({
      resolve: (m, d) => rabbinicResolve(am, m, d, loc),
      daytimeWeekday: (m, d) =>
        weekdayOfRD(hebrewToRD(m <= 6 ? am : am + 1, m, d)),
      labelOf: (instant) => {
        const h = rdToHebrew(currentBiblicalRD(instant, loc));
        return { month: h.month, day: h.day };
      },
      firstfruitsRule: ffRule,
      includeQumran: false,
      loc,
    }),
  );

  return {
    config,
    queryInstant: query,
    biblicalDate,
    monthStart,
    moedim: upcomingMoedim(allMoedim, query),
    notes,
  };
}

function rabbinicResolve(
  springAM: number,
  month: number,
  day: number,
  loc: GeoLocation,
): Date {
  const amY = month <= 6 ? springAM : springAM + 1;
  return rdToStartInstant(hebrewToRD(amY, month, day), loc);
}

// ---------------------------------------------------------------------------
// Enoch (364-day solar)
// ---------------------------------------------------------------------------

function computeEnoch(query: Date, config: CalendarConfig): EngineResult {
  if (config.month.kind !== "enoch") throw new Error("not enoch");
  const loc = config.location;
  const cfg: EnochConfig = {
    intercalation: config.month.intercalation,
    leapWeekPeriodYears: config.month.leapWeekPeriodYears,
  };
  const notes: string[] = [
    "Enoch is a solar 364-day calendar (no moon); the year dial is not applied.",
  ];

  const rd = currentBiblicalRD(query, loc);
  const ed = enochDateFromRD(rd, cfg, loc);
  if (ed.isIntercalary) {
    notes.push("In the intercalary leap week (year-end realignment).");
  }

  const monthStartRD = ed.isIntercalary
    ? ed.yearStartRD + 364
    : ed.yearStartRD + enochDayOfYear(ed.month, 1) - 1;

  const biblicalDate: BiblicalDate = {
    year: ed.enochYear,
    month: ed.month,
    day: ed.day,
    monthName: enochMonthName(ed.month),
  };
  const monthStart: MonthStart = {
    startInstant: rdToStartInstant(monthStartRD, loc),
    status: "confirmed",
  };

  const nextYearStartRD = ed.yearStartRD + ed.yearLengthDays;
  const prevYearStartRD = enochDateFromRD(ed.yearStartRD - 1, cfg, loc).yearStartRD;
  const allMoedim = [prevYearStartRD, ed.yearStartRD, nextYearStartRD].flatMap(
    (ysRD) =>
      buildMoedimForYear({
        resolve: (m, d) => rdToStartInstant(ysRD + enochDayOfYear(m, d) - 1, loc),
        daytimeWeekday: (m, d) => weekdayOfRD(ysRD + enochDayOfYear(m, d) - 1),
        labelOf: (instant) => {
          const e = enochDateFromRD(currentBiblicalRD(instant, loc), cfg, loc);
          return { month: e.month, day: e.day };
        },
        // Enoch/Qumran wave-sheaf is fixed at 1/26 (morrow after the Sabbath
        // following Unleavened Bread).
        firstfruitsRule: "after-weekly-sabbath",
        fixedFirstfruitsDay: 26,
        includeQumran: config.qumranFestivals ?? false,
        loc,
      }),
  );

  return {
    config,
    queryInstant: query,
    biblicalDate,
    monthStart,
    moedim: upcomingMoedim(allMoedim, query),
    notes,
  };
}

// ---------------------------------------------------------------------------
// Manual override — the universal escape hatch
// ---------------------------------------------------------------------------

function applyOverride(
  query: Date,
  config: CalendarConfig,
  deps: CalendarDeps,
): EngineResult {
  const loc = config.location;
  const bare: CalendarConfig = { ...config, override: undefined };
  const override = config.override!;

  if (override.kind === "monthStart") {
    const base = computeCore(query, bare, deps);
    if (query.getTime() < override.startInstant.getTime()) {
      return {
        ...base,
        notes: [
          ...base.notes,
          "Manual month-start override provided but is in the future; showing the computed reckoning.",
        ],
      };
    }
    const day = biblicalDayNumber(override.startInstant, query, loc);
    return {
      ...base,
      monthStart: { startInstant: override.startInstant, status: "confirmed" },
      biblicalDate: { ...base.biblicalDate, day },
      notes: [...base.notes, "Manual month-start override applied."],
    };
  }

  if (override.kind === "fullDate") {
    return anchorFullDate(query, bare, deps, loc, {
      year: override.year,
      month: override.month,
      day: override.day,
      anchorInstant: override.anchorInstant,
      note: "Manual full-date override: labels are exact at the anchor and offset-propagated elsewhere.",
    });
  }

  // dateAnchor — the user supplied a Gregorian instant carrying a known biblical
  // MONTH/DAY; keep the engine's own computed year (yearShift = 0) and propagate
  // the month/day offset, exactly like fullDate.
  const baseA = computeCore(override.anchorInstant, bare, deps);
  return anchorFullDate(query, bare, deps, loc, {
    year: baseA.biblicalDate.year,
    month: override.month,
    day: override.day,
    anchorInstant: override.anchorInstant,
    note: "Calendar oriented from a manual anchor: the stated biblical date is fixed at the anchor and offset-propagated elsewhere.",
  });
}

/** An engine month-start with the biblical month/year it opens. */
interface MonthStartMark {
  start: Date;
  month: number;
  year: number;
}

/**
 * The engine's own month-starts in a window around `query` (a few months either
 * side), oldest-first. Each is found by re-reading the engine just inside the
 * neighbouring month, so they follow the real (lunar / fixed) cadence.
 */
function monthStartsAround(
  query: Date,
  bare: CalendarConfig,
  deps: CalendarDeps,
): MonthStartMark[] {
  const DAY = 86_400_000;
  const markOf = (r: EngineResult): MonthStartMark => ({
    start: r.monthStart.startInstant,
    month: r.biblicalDate.month,
    year: r.biblicalDate.year,
  });
  const cur = computeCore(query, bare, deps);
  const marks: MonthStartMark[] = [markOf(cur)];

  let s = cur.monthStart.startInstant;
  for (let i = 0; i < 3; i++) {
    // 2 days before a month-start lands in the previous month.
    const prev = computeCore(new Date(s.getTime() - 2 * DAY), bare, deps);
    marks.unshift(markOf(prev));
    s = prev.monthStart.startInstant;
  }
  s = cur.monthStart.startInstant;
  for (let i = 0; i < 3; i++) {
    // ~32 days past a month-start lands in the next month.
    const next = computeCore(new Date(s.getTime() + 32 * DAY), bare, deps);
    marks.push(markOf(next));
    s = next.monthStart.startInstant;
  }
  return marks;
}

/**
 * Shared anchor-and-propagate core for the fullDate / dateAnchor overrides.
 *
 * The user declares that `anchorInstant` carries biblical (year, month, day).
 * Rather than do arithmetic on the day-of-month (which can overflow into an
 * impossible "day 33"), we slide the engine's OWN month boundaries so the
 * declared day lands at the anchor, then count the day-of-month with the same
 * sunset-stepping the engine uses — so the day is always a valid 1..(month
 * length). The month-of-year + year are relabelled by a single ordinal offset
 * fixed at the anchor. Labels are exact at the anchor and consistent far from
 * it.
 */
function anchorFullDate(
  query: Date,
  bare: CalendarConfig,
  deps: CalendarDeps,
  loc: GeoLocation,
  target: { year: number; month: number; day: number; anchorInstant: Date; note: string },
): EngineResult {
  const baseQ = computeCore(query, bare, deps);
  const baseA = computeCore(target.anchorInstant, bare, deps);

  // The user's month boundaries are the engine's, slid so the anchor reads as
  // the declared day: a month-start E becomes E shifted later by (d0 − D) days
  // (= subtracting k = D − d0). Counting from such a boundary makes the anchor's
  // day come out to D exactly.
  const k = target.day - baseA.biblicalDate.day;
  const slide = (sunset: Date): Date =>
    k <= 0 ? addBiblicalDays(sunset, -k, loc) : subBiblicalDays(sunset, k, loc);

  // Pick the latest slid boundary on/before the query → the user's current
  // month-start. Counting to the query then yields a valid day-of-month.
  const marks = monthStartsAround(query, bare, deps);
  let chosen = marks[0];
  let chosenStart = slide(marks[0].start);
  for (const m of marks) {
    const us = slide(m.start);
    if (us.getTime() <= query.getTime()) {
      chosen = m;
      chosenStart = us;
    }
  }
  const day = biblicalDayNumber(chosenStart, query, loc);

  // Relabel month-of-year + year by a single ordinal offset, fixed by the anchor
  // (where the engine month is baseA's and the declared month is target.month).
  const ordShift =
    (target.year * 12 + (target.month - 1)) -
    (baseA.biblicalDate.year * 12 + (baseA.biblicalDate.month - 1));
  const ord = chosen.year * 12 + (chosen.month - 1) + ordShift;
  const year = Math.floor(ord / 12);
  const month = (((ord % 12) + 12) % 12) + 1;

  return {
    ...baseQ,
    biblicalDate: { year, month, day, monthName: baseQ.biblicalDate.monthName },
    monthStart: { startInstant: chosenStart, status: "confirmed" },
    notes: [...baseQ.notes, target.note],
  };
}
