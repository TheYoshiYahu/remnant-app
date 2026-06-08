import { useEffect, useMemo, useState } from "react";
import chronologicalPlan from "../data/chronological-reading.json";

/*
  S211 — Arranged Reading overlay (the chronological apparatus).

  A SEPARATE reading sequence laid on top of the canonical order — it does
  NOT change how books are ordered anywhere else. It reads the static
  chronological-reading.json (chapter-level, books interleaved in event
  order) and drives the app's existing chapter loader via onNavigate, so no
  schema or API change is needed for v1.

  The "extra-canonical" toggle filters the woven extras (Enoch, Jubilees,
  Jasher, the Apocrypha, etc.) in or out, leaving a clean canon-only
  chronological read when off (default). Position persists so the reader can
  resume where they left off.

  The ordering itself (chronological-reading.json) is a draft pending Yoshi's
  redline; the UI reads the file, so redlines to the order need no UI change.
*/

interface PlanEntry {
  seq: number;
  era: string;
  edition_id: string;
  book_id: string;
  book_title: string;
  chapter: number;
  source: "canon" | "extra";
}

const ENTRIES = (chronologicalPlan as { entries: PlanEntry[] }).entries;
const EXTRAS_KEY = "rop_arranged_extras_v1";
const POS_KEY = "rop_arranged_pos_v1";

function readBool(key: string): boolean {
  try {
    return typeof window !== "undefined" && window.localStorage.getItem(key) === "1";
  } catch {
    return false;
  }
}

interface Props {
  currentSlug: string;
  currentChapter: number;
  onNavigate: (slug: string, chapter: number) => void;
}

export default function ArrangedReading({
  currentSlug,
  currentChapter,
  onNavigate,
}: Props) {
  const [includeExtras, setIncludeExtras] = useState<boolean>(() =>
    readBool(EXTRAS_KEY)
  );

  // The active sequence: canon-only (default) or canon + woven extras.
  const seq = useMemo(
    () =>
      includeExtras ? ENTRIES : ENTRIES.filter((e) => e.source === "canon"),
    [includeExtras]
  );

  // Where the currently-open chapter sits in the active sequence (-1 if the
  // open chapter is an extra while extras are toggled off, etc.).
  const currentIdx = useMemo(
    () =>
      seq.findIndex(
        (e) => e.book_id === currentSlug && e.chapter === currentChapter
      ),
    [seq, currentSlug, currentChapter]
  );

  // Remember the last in-sequence position so "Resume" can return to it.
  useEffect(() => {
    if (currentIdx >= 0) {
      try {
        window.localStorage.setItem(POS_KEY, String(seq[currentIdx].seq));
      } catch {
        /* ignore */
      }
    }
  }, [currentIdx, seq]);

  const toggleExtras = () => {
    setIncludeExtras((v) => {
      const next = !v;
      try {
        window.localStorage.setItem(EXTRAS_KEY, next ? "1" : "0");
      } catch {
        /* ignore */
      }
      return next;
    });
  };

  const go = (idx: number) => {
    if (idx < 0 || idx >= seq.length) return;
    const e = seq[idx];
    onNavigate(e.book_id, e.chapter);
  };

  const resume = () => {
    let saved = 0;
    try {
      saved = Number(window.localStorage.getItem(POS_KEY) || "0");
    } catch {
      /* ignore */
    }
    let idx = seq.findIndex((e) => e.seq === saved);
    if (idx < 0) idx = 0;
    go(idx);
  };

  // First entry of each act, for the jump menu.
  const acts = useMemo(() => {
    const out: { era: string; idx: number }[] = [];
    seq.forEach((e, i) => {
      if (!out.length || out[out.length - 1].era !== e.era) {
        out.push({ era: e.era, idx: i });
      }
    });
    return out;
  }, [seq]);

  const atSeq = currentIdx >= 0;
  const total = seq.length;
  const pct = atSeq ? Math.round(((currentIdx + 1) / total) * 100) : 0;
  const here = atSeq ? seq[currentIdx] : null;

  const pillBtn =
    "rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-sm font-medium text-[var(--reader-text)] hover:opacity-90 disabled:opacity-30";

  return (
    <div className="mt-3 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4">
      <div className="flex flex-wrap items-center justify-between gap-2">
        <div>
          <div className="font-sans text-sm font-semibold text-[var(--reader-accent)]">
            Arranged reading
          </div>
          <div className="font-sans text-xs text-[var(--reader-muted)]">
            the whole library, in order of event
          </div>
        </div>
        <button
          type="button"
          onClick={toggleExtras}
          aria-pressed={includeExtras}
          title="Weave the extra-canonical books (Enoch, Jubilees, Jasher, the Apocrypha, and more) into the reading, or read the canon only."
          className={pillBtn}
        >
          {includeExtras ? "With extras (woven)" : "Canon only"}
        </button>
      </div>

      {atSeq && here ? (
        <div className="mt-3">
          <div className="font-sans text-xs text-[var(--reader-muted)]">
            {here.era}
          </div>
          <div className="mt-0.5 font-sans text-sm text-[var(--reader-text)]">
            {here.book_title} {here.chapter}
            <span className="text-[var(--reader-muted)]">
              {" "}
              · {currentIdx + 1} of {total} · {pct}%
            </span>
          </div>
          <div className="mt-2 h-1 w-full overflow-hidden rounded bg-[var(--reader-rule)]">
            <div
              className="h-full bg-[var(--reader-accent)]"
              style={{ width: `${pct}%` }}
            />
          </div>
        </div>
      ) : (
        <div className="mt-3 font-sans text-sm text-[var(--reader-muted)]">
          You're outside the arranged sequence. Resume where you left off, or
          jump to an act below.
        </div>
      )}

      <div className="mt-3 flex flex-wrap items-center gap-2">
        <button
          type="button"
          onClick={() => go(currentIdx - 1)}
          disabled={!atSeq || currentIdx <= 0}
          className={pillBtn}
        >
          ← Previous
        </button>
        <button
          type="button"
          onClick={() => go(currentIdx + 1)}
          disabled={!atSeq || currentIdx >= total - 1}
          className={pillBtn}
        >
          Next →
        </button>
        <button type="button" onClick={resume} className={pillBtn}>
          Resume
        </button>
        <label className="ml-auto flex items-center gap-2 font-sans text-xs text-[var(--reader-muted)]">
          <span>Jump to</span>
          <select
            value=""
            onChange={(e) => {
              const i = Number(e.target.value);
              if (!Number.isNaN(i) && e.target.value !== "") go(i);
            }}
            className="max-w-[14rem] rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-[var(--reader-text)]"
          >
            <option value="">an act…</option>
            {acts.map((a) => (
              <option key={a.idx} value={a.idx}>
                {a.era}
              </option>
            ))}
          </select>
        </label>
      </div>
    </div>
  );
}
