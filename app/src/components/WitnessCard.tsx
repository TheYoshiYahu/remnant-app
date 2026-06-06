/**
 * WitnessCard — the come-and-see tap-card for a Witness-marked verse
 * (Session 204; working title: the Red Pill).
 *
 * Red-letter editions mark where the Messiah speaks; the Witness marks
 * where he — or anyone speaking of him — claims to be Yahuah, plus
 * every verse only possible if he is the one who spoke to Moses and
 * the prophets. The card unfolds the claim come-and-see: both sides
 * quoted in full, stand-alone italics, citation at the end, the
 * connective prose minimal so the verses do the work and the reader
 * watches the canon read itself.
 *
 * PILL-GENERIC by design (Yoshi, S204: "we need a special blue pill
 * for what we will do next — the kingdom"). The component takes a
 * `register` prop; "witness" is the dedicated witness-red register
 * (proof Option B, signed off S204). The Kingdom's blue register
 * lands at its own session with its own A/B proof — add a register
 * key here, define the CSS variables in index.css, and the surface
 * carries it with no structural change.
 *
 * S204b (Yoshi): the card surface is the solid reader surface (black
 * on the dark theme) and every scripture citation renders in its
 * source-class register color — tanakh → emerald, nt → gold, extras →
 * argaman — the same vocabulary as the S130 cross-reference target
 * pills and the S172 book-heading pills.
 *
 * Rendering: card_md paragraphs flow through the shared italic-span
 * helper plus a trailing-citation colorizer, after the sacred-name
 * mask + parentheticals toggle so the card respects the partner's
 * display preferences exactly like the chapter-end apparatus does.
 */

import type { ReactNode } from "react";
import { renderItalicSpans } from "../lib/markdown";
import { classifyBookSlug } from "../lib/book-source-class";
import type { WitnessEntry } from "../lib/api";
import { applyParentheticalsToggle } from "../lib/useParentheticalsToggle";
import {
  applySacredNameMask,
  type SacredNameMask,
} from "../lib/applySacredNameMask";

export type PillRegister = "witness"; // "kingdom" joins at the Blue Pill session

/**
 * Map a display citation ref ("Mark 2:5-7", "Psalm 23:1", "Jude 5",
 * "1 Corinthians 12:3") to its source-class citation color CSS class.
 * Returns null when the text does not parse as a scripture ref.
 */
export function citeClassForDisplayRef(ref: string): string | null {
  const m = /^((?:[1-3]\s+)?[A-Za-z'’ ]+?)\s+\d/.exec(ref.trim());
  if (!m) return null;
  let slug = m[1].trim().toLowerCase().replace(/\s+/g, "-");
  if (slug === "psalm") slug = "psalms";
  return `witness-cite-${classifyBookSlug(slug)}`;
}

/**
 * Render one card_md paragraph: italic spans throughout, and when the
 * paragraph ends with a "(Ref)" scripture citation, the citation
 * (parentheses included) renders in its source-class register color.
 */
function renderCardParagraph(block: string): ReactNode {
  const m = /^([\s\S]*?)\(([^()]+)\)\s*$/.exec(block);
  if (m) {
    const citeClass = citeClassForDisplayRef(m[2]);
    if (citeClass) {
      return (
        <>
          {renderItalicSpans(m[1])}
          <span className={citeClass}>({m[2]})</span>
        </>
      );
    }
  }
  return <>{renderItalicSpans(block)}</>;
}

interface WitnessCardProps {
  entry: WitnessEntry;
  register?: PillRegister;
  hideParentheticals?: boolean;
  sacredNameMask?: SacredNameMask;
  onClose: () => void;
}

export default function WitnessCard({
  entry,
  register = "witness",
  hideParentheticals = false,
  sacredNameMask = "yahuah",
  onClose,
}: WitnessCardProps) {
  const body = applyParentheticalsToggle(
    applySacredNameMask(entry.card_md, sacredNameMask),
    hideParentheticals
  );
  const title = applyParentheticalsToggle(
    applySacredNameMask(entry.card_title, sacredNameMask),
    hideParentheticals
  );

  return (
    <div className={`pill-card pill-card-${register} my-4`} role="note">
      <div className="pill-card-eyebrow font-sans">
        <span className="pill-mark-witness !mr-0" aria-hidden="true" />
        <span>The Witness</span>
        <span className="pill-card-class-tag">{entry.class_label}</span>
        <button
          type="button"
          onClick={onClose}
          aria-label="Close card"
          className="pill-card-close font-sans"
        >
          ✕
        </button>
      </div>
      <h4 className="pill-card-title">{title}</h4>
      <div className="pill-card-body">
        {body
          .trim()
          .split(/\n{2,}/)
          .map((block, i) => (
            <p key={i} className={i > 0 ? "mt-3" : ""}>
              {renderCardParagraph(block)}
            </p>
          ))}
      </div>
    </div>
  );
}
