/**
 * AlephBetSheet — S478. The whole aleph-bet, every form, one row per letter.
 *
 * Opened from the reader menu (Reference tools → "Aleph-bet, every form").
 * Free tier: it is a reference, and it is the thing that shows a first-time
 * reader what "restored" means. Each row: the pictograph (our tracing), paleo,
 * Samaritan, square (+ final), then name, sound, number value and what the
 * earliest sign drew. Tap any row → LetterCard with the full timeline.
 * Data: src/data/alephbet.json; drawings: src/assets/alephbet/*.svg.
 */

import { useState } from "react";
import ToolSheet from "./ToolSheet";
import LetterCard, { LETTERS, pictographSvg, type Letter } from "./LetterCard";

export default function AlephBetSheet({ onClose }: { onClose: () => void }) {
  const [letter, setLetter] = useState<Letter | null>(null);
  return (
    <>
      <ToolSheet title="Aleph-bet · every form" onClose={onClose}>
        <p className="text-sm text-[var(--reader-muted)]">
          The twenty-two letters, oldest form to newest: the picture each began as, the
          paleo-Hebrew of the first Temple, the Samaritan script that kept that line, and
          the square letters of the scrolls. Tap a letter for its whole story.
        </p>
        <div className="mt-3 overflow-x-auto">
          <table className="w-full border-collapse text-left">
            <thead>
              <tr className="font-sans text-[10px] uppercase tracking-wide text-[var(--reader-muted)]">
                <th className="px-2 py-1">#</th>
                <th className="px-2 py-1">Picture</th>
                <th className="px-2 py-1">Paleo</th>
                <th className="px-2 py-1">Samaritan</th>
                <th className="px-2 py-1">Square</th>
                <th className="px-2 py-1">Name</th>
                <th className="px-2 py-1">Sound</th>
                <th className="px-2 py-1">Value</th>
                <th className="px-2 py-1">The earliest sign drew</th>
              </tr>
            </thead>
            <tbody>
              {LETTERS.map((l) => {
                const svg = pictographSvg(l.forms.pictograph);
                return (
                  <tr
                    key={l.id}
                    onClick={() => setLetter(l)}
                    className="cursor-pointer border-t border-[var(--reader-rule)] hover:bg-[var(--reader-rule)]/30"
                    title={`${l.name} — every form`}
                  >
                    <td className="px-2 py-1 font-sans text-xs text-[var(--reader-muted)]">{l.order}</td>
                    <td className="px-2 py-1">
                      {svg && (
                        <span
                          className="inline-block h-9 w-9 text-[var(--reader-text)]"
                          aria-label={`${l.name} pictograph`}
                          dangerouslySetInnerHTML={{ __html: svg }}
                        />
                      )}
                    </td>
                    <td className="heb-paleo px-2 py-1 text-3xl leading-none text-[var(--reader-text)]">{l.forms.paleo}</td>
                    <td className="heb-samaritan px-2 py-1 text-3xl leading-none text-[var(--reader-text)]">{l.forms.samaritan}</td>
                    <td className="heb-square px-2 py-1 text-3xl leading-none text-[var(--reader-text)]">
                      {l.square}
                      {l.final && <span className="ml-2 text-2xl text-[var(--reader-muted)]">{l.final}</span>}
                    </td>
                    <td className="px-2 py-1 text-sm text-[var(--reader-text)]">
                      {l.name} <span className="heb-square text-[var(--reader-muted)]">{l.name_hebrew}</span>
                    </td>
                    <td className="px-2 py-1 font-sans text-xs text-[var(--reader-muted)]">{l.sound}</td>
                    <td className="px-2 py-1 font-sans text-xs text-[var(--reader-muted)]">{l.value}</td>
                    <td className="px-2 py-1 text-sm text-[var(--reader-text)]">{l.pictograph.join(" / ")}</td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
        <p className="mt-3 text-xs text-[var(--reader-muted)]">
          The vowel points were added to the text centuries after these letters were written; the letters are the
          text. Pictographs are our own line tracings of the published signs. Older inscriptional forms (Gezer,
          Moab, Siloam, Lachish, Elephantine), Rashi script and cursive are being added.
        </p>
      </ToolSheet>
      {letter && <LetterCard letter={letter} onClose={() => setLetter(null)} />}
    </>
  );
}
