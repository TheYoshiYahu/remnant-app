/**
 * KingdomEndCard — the chapter-end apparatus for The Kingdom (S205).
 *
 * Sits with the chapter-end Witness card: when a chapter carries
 * Kingdom members, this card lists every pairing cross-reference style
 * (the marked verse ↔ its source scriptures) and opens the full
 * come-and-see card inline on tap. The header explains the engine in
 * the reader's own terms — nothing in the new testament is new; every
 * teaching is found in the source it was taught from — without
 * sending the reader anywhere (come and see).
 *
 * Rides the Kingdom toggle, NOT hideCommentary — the proclamation
 * stands when study aids fold (same standing as WitnessEndCard).
 */

import { useState } from "react";
import KingdomCard, { KingdomQuoteGlyph } from "./KingdomCard";
import { citeClassForDisplayRef } from "./WitnessCard";
import type { KingdomEntry } from "../lib/api";
import { applyParentheticalsToggle } from "../lib/useParentheticalsToggle";
import {
  applySacredNameMask,
  type SacredNameMask,
} from "../lib/applySacredNameMask";

interface KingdomEndCardProps {
  entries: KingdomEntry[];
  hideParentheticals?: boolean;
  sacredNameMask?: SacredNameMask;
}

export default function KingdomEndCard({
  entries,
  hideParentheticals = false,
  sacredNameMask = "yahuah",
}: KingdomEndCardProps) {
  const [openVerseId, setOpenVerseId] = useState<number | null>(null);

  if (entries.length === 0) return null;

  const prefs = (text: string) =>
    applyParentheticalsToggle(
      applySacredNameMask(text, sacredNameMask),
      hideParentheticals
    );

  return (
    <section
      className="pill-card pill-card-kingdom mt-8"
      aria-label="The Kingdom in this chapter"
    >
      <div className="pill-card-eyebrow font-sans">
        <KingdomQuoteGlyph />
        <span className="kingdom-eyebrow-text">
          The Kingdom in this chapter
        </span>
      </div>
      <div className="pill-card-body">
        <p>
          {prefs(
            "Nothing in the new testament is new. Every teaching, every " +
              "act of the Messiah (Christ), every word of the good news " +
              "was declared from the beginning — spoken to Moses and the " +
              "prophets before it walked in Galilee. Each mark below pairs " +
              "what is said in this chapter with the place it was said " +
              "first. Open a row and both sides stand together, quoted in " +
              "full: the two sticks — the scriptures of old and the " +
              "apostolic witness — one in his hand."
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
                onClick={() => setOpenVerseId(open ? null : entry.verse_id)}
                className="flex w-full flex-wrap items-baseline gap-x-2 gap-y-1 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2 text-left hover:opacity-90"
              >
                <KingdomQuoteGlyph />
                <span className="font-sans text-xs font-semibold text-[var(--reader-text)]">
                  v. {entry.verse_number}
                </span>
                <span className="font-serif text-sm text-[var(--reader-text)]">
                  {prefs(entry.card_title)}
                </span>
                {entry.anchor_refs.length > 0 && (
                  <span className="font-sans text-xs text-[var(--reader-muted)]">
                    {"↔ "}
                    {entry.anchor_refs.map((ref, i) => (
                      <span key={ref}>
                        {i > 0 && " · "}
                        <span
                          className={citeClassForDisplayRef(ref) ?? undefined}
                        >
                          {ref}
                        </span>
                      </span>
                    ))}
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
                <KingdomCard
                  entry={entry}
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
