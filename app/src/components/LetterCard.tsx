/**
 * LetterCard — S478 Aleph-bet. One letter, every form of it.
 *
 * Opened from the Aleph-bet chart (AlephBetSheet) and from the consonant list
 * under "Remove the vowel additions?" (VowelsLens). Shows the letter large in
 * square script, its name, sound and number value, what the earliest sign drew
 * and what that came to mean, then the forms side by side oldest → newest:
 * pictograph (our SVG) · paleo (Phoenician block) · Samaritan · square ·
 * Rashi · cursive. The older inscriptional stages (early paleo, late paleo,
 * Aramaic/Elephantine) are drawn as SVG in S479 and appear here automatically
 * once `older.*` carries a path.
 *
 * Data: src/data/alephbet.json (static; no API).
 */

import { useState } from "react";
import ToolSheet from "./ToolSheet";
import letters from "../data/alephbet.json";

export interface Letter {
  id: string;
  order: number;
  square: string;
  final: string | null;
  name: string;
  name_hebrew: string;
  sound: string;
  value: number;
  pictograph: string[];
  meaning: string;
  forms: {
    pictograph: string;
    paleo: string;
    samaritan: string;
    square: string;
    square_final: string | null;
    rashi: string;
    cursive: string;
  };
  older: {
    early_paleo: string | null;
    late_paleo: string | null;
    aramaic_elephantine: string | null;
  };
}

export const LETTERS = letters as Letter[];
const BY_SQUARE = new Map<string, Letter>();
for (const l of LETTERS) {
  BY_SQUARE.set(l.square, l);
  if (l.final) BY_SQUARE.set(l.final, l);
}
/** The letter record for one square-script character (final forms included); null for anything else (points, maqaf…). */
export function letterFor(ch: string): Letter | null {
  return BY_SQUARE.get(ch) ?? null;
}

/** One form in the timeline strip. `glyph` is text in a script font; `src` is an SVG we drew. */
function Form({
  label,
  period,
  glyph,
  className,
  src,
}: {
  label: string;
  period: string;
  glyph?: string | null;
  className?: string;
  src?: string | null;
}) {
  // S478: a form whose drawing is not on disk yet (the pictograph SVGs land in S479) simply does not show.
  const [missing, setMissing] = useState(false);
  if (missing) return null;
  return (
    <div className="flex min-w-[5.5rem] flex-col items-center rounded-md border border-[var(--reader-rule)] px-2 py-2">
      <div className="flex h-16 items-center justify-center">
        {src ? (
          <img src={src} alt={label} className="h-14 w-14 object-contain" onError={() => setMissing(true)} />
        ) : (
          <span className={`text-5xl leading-none ${className ?? ""}`}>{glyph}</span>
        )}
      </div>
      <div className="mt-1 text-center font-sans text-xs font-semibold text-[var(--reader-text)]">{label}</div>
      <div className="text-center font-sans text-[10px] text-[var(--reader-muted)]">{period}</div>
    </div>
  );
}

interface Props {
  letter: Letter;
  onClose: () => void;
}

export default function LetterCard({ letter: l, onClose }: Props) {
  const picto = l.pictograph.join(" / ");
  return (
    <ToolSheet title={`Aleph-bet · ${l.name}`} onClose={onClose}>
      <div className="flex flex-wrap items-start gap-6">
        <div className="heb-square text-8xl leading-none text-[var(--reader-text)]">
          {l.square}
          {l.final && (
            <span className="ml-3 text-6xl text-[var(--reader-muted)]" title="final form (end of a word)">
              {l.final}
            </span>
          )}
        </div>
        <div className="min-w-[14rem] flex-1">
          <p className="text-2xl text-[var(--reader-text)]">
            {l.name} <span className="heb-square text-xl text-[var(--reader-muted)]">{l.name_hebrew}</span>
          </p>
          <p className="mt-1 text-sm text-[var(--reader-muted)]">
            Letter {l.order} of 22 · sound: {l.sound} · number value {l.value}
            {l.final && " · takes a different shape at the end of a word"}
          </p>
          <p className="mt-3 text-base text-[var(--reader-text)]">
            The earliest sign drew {picto.includes(" / ") ? "a " + picto.replace(" / ", " — or, as some read it, a ") : "a " + picto}.
          </p>
          <p className="mt-1 text-base text-[var(--reader-text)]">
            From that picture the letter came to carry: {l.meaning}.
          </p>
        </div>
      </div>

      <p className="mt-6 font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
        Every form, oldest to newest
      </p>
      <div className="mt-2 flex flex-wrap gap-2">
        <Form label="Pictograph" period="proto-Sinaitic, before 1500 BC" src={l.forms.pictograph} />
        {l.older.early_paleo && <Form label="Early paleo" period="Gezer · Moab, 10th–9th c. BC" src={l.older.early_paleo} />}
        <Form label="Paleo-Hebrew" period="the first Temple's script" glyph={l.forms.paleo} className="heb-paleo" />
        {l.older.late_paleo && <Form label="Late paleo" period="Siloam · Lachish, 8th–6th c. BC" src={l.older.late_paleo} />}
        {l.older.aramaic_elephantine && (
          <Form label="Aramaic" period="Elephantine, 5th c. BC" src={l.older.aramaic_elephantine} />
        )}
        <Form label="Samaritan" period="the paleo line, kept to this day" glyph={l.forms.samaritan} className="heb-samaritan" />
        <Form label="Square" period="after the exile · the scrolls" glyph={l.forms.square} className="heb-square" />
        {l.forms.square_final && (
          <Form label="Square, final" period="at the end of a word" glyph={l.forms.square_final} className="heb-square" />
        )}
      </div>
      <p className="mt-3 text-xs text-[var(--reader-muted)]">
        Rashi script and modern cursive are drawn in a later pass; the pictograph is our own tracing of the published sign.
      </p>
    </ToolSheet>
  );
}
