/**
 * molad.ts — the calculated rabbinic (fixed) Hebrew calendar.
 *
 * Two layers, kept separate on purpose (see CALENDAR_DESIGN.md §1):
 *
 *  1. TRANSPARENT molad + four dechiyot. We compute the molad (mean
 *     conjunction) of Tishrei in the traditional BaHaRaD frame, then apply the
 *     four postponement rules by name — Lo ADU Rosh, Molad Zaken, GaTaRaD,
 *     BeTUTaKPaT — to derive the Rosh Hashanah weekday. This is the
 *     inspectable, "show your work" path.
 *
 *  2. TRUSTED civil placement. We place Rosh Hashanah on the civil calendar
 *     with the Dershowitz–Reingold elapsed-days formula (Calendrical
 *     Calculations), which is a compact, well-validated encoding of the same
 *     rules. The test suite asserts the two layers agree on weekday for every
 *     year in a wide range, and that civil dates / month lengths match
 *     @hebcal/core. @hebcal/core is a CROSS-CHECK, never a runtime dependency.
 *
 * Month numbering follows the Torah / Dershowitz convention: Nisan = 1 (the
 * first month, Abib) … Tishrei = 7 … Adar = 12, Adar II = 13 (leap). The
 * Hebrew year number (Anno Mundi) increments at Tishrei.
 */

const PARTS_PER_HOUR = 1080;
const PARTS_PER_DAY = 24 * PARTS_PER_HOUR; // 25920
const MOLAD_INTERVAL = 765433; // 29d 12h 793p, in parts
// Molad of Tishrei, year 1 = BaHaRaD = Monday 5h 204p, as parts from a Sunday
// week-origin: 1 day + 5h + 204p = 25920 + 5400 + 204.
const MOLAD_BASE = 31524;

// ---------------------------------------------------------------------------
// Leap years & month counts
// ---------------------------------------------------------------------------

/** 7 leap years in each 19-year Metonic cycle (years 3,6,8,11,14,17,19). */
export function isHebrewLeapYear(year: number): boolean {
  return ((7 * year + 1) % 19) < 7;
}

export function lastMonthOfHebrewYear(year: number): number {
  return isHebrewLeapYear(year) ? 13 : 12;
}

// ---------------------------------------------------------------------------
// Layer 1 — the molad and the four dechiyot (transparent)
// ---------------------------------------------------------------------------

export interface Molad {
  /** Total parts since the Sunday week-origin. */
  totalParts: number;
  /** Day index since origin (totalParts / PARTS_PER_DAY, floored). */
  dayCount: number;
  /** Weekday of the molad, 0 = Sunday … 6 = Saturday. */
  weekday: number;
  /** Hour within the (evening-anchored) day, 0..23. */
  hours: number;
  /** Parts within the hour, 0..1079. */
  parts: number;
  /** Parts elapsed within the day, 0..25919. */
  partsIntoDay: number;
}

/** The molad (mean lunar conjunction) of Tishrei for the given Hebrew year. */
export function moladTishrei(year: number): Molad {
  const monthsElapsed = Math.floor((235 * year - 234) / 19);
  const totalParts = MOLAD_BASE + monthsElapsed * MOLAD_INTERVAL;
  const dayCount = Math.floor(totalParts / PARTS_PER_DAY);
  const weekday = ((dayCount % 7) + 7) % 7;
  const partsIntoDay = totalParts % PARTS_PER_DAY;
  return {
    totalParts,
    dayCount,
    weekday,
    hours: Math.floor(partsIntoDay / PARTS_PER_HOUR),
    parts: partsIntoDay % PARTS_PER_HOUR,
    partsIntoDay,
  };
}

export interface DechiyotResult {
  molad: Molad;
  /** Days Rosh Hashanah is postponed from the molad day (0..2). */
  postponement: number;
  /** Resulting Rosh Hashanah weekday, 0 = Sunday … 6 = Saturday. */
  roshHashanahWeekday: number;
  /** Which named rules fired, in application order. */
  rules: string[];
}

const H = PARTS_PER_HOUR;

/**
 * Apply the four postponement rules transparently.
 *
 *  - Molad Zaken: molad ≥ 18h (noon) → +1 day.
 *  - GaTaRaD: common year, molad on Tuesday ≥ 9h 204p → Tue→Thu (+2).
 *  - BeTUTaKPaT: year after a leap year, molad on Monday ≥ 15h 589p → +1.
 *  - Lo ADU Rosh: RH may not land on Sun/Wed/Fri → +1.
 */
export function applyDechiyot(year: number): DechiyotResult {
  const molad = moladTishrei(year);
  const leapThisYear = isHebrewLeapYear(year);
  const leapPrevYear = isHebrewLeapYear(year - 1);
  const rules: string[] = [];
  let postponement = 0;

  if (molad.partsIntoDay >= 18 * H) {
    postponement += 1;
    rules.push("molad-zaken");
  } else if (
    !leapThisYear &&
    molad.weekday === 2 && // Tuesday
    molad.partsIntoDay >= 9 * H + 204
  ) {
    postponement += 2; // Tue → Thu (Wed is ADU-blocked)
    rules.push("gatarad");
  } else if (
    leapPrevYear &&
    molad.weekday === 1 && // Monday
    molad.partsIntoDay >= 15 * H + 589
  ) {
    postponement += 1; // Mon → Tue
    rules.push("betutakpat");
  }

  let rhWeekday = (molad.weekday + postponement) % 7;
  if (rhWeekday === 0 || rhWeekday === 3 || rhWeekday === 5) {
    // Lo ADU Rosh — Sunday(0)/Wednesday(3)/Friday(5) are forbidden.
    postponement += 1;
    rhWeekday = (rhWeekday + 1) % 7;
    rules.push("lo-adu");
  }

  return { molad, postponement, roshHashanahWeekday: rhWeekday, rules };
}

// ---------------------------------------------------------------------------
// Layer 2 — Dershowitz–Reingold civil placement (trusted)
// ---------------------------------------------------------------------------

/** RD (Rata Die fixed day) of 1 Tishrei, Anno Mundi 1. */
const HEBREW_EPOCH_RD = -1373427;

function hebrewCalendarElapsedDays(year: number): number {
  const monthsElapsed = Math.floor((235 * year - 234) / 19);
  const partsElapsed = 12084 + 13753 * monthsElapsed;
  let day = 29 * monthsElapsed + Math.floor(partsElapsed / PARTS_PER_DAY);
  // Molad-zaken + partial-ADU correction, folded into one test.
  if ((3 * (day + 1)) % 7 < 3) day += 1;
  return day;
}

function hebrewNewYearDelay(year: number): number {
  const ny0 = hebrewCalendarElapsedDays(year - 1);
  const ny1 = hebrewCalendarElapsedDays(year);
  const ny2 = hebrewCalendarElapsedDays(year + 1);
  if (ny2 - ny1 === 356) return 2; // GaTaRaD-class
  if (ny1 - ny0 === 382) return 1; // BeTUTaKPaT-class
  return 0;
}

/** RD of 1 Tishrei (Rosh Hashanah) of the given Hebrew year. */
export function roshHashanahRD(year: number): number {
  return (
    HEBREW_EPOCH_RD +
    hebrewCalendarElapsedDays(year) +
    hebrewNewYearDelay(year)
  );
}

/** Weekday (0 = Sunday … 6 = Saturday) of an RD fixed day. */
export function weekdayOfRD(rd: number): number {
  return ((rd % 7) + 7) % 7;
}

// ---------------------------------------------------------------------------
// Year length, month lengths
// ---------------------------------------------------------------------------

export function daysInHebrewYear(year: number): number {
  return roshHashanahRD(year + 1) - roshHashanahRD(year);
}

export type HebrewYearKind = "deficient" | "regular" | "complete";

export function hebrewYearKind(year: number): HebrewYearKind {
  const d = daysInHebrewYear(year);
  if (d === 353 || d === 383) return "deficient";
  if (d === 355 || d === 385) return "complete";
  return "regular"; // 354 / 384
}

function longHeshvan(year: number): boolean {
  const d = daysInHebrewYear(year);
  return d === 355 || d === 385;
}
function shortKislev(year: number): boolean {
  const d = daysInHebrewYear(year);
  return d === 353 || d === 383;
}

/** Length (29 or 30) of a Hebrew month in a given year. Nisan = 1. */
export function lastDayOfHebrewMonth(month: number, year: number): number {
  if (month === 2 || month === 4 || month === 6 || month === 10 || month === 13)
    return 29;
  if (month === 12 && !isHebrewLeapYear(year)) return 29; // Adar (non-leap)
  if (month === 8 && !longHeshvan(year)) return 29; // Heshvan
  if (month === 9 && shortKislev(year)) return 29; // Kislev
  return 30;
}

// ---------------------------------------------------------------------------
// Hebrew ↔ RD conversion
// ---------------------------------------------------------------------------

/** RD fixed day of a Hebrew date. Nisan = 1 … Tishrei = 7 … Adar II = 13. */
export function hebrewToRD(year: number, month: number, day: number): number {
  let rd = roshHashanahRD(year) + day - 1;
  if (month < 7) {
    // Spring months (Nisan..Elul) fall after Tishrei within the Hebrew year.
    for (let m = 7; m <= lastMonthOfHebrewYear(year); m++)
      rd += lastDayOfHebrewMonth(m, year);
    for (let m = 1; m < month; m++) rd += lastDayOfHebrewMonth(m, year);
  } else {
    for (let m = 7; m < month; m++) rd += lastDayOfHebrewMonth(m, year);
  }
  return rd;
}

export interface HebrewDate {
  year: number;
  month: number; // Nisan = 1
  day: number;
}

/** Convert an RD fixed day to a Hebrew date. */
export function rdToHebrew(rd: number): HebrewDate {
  let year = Math.floor((rd - HEBREW_EPOCH_RD) / 365.2468) + 1;
  while (roshHashanahRD(year) > rd) year--;
  while (roshHashanahRD(year + 1) <= rd) year++;

  // Calendar month order: Tishrei(7) … last month, then Nisan(1) … Elul(6).
  const order: number[] = [];
  for (let m = 7; m <= lastMonthOfHebrewYear(year); m++) order.push(m);
  for (let m = 1; m <= 6; m++) order.push(m);

  for (const m of order) {
    const start = hebrewToRD(year, m, 1);
    const len = lastDayOfHebrewMonth(m, year);
    if (rd < start + len) {
      return { year, month: m, day: rd - start + 1 };
    }
  }
  // Unreachable for valid input; satisfy the type.
  const last = order[order.length - 1];
  return { year, month: last, day: lastDayOfHebrewMonth(last, year) };
}

// ---------------------------------------------------------------------------
// Gregorian ↔ RD ↔ JS Date
// ---------------------------------------------------------------------------

export function isGregorianLeap(year: number): boolean {
  return (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
}

export function gregorianToRD(year: number, month: number, day: number): number {
  const y = year - 1;
  let rd =
    365 * y +
    Math.floor(y / 4) -
    Math.floor(y / 100) +
    Math.floor(y / 400) +
    Math.floor((367 * month - 362) / 12) +
    day;
  if (month > 2) rd += isGregorianLeap(year) ? -1 : -2;
  return rd;
}

export interface GregorianDate {
  year: number;
  month: number;
  day: number;
}

export function rdToGregorian(rd: number): GregorianDate {
  const d0 = rd - 1;
  const n400 = Math.floor(d0 / 146097);
  const d1 = d0 - 146097 * n400;
  const n100 = Math.floor(d1 / 36524);
  const d2 = d1 - 36524 * n100;
  const n4 = Math.floor(d2 / 1461);
  const d3 = d2 - 1461 * n4;
  const n1 = Math.floor(d3 / 365);
  let year = 400 * n400 + 100 * n100 + 4 * n4 + n1;
  if (n100 === 4 || n1 === 4) {
    return { year, month: 12, day: 31 };
  }
  year += 1;
  const jan1 = gregorianToRD(year, 1, 1);
  const mar1 = gregorianToRD(year, 3, 1);
  const correction = rd < mar1 ? 0 : isGregorianLeap(year) ? 1 : 2;
  const priorDays = rd - jan1;
  const month = Math.floor((12 * (priorDays + correction) + 373) / 367);
  const day = rd - gregorianToRD(year, month, 1) + 1;
  return { year, month, day };
}

const RD_UNIX_EPOCH = gregorianToRD(1970, 1, 1); // 719163

/** RD fixed day → JS Date at 00:00 UTC of that Gregorian day. */
export function rdToDateUTC(rd: number): Date {
  return new Date((rd - RD_UNIX_EPOCH) * 86_400_000);
}

/** UTC Gregorian Y/M/D of a JS Date → RD fixed day. */
export function dateUTCToRD(d: Date): number {
  return gregorianToRD(d.getUTCFullYear(), d.getUTCMonth() + 1, d.getUTCDate());
}

// ---------------------------------------------------------------------------
// Month names (Nisan = 1)
// ---------------------------------------------------------------------------

const MONTH_NAMES = [
  "", // 0 unused
  "Nisan",
  "Iyar",
  "Sivan",
  "Tammuz",
  "Av",
  "Elul",
  "Tishrei",
  "Cheshvan",
  "Kislev",
  "Tevet",
  "Shevat",
  "Adar",
  "Adar II",
];

export function hebrewMonthName(month: number, year: number): string {
  if (month === 12 && isHebrewLeapYear(year)) return "Adar I";
  return MONTH_NAMES[month] ?? `M${month}`;
}
