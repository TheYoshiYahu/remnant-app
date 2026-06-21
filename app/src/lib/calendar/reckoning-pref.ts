/**
 * reckoning-pref.ts — the single, app-wide source of truth for the chosen
 * biblical-calendar reckoning (dark moon / first crescent / calculated-HebCal /
 * Enoch).
 *
 * Before this module each surface kept its own idea of the reckoning: the Today
 * hub persisted `rop_today_reckoning_v1`, the Calendar route read it from the
 * URL (`?reck=`) and never persisted it at all. The Torah-portions work and the
 * read-the-scriptures-in-a-year pacing both need ONE answer to "which calendar
 * does this reader follow?", so this key becomes that answer. Both the Today hub
 * dials and the Calendar route now read it on load and write it on change.
 *
 * Default — when the reader has chosen nothing — is the calculated rabbinic
 * (HebCal) calendar: the sensible working default for the unsure, the one most
 * calendars use. The reader can change it on either surface and the choice
 * sticks everywhere.
 *
 * Stores only the headline MonthKind. The finer dials (crescent criterion, year
 * rule, Enoch intercalation, orientation) stay where they live — this is the one
 * shared decision the rest of the app keys off.
 */

import type { MonthKind } from "./view-model.ts";

/** The app-wide localStorage key. */
export const RECKONING_PREF_KEY = "cal.reckoning";

/** The fallback when the reader has chosen nothing: calculated rabbinic (HebCal). */
export const DEFAULT_RECKONING_PREF: MonthKind = "rabbinic";

const VALID: readonly MonthKind[] = ["conjunction", "crescent", "rabbinic", "enoch"];

function isMonthKind(v: string | null): v is MonthKind {
  return v !== null && (VALID as readonly string[]).includes(v);
}

/**
 * The reader's chosen reckoning, or the HebCal/rabbinic default when unset or
 * unreadable (SSR, private mode, a stale/garbage value).
 */
export function getReckoningPref(): MonthKind {
  if (typeof window === "undefined") return DEFAULT_RECKONING_PREF;
  try {
    const stored = window.localStorage.getItem(RECKONING_PREF_KEY);
    if (isMonthKind(stored)) return stored;
  } catch {
    /* private mode — fall through to the default */
  }
  return DEFAULT_RECKONING_PREF;
}

/** Persist the reader's reckoning choice. No-op off-window or in private mode. */
export function setReckoningPref(kind: MonthKind): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(RECKONING_PREF_KEY, kind);
  } catch {
    /* private mode — the choice just won't persist */
  }
}
