/**
 * S493 — "How would you like this to be copied?" (Yoshi, Nov 6 2026)
 *
 * Every Copy action (Copy verse, Copy words, Copy range) now asks the
 * reader which form the text should leave the app in:
 *
 *   english — WITHOUT the sacred names. The restored name is replaced
 *             by its English parenthetical, so `Yahuah (LORD)` leaves as
 *             `LORD`, `Yashar'el (Israel)` as `Israel`, `Yahuah Elohayka
 *             (the LORD thy God)` as `the LORD thy God`. Conventional
 *             text a reader can paste anywhere without explaining it.
 *   both    — the sacred names WITH their English parentheticals, exactly
 *             as the body text reads (the retention form).
 *   hebrew  — the sacred names ONLY, parentheticals dropped (the same
 *             strip the reader's Hide-English toggle does).
 *
 * The English form is built from the same STRIP_LIST that drives the
 * Hide-English toggle, so the two stay in sync: whatever parenthetical
 * the toggle knows how to hide, this knows how to swap in.
 */
import { STRIP_LIST_FOR_AUDIT, stripParentheticals } from "./stripParentheticals";

export type CopyFormat = "english" | "both" | "hebrew";

// Hebrew tokens that can PRECEDE the final name-word in a compound
// restoration (`Yahuah Elohayka (the LORD thy God)`, `Ruach HaKodesh
// (Holy Spirit)`, `Melek Tsadiq (Melchizedek)`, `Ehyeh asher Ehyeh
// (I AM THAT I AM)`). The final word before the parenthetical is always
// taken; these let the swap reach back over the rest of the compound
// without eating an ordinary English word like "And" in
// `And Elohim (God) said`.
const LEADING_TOKENS = [
  "Yahuah", "Yahusha", "Elohim", "El", "Adonai", "Ruach", "Melek", "Sar",
  "Ehyeh", "asher", "HaMashiach", "Messiah", "YHWH", "Yahuah's", "Yahuah’s",
];

function buildEnglishRegex(): RegExp {
  const escape = (s: string): string => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  // The body text also carries capital-"The" source-echo forms
  // (`(The LORD our God)`, `(The mighty God)`) that the strip list
  // spells without the article; an optional "the"/"The" covers them.
  const parens = [...new Set(STRIP_LIST_FOR_AUDIT.map((p) => p.slice(1, -1).replace(/^the\s/, "")))]
    .sort((a, b) => b.length - a.length)
    .map(escape)
    .join("|");
  const lead = LEADING_TOKENS.map(escape).join("|");
  // (leading hebrew tokens)* (final name word) optional-space "(" english ")"
  return new RegExp(
    `(?:(?:${lead})\\s+)*[A-Z][\\w'’\\-]*\\s?\\(((?:[Tt]he\\s)?(?:${parens}))\\)`,
    "g",
  );
}

const ENGLISH_REGEX = buildEnglishRegex();

/** `Yahuah (LORD) spoke to Yashar'el (Israel)` → `LORD spoke to Israel`. */
export function toConventionalEnglish(text: string): string {
  if (!text) return text;
  return text.replace(ENGLISH_REGEX, "$1");
}

export function applyCopyFormat(text: string, format: CopyFormat): string {
  switch (format) {
    case "english":
      return toConventionalEnglish(text);
    case "hebrew":
      return stripParentheticals(text);
    default:
      return text;
  }
}
