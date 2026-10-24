/**
 * PlanQuiz — S465. "Which plan is right for you" on the web /pricing page
 * ONLY (the phone apps never point to a purchase). Four questions about how
 * the reader studies, then an honest recommendation and a plain layout of
 * what each tier holds. Leans toward Companion only where the answers
 * actually reach both the commentary and the restored library.
 *
 * Tiers (Pricing.tsx TIERS, the live ship set): Study Notes / Library /
 * Companion. Scribe stays hidden.
 */
import { useState } from "react";

type TierKey = "study_notes" | "extras" | "complete_study";

type Option = { label: string; notes: number; library: number; deep: number };
type Question = { q: string; options: Option[] };

const QUESTIONS: Question[] = [
  {
    q: "When you sit down with the Scriptures, what do you most want?",
    options: [
      { label: "To understand the passage in front of me and see what answers it", notes: 2, library: 0, deep: 0 },
      { label: "To read the books that were cut from the library", notes: 0, library: 2, deep: 0 },
      { label: "Both — the canon and the restored library side by side", notes: 2, library: 2, deep: 1 },
      { label: "Mostly just to read and listen", notes: 0, library: 0, deep: 0 },
    ],
  },
  {
    q: "How often do you reach for 1 Enoch, Jubilees, Jasher or the Apocrypha?",
    options: [
      { label: "Often — they're part of how I study", notes: 0, library: 2, deep: 1 },
      { label: "Sometimes, when a passage points to them", notes: 0, library: 1, deep: 0 },
      { label: "Not yet, but I want to", notes: 0, library: 1, deep: 0 },
      { label: "Rarely or never", notes: 0, library: 0, deep: 0 },
    ],
  },
  {
    q: "How deep do you go in a chapter?",
    options: [
      { label: "I read it through", notes: 0, library: 0, deep: 0 },
      { label: "I stop and follow the cross-references", notes: 1, library: 0, deep: 0 },
      { label: "I follow every thread across canon and library until I see the whole picture", notes: 1, library: 1, deep: 2 },
      { label: "I dig into the Hebrew and Greek words", notes: 1, library: 0, deep: 2 },
    ],
  },
  {
    q: "Do you teach, lead a study, or explain the Scriptures to others?",
    options: [
      { label: "Yes, regularly", notes: 1, library: 0, deep: 1 },
      { label: "Sometimes, with family or friends", notes: 1, library: 0, deep: 0 },
      { label: "No, it's for my own walk", notes: 0, library: 0, deep: 0 },
    ],
  },
];

const RESULT: Record<TierKey, { name: string; why: string }> = {
  study_notes: {
    name: "Study Notes",
    why:
      "You want to understand the canon passage by passage and see the scriptures that answer it. Study Notes gives you the commentary and the cross-reference threads across the sixty-six books, at the lowest price.",
  },
  extras: {
    name: "Library",
    why:
      "Your heart is in the restored library — the books the Reformation cut. Library opens all of them with the names restored, tied into the canon by cross-references.",
  },
  complete_study: {
    name: "Companion",
    why:
      "You study both the canon and the restored library and you follow the threads between them. Companion holds everything in Study Notes and Library together, plus commentary on the restored library itself, the thread callouts that show how canon and library answer each other, and the full Hebrew and Greek lexicons.",
  },
};

const WHATS_IN: { name: string; lines: string[] }[] = [
  { name: "Free", lines: ["The whole canon with the names restored", "Study notes on the four Gospels", "Bookmarks, notes, highlights, search, offline reading"] },
  { name: "Study Notes", lines: ["Commentary across the canon, growing chapter by chapter", "Cross-reference threads on every chapter", "Natural recorded voices, suggestion box and voting"] },
  { name: "Library", lines: ["1 Enoch, Jubilees, Jasher, the Apocrypha and the rest of the restored library", "Natural recorded voices, suggestion box and voting"] },
  { name: "Companion", lines: ["Everything in Study Notes and Library", "Commentary on the restored library", "Thread callouts across canon and library", "Brown-Driver-Briggs, Thayer's and Gesenius lexicons"] },
];

function recommend(picks: Option[]): TierKey {
  const n = picks.reduce((a, o) => a + o.notes, 0);
  const l = picks.reduce((a, o) => a + o.library, 0);
  const d = picks.reduce((a, o) => a + o.deep, 0);
  if ((n >= 1 && l >= 1) || d >= 3) return "complete_study";
  if (l > n) return "extras";
  return "study_notes";
}

export default function PlanQuiz() {
  const [open, setOpen] = useState(false);
  const [answers, setAnswers] = useState<(number | null)[]>(QUESTIONS.map(() => null));
  const done = answers.every((a) => a !== null);
  const result = done ? recommend(answers.map((a, i) => QUESTIONS[i].options[a as number])) : null;

  return (
    <section className="mb-8 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4">
      <div className="flex flex-wrap items-center justify-between gap-2">
        <h2 className="text-lg font-semibold text-[var(--reader-text)]">Which plan is right for you?</h2>
        <button
          type="button"
          onClick={() => setOpen((v) => !v)}
          className="rounded border border-[var(--reader-accent)] px-3 py-1 font-sans text-sm text-[var(--reader-text)]"
        >
          {open ? "Close" : "Take the four-question quiz"}
        </button>
      </div>

      {open && (
        <div className="mt-4 space-y-5">
          {QUESTIONS.map((qq, qi) => (
            <fieldset key={qi}>
              <legend className="font-sans text-sm font-medium text-[var(--reader-text)]">
                {qi + 1}. {qq.q}
              </legend>
              <div className="mt-2 flex flex-col gap-2">
                {qq.options.map((o, oi) => (
                  <button
                    key={oi}
                    type="button"
                    aria-pressed={answers[qi] === oi}
                    onClick={() => setAnswers((prev) => prev.map((p, i) => (i === qi ? oi : p)))}
                    className={
                      "rounded border px-3 py-2 text-left font-sans text-sm " +
                      (answers[qi] === oi
                        ? "border-[var(--reader-accent)] bg-[var(--reader-accent)] text-[var(--reader-bg)]"
                        : "border-[var(--reader-rule)] text-[var(--reader-text)]")
                    }
                  >
                    {o.label}
                  </button>
                ))}
              </div>
            </fieldset>
          ))}

          {result && (
            <div className="rounded border border-[var(--reader-accent)] px-4 py-3">
              <p className="font-sans text-xs uppercase tracking-wider text-[var(--reader-muted)]">Your fit</p>
              <p className="mt-1 text-xl font-semibold text-[var(--reader-text)]">{RESULT[result].name}</p>
              <p className="mt-1 text-sm text-[var(--reader-text)]">{RESULT[result].why}</p>
              {result !== "complete_study" && (
                <p className="mt-2 text-sm text-[var(--reader-muted)]">
                  If you think you'll want both the commentary and the restored
                  library before long, Companion holds them together in one plan,
                  with the library commentary, thread callouts and lexicons that
                  neither of the others carries.
                </p>
              )}
              <p className="mt-2 text-sm text-[var(--reader-muted)]">
                You can start any tier with the seven-day trial, no card needed,
                and move up in place later.
              </p>
            </div>
          )}

          <div>
            <p className="font-sans text-sm font-medium text-[var(--reader-text)]">What each plan holds</p>
            <div className="mt-2 grid grid-cols-1 gap-3 sm:grid-cols-2">
              {WHATS_IN.map((t) => (
                <div
                  key={t.name}
                  className={
                    "rounded border px-3 py-2 " +
                    (result && RESULT[result].name === t.name
                      ? "border-[var(--reader-accent)]"
                      : "border-[var(--reader-rule)]")
                  }
                >
                  <p className="font-sans text-sm font-semibold text-[var(--reader-text)]">{t.name}</p>
                  <ul className="mt-1 list-disc pl-5 text-sm text-[var(--reader-text)]">
                    {t.lines.map((l) => <li key={l}>{l}</li>)}
                  </ul>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}
    </section>
  );
}
