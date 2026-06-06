/**
 * WitnessEndCard — the chapter-end apparatus for The Witness (S204b).
 *
 * Sits with the chapter-end cross-reference card: when a chapter
 * carries Witness members, this card lists every pairing
 * cross-reference style (the marked verse ↔ its Tanakh anchors) and
 * opens the full come-and-see card inline on tap. The header explains
 * the engine in the reader's own terms — why these verses show that
 * the one who walked Galilee is the one who spoke to Moses and the
 * prophets — without sending the reader anywhere (come and see).
 *
 * Pill-generic like WitnessCard: the Kingdom (blue pill) reuses the
 * same shape with its own register at its session.
 */

import { useState } from "react";
import WitnessCard from "./WitnessCard";
import type { WitnessEntry } from "../lib/api";
import { applyParentheticalsToggle } from "../lib/useParentheticalsToggle";
import {
  applySacredNameMask,
  type SacredNameMask,
} from "../lib/applySacredNameMask";

interface WitnessEndCardProps {
  entries: WitnessEntry[];
  hideParentheticals?: boolean;
  sacredNameMask?: SacredNameMask;
}

export default function WitnessEndCard({
  entries,
  hideParentheticals = false,
  sacredNameMask = "yahuah",
}: WitnessEndCardProps) {
  const [openVerseId, setOpenVerseId] = useState<number | null>(null);

  if (entries.length === 0) return null;

  const prefs = (text: string) =>
    applyParentheticalsToggle(
      applySacredNameMask(text, sacredNameMask),
      hideParentheticals
    );

  return (
    <section className="pill-card pill-card-witness mt-8" aria-label="The Witness in this chapter">
      <div className="pill-card-eyebrow font-sans">
        <span aria-hidden="true">◉</span>
        <span>The Witness in this chapter</span>
      </div>
      <div className="pill-card-body">
        <p>
          {prefs(
            "Red-letter editions mark where the Messiah (Christ) speaks. These marks " +
              "run the other way: each one is a verse where he — or the " +
              "scriptures speaking of him — claims a title, an act, or an " +
              "argument that the Tanakh gives to Yahuah (God) alone, or " +
              "that Yahuah (God) said he himself would do. Open each claim " +
              "and its anchor stands beside it, both quoted in full: the " +
              "one who walked Galilee is the one who spoke to Moses and " +
              "the prophets."
          )}
        </p>
      </div>
      <ul className="mt-3 space-y-2">
        {entries.map((entry) => {
          const open = openVerseId === entry.verse_id;
          return (
            <li key={entry.verse_id}>
              <button
                type="button"
                aria-expanded={open}
                onClick={() =>
                  setOpenVerseId(open ? null : entry.verse_id)
                }
                className="flex w-full flex-wrap items-baseline gap-x-2 gap-y-1 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2 text-left hover:opacity-90"
              >
                <span
                  className="pill-mark-witness !mr-0"
                  aria-hidden="true"
                />
                <span className="font-sans text-xs font-semibold text-[var(--reader-text)]">
                  v. {entry.verse_number}
                </span>
                <span className="font-serif text-sm text-[var(--reader-text)]">
                  {prefs(entry.card_title)}
                </span>
                {entry.anchor_refs.length > 0 && (
                  <span className="font-sans text-xs text-[var(--reader-muted)]">
                    ↔ {entry.anchor_refs.join(" · ")}
                  </span>
                )}
                <span
                  className="ml-auto font-sans text-xs text-[var(--reader-muted)]"
                  aria-hidden="true"
                >
                  {open ? "▴" : "▾"}
                </span>
              </button>
              {open && (
                <WitnessCard
                  entry={entry}
                  register="witness"
                  hideParentheticals={hideParentheticals}
                  sacredNameMask={sacredNameMask}
                  onClose={() => setOpenVerseId(null)}
                />
              )}
            </li>
          );
        })}
      </ul>
    </section>
  );
}
