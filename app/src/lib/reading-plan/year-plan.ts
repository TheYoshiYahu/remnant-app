/**
 * reading-plan/year-plan.ts — glue between the stored plan state
 * (plan-store.ts) and the partner's own pace (paced.ts). S442.
 *
 *   pacedPlanFor(state)   → today-forward day list at the partner's pace
 *   markReadThrough(seq)  → position = max(position, seq)
 *   markUnreadFrom(seq)   → position = the chapter before seq
 *   advanceOnOpen(slug,c) → in-order reading in the reader moves the plan on
 *
 * The free daily header keeps using pacing.ts's fixed buildYearPlan grid, so
 * nothing free changes.
 */

import { sequenceForScope, type DayReadingItem, type PlanScope } from "./pacing";
import {
  addDaysISO,
  diffDaysISO,
  pacePlan,
  positionAfterOpening,
  seqBefore,
  weekStartFor,
  type PacedDay,
  type PacedPlan,
  type PaceSettings,
} from "./paced";
import {
  getYearPlanState,
  setYearPlanState,
  todayISO,
  type YearPlanState,
} from "./plan-store";

const seqCache = new Map<PlanScope, DayReadingItem[]>();

/** The ordered chapters for a scope, trimmed to the DayReadingItem shape. */
export function scopeSequence(scope: PlanScope): DayReadingItem[] {
  let s = seqCache.get(scope);
  if (!s) {
    s = sequenceForScope(scope).map((e) => ({
      seq: e.seq,
      book_id: e.book_id,
      book_title: e.book_title,
      chapter: e.chapter,
      source: e.source,
    }));
    seqCache.set(scope, s);
  }
  return s;
}

export function effectivePace(state: YearPlanState): PaceSettings {
  return state.pace ?? { mode: "byDate" };
}

/**
 * Refresh the day/week anchors when a new day or week has begun, and pull
 * them back if the reader un-marked chapters below them. Anchor-only writes do
 * NOT stamp updatedAt, so merely opening the plan on a second device never
 * overrides fresher progress synced from the first.
 */
export function withAnchors(
  state: YearPlanState,
  today = todayISO(),
  persist = true,
): YearPlanState {
  const week = weekStartFor(state.startDateISO, today);
  let next = state;
  if (!state.anchor || state.anchor.dateISO !== today || state.anchor.position > state.position) {
    next = { ...next, anchor: { dateISO: today, position: state.position } };
  }
  if (
    !state.weekAnchor ||
    state.weekAnchor.weekStartISO !== week ||
    state.weekAnchor.position > state.position
  ) {
    next = { ...next, weekAnchor: { weekStartISO: week, position: state.position } };
  }
  if (persist && next !== state) setYearPlanState(next, false, false);
  return next;
}

/**
 * S468 — the schedule is FIXED. It is laid down once (at the plan's start, or
 * on the day the reader last changed pace or scope) and never re-spread as
 * they read more or less. Each date keeps its own chapters; past days stay in
 * the list; read chapters are only checked off. Days laid down under an
 * earlier pace come from `history`.
 *
 * The returned plan holds EVERY day (past and future). `remaining` counts
 * chapters still unread; `avgPerDay` is the schedule's own pace.
 */
export function pacedPlanFor(
  state: YearPlanState,
  today = todayISO(),
  persist = true,
): PacedPlan {
  void today;
  void persist;
  const sequence = scopeSequence(state.scope);
  const from = state.fixedFrom ?? { dateISO: state.startDateISO, position: 0 };
  const laid = pacePlan({
    sequence,
    startISO: state.startDateISO,
    todayISO: from.dateISO,
    anchorPosition: from.position,
    weekAnchorPosition: from.position,
    pace: effectivePace(state),
  });

  const past: PacedDay[] = [];
  for (const [dateISO, a, b] of state.history ?? []) {
    if (diffDaysISO(dateISO, from.dateISO) <= 0) continue;
    const items = sequence.filter((e) => e.seq >= a && e.seq <= b);
    if (!items.length) continue;
    const dayIdx = Math.max(0, diffDaysISO(state.startDateISO, dateISO));
    past.push({
      dateISO,
      dayNumber: dayIdx + 1,
      weekStartISO: addDaysISO(state.startDateISO, Math.floor(dayIdx / 7) * 7),
      weekNumber: Math.floor(dayIdx / 7) + 1,
      items,
    });
  }

  const days = [...past, ...laid.days];
  return {
    ...laid,
    days,
    remaining: sequence.filter((e) => e.seq > state.position).length,
  };
}

/**
 * S468 — lay the schedule down again from today (a pace or scope change).
 * Days already behind us keep the chapters they were given.
 */
export function relayPlan(patch: Partial<YearPlanState>, today = todayISO()): YearPlanState | null {
  const cur = getYearPlanState();
  if (!cur) return null;
  const kept: [string, number, number][] = pacedPlanFor(cur, today)
    .days.filter((d) => diffDaysISO(d.dateISO, today) > 0)
    .map((d) => [d.dateISO, d.items[0].seq, d.items[d.items.length - 1].seq]);
  return save({
    ...patch,
    history: kept,
    fixedFrom: { dateISO: today, position: cur.position },
  });
}

/** Today's scheduled day, and the unread scheduled chapters before today. */
export function todayAndBehind(
  plan: PacedPlan,
  position: number,
  today = todayISO(),
): { todayDay: PacedDay | null; behind: DayReadingItem[]; nextDay: PacedDay | null } {
  let todayDay: PacedDay | null = null;
  let nextDay: PacedDay | null = null;
  const behind: DayReadingItem[] = [];
  for (const d of plan.days) {
    const off = diffDaysISO(today, d.dateISO);
    if (off < 0) behind.push(...d.items.filter((it) => it.seq > position));
    else if (off === 0) todayDay = d;
    else if (!nextDay) nextDay = d;
  }
  return { todayDay, behind, nextDay };
}

/** 1-indexed plan day for today (not capped). */
export function planDayNumber(state: YearPlanState, today = todayISO()): number {
  return Math.max(1, diffDaysISO(state.startDateISO, today) + 1);
}

export function defaultFinishISO(state: YearPlanState): string {
  return addDaysISO(state.startDateISO, 364);
}

function save(patch: Partial<YearPlanState>): YearPlanState | null {
  const cur = getYearPlanState();
  if (!cur) return null;
  const next = { ...cur, ...patch };
  setYearPlanState(next);
  return getYearPlanState();
}

/** Everything up to and including `seq` is read. */
export function markReadThrough(seq: number): YearPlanState | null {
  const cur = getYearPlanState();
  if (!cur) return null;
  return save({ position: Math.max(cur.position, seq) });
}

/** `seq` and everything after it is unread again. */
export function markUnreadFrom(seq: number): YearPlanState | null {
  const cur = getYearPlanState();
  if (!cur) return null;
  const before = seqBefore(scopeSequence(cur.scope), seq);
  return save({ position: Math.min(cur.position, before) });
}

/**
 * Called by the reader when a chapter opens. Reading in order (opening the
 * chapter after the next unread one, or a couple past it) marks the ones in
 * between as read. Browsing elsewhere never moves the plan.
 */
export function advanceOnOpen(slug: string, chapter: number): boolean {
  const cur = getYearPlanState();
  if (!cur) return false;
  const next = positionAfterOpening(scopeSequence(cur.scope), cur.position, slug, chapter);
  if (next == null || next <= cur.position) return false;
  save({ position: next });
  return true;
}

/** Group a run of read chapters into "Genesis 1–22 · Job 1–42" style ranges. */
export function summarizeRanges(items: DayReadingItem[]): string[] {
  const out: string[] = [];
  let i = 0;
  while (i < items.length) {
    const a = items[i];
    let j = i;
    while (
      j + 1 < items.length &&
      items[j + 1].book_id === a.book_id &&
      items[j + 1].chapter === items[j].chapter + 1
    ) {
      j += 1;
    }
    out.push(
      j > i ? `${a.book_title} ${a.chapter}–${items[j].chapter}` : `${a.book_title} ${a.chapter}`,
    );
    i = j + 1;
  }
  return out;
}
