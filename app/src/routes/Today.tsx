/**
 * Today.tsx — the "Today" home hub. The daily front door of the app.
 *
 * S228. The app had no HOME: authenticated partners dropped straight into the
 * Reader and never saw a daily gathering surface. This is it — the first thing
 * the app opens to, with the Reader one clear tap away.
 *
 * S228b — PROGRESSIVE DISCLOSURE (Yoshi). New users shouldn't be dropped into
 * the reckoning debate (dark moon / crescent / rabbinic / Enoch) on first open.
 * So the hub has three states, persisted in localStorage:
 *
 *   1. DEFAULT — opens on today's plain GREGORIAN date with the devotional and
 *      prayer. Simple and familiar. No biblical reckoning forced.
 *   2. BIBLICAL LAYER ON — a toggle reveals the biblical date / feast / Sabbath
 *      / Omer layer AND the reckoning dials, to explore freely.
 *   3. ONE-TAP HEBCAL — for the unsure: a single button sets up the calculated
 *      rabbinic (HebCal) calendar as a sensible working default and turns the
 *      layer on. The full reckoning choices stay available for those who dig in.
 *
 * Everything is computed locally from the calendar engine (lib/calendar); the
 * day's devotional + prayer come from the seeded content system (lib/devotional).
 * Standalone + auth-free, like /calendar. Aesthetic per DESIGN_LANGUAGE:
 * chrome-metal on the techelet-black field, feast-gold + emerald accents, NO
 * grey anywhere.
 */

import { useEffect, useMemo, useState } from "react";
import {
  DEFAULT_RECKONING,
  compute,
  moedTheme,
  type MonthKind,
  type ReckoningState,
} from "../lib/calendar/view-model.ts";
import {
  buildDayDetail,
  buildLayerGrid,
  computeOmer,
  fmtSunsetClock,
  type DayDetail,
  type OmerStatus,
} from "../lib/calendar/day-view-model.ts";
import {
  historyTone,
  type BiblicalHistoryEvent,
} from "../lib/calendar/biblical-history.ts";
import type { Moed } from "../lib/calendar/types.ts";
import {
  DEVOTIONAL_IS_SEED,
  biblicalDayOrdinal,
  contentForOrdinal,
  listThemes,
  setActiveTheme,
  type TodaysContent,
} from "../lib/devotional/index.ts";

// localStorage keys — the onboarding choice persists once the partner sets it.
const BIBLICAL_ON_KEY = "rop_today_biblical_on_v1";
const RECKONING_KEY = "rop_today_reckoning_v1";

interface ReckoningOption {
  kind: MonthKind;
  label: string;
  blurb: string;
}

// The four headline month-reckonings, in the language Yoshi names them. The
// finer dials (crescent criterion, year rule, Enoch intercalation, orientation,
// and the notes-against each) live on the full Appointed Times surface.
const RECKONINGS: ReckoningOption[] = [
  { kind: "conjunction", label: "Dark moon", blurb: "the month begins at the conjunction" },
  { kind: "crescent", label: "First crescent", blurb: "the month begins at the first visible sliver" },
  { kind: "rabbinic", label: "Calculated · HebCal", blurb: "the fixed rabbinic calendar most calendars use" },
  { kind: "enoch", label: "Enoch", blurb: "the fixed 364-day count" },
];

function reckoningFor(kind: MonthKind): ReckoningState {
  return { ...DEFAULT_RECKONING, month: kind };
}

export default function Today() {
  // Live "now", re-derived to the minute — enough to keep the date honest and
  // flip content at the day boundary without a per-second tick.
  const [now, setNow] = useState<Date>(() => new Date());
  useEffect(() => {
    const id = setInterval(() => setNow(new Date()), 60_000);
    return () => clearInterval(id);
  }, []);
  const minuteBucket = Math.floor(now.getTime() / 60_000);
  const today = useMemo(() => new Date(minuteBucket * 60_000), [minuteBucket]);

  // Onboarding state, hydrated from localStorage in the initializer (lazy
  // useState — no setState-in-effect). Default is the simple Gregorian state.
  const [biblicalOn, setBiblicalOn] = useState<boolean>(
    () =>
      typeof window !== "undefined" &&
      window.localStorage.getItem(BIBLICAL_ON_KEY) === "true",
  );
  const [monthKind, setMonthKind] = useState<MonthKind>(() => {
    if (typeof window === "undefined") return "crescent";
    const stored = window.localStorage.getItem(RECKONING_KEY);
    return stored && RECKONINGS.some((r) => r.kind === stored)
      ? (stored as MonthKind)
      : "crescent";
  });

  function persistBiblicalOn(on: boolean) {
    setBiblicalOn(on);
    if (typeof window !== "undefined") {
      window.localStorage.setItem(BIBLICAL_ON_KEY, String(on));
    }
  }
  function persistReckoning(kind: MonthKind) {
    setMonthKind(kind);
    if (typeof window !== "undefined") {
      window.localStorage.setItem(RECKONING_KEY, kind);
    }
  }
  // The unsure-user one-tap: a sensible working biblical calendar in one click.
  function useHebcalDefault() {
    persistReckoning("rabbinic");
    persistBiblicalOn(true);
  }

  // Theme selection lives in localStorage; this bump re-reads it after a change.
  const [themeTick, setThemeTick] = useState(0);

  const reck = useMemo(() => reckoningFor(monthKind), [monthKind]);

  // The biblical layer is only computed when it's turned on — the default state
  // stays simple and does no astronomy.
  const detail = useMemo<DayDetail | null>(() => {
    if (!biblicalOn) return null;
    const grid = buildLayerGrid(reck, today, today, "gregorian");
    const cell = grid.cells.find((c) => c.isToday);
    return cell ? buildDayDetail(reck, cell) : null;
  }, [biblicalOn, reck, today]);

  const nextMoed = useMemo<Moed | undefined>(
    () => (biblicalOn ? compute(reck, today).moedim[0] : undefined),
    [biblicalOn, reck, today],
  );
  const omer = useMemo<OmerStatus | null>(
    () => (biblicalOn ? computeOmer(reck, today) : null),
    [biblicalOn, reck, today],
  );

  // The devotional + prayer rotate every day in BOTH states: by the biblical day
  // (turns at sunset) when the layer is on, by the Gregorian day otherwise.
  const content = useMemo<TodaysContent>(() => {
    const ordinal =
      biblicalOn && detail
        ? biblicalDayOrdinal(detail.biblical.year, detail.biblical.month, detail.biblical.day)
        : biblicalDayOrdinal(today.getFullYear(), today.getMonth() + 1, today.getDate());
    return contentForOrdinal(ordinal);
    // themeTick forces a recompute after the reader changes themes.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [biblicalOn, detail, today, themeTick]);

  const feastsToday = detail?.moedim ?? [];
  const history = detail?.history ?? [];

  return (
    <div className="today-root min-h-screen bg-[var(--reader-bg)] text-[var(--reader-text)]">
      <main className="mx-auto w-full max-w-4xl px-4 py-7 sm:px-6 sm:py-10">
        <HubHeader />

        {biblicalOn && detail ? (
          <BiblicalDayPanel
            detail={detail}
            nextMoed={nextMoed}
            omer={omer}
            feasts={feastsToday}
            now={today}
            monthKind={monthKind}
            onPickReckoning={persistReckoning}
            onTurnOff={() => persistBiblicalOn(false)}
          />
        ) : (
          <GregorianPanel
            now={today}
            onTurnOn={() => persistBiblicalOn(true)}
            onHebcal={useHebcalDefault}
          />
        )}

        <DoorRow />

        <DevotionalCard
          content={content}
          onPickTheme={(id) => {
            setActiveTheme(id);
            setThemeTick((t) => t + 1);
          }}
        />

        <PrayerCard prayer={content.prayer} />

        {biblicalOn && history.length > 0 && <OnThisDay events={history} />}

        <footer className="mt-12 border-t border-[color:rgba(252,236,175,0.18)] pt-5 text-center font-sans text-xs leading-relaxed today-muted">
          {DEVOTIONAL_IS_SEED && (
            <p className="mb-1">
              The devotional and prayer here are a <em>seed set</em> — a starter
              library, with more themes coming.
            </p>
          )}
          <p>
            {biblicalOn
              ? "The day is computed locally, offline, from the biblical-calendar engine. Compute, don’t scrape."
              : "Turn on the biblical calendar above to see the appointed times for today."}
          </p>
        </footer>
      </main>
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Header
// ───────────────────────────────────────────────────────────────────────

function HubHeader() {
  return (
    <header className="mb-7 flex flex-col items-center text-center">
      <div className="today-eyebrow">The Remnant of Promise</div>
      <h1 className="today-title mt-1 font-serif text-3xl font-semibold tracking-tight sm:text-4xl">
        Today
      </h1>
      <p className="today-subtitle mt-2 max-w-xl font-sans text-sm sm:text-base">
        A place to gather before the day begins — the Word, a prayer to carry
        with you, and the appointed time when you want it.
      </p>
    </header>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Gregorian panel — the simple DEFAULT state + the onboarding affordances
// ───────────────────────────────────────────────────────────────────────

function fmtLocal(d: Date, opts: Intl.DateTimeFormatOptions): string {
  return new Intl.DateTimeFormat("en-US", opts).format(d);
}

function GregorianPanel({
  now,
  onTurnOn,
  onHebcal,
}: {
  now: Date;
  onTurnOn: () => void;
  onHebcal: () => void;
}) {
  return (
    <section className="today-day mb-7">
      <div className="today-date">
        <div className="today-eyebrow">Today</div>
        <div className="today-date-big">
          <span className="today-date-day">{fmtLocal(now, { day: "numeric" })}</span>
          <span className="today-date-month">{fmtLocal(now, { month: "long" })}</span>
        </div>
        <div className="today-date-year">
          <span className="today-date-yearnum">{fmtLocal(now, { year: "numeric" })}</span>
          {" · "}
          {fmtLocal(now, { weekday: "long" })}
        </div>
      </div>

      {/* The progressive-disclosure card: turn on the biblical calendar, or the
          one-tap HebCal default for the unsure. */}
      <div className="today-onboard">
        <div className="today-onboard-row">
          <div className="today-onboard-copy">
            <div className="today-onboard-title">The biblical calendar</div>
            <p className="today-onboard-text">
              Want today&rsquo;s biblical date, the Sabbath, and the feasts? Turn
              it on to reveal the appointed-times layer — and to explore how the
              months are reckoned.
            </p>
          </div>
          <button
            type="button"
            className="today-toggle"
            onClick={onTurnOn}
            aria-label="Turn on the biblical calendar"
          >
            <span className="today-toggle-track" aria-hidden="true">
              <span className="today-toggle-knob" />
            </span>
            <span className="today-toggle-label">Turn on</span>
          </button>
        </div>

        <div className="today-onboard-unsure">
          <span className="today-onboard-unsure-q">
            Not sure which calendar to follow?
          </span>
          <button
            type="button"
            className="chrome-metal chrome-metal-gold today-hebcal-btn"
            onClick={onHebcal}
          >
            <span aria-hidden="true">✓</span>
            <span>Use the calculated (HebCal) calendar</span>
          </button>
          <span className="today-onboard-unsure-note">
            the one most calendars use — a sensible default you can change anytime
          </span>
        </div>
      </div>
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Biblical day panel — revealed when the layer is ON
// ───────────────────────────────────────────────────────────────────────

function BiblicalDayPanel({
  detail,
  nextMoed,
  omer,
  feasts,
  now,
  monthKind,
  onPickReckoning,
  onTurnOff,
}: {
  detail: DayDetail;
  nextMoed: Moed | undefined;
  omer: OmerStatus | null;
  feasts: Moed[];
  now: Date;
  monthKind: MonthKind;
  onPickReckoning: (kind: MonthKind) => void;
  onTurnOff: () => void;
}) {
  const bd = detail.biblical;
  const sabbath = detail.isSabbath;
  return (
    <section className="today-day mb-7">
      <div className="today-day-topbar">
        <span className="today-eyebrow">Biblical calendar · on</span>
        <button type="button" className="today-turnoff" onClick={onTurnOff}>
          Turn off
        </button>
      </div>

      <div className="today-day-grid">
        {/* The date */}
        <div className="today-date">
          <div className="today-eyebrow today-eyebrow-gold">
            Today &middot; Jerusalem reckoning
          </div>
          <div className="today-date-big">
            <span className="today-date-day">{bd.day}</span>
            <span className="today-date-month">{detail.monthName}</span>
          </div>
          <div className="today-date-year">
            Year <span className="today-date-yearnum">{bd.year}</span> from
            creation
          </div>
          <div className="today-greg">
            {fmtLocal(now, { weekday: "long", month: "long", day: "numeric", year: "numeric" })}
          </div>
          <div className="today-sunset">
            ☼ this day runs sunset to sunset &middot; closes{" "}
            {fmtSunsetClock(detail.closesAt)}
          </div>
        </div>

        {/* Status: Sabbath / feast / working day */}
        <div className="today-status">
          {feasts.length > 0 ? (
            feasts.map((m) => {
              const theme = moedTheme(m.kind);
              return (
                <div
                  key={m.kind + m.name}
                  className="today-status-badge today-status-feast"
                  style={{ ["--badge-glow" as string]: theme.glow }}
                >
                  <span className="today-status-mark">✦</span>
                  <span className="today-status-label">{m.name}</span>
                  <span className="today-status-sub">an appointed time — today</span>
                </div>
              );
            })
          ) : sabbath ? (
            <div className="today-status-badge today-status-sabbath">
              <span className="today-status-mark">✦</span>
              <span className="today-status-label">Sabbath</span>
              <span className="today-status-sub">
                the seventh day — enter the rest
              </span>
            </div>
          ) : (
            <div className="today-status-badge today-status-working">
              <span className="today-status-label">A working day</span>
              <span className="today-status-sub">walk it with Him</span>
            </div>
          )}

          {nextMoed && (
            <div className="today-next">
              <div className="today-eyebrow">Next appointed time</div>
              <div
                className="today-next-name"
                style={{ color: moedTheme(nextMoed.kind).glow }}
              >
                {nextMoed.name}
              </div>
              <div className="today-next-when">
                begins at sunset &middot;{" "}
                {new Intl.DateTimeFormat("en-US", {
                  timeZone: "UTC",
                  weekday: "short",
                  month: "short",
                  day: "numeric",
                }).format(nextMoed.startInstant)}
              </div>
            </div>
          )}
        </div>
      </div>

      {omer && <OmerStrip omer={omer} />}

      <ReckoningDials selected={monthKind} onPick={onPickReckoning} />
    </section>
  );
}

function ReckoningDials({
  selected,
  onPick,
}: {
  selected: MonthKind;
  onPick: (kind: MonthKind) => void;
}) {
  return (
    <div className="today-dials">
      <div className="today-eyebrow today-dials-head">How the months are reckoned</div>
      <div className="today-dials-grid">
        {RECKONINGS.map((r) => (
          <button
            key={r.kind}
            type="button"
            className={
              "today-dial" + (selected === r.kind ? " today-dial-on" : "")
            }
            onClick={() => onPick(r.kind)}
            aria-pressed={selected === r.kind}
          >
            <span className="today-dial-label">{r.label}</span>
            <span className="today-dial-blurb">{r.blurb}</span>
          </button>
        ))}
      </div>
      <a href="/calendar" className="today-dials-more">
        Open The Appointed Times for the full dials &amp; the case for each →
      </a>
    </div>
  );
}

function OmerStrip({ omer }: { omer: OmerStatus }) {
  return (
    <div className={"today-omer" + (omer.isShavuot ? " today-omer-crown" : "")}>
      <div className="today-omer-mark">
        <span className="today-omer-n">{omer.day}</span>
        <span className="today-omer-of">of&nbsp;50</span>
      </div>
      <div className="today-omer-body">
        <div className="today-omer-title">
          {omer.isShavuot
            ? "Shavuot — the fiftieth day"
            : `Day ${omer.day} of the Omer`}
        </div>
        <div className="today-omer-sub">
          {omer.isShavuot ? (
            <>The count is fulfilled — the Feast of Weeks.</>
          ) : (
            <>
              {omer.breakdown} of the count &middot; counting toward Shavuot
            </>
          )}
        </div>
        <div className="today-omer-track" aria-hidden="true">
          <div
            className="today-omer-fill"
            style={{ width: `${(omer.day / 50) * 100}%` }}
          />
        </div>
      </div>
      <div className="today-omer-ref">Lev 23:15-16</div>
    </div>
  );
}

// ───────────────────────────────────────────────────────────────────────
// Quick doors
// ───────────────────────────────────────────────────────────────────────

function DoorRow() {
  return (
    <section className="today-doors mb-8" aria-label="Quick doors">
      {/* Read — the primary door, given the most weight. */}
      <a href="/read" className="today-door today-door-read">
        <span className="today-door-glyph" aria-hidden="true">
          ✶
        </span>
        <span className="today-door-text">
          <span className="today-door-title">Read</span>
          <span className="today-door-sub">
            the study Bible — pick up where you left off
          </span>
        </span>
        <span className="today-door-arrow" aria-hidden="true">
          →
        </span>
      </a>

      <div className="today-doors-row">
        <a href="/calendar" className="today-door today-door-cal">
          <span className="today-door-glyph" aria-hidden="true">
            ☾
          </span>
          <span className="today-door-text">
            <span className="today-door-title">The Appointed Times</span>
            <span className="today-door-sub">the biblical calendar</span>
          </span>
        </a>
        <a href="/read?study=1" className="today-door today-door-study">
          <span className="today-door-glyph" aria-hidden="true">
            ✎
          </span>
          <span className="today-door-text">
            <span className="today-door-title">My Study</span>
            <span className="today-door-sub">notes, marks &amp; journal</span>
          </span>
        </a>
      </div>
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// The day's devotional
// ───────────────────────────────────────────────────────────────────────

function DevotionalCard({
  content,
  onPickTheme,
}: {
  content: TodaysContent;
  onPickTheme: (id: string) => void;
}) {
  const { theme, entry, entryNumber } = content;
  const themes = listThemes();
  return (
    <section className="today-card today-card-devo mb-7">
      <div className="today-card-head">
        <div>
          <div className="today-eyebrow today-eyebrow-gold">
            Today&rsquo;s devotional
          </div>
          <div className="today-card-series">{theme.title}</div>
        </div>
        <div className="today-card-counter">
          Day {entryNumber} of {theme.entries.length}
        </div>
      </div>

      <h2 className="today-devo-title">{entry.title}</h2>
      <p className="today-devo-subtitle">{entry.subtitle}</p>

      <blockquote className="today-passage">
        <p className="today-passage-text">{entry.passageText}</p>
        <cite className="today-passage-ref">{entry.passageRef}</cite>
      </blockquote>

      <div className="today-devo-body">
        <p>{entry.reflection}</p>
        <p className="today-devo-invite">
          <span className="today-devo-invite-mark">Come home —</span>{" "}
          {entry.invitation}
        </p>
        <p className="today-devo-closing">{entry.closing}</p>
      </div>

      {themes.length > 1 && (
        <div className="today-theme-pick">
          <label htmlFor="today-theme" className="today-theme-pick-label">
            Devotional theme
          </label>
          <select
            id="today-theme"
            className="today-theme-select"
            value={theme.id}
            onChange={(e) => onPickTheme(e.target.value)}
          >
            {themes.map((t) => (
              <option key={t.id} value={t.id}>
                {t.title}
              </option>
            ))}
          </select>
        </div>
      )}
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// The day's prayer
// ───────────────────────────────────────────────────────────────────────

function PrayerCard({ prayer }: { prayer: TodaysContent["prayer"] }) {
  return (
    <section className="today-card today-card-prayer mb-7">
      <div className="today-card-head">
        <div>
          <div className="today-eyebrow today-eyebrow-emerald">
            Today&rsquo;s prayer
          </div>
          <div className="today-card-series">{prayer.title}</div>
        </div>
        <div className="today-card-anchor">{prayer.scriptureAnchor}</div>
      </div>
      <p className="today-prayer-subtitle">{prayer.subtitle}</p>
      <p className="today-prayer-body">{prayer.body}</p>
    </section>
  );
}

// ───────────────────────────────────────────────────────────────────────
// On this day in biblical history
// ───────────────────────────────────────────────────────────────────────

function OnThisDay({ events }: { events: BiblicalHistoryEvent[] }) {
  return (
    <section className="today-card today-card-history mb-7">
      <div className="today-eyebrow today-eyebrow-gold mb-3">
        On this day in biblical history
      </div>
      <ul className="today-history-list">
        {events.map((ev) => {
          const tone = historyTone(ev.category);
          return (
            <li
              key={ev.id}
              className="today-history-item"
              style={{ ["--ev-glow" as string]: tone.glow }}
            >
              <div className="today-history-head">
                <span className="today-history-dot" aria-hidden="true" />
                <span className="today-history-title">{ev.title}</span>
                <span className="today-history-ref">{ev.scripture}</span>
              </div>
              <p className="today-history-summary">{ev.summary}</p>
            </li>
          );
        })}
      </ul>
    </section>
  );
}
