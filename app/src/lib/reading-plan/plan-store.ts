/**
 * reading-plan/plan-store.ts — persistence for the "Read the Scriptures in a
 * Year" plan state (roadmap minion B-1).
 *
 * Stores the reader's chosen scope, the plan start date, and a resume
 * position under a single localStorage key. The pacing math itself
 * (sequence → 365 buckets, Day N) lives in pacing.ts — this module owns
 * ONLY the persisted state.
 *
 * Persistence convention mirrors the rest of the codebase (theme.ts,
 * ArrangedReading.tsx, planner-store.ts): a `typeof window` SSR guard plus a
 * try/catch around every localStorage touch so private-mode / quota errors
 * degrade to in-memory defaults instead of throwing.
 *
 * >>> NOTE for B-2/B-3:
 *   - localStorage key:   "rop_yearplan_v1"
 *   - shape:              { scope, startDateISO, position }
 *   - scope:             "canon" | "all" (matches ArrangedReading extras toggle)
 *   - startDateISO:      "YYYY-MM-DD" civil day the plan began (Day 1)
 *   - position:          a `seq` value (the chronological-reading.json seq of
 *                        the last in-sequence chapter read) — same unit as
 *                        ArrangedReading's rop_arranged_pos_v1, so the two can
 *                        share/resume position. 0 = not started.
 * <<<
 */

import type { PlanScope } from "./pacing";

// ---------------------------------------------------------------------------
// Domain
// ---------------------------------------------------------------------------

export interface YearPlanState {
  /** Which slice of the library: canon-only or all of scripture. */
  scope: PlanScope;
  /** Civil day the plan started (Day 1), as "YYYY-MM-DD". */
  startDateISO: string;
  /** Resume marker: the chronological seq of the last chapter read (0 = none). */
  position: number;
}

export const YEAR_PLAN_KEY = "rop_yearplan_v1";

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

const ISO_DATE_RE = /^\d{4}-\d{2}-\d{2}$/;

function isScope(v: unknown): v is PlanScope {
  return v === "canon" || v === "all";
}

/** Coerce an unknown blob into a valid YearPlanState, filling defaults for
 *  any missing/garbage field (defensive — never throws). */
function normalize(raw: unknown): YearPlanState {
  const fallback = defaultYearPlanState();
  if (!raw || typeof raw !== "object") return fallback;
  const o = raw as Record<string, unknown>;

  const scope = isScope(o.scope) ? o.scope : fallback.scope;
  const startDateISO =
    typeof o.startDateISO === "string" && ISO_DATE_RE.test(o.startDateISO)
      ? o.startDateISO
      : fallback.startDateISO;
  const position =
    typeof o.position === "number" && Number.isFinite(o.position) && o.position >= 0
      ? Math.floor(o.position)
      : fallback.position;

  return { scope, startDateISO, position };
}

// ---------------------------------------------------------------------------
// Read / write / clear
// ---------------------------------------------------------------------------

/**
 * Read the persisted plan state. Returns `null` when no plan has been started
 * (key absent) — callers distinguish "not started" from "started with
 * defaults". Garbage/partial stored values are normalized, not thrown.
 */
export function getYearPlanState(): YearPlanState | null {
  if (typeof window === "undefined") return null;
  try {
    const raw = window.localStorage.getItem(YEAR_PLAN_KEY);
    if (!raw) return null;
    return normalize(JSON.parse(raw));
  } catch {
    return null;
  }
}

/** Write the full plan state. Silent no-op if localStorage is unavailable. */
export function setYearPlanState(state: YearPlanState): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(YEAR_PLAN_KEY, JSON.stringify(normalize(state)));
  } catch {
    /* quota / private mode — state will not persist this session */
  }
}

/**
 * Patch part of the plan state, reading current (or defaults) first. Useful
 * for "advance position" / "switch scope" without re-supplying every field.
 */
export function updateYearPlanState(patch: Partial<YearPlanState>): YearPlanState {
  const current = getYearPlanState() ?? defaultYearPlanState();
  const next = normalize({ ...current, ...patch });
  setYearPlanState(next);
  return next;
}

/**
 * Start (or restart) a plan: pick scope + start date (defaults to today),
 * reset position to 0. Returns the persisted state.
 */
export function startYearPlan(
  scope: PlanScope,
  startDateISO: string = todayISO(),
): YearPlanState {
  const state = normalize({ scope, startDateISO, position: 0 });
  setYearPlanState(state);
  return state;
}

/** Remove all year-plan state. Silent no-op if localStorage is unavailable. */
export function clearYearPlanState(): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.removeItem(YEAR_PLAN_KEY);
  } catch {
    /* ignore */
  }
}
