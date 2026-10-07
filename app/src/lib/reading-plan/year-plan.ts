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

/** `persist` false for a preview (no plan started yet) so nothing is saved. */
export function pacedPlanFor(
  state: YearPlanState,
  today = todayISO(),
  persist = true,
): PacedPlan {
  const s = withAnchors(state, today, persist);
  return pacePlan({
    sequence: scopeSequence(s.scope),
    startISO: s.startDateISO,
    todayISO: today,
    anchorPosition: s.anchor?.position ?? s.position,
    weekAnchorPosition: s.weekAnchor?.position ?? s.position,
    pace: effectivePace(s),
  });
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
