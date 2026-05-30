/**
 * S172 — Sacred-name display mask (Yahuah / YHWH).
 *
 * Render-time text-substitution that lets a partner from a different
 * pronunciation tradition (Yahweh, Jehovah, YHVH, etc.) read the
 * scripture without being asked to adopt the Yahuah pronunciation the
 * framework holds per the voice skill (Josephus *Wars* 5.5.7's
 * four-vowel shape). The source data is never mutated — the database
 * always carries "Yahuah (LORD)" — and this helper substitutes the
 * sacred name on the way to the screen when the partner has the
 * mask enabled.
 *
 * Architectural notes per `S172_SACRED_NAME_MASK_SPEC.md`:
 *
 *   • The mask is INDEPENDENT of the S144 parentheticals-hide toggle.
 *     Two preferences, four valid combinations:
 *       Yahuah + paren on  → "Yahuah (LORD)"
 *       Yahuah + paren off → "Yahuah"
 *       YHWH   + paren on  → "YHWH (LORD)"
 *       YHWH   + paren off → "YHWH"
 *     The paren in YHWH+paren-on mode is preserved because the
 *     parentheticals-hide toggle governs the source-echo separately —
 *     a YHWH-tradition partner who still wants the "(LORD)" hint
 *     gets it. Yoshi's S171 close-out correction.
 *
 *   • Render-time mask, NOT source mutation. Same pattern as
 *     `applyParentheticalsToggle`. The mask runs on the way to every
 *     render surface; the database row stays "Yahuah (LORD)" forever.
 *
 *   • Compound names get the swap inside per Yoshi's S171 decision:
 *     "Yahuah Tseva'ot" → "YHWH Tseva'ot", "Adonai Yahuah" → "Adonai
 *     YHWH". Word-boundary anchor in the regex catches the
 *     restoration as a discrete token wherever it appears.
 *
 *   • Yahusha (the Son) is OUT OF SCOPE this session. The voice-
 *     skill-locked spelling stays everywhere. A parallel Yahusha
 *     toggle is a future wheel gated on partner feedback.
 *
 *   • Other restored proper nouns (Yashar'el, Yahudah, Mosheh, etc.)
 *     are NOT in scope. The mask is narrowly scoped to the
 *     Tetragrammaton.
 */

export type SacredNameMask = "yahuah" | "yhwh";

/**
 * Apply the sacred-name mask to a text string. When mask is "yahuah"
 * (default), returns the text unchanged. When mask is "yhwh",
 * substitutes every word-bounded "Yahuah" with "YHWH" (catches both
 * standalone occurrences AND every occurrence inside compound names).
 *
 *   applySacredNameMask("Yahuah (LORD) is one", "yhwh")
 *     → "YHWH (LORD) is one"
 *   applySacredNameMask("Yahuah Tseva'ot", "yhwh")
 *     → "YHWH Tseva'ot"
 *   applySacredNameMask("Adonai Yahuah", "yhwh")
 *     → "Adonai YHWH"
 *   applySacredNameMask("Yahudah", "yhwh")
 *     → "Yahudah"  (word boundary — H is followed by D, not end-of-word)
 *
 * Composes freely with `applyParentheticalsToggle` from
 * `lib/stripParentheticals.ts`. Order doesn't affect outcome today
 * because the S144 STRIP_LIST entries are all English-form ("(LORD)",
 * "(God)", etc.) and don't contain "Yahuah". Render sites call both
 * in sequence:
 *
 *   const masked = applySacredNameMask(verse.text, mask);
 *   const final  = applyParentheticalsToggle(masked, hideParens);
 */
export function applySacredNameMask(
  text: string,
  mask: SacredNameMask
): string {
  if (mask === "yahuah") return text;
  return maskYahuahAsYHWH(text);
}

/**
 * Pure substitution helper. Exported for test-rig + non-React callers.
 *
 * Word-boundary anchor on both sides so "Yahuah" inside a longer
 * token (vanishingly rare, but defensive) doesn't get partially
 * matched. The mask catches the standalone restored name AND every
 * occurrence inside compound forms (Yahuah Tseva'ot, Adonai Yahuah,
 * Yahuah Yireh, Yahuah Shalom, Yahuah Tsidkenu, Yahuah Rapha,
 * Yahuah Nissi, Yahuah Shammah, Yahuah Mekaddishkem, etc.) because
 * each compound carries "Yahuah" as a word-bounded token.
 *
 * Case-sensitive: only the title-case "Yahuah" the restoration
 * pipeline emits is matched. Lowercase "yahuah" would be an
 * authoring error and stays as-is (caught at the next restoration-
 * pipeline audit). NOT affected: "Yahudah", "Yahudim", "Yahudi",
 * "Yahusha", "Yahushua" — all have the H followed by another letter,
 * not the end of the token.
 */
export function maskYahuahAsYHWH(text: string): string {
  return text.replace(/\bYahuah\b/g, "YHWH");
}
