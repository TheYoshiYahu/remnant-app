/**
 * TorahPortions — the whole annual Torah cycle on one page (board suggestion
 * #9, 2026-10-30: "search any Torah portion week at any point throughout the
 * Biblical year … or for the circumstance I'm in right now, starting the
 * portion readings a couple weeks later than what the calendar anchor puts
 * me at").
 *
 * Lives at `/torah-portions`. Free for everyone — it is a reference list.
 *
 *   - This week's portion at the top, honouring the reader's own offset.
 *   - A search box over name, Torah reading and Haftarah.
 *   - Every portion in order, grouped by book, each with the Shabbat it falls
 *     on under the reader's elected reckoning, the Torah and Haftarah
 *     readings, and one tap into the reader.
 *   - "This is my week" on any row sets the reader's offset so the weekly
 *     portion everywhere in the app follows their start, not the calendar's.
 *     A stepper and a reset sit under the heading for the same thing.
 */

import { useEffect, useMemo, useState } from "react";
import { getReckoningPref } from "../lib/calendar/reckoning-pref";
import type { MonthKind } from "../lib/calendar/view-model";
import {
  getParshaForDate,
  listTorahCycle,
  type CyclePortion,
  type ParshaPortion,
} from "../lib/torah/parsha";
import {
  describePortionOffset,
  getPortionOffsetWeeks,
  PORTION_OFFSET_CHANGED_EVENT,
  setPortionOffsetWeeks,
} from "../lib/torah/portion-offset";

const RECKONING_LABEL: Record<MonthKind, string> = {
  conjunction: "dark-moon reckoning",
  crescent: "first-crescent reckoning",
  rabbinic: "calculated (HebCal) calendar",
  enoch: "Enoch 364-day reckoning",
};

const BOOK_ORDER = ["Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy"];

function readerHref(slug: string, chapter: number): string {
  return `/read?book=${encodeURIComponent(slug)}&chapter=${chapter}`;
}

function sameDay(a: Date, b: Date): boolean {
  return (
    a.getFullYear() === b.getFullYear() &&
    a.getMonth() === b.getMonth() &&
    a.getDate() === b.getDate()
  );
}

/** "Genesis 1:1–6:8" → "Genesis". */
function bookOf(torahRef: string): string {
  const m = torahRef.match(/^([1-3]?\s?[A-Za-z]+)/);
  return m ? m[1].trim() : "";
}

const fmtSabbath = new Intl.DateTimeFormat(undefined, {
  weekday: "short",
  month: "short",
  day: "numeric",
});
const fmtSabbathLong = new Intl.DateTimeFormat(undefined, {
  weekday: "long",
  month: "long",
  day: "numeric",
  year: "numeric",
});

export default function TorahPortions() {
  const reckoning = useMemo(() => getReckoningPref(), []);
  const [offset, setOffset] = useState<number>(() => getPortionOffsetWeeks());
  const [query, setQuery] = useState("");

  // Follow changes made elsewhere (the reader header's panel, another tab).
  useEffect(() => {
    const onChange = () => setOffset(getPortionOffsetWeeks());
    window.addEventListener(PORTION_OFFSET_CHANGED_EVENT, onChange);
    window.addEventListener("storage", onChange);
    return () => {
      window.removeEventListener(PORTION_OFFSET_CHANGED_EVENT, onChange);
      window.removeEventListener("storage", onChange);
    };
  }, []);

  const today = useMemo(() => new Date(), []);
  const thisWeek = useMemo<ParshaPortion | null>(
    () => getParshaForDate(today, reckoning, { offsetWeeks: offset }),
    [today, reckoning, offset],
  );
  const cycle = useMemo<CyclePortion[]>(
    () => listTorahCycle(today, reckoning, { offsetWeeks: offset }),
    [today, reckoning, offset],
  );

  const currentIndex = useMemo(() => {
    if (!thisWeek) return -1;
    return cycle.findIndex((p) => sameDay(p.sabbathDate, thisWeek.sabbathDate));
  }, [cycle, thisWeek]);

  const q = query.trim().toLowerCase();
  const shown = useMemo(
    () =>
      q
        ? cycle.filter(
            (p) =>
              p.name.toLowerCase().includes(q) ||
              p.torahRef.toLowerCase().includes(q) ||
              p.haftarahRef.toLowerCase().includes(q),
          )
        : cycle,
    [cycle, q],
  );

  // Group the shown rows by book of the Torah reading, in Torah order.
  const groups = useMemo(() => {
    const map = new Map<string, CyclePortion[]>();
    for (const p of shown) {
      const b = bookOf(p.torahRef) || "Other";
      if (!map.has(b)) map.set(b, []);
      map.get(b)!.push(p);
    }
    const ordered = [...map.entries()].sort(
      ([a], [b]) =>
        (BOOK_ORDER.indexOf(a) === -1 ? 99 : BOOK_ORDER.indexOf(a)) -
        (BOOK_ORDER.indexOf(b) === -1 ? 99 : BOOK_ORDER.indexOf(b)),
    );
    return ordered;
  }, [shown]);

  const change = (weeks: number) => {
    setPortionOffsetWeeks(weeks);
    setOffset(getPortionOffsetWeeks());
  };

  /**
   * Make row `p` this week's portion. The calendar's own row (no offset) is
   * `currentIndex + offset`; the new offset is that minus the chosen row.
   */
  const makeMine = (p: CyclePortion) => {
    if (currentIndex === -1) return;
    change(currentIndex + offset - p.index);
  };

  const rowCls = (p: CyclePortion) =>
    "scroll-mt-6 rounded-md border px-4 py-3 " +
    (p.index === currentIndex
      ? "border-[var(--reader-accent)] bg-[var(--reader-surface)]"
      : "border-[var(--reader-rule)] bg-[var(--reader-surface)]");

  return (
    <main className="mx-auto w-full max-w-2xl px-4 py-8 sm:px-6">
      <header className="mb-6 border-b border-[var(--reader-rule)] pb-4">
        <a
          href="/"
          className="font-sans text-xs font-medium uppercase tracking-wider text-[var(--reader-accent)] hover:opacity-80"
        >
          ← Back to reading
        </a>
        <h1 className="mt-3 text-2xl font-semibold text-[var(--reader-text)]">Torah portions</h1>
        <p className="mt-1 font-sans text-sm text-[var(--reader-muted)]">
          The whole annual cycle, each portion with the Sabbath it falls on under your{" "}
          {RECKONING_LABEL[reckoning]} (change it on the{" "}
          <a href="/calendar" className="underline">calendar</a>). Tap a reading to open it.
        </p>
      </header>

      {/* This week */}
      {thisWeek ? (
        <section className="mb-6 rounded-md border border-[var(--reader-accent)] bg-[var(--reader-surface)] px-4 py-4">
          <div className="font-sans text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]">
            This week&rsquo;s portion &middot; {fmtSabbathLong.format(thisWeek.sabbathDate)}
          </div>
          <div className="mt-0.5 font-serif text-xl font-semibold text-[var(--reader-accent)]">
            {thisWeek.name}
          </div>
          <div className="mt-2 flex flex-col gap-1 font-sans text-sm">
            <a href={readerHref(thisWeek.opening.book_id, thisWeek.opening.chapter)} className="underline">
              Torah &middot; {thisWeek.torahRef}
            </a>
            {thisWeek.haftarahOpening ? (
              <a
                href={readerHref(thisWeek.haftarahOpening.book_id, thisWeek.haftarahOpening.chapter)}
                className="underline"
              >
                Haftarah &middot; {thisWeek.haftarahRef}
              </a>
            ) : (
              <span className="text-[var(--reader-muted)]">Haftarah &middot; {thisWeek.haftarahRef}</span>
            )}
          </div>
        </section>
      ) : (
        <section className="mb-6 rounded-md border border-[var(--reader-rule)] px-4 py-3 font-sans text-sm text-[var(--reader-muted)]">
          No weekly portion resolves for this Sabbath (a festival reading falls here).
        </section>
      )}

      {/* Your own start */}
      <section className="mb-6 rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3 font-sans text-sm">
        <div className="font-medium text-[var(--reader-text)]">Started on a different week?</div>
        <p className="mt-1 text-[var(--reader-muted)]">
          If you began the readings later (or earlier) than the calendar, set your own week here
          and this week&rsquo;s portion will follow your start everywhere in the app. Or tap
          &ldquo;This is my week&rdquo; on the portion you are reading now.
        </p>
        <div className="mt-2 flex flex-wrap items-center gap-2">
          <button type="button" onClick={() => change(offset + 1)} className={BTN} title="One more week behind">
            − 1 week
          </button>
          <span className="text-[var(--reader-text)]">{describePortionOffset(offset)}</span>
          <button type="button" onClick={() => change(offset - 1)} className={BTN} title="One week further on">
            + 1 week
          </button>
          {offset !== 0 && (
            <button type="button" onClick={() => change(0)} className={BTN}>
              Back to the calendar
            </button>
          )}
        </div>
      </section>

      {/* Search */}
      <div className="mb-4">
        <label className="sr-only" htmlFor="portion-search">Search portions</label>
        <input
          id="portion-search"
          type="search"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search a portion — Noach, Exodus 12, Isaiah 54…"
          className="w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2 font-sans text-sm text-[var(--reader-text)]"
        />
        {q && (
          <div className="mt-1 font-sans text-xs text-[var(--reader-muted)]">
            {shown.length} of {cycle.length} portions
          </div>
        )}
      </div>

      {/* The list */}
      {cycle.length === 0 ? (
        <p className="font-sans text-sm text-[var(--reader-muted)]">
          The cycle could not be laid out for this calendar. Try the calculated calendar on the
          calendar page.
        </p>
      ) : (
        groups.map(([book, rows]) => (
          <section key={book} className="mb-6">
            <h2 className="mb-2 font-sans text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]">
              {book}
            </h2>
            <ol className="space-y-2">
              {rows.map((p) => (
                <li key={p.index} id={`portion-${p.index}`} className={rowCls(p)}>
                  <div className="flex flex-wrap items-baseline justify-between gap-x-3 gap-y-1">
                    <div className="font-serif text-base font-semibold text-[var(--reader-text)]">
                      <span className="mr-2 font-sans text-xs font-normal text-[var(--reader-muted)]">
                        {p.index + 1}
                      </span>
                      {p.name}
                      {p.index === currentIndex && (
                        <span className="ml-2 rounded bg-[var(--reader-accent)] px-2 py-0.5 font-sans text-xs font-semibold text-[var(--reader-surface)]">
                          This week
                        </span>
                      )}
                    </div>
                    <div className="font-sans text-xs text-[var(--reader-muted)]">
                      {fmtSabbath.format(p.sabbathDate)}
                    </div>
                  </div>
                  <div className="mt-1 flex flex-col gap-0.5 font-sans text-sm">
                    <a href={readerHref(p.opening.book_id, p.opening.chapter)} className="underline">
                      {p.torahRef}
                    </a>
                    {p.haftarahOpening ? (
                      <a
                        href={readerHref(p.haftarahOpening.book_id, p.haftarahOpening.chapter)}
                        className="text-[var(--reader-muted)] underline"
                      >
                        Haftarah &middot; {p.haftarahRef}
                      </a>
                    ) : (
                      <span className="text-[var(--reader-muted)]">Haftarah &middot; {p.haftarahRef}</span>
                    )}
                  </div>
                  {p.index !== currentIndex && (
                    <button
                      type="button"
                      onClick={() => makeMine(p)}
                      className="mt-2 font-sans text-xs text-[var(--reader-accent)] underline"
                    >
                      This is my week
                    </button>
                  )}
                </li>
              ))}
            </ol>
          </section>
        ))
      )}

      <p className="mt-8 font-sans text-xs text-[var(--reader-muted)]">
        {reckoning === "rabbinic"
          ? "Dates follow the calculated (HebCal) cycle; combined weeks and festival Sabbaths are as that calendar sets them."
          : "Portion order from the annual cycle, one a week from the first Sabbath after your Simchat Torah under your elected reckoning."}
      </p>
    </main>
  );
}

const BTN =
  "rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 font-sans text-sm font-medium text-[var(--reader-text)] hover:opacity-90";
