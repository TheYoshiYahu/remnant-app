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
