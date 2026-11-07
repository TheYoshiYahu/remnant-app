/**
 * Psalm119.tsx — the Psalm 119 acrostic page. Lives at `/psalm-119`, reached
 * from the Teachings list. S493 (Yoshi, Nov 6 2026): "a full page thing …
 * viewable for free, download for paid tier only."
 *
 * Two views of the whole psalm, every one of the 176 verses on the page for
 * everyone:
 *   Side by side — the Hebrew (Leningrad text, no vowel points) beside this
 *     app's English, grouped under the 22 letters, the opening letter of each
 *     Hebrew verse in bold so the acrostic shows.
 *   Word by word — the same Hebrew with a word-for-word English gloss under
 *     each word (STEPBible TAHOT, CC BY).
 * The printable PDFs of both views download for any paid tier; free readers
 * see the LockedPartnerPrompt in their place (informational only, no checkout
 * link — the consumption-only posture the Teachings pages already keep).
 *
 * Navigation matches the rest of the app: plain <a href> doorways.
 */

import { useEffect, useMemo, useState } from "react";
import sheets from "../data/psalm119-sheets.json";
import LockedPartnerPrompt from "../components/LockedPartnerPrompt";
import { effectiveTier } from "../lib/teachings/content";
import { loadStoredNativeToken } from "../lib/native-auth";
import { useParentheticalsToggle } from "../lib/useParentheticalsToggle";
import { useSacredNameMask } from "../lib/useSacredNameMask";
import {
  getSubscriptionMe,
  type PartnerTier,
  type SubscriptionStatus,
} from "../lib/api";

interface Word { h: string; g: string }
interface Verse { n: number; heb: string; en: string; words: Word[] }
interface Letter { name: string; letter: string; from: number; to: number }
const DATA = sheets as { letters: Letter[]; verses: Verse[] };
const HEB: React.CSSProperties = { fontFamily: "'SBL Hebrew', serif" };

type View = "side" | "word";

export default function Psalm119() {
  const [view, setView] = useState<View>("side");
  const parens = useParentheticalsToggle();
  const mask = useSacredNameMask();
  const en = (t: string) => parens.applyToText(mask.applyToText(t));

  // Entitlement for the download buttons — same resolve the Teachings detail
  // page does (native token first, then /me; anything that fails → free).
  const [tier, setTier] = useState<PartnerTier | null>(null);
  const [status, setStatus] = useState<SubscriptionStatus>("none");
  const [periodEnd, setPeriodEnd] = useState<string | null>(null);
  const [meChecked, setMeChecked] = useState(false);
  useEffect(() => {
    let cancelled = false;
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      getSubscriptionMe()
        .then((me) => {
          if (cancelled) return;
          setTier(me.tier ?? "free");
          setStatus(me.status);
          setPeriodEnd(me.current_period_end ?? null);
          setMeChecked(true);
        })
        .catch(() => {
          if (cancelled) return;
          setTier("free");
          setStatus("none");
          setMeChecked(true);
        });
    });
    return () => {
      cancelled = true;
    };
  }, []);
  const paid = meChecked && effectiveTier(tier, status, periodEnd) !== "free";

  const byLetter = useMemo(
    () => DATA.letters.map((l) => ({ ...l, verses: DATA.verses.slice(l.from - 1, l.to) })),
    [],
  );

  const pdf =
    view === "side"
      ? "Psalm-119-Acrostic-Hebrew-English.pdf"
      : "Psalm-119-Interlinear-Hebrew-English.pdf";

  return (
    <div className="min-h-screen bg-[var(--reader-bg)] px-4 py-8 text-[var(--reader-text)]">
      <div className="mx-auto max-w-3xl">
        <a href="/teachings" className="text-sm text-[var(--reader-accent)] hover:underline">
          ← Back to Teachings
        </a>
        <h1 className="mt-4 font-serif text-2xl font-semibold">Psalm 119 — the acrostic</h1>
        <p className="mt-2 text-sm leading-relaxed text-[var(--reader-muted)]">
          Psalm 119 is written to the Hebrew alphabet: twenty-two sections of eight verses, and
          every verse in a section begins with that section's letter. The English hides it; the
          Hebrew shows it. Here is the whole psalm with the opening letter of every verse in bold.
          Hebrew reads right to left.
        </p>

        <div className="mt-5 flex gap-2" role="tablist">
          {([
            ["side", "Hebrew beside English"],
            ["word", "English under each word"],
          ] as [View, string][]).map(([v, label]) => (
            <button
              key={v}
              type="button"
              role="tab"
              aria-selected={view === v}
              onClick={() => setView(v)}
              className={`rounded-md border px-3 py-1.5 text-sm ${
                view === v
                  ? "border-[var(--reader-accent)] font-semibold"
                  : "border-[var(--reader-rule)] text-[var(--reader-muted)]"
              }`}
            >
              {label}
            </button>
          ))}
        </div>

        <div className="mt-4">
          {paid ? (
            <a
              href={`/download/${pdf}`}
              download
              className="inline-block rounded-md border border-[var(--reader-accent)] px-4 py-2 text-sm font-semibold"
            >
              Download this view as a printable PDF
            </a>
          ) : meChecked ? (
            <LockedPartnerPrompt
              tone="inline"
              title="The printable PDF is for partners"
              message="The whole psalm stays on this page for everyone. The printable PDF of each view opens on any partnership. Partnership is chosen and managed from your account on the web at remnantofpromise.org."
            />
          ) : null}
        </div>

        {view === "word" && (
          <p className="mt-4 text-xs text-[var(--reader-muted)]">
            The small English under each word is a word-for-word gloss, not a translation; words in
            brackets are supplied.
          </p>
        )}

        {byLetter.map((l) => (
          <section key={l.letter} className="mt-8">
            <h2 className="flex items-baseline justify-between border-b border-[var(--reader-rule)] pb-1 font-serif text-lg font-semibold">
              <span>
                <span className="mr-2 text-2xl" style={HEB}>{l.letter}</span>
                {l.name}
              </span>
              <span className="text-xs font-normal text-[var(--reader-muted)]">
                verses {l.from}–{l.to}
              </span>
            </h2>

            {view === "side" ? (
              <table className="mt-2 w-full text-sm">
                <tbody>
                  {l.verses.map((v) => (
                    <tr key={v.n} className="border-b border-[var(--reader-rule)] align-top">
                      <td className="w-7 py-2 pr-2 text-xs text-[var(--reader-muted)]">{v.n}</td>
                      <td className="py-2 pr-3 leading-relaxed">{en(v.en)}</td>
                      <td className="py-2 text-right text-lg leading-relaxed" dir="rtl" style={HEB}>
                        <b>{v.heb.slice(0, 1)}</b>
                        {v.heb.slice(1)}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            ) : (
              <div className="mt-2">
                {l.verses.map((v) => (
                  <div key={v.n} className="flex items-start border-b border-[var(--reader-rule)] py-2">
                    <span className="w-7 pt-1 text-xs text-[var(--reader-muted)]">{v.n}</span>
                    <div className="flex flex-1 flex-wrap justify-start gap-x-4 gap-y-2" dir="rtl">
                      {v.words.map((w, i) => (
                        <span key={i} className="inline-block text-center">
                          <span className={`block text-lg ${i === 0 ? "font-bold" : ""}`} style={HEB}>
                            {w.h}
                          </span>
                          <span className="block max-w-[7rem] text-[0.7rem] leading-tight text-[var(--reader-muted)]" dir="ltr">
                            {w.g}
                          </span>
                        </span>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            )}
          </section>
        ))}
      </div>
    </div>
  );
}
