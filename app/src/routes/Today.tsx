/**
 * Today.tsx — the "Today" home hub. The daily front door of the app.
 *
 * S228. The app had no HOME: authenticated partners dropped straight into the
 * Reader and never saw a daily gathering surface. This is it — the first thing
 * the app opens to, with the Reader one clear tap away.
 *
 * It pulls LIVE from the biblical-calendar engine (lib/calendar): today's
 * biblical date, the Sabbath / feast status, the Omer count when the season is
 * running, and "on this day in biblical history" from the same seed the calendar
 * day-view uses. Beneath the day it surfaces the day's devotional and the day's
 * prayer from the seeded content system (lib/devotional), and offers quick doors
 * into the Reader, The Appointed Times, and My Study.
 *
 * Standalone + auth-free, like /calendar — it computes everything locally and
 * needs no backend, so it renders as a live surface for every partner and as a
 * screenshottable demo. Aesthetic per DESIGN_LANGUAGE: chrome-metal on the
 * techelet-black field, feast-gold and emerald accents, NO grey anywhere.
 */

import { useEffect, useMemo, useState } from "react";
import {
  DEFAULT_RECKONING,
  compute,
  moedTheme,
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
  listThemes,
  setActiveTheme,
  todaysContent,
  type TodaysContent,
} from "../lib/devotional/index.ts";

const reck = DEFAULT_RECKONING;

export default function Today() {
  // Live "now", re-derived to the minute — enough to keep the date honest and
  // flip content at the sunset boundary without a per-second tick.
  const [now, setNow] = useState<Date>(() => new Date());
  useEffect(() => {
    const id = setInterval(() => setNow(new Date()), 60_000);
    return () => clearInterval(id);
  }, []);
  const minuteBucket = Math.floor(now.getTime() / 60_000);
  const today = useMemo(() => new Date(minuteBucket * 60_000), [minuteBucket]);

  // Theme selection lives in localStorage; this bump re-reads it after a change.
  const [themeTick, setThemeTick] = useState(0);

  const detail = useMemo<DayDetail | null>(() => {
    const grid = buildLayerGrid(reck, today, today, "gregorian");
    const cell = grid.cells.find((c) => c.isToday);
    return cell ? buildDayDetail(reck, cell) : null;
  }, [today]);

  const todayResult = useMemo(() => compute(reck, today), [today]);
  const nextMoed: Moed | undefined = todayResult.moedim[0];
  const omer = useMemo<OmerStatus | null>(() => computeOmer(reck, today), [today]);

  const content = useMemo<TodaysContent | null>(() => {
    if (!detail) return null;
    return todaysContent(detail.biblical);
    // themeTick forces a recompute after the reader changes themes.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [detail, themeTick]);

  const feastsToday = detail?.moedim ?? [];
  const history = detail?.history ?? [];

  return (
    <div className="today-root min-h-screen bg-[var(--reader-bg)] text-[var(--reader-text)]">
      <main className="mx-auto w-full max-w-4xl px-4 py-7 sm:px-6 sm:py-10">
        <HubHeader />

        {detail && (
          <DayPanel
            detail={detail}
            nextMoed={nextMoed}
            omer={omer}
            feasts={feastsToday}
          />
        )}

        <DoorRow />

        {content && (
          <DevotionalCard
            content={content}
            onPickTheme={(id) => {
              setActiveTheme(id);
              setThemeTick((t) => t + 1);
            }}
          />
        )}

        {content && <PrayerCard prayer={content.prayer} />}

        {history.length > 0 && <OnThisDay events={history} />}

        <footer className="mt-12 border-t border-[color:rgba(252,236,175,0.18)] pt-5 text-center font-sans text-xs leading-relaxed today-muted">
          {DEVOTIONAL_IS_SEED && (
            <p className="mb-1">
              The devotional and prayer here are a <em>seed set</em> — a starter
              library, with more themes coming.
            </p>
          )}
          <p>
            The day is computed locally, offline, from the biblical-calendar
            engine. Compute, don&rsquo;t scrape.
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
        A place to gather before the day begins — the appointed time, the Word,
        and a prayer to carry with you.
      </p>
    </header>
  );
}

// ───────────────────────────────────────────────────────────────────────
// The day panel — biblical date, Sabbath/feast status, next moed, Omer
// ───────────────────────────────────────────────────────────────────────

function DayPanel({
  detail,
  nextMoed,
  omer,
  feasts,
}: {
  detail: DayDetail;
  nextMoed: Moed | undefined;
  omer: OmerStatus | null;
  feasts: Moed[];
}) {
  const bd = detail.biblical;
  const sabbath = detail.isSabbath;
  return (
    <section className="today-day mb-7">
      <div className="today-day-grid">
        {/* The date */}
        <div className="today-date">
          <div className="today-eyebrow">Today &middot; Jerusalem reckoning</div>
          <div className="today-date-big">
            <span className="today-date-day">{bd.day}</span>
            <span className="today-date-month">{detail.monthName}</span>
          </div>
          <div className="today-date-year">
            Year <span className="today-date-yearnum">{bd.year}</span> from
            creation
          </div>
          <div className="today-greg">{detail.gregorianFull}</div>
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
              <span className="today-status-sub">
                walk it with Him
              </span>
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
    </section>
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

function PrayerCard({
  prayer,
}: {
  prayer: TodaysContent["prayer"];
}) {
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
