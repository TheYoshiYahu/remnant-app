/**
 * KingdomCard — the come-and-see tap-card for a Kingdom-marked verse
 * (Session 205; working title: the Blue Pill).
 *
 * The companion overlay to the Witness. The Witness marks where the
 * Messiah claims the Tanakh's "I"; the Kingdom marks the proclamation
 * itself: every new-testament mention of what he did, what the good
 * news is, what the kingdom is, what grace is — paired with the
 * scripture it was taught from. Nothing in the new testament is new;
 * every beginning declared the end. The card unfolds the pairing
 * come-and-see: both sides quoted in full, stand-alone italics,
 * citation at the end, the connective prose minimal so the verses do
 * the work and the reader watches the canon read itself.
 *
 * Register: the two sticks of Ezekiel 37:15-22 — the existing
 * metallic emerald + metallic gold joined (tanakh + nt source
 * classes, "uniting the old and new testament" — Yoshi). Rides the
 * pill-generic chassis the Witness shipped (S204): same .pill-card
 * family, solid reader surface inside, register in border + eyebrow
 * only. No dot glyphs anywhere on Kingdom surfaces (Yoshi, S205).
 *
 * Citation colorizing is shared with the Witness card
 * (citeClassForDisplayRef) — tanakh → emerald, nt → gold, extras →
 * argaman — so the Kingdom's two-tone register and the cite colors
 * speak the same vocabulary.
 */

import type { ReactNode } from "react";
import { renderItalicSpans } from "../lib/markdown";
import { citeClassForDisplayRef } from "./WitnessCard";
import type { KingdomEntry } from "../lib/api";
import { applyParentheticalsToggle } from "../lib/useParentheticalsToggle";
import {
  applySacredNameMask,
  type SacredNameMask,
} from "../lib/applySacredNameMask";

/**
 * The Kingdom's family glyph: the double quotation mark built from two
 * single quote glyphs — emerald outside, gold inside (proof v3,
 * Yoshi sign-off). Used in the eyebrow and the end-card rows; the
 * in-verse mark in App.tsx renders the same pair around the verse.
 */
export function KingdomQuoteGlyph({ closing = false }: { closing?: boolean }) {
  return closing ? (
    <span aria-hidden="true">
      <span className="kingdom-quote kingdom-quote-nt">{"’"}</span>
      <span className="kingdom-quote kingdom-quote-tanakh">{"’"}</span>
    </span>
  ) : (
    <span aria-hidden="true">
      <span className="kingdom-quote kingdom-quote-tanakh">{"‘"}</span>
      <span className="kingdom-quote kingdom-quote-nt">{"‘"}</span>
    </span>
  );
}

/**
 * Render one card_md paragraph: italic spans throughout, and when the
 * paragraph ends with a "(Ref)" scripture citation, the citation
 * (parentheses included) renders in its source-class register color.
 * Same renderer shape as WitnessCard's.
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

interface KingdomCardProps {
  entry: KingdomEntry;
  hideParentheticals?: boolean;
  sacredNameMask?: SacredNameMask;
  onClose: () => void;
}

export default function KingdomCard({
  entry,
  hideParentheticals = false,
  sacredNameMask = "yahuah",
  onClose,
}: KingdomCardProps) {
  const body = applyParentheticalsToggle(
    applySacredNameMask(entry.card_md, sacredNameMask),
    hideParentheticals
  );
  const title = applyParentheticalsToggle(
    applySacredNameMask(entry.card_title, sacredNameMask),
    hideParentheticals
  );

  return (
    <div className="pill-card pill-card-kingdom my-4" role="note">
      <div className="pill-card-eyebrow font-sans">
        <KingdomQuoteGlyph />
        <span className="kingdom-eyebrow-text">The Kingdom</span>
        <span className="pill-card-class-tag">{entry.strand_label}</span>
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
