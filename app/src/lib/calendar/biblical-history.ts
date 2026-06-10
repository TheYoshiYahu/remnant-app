/**
 * biblical-history.ts — "On this day in biblical history".
 *
 * Surfaces events that carry an EXPLICIT Scriptural date anchor (a stated
 * biblical month + day) and therefore recur on that biblical date every year —
 * the Leviticus 23 feasts and their historical anchors, the Flood markers of
 * Genesis 7-8, and a few covenant landmarks.
 *
 * The data lives in a bundled JSON seed (data/biblical-history.seed.json) behind
 * this clean interface so it can be expanded and gated later WITHOUT touching the
 * calendar UI. It is deliberately SMALL and accurate — nothing fabricated.
 *
 * >>> This is a SEED set. Expand + gate (data/biblical-history.seed.json::_meta)
 *     before treating it as comprehensive. <<<
 */

import seed from "../../data/biblical-history.seed.json";

export type HistoryCategory = "feast" | "blessing" | "judgment" | "covenant";

export interface BiblicalHistoryEvent {
  id: string;
  /** Biblical month index (1 = Abib/Nisan). */
  month: number;
  /** Biblical day-of-month (1-based). */
  day: number;
  title: string;
  /** Scripture reference for the date anchor. */
  scripture: string;
  category: HistoryCategory;
  summary: string;
}

const EVENTS: BiblicalHistoryEvent[] = (seed.events as BiblicalHistoryEvent[]).slice();

/** Whether the seed set is flagged as provisional (drives the "seed" badge). */
export const HISTORY_IS_SEED = true;

/**
 * Events anchored to a given biblical month + day. Returns every match (a date
 * can carry more than one — e.g. 1/1 is both the Tabernacle raising and the
 * Flood's drying), in a stable order (feasts first, then by id).
 */
export function eventsOnBiblicalDate(month: number, day: number): BiblicalHistoryEvent[] {
  const rank: Record<HistoryCategory, number> = {
    feast: 0,
    judgment: 1,
    covenant: 2,
    blessing: 3,
  };
  return EVENTS.filter((e) => e.month === month && e.day === day).sort(
    (a, b) => rank[a.category] - rank[b.category] || a.id.localeCompare(b.id),
  );
}

/** The full seed set (for an index / "browse all" surface later). */
export function allHistoryEvents(): BiblicalHistoryEvent[] {
  return EVENTS.slice();
}

/**
 * The color theology register for a history category, matching the calendar's
 * palette (gold feast / emerald blessing / argaman-purple judgment / techelet
 * covenant). Glow = bright pale tone on black; deep = wash tone.
 */
export function historyTone(category: HistoryCategory): { glow: string; deep: string } {
  switch (category) {
    case "feast":
      return { glow: "#FCECAF", deep: "#645028" };
    case "blessing":
      return { glow: "#2EFFA1", deep: "#04321E" };
    case "judgment":
      return { glow: "#D4B0E0", deep: "#3D1B5C" };
    case "covenant":
      return { glow: "#93C0FF", deep: "#0A2D84" };
  }
}
