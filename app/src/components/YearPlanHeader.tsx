import { useMemo, useState } from "react";
import {
  buildYearPlan,
  dayNumberFor,
  readingForDay,
  DAYS_IN_PLAN,
  type DayReadingItem,
  type PlanScope,
} from "../lib/reading-plan/pacing";
import {
  getYearPlanState,
  startYearPlan,
  updateYearPlanState,
} from "../lib/reading-plan/plan-store";
import { getReckoningPref } from "../lib/calendar/reckoning-pref";
import { getParshaForDate, type ParshaPortion } from "../lib/torah/parsha";

/*
  S235 — Reader date header + the "Read the Scriptures in a Year" doorway
  (roadmap minion B-2, NEXT_SESSION_HUB_DEVOTIONALS_YEARPLAN_ROADMAP.md Part B).

  Sits at the very top of the reader. Shows today's date localized to the
  device, then the year-plan controls:

    - No plan running → "Start to read the Scriptures in a year" opens a scope
      picker (canon / all of Scripture). Choosing one starts the plan via
      plan-store (Day 1 = today) and drops the reader at Day 1's first chapter.
    - A plan running → shows Day N of 365 and today's portion, with a one-tap
      "Resume today's reading" that opens Day N's first chapter. Position
      resumes across sessions because plan-store persists it.

  Both paths drive the existing ArrangedReading overlay: we set its canon/extras
  toggle to match the chosen scope and ask the reader to open it, then navigate
  to the day's first chapter through the reader's onNavigate. We do NOT touch
  ArrangedReading's internals — only the documented localStorage contract.

  A "Torah portions" button stands beside the year-plan CTA — a placeholder
  for Session 5 (Part C, the parsha panel).
*/

interface Props {
  /** Open a chapter in the reader (same slug/chapter contract as ArrangedReading). */
  onNavigate: (slug: string, chapter: number) => void;
  /** Reveal the ArrangedReading overlay so the plan position is visible. */
  onOpenArranged: () => void;
}

/**
 * Mirrors ArrangedReading.tsx's extras toggle key. Writing it before the
 * overlay mounts means the freshly-mounted overlay reads the sequence that
 * matches the plan scope (all = extras woven in; canon = canon only).
 */
const ARRANGED_EXTRAS_KEY = "rop_arranged_extras_v1";

function syncArrangedExtras(scope: PlanScope): void {
  try {
    window.localStorage.setItem(ARRANGED_EXTRAS_KEY, scope === "all" ? "1" : "0");
  } catch {
    /* private mode — the overlay just opens with its last toggle */
  }
}

/** Local civil Date for a "YYYY-MM-DD" start (matches dayNumberFor's local math). */
function startDateLocal(iso: string): Date {
  const [y, m, d] = iso.split("-").map(Number);
  return new Date(y, m - 1, d);
}

function refList(items: DayReadingItem[]): string {
  return items.map((i) => `${i.book_title} ${i.chapter}`).join(" · ");
}

const GHOST_BTN =
  "rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-sm font-medium text-[var(--reader-text)] hover:opacity-90";

export default function YearPlanHeader({ onNavigate, onOpenArranged }: Props) {
  const [plan, setPlan] = useState(() => getYearPlanState());
  const [pickerOpen, setPickerOpen] = useState(false);
  const [torahOpen, setTorahOpen] = useState(false);

  const today = new Date();
  const dateLabel = new Intl.DateTimeFormat(undefined, {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
  }).format(today);

  // For a running plan: which day is today, and what's the portion.
  let dayNumber = 0;
  let todaysReading: DayReadingItem[] = [];
  if (plan) {
    const buckets = buildYearPlan(plan.scope);
    dayNumber = dayNumberFor(startDateLocal(plan.startDateISO), today);
    todaysReading = readingForDay(buckets, dayNumber);
  }

  const openReadingAt = (items: DayReadingItem[], scope: PlanScope) => {
    const first = items[0];
    if (!first) return;
    syncArrangedExtras(scope);
    updateYearPlanState({ position: first.seq });
    onOpenArranged();
    onNavigate(first.book_id, first.chapter);
  };

  const choose = (scope: PlanScope) => {
    startYearPlan(scope); // Day 1 = today, position reset
    const buckets = buildYearPlan(scope);
    setPlan(getYearPlanState());
    setPickerOpen(false);
    openReadingAt(readingForDay(buckets, 1), scope);
  };

  const resume = () => {
    if (plan) openReadingAt(todaysReading, plan.scope);
  };

  return (
    <section className="mb-6 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 font-sans">
      <div className="text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]">
        Today
      </div>
      <div className="mt-0.5 font-serif text-lg font-semibold text-[var(--reader-text)]">
        {dateLabel}
      </div>

      {plan ? (
        <div className="mt-3">
          <div className="text-sm font-semibold text-[var(--reader-accent)]">
            Read the Scriptures in a Year &middot; Day {dayNumber} of {DAYS_IN_PLAN}
            <span className="font-normal text-[var(--reader-muted)]">
              {" "}
              &middot; {plan.scope === "all" ? "all of Scripture" : "the canon"}
            </span>
          </div>
          {todaysReading.length > 0 && (
            <div className="mt-1 text-sm text-[var(--reader-text)]">
              Today&rsquo;s portion: {refList(todaysReading)}
            </div>
          )}
          <div className="mt-3 flex flex-wrap items-center gap-2">
            <button
              type="button"
              onClick={resume}
              className="chrome-metal chrome-metal-gold"
            >
              Resume today&rsquo;s reading
            </button>
            <TorahPortionsButton
              open={torahOpen}
              onToggle={() => setTorahOpen((v) => !v)}
            />
            <button
              type="button"
              onClick={() => setPickerOpen((v) => !v)}
              className={GHOST_BTN}
            >
              {pickerOpen ? "Close" : "Change plan"}
            </button>
          </div>
          {pickerOpen && <ScopePicker onChoose={choose} />}
          {torahOpen && <TorahPortionsPanel onNavigate={onNavigate} />}
        </div>
      ) : (
        <div className="mt-3">
          {pickerOpen ? (
            <ScopePicker onChoose={choose} onCancel={() => setPickerOpen(false)} />
          ) : (
            <div className="flex flex-wrap items-center gap-2">
              <button
                type="button"
                onClick={() => setPickerOpen(true)}
                className="chrome-metal chrome-metal-emerald"
              >
                Start to read the Scriptures in a year
              </button>
              <TorahPortionsButton
                open={torahOpen}
                onToggle={() => setTorahOpen((v) => !v)}
              />
            </div>
          )}
          {torahOpen && <TorahPortionsPanel onNavigate={onNavigate} />}
        </div>
      )}
    </section>
  );
}

function ScopePicker({
  onChoose,
  onCancel,
}: {
  onChoose: (scope: PlanScope) => void;
  onCancel?: () => void;
}) {
  return (
    <div className="mt-3 rounded border border-[var(--reader-rule)] p-3">
      <div className="text-sm text-[var(--reader-text)]">
        Pace the whole library across a year — choose your path:
      </div>
      <div className="mt-2 flex flex-wrap items-center gap-2">
        <button
          type="button"
          onClick={() => onChoose("canon")}
          className="chrome-metal chrome-metal-gold"
        >
          Just the canon
        </button>
        <button
          type="button"
          onClick={() => onChoose("all")}
          className="chrome-metal chrome-metal-emerald"
        >
          All of Scripture
        </button>
        {onCancel && (
          <button type="button" onClick={onCancel} className={GHOST_BTN}>
            Cancel
          </button>
        )}
      </div>
      <div className="mt-2 text-xs text-[var(--reader-muted)]">
        The canon is about 3&ndash;4 chapters a day; all of Scripture (with the
        restored books woven into the order) about 5&ndash;6.
      </div>
    </div>
  );
}

/** The live "Torah portions" button — toggles the weekly-parsha panel (Part C). */
function TorahPortionsButton({
  open,
  onToggle,
}: {
  open: boolean;
  onToggle: () => void;
}) {
  return (
    <button
      type="button"
      onClick={onToggle}
      aria-expanded={open}
      title="Torah portions — this week's parsha"
      className={GHOST_BTN}
    >
      Torah portions <span className="text-xs">&middot; {open ? "close" : "this week"}</span>
    </button>
  );
}

/**
 * The weekly Torah portion panel. Reads the elected reckoning from
 * reckoning-pref so it stays consistent with the calendar and the year plan,
 * resolves the portion via the pure parsha helper, and taps each reference
 * through into the reader at its opening chapter via the existing onNavigate.
 */
function TorahPortionsPanel({
  onNavigate,
}: {
  onNavigate: (slug: string, chapter: number) => void;
}) {
  const portion = useMemo<ParshaPortion | null>(
    () => getParshaForDate(new Date(), getReckoningPref()),
    [],
  );

  const sabbathLabel = portion
    ? new Intl.DateTimeFormat(undefined, {
        weekday: "long",
        month: "long",
        day: "numeric",
      }).format(portion.sabbathDate)
    : "";

  if (!portion) {
    return (
      <div className="mt-3 rounded border border-[var(--reader-rule)] p-3 text-sm text-[var(--reader-muted)]">
        No weekly portion resolves for this Shabbat (a festival reading falls
        here). Check back next week.
      </div>
    );
  }

  return (
    <div className="mt-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-3">
      <div className="text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]">
        This week&rsquo;s portion &middot; {sabbathLabel}
      </div>
      <div className="mt-0.5 font-serif text-lg font-semibold text-[var(--reader-accent)]">
        {portion.name}
      </div>

      <div className="mt-3 flex flex-col gap-2">
        <button
          type="button"
          onClick={() =>
            onNavigate(portion.opening.book_id, portion.opening.chapter)
          }
          className="flex items-center justify-between gap-3 rounded border border-[var(--reader-rule)] px-3 py-2 text-left hover:opacity-90"
        >
          <span>
            <span className="block text-xs uppercase tracking-wider text-[var(--reader-muted)]">
              Torah
            </span>
            <span className="text-sm font-medium text-[var(--reader-text)]">
              {portion.torahRef}
            </span>
          </span>
          <span className="text-xs text-[var(--reader-accent)]">Open &rsaquo;</span>
        </button>

        {portion.haftarahOpening && (
          <button
            type="button"
            onClick={() =>
              onNavigate(
                portion.haftarahOpening!.book_id,
                portion.haftarahOpening!.chapter,
              )
            }
            className="flex items-center justify-between gap-3 rounded border border-[var(--reader-rule)] px-3 py-2 text-left hover:opacity-90"
          >
            <span>
              <span className="block text-xs uppercase tracking-wider text-[var(--reader-muted)]">
                Haftarah
              </span>
              <span className="text-sm font-medium text-[var(--reader-text)]">
                {portion.haftarahRef}
              </span>
            </span>
            <span className="text-xs text-[var(--reader-accent)]">Open &rsaquo;</span>
          </button>
        )}
      </div>

      <div className="mt-2 text-xs text-[var(--reader-muted)]">
        {portion.reckoning === "rabbinic"
          ? "Aligned to the calculated (HebCal) cycle."
          : "Portion order from the annual cycle, set on your elected Sabbath."}
      </div>
    </div>
  );
}
