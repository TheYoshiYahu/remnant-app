import { useEffect, useMemo, useState } from "react";
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
  todayISO,
  updateYearPlanState,
  YEAR_PLAN_CHANGED_EVENT,
} from "../lib/reading-plan/plan-store";
import { pacedPlanFor, scopeSequence } from "../lib/reading-plan/year-plan";
import { seqBefore } from "../lib/reading-plan/paced";
import { NoteComposer } from "./PlanNotes";
import { usePlanNotes } from "../lib/reading-plan/plan-notes";
import { getReckoningPref } from "../lib/calendar/reckoning-pref";
import { getParshaForDate, type ParshaPortion } from "../lib/torah/parsha";
import LockedPartnerPrompt from "./LockedPartnerPrompt";
import { isNativeShell } from "../lib/native-shell";
import { PLAN_LOCK_MESSAGE, PLAN_LOCK_TITLE } from "../lib/reading-plan/plan-lock";

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
  /**
   * S442 — partner (active/trialing) may open /plan, the whole plan laid out.
   * Free readers see the same button with a lock; tapping shows the partner
   * prompt (no purchase link on native).
   */
  planEntitled?: boolean;
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

/**
 * S430 — scripture-first: the strip is collapsed by default into one compact
 * line (date + "Read in a year ›"). The partner's expand/collapse choice
 * persists per device under this key so it stays the way they left it.
 */
const EXPANDED_KEY = "rop.yearplan.expanded";

function readExpanded(): boolean {
  try {
    return window.localStorage.getItem(EXPANDED_KEY) === "1";
  } catch {
    return false;
  }
}

function writeExpanded(next: boolean): void {
  try {
    window.localStorage.setItem(EXPANDED_KEY, next ? "1" : "0");
  } catch {
    /* private mode — the choice just doesn't persist */
  }
}

export default function YearPlanHeader({
  onNavigate,
  onOpenArranged,
  planEntitled = false,
}: Props) {
  const [plan, setPlan] = useState(() => getYearPlanState());
  const [pickerOpen, setPickerOpen] = useState(false);
  const [torahOpen, setTorahOpen] = useState(false);
  const [lockOpen, setLockOpen] = useState(false);
  const [noteOpen, setNoteOpen] = useState(false);
  const notesApi = usePlanNotes(false);
  // S442 — follow plan changes made elsewhere (the /plan page, the reader's
  // in-order auto-advance, the account sync).
  useEffect(() => {
    const on = () => setPlan(getYearPlanState());
    window.addEventListener(YEAR_PLAN_CHANGED_EVENT, on);
    return () => window.removeEventListener(YEAR_PLAN_CHANGED_EVENT, on);
  }, []);
  // S430 — collapsed by default; one tap on the line/button expands.
  const [expanded, setExpanded] = useState<boolean>(() =>
    typeof window === "undefined" ? false : readExpanded(),
  );
  const toggleExpanded = () => {
    const next = !expanded;
    setExpanded(next);
    writeExpanded(next);
  };

  const today = new Date();
  const dateLabel = new Intl.DateTimeFormat(undefined, {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
  }).format(today);

  // For a running plan: which day is today, and what's the portion.
  // Free readers: the fixed 365-day grid (unchanged). Partners (S442): their
  // own pace — today's list from the paced plan, which may also say they're
  // caught up for today.
  let dayNumber = 0;
  let todaysReading: DayReadingItem[] = [];
  let pacedNote: string | null = null;
  let nextItems: DayReadingItem[] = [];
  if (plan && planEntitled) {
    const paced = pacedPlanFor(plan);
    const iso = todayISO(today);
    dayNumber = Math.max(1, dayNumberFor(startDateLocal(plan.startDateISO), today));
    const first = paced.days[0];
    if (first && first.dateISO === iso) todaysReading = first.items;
    else if (first) {
      pacedNote = `Caught up for today. Next: ${refList(first.items)}`;
      nextItems = first.items;
    }
    else pacedNote = "The whole plan is read.";
    if (paced.finishDateISO) {
      pacedNote = [pacedNote, `finishing ${new Intl.DateTimeFormat(undefined, { month: "short", day: "numeric", year: "numeric" }).format(startDateLocal(paced.finishDateISO))}`]
        .filter(Boolean)
        .join(" · ");
    }
  } else if (plan) {
    const buckets = buildYearPlan(plan.scope);
    dayNumber = dayNumberFor(startDateLocal(plan.startDateISO), today);
    todaysReading = readingForDay(buckets, dayNumber);
  }

  const openReadingAt = (items: DayReadingItem[], scope: PlanScope) => {
    const first = items[0];
    if (!first) return;
    syncArrangedExtras(scope);
    // S442 — position is the LAST CHAPTER READ: resuming marks everything
    // before today's first chapter as read (never moves it backwards).
    const cur = getYearPlanState();
    const before = seqBefore(scopeSequence(scope), first.seq);
    if (cur && before > cur.position) updateYearPlanState({ position: before });
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
    if (plan) openReadingAt(todaysReading.length ? todaysReading : nextItems, plan.scope);
  };

  // S430 — collapsed: one compact line. Date on the left (tappable), a small
  // chrome-metal "Read in a year ›" button on the right. Nothing else.
  if (!expanded) {
    return (
      <section className="mb-6 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-2 font-sans">
        <div className="flex items-center justify-between gap-3">
          <button
            type="button"
            onClick={toggleExpanded}
            aria-expanded={false}
            aria-controls="yearplan-expanded"
            className="min-w-0 truncate text-left font-serif text-sm text-[var(--reader-text)] hover:opacity-90"
          >
            {dateLabel}
          </button>
          <button
            type="button"
            onClick={toggleExpanded}
            aria-expanded={false}
            aria-controls="yearplan-expanded"
            aria-label="Show the read-the-Scriptures-in-a-year plan and Torah portions"
            className="chrome-metal chrome-metal-emerald"
            style={{ padding: "0.25rem 0.55rem", fontSize: "0.8rem" }}
          >
            Read in a year <span aria-hidden="true">&rsaquo;</span>
          </button>
        </div>
      </section>
    );
  }

  return (
    <section
      id="yearplan-expanded"
      className="mb-6 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 font-sans"
    >
      <div className="flex items-start justify-between gap-3">
        <div className="min-w-0">
          <div className="text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]">
            Today
          </div>
          <div className="mt-0.5 font-serif text-lg font-semibold text-[var(--reader-text)]">
            {dateLabel}
          </div>
        </div>
        {/* S430 — second tap collapses back to the compact line. */}
        <button
          type="button"
          onClick={toggleExpanded}
          aria-expanded={true}
          aria-controls="yearplan-expanded"
          aria-label="Collapse the year-plan strip"
          className="chrome-metal chrome-metal-emerald shrink-0"
          style={{ padding: "0.25rem 0.55rem", fontSize: "0.8rem" }}
        >
          Read in a year <span aria-hidden="true">&#8963;</span>
        </button>
      </div>

      {plan ? (
        <div className="mt-3">
          <div className="text-sm font-semibold text-[var(--reader-accent)]">
            Read the Scriptures in a Year &middot; Day {dayNumber}
            {planEntitled ? "" : ` of ${DAYS_IN_PLAN}`}
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
          {pacedNote && (
            <div className="mt-1 text-xs text-[var(--reader-muted)]">{pacedNote}</div>
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
            <WholePlanButton
              entitled={planEntitled}
              onLocked={() => setLockOpen((v) => !v)}
            />
            {planEntitled && (todaysReading.length > 0 || nextItems.length > 0) && (
              <button
                type="button"
                onClick={() => setNoteOpen((v) => !v)}
                className={GHOST_BTN}
              >
                + Note
              </button>
            )}
          </div>
          {lockOpen && !planEntitled && <WholePlanLock />}
          {noteOpen && planEntitled && (
            <NoteComposer
              dayNumber={dayNumber}
              dayDateISO={todaysReading.length ? todayISO(today) : null}
              chapters={todaysReading.length ? todaysReading : nextItems}
              onSave={notesApi.add}
              onClose={() => setNoteOpen(false)}
            />
          )}
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
              <WholePlanButton
                entitled={planEntitled}
                onLocked={() => setLockOpen((v) => !v)}
              />
            </div>
          )}
          {lockOpen && !planEntitled && <WholePlanLock />}
          {torahOpen && <TorahPortionsPanel onNavigate={onNavigate} />}
        </div>
      )}
    </section>
  );
}

/**
 * S442 — "See the whole plan". Partners get a plain link to /plan; everyone
 * else gets the same label with a lock glyph that toggles the partner prompt.
 */
function WholePlanButton({
  entitled,
  onLocked,
}: {
  entitled: boolean;
  onLocked: () => void;
}) {
  if (entitled) {
    return (
      <a href="/plan" className={GHOST_BTN}>
        See the whole plan
      </a>
    );
  }
  return (
    <button
      type="button"
      onClick={onLocked}
      className={GHOST_BTN}
      title="Partner feature"
    >
      <span aria-hidden="true">🔒 </span>See the whole plan
    </button>
  );
}

function WholePlanLock() {
  return (
    <div>
      <LockedPartnerPrompt title={PLAN_LOCK_TITLE} message={PLAN_LOCK_MESSAGE} />
      {!isNativeShell() && (
        <a href="/pricing" className="chrome-metal chrome-metal-gold mt-2 inline-block">
          Unlock in Study Notes tier
        </a>
      )}
    </div>
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
