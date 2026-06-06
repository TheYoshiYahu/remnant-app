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
 * Rendering: card_md flows through the shared markdown helper, then
 * the sacred-name mask + parentheticals toggle so the card respects
 * the partner's display preferences exactly like the chapter-end
 * apparatus does.
 */

import { renderMarkdownBody } from "../lib/markdown";
import type { WitnessEntry } from "../lib/api";
import { applyParentheticalsToggle } from "../lib/useParentheticalsToggle";
import {
  applySacredNameMask,
  type SacredNameMask,
} from "../lib/applySacredNameMask";

export type PillRegister = "witness"; // "kingdom" joins at the Blue Pill session

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
        <span aria-hidden="true">◉</span>
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
      <div className="pill-card-body space-y-0">{renderMarkdownBody(body)}</div>
    </div>
  );
}
