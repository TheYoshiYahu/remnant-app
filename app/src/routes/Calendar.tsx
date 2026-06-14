import { useDeferredValue, useEffect, useMemo, useState } from "react";
import {
  predictFirstCrescent,
  type CrescentCriterion,
  type CrescentMode,
  type EnochIntercalation,
  type FirstfruitsRule,
  type Moed,
  type MoedKind,
} from "../lib/calendar/index.ts";
import { nextConjunction } from "../lib/calendar/astro.ts";
import {
  buildCompare,
  compute,
  countdownTo,
  COMPARE_COLUMNS,
  DEFAULT_RECKONING,
  fmtEvening,
  fmtFull,
  moedTheme,
  moonArt,
  moonVisible,
  moonLitPath,
  monthDisplayName,
  MOED_SHORT,
  FEAST_ANCHORS,
  type MonthKind,
  type Orientation,
  type ReckoningState,
} from "../lib/calendar/view-model.ts";
import {
  buildDayDetail,
  buildLayerGrid,
  computeOmer,
  fmtSunsetBoundary,
  fmtSunsetClock,
  type BaseLayer,
  type DayDetail,
  type LayerCell,
  type LayerGrid,
  type OmerStatus,
} from "../lib/calendar/day-view-model.ts";
import {
  eventsOnBiblicalDate,
  HISTORY_IS_SEED,
  historyTone,
  type BiblicalHistoryEvent,
} from "../lib/calendar/biblical-history.ts";
import { civilDayId, type PlannerItem, type PlannerItemKind } from "../lib/planner-store.ts";
import { useDaysWithItems, useJournal, usePlannerDay } from "../lib/usePlanner.ts";

/**
 * The EPIC calendar — the configurable biblical-calendar engine made visible.
 *
 * Standalone route at `/calendar`: renders entirely client-side off
 * `computeBiblicalDate`, no auth backend required, so it doubles as the live
 * demo surface. Five movements:
 *   1. the hero TODAY panel (date · year-position · moon-as-art · Sabbath ·
 *      next moed with a live countdown)
 *   2. the reckoning controls — chrome-metal pills that LIVE-recompute
 *      everything when toggled (the engine, showcased)
 *   3. the month grid with the Leviticus-23 moedim glowing in the color
 *      theology, Sabbaths marked, the Gregorian overlay per cell
 *   4. the honest PENDING-vs-CONFIRMED crescent watch, with one-tap confirm
 *   5. COMPARE RECKONINGS — the same feast across dark-moon / crescent /
 *      rabbinic / Enoch, side by side. The jaw-dropper.
 *
 * Aesthetic matches the reader chrome: rich dark field, the chrome-metal
 * gradient registers (emerald/gold/scarlet/techelet/argaman/bronze), the
 * purple-judgment / emerald-blessing color theology. No grey anywhere.
 */
/**
 * Read shareable deep-link state from the URL query — lets a calendar day be
 * linked to directly (?base=…&reck=…&focus=YYYY-MM-DD&open=today|auto&at=…).
 * `at` time-travels the whole view to a given date (the clock freezes there).
 */
function readQuery(): {
  base: BaseLayer;
  reck: ReckoningState;
  open: string | null;
  focus: Date | null;
  at: Date | null;
  /** True when the URL carries any biblical-reckoning intent — open straight
   *  into the biblical view, bypassing the Gregorian-first landing. */
  wantsBiblical: boolean;
} {
  const q =
    typeof window !== "undefined"
      ? new URLSearchParams(window.location.search)
      : new URLSearchParams();
  const base: BaseLayer = q.get("base") === "hebrew" ? "hebrew" : "gregorian";
  // The ministry follows the dark new moon (conjunction) — so the biblical view
  // opens on conjunction by default (the position note explains why). Every
  // reckoning stays selectable; a ?reck= deep-link still overrides this.
  const reck: ReckoningState = { ...DEFAULT_RECKONING, month: "conjunction" };
  const r = q.get("reck");
  if (r === "conjunction" || r === "crescent" || r === "rabbinic" || r === "enoch") {
    reck.month = r;
  }
  const parseDate = (v: string | null): Date | null => {
    if (v && /^\d{4}-\d{2}-\d{2}$/.test(v)) {
      const [y, m, d] = v.split("-").map(Number);
      return new Date(Date.UTC(y, m - 1, d, 12));
    }
    return null;
  };
  const orient = q.get("orient");
  if (orient) {
    const o = parseOrientation(orient);
    if (o) reck.orientation = o;
  }
  const at = parseDate(q.get("at"));
  // `at` also seeds the focused month unless an explicit focus is given.
  const focus = parseDate(q.get("focus")) ?? at;
  // Any biblical-reckoning param (or ?view=biblical) lands straight in the
  // biblical view; a bare /calendar honors the saved choice (Gregorian-first).
  const wantsBiblical =
    q.get("view") === "biblical" ||
    !!r ||
    !!orient ||
    base === "hebrew" ||
    q.get("compare") === "1" ||
    q.get("open") === "today" ||
    q.get("open") === "auto";
  return { base, reck, open: q.get("open"), focus, at, wantsBiblical };
}

// localStorage key — remembers the user's choice once they cross into the
// biblical view, matching the Today hub's Gregorian-first onboarding.
const BIBLICAL_VIEW_KEY = "cal.biblicalView";

/**
 * The opening view. Gregorian-first by default (familiar, un-intimidating); a
 * URL with biblical intent forces the biblical view; otherwise the remembered
 * choice from localStorage wins.
 */
function readBiblicalView(initial: InitialQuery): boolean {
  if (initial.wantsBiblical) return true;
  if (typeof window === "undefined") return false;
  try {
    return window.localStorage.getItem(BIBLICAL_VIEW_KEY) === "1";
  } catch {
    return false;
  }
}

/**
 * Parse the `?orient=` deep-link into an Orientation. Compact `mode:args…`
 * forms: `feast:passover:2026-03-25`, `today:7:1:2026-06-10`,
 * `monthStart:1:2026-03-25`, `newYear:2026-03-25`, `source`. Missing dates
 * default to today; malformed input yields no orientation.
 */
function parseOrientation(s: string): Orientation | undefined {
  const isISO = (v: string | undefined): v is string => !!v && /^\d{4}-\d{2}-\d{2}$/.test(v);
  const today = new Date().toISOString().slice(0, 10);
  const clamp = (n: number, lo: number, hi: number) =>
    Number.isFinite(n) ? Math.min(hi, Math.max(lo, Math.round(n))) : lo;
  const [mode, a, b, c] = s.split(":");
  switch (mode) {
    case "feast":
      return {
        mode: "feast",
        feast: FEAST_ANCHORS.find((f) => f.key === a)?.key ?? "passover",
        greg: isISO(b) ? b : today,
      };
    case "today":
      return {
        mode: "today",
        month: clamp(Number(a), 1, 12),
        day: clamp(Number(b), 1, 30),
        greg: isISO(c) ? c : today,
      };
    case "monthStart":
      return { mode: "monthStart", month: clamp(Number(a), 1, 12), greg: isISO(b) ? b : today };
    case "newYear":
      return { mode: "newYear", greg: isISO(a) ? a : today };
    case "source":
      return { mode: "source" };
  }
  return undefined;
}

type InitialQuery = ReturnType<typeof readQuery>;

/**
 * Resolve the deep-link day to auto-open (?open=today|auto), building the grid
 * for the initial focus once. Returns null when no open param is set — the
 * normal case — so the modal stays closed and no grid is built here.
 */
function resolveAutoOpen(initial: InitialQuery): LayerCell | null {
  if (initial.open !== "today" && initial.open !== "auto") return null;
  const at = initial.focus ?? new Date();
  const grid = buildLayerGrid(initial.reck, at, at, initial.base);
  if (initial.open === "today") {
    return grid.cells.find((c) => c.isToday) ?? null;
  }
  // ?open=auto — the first notable day in view: a moed, else biblical history.
  return (
    grid.cells.find((c) => !c.filler && c.moedim.length > 0) ??
    grid.cells.find(
      (c) => !c.filler && eventsOnBiblicalDate(c.biblical.month, c.biblical.day).length > 0,
    ) ??
    null
  );
}

export default function Calendar() {
  const initial = useMemo(() => readQuery(), []);
  const [reck, setReck] = useState<ReckoningState>(initial.reck);
  const [focus, setFocus] = useState<Date>(() => initial.focus ?? new Date());
  const [now, setNow] = useState<Date>(() => initial.at ?? new Date());
  const [base, setBase] = useState<BaseLayer>(initial.base);
  // Deep-link auto-open (?open=today|auto) resolves once, in the initializer —
  // build the grid for the initial focus and pick the day to open. Avoids a
  // setState-in-effect; returns null (no modal) for the normal, no-param case.
  const [selected, setSelected] = useState<LayerCell | null>(() =>
    resolveAutoOpen(initial),
  );
  const [showCompare, setShowCompare] = useState(
    () =>
      typeof window !== "undefined" &&
      new URLSearchParams(window.location.search).get("compare") === "1",
  );
  // Gregorian-first landing. Default false (plain Gregorian) unless the URL
  // carries biblical intent or the user has crossed over before. The choice is
  // persisted so the biblical view sticks once chosen.
  const [biblicalView, setBiblicalView] = useState<boolean>(() => readBiblicalView(initial));
  useEffect(() => {
    try {
      window.localStorage.setItem(BIBLICAL_VIEW_KEY, biblicalView ? "1" : "0");
    } catch {
      /* private mode — the choice just won't persist */
    }
  }, [biblicalView]);

  // Live tick — drives the countdown and keeps "today" honest. Frozen when the
  // view is time-travelled to a fixed instant via ?at=.
  useEffect(() => {
    if (initial.at) return;
    const id = setInterval(() => setNow(new Date()), 1000);
    return () => clearInterval(id);
  }, [initial.at]);

  // Re-derive "today" only once a minute — the per-second tick drives the
  // live countdown, but the date and the month grid needn't rebuild every
  // second. Keyed on the minute so the memo depends only on `minuteBucket`.
  const minuteBucket = Math.floor(now.getTime() / 60000);
  const today = useMemo(() => new Date(minuteBucket * 60000), [minuteBucket]);

  // INTERACTION RESPONSIVENESS: the engine is fast now (memoized astronomy),
  // but a cold reckoning still costs ~100ms to recompute the whole grid + hero,
  // and that runs synchronously in render — enough to swallow a tap on a slow
  // device. Deferring the *inputs* to the heavy memos lets React paint the
  // urgent UI first (the pressed pill flips, the modal opens) and recompute the
  // grid in a follow-up render, so the tap always registers instantly and the
  // result fills in a beat later instead of freezing. The control pills read the
  // urgent `reck`/`base`/`focus`, so their pressed state is immediate; only the
  // expensive derived views ride the deferred values.
  const dReck = useDeferredValue(reck);
  const dFocus = useDeferredValue(focus);
  const dBase = useDeferredValue(base);

  const todayResult = useMemo(() => compute(dReck, today), [dReck, today]);
  const grid = useMemo(
    () => buildLayerGrid(dReck, dFocus, today, dBase),
    [dReck, dFocus, today, dBase],
  );

  const todayCell = grid.cells.find((c) => c.isToday);
  const todayIsSabbath = !!todayCell?.morningSabbath;
  const nextMoed = todayResult.moedim[0];
  const omer = useMemo(() => computeOmer(dReck, today), [dReck, today]);

  return (
    <div className="cal-root min-h-screen bg-[var(--reader-bg)] text-[var(--reader-text)]">
      <main className="mx-auto w-full max-w-5xl px-4 py-6 sm:px-6 sm:py-9">
        <Header biblicalView={biblicalView} onPlainGregorian={() => setBiblicalView(false)} />
        {biblicalView ? (
          <>
            <ReckoningControls reck={reck} setReck={setReck} notes={todayResult.notes} />
            <HeroToday
              reck={reck}
              setReck={setReck}
              result={todayResult}
              isSabbath={todayIsSabbath}
              now={now}
              nextMoed={nextMoed}
              omer={omer}
            />
            <CrescentWatch reck={dReck} result={todayResult} now={now} setReck={setReck} />
            <LayerGridView
              grid={grid}
              base={base}
              onBase={setBase}
              onPrev={() => setFocus(grid.prevFocus)}
              onNext={() => setFocus(grid.nextFocus)}
              onToday={() => setFocus(new Date())}
              onSelect={setSelected}
            />
            <CompareSection
              reck={dReck}
              now={now}
              open={showCompare}
              onToggle={() => setShowCompare((v) => !v)}
            />
          </>
        ) : (
          <GregorianView
            grid={grid}
            onReveal={() => setBiblicalView(true)}
            onPrev={() => setFocus(grid.prevFocus)}
            onNext={() => setFocus(grid.nextFocus)}
            onToday={() => setFocus(new Date())}
            onSelect={setSelected}
          />
        )}
        <footer className="mt-10 border-t border-[var(--reader-rule)] pt-4 text-center font-sans text-xs text-[var(--reader-muted)]">
          Computed locally — offline, for any year — from the biblical-calendar
          engine. Compute, don&rsquo;t scrape.
        </footer>
      </main>
      {selected && (
        <DayView reck={reck} cell={selected} onClose={() => setSelected(null)} />
      )}
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Header
// ───────────────────────────────────────────────────────────────────────

function Header({
  biblicalView,
  onPlainGregorian,
}: {
  biblicalView: boolean;
  onPlainGregorian: () => void;
}) {
  return (
    <header className="mb-6">
      <div className="flex items-center justify-between gap-3">
        <a
          href="/read"
          className="font-sans text-xs font-medium uppercase tracking-wider text-[var(--reader-accent)] hover:opacity-80"
        >
          ← Back to reading
        </a>
        {biblicalView && (
          <button type="button" className="cal-view-back" onClick={onPlainGregorian}>
            ☼ Plain Gregorian view
          </button>
        )}
      </div>
      <h1 className="cal-title mt-3 font-serif text-3xl font-semibold tracking-tight sm:text-4xl">
        The Appointed Times
      </h1>
      <p className="mt-1 max-w-2xl font-sans text-sm text-[var(--reader-muted)]">
        {biblicalView
          ? "The moedim of Scripture, reckoned every way at once. Toggle the dials — the whole calendar recomputes live."
          : "A familiar month at a glance — with the appointed times of Scripture one tap away."}
      </p>
    </header>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Gregorian view — the plain, familiar month the calendar OPENS on. No dials,
// no biblical overlay; just the Gregorian grid with today marked, and one
// inviting door into the biblical reckonings (the choice is then remembered).
// ───────────────────────────────────────────────────────────────────────

function GregorianView({
  grid,
  onReveal,
  onPrev,
  onNext,
  onToday,
  onSelect,
}: {
  grid: LayerGrid;
  onReveal: () => void;
  onPrev: () => void;
  onNext: () => void;
  onToday: () => void;
  onSelect: (c: LayerCell) => void;
}) {
  const daysWithItems = useDaysWithItems();
  // The grid is built Gregorian-base, so `title` is "April 2026" and each
  // cell's primaryLabel is the Gregorian day-of-month.
  const gregTitle = new Intl.DateTimeFormat("en-US", {
    timeZone: "UTC",
    month: "long",
    year: "numeric",
  }).format(grid.cells.find((c) => !c.filler)?.daytime ?? grid.cells[0]?.daytime ?? new Date());
  return (
    <>
      <section className="cal-panel mb-6">
        <div className="cal-grid-head">
          <button type="button" className="cal-nav-btn" onClick={onPrev} aria-label="Previous month">
            ‹
          </button>
          <div className="cal-grid-title">
            <div className="cal-grid-month">{gregTitle}</div>
            <div className="cal-grid-year">
              <button type="button" className="cal-today-link" onClick={onToday}>
                today
              </button>
            </div>
          </div>
          <button type="button" className="cal-nav-btn" onClick={onNext} aria-label="Next month">
            ›
          </button>
        </div>

        <div className="cal-grid">
          {WEEKDAYS.map((w) => (
            <div key={w} className="cal-weekday">
              {w}
            </div>
          ))}
          {Array.from({ length: grid.leadBlanks }).map((_, i) => (
            <div key={"blank" + i} className="cal-cell cal-cell-blank" />
          ))}
          {grid.cells.map((c) => (
            <button
              key={c.key}
              type="button"
              onClick={() => onSelect(c)}
              aria-label={`Open ${gregTitle} ${c.primaryLabel}`}
              className={
                "cal-cell cal-cell-btn cal-cell-plain" +
                (c.filler ? " cal-cell-filler" : "") +
                (c.isToday ? " cal-cell-today" : "")
              }
            >
              <div className="cal-cell-top">
                <span className="cal-cell-day">{c.primaryLabel}</span>
              </div>
              {daysWithItems.has(civilDayId(c.daytime)) && (
                <span className="cal-cell-dot" aria-label="has planner items" />
              )}
            </button>
          ))}
        </div>
      </section>

      <button type="button" className="cal-reveal" onClick={onReveal}>
        <span className="cal-reveal-moon">☾</span>
        <span className="cal-reveal-text">
          <span className="cal-reveal-title">View the biblical calendars</span>
          <span className="cal-reveal-sub">
            See the appointed times, the weekly Sabbath, the Omer count, and the
            new-moon reckonings laid over this month.
          </span>
        </span>
        <span className="cal-reveal-arrow">→</span>
      </button>
    </>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Reckoning controls — chrome-metal pills, live recompute
// ───────────────────────────────────────────────────────────────────────

interface PillProps {
  active: boolean;
  register: string;
  onClick: () => void;
  children: React.ReactNode;
  title?: string;
}

function Pill({ active, register, onClick, children, title }: PillProps) {
  return (
    <button
      type="button"
      onClick={onClick}
      title={title}
      aria-pressed={active}
      className={
        "cal-pill " + (active ? `chrome-metal chrome-metal-${register} cal-pill-on` : "cal-pill-off")
      }
      style={
        active
          ? undefined
          : ({ ["--pill-edge" as string]: pillEdge(register) } as React.CSSProperties)
      }
    >
      {children}
    </button>
  );
}

/** The pale glow edge color per register, for the inactive (outlined) pill. */
function pillEdge(register: string): string {
  const m: Record<string, string> = {
    techelet: "#93C0FF",
    gold: "#FCECAF",
    argaman: "#D4B0E0",
    emerald: "#2EFFA1",
    scarlet: "#FFBFC5",
    bronze: "#E8B98C",
    spectral: "#9FD0FF",
    silver: "#E5E7EB",
  };
  return m[register] ?? "#93C0FF";
}

function ControlRow({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="flex flex-wrap items-center gap-2">
      <span className="cal-control-label">{label}</span>
      {children}
    </div>
  );
}

interface ControlsProps {
  reck: ReckoningState;
  setReck: React.Dispatch<React.SetStateAction<ReckoningState>>;
  notes: string[];
}

// Menu palette — each metal carries a consistent identity across every control,
// and all eight single-color chrome-metal registers are present (S225d, Yoshi:
// "more color in the menus — incorporate ALL our single metallic colors"):
//   techelet — the appointed baseline (Dark Moon · Firstfruits · month-start)
//   gold     — the sighted light (First Crescent · anchor-by-feast + feast list)
//   argaman  — royal/rabbinic proclamation (Rabbinic · anchor-the-new-year)
//   emerald  — the perfect/agricultural year (Enoch · intercalation · year-begins)
//   bronze   — the ancient institution (Qumran extras · follow-a-source)
//   spectral — the scientific apparatus (crescent criterion: Odeh/Yallop)
//   silver   — the observer's confirmation (crescent sighting mode)
//   scarlet  — the reset (Clear ✕)
const MONTH_DIALS: { key: MonthKind; label: string; register: string }[] = [
  { key: "conjunction", label: "Dark Moon", register: "techelet" },
  { key: "crescent", label: "First Crescent", register: "gold" },
  { key: "rabbinic", label: "Rabbinic", register: "argaman" },
  { key: "enoch", label: "Enoch · 364", register: "emerald" },
];

/**
 * The ministry's position — a gentle, confident statement of conviction (not a
 * disclaimer). The Remnant of Promise keeps the dark new moon (conjunction);
 * every other reckoning stays selectable, for unity and inclusion. Techelet
 * spine, gold ✦ glyph, emerald on the welcome — the calendar palette, no grey.
 */
function MinistryCreed() {
  return (
    <p className="cal-creed">
      <span className="cal-creed-mark">✦</span>
      <span>
        <strong className="cal-creed-lead">
          The Remnant of Promise follows the dark new moon (conjunction)
        </strong>{" "}
        — <span className="cal-creed-welcome">but we offer all calendars for unity and inclusion.</span>
      </span>
    </p>
  );
}

function ReckoningControls({ reck, setReck, notes }: ControlsProps) {
  const set = (patch: Partial<ReckoningState>) => setReck((r) => ({ ...r, ...patch }));
  const isCrescent = reck.month === "crescent";
  const isEnoch = reck.month === "enoch";
  const isLunar = reck.month === "conjunction" || reck.month === "crescent";

  return (
    <section className="cal-panel mb-6">
      <div className="space-y-3">
        <ControlRow label="Month begins">
          {MONTH_DIALS.map((d) => (
            <Pill
              key={d.key}
              active={reck.month === d.key}
              register={d.register}
              onClick={() => set({ month: d.key })}
            >
              {d.label}
            </Pill>
          ))}
        </ControlRow>

        <MinistryCreed />

        {isCrescent && (
          <>
            <ControlRow label="Criterion">
              {(["odeh", "yallop"] as CrescentCriterion[]).map((c) => (
                <Pill
                  key={c}
                  active={reck.criterion === c}
                  register="spectral"
                  onClick={() => set({ criterion: c })}
                >
                  {c === "odeh" ? "Odeh (2004)" : "Yallop (1997)"}
                </Pill>
              ))}
            </ControlRow>
            <ControlRow label="Sighting">
              {(
                [
                  ["predicted", "Predicted"],
                  ["local-confirm", "Local confirm"],
                  ["jerusalem-verified", "Jerusalem-verified"],
                ] as [CrescentMode, string][]
              ).map(([m, lbl]) => (
                <Pill
                  key={m}
                  active={reck.crescentMode === m}
                  register="silver"
                  onClick={() => set({ crescentMode: m })}
                >
                  {lbl}
                </Pill>
              ))}
            </ControlRow>
          </>
        )}

        {isEnoch && (
          <>
            <ControlRow label="Intercalation">
              {(
                [
                  ["equinox-reanchor", "Equinox re-anchor"],
                  ["leap-week", "Leap week"],
                  ["none", "Pure 364"],
                ] as [EnochIntercalation, string][]
              ).map(([m, lbl]) => (
                <Pill
                  key={m}
                  active={reck.enochIntercalation === m}
                  register="emerald"
                  onClick={() => set({ enochIntercalation: m })}
                >
                  {lbl}
                </Pill>
              ))}
            </ControlRow>
            <ControlRow label="Qumran extras">
              <Pill
                active={reck.qumranFestivals}
                register="bronze"
                onClick={() => set({ qumranFestivals: !reck.qumranFestivals })}
                title="New Wine · New Oil · Wood Offering (Temple Scroll / 4QMMT)"
              >
                {reck.qumranFestivals ? "On" : "Off"}
              </Pill>
            </ControlRow>
          </>
        )}

        {isLunar && (
          <ControlRow label="Year begins">
            {(
              [
                ["aviv", "Aviv (barley)"],
                ["equinox", "Equinox"],
              ] as [ReckoningState["year"], string][]
            ).map(([y, lbl]) => (
              <Pill
                key={y}
                active={reck.year === y}
                register="emerald"
                onClick={() => set({ year: y })}
              >
                {lbl}
              </Pill>
            ))}
          </ControlRow>
        )}

        <ControlRow label="Firstfruits">
          {(
            [
              ["fixed-16", "Fixed 1/16"],
              ["after-weekly-sabbath", "Morrow after Sabbath"],
            ] as [FirstfruitsRule, string][]
          ).map(([f, lbl]) => (
            <Pill
              key={f}
              active={reck.firstfruits === f}
              register="techelet"
              onClick={() => set({ firstfruits: f })}
            >
              {lbl}
            </Pill>
          ))}
        </ControlRow>

        <OrientationMenu reck={reck} setReck={setReck} />
      </div>

      {notes.length > 0 && (
        <ul className="cal-notes mt-3">
          {notes.map((n, i) => (
            <li key={i}>{n}</li>
          ))}
        </ul>
      )}
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Orientation menu — the manual "I am sure of ONE thing" anchor. The user
// supplies a single fact (a feast date, today's biblical date, a sighted
// month-start, or the confirmed new year) and the engine derives the rest.
// Every functional mode projects down to the engine's `dateAnchor` override.
// ───────────────────────────────────────────────────────────────────────

/** Today's Gregorian date as an ISO YYYY-MM-DD — the default anchor date. */
function todayISO(): string {
  return new Date().toISOString().slice(0, 10);
}

const ORIENT_MODES: { key: Orientation["mode"]; label: string; register: string }[] = [
  { key: "feast", label: "Anchor by feast", register: "gold" },
  { key: "today", label: "Set today as…", register: "emerald" },
  { key: "monthStart", label: "Anchor a month-start", register: "techelet" },
  { key: "newYear", label: "Anchor the new year", register: "argaman" },
  { key: "source", label: "Follow a source", register: "bronze" },
];

const ORIENT_MONTHS = [
  "1 · Abib", "2nd", "3rd", "4th", "5th", "6th",
  "7 · Ethanim", "8th", "9th", "10th", "11th", "12th",
];

function OrientationMenu({
  reck,
  setReck,
}: {
  reck: ReckoningState;
  setReck: React.Dispatch<React.SetStateAction<ReckoningState>>;
}) {
  const o = reck.orientation;
  const setO = (orientation: Orientation | undefined) =>
    setReck((r) => ({ ...r, orientation }));

  const selectMode = (mode: Orientation["mode"]) => {
    if (o?.mode === mode) return;
    switch (mode) {
      case "feast":
        setO({ mode: "feast", feast: "passover", greg: todayISO() });
        break;
      case "today": {
        const bd = compute(reck, new Date()).biblicalDate;
        setO({ mode: "today", month: bd.month, day: bd.day, greg: todayISO() });
        break;
      }
      case "monthStart":
        setO({ mode: "monthStart", month: 1, greg: todayISO() });
        break;
      case "newYear":
        setO({ mode: "newYear", greg: todayISO() });
        break;
      case "source":
        setO({ mode: "source" });
        break;
    }
  };

  return (
    <div className="cal-orient">
      <ControlRow label="Orient">
        {ORIENT_MODES.map((m) => (
          <Pill
            key={m.key}
            active={o?.mode === m.key}
            register={m.register}
            onClick={() => selectMode(m.key)}
          >
            {m.label}
          </Pill>
        ))}
        {o && (
          <Pill
            active={false}
            register="scarlet"
            onClick={() => setO(undefined)}
            title="Clear the manual anchor — return to the computed reckoning"
          >
            Clear ✕
          </Pill>
        )}
      </ControlRow>

      {o && o.mode === "feast" && (
        <div className="cal-orient-body cal-accent-gold">
          <ControlRow label="Feast">
            {FEAST_ANCHORS.map((f) => (
              <Pill
                key={f.key}
                active={o.feast === f.key}
                register="gold"
                onClick={() => setO({ ...o, feast: f.key })}
              >
                {f.label}
              </Pill>
            ))}
          </ControlRow>
          <div className="cal-orient-fields">
            <DateField
              label="begins the evening of"
              value={o.greg}
              onChange={(greg) => setO({ ...o, greg })}
            />
          </div>
          <p className="cal-orient-hint">
            A biblical day runs sunset to sunset, so the feast opens the evening of
            the Gregorian date you set. Orient the whole calendar to that evening and
            every other date follows.
          </p>
        </div>
      )}

      {o && o.mode === "today" && (
        <div className="cal-orient-body cal-accent-emerald">
          <div className="cal-orient-fields">
            <MonthField
              label="today is month"
              value={o.month}
              onChange={(month) => setO({ ...o, month })}
            />
            <NumField
              label="day"
              value={o.day}
              onChange={(day) => setO({ ...o, day })}
            />
            <DateField
              label="dated"
              value={o.greg}
              onChange={(greg) => setO({ ...o, greg })}
            />
          </div>
          <p className="cal-orient-hint">
            Declare today&rsquo;s biblical date and the calendar orients from now.
          </p>
        </div>
      )}

      {o && o.mode === "monthStart" && (
        <div className="cal-orient-body cal-accent-techelet">
          <div className="cal-orient-fields">
            <MonthField
              label="the 1st of month"
              value={o.month}
              onChange={(month) => setO({ ...o, month })}
            />
            <DateField
              label="begins the evening of"
              value={o.greg}
              onChange={(greg) => setO({ ...o, greg })}
            />
          </div>
          <p className="cal-orient-hint">
            Anchor a sighted new moon: the 1st of that month begins the evening of
            the date you set (sunset opens the day).
          </p>
        </div>
      )}

      {o && o.mode === "newYear" && (
        <div className="cal-orient-body cal-accent-argaman">
          <div className="cal-orient-fields">
            <DateField
              label="begins the evening of"
              value={o.greg}
              onChange={(greg) => setO({ ...o, greg })}
            />
          </div>
          <p className="cal-orient-hint">
            Aviv confirmed: the first month begins the evening of the date you set
            (sunset opens the day).
          </p>
        </div>
      )}

      {o && o.mode === "source" && (
        <div className="cal-orient-body cal-accent-bronze">
          <p className="cal-orient-hint cal-orient-stub">
            ✦ Follow a published calendar — inherit another body&rsquo;s reckoning.
            <em> Coming soon.</em>
          </p>
        </div>
      )}
    </div>
  );
}

function DateField({
  label,
  value,
  onChange,
}: {
  label: string;
  value: string;
  onChange: (v: string) => void;
}) {
  return (
    <label className="cal-field">
      <span className="cal-field-lbl">{label}</span>
      <input
        type="date"
        className="cal-date-input"
        value={value}
        onChange={(e) => onChange(e.target.value)}
      />
    </label>
  );
}

function MonthField({
  label,
  value,
  onChange,
}: {
  label: string;
  value: number;
  onChange: (v: number) => void;
}) {
  return (
    <label className="cal-field">
      <span className="cal-field-lbl">{label}</span>
      <select
        className="cal-select"
        value={value}
        onChange={(e) => onChange(Number(e.target.value))}
      >
        {ORIENT_MONTHS.map((n, i) => (
          <option key={i} value={i + 1}>
            {n}
          </option>
        ))}
      </select>
    </label>
  );
}

function NumField({
  label,
  value,
  onChange,
}: {
  label: string;
  value: number;
  onChange: (v: number) => void;
}) {
  return (
    <label className="cal-field">
      <span className="cal-field-lbl">{label}</span>
      <input
        type="number"
        min={1}
        max={30}
        className="cal-num-input"
        value={value}
        onChange={(e) => {
          const n = Number(e.target.value);
          if (Number.isFinite(n)) onChange(Math.min(30, Math.max(1, Math.round(n))));
        }}
      />
    </label>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Hero TODAY panel
// ───────────────────────────────────────────────────────────────────────

interface HeroProps {
  reck: ReckoningState;
  setReck: React.Dispatch<React.SetStateAction<ReckoningState>>;
  result: ReturnType<typeof compute>;
  isSabbath: boolean;
  now: Date;
  nextMoed: Moed | undefined;
  omer: OmerStatus | null;
}

function HeroToday({ reck, setReck, result, isSabbath, now, nextMoed, omer }: HeroProps) {
  const bd = result.biblicalDate;
  // Moon phase: shown for the lunar reckonings, hidden by default under the
  // solar Enoch reckoning — but a partner can toggle it back on (some still
  // watch the moon phase while on Enoch).
  const showMoon = moonVisible(reck);
  const art = showMoon ? moonArt(now, 50) : null;
  const sab = isSabbath
    ? { active: true, label: "Sabbath — the seventh day. Rest." }
    : { active: false, label: "A working day" };
  const yearFrac = yearPosition(bd.month, bd.day);
  const cd = nextMoed ? countdownTo(nextMoed.startInstant, now) : null;
  const moedThemeForNext = nextMoed ? moedTheme(nextMoed.kind) : null;
  // Enoch's appointed days are fixed whole solar days, not sunset-opened — so the
  // hero frames the next moed as the day itself (its daytime date), not an evening.
  const sunsetLayout = reck.month !== "enoch";

  return (
    <section className="cal-hero mb-6">
      <div className="cal-hero-grid">
        {/* The date */}
        <div className="cal-hero-date">
          <div className="cal-eyebrow">Today &middot; {reck.location.label ?? "Local"}</div>
          <div className="cal-hero-day">{bd.day}</div>
          <div className="cal-hero-month">{monthDisplayName(result)}</div>
          <div className="cal-hero-year">
            Year <span className="cal-hero-year-num">{bd.year}</span>
          </div>
          <div className="cal-hero-greg">{fmtFull(now)}</div>

          {/* where you are in the year */}
          <div className="cal-yearbar" title={`≈ day ${yearFrac.dayOfYear} of the year`}>
            <div className="cal-yearbar-fill" style={{ width: `${yearFrac.pct}%` }} />
          </div>
          <div className="cal-yearbar-label">
            Month {bd.month} &middot; about {yearFrac.pct}% through the year
          </div>

          <div className={"cal-sabbath " + (sab.active ? "cal-sabbath-on" : "")}>
            {sab.active ? "✦ " : ""}
            {sab.label}
          </div>
        </div>

        {/* The moon, as art — toggleable; hidden by default under Enoch (solar). */}
        <div className={"cal-hero-moon" + (showMoon && art ? "" : " cal-hero-moon-off")}>
          {showMoon && art ? (
            <>
              <MoonArtSvg
                litPath={art.litPath}
                waxing={art.waxing}
                illum={art.illum}
                size={150}
              />
              <div className="cal-moon-phase">{art.phase}</div>
              <div className="cal-moon-illum">{Math.round(art.illum * 100)}% lit</div>
            </>
          ) : (
            <div className="cal-moon-hidden-note">
              Moon hidden — the Enoch year is reckoned by the sun.
            </div>
          )}
          <button
            type="button"
            className="cal-moon-toggle"
            aria-pressed={showMoon}
            onClick={() => setReck((r) => ({ ...r, showMoon: !moonVisible(r) }))}
          >
            {showMoon ? "Hide moon phase" : "Show moon phase"}
          </button>
        </div>

        {/* Next appointed time + countdown */}
        <div className="cal-hero-next">
          <div className="cal-eyebrow">Next appointed time</div>
          {nextMoed && cd && moedThemeForNext ? (
            <>
              <div
                className="cal-next-name"
                style={{ color: moedThemeForNext.glow }}
              >
                {nextMoed.name}
              </div>
              <div className="cal-next-when">
                {sunsetLayout
                  ? `begins at sunset · ${fmtEvening(nextMoed.startInstant)}`
                  : `the whole day · ${fmtEvening(moedDaytime(nextMoed.startInstant))}`}
              </div>
              <div className="cal-countdown">
                <Count n={cd.days} unit="days" glow={moedThemeForNext.glow} />
                <Count n={cd.hours} unit="hrs" glow={moedThemeForNext.glow} />
                <Count n={cd.minutes} unit="min" glow={moedThemeForNext.glow} />
                <Count n={cd.seconds} unit="sec" glow={moedThemeForNext.glow} />
              </div>
            </>
          ) : (
            <div className="cal-next-when">No upcoming moed in range.</div>
          )}
        </div>
      </div>

      {omer && <OmerBanner omer={omer} />}
    </section>
  );
}

/**
 * The Omer count — shown only during the count season (Firstfruits → Shavuot).
 * Emerald (the rising harvest blessing) with a gold day-numeral; no grey.
 */
function OmerBanner({ omer }: { omer: OmerStatus }) {
  return (
    <div className={"cal-omer" + (omer.isShavuot ? " cal-omer-shavuot" : "")}>
      <div className="cal-omer-mark">
        <span className="cal-omer-n">{omer.day}</span>
        <span className="cal-omer-of">of&nbsp;50</span>
      </div>
      <div className="cal-omer-body">
        <div className="cal-omer-title">
          {omer.isShavuot ? "Shavuot — the fiftieth day" : `Day ${omer.day} of the Omer`}
        </div>
        <div className="cal-omer-sub">
          {omer.isShavuot ? (
            <>The count is fulfilled — the Feast of Weeks.</>
          ) : (
            <>
              <span className="cal-omer-break">{omer.breakdown}</span> of the count ·
              counting toward Shavuot
            </>
          )}
        </div>
        <div className="cal-omer-track" aria-hidden="true">
          <div className="cal-omer-fill" style={{ width: `${(omer.day / 50) * 100}%` }} />
        </div>
      </div>
      <div className="cal-omer-ref">Lev 23:15-16</div>
    </div>
  );
}

function Count({ n, unit, glow }: { n: number; unit: string; glow: string }) {
  return (
    <div className="cal-count">
      <div className="cal-count-n" style={{ color: glow }}>
        {String(n).padStart(2, "0")}
      </div>
      <div className="cal-count-u">{unit}</div>
    </div>
  );
}

function yearPosition(month: number, day: number): { pct: number; dayOfYear: number } {
  const dayOfYear = Math.round((month - 1) * 29.53 + day);
  const pct = Math.max(1, Math.min(100, Math.round((dayOfYear / 360) * 100)));
  return { pct, dayOfYear };
}

// ───────────────────────────────────────────────────────────────────────
// Moon as art
// ───────────────────────────────────────────────────────────────────────

function MoonArtSvg({
  litPath,
  waxing,
  illum,
  size,
}: {
  litPath: string;
  waxing: boolean;
  illum: number;
  size: number;
}) {
  const r = 50;
  const pad = 14;
  const vb = r + pad;
  return (
    <svg
      width={size}
      height={size}
      viewBox={`${-vb} ${-vb} ${vb * 2} ${vb * 2}`}
      role="img"
      aria-label={`Moon, ${Math.round(illum * 100)}% illuminated, ${waxing ? "waxing" : "waning"}`}
      className="cal-moon-svg"
    >
      <defs>
        <radialGradient id="moonLit" cx="38%" cy="34%" r="75%">
          <stop offset="0%" stopColor="#FFFDF4" />
          <stop offset="55%" stopColor="#F4E6C2" />
          <stop offset="100%" stopColor="#C9A86A" />
        </radialGradient>
        <radialGradient id="moonDisk" cx="50%" cy="50%" r="62%">
          <stop offset="0%" stopColor="#10203f" />
          <stop offset="100%" stopColor="#070b18" />
        </radialGradient>
        <filter id="moonGlow" x="-60%" y="-60%" width="220%" height="220%">
          <feGaussianBlur stdDeviation="4.5" result="b" />
          <feMerge>
            <feMergeNode in="b" />
            <feMergeNode in="SourceGraphic" />
          </feMerge>
        </filter>
      </defs>
      {/* halo */}
      <circle r={r + 7} fill="#1A6FE5" opacity={0.10 + illum * 0.16} />
      {/* dark disk (the unlit moon) */}
      <circle r={r} fill="url(#moonDisk)" stroke="#24304f" strokeWidth={1} />
      {/* lit region — mirrored for waning */}
      <g
        transform={waxing ? undefined : "scale(-1,1)"}
        filter="url(#moonGlow)"
      >
        <path d={litPath} fill="url(#moonLit)" />
      </g>
      {/* faint maria so the full disk reads as the moon, not a coin */}
      <g fill="#0c1730" opacity={0.18}>
        <circle cx={-14} cy={-12} r={8} />
        <circle cx={10} cy={6} r={11} />
        <circle cx={-6} cy={20} r={6} />
      </g>
    </svg>
  );
}

function MiniMoon({ illum, waxing }: { illum: number; waxing: boolean }) {
  const r = 50;
  return (
    <svg viewBox="-58 -58 116 116" className="cal-mini-moon" aria-hidden="true">
      <circle r={r} fill="#0a1124" stroke="#1d2845" strokeWidth={2} />
      <g transform={waxing ? undefined : "scale(-1,1)"}>
        <path d={moonLitPath(r, illum)} fill="#EBD9A8" />
      </g>
    </svg>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Crescent watch — the honest PENDING vs CONFIRMED state
// ───────────────────────────────────────────────────────────────────────

interface WatchProps {
  reck: ReckoningState;
  result: ReturnType<typeof compute>;
  now: Date;
  setReck: React.Dispatch<React.SetStateAction<ReckoningState>>;
}

function CrescentWatch({ reck, result, now, setReck }: WatchProps) {
  // Hooks must run unconditionally — compute the prediction every render and
  // gate the rendered output afterwards (the month dial can toggle live).
  // Predict the next crescent, refreshed hourly (the geometry barely moves
  // minute to minute). Anchored on the top of the current hour so the memo
  // depends only on its listed inputs.
  const hourBucket = Math.floor(now.getTime() / 3_600_000);
  const pred = useMemo(() => {
    const conj = nextConjunction(new Date(hourBucket * 3_600_000));
    return predictFirstCrescent(conj, reck.location, reck.criterion);
  }, [reck.criterion, reck.location, hourBucket]);

  if (reck.month !== "crescent") return null;

  const sighting = reck.crescentMode !== "predicted";
  const marginal = pred.marginalEvening;
  const firstVisible = pred.firstVisibleEvening;
  const currentPending = result.monthStart.status === "pending";

  const confirm = (evening: Date) =>
    setReck((r) => ({ ...r, confirmedSightings: [...r.confirmedSightings, evening] }));

  return (
    <section className={"cal-watch mb-6 " + (currentPending ? "cal-watch-pending" : "")}>
      <div className="cal-watch-head">
        <span className="cal-eyebrow cal-watch-eyebrow">
          {currentPending ? "● Pending — unresolved" : "Crescent watch"}
        </span>
        <span className="cal-watch-conj">conjunction {fmtEvening(pred.conjunction)}</span>
      </div>

      {currentPending && result.monthStart.pending ? (
        <p className="cal-watch-body">
          <strong>Tonight the new month hangs in the balance.</strong>{" "}
          {result.monthStart.pending.reason} It begins{" "}
          <em>tonight if the crescent is sighted</em> (
          {fmtEvening(result.monthStart.pending.tonightIfSighted)}), else{" "}
          <em>tomorrow</em> ({fmtEvening(result.monthStart.pending.elseTomorrow)}).
        </p>
      ) : marginal && sighting ? (
        <p className="cal-watch-body">
          The next young crescent is <strong>borderline</strong> on{" "}
          {fmtEvening(marginal)}. Watch the western horizon at dusk: the new
          month begins <em>that evening if it is sighted</em>, else the following
          evening ({fmtEvening(firstVisible)}).
        </p>
      ) : (
        <p className="cal-watch-body">
          First visibility is predicted for <strong>{fmtEvening(firstVisible)}</strong>
          {sighting
            ? " — the month begins then, pending an actual sighting."
            : " — this month begins then (prediction trusted)."}
        </p>
      )}

      {sighting && (
        <div className="cal-watch-actions">
          <button
            type="button"
            className="chrome-metal chrome-metal-gold cal-confirm-btn"
            onClick={() => confirm(marginal ?? firstVisible)}
          >
            ✦ I sighted it
          </button>
          {reck.confirmedSightings.length > 0 && (
            <button
              type="button"
              className="cal-watch-clear"
              onClick={() => setReck((r) => ({ ...r, confirmedSightings: [] }))}
            >
              clear {reck.confirmedSightings.length} sighting
              {reck.confirmedSightings.length > 1 ? "s" : ""}
            </button>
          )}
        </div>
      )}
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// The layer grid — one grid, a base-layer toggle, sunset diagonal shading,
// tap-through to the planner day-view.
// ───────────────────────────────────────────────────────────────────────

const WEEKDAYS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

/**
 * The diagonal sunset shade — UNIFORM on every box, so it always means the same
 * thing: the lower/evening half (after the sundown seam) is shaded = "sunset has
 * passed, the new Hebrew day has begun here." The upper/daytime half is left
 * clear. A Hebrew day therefore reads as [shaded evening of box N] + [clear
 * daytime of box N+1], and the next box's shaded evening marks where the
 * following Hebrew day begins. No parity, no alternation.
 *
 * The one exception is colour, not position: the weekly Sabbath band — Friday's
 * evening half + Saturday's daytime half — is tinted in the spectral rest
 * register so it reads as a single Friday-evening→Saturday-day band.
 */
const SHADE_TECHELET = "rgba(10, 45, 132, 0.6)"; // the post-sunset evening shade
const SHADE_SABBATH = "rgba(46, 123, 214, 0.5)"; // spectral — the Sabbath band
const SHADE_SEAM = "rgba(147, 192, 255, 0.5)"; // the sundown seam line
// Enoch's whole-day Sabbath: a soft full-cell rest wash (no seam, no diagonal).
const SHADE_SABBATH_WHOLE =
  "linear-gradient(180deg, rgba(46, 123, 214, 0.30) 0%, rgba(46, 123, 214, 0.16) 100%)";

/**
 * The cell background. `sunsetLayout` true for the LUNAR reckonings (dark moon /
 * first crescent / rabbinic), whose biblical day runs sunset→sunset and so reads
 * as the diagonal seam + evening half. For ENOCH it is false: the 364-day solar
 * calendar reckons fixed WHOLE days (Gen 1:14-19), not sunset to sunset, so the
 * cell is clean — no seam, no evening shade — and only the weekly Sabbath carries
 * a soft full-cell wash.
 */
function shadeBackground(cell: LayerCell, sunsetLayout: boolean): string {
  if (!sunsetLayout) {
    return cell.morningSabbath ? SHADE_SABBATH_WHOLE : "transparent";
  }
  // Daytime (upper) half: clear, except Saturday daytime carries the Sabbath band.
  const morning = cell.morningSabbath ? SHADE_SABBATH : "transparent";
  // Evening (lower) half: always shaded — Friday evening opens the Sabbath band.
  const evening = cell.eveningSabbath ? SHADE_SABBATH : SHADE_TECHELET;
  return `linear-gradient(108deg, ${morning} 0 46.5%, ${SHADE_SEAM} 46.5% 50.5%, ${evening} 50.5% 100%)`;
}

function LayerGridView({
  grid,
  base,
  onBase,
  onPrev,
  onNext,
  onToday,
  onSelect,
}: {
  grid: LayerGrid;
  base: BaseLayer;
  onBase: (b: BaseLayer) => void;
  onPrev: () => void;
  onNext: () => void;
  onToday: () => void;
  onSelect: (c: LayerCell) => void;
}) {
  const daysWithItems = useDaysWithItems();
  // The sunset-to-sunset layout is a LUNAR concept. Enoch's 364-day solar
  // calendar reckons whole fixed-weekday days, so it drops the diagonal seam.
  const sunsetLayout = grid.result.config.month.kind !== "enoch";
  return (
    <section className="cal-panel mb-6">
      <div className="cal-base-bar">
        <div className="cal-base-toggle" role="group" aria-label="Base layer">
          <Pill active={base === "gregorian"} register="techelet" onClick={() => onBase("gregorian")}>
            Gregorian base
          </Pill>
          <Pill active={base === "hebrew"} register="gold" onClick={() => onBase("hebrew")}>
            Hebrew base
          </Pill>
        </div>
        <span className="cal-base-hint">
          {base === "gregorian"
            ? "Gregorian month owns the grid · biblical date + sunset ride on top"
            : "Biblical month owns the grid · starts on the 1st · Gregorian rides on top"}
        </span>
      </div>

      <div className="cal-grid-head">
        <button type="button" className="cal-nav-btn" onClick={onPrev} aria-label="Previous month">
          ‹
        </button>
        <div className="cal-grid-title">
          <div className="cal-grid-month">{grid.title}</div>
          <div className="cal-grid-year">
            {grid.subtitle}
            <button type="button" className="cal-today-link" onClick={onToday}>
              today
            </button>
          </div>
        </div>
        <button type="button" className="cal-nav-btn" onClick={onNext} aria-label="Next month">
          ›
        </button>
      </div>

      <div className="cal-grid">
        {WEEKDAYS.map((w) => (
          <div key={w} className="cal-weekday">
            {w}
          </div>
        ))}
        {Array.from({ length: grid.leadBlanks }).map((_, i) => (
          <div key={"blank" + i} className="cal-cell cal-cell-blank" />
        ))}
        {grid.cells.map((c) => (
          <LayerDayCell
            key={c.key}
            cell={c}
            base={base}
            sunsetLayout={sunsetLayout}
            hasItems={daysWithItems.has(civilDayId(c.daytime))}
            onSelect={onSelect}
          />
        ))}
      </div>

      {sunsetLayout ? (
        <p className="cal-shade-caption">
          The shaded lower half of every box is after{" "}
          <span className="cal-shade-seam-word">sundown</span> — the new Hebrew day has
          begun there, and runs on through the clear daytime of the next box. The
          brighter band is the weekly Sabbath: Friday evening through Saturday day.
        </p>
      ) : (
        <p className="cal-shade-caption">
          Enoch reckons{" "}
          <span className="cal-shade-seam-word">whole solar days</span> on a fixed
          364-day week (Gen 1:14-19) — no sundown seam. Each box is one complete day,
          the same weekday every year; the brighter cell is the weekly Sabbath.
        </p>
      )}

      <GridLegend cells={grid.cells} />
    </section>
  );
}

function LayerDayCell({
  cell,
  base,
  sunsetLayout,
  hasItems,
  onSelect,
}: {
  cell: LayerCell;
  base: BaseLayer;
  sunsetLayout: boolean;
  hasItems: boolean;
  onSelect: (c: LayerCell) => void;
}) {
  const moed = cell.moedim[0];
  const theme = moed ? moedTheme(moed.kind) : null;
  // Under Enoch (no sunset layout) the Sabbath is the whole Saturday day, so the
  // Friday-evening half never reads as the Sabbath band.
  const sabbath = sunsetLayout ? cell.morningSabbath || cell.eveningSabbath : cell.morningSabbath;
  return (
    <button
      type="button"
      onClick={() => onSelect(cell)}
      aria-label={`Open ${cell.primaryLabel} (${cell.overlayLabel})`}
      className={
        "cal-cell cal-cell-btn" +
        (cell.filler ? " cal-cell-filler" : "") +
        (cell.isToday ? " cal-cell-today" : "") +
        (moed ? " cal-cell-moed" : "")
      }
      style={{
        // backgroundImage (not the shorthand) so the cell's own surface shows
        // through the clear daytime half.
        backgroundImage: shadeBackground(cell, sunsetLayout),
        ...(theme
          ? {
              borderColor: hexA(theme.glow, 0.6),
              boxShadow: `0 0 14px ${hexA(theme.glow, 0.3)}, inset 0 0 16px ${hexA(theme.deep, 0.5)}`,
            }
          : sabbath
            ? { borderColor: "rgba(46, 123, 214, 0.5)" }
            : {}),
      }}
    >
      {cell.overlayFlip && (
        <span className="cal-cell-flip" title="overlay month changes here">
          {base === "gregorian" ? overlayFlipMonth(cell) : overlayFlipGreg(cell)}
        </span>
      )}
      <div className="cal-cell-top">
        <span className="cal-cell-day" style={theme ? { color: theme.glow } : undefined}>
          {cell.primaryLabel}
        </span>
        <span className="cal-cell-greg">{cell.overlayLabel}</span>
      </div>

      <div className="cal-cell-mid">
        <MiniMoon illum={cell.illum} waxing={cell.waxing} />
      </div>

      <div className="cal-cell-bottom">
        {moed ? (
          <span className="cal-cell-moedname" style={{ color: theme!.glow }}>
            {MOED_SHORT[moed.kind]}
            {moed.endDay && moed.endDay !== moed.day ? "…" : ""}
          </span>
        ) : cell.morningSabbath ? (
          <span className="cal-cell-sab">Sabbath</span>
        ) : null}
      </div>

      {hasItems && <span className="cal-cell-dot" aria-label="has planner items" />}
    </button>
  );
}

/** The biblical-month abbreviation shown on a Gregorian-base flip box. */
function overlayFlipMonth(cell: LayerCell): string {
  const name = cell.biblical.monthName;
  return name ? name.split(" ")[0] : `M${cell.biblical.month}`;
}
/** The Gregorian-month short name shown on a Hebrew-base flip box. */
function overlayFlipGreg(cell: LayerCell): string {
  return new Intl.DateTimeFormat("en-US", { timeZone: "UTC", month: "short" }).format(
    cell.daytime,
  );
}

function GridLegend({ cells }: { cells: { moedim: Moed[] }[] }) {
  const kinds: MoedKind[] = [];
  for (const c of cells)
    for (const m of c.moedim) if (!kinds.includes(m.kind)) kinds.push(m.kind);
  if (kinds.length === 0)
    return (
      <p className="cal-legend-empty">
        No appointed times this month. Page ahead to the spring or autumn feasts.
      </p>
    );
  return (
    <div className="cal-legend">
      {kinds.map((k) => {
        const t = moedTheme(k);
        return (
          <span key={k} className="cal-legend-item">
            <span className="cal-legend-dot" style={{ background: t.glow, boxShadow: `0 0 8px ${t.glow}` }} />
            <span style={{ color: t.glow }}>{MOED_SHORT[k]}</span>
          </span>
        );
      })}
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Day-view — the comprehensive planner panel (tap a day to open).
// ───────────────────────────────────────────────────────────────────────

function DayView({
  reck,
  cell,
  onClose,
}: {
  reck: ReckoningState;
  cell: LayerCell;
  onClose: () => void;
}) {
  const detail = useMemo(() => buildDayDetail(reck, cell), [reck, cell]);
  const dayId = civilDayId(cell.daytime);
  // Enoch days are whole fixed solar days — not sunset-bounded — so the modal
  // shows a whole-day card rather than the two-sunset boundary card.
  const sunsetLayout = reck.month !== "enoch";

  // Close on Escape.
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose();
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  return (
    <div className="cal-dayview-backdrop" onClick={onClose}>
      <div
        className="cal-dayview"
        role="dialog"
        aria-modal="true"
        aria-label="Day view"
        onClick={(e) => e.stopPropagation()}
      >
        <button type="button" className="cal-dayview-close" onClick={onClose} aria-label="Close">
          ✕
        </button>

        <DayViewHead detail={detail} />
        {sunsetLayout ? (
          <DayViewSunset detail={detail} />
        ) : (
          <DayViewWholeDay detail={detail} />
        )}
        <DayViewStatus detail={detail} />
        <OnThisDay events={detail.history} />
        <DayViewTabs dayId={dayId} detail={detail} />
        <PlaceholderSlots />
      </div>
    </div>
  );
}

/** Planner | Journal — two distinct surfaces for the day. */
function DayViewTabs({ dayId, detail }: { dayId: string; detail: DayDetail }) {
  const [tab, setTab] = useState<"planner" | "journal">("planner");
  return (
    <section className="cal-dv-section">
      <div className="cal-dv-tabs" role="tablist">
        <button
          type="button"
          role="tab"
          aria-selected={tab === "planner"}
          className={"cal-dv-tab" + (tab === "planner" ? " cal-dv-tab-on" : "")}
          onClick={() => setTab("planner")}
        >
          Planner
        </button>
        <button
          type="button"
          role="tab"
          aria-selected={tab === "journal"}
          className={"cal-dv-tab" + (tab === "journal" ? " cal-dv-tab-on" : "")}
          onClick={() => setTab("journal")}
        >
          Journal
        </button>
      </div>
      {tab === "planner" ? (
        <Planner dayId={dayId} />
      ) : (
        <Journal dayId={dayId} detail={detail} />
      )}
    </section>
  );
}

function DayViewHead({ detail }: { detail: DayDetail }) {
  const moedThemeForHead = detail.moedim[0] ? moedTheme(detail.moedim[0].kind) : null;
  return (
    <header className="cal-dv-head">
      <div className="cal-eyebrow">{detail.gregorianFull}</div>
      <div className="cal-dv-bd">
        <span
          className="cal-dv-day"
          style={moedThemeForHead ? { color: moedThemeForHead.glow } : undefined}
        >
          {detail.biblical.day}
        </span>
        <span className="cal-dv-month">{detail.monthName}</span>
      </div>
      <div className="cal-dv-year">
        Year <span className="cal-dv-year-num">{detail.biblical.year}</span> · biblical
      </div>
    </header>
  );
}

function DayViewSunset({ detail }: { detail: DayDetail }) {
  return (
    <section className="cal-dv-sunset">
      <div className="cal-dv-sunset-row">
        <span className="cal-dv-sunset-ic">☉↓</span>
        <div>
          <div className="cal-dv-sunset-lbl">This day begins</div>
          <div className="cal-dv-sunset-val">{fmtSunsetBoundary(detail.opensAt)}</div>
        </div>
        <div className="cal-dv-sunset-clock">{fmtSunsetClock(detail.opensAt)}</div>
      </div>
      <div className="cal-dv-sunset-seam" aria-hidden="true" />
      <div className="cal-dv-sunset-row">
        <span className="cal-dv-sunset-ic">☉↓</span>
        <div>
          <div className="cal-dv-sunset-lbl">…and ends at the next sunset</div>
          <div className="cal-dv-sunset-val">{fmtSunsetBoundary(detail.closesAt)}</div>
        </div>
        <div className="cal-dv-sunset-clock">{fmtSunsetClock(detail.closesAt)}</div>
      </div>
    </section>
  );
}

/**
 * The Enoch whole-day card — the 364-day solar calendar reckons fixed days, not
 * sunset→sunset, so there is no opening/closing sunset to show. The day runs the
 * full civil day and falls on the same weekday every year.
 */
function DayViewWholeDay({ detail }: { detail: DayDetail }) {
  return (
    <section className="cal-dv-sunset cal-dv-wholeday">
      <div className="cal-dv-sunset-row">
        <span className="cal-dv-sunset-ic">☀</span>
        <div>
          <div className="cal-dv-sunset-lbl">A whole solar day</div>
          <div className="cal-dv-sunset-val">{detail.gregorianFull}</div>
        </div>
      </div>
      <p className="cal-dv-wholeday-note">
        Enoch&rsquo;s 364-day calendar reckons fixed whole days (Gen 1:14-19), not
        sunset to sunset — this day runs the full day and keeps the same weekday
        every year.
      </p>
    </section>
  );
}

function DayViewStatus({ detail }: { detail: DayDetail }) {
  if (!detail.isSabbath && detail.moedim.length === 0) {
    return <p className="cal-dv-status-none">An ordinary day — no appointed time.</p>;
  }
  return (
    <div className="cal-dv-status">
      {detail.isSabbath && (
        <span className="cal-dv-chip" style={{ color: "#93C0FF", borderColor: "rgba(46,123,214,0.6)" }}>
          ✦ Weekly Sabbath
        </span>
      )}
      {detail.moedim.map((m) => {
        const t = moedTheme(m.kind);
        return (
          <span
            key={m.kind}
            className="cal-dv-chip"
            style={{ color: t.glow, borderColor: hexA(t.glow, 0.55), background: hexA(t.deep, 0.4) }}
          >
            ✦ {m.name}
          </span>
        );
      })}
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// On this day in biblical history
// ───────────────────────────────────────────────────────────────────────

function OnThisDay({ events }: { events: BiblicalHistoryEvent[] }) {
  return (
    <section className="cal-dv-section">
      <div className="cal-dv-section-head">
        <h3 className="cal-dv-section-title">On this day in biblical history</h3>
        {HISTORY_IS_SEED && <span className="cal-dv-seed">seed set</span>}
      </div>
      {events.length === 0 ? (
        <p className="cal-dv-empty">
          No dated event anchored to this biblical date yet. The history set is a small,
          accurate seed — to be expanded.
        </p>
      ) : (
        <ul className="cal-dv-history">
          {events.map((e) => {
            const t = historyTone(e.category);
            return (
              <li key={e.id} className="cal-dv-hist" style={{ borderLeftColor: t.glow }}>
                <div className="cal-dv-hist-title" style={{ color: t.glow }}>
                  {e.title}
                </div>
                <div className="cal-dv-hist-ref">{e.scripture}</div>
                <p className="cal-dv-hist-sum">{e.summary}</p>
              </li>
            );
          })}
        </ul>
      )}
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Planner — events / tasks / notes, persisted to localStorage.
// ───────────────────────────────────────────────────────────────────────

function Planner({ dayId }: { dayId: string }) {
  const { day, add, toggle, remove } = usePlannerDay(dayId);
  return (
    <div className="cal-dv-tabpanel">
      <p className="cal-dv-tabhint">
        Your day&rsquo;s plan and quick study notes. <span className="cal-dv-saved">saved on this device</span>
      </p>
      <PlannerGroup
        kind="event"
        label="Events"
        items={day.events}
        onAdd={add}
        onToggle={toggle}
        onRemove={remove}
        withTime
      />
      <PlannerGroup
        kind="task"
        label="Tasks"
        items={day.tasks}
        onAdd={add}
        onToggle={toggle}
        onRemove={remove}
      />
      <PlannerGroup
        kind="note"
        label="Notes"
        placeholder="Add a quick study note…"
        items={day.notes}
        onAdd={add}
        onToggle={toggle}
        onRemove={remove}
      />
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Journal — dated reflective entries anchored to the BIBLICAL date, so past
// years' reflections on the same appointed day surface together.
// ───────────────────────────────────────────────────────────────────────

function Journal({ dayId, detail }: { dayId: string; detail: DayDetail }) {
  const anchor = {
    year: detail.biblical.year,
    month: detail.biblical.month,
    day: detail.biblical.day,
  };
  const { thisYear, priorYears, add, remove } = useJournal(dayId, anchor);
  const [text, setText] = useState("");
  const submit = () => {
    add(text);
    setText("");
  };

  return (
    <div className="cal-dv-tabpanel">
      <p className="cal-dv-tabhint">
        Reflections anchored to <strong>{detail.monthName.split(" ")[0]} {detail.biblical.day}</strong> —
        they return on this appointed day every year. <span className="cal-dv-saved">saved on this device</span>
      </p>

      <div className="cal-jrnl-compose">
        <textarea
          className="cal-jrnl-input"
          value={text}
          placeholder="Write your reflection for this day…"
          rows={3}
          onChange={(e) => setText(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === "Enter" && (e.metaKey || e.ctrlKey)) submit();
          }}
        />
        <div className="cal-jrnl-compose-foot">
          <span className="cal-jrnl-hint">⌘↵ to save</span>
          <button type="button" className="cal-jrnl-save" onClick={submit} disabled={!text.trim()}>
            Save entry
          </button>
        </div>
      </div>

      {thisYear.length > 0 && (
        <div className="cal-jrnl-group">
          <div className="cal-pl-label">This year · {detail.biblical.year}</div>
          <ul className="cal-jrnl-list">
            {thisYear.map((e) => (
              <li key={e.id} className="cal-jrnl-entry">
                <p className="cal-jrnl-text">{e.text}</p>
                <button
                  type="button"
                  className="cal-pl-del cal-jrnl-del"
                  onClick={() => remove(e.id)}
                  aria-label="Remove entry"
                >
                  ✕
                </button>
              </li>
            ))}
          </ul>
        </div>
      )}

      <div className="cal-jrnl-group">
        <div className="cal-pl-label cal-jrnl-pastlabel">
          ✦ On this day in years past
        </div>
        {priorYears.length === 0 ? (
          <p className="cal-dv-empty">
            No entries from prior years yet. What you write today will return here on this
            same biblical date next year.
          </p>
        ) : (
          <ul className="cal-jrnl-list">
            {priorYears.map((e) => (
              <li key={e.id} className="cal-jrnl-entry cal-jrnl-past">
                <div className="cal-jrnl-when">
                  <span className="cal-jrnl-byear">Year {e.bYear}</span>
                  <span className="cal-jrnl-greg">{fmtPastEntryDate(e.dayId)}</span>
                </div>
                <p className="cal-jrnl-text">{e.text}</p>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}

/** "Sep 12, 2025" from a stored civil-day id (YYYY-MM-DD), for a past entry. */
function fmtPastEntryDate(dayIdStr: string): string {
  const [y, m, d] = dayIdStr.split("-").map(Number);
  return new Intl.DateTimeFormat("en-US", {
    timeZone: "UTC",
    month: "short",
    day: "numeric",
    year: "numeric",
  }).format(new Date(Date.UTC(y, m - 1, d, 12)));
}

function PlannerGroup({
  kind,
  label,
  items,
  onAdd,
  onToggle,
  onRemove,
  withTime = false,
  placeholder,
}: {
  kind: PlannerItemKind;
  label: string;
  items: PlannerItem[];
  onAdd: (kind: PlannerItemKind, text: string, time?: string) => void;
  onToggle: (item: PlannerItem) => void;
  onRemove: (id: string) => void;
  withTime?: boolean;
  placeholder?: string;
}) {
  const [text, setText] = useState("");
  const [time, setTime] = useState("");
  const submit = () => {
    onAdd(kind, text, withTime && time ? time : undefined);
    setText("");
    setTime("");
  };
  return (
    <div className="cal-pl-group">
      <div className="cal-pl-label">{label}</div>
      <ul className="cal-pl-list">
        {items.map((it) => (
          <li key={it.id} className={"cal-pl-item" + (it.done ? " cal-pl-done" : "")}>
            {kind === "task" && (
              <button
                type="button"
                className={"cal-pl-check" + (it.done ? " cal-pl-check-on" : "")}
                onClick={() => onToggle(it)}
                aria-label={it.done ? "Mark not done" : "Mark done"}
              >
                {it.done ? "✓" : ""}
              </button>
            )}
            {it.time && <span className="cal-pl-time">{it.time}</span>}
            <span className="cal-pl-text">{it.text}</span>
            <button
              type="button"
              className="cal-pl-del"
              onClick={() => onRemove(it.id)}
              aria-label="Remove"
            >
              ✕
            </button>
          </li>
        ))}
      </ul>
      <div className="cal-pl-add">
        {withTime && (
          <input
            className="cal-pl-input cal-pl-time-input"
            type="time"
            value={time}
            onChange={(e) => setTime(e.target.value)}
            aria-label="Event time"
          />
        )}
        <input
          className="cal-pl-input"
          type="text"
          value={text}
          placeholder={placeholder ?? `Add ${kind}…`}
          onChange={(e) => setText(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === "Enter") submit();
          }}
        />
        <button type="button" className="cal-pl-addbtn" onClick={submit} disabled={!text.trim()}>
          +
        </button>
      </div>
    </div>
  );
}

/** Reading-plan + devotional — wired-but-empty slots for later features. */
function PlaceholderSlots() {
  return (
    <section className="cal-dv-section cal-dv-slots">
      <div className="cal-dv-slot">
        <div className="cal-dv-slot-title">Reading plan</div>
        <p className="cal-dv-slot-body">Your plan for this day will appear here.</p>
        <span className="cal-dv-slot-soon">coming soon</span>
      </div>
      <div className="cal-dv-slot">
        <div className="cal-dv-slot-title">Devotional</div>
        <p className="cal-dv-slot-body">A devotional for this day will appear here.</p>
        <span className="cal-dv-slot-soon">coming soon</span>
      </div>
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// COMPARE RECKONINGS — the showpiece
// ───────────────────────────────────────────────────────────────────────

function CompareSection({
  reck,
  now,
  open,
  onToggle,
}: {
  reck: ReckoningState;
  now: Date;
  open: boolean;
  onToggle: () => void;
}) {
  const hourBucket = Math.floor(now.getTime() / 3_600_000);
  const data = useMemo(
    () => (open ? buildCompare(reck, new Date(hourBucket * 3_600_000)) : null),
    [open, reck, hourBucket],
  );

  return (
    <section className="cal-compare mb-6">
      <button type="button" className="cal-compare-toggle" onClick={onToggle} aria-expanded={open}>
        <span className="cal-compare-toggle-title">Compare Reckonings</span>
        <span className="cal-compare-toggle-sub">
          {open ? "hide" : "the same feast, every reckoning, side by side"}
        </span>
        <span className="cal-compare-chevron">{open ? "▴" : "▾"}</span>
      </button>

      {open && data && (
        <div className="cal-compare-body">
          <p className="cal-compare-lede">
            One Scripture. Four reckonings. The engine computes them all at once —
            and they land on <strong>different days</strong>. Next feast cycle:{" "}
            <strong>{data.cycleYear}</strong>. Each date is the{" "}
            <strong>evening</strong> the feast begins (sunset opens the day).
          </p>
          <div className="cal-compare-scroll">
            <table className="cal-compare-table">
              <thead>
                <tr>
                  <th className="cal-compare-feast-h">Feast</th>
                  {COMPARE_COLUMNS.map((col) => (
                    <th key={col.key}>
                      <span className={`chrome-metal chrome-metal-${col.register} cal-compare-colpill`}>
                        {col.label}
                      </span>
                      <span className="cal-compare-colsub">{col.sublabel}</span>
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {data.rows.map((row) => {
                  const t = moedTheme(row.kind);
                  return (
                    <tr key={row.kind} className={row.divergent ? "cal-row-divergent" : ""}>
                      <th scope="row" className="cal-compare-feast" style={{ color: t.glow }}>
                        <span
                          className="cal-legend-dot"
                          style={{ background: t.glow, boxShadow: `0 0 8px ${t.glow}` }}
                        />
                        {row.name}
                      </th>
                      {COMPARE_COLUMNS.map((col) => {
                        const cell = row.cells[col.key];
                        return (
                          <td key={col.key} className="cal-compare-cell">
                            {cell.label}
                          </td>
                        );
                      })}
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
          <p className="cal-compare-foot">
            Rows where the reckonings disagree glow. No other Bible app shows you
            this — because no other app computes every reckoning from one engine.
          </p>
        </div>
      )}
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// small helpers
// ───────────────────────────────────────────────────────────────────────

/**
 * The civil DAYTIME date of a moed. The engine reports a moed's `startInstant` as
 * the opening sunset (the evening before the daytime), which the lunar reckonings
 * display as "begins the evening of". Enoch reckons whole solar days, so it shows
 * the day itself: nudge ~18h past the opening sunset to land in that day's daytime.
 */
function moedDaytime(startInstant: Date): Date {
  return new Date(startInstant.getTime() + 18 * 3_600_000);
}

/** Hex (#RRGGBB) + alpha → rgba() string. */
function hexA(hex: string, a: number): string {
  const h = hex.replace("#", "");
  const r = parseInt(h.slice(0, 2), 16);
  const g = parseInt(h.slice(2, 4), 16);
  const b = parseInt(h.slice(4, 6), 16);
  return `rgba(${r}, ${g}, ${b}, ${a})`;
}
