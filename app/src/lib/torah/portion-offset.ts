/**
 * portion-offset.ts — the reader's own place in the annual Torah cycle.
 *
 * Board suggestion #9 (2026-10-30): a reader who started the portion readings
 * a couple of weeks after the calendar's anchor wants "this week's portion"
 * to follow *their* start, not the calendar's. The answer is one number kept
 * here: how many weeks behind (positive) or ahead (negative) of the calendar
 * cycle the reader is. The parsha helper subtracts it when it resolves a
 * date, so every surface that shows "this week's portion" (the reader
 * header, the Calendar day view, the Torah portions page) moves together.
 *
 * Zero — the default — means "on the calendar". Stored in localStorage on
 * this device only, like the reckoning choice it sits beside.
 */

/** The localStorage key. */
export const PORTION_OFFSET_KEY = "torah.portionOffsetWeeks";

/** Fired on window whenever the offset changes, so open panels re-resolve. */
export const PORTION_OFFSET_CHANGED_EVENT = "rop:portion-offset-changed";

/** A sane bound — a whole cycle in either direction is already meaningless. */
const MAX_ABS_WEEKS = 53;

function clamp(n: number): number {
  if (!Number.isFinite(n)) return 0;
  return Math.max(-MAX_ABS_WEEKS, Math.min(MAX_ABS_WEEKS, Math.round(n)));
}

/** Weeks behind (+) or ahead (−) of the calendar cycle. 0 when unset. */
export function getPortionOffsetWeeks(): number {
  if (typeof window === "undefined") return 0;
  try {
    const raw = window.localStorage.getItem(PORTION_OFFSET_KEY);
    if (raw === null) return 0;
    return clamp(Number(raw));
  } catch {
    return 0;
  }
}

/** Persist the offset (0 clears it) and tell open surfaces. */
export function setPortionOffsetWeeks(weeks: number): void {
  if (typeof window === "undefined") return;
  const v = clamp(weeks);
  try {
    if (v === 0) window.localStorage.removeItem(PORTION_OFFSET_KEY);
    else window.localStorage.setItem(PORTION_OFFSET_KEY, String(v));
  } catch {
    /* private mode — the choice just won't persist */
  }
  try {
    window.dispatchEvent(new CustomEvent(PORTION_OFFSET_CHANGED_EVENT, { detail: v }));
  } catch {
    /* no CustomEvent (SSR) — nothing to notify */
  }
}

/** Plain words for the offset, for the panels. */
export function describePortionOffset(weeks: number): string {
  if (weeks === 0) return "On the calendar's week.";
  const n = Math.abs(weeks);
  const w = n === 1 ? "week" : "weeks";
  return weeks > 0
    ? `Reading ${n} ${w} behind the calendar.`
    : `Reading ${n} ${w} ahead of the calendar.`;
}
