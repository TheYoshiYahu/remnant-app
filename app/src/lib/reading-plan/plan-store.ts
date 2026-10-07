/**
 * reading-plan/plan-store.ts — persistence for the "Read the Scriptures in a
 * Year" plan state (roadmap minion B-1; v2 in S442).
 *
 * Stores the reader's chosen scope, the plan start date, the resume position
 * and (partners, S442) their pace under a single localStorage key. The pacing
 * math lives in pacing.ts (the fixed 365-day grid the free header uses) and
 * paced.ts (the partner's own pace) — this module owns ONLY the persisted
 * state.
 *
 * Persistence convention mirrors the rest of the codebase (theme.ts,
 * ArrangedReading.tsx, planner-store.ts): a `typeof window` SSR guard plus a
 * try/catch around every localStorage touch so private-mode / quota errors
 * degrade to in-memory defaults instead of throwing.
 *
 * >>> State (S442 v2):
 *   - localStorage key:   "rop_yearplan_v2"  (v1 "rop_yearplan_v1" is read and
 *                         migrated once; the v1 key is left in place)
 *   - scope:             "canon" | "all" (matches ArrangedReading extras toggle)
 *   - startDateISO:      "YYYY-MM-DD" civil day the plan began (Day 1)
 *   - position:          the chronological-reading.json `seq` of the LAST
 *                        CHAPTER READ (0 = none). The single source of truth
 *                        for where the reader is.
 *   - pace?:             partner pace (paced.ts PaceSettings)
 *   - anchor?:           { dateISO, position } — position at the start of the
 *                        day, so today's list doesn't move while they read
 *   - weekAnchor?:       { weekStartISO, position } — position at the start of
 *                        the plan week (weekly goals count from here)
 *   - updatedAt:         ms timestamp of the last change (account sync is
 *                        last-writer-wins on this)
 * <<<
 *
 * Every write dispatches `rop:yearplan-changed` on window so the account sync
 * (plan-sync.ts) and any open view can follow along.
 */

import type { PlanScope } from "./pacing";
import { isISODate, type PaceMode, type PaceSettings } from "./paced";

// ---------------------------------------------------------------------------
// Domain
// ---------------------------------------------------------------------------

export interface YearPlanState {
  /** Which slice of the library: canon-only or all of scripture. */
  scope: PlanScope;
  /** Civil day the plan started (Day 1), as "YYYY-MM-DD". */
  startDateISO: string;
  /** The chronological seq of the last chapter read (0 = none). */
  position: number;
  /** Partner pace (absent = the plan's default year). */
  pace?: PaceSettings;
  anchor?: { dateISO: string; position: number };
  weekAnchor?: { weekStartISO: string; position: number };
  /** ms since epoch of the last change. */
  updatedAt?: number;
}

export const YEAR_PLAN_KEY = "rop_yearplan_v2";
export const YEAR_PLAN_KEY_V1 = "rop_yearplan_v1";
export const YEAR_PLAN_CHANGED_EVENT = "rop:yearplan-changed";

/** Civil-day "YYYY-MM-DD" for a Date in LOCAL time (matches dayNumberFor). */
export function todayISO(d: Date = new Date()): string {
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  return `${y}-${m}-${day}`;
}

/** Default state: canon scope, started today, not yet advanced. */
export function defaultYearPlanState(): YearPlanState {
  return { scope: "canon", startDateISO: todayISO(), position: 0 };
}

// ---------------------------------------------------------------------------
// Validation
// ---------------------------------------------------------------------------

function isScope(v: unknown): v is PlanScope {
  return v === "canon" || v === "all";
}

function isMode(v: unknown): v is PaceMode {
  return v === "byDate" || v === "perDay" || v === "weekly";
}

function nonNegInt(v: unknown): number | null {
  return typeof v === "number" && Number.isFinite(v) && v >= 0 ? Math.floor(v) : null;
}

function normalizePace(raw: unknown): PaceSettings | undefined {
  if (!raw || typeof raw !== "object") return undefined;
  const o = raw as Record<string, unknown>;
  if (!isMode(o.mode)) return undefined;
  const pace: PaceSettings = { mode: o.mode };
  if (isISODate(o.endDateISO)) pace.endDateISO = o.endDateISO;
  const perDay = nonNegInt(o.perDay);
  if (perDay != null && perDay >= 1) pace.perDay = Math.min(perDay, 200);
  if (o.weeklyGoals && typeof o.weeklyGoals === "object") {
    const goals: Record<string, number> = {};
    for (const [k, v] of Object.entries(o.weeklyGoals as Record<string, unknown>)) {
      const n = nonNegInt(v);
      if (isISODate(k) && n != null && n >= 1) goals[k] = Math.min(n, 2000);
    }
    pace.weeklyGoals = goals;
  }
  return pace;
}

/** Coerce an unknown blob into a valid YearPlanState, filling defaults for
 *  any missing/garbage field (defensive — never throws). */
export function normalizeYearPlanState(raw: unknown): YearPlanState {
  const fallback = defaultYearPlanState();
  if (!raw || typeof raw !== "object") return fallback;
  const o = raw as Record<string, unknown>;

  const state: YearPlanState = {
    scope: isScope(o.scope) ? o.scope : fallback.scope,
    startDateISO: isISODate(o.startDateISO) ? o.startDateISO : fallback.startDateISO,
    position: nonNegInt(o.position) ?? fallback.position,
  };
  const pace = normalizePace(o.pace);
  if (pace) state.pace = pace;
  const a = o.anchor as Record<string, unknown> | undefined;
  if (a && isISODate(a.dateISO) && nonNegInt(a.position) != null) {
    state.anchor = { dateISO: a.dateISO, position: nonNegInt(a.position)! };
  }
  const w = o.weekAnchor as Record<string, unknown> | undefined;
  if (w && isISODate(w.weekStartISO) && nonNegInt(w.position) != null) {
    state.weekAnchor = { weekStartISO: w.weekStartISO, position: nonNegInt(w.position)! };
  }
  const u = nonNegInt(o.updatedAt);
  if (u != null) state.updatedAt = u;
  return state;
}

// ---------------------------------------------------------------------------
// Read / write / clear
// ---------------------------------------------------------------------------

function emitChanged(): void {
  try {
    window.dispatchEvent(new Event(YEAR_PLAN_CHANGED_EVENT));
  } catch {
    /* no window */
  }
}

/**
 * Read the persisted plan state. Returns `null` when no plan has been started
 * (key absent) — callers distinguish "not started" from "started with
 * defaults". A v1 blob is migrated to v2 on first read. Garbage/partial
 * stored values are normalized, not thrown.
 */
export function getYearPlanState(): YearPlanState | null {
  if (typeof window === "undefined") return null;
  try {
    const raw = window.localStorage.getItem(YEAR_PLAN_KEY);
    if (raw) return normalizeYearPlanState(JSON.parse(raw));
    const v1 = window.localStorage.getItem(YEAR_PLAN_KEY_V1);
    if (!v1) return null;
    const migrated = normalizeYearPlanState(JSON.parse(v1));
    window.localStorage.setItem(YEAR_PLAN_KEY, JSON.stringify(migrated));
    return migrated;
  } catch {
    return null;
  }
}

/** Write the full plan state. Silent no-op if localStorage is unavailable.
 *  `touch` (default true) stamps updatedAt; the account sync passes false
 *  when adopting the server's copy so it keeps the server's stamp. `emit`
 *  (default true) fires the change event; anchor refreshes made during a
 *  render pass false so no listener sets state mid-render. */
export function setYearPlanState(
  state: YearPlanState,
  touch = true,
  emit = true,
): void {
  if (typeof window === "undefined") return;
  const next = normalizeYearPlanState(state);
  if (touch) next.updatedAt = Date.now();
  try {
    window.localStorage.setItem(YEAR_PLAN_KEY, JSON.stringify(next));
  } catch {
    /* quota / private mode — state will not persist this session */
  }
  if (emit) emitChanged();
}

/**
 * Patch part of the plan state, reading current (or defaults) first. Useful
 * for "advance position" / "switch scope" without re-supplying every field.
 */
export function updateYearPlanState(patch: Partial<YearPlanState>): YearPlanState {
  const current = getYearPlanState() ?? defaultYearPlanState();
  const next = normalizeYearPlanState({ ...current, ...patch });
  setYearPlanState(next);
  return getYearPlanState() ?? next;
}

/**
 * Start (or restart) a plan: pick scope + start date (defaults to today),
 * reset position to 0. A partner's pace setting is kept (its finish date is
 * dropped so it re-defaults to a year from the new start). Returns the
 * persisted state.
 */
export function startYearPlan(
  scope: PlanScope,
  startDateISO: string = todayISO(),
): YearPlanState {
  const prev = getYearPlanState();
  const pace = prev?.pace ? { ...prev.pace, endDateISO: undefined, weeklyGoals: {} } : undefined;
  const state = normalizeYearPlanState({ scope, startDateISO, position: 0, pace });
  setYearPlanState(state);
  return getYearPlanState() ?? state;
}

/** Remove all year-plan state. Silent no-op if localStorage is unavailable. */
export function clearYearPlanState(): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.removeItem(YEAR_PLAN_KEY);
    window.localStorage.removeItem(YEAR_PLAN_KEY_V1);
  } catch {
    /* ignore */
  }
  emitChanged();
}
