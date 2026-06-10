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

  // fullDate override — anchor the labels at a stated date.
  const baseQ = computeCore(query, bare, deps);
  const baseA = computeCore(override.anchorInstant, bare, deps);
  const dayShift = override.day - baseA.biblicalDate.day;
  const monthShift = override.month - baseA.biblicalDate.month;
  const yearShift = override.year - baseA.biblicalDate.year;

  let month = baseQ.biblicalDate.month + monthShift;
  let year = baseQ.biblicalDate.year + yearShift;
  while (month > 12) {
    month -= 12;
    year += 1;
  }
  while (month < 1) {
    month += 12;
    year -= 1;
  }
  const day = baseQ.biblicalDate.day + dayShift;

  // The user's day-of-month differs from the computed one by `dayShift`, which
  // means their month boundary sits `dayShift` days earlier.
  const baseStart = baseQ.monthStart.startInstant;
  const startInstant =
    dayShift >= 0
      ? subBiblicalDays(baseStart, dayShift, loc)
      : addBiblicalDays(baseStart, -dayShift, loc);

  return {
    ...baseQ,
    biblicalDate: { year, month, day, monthName: baseQ.biblicalDate.monthName },
    monthStart: { startInstant, status: "confirmed" },
    notes: [
      ...baseQ.notes,
      "Manual full-date override: labels are exact at the anchor and offset-propagated elsewhere.",
    ],
  };
}
