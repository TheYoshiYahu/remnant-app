/**
 * Plans — browse, start, and walk curated reading plans.
 *
 * Web-served (Block 1): standard fetches against /v1/plans + /v1/plans/progress.
 * Plan definitions are public; progress is per-account (auth-required to start /
 * track). Anonymous users can browse and are nudged to sign in to track.
 *
 * Routes within this single component via ?slug= : no slug → plan list; with a
 * slug → the plan's daily view (today's passages, mark complete, progress %).
 */

import { useEffect, useMemo, useState } from "react";
import {
  type ReadingPlanSummary,
  type ReadingPlanDetail,
  type PlanProgress,
  listPlans,
  getPlan,
  getPlanProgress,
  updatePlanProgress,
} from "../lib/api";
import { hasJwtCookie } from "../lib/display-prefs-sync";
import { loadStoredNativeToken } from "../lib/native-auth";

function currentSlug(): string | null {
  if (typeof window === "undefined") return null;
  return new URLSearchParams(window.location.search).get("slug");
}

export default function Plans() {
  const [authed, setAuthed] = useState(false);
  const [slug, setSlug] = useState<string | null>(currentSlug());
  const [plans, setPlans] = useState<ReadingPlanSummary[]>([]);
  const [detail, setDetail] = useState<ReadingPlanDetail | null>(null);
  const [progress, setProgress] = useState<PlanProgress[]>([]);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const onPop = () => setSlug(currentSlug());
    window.addEventListener("popstate", onPop);
    return () => window.removeEventListener("popstate", onPop);
  }, []);

  useEffect(() => {
    let cancelled = false;
    void loadStoredNativeToken().then(async () => {
      if (cancelled) return;
      const ok = hasJwtCookie();
      setAuthed(ok);
      try {
        const [pl, pr] = await Promise.all([
          listPlans(),
          ok ? getPlanProgress() : Promise.resolve({ progress: [] }),
        ]);
        if (cancelled) return;
        setPlans(pl.plans);
        setProgress(pr.progress);
      } catch (e) {
        if (!cancelled) setError(String(e));
      }
    });
    return () => {
      cancelled = true;
    };
  }, []);

  useEffect(() => {
    if (!slug) {
      setDetail(null);
      return;
    }
    let cancelled = false;
    getPlan(slug)
      .then((d) => !cancelled && setDetail(d))
      .catch((e) => !cancelled && setError(String(e)));
    return () => {
      cancelled = true;
    };
  }, [slug]);

  const progressBySlug = useMemo(() => {
    const m: Record<string, PlanProgress> = {};
    for (const p of progress) m[p.plan_slug] = p;
    return m;
  }, [progress]);

  function navTo(nextSlug: string | null) {
    const url = nextSlug ? `/plans?slug=${encodeURIComponent(nextSlug)}` : "/plans";
    window.history.pushState({}, "", url);
    setSlug(nextSlug);
  }

  async function startPlan(s: string) {
    try {
      const p = await updatePlanProgress(s, { start: true });
      setProgress((prev) => [...prev.filter((x) => x.plan_slug !== s), p]);
    } catch (e) {
      setError(String(e));
    }
  }

  async function markDay(s: string, day: number) {
    try {
      const p = await updatePlanProgress(s, {
        completed_day: day,
        current_day: day + 1,
      });
      setProgress((prev) => [...prev.filter((x) => x.plan_slug !== s), p]);
    } catch (e) {
      setError(String(e));
    }
  }

  // ── Detail (daily) view ──────────────────────────────────────────────
  if (slug && detail) {
    const prog = progressBySlug[slug];
    const started = !!prog;
    const completed = prog?.completed_days ?? [];
    const pct = detail.day_count
      ? Math.round((completed.length / detail.day_count) * 100)
      : 0;
    const today = prog?.current_day ?? 1;
    const todayDay = detail.days.find((d) => d.day_number === today);

    return (
      <div className="mx-auto max-w-2xl px-6 py-8">
        <button
          onClick={() => navTo(null)}
          className="text-sm text-[var(--reader-muted)] hover:underline"
        >
          ← all plans
        </button>
        <h1 className="mt-2 text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          {detail.title}
        </h1>
        {detail.description && (
          <p className="mt-2 text-base text-[var(--reader-muted)]">
            {detail.description}
          </p>
        )}

        {error && <p className="mt-2 text-sm text-red-700">{error}</p>}

        {!authed && (
          <p className="mt-4 text-sm text-[var(--reader-muted)]">
            <a href="/sign-in" className="underline">
              Sign in
            </a>{" "}
            to start this plan and track your progress across devices.
          </p>
        )}

        {authed && !started && (
          <button
            onClick={() => startPlan(slug)}
            className="mt-4 inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
          >
            Start this plan
          </button>
        )}

        {authed && started && (
          <div className="mt-4">
            <div className="flex items-center justify-between text-sm text-[var(--reader-muted)]">
              <span>
                {completed.length} of {detail.day_count} days
              </span>
              <span>{pct}%</span>
            </div>
            <div className="mt-1 h-2 w-full overflow-hidden rounded bg-[var(--reader-surface)]">
              <div
                className="h-full bg-[var(--reader-accent)]"
                style={{ width: `${pct}%` }}
              />
            </div>

            {todayDay && (
              <div className="mt-5 rounded-lg border border-[var(--reader-rule)] px-4 py-3">
                <p className="font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
                  Day {todayDay.day_number}
                </p>
                <ul className="mt-1 space-y-1">
                  {todayDay.passages.map((p, i) => (
                    <li key={i} className="text-base text-[var(--reader-text)]">
                      {p.label}
                    </li>
                  ))}
                </ul>
                <div className="mt-3 flex gap-3">
                  <a
                    href="/read"
                    className="inline-flex items-center justify-center rounded border border-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-[var(--reader-text)] hover:opacity-90"
                  >
                    Open reader
                  </a>
                  {!completed.includes(todayDay.day_number) && (
                    <button
                      onClick={() => markDay(slug, todayDay.day_number)}
                      className="inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
                    >
                      Mark day complete
                    </button>
                  )}
                </div>
              </div>
            )}

            {/* Full day list */}
            <ul className="mt-5 space-y-2">
              {detail.days.map((d) => (
                <li
                  key={d.day_number}
                  className="flex items-center justify-between rounded border border-[var(--reader-rule)] px-3 py-2 text-sm"
                >
                  <span className="text-[var(--reader-text)]">
                    Day {d.day_number} ·{" "}
                    {d.passages.map((p) => p.label).join("; ")}
                  </span>
                  {completed.includes(d.day_number) ? (
                    <span className="text-[var(--reader-accent)]">✓</span>
                  ) : (
                    <button
                      onClick={() => markDay(slug, d.day_number)}
                      className="text-xs text-[var(--reader-muted)] hover:underline"
                    >
                      mark
                    </button>
                  )}
                </li>
              ))}
            </ul>
          </div>
        )}
      </div>
    );
  }

  // ── List view ────────────────────────────────────────────────────────
  return (
    <div className="mx-auto max-w-2xl px-6 py-8">
      <header className="mb-4 flex items-center justify-between">
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          Reading Plans
        </h1>
        <a href="/today" className="text-sm text-[var(--reader-muted)] hover:underline">
          ← back
        </a>
      </header>
      {error && <p className="text-sm text-red-700">{error}</p>}
      <ul className="space-y-3">
        {plans.map((p) => {
          const prog = progressBySlug[p.slug];
          const pct =
            prog && p.day_count
              ? Math.round((prog.completed_days.length / p.day_count) * 100)
              : 0;
          return (
            <li key={p.id}>
              <button
                onClick={() => navTo(p.slug)}
                className="block w-full rounded-lg border border-[var(--reader-rule)] px-4 py-3 text-left hover:border-[var(--reader-text)]"
              >
                <p className="text-base font-semibold text-[var(--reader-text)]">
                  {p.title}
                </p>
                {p.description && (
                  <p className="mt-1 text-sm text-[var(--reader-muted)]">
                    {p.description}
                  </p>
                )}
                <p className="mt-1 font-sans text-xs text-[var(--reader-muted)]">
                  {p.day_count} days{prog ? ` · ${pct}% complete` : ""}
                </p>
              </button>
            </li>
          );
        })}
        {plans.length === 0 && !error && (
          <li className="text-sm text-[var(--reader-muted)]">Loading plans…</li>
        )}
      </ul>
    </div>
  );
}
