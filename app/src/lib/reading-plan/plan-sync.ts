/**
 * reading-plan/plan-sync.ts — keep a partner's year plan (scope, start,
 * position, pace) the same on their phone and their tablet. S442.
 *
 * Same idea as display-prefs-sync: local first, account second.
 *   - start: pull the account copy once; whichever copy is newer (updatedAt)
 *     wins — adopt the server's, or push ours.
 *   - then: every local change (plan-store fires `rop:yearplan-changed`) is
 *     pushed, debounced. The server refuses to let an older copy overwrite a
 *     newer one and hands the newer one back, which we adopt.
 *
 * Started only for entitled partners (the server 403s everyone else). Safe to
 * call more than once — one listener per page.
 */

import { getYearPlanSync, putYearPlanSync } from "../api";
import {
  getYearPlanState,
  normalizeYearPlanState,
  setYearPlanState,
  YEAR_PLAN_CHANGED_EVENT,
  type YearPlanState,
} from "./plan-store";

let started = false;
let timer: ReturnType<typeof setTimeout> | null = null;
let adopting = false;

function adopt(raw: Record<string, unknown> | null, updatedAtMs: number | null): void {
  if (!raw || updatedAtMs == null) return;
  const local = getYearPlanState();
  if (local?.updatedAt && local.updatedAt >= updatedAtMs) return;
  const next: YearPlanState = { ...normalizeYearPlanState(raw), updatedAt: updatedAtMs };
  // Day/week anchors are per device — keep ours.
  if (local?.anchor) next.anchor = local.anchor;
  if (local?.weekAnchor) next.weekAnchor = local.weekAnchor;
  adopting = true;
  try {
    setYearPlanState(next, false);
  } finally {
    adopting = false;
  }
}

function wireState(s: YearPlanState): Record<string, unknown> {
  // Anchors stay on the device; everything else syncs.
  const { anchor: _a, weekAnchor: _w, ...rest } = s;
  void _a;
  void _w;
  return rest as unknown as Record<string, unknown>;
}

async function push(): Promise<void> {
  const local = getYearPlanState();
  if (!local || !local.updatedAt) return;
  try {
    const res = await putYearPlanSync(wireState(local), local.updatedAt);
    if (res.updated_at_ms != null && res.updated_at_ms > local.updatedAt) {
      adopt(res.state, res.updated_at_ms);
    }
  } catch {
    /* offline / locked — local copy stands; next change retries */
  }
}

export function startYearPlanSync(): void {
  if (started || typeof window === "undefined") return;
  started = true;

  void (async () => {
    try {
      const remote = await getYearPlanSync();
      const local = getYearPlanState();
      if (remote.updated_at_ms != null && (!local?.updatedAt || remote.updated_at_ms > local.updatedAt)) {
        adopt(remote.state, remote.updated_at_ms);
      } else if (local?.updatedAt) {
        await push();
      } else if (local) {
        // A plan from before sync existed (no stamp yet): stamp it, which
        // fires the change event and pushes it up.
        setYearPlanState(local);
      }
    } catch {
      /* offline / not entitled — stay local */
    }
  })();

  window.addEventListener(YEAR_PLAN_CHANGED_EVENT, () => {
    if (adopting) return;
    if (timer) clearTimeout(timer);
    timer = setTimeout(() => {
      timer = null;
      void push();
    }, 1500);
  });
}
