/**
 * devotional/index.ts — the loader the Today hub talks to.
 *
 * This is the ONLY seam the UI knows about. Today it serves the bundled seed
 * from content.ts and remembers the reader's chosen theme in localStorage (the
 * same persistence pattern the planner and on-this-day seed use). When the
 * corpus outgrows a bundle, this module is what gets re-pointed at a backend —
 * the function signatures and the shapes in types.ts stay put, and the hub
 * never has to change.
 *
 * Content is delivered ONE PER DAY by the calendar: the hub computes today's
 * biblical date with the engine and hands it here, and a stable per-biblical-day
 * ordinal selects the day's devotional entry and prayer. The selection turns
 * over at sunset with the biblical day, and is stable through it.
 */

import { PRAYERS, THEMES } from "./content.ts";
import type { DailyPrayer, DevotionalEntry, DevotionalTheme } from "./types.ts";

export type { DailyPrayer, DevotionalEntry, DevotionalTheme } from "./types.ts";
export { DEVOTIONAL_IS_SEED } from "./types.ts";

const THEME_KEY = "rop_devotional_theme_v1";

// ───────────────────────────────────────────────────────────────────────
// Themes
// ───────────────────────────────────────────────────────────────────────

export function listThemes(): DevotionalTheme[] {
  return THEMES;
}

export function getTheme(id: string): DevotionalTheme | undefined {
  return THEMES.find((t) => t.id === id);
}

/** The reader's chosen theme id, or the first theme when none is stored. */
export function getActiveThemeId(): string {
  if (typeof window !== "undefined") {
    const stored = window.localStorage.getItem(THEME_KEY);
    if (stored && getTheme(stored)) return stored;
  }
  return THEMES[0].id;
}

export function getActiveTheme(): DevotionalTheme {
  return getTheme(getActiveThemeId()) ?? THEMES[0];
}

/** Persist the reader's theme choice. No-op if the id is unknown. */
export function setActiveTheme(id: string): void {
  if (!getTheme(id)) return;
  if (typeof window !== "undefined") {
    window.localStorage.setItem(THEME_KEY, id);
  }
}

// ───────────────────────────────────────────────────────────────────────
// Day selection — a stable ordinal per biblical day
// ───────────────────────────────────────────────────────────────────────

/**
 * A monotonic-enough integer that changes once per biblical day and is stable
 * through it. Used only as a cycling index (mod N), so it needs to advance by
 * one most days and never collide within a single biblical day — both of which
 * the year/month/day composition gives us. The 400 / 31 multipliers leave room
 * for leap (13th) months and 30-day months without overlap.
 */
export function biblicalDayOrdinal(year: number, month: number, day: number): number {
  return year * 400 + (month - 1) * 31 + day;
}

export function entryForDay(theme: DevotionalTheme, ordinal: number): DevotionalEntry {
  const n = theme.entries.length;
  return theme.entries[((ordinal % n) + n) % n];
}

export function prayerForDay(ordinal: number): DailyPrayer {
  const n = PRAYERS.length;
  return PRAYERS[((ordinal % n) + n) % n];
}

/** Index (1-based) of the entry within its theme — for "Day 3 of 7" display. */
export function entryNumberForDay(theme: DevotionalTheme, ordinal: number): number {
  const n = theme.entries.length;
  return (((ordinal % n) + n) % n) + 1;
}

export interface TodaysContent {
  theme: DevotionalTheme;
  entry: DevotionalEntry;
  /** 1-based position of `entry` within `theme.entries`. */
  entryNumber: number;
  prayer: DailyPrayer;
}

/**
 * The day's devotional + prayer for any stable per-day ordinal. The hub uses a
 * biblical-day ordinal when the biblical-calendar layer is on (it turns over at
 * sunset), and a Gregorian-day ordinal when the hub is in its simple default
 * state (turns over at local midnight). Same rotation either way.
 */
export function contentForOrdinal(ordinal: number): TodaysContent {
  const theme = getActiveTheme();
  return {
    theme,
    entry: entryForDay(theme, ordinal),
    entryNumber: entryNumberForDay(theme, ordinal),
    prayer: prayerForDay(ordinal),
  };
}

/**
 * The day's devotional + prayer for a biblical date. The hub computes the
 * biblical date from the calendar engine and passes its year/month/day here.
 */
export function todaysContent(bd: {
  year: number;
  month: number;
  day: number;
}): TodaysContent {
  return contentForOrdinal(biblicalDayOrdinal(bd.year, bd.month, bd.day));
}
