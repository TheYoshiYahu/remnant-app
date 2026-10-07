/**
 * YearPlan.tsx — "See the whole plan" (S442, YEAR_PLAN_STUDY_SPEC.md steps
 * 1–3, with doorways to steps 4–5).
 *
 * Lives at `/plan`. Top-level route in App.tsx's pathname switch. Partner
 * feature (active / trialing); everyone else sees PlanLock.
 *
 *   1. The whole plan: every day ahead, grouped by plan week and folded by
 *      month; chapters colored by source class like the reader's citations;
 *      read chapters checked; today highlighted and scrolled into view; each
 *      chapter opens in the reader; canon / all-of-Scripture toggle.
 *   2. Your own pace: finish by a date, chapters a day, or a goal per week —
 *      the consequence always shown in plain words. The order never changes;
 *      position (the last chapter read) is the single source of truth.
 *   3. Notes on any day or chapter (account-stored), plus every note in one
 *      searchable list.
 *   → My Teachings (/my-teachings) and For Teachers (/teach, top tier).
 */

import { useEffect, useMemo, useRef, useState } from "react";
import type { DayReadingItem, PlanScope } from "../lib/reading-plan/pacing";
import {
  getYearPlanState,
  startYearPlan,
  todayISO,
  updateYearPlanState,
  YEAR_PLAN_CHANGED_EVENT,
  type YearPlanState,
} from "../lib/reading-plan/plan-store";
import {
  defaultFinishISO,
  effectivePace,
  markReadThrough,
  markUnreadFrom,
  pacedPlanFor,
  planDayNumber,
  scopeSequence,
  summarizeRanges,
} from "../lib/reading-plan/year-plan";
import {
  addDaysISO,
  diffDaysISO,
  weekStartFor,
  type PacedDay,
  type PacedPlan,
  type PaceMode,
  type PaceSettings,
} from "../lib/reading-plan/paced";
import { classifyBookSlug } from "../lib/book-source-class";
import {
  PLAN_LOCK_MESSAGE,
  PLAN_LOCK_TITLE,
  TEACHER_LOCK_MESSAGE,
  TEACHER_LOCK_TITLE,
} from "../lib/reading-plan/plan-lock";
import { useEntitlement } from "../lib/reading-plan/useEntitlement";
import { startYearPlanSync } from "../lib/reading-plan/plan-sync";
import { printBlocks, readingBlocksFromDays } from "../lib/study-blocks";
import type { PlanNote } from "../lib/api";
import PlanLock, { CARD, GHOST_BTN, INPUT, PlanShell, SMALL_BTN } from "../components/PlanLock";
import { NoteCard, NoteComposer } from "../components/PlanNotes";
import { noteRef, usePlanNotes } from "../lib/reading-plan/plan-notes";

/** Mirrors ArrangedReading.tsx / YearPlanHeader.tsx's extras toggle key. */
const ARRANGED_EXTRAS_KEY = "rop_arranged_extras_v1";

function syncArrangedExtras(scope: PlanScope): void {
  try {
    window.localStorage.setItem(ARRANGED_EXTRAS_KEY, scope === "all" ? "1" : "0");
  } catch {
    /* private mode */
  }
}

function isoToDate(iso: string): Date {
  const [y, m, d] = iso.split("-").map(Number);
  return new Date(y, m - 1, d);
}

const monthFmt = new Intl.DateTimeFormat(undefined, { month: "long", year: "numeric" });
const dayFmt = new Intl.DateTimeFormat(undefined, { weekday: "short", month: "short", day: "numeric" });
const shortFmt = new Intl.DateTimeFormat(undefined, { month: "short", day: "numeric" });
const longFmt = new Intl.DateTimeFormat(undefined, { month: "long", day: "numeric", year: "numeric" });
const fmtLong = (iso: string) => longFmt.format(isoToDate(iso));
const fmtShort = (iso: string) => shortFmt.format(isoToDate(iso));

export default function YearPlan() {
  const ent = useEntitlement();
  useEffect(() => {
    if (ent.partner) startYearPlanSync();
  }, [ent.partner]);

  return (
    <PlanShell>
      <h1 className="mt-4 font-serif text-2xl font-semibold">The whole plan</h1>
      <p className="mt-1 text-sm text-[var(--reader-muted)]">
        Read the Scriptures in a Year — every day laid out ahead of time, at your own pace.
      </p>
      {ent.loading && <p className="mt-6 text-sm text-[var(--reader-muted)]">Loading…</p>}
      {!ent.loading && !ent.partner && (
        <PlanLock
          title={PLAN_LOCK_TITLE}
          message={PLAN_LOCK_MESSAGE}
          tierName="Study Notes"
          signedIn={ent.signedIn}
        />
      )}
      {!ent.loading && ent.partner && <PlanView teacher={ent.teacher} signedIn={ent.signedIn} />}
    </PlanShell>
  );
}

// ───────────────────────────────────────────────────────────────────────

interface WeekGroup {
  weekStartISO: string;
  weekNumber: number;
  days: PacedDay[];
}
interface MonthGroup {
  key: string;
  label: string;
  weeks: WeekGroup[];
  chapterCount: number;
  hasToday: boolean;
}

function usePlanState(): [YearPlanState | null, () => void] {
  const [plan, setPlan] = useState<YearPlanState | null>(() => getYearPlanState());
  useEffect(() => {
    const on = () => setPlan(getYearPlanState());
    window.addEventListener(YEAR_PLAN_CHANGED_EVENT, on);
    return () => window.removeEventListener(YEAR_PLAN_CHANGED_EVENT, on);
  }, []);
  return [plan, () => setPlan(getYearPlanState())];
}

function PlanView({ teacher, signedIn }: { teacher: boolean; signedIn: boolean }) {
  const [plan] = usePlanState();
  const [previewScope, setPreviewScope] = useState<PlanScope>("canon");
  const today = useMemo(() => todayISO(), []);

  const state: YearPlanState = plan ?? { scope: previewScope, startDateISO: today, position: 0 };
  const scope = state.scope;
  const pace = effectivePace(state);

  const paced: PacedPlan = useMemo(
    () => pacedPlanFor(state, today, !!plan),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [plan, previewScope, today],
  );

  const sequence = useMemo(() => scopeSequence(scope), [scope]);
  const readItems = useMemo(() => sequence.filter((e) => e.seq <= state.position), [sequence, state.position]);
  const nextUnreadSeq = useMemo(
    () => sequence.find((e) => e.seq > state.position)?.seq ?? null,
    [sequence, state.position],
  );

  const notesApi = usePlanNotes(true);

  const months: MonthGroup[] = useMemo(() => {
    const out: MonthGroup[] = [];
    for (const day of paced.days) {
      const key = day.dateISO.slice(0, 7);
      let m = out[out.length - 1];
      if (!m || m.key !== key) {
        m = { key, label: monthFmt.format(isoToDate(day.dateISO)), weeks: [], chapterCount: 0, hasToday: false };
        out.push(m);
      }
      let w = m.weeks[m.weeks.length - 1];
      if (!w || w.weekStartISO !== day.weekStartISO) {
        w = { weekStartISO: day.weekStartISO, weekNumber: day.weekNumber, days: [] };
        m.weeks.push(w);
      }
      w.days.push(day);
      m.chapterCount += day.items.length;
      if (day.dateISO === today) m.hasToday = true;
    }
    return out;
  }, [paced, today]);

  // Weekly mode also shows goal-able weeks that hold no reading yet (a week
  // the reader set to a goal of 1 still needs its header to change it).
  const [open, setOpen] = useState<Set<string>>(() => new Set());
  const initialised = useRef(false);
  useEffect(() => {
    if (initialised.current || months.length === 0) return;
    initialised.current = true;
    setOpen(new Set([months[0].key]));
  }, [months]);

  const todayRef = useRef<HTMLLIElement | null>(null);
  const scrolled = useRef(false);
  useEffect(() => {
    if (scrolled.current || !plan) return;
    if (todayRef.current) {
      scrolled.current = true;
      todayRef.current.scrollIntoView({ block: "center" });
    }
  });

  const toggleMonth = (key: string) =>
    setOpen((prev) => {
      const next = new Set(prev);
      if (next.has(key)) next.delete(key);
      else next.add(key);
      return next;
    });
  const allOpen = months.length > 0 && open.size === months.length;

  const goToday = () => {
    if (months[0]) setOpen((prev) => new Set(prev).add(months[0].key));
    window.setTimeout(() => todayRef.current?.scrollIntoView({ block: "center", behavior: "smooth" }), 0);
  };

  const changeScope = (next: PlanScope) => {
    if (next === scope) return;
    syncArrangedExtras(next);
    if (plan) updateYearPlanState({ scope: next });
    else setPreviewScope(next);
  };

  const begin = () => {
    syncArrangedExtras(scope);
    startYearPlan(scope);
    scrolled.current = false;
  };

  const setPace = (p: PaceSettings) => {
    if (!plan) startYearPlan(scope);
    updateYearPlanState({ pace: p });
  };

  const totalChapters = sequence.length;
  const readCount = readItems.length;
  const dayN = plan ? planDayNumber(plan, today) : 1;
  const nothingToday = plan && paced.days.length > 0 && paced.days[0].dateISO !== today;

  // Notes indexes
  const notesByChapter = useMemo(() => {
    const m = new Map<string, PlanNote[]>();
    for (const n of notesApi.notes) {
      if (n.book_slug && n.chapter) {
        const k = `${n.book_slug}::${n.chapter}`;
        m.set(k, [...(m.get(k) ?? []), n]);
      }
    }
    return m;
  }, [notesApi.notes]);
  const dayNotes = useMemo(() => {
    const m = new Map<string, PlanNote[]>();
    for (const n of notesApi.notes) {
      if (!n.book_slug && n.day_date) m.set(n.day_date, [...(m.get(n.day_date) ?? []), n]);
    }
    return m;
  }, [notesApi.notes]);

  // Teacher quick print
  const nextWeekStart = addDaysISO(weekStartFor(state.startDateISO, today), 7);
  const nextWeekDays = paced.days.filter((d) => d.weekStartISO === nextWeekStart);
  const [printOpen, setPrintOpen] = useState(false);
  const [teacherLockOpen, setTeacherLockOpen] = useState(false);

  return (
    <div className="mt-5">
      {/* Summary */}
      <div className={CARD}>
        {plan ? (
          <>
            <div className="text-sm font-semibold text-[var(--reader-accent)]">
              Day {dayN}
              <span className="font-normal text-[var(--reader-muted)]">
                {" "}
                &middot; began {fmtLong(plan.startDateISO)}
                {paced.finishDateISO ? <> &middot; finishing {fmtLong(paced.finishDateISO)}</> : null}
              </span>
            </div>
            <div className="mt-1 text-sm text-[var(--reader-text)]">
              {readCount} of {totalChapters} chapters read
              {paced.remaining === 0 && " — the whole plan is read. Well done."}
            </div>
            <div className="mt-2 h-1 w-full overflow-hidden rounded bg-[var(--reader-rule)]">
              <div
                className="h-full bg-[var(--reader-accent)]"
                style={{ width: `${totalChapters ? Math.round((readCount / totalChapters) * 100) : 0}%` }}
              />
            </div>
          </>
        ) : (
          <>
            <div className="text-sm text-[var(--reader-text)]">
              No plan running yet. Here is the whole plan as it would run if you began today.
            </div>
            <button type="button" onClick={begin} className="chrome-metal chrome-metal-gold mt-3">
              Begin this plan today
            </button>
          </>
        )}

        <div className="mt-3 flex flex-wrap items-center gap-2">
          <div
            role="group"
            aria-label="Which books the plan covers"
            className="flex overflow-hidden rounded border border-[var(--reader-rule)] text-sm"
          >
            {(["canon", "all"] as PlanScope[]).map((s) => (
              <button
                key={s}
                type="button"
                aria-pressed={scope === s}
                onClick={() => changeScope(s)}
                className={
                  "px-3 py-1.5 font-medium " +
                  (scope === s
                    ? "bg-[var(--reader-accent)] text-white"
                    : "bg-[var(--reader-surface)] text-[var(--reader-text)] hover:opacity-90")
                }
              >
                {s === "canon" ? "Just the canon" : "All of Scripture"}
              </button>
            ))}
          </div>
          {plan && (
            <button type="button" onClick={goToday} className={GHOST_BTN}>
              Go to today
            </button>
          )}
          <button
            type="button"
            onClick={() => setOpen(allOpen ? new Set() : new Set(months.map((m) => m.key)))}
            className={GHOST_BTN}
          >
            {allOpen ? "Collapse all months" : "Open all months"}
          </button>
        </div>
        <div className="mt-2 text-xs text-[var(--reader-muted)]">
          {scope === "all"
            ? "All of Scripture: the restored books woven into the order."
            : "The canon: the 66 books."}{" "}
          Tap any chapter to open it.
        </div>
      </div>

      {/* Pace */}
      <PaceControls
        pace={pace}
        startISO={state.startDateISO}
        today={today}
        paced={paced}
        onChange={setPace}
      />

      {/* Doorways */}
      <div className="mt-4 flex flex-wrap items-center gap-2 font-sans">
        <a href="/my-teachings" className="chrome-metal chrome-metal-emerald">
          My Teachings
        </a>
        {teacher ? (
          <>
            <a href="/teach" className="chrome-metal chrome-metal-gold">
              For teachers
            </a>
            {plan && nextWeekDays.length > 0 && (
              <button type="button" onClick={() => setPrintOpen((v) => !v)} className={GHOST_BTN}>
                Print next week&rsquo;s readings
              </button>
            )}
          </>
        ) : (
          <button type="button" onClick={() => setTeacherLockOpen((v) => !v)} className={GHOST_BTN} title="Everything tier">
            <span aria-hidden="true">🔒 </span>For teachers
          </button>
        )}
      </div>
      {teacherLockOpen && !teacher && (
        <PlanLock
          title={TEACHER_LOCK_TITLE}
          message={TEACHER_LOCK_MESSAGE}
          tierName="Everything"
          signedIn={signedIn}
        />
      )}
      {printOpen && teacher && (
        <QuickPrint
          days={nextWeekDays}
          title={`Readings for the week of ${fmtShort(nextWeekStart)}`}
          onClose={() => setPrintOpen(false)}
        />
      )}

      {/* Already read */}
      {readItems.length > 0 && (
        <details className={CARD + " mt-4"}>
          <summary className="cursor-pointer text-sm font-semibold text-[var(--reader-text)]">
            Already read · {readItems.length} chapters
          </summary>
          <p className="mt-2 font-serif text-sm leading-relaxed text-[var(--reader-muted)]">
            {summarizeRanges(readItems).join(" · ")}
          </p>
        </details>
      )}

      {nothingToday && (
        <p className="mt-4 rounded border border-[var(--reader-rule)] px-3 py-2 font-sans text-sm text-[var(--reader-muted)]">
          Nothing left for today at your pace — you&rsquo;re all caught up. Your next reading is below.
        </p>
      )}

      {/* Months */}
      <div className="mt-4 space-y-3">
        {months.map((m) => {
          const isOpen = open.has(m.key);
          return (
            <section key={m.key} className="rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)]">
              <button
                type="button"
                onClick={() => toggleMonth(m.key)}
                aria-expanded={isOpen}
                className="flex w-full items-center justify-between gap-3 px-4 py-3 text-left"
              >
                <span className="font-serif text-lg font-semibold">
                  {m.label}
                  {m.hasToday && (
                    <span className="ml-2 align-middle font-sans text-xs font-medium text-[var(--reader-accent)]">
                      this month
                    </span>
                  )}
                </span>
                <span className="shrink-0 font-sans text-xs text-[var(--reader-muted)]">
                  {m.chapterCount} chapters <span aria-hidden="true">{isOpen ? "▾" : "▸"}</span>
                </span>
              </button>
              {isOpen && (
                <div className="border-t border-[var(--reader-rule)] px-4 pb-3">
                  {m.weeks.map((w) => (
                    <div key={w.weekStartISO} className="mt-3">
                      <WeekHeader
                        key={`${w.weekStartISO}:${pace.weeklyGoals?.[w.weekStartISO] ?? ""}`}
                        week={w}
                        weekly={pace.mode === "weekly"}
                        goal={pace.weeklyGoals?.[w.weekStartISO] ?? null}
                        planned={paced.days
                          .filter((d) => d.weekStartISO === w.weekStartISO)
                          .reduce((s, d) => s + d.items.length, 0)}
                        onGoal={(g) => {
                          const goals = { ...(pace.weeklyGoals ?? {}) };
                          if (g == null) delete goals[w.weekStartISO];
                          else goals[w.weekStartISO] = g;
                          setPace({ ...pace, mode: "weekly", weeklyGoals: goals });
                        }}
                      />
                      <ul className="mt-1.5 space-y-1.5">
                        {w.days.map((d) => (
                          <DayRow
                            key={d.dateISO}
                            day={d}
                            isToday={d.dateISO === today}
                            position={state.position}
                            nextUnreadSeq={nextUnreadSeq}
                            scope={scope}
                            canMark={!!plan}
                            liRef={d === paced.days[0] ? todayRef : undefined}
                            notesForDay={dayNotes.get(d.dateISO) ?? []}
                            notesByChapter={notesByChapter}
                            notesApi={notesApi}
                          />
                        ))}
                      </ul>
                    </div>
                  ))}
                </div>
              )}
            </section>
          );
        })}
      </div>

      {/* Weekly mode: weeks after the last reading day can still carry a goal. */}
      {pace.mode === "weekly" && plan && <FutureWeekGoals pace={pace} paced={paced} today={today} onPace={setPace} />}

      <AllNotes notesApi={notesApi} />
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Pace
// ───────────────────────────────────────────────────────────────────────

function aboutPerDay(avg: number): string {
  if (avg <= 0) return "nothing more";
  if (avg < 1) {
    const every = Math.round(1 / avg);
    return every <= 1 ? "about 1 chapter a day" : `about 1 chapter every ${every} days`;
  }
  const r = Math.round(avg);
  return `about ${r} chapter${r === 1 ? "" : "s"} a day`;
}

function PaceControls({
  pace,
  startISO,
  today,
  paced,
  onChange,
}: {
  pace: PaceSettings;
  startISO: string;
  today: string;
  paced: PacedPlan;
  onChange: (p: PaceSettings) => void;
}) {
  const endISO = pace.endDateISO ?? defaultFinishISO({ scope: "canon", startDateISO: startISO, position: 0 });
  const modes: { id: PaceMode; label: string }[] = [
    { id: "byDate", label: "Finish by a date" },
    { id: "perDay", label: "Chapters a day" },
    { id: "weekly", label: "Week by week" },
  ];
  const finish = paced.finishDateISO;

  const consequence =
    paced.remaining === 0
      ? "Everything is read."
      : pace.mode === "byDate"
        ? `Finishing by ${fmtLong(endISO)} means ${aboutPerDay(paced.avgPerDay)}.`
        : pace.mode === "perDay"
          ? `At ${pace.perDay ?? 1} a day you'll finish on ${finish ? fmtLong(finish) : "—"}.`
          : `At these goals you'll finish on ${finish ? fmtLong(finish) : "—"}${
              finish && diffDaysISO(endISO, finish) > 0 ? ` — past your ${fmtShort(endISO)} target` : ""
            }.`;

  return (
    <div className={CARD + " mt-4"}>
      <div className="text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]">Your pace</div>
      <div role="group" aria-label="How to pace the plan" className="mt-2 flex flex-wrap overflow-hidden rounded border border-[var(--reader-rule)] text-sm">
        {modes.map((m) => (
          <button
            key={m.id}
            type="button"
            aria-pressed={pace.mode === m.id}
            onClick={() =>
              onChange({
                ...pace,
                mode: m.id,
                perDay: m.id === "perDay" ? pace.perDay ?? Math.max(1, Math.round(paced.avgPerDay) || 3) : pace.perDay,
              })
            }
            className={
              "flex-1 px-3 py-1.5 font-medium " +
              (pace.mode === m.id
                ? "bg-[var(--reader-accent)] text-white"
                : "bg-[var(--reader-surface)] text-[var(--reader-text)] hover:opacity-90")
            }
          >
            {m.label}
          </button>
        ))}
      </div>

      <div className="mt-3 flex flex-wrap items-center gap-3 text-sm">
        {(pace.mode === "byDate" || pace.mode === "weekly") && (
          <label className="flex items-center gap-2">
            <span className="text-[var(--reader-muted)]">{pace.mode === "weekly" ? "Aim to finish by" : "Finish by"}</span>
            <input
              type="date"
              value={endISO}
              min={today}
              onChange={(e) => {
                if (/^\d{4}-\d{2}-\d{2}$/.test(e.target.value)) onChange({ ...pace, endDateISO: e.target.value });
              }}
              className={INPUT}
            />
          </label>
        )}
        {pace.mode === "perDay" && (
          <label className="flex items-center gap-2">
            <input
              type="number"
              min={1}
              max={50}
              value={pace.perDay ?? 3}
              onChange={(e) => {
                const n = Math.max(1, Math.min(50, Math.floor(Number(e.target.value) || 1)));
                onChange({ ...pace, perDay: n });
              }}
              className={INPUT + " w-20"}
            />
            <span className="text-[var(--reader-muted)]">chapters a day</span>
          </label>
        )}
      </div>
      {pace.mode === "weekly" && (
        <p className="mt-2 text-xs leading-relaxed text-[var(--reader-muted)]">
          Set a chapter goal on any week below — ten this week, one the next. Weeks without a goal share
          the rest evenly toward your finish date.
        </p>
      )}
      <p className="mt-2 text-sm font-medium text-[var(--reader-text)]">{consequence}</p>
      <p className="mt-1 text-xs text-[var(--reader-muted)]">
        Read ahead whenever you like — the days after today simply re-spread what&rsquo;s left. The order never changes.
      </p>
    </div>
  );
}

function WeekHeader({
  week,
  weekly,
  goal,
  planned,
  onGoal,
}: {
  week: WeekGroup;
  weekly: boolean;
  goal: number | null;
  planned: number;
  onGoal: (g: number | null) => void;
}) {
  // Re-mounted (keyed on the goal) when the saved goal changes, so the draft
  // always starts from what's stored.
  const [draft, setDraft] = useState(goal != null ? String(goal) : "");
  const commit = () => {
    const n = parseInt(draft, 10);
    if (!draft.trim()) onGoal(null);
    else if (Number.isFinite(n) && n >= 1) onGoal(Math.min(n, 2000));
    else setDraft(goal != null ? String(goal) : "");
  };
  const last = week.days[week.days.length - 1];
  return (
    <div className="flex flex-wrap items-center justify-between gap-2 font-sans">
      <div className="text-xs font-semibold uppercase tracking-wider text-[var(--reader-muted)]">
        Week {week.weekNumber}
        <span className="font-normal normal-case tracking-normal">
          {" "}
          &middot; {fmtShort(week.days[0].dateISO)}
          {last !== week.days[0] ? ` – ${fmtShort(last.dateISO)}` : ""}
        </span>
      </div>
      {weekly && (
        <label className="flex items-center gap-1.5 text-xs text-[var(--reader-muted)]">
          Goal
          <input
            inputMode="numeric"
            value={draft}
            placeholder="even"
            onChange={(e) => setDraft(e.target.value.replace(/\D/g, ""))}
            onBlur={commit}
            onKeyDown={(e) => {
              if (e.key === "Enter") (e.target as HTMLInputElement).blur();
            }}
            className={INPUT + " w-16 py-0.5 text-xs"}
            aria-label={`Chapter goal for week ${week.weekNumber}`}
          />
          <span>{goal != null ? `chapters (${planned} planned)` : `${planned} planned`}</span>
        </label>
      )}
    </div>
  );
}

/** Weekly mode: set goals for weeks that currently hold no reading. */
function FutureWeekGoals({
  pace,
  paced,
  today,
  onPace,
}: {
  pace: PaceSettings;
  paced: PacedPlan;
  today: string;
  onPace: (p: PaceSettings) => void;
}) {
  const goals = pace.weeklyGoals ?? {};
  const shown = new Set(paced.days.map((d) => d.weekStartISO));
  const empty = Object.entries(goals).filter(([wk]) => !shown.has(wk) && diffDaysISO(today, wk) >= -6);
  if (empty.length === 0) return null;
  return (
    <div className={CARD + " mt-3 text-sm"}>
      <div className="text-xs text-[var(--reader-muted)]">Goals on weeks with nothing left to read:</div>
      <ul className="mt-1 space-y-1">
        {empty.map(([wk, g]) => (
          <li key={wk} className="flex items-center gap-2">
            <span>
              Week of {fmtShort(wk)} — goal {g}
            </span>
            <button
              type="button"
              className={SMALL_BTN}
              onClick={() => {
                const next = { ...goals };
                delete next[wk];
                onPace({ ...pace, weeklyGoals: next });
              }}
            >
              Remove
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Days
// ───────────────────────────────────────────────────────────────────────

function DayRow({
  day,
  isToday,
  position,
  nextUnreadSeq,
  scope,
  canMark,
  liRef,
  notesForDay,
  notesByChapter,
  notesApi,
}: {
  day: PacedDay;
  isToday: boolean;
  position: number;
  nextUnreadSeq: number | null;
  scope: PlanScope;
  canMark: boolean;
  liRef?: React.Ref<HTMLLIElement>;
  notesForDay: PlanNote[];
  notesByChapter: Map<string, PlanNote[]>;
  notesApi: ReturnType<typeof usePlanNotes>;
}) {
  const [composer, setComposer] = useState<null | { seq: number | null }>(null);
  const allRead = day.items.length > 0 && day.items.every((it) => it.seq <= position);
  const chapterNotes = day.items.flatMap((it) => notesByChapter.get(`${it.book_id}::${it.chapter}`) ?? []);
  const notes = [...notesForDay, ...chapterNotes];

  return (
    <li
      ref={liRef}
      className={
        "rounded-md border px-3 py-2 font-sans " +
        (isToday
          ? "border-[var(--reader-accent)] bg-[color-mix(in_srgb,var(--reader-accent)_10%,transparent)]"
          : "border-[var(--reader-rule)]")
      }
    >
      <div className="flex items-baseline justify-between gap-3">
        <span className="text-sm font-semibold text-[var(--reader-text)]">
          Day {day.dayNumber}
          {isToday && (
            <span className="ml-2 rounded bg-[var(--reader-accent)] px-1.5 py-0.5 text-[10px] font-semibold uppercase tracking-wider text-white">
              Today
            </span>
          )}
          {allRead && <span className="ml-2 text-xs font-normal text-[var(--reader-muted)]">✓ read</span>}
        </span>
        <span className="shrink-0 text-xs text-[var(--reader-muted)]">{dayFmt.format(isoToDate(day.dateISO))}</span>
      </div>
      <div className="mt-1 flex flex-wrap gap-x-3 gap-y-1">
        {day.items.map((it: DayReadingItem) => {
          const read = it.seq <= position;
          const next = it.seq === nextUnreadSeq;
          const cls = classifyBookSlug(it.book_id);
          return (
            <a
              key={it.seq}
              href={`/read?book=${encodeURIComponent(it.book_id)}&chapter=${it.chapter}`}
              onClick={() => syncArrangedExtras(scope)}
              title={it.source === "extra" ? "Restored book (beyond the canon)" : undefined}
              className={`witness-cite-${cls} text-sm hover:underline ${read ? "opacity-60" : ""}`}
            >
              {read ? "✓ " : ""}
              {it.book_title} {it.chapter}
              {next ? (
                <span className="ml-1 text-[10px] font-semibold uppercase tracking-wider text-[var(--reader-accent)]">
                  next
                </span>
              ) : null}
            </a>
          );
        })}
      </div>
      <div className="mt-1.5 flex flex-wrap gap-2">
        {canMark &&
          (allRead ? (
            <button type="button" className={SMALL_BTN} onClick={() => markUnreadFrom(day.items[0].seq)}>
              Mark unread
            </button>
          ) : (
            <button
              type="button"
              className={SMALL_BTN}
              onClick={() => markReadThrough(day.items[day.items.length - 1].seq)}
            >
              ✓ Mark read
            </button>
          ))}
        <button type="button" className={SMALL_BTN} onClick={() => setComposer(composer ? null : { seq: null })}>
          + Note
        </button>
      </div>
      {composer && (
        <NoteComposer
          dayNumber={day.dayNumber}
          dayDateISO={day.dateISO}
          chapters={day.items}
          defaultChapterSeq={composer.seq}
          onSave={notesApi.add}
          onClose={() => setComposer(null)}
        />
      )}
      {notes.length > 0 && (
        <div className="mt-2 space-y-1.5">
          {notes.map((n) => (
            <NoteCard key={n.id} note={n} onEdit={notesApi.edit} onDelete={notesApi.remove} compact />
          ))}
        </div>
      )}
    </li>
  );
}

// ───────────────────────────────────────────────────────────────────────
// All notes
// ───────────────────────────────────────────────────────────────────────

function AllNotes({ notesApi }: { notesApi: ReturnType<typeof usePlanNotes> }) {
  const [q, setQ] = useState("");
  const [book, setBook] = useState("");
  const books = useMemo(
    () =>
      Array.from(
        new Map(
          notesApi.notes.filter((n) => n.book_slug).map((n) => [n.book_slug!, n.book_title ?? n.book_slug!]),
        ),
      ),
    [notesApi.notes],
  );
  const shown = notesApi.notes
    .filter((n) => !book || n.book_slug === book)
    .filter((n) => {
      if (!q.trim()) return true;
      const t = q.toLowerCase();
      return n.body.toLowerCase().includes(t) || noteRef(n).toLowerCase().includes(t);
    })
    .slice()
    .reverse();

  return (
    <details className={CARD + " mt-6"}>
      <summary className="cursor-pointer text-sm font-semibold text-[var(--reader-text)]">
        My plan notes · {notesApi.notes.length}
      </summary>
      {notesApi.error && <p className="mt-2 text-xs text-red-400">{notesApi.error}</p>}
      <div className="mt-2 flex flex-wrap gap-2">
        <input value={q} onChange={(e) => setQ(e.target.value)} placeholder="Search notes" className={INPUT + " flex-1"} />
        <select value={book} onChange={(e) => setBook(e.target.value)} className={INPUT}>
          <option value="">Every book</option>
          {books.map(([slug, title]) => (
            <option key={slug} value={slug}>
              {title}
            </option>
          ))}
        </select>
      </div>
      <div className="mt-2 space-y-1.5">
        {shown.map((n) => (
          <NoteCard key={n.id} note={n} onEdit={notesApi.edit} onDelete={notesApi.remove} />
        ))}
        {notesApi.loaded && shown.length === 0 && (
          <p className="text-xs text-[var(--reader-muted)]">
            {notesApi.notes.length === 0
              ? "No notes yet. Tap “+ Note” on any day to write one. Your notes can be gathered into your own teachings in My Teachings."
              : "No notes match."}
          </p>
        )}
      </div>
    </details>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Teacher quick print
// ───────────────────────────────────────────────────────────────────────

function QuickPrint({ days, title, onClose }: { days: PacedDay[]; title: string; onClose: () => void }) {
  const [withText, setWithText] = useState(false);
  const [busy, setBusy] = useState(false);
  const go = async () => {
    setBusy(true);
    try {
      await printBlocks(readingBlocksFromDays(days), {
        title,
        meta: `${fmtLong(days[0].dateISO)} – ${fmtLong(days[days.length - 1].dateISO)}`,
        includeText: withText,
      });
    } finally {
      setBusy(false);
    }
  };
  return (
    <div className={CARD + " mt-3 text-sm"}>
      <div className="font-semibold">{title}</div>
      <p className="mt-1 text-xs text-[var(--reader-muted)]">
        {days.length} days · {days.reduce((s, d) => s + d.items.length, 0)} chapters. For questions, an answer key and
        student copies, build an assignment in For teachers.
      </p>
      <label className="mt-2 flex items-center gap-2">
        <input type="checkbox" checked={withText} onChange={(e) => setWithText(e.target.checked)} />
        Include the full chapter text
      </label>
      <div className="mt-2 flex gap-2">
        <button type="button" disabled={busy} onClick={go} className="chrome-metal chrome-metal-gold" style={{ padding: "0.3rem 0.8rem" }}>
          {busy ? "Preparing…" : "Print"}
        </button>
        <button type="button" onClick={onClose} className={SMALL_BTN}>
          Close
        </button>
      </div>
    </div>
  );
}
