import { useState, type ReactNode } from "react";
import sheets from "../data/psalm119-sheets.json";

/**
 * S493 — Psalm 119 acrostic sheets (Yoshi, Nov 6 2026). Two printable
 * PDFs sit at the end of Psalm 119, each behind a collapsible that shows
 * the first letter's verses so the reader sees what they are getting
 * before they download:
 *
 *   Hebrew beside English — the acrostic laid out side by side, the first
 *     letter of each Hebrew verse in bold, grouped under the 22 letters.
 *   English under each Hebrew word — the same verses with a word-for-word
 *     English gloss under every Hebrew word.
 *
 * Hebrew is the Leningrad text without vowel points; the English is this
 * app's own text; the word glosses are STEPBible's (CC BY).
 */
interface Word { h: string; g: string }
interface Verse { n: number; heb: string; en: string; words: Word[] }
interface Letter { name: string; letter: string; from: number; to: number }
const DATA = sheets as { letters: Letter[]; verses: Verse[] };
const PREVIEW = DATA.verses.slice(0, 4);
const ALEPH = DATA.letters[0];

function Panel({
  title,
  file,
  open,
  onToggle,
  children,
}: {
  title: string;
  file: string;
  open: boolean;
  onToggle: () => void;
  children: ReactNode;
}) {
  return (
    <div className="mt-3 rounded-lg border border-[var(--reader-rule)]">
      <button
        type="button"
        onClick={onToggle}
        className="flex w-full items-center justify-between px-4 py-3 text-left font-semibold"
        aria-expanded={open}
      >
        <span>{title}</span>
        <span aria-hidden="true">{open ? "▾" : "▸"}</span>
      </button>
      {open && (
        <div className="border-t border-[var(--reader-rule)] px-4 py-3">
          <div className="mb-2 text-sm opacity-70">
            <span className="mr-1 text-base">{ALEPH.letter}</span>
            {ALEPH.name} · verses {ALEPH.from}–{ALEPH.to} (the first of the 22 letters)
          </div>
          {children}
          <a
            href={`/download/${file}`}
            download
            className="mt-3 inline-block rounded-md border border-[var(--reader-rule)] px-4 py-2 text-sm font-semibold hover:bg-[var(--reader-rule)]"
          >
            Download the whole psalm (PDF)
          </a>
        </div>
      )}
    </div>
  );
}

export default function Psalm119Sheets({
  applyToEnglish,
}: {
  /** The reader's sacred-name mask + hide-English pipeline, applied to the English column. */
  applyToEnglish: (text: string) => string;
}) {
  const [open, setOpen] = useState<"side" | "under" | null>(null);
  return (
    <aside className="mt-6 rounded-xl border border-[var(--reader-rule)] border-t-4 bg-[var(--reader-surface)] px-5 py-5 shadow-lg text-[var(--reader-text)]">
      <h3 className="text-lg font-bold">Psalm 119 in Hebrew — printable sheets</h3>
      <p className="mt-1 text-sm opacity-80">
        This psalm is an acrostic: twenty-two sections of eight verses, and every verse in a section
        begins with that section's letter. Two sheets lay it out so you can see it, each with the
        letter shown in bold at the head of every verse.
      </p>

      <Panel
        title="Hebrew beside English"
        file="Psalm-119-Acrostic-Hebrew-English.pdf"
        open={open === "side"}
        onToggle={() => setOpen(open === "side" ? null : "side")}
      >
        <table className="w-full text-sm">
          <tbody>
            {PREVIEW.map((v) => (
              <tr key={v.n} className="border-b border-[var(--reader-rule)] align-top">
                <td className="w-6 py-1 pr-2 text-xs opacity-60">{v.n}</td>
                <td className="py-1 pr-3">{applyToEnglish(v.en)}</td>
                <td className="py-1 text-right text-base" dir="rtl" style={{ fontFamily: "'SBL Hebrew', serif" }}>
                  <b>{v.heb.slice(0, 1)}</b>
                  {v.heb.slice(1)}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </Panel>

      <Panel
        title="English under each Hebrew word"
        file="Psalm-119-Interlinear-Hebrew-English.pdf"
        open={open === "under"}
        onToggle={() => setOpen(open === "under" ? null : "under")}
      >
        {PREVIEW.map((v) => (
          <div key={v.n} className="mb-3 flex items-start">
            <span className="w-6 pt-1 text-xs opacity-60">{v.n}</span>
            <div className="flex flex-1 flex-wrap justify-start gap-x-3 gap-y-1" dir="rtl">
              {v.words.map((w, i) => (
                <span key={i} className="inline-block text-center">
                  <span className={`block text-base ${i === 0 ? "font-bold" : ""}`} style={{ fontFamily: "'SBL Hebrew', serif" }}>
                    {w.h}
                  </span>
                  <span className="block max-w-[6.5rem] text-[0.7rem] leading-tight opacity-75" dir="ltr">
                    {w.g}
                  </span>
                </span>
              ))}
            </div>
          </div>
        ))}
        <p className="text-xs opacity-60">The small English is a word-for-word gloss, not a translation; bracketed words are supplied.</p>
      </Panel>
    </aside>
  );
}
