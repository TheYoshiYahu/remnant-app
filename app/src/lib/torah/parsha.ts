/**
 * parsha.ts — the weekly Torah portion, resolved over `@hebcal/core`.
 *
 * Pure helper (no React, no DOM beyond an optional localStorage read in the
 * default anchor resolver). Given a date AND the reader's elected reckoning it
 * returns the current portion: name, the Torah reading reference, the Haftarah,
 * and — the piece the reader UI actually needs — the **opening chapter as
 * `{ book_id, chapter }`** so a tap can drop straight into the reader.
 *
 * C.5 reckoning rule (resolved with Yoshi — implemented exactly):
 *
 *   - **No reckoning chosen → align to HebCal** (rabbinic / calculated). This is
 *     the default and the simple case: ask HebCal for the parsha keyed to the
 *     Shabbat of the queried week and map it.
 *
 *   - **A reckoning IS chosen (dark moon / crescent / Enoch) → keep HebCal's
 *     portion list/order, but drive *which Shabbat* from the elected reckoning.**
 *     We anchor the annual cycle to the reader's own Shabbat (Bereshit falls on
 *     the first weekly Sabbath after the reader's Simchat Torah, as the calendar
 *     engine computes it under the reader's reckoning + location) and walk the
 *     ordered portion list from there. We do NOT force the rabbinic date-keyed
 *     parsha back onto a non-rabbinic reader.
 *
 * HebCal supplies the portion **name + order**; the opening reference, the
 * Torah range, and the Haftarah come from `parsha-data.json` (the annual cycle
 * and its readings are fixed). The one real gotcha — mapping HebCal's book
 * names to the reader's `book_id` slugs so tap-through lands on the right
 * chapter — lives in that JSON's `bookToSlug` and is unit-tested.
 */

import { HDate, Sedra, parshiot } from "@hebcal/core";
import type { MonthKind } from "../calendar/view-model.ts";
import { compute, DEFAULT_RECKONING } from "../calendar/view-model.ts";
import { getLocationPref } from "../calendar/location-pref.ts";
import { JERUSALEM } from "../calendar/types.ts";
import parshaData from "./parsha-data.json";

interface ParshaEntry {
  book: string;
  chapter: number;
  torah: string;
  haftarah: string;
}

const TABLE = parshaData.table as Record<string, ParshaEntry>;
const BOOK_TO_SLUG = parshaData.bookToSlug as Record<string, string>;

/** The fixed annual order of the 54 portions (HebCal's canonical names). */
export const PARSHA_ORDER: readonly string[] = parshiot;

/** The `book_id` slug for an English book name, or null when unmapped. */
export function bookSlugForName(bookName: string): string | null {
  return BOOK_TO_SLUG[bookName.trim()] ?? null;
}

// ---------------------------------------------------------------------------
// Public result shape
// ---------------------------------------------------------------------------

/** A tap-through target: a reader `book_id` slug + 1-based chapter. */
export interface PortionOpening {
  book_id: string;
  chapter: number;
}

export interface ParshaPortion {
  /** Display name — single ("Korach") or combined ("Matot-Masei"). */
  name: string;
  /** Component HebCal names (one, or two when combined). */
  names: string[];
  /** Torah reading range(s) for display. */
  torahRef: string;
  /** Haftarah reference(s) for display. */
  haftarahRef: string;
  /** Opening chapter of the Torah reading — the primary tap-through. */
  opening: PortionOpening;
  /** Opening of the Haftarah, when its book maps to a slug. */
  haftarahOpening?: PortionOpening;
  /** The Shabbat this portion is read on, driven by the elected reckoning. */
  sabbathDate: Date;
  /** Which reckoning produced this result. */
  reckoning: MonthKind;
  /** True when a holiday displaced the weekly portion and we advanced past it. */
  advancedPastHoliday: boolean;
}

// ---------------------------------------------------------------------------
// Injectable engine seam (keeps this module testable without the engine)
// ---------------------------------------------------------------------------

export interface ParshaDeps {
  /**
   * Resolve the Gregorian Shabbat (a Saturday) that opens the annual cycle
   * (Bereshit) for the cycle containing `date`, under the elected reckoning —
   * the first weekly Sabbath after the reader's Simchat Torah. Returning null
   * falls back to the rabbinic anchor. Injected in tests; the default reads the
   * calendar engine and the reader's chosen location.
   */
  cycleAnchorSaturdayFor?: (reckoning: MonthKind, date: Date) => Date | null;
}

const DAY_MS = 86400000;

/** The Saturday on or after `date` (the week's Shabbat the portion is read on). */
function upcomingSaturday(date: Date): Date {
  const d = new Date(date.getFullYear(), date.getMonth(), date.getDate());
  const delta = (6 - d.getDay() + 7) % 7; // 0 when already Saturday
  return new Date(d.getTime() + delta * DAY_MS);
}

/** Whole weeks between two Saturdays (rounded; tolerant of DST drift). */
function weeksBetween(fromSat: Date, toSat: Date): number {
  return Math.round((toSat.getTime() - fromSat.getTime()) / (7 * DAY_MS));
}

/** Parse "1 Kings 3:15–4:1" → { book: "1 Kings", chapter: 3 }. */
function parseLeadingBook(ref: string): { book: string; chapter: number } | null {
  const m = ref.match(/^([1-3]?\s?[A-Za-z'’.\- ]+?)\s+(\d+):/);
  if (!m) return null;
  return { book: m[1].trim(), chapter: Number(m[2]) };
}

function entryToPortion(
  names: string[],
  sabbathDate: Date,
  reckoning: MonthKind,
  advancedPastHoliday: boolean,
): ParshaPortion | null {
  const parts = names.map((n) => TABLE[n]).filter(Boolean);
  if (parts.length === 0) return null;
  const first = parts[0];
  const openingSlug = bookSlugForName(first.book);
  if (!openingSlug) return null; // never ship a tap that goes nowhere

  const haftBook = parseLeadingBook(parts[0].haftarah);
  const haftSlug = haftBook ? bookSlugForName(haftBook.book) : null;

  return {
    name: names.join("-"),
    names,
    torahRef: parts.map((p) => p.torah).join(" · "),
    haftarahRef: parts.map((p) => p.haftarah).join(" · "),
    opening: { book_id: openingSlug, chapter: first.chapter },
    haftarahOpening:
      haftSlug && haftBook ? { book_id: haftSlug, chapter: haftBook.chapter } : undefined,
    sabbathDate,
    reckoning,
    advancedPastHoliday,
  };
}

// ---------------------------------------------------------------------------
// The main entry point
// ---------------------------------------------------------------------------

/**
 * The Torah portion for `date` under the elected `reckoning`.
 *
 * Rabbinic / default: HebCal's date-keyed parsha for the week's Shabbat.
 * Non-rabbinic: HebCal's portion order, walked from the reader's own cycle
 * anchor so the Shabbat is driven by the elected reckoning.
 *
 * Returns null only when no weekly portion resolves (e.g. a long festival run
 * with no parsha within the look-ahead window).
 */
export function getParshaForDate(
  date: Date,
  reckoning: MonthKind,
  deps: ParshaDeps = {},
): ParshaPortion | null {
  if (reckoning === "rabbinic") {
    return rabbinicParsha(date, reckoning);
  }
  return nonRabbinicParsha(date, reckoning, deps);
}

/** HebCal date-keyed lookup, advancing past festival Shabbatot if needed. */
function rabbinicParsha(date: Date, reckoning: MonthKind): ParshaPortion | null {
  // Look ahead up to 4 weeks to skip festival Shabbatot that carry no parsha.
  for (let wk = 0; wk < 4; wk++) {
    const probe = new Date(date.getTime() + wk * 7 * DAY_MS);
    const hd = new HDate(probe);
    const sedra = new Sedra(hd.getFullYear(), false);
    const res = sedra.lookup(hd);
    if (res.parsha && res.parsha.length > 0 && !res.chag) {
      const sabbath = new HDate(res.hdate.rd).greg();
      return entryToPortion(res.parsha, sabbath, reckoning, wk > 0);
    }
  }
  return null;
}

/** Walk HebCal's order from the reader's reckoning-driven cycle anchor. */
function nonRabbinicParsha(
  date: Date,
  reckoning: MonthKind,
  deps: ParshaDeps,
): ParshaPortion | null {
  const resolver = deps.cycleAnchorSaturdayFor ?? defaultCycleAnchorSaturdayFor;
  const anchor = resolver(reckoning, date) ?? defaultCycleAnchorSaturdayFor("rabbinic", date);
  const thisSat = upcomingSaturday(date);

  if (!anchor) {
    // No anchor at all — fall back to the rabbinic reading on the reader's Shabbat.
    const r = rabbinicParsha(date, reckoning);
    return r ? { ...r, sabbathDate: thisSat } : null;
  }

  const idx = weeksBetween(anchor, thisSat);
  const clamped = Math.max(0, Math.min(PARSHA_ORDER.length - 1, idx));
  return entryToPortion([PARSHA_ORDER[clamped]], thisSat, reckoning, false);
}

// ---------------------------------------------------------------------------
// Default anchor resolver — backed by the calendar engine + chosen location
// ---------------------------------------------------------------------------

/**
 * The first weekly Sabbath after the reader's Simchat Torah for the cycle
 * containing `date`, computed by the calendar engine under the elected
 * reckoning and the reader's chosen location. The annual Torah cycle restarts
 * with Bereshit on that Shabbat. Returns null (→ rabbinic fallback) if the
 * engine can't place Sukkot in the scan window.
 */
function defaultCycleAnchorSaturdayFor(reckoning: MonthKind, date: Date): Date | null {
  try {
    const state = {
      ...DEFAULT_RECKONING,
      month: reckoning,
      location: getLocationPref() ?? JERUSALEM,
    };

    // Find the most recent Tabernacles (Sukkot) start on/before `date`, scanning
    // a window so the autumn cycle-start preceding any date is found.
    let sukkotStart: Date | null = null;
    for (const offDays of [60, -120, -300]) {
      const q = new Date(date.getTime() + offDays * DAY_MS);
      for (const m of compute(state, q).moedim) {
        if (m.kind !== "tabernacles") continue;
        const s = m.startInstant;
        if (s.getTime() <= date.getTime() && (!sukkotStart || s > sukkotStart)) {
          sukkotStart = s;
        }
      }
    }
    if (!sukkotStart) return null;

    // Simchat Torah ≈ Shemini Atzeret, the 8th day from Sukkot's start (15th →
    // 22nd of the 7th month). Bereshit is the first weekly Sabbath strictly
    // after it.
    const simchatTorah = new Date(sukkotStart.getTime() + 8 * DAY_MS);
    const sat = upcomingSaturday(simchatTorah);
    return sat.getTime() <= simchatTorah.getTime()
      ? new Date(sat.getTime() + 7 * DAY_MS)
      : sat;
  } catch {
    return null;
  }
}
