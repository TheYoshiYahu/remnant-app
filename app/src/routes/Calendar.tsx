import { useEffect, useMemo, useState } from "react";
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
  buildMonthGrid,
  compute,
  countdownTo,
  COMPARE_COLUMNS,
  DEFAULT_RECKONING,
  fmtEvening,
  fmtFull,
  fmtOverlay,
  moedTheme,
  moonArt,
  moonLitPath,
  monthDisplayName,
  MOED_SHORT,
  nextMonthFocus,
  prevMonthFocus,
  sabbathStatus,
  type DayCell,
  type MonthKind,
  type ReckoningState,
} from "../lib/calendar/view-model.ts";

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
export default function Calendar() {
  const [reck, setReck] = useState<ReckoningState>(DEFAULT_RECKONING);
  const [focus, setFocus] = useState<Date>(() => new Date());
  const [now, setNow] = useState<Date>(() => new Date());
  const [showCompare, setShowCompare] = useState(
    () =>
      typeof window !== "undefined" &&
      new URLSearchParams(window.location.search).get("compare") === "1",
  );

  // Live tick — drives the countdown and keeps "today" honest.
  useEffect(() => {
    const id = setInterval(() => setNow(new Date()), 1000);
    return () => clearInterval(id);
  }, []);

  // Re-derive "today" only once a minute — the per-second tick drives the
  // live countdown, but the date and the month grid needn't rebuild every
  // second. Keyed on the minute so the memo depends only on `minuteBucket`.
  const minuteBucket = Math.floor(now.getTime() / 60000);
  const today = useMemo(() => new Date(minuteBucket * 60000), [minuteBucket]);

  const todayResult = useMemo(() => compute(reck, today), [reck, today]);
  const grid = useMemo(
    () => buildMonthGrid(reck, focus, today),
    [reck, focus, today],
  );

  const todayCell = grid.cells.find((c) => c.isToday);
  const nextMoed = todayResult.moedim[0];

  return (
    <div className="cal-root min-h-screen bg-[var(--reader-bg)] text-[var(--reader-text)]">
      <main className="mx-auto w-full max-w-5xl px-4 py-6 sm:px-6 sm:py-9">
        <Header />
        <ReckoningControls reck={reck} setReck={setReck} notes={todayResult.notes} />
        <HeroToday
          reck={reck}
          result={todayResult}
          todayCell={todayCell}
          now={now}
          nextMoed={nextMoed}
        />
        <CrescentWatch reck={reck} result={todayResult} now={now} setReck={setReck} />
        <MonthGridView
          grid={grid}
          onPrev={() => setFocus(prevMonthFocus(grid))}
          onNext={() => setFocus(nextMonthFocus(grid))}
          onToday={() => setFocus(new Date())}
        />
        <CompareSection
          reck={reck}
          now={now}
          open={showCompare}
          onToggle={() => setShowCompare((v) => !v)}
        />
        <footer className="mt-10 border-t border-[var(--reader-rule)] pt-4 text-center font-sans text-xs text-[var(--reader-muted)]">
          Computed locally — offline, for any year — from the biblical-calendar
          engine. Compute, don&rsquo;t scrape.
        </footer>
      </main>
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Header
// ───────────────────────────────────────────────────────────────────────

function Header() {
  return (
    <header className="mb-6">
      <a
        href="/read"
        className="font-sans text-xs font-medium uppercase tracking-wider text-[var(--reader-accent)] hover:opacity-80"
      >
        ← Back to reading
      </a>
      <h1 className="cal-title mt-3 font-serif text-3xl font-semibold tracking-tight sm:text-4xl">
        The Appointed Times
      </h1>
      <p className="mt-1 max-w-2xl font-sans text-sm text-[var(--reader-muted)]">
        The moedim of Scripture, reckoned every way at once. Toggle the dials —
        the whole calendar recomputes live.
      </p>
    </header>
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

const MONTH_DIALS: { key: MonthKind; label: string; register: string }[] = [
  { key: "conjunction", label: "Dark Moon", register: "techelet" },
  { key: "crescent", label: "First Crescent", register: "gold" },
  { key: "rabbinic", label: "Rabbinic", register: "argaman" },
  { key: "enoch", label: "Enoch · 364", register: "emerald" },
];

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

        {isCrescent && (
          <>
            <ControlRow label="Criterion">
              {(["odeh", "yallop"] as CrescentCriterion[]).map((c) => (
                <Pill
                  key={c}
                  active={reck.criterion === c}
                  register="gold"
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
                  register="gold"
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

        <ControlRow label="Override">
          <Pill
            active={!!reck.overrideMonthStart}
            register="scarlet"
            onClick={() =>
              set({
                overrideMonthStart: reck.overrideMonthStart
                  ? undefined
                  : mostRecentSunsetGuess(),
              })
            }
            title="Set today as a new month-start — honored above every computed reckoning"
          >
            {reck.overrideMonthStart ? "Manual month ✓ (clear)" : "Set today as month 1"}
          </Pill>
        </ControlRow>
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

/** Rough "today's sunset" anchor for the manual override (UTC evening). */
function mostRecentSunsetGuess(): Date {
  const d = new Date();
  d.setUTCHours(16, 30, 0, 0); // ≈ Jerusalem sunset in UTC; honest-enough anchor
  if (d.getTime() > Date.now()) d.setUTCDate(d.getUTCDate() - 1);
  return d;
}

// ───────────────────────────────────────────────────────────────────────
// Hero TODAY panel
// ───────────────────────────────────────────────────────────────────────

interface HeroProps {
  reck: ReckoningState;
  result: ReturnType<typeof compute>;
  todayCell: DayCell | undefined;
  now: Date;
  nextMoed: Moed | undefined;
}

function HeroToday({ reck, result, todayCell, now, nextMoed }: HeroProps) {
  const bd = result.biblicalDate;
  const art = moonArt(now, 50);
  const sab = sabbathStatus(todayCell);
  const yearFrac = yearPosition(bd.month, bd.day);
  const cd = nextMoed ? countdownTo(nextMoed.startInstant, now) : null;
  const moedThemeForNext = nextMoed ? moedTheme(nextMoed.kind) : null;

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

        {/* The moon, as art */}
        <div className="cal-hero-moon">
          <MoonArtSvg
            litPath={art.litPath}
            waxing={art.waxing}
            illum={art.illum}
            size={150}
          />
          <div className="cal-moon-phase">{art.phase}</div>
          <div className="cal-moon-illum">{Math.round(art.illum * 100)}% lit</div>
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
                begins at sunset &middot; {fmtEvening(nextMoed.startInstant)}
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
    </section>
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
// Month grid
// ───────────────────────────────────────────────────────────────────────

const WEEKDAYS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

function MonthGridView({
  grid,
  onPrev,
  onNext,
  onToday,
}: {
  grid: ReturnType<typeof buildMonthGrid>;
  onPrev: () => void;
  onNext: () => void;
  onToday: () => void;
}) {
  return (
    <section className="cal-panel mb-6">
      <div className="cal-grid-head">
        <button type="button" className="cal-nav-btn" onClick={onPrev} aria-label="Previous month">
          ‹
        </button>
        <div className="cal-grid-title">
          <div className="cal-grid-month">{grid.monthName}</div>
          <div className="cal-grid-year">
            Year {grid.year} &middot; {grid.cells.length} days
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
          <DayCellView key={c.day} cell={c} />
        ))}
      </div>

      <GridLegend cells={grid.cells} />
    </section>
  );
}

function DayCellView({ cell }: { cell: DayCell }) {
  const moed = cell.moedim[0];
  const theme = moed ? moedTheme(moed.kind) : null;
  const style: React.CSSProperties = theme
    ? {
        background: `linear-gradient(160deg, ${hexA(theme.deep, 0.92)} 0%, ${hexA(theme.deep, 0.45)} 100%)`,
        borderColor: hexA(theme.glow, 0.55),
        boxShadow: `0 0 14px ${hexA(theme.glow, 0.28)}, inset 0 0 10px ${hexA(theme.glow, 0.12)}`,
      }
    : {};
  return (
    <div
      className={
        "cal-cell" +
        (cell.isSabbath ? " cal-cell-sabbath" : "") +
        (cell.isToday ? " cal-cell-today" : "") +
        (moed ? " cal-cell-moed" : "")
      }
      style={style}
    >
      <div className="cal-cell-top">
        <span className="cal-cell-day" style={theme ? { color: theme.glow } : undefined}>
          {cell.day}
        </span>
        <span className="cal-cell-greg">{fmtOverlay(cell.civil)}</span>
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
        ) : cell.isSabbath ? (
          <span className="cal-cell-sab">Sabbath</span>
        ) : null}
      </div>
    </div>
  );
}

function GridLegend({ cells }: { cells: DayCell[] }) {
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
            <strong>{data.cycleYear}</strong>.
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

/** Hex (#RRGGBB) + alpha → rgba() string. */
function hexA(hex: string, a: number): string {
  const h = hex.replace("#", "");
  const r = parseInt(h.slice(0, 2), 16);
  const g = parseInt(h.slice(2, 4), 16);
  const b = parseInt(h.slice(4, 6), 16);
  return `rgba(${r}, ${g}, ${b}, ${a})`;
}
