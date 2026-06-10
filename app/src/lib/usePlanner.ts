/**
 * usePlanner.ts — the React seam over the framework-agnostic PlannerStore.
 *
 * Keeps planner-store.ts free of React so the same store can be driven by a
 * future sync backend. This hook subscribes a component to one civil day's
 * items and to the set of days that hold any items (for grid badges).
 */

import { useCallback, useSyncExternalStore } from "react";
import {
  plannerStore,
  type DayPlanner,
  type PlannerItem,
  type PlannerItemKind,
} from "./planner-store.ts";

export function usePlannerDay(dayId: string): {
  day: DayPlanner;
  add: (kind: PlannerItemKind, text: string, time?: string) => void;
  toggle: (item: PlannerItem) => void;
  remove: (id: string) => void;
} {
  const day = useSyncExternalStore(
    (cb) => plannerStore.subscribe(cb),
    () => plannerStore.getDay(dayId),
    () => plannerStore.getDay(dayId),
  );

  const add = useCallback(
    (kind: PlannerItemKind, text: string, time?: string) => {
      const trimmed = text.trim();
      if (!trimmed) return;
      plannerStore.add({ kind, dayId, text: trimmed, time });
    },
    [dayId],
  );
  const toggle = useCallback((item: PlannerItem) => {
    plannerStore.update(item.id, { done: !item.done });
  }, []);
  const remove = useCallback((id: string) => plannerStore.remove(id), []);

  return { day, add, toggle, remove };
}

/** The set of civil-day ids holding at least one planner item (for grid dots). */
export function useDaysWithItems(): Set<string> {
  return useSyncExternalStore(
    (cb) => plannerStore.subscribe(cb),
    () => plannerStore.daysWithItems(),
    () => plannerStore.daysWithItems(),
  );
}

/** A biblical-date anchor for a journal entry (Hebrew year/month/day). */
export interface BiblicalAnchor {
  year: number;
  month: number;
  day: number;
}

/**
 * The journal for one biblical day. Splits entries into THIS year's (this civil
 * day, editable) and PRIOR years' (the same biblical month+day in earlier years
 * — the user's own "on this day", read-only history). Adds anchor the entry to
 * the biblical date so it recurs every year.
 */
export function useJournal(
  dayId: string,
  anchor: BiblicalAnchor,
): { thisYear: PlannerItem[]; priorYears: PlannerItem[]; add: (text: string) => void; remove: (id: string) => void } {
  const all = useSyncExternalStore(
    (cb) => plannerStore.subscribe(cb),
    () => plannerStore.journalOnBiblicalDate(anchor.month, anchor.day),
    () => plannerStore.journalOnBiblicalDate(anchor.month, anchor.day),
  );

  const thisYear = all.filter((e) => e.dayId === dayId);
  const priorYears = all.filter((e) => e.dayId !== dayId);

  const add = useCallback(
    (text: string) => {
      const trimmed = text.trim();
      if (!trimmed) return;
      plannerStore.add({
        kind: "journal",
        dayId,
        text: trimmed,
        bYear: anchor.year,
        bMonth: anchor.month,
        bDay: anchor.day,
      });
    },
    [dayId, anchor.year, anchor.month, anchor.day],
  );
  const remove = useCallback((id: string) => plannerStore.remove(id), []);

  return { thisYear, priorYears, add, remove };
}
