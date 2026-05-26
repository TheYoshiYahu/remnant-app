/**
 * S144 — strip-list utility for the parentheticals-hide reader-surface toggle.
 *
 * Maintains the canonical list of English-form parentheticals that follow
 * restored Sacred Names in the body text. When the reader has the
 * parentheticals-toggle enabled, every occurrence of one of these literal
 * strings (with the preceding optional whitespace) is removed at render
 * time, so `Yahuah (LORD)` displays as `Yahuah`, `Yashar'el (Israel)` as
 * `Yashar'el`, `Mosheh (Moses)` as `Mosheh`, etc.
 *
 * GOVERNANCE — KEEP IN SYNC WITH THE VOICE SKILL:
 *   The voice skill's Sacred Names section
 *   (~/Library/.../skills/yoshi-voice/SKILL.md — sections "The Restored
 *   Names and Their Parentheticals" and "Scripture Quotations") is the
 *   source of truth for which Hebrew restorations the body text uses
 *   and which English parentheticals accompany them. When the Sacred
 *   Names convention adds a new compound form (e.g., once the canon
 *   re-parse exposes `<nd>` and the `Adonai Yahuah (the Lord GOD)`
 *   construction starts emitting in scripture quotations), TWO places
 *   update:
 *     (a) the voice skill's Sacred Names section, and
 *     (b) the STRIP_LIST constant below.
 *   When adding entries here, leave a comment marker pointing back at
 *   the voice-skill change that drove the addition so the sync stays
 *   visible.
 *
 * Design (per Yoshi's S143 specification):
 *   - Literal-string matches (no semantic / name-anchoring logic). Zero
 *     false-positive risk — verse refs like `(vv.13-15)`, technical
 *     asides like `(per Red Line #11)`, KJV-style parentheticals like
 *     `(Behold)`, and untouched book-name parentheticals all pass
 *     through because they are not in this list.
 *   - The optional leading space `\s?` is captured so the result reads
 *     cleanly: `Yahuah (LORD)` → `Yahuah`, not `Yahuah ` with a
 *     trailing space.
 *   - Compound forms are sorted longest-first inside the regex
 *     alternation so `(the LORD God)` wins against `(God)` and
 *     `(LORD of hosts)` wins against `(LORD)`.
 *   - Default OFF — preserves the retention-mechanism for first-time
 *     Christian readers per the voice-skill's "Why the Parenthetical Is
 *     Non-Negotiable" section. The toggle is opt-IN to hide.
 *
 * Scope intentionally EXCLUDES:
 *   - Book-name parentheticals (`(Exodus)`, `(Numbers)`, `(Isaiah)`,
 *     etc.). The voice skill mandates English book names in citations;
 *     any Hebrew-prefix book-name usage in the body is a separate
 *     cleanup item, not a toggle concern.
 *   - Technical asides, verse refs, and any parenthetical not in the
 *     restored-name set.
 */

// Order matters at the source-of-truth level: compounds first (longest),
// singles after. buildStripRegex() re-sorts at runtime to guarantee
// longest-match-wins regardless of source order.
const STRIP_LIST: string[] = [
  // ---- Compound divine forms (Sacred Names section: YHWH constructions) -----
  "(THE LORD OUR RIGHTEOUSNESS)",
  "(The LORD is my shepherd)",
  "(the LORD that healeth thee)",
  "(the everlasting God)",
  "(everlasting Father)",
  "(The LORD is there)",
  "(the LORD thy God)",
  "(the Lord thy God)",
  "(the LORD your God)",
  "(the Lord your God)",
  "(the LORD our God)",
  "(the Lord our God)",
  "(the LORD his God)",
  "(the Lord his God)",
  "(the LORD my God)",
  "(the Lord my God)",
  "(LORD of hosts)",
  "(Lord of hosts)",
  // Defensive: any straggler with the stale "the" article from the pre-2026-05-26
  // restoration convention (now retired). Source text has been cleaned and the
  // pipeline no longer emits these, but kept here so the toggle works on any
  // un-regenerated data that still carries the old form.
  "(the LORD of hosts)",
  "(the Lord of hosts)",
  "(the LORD God)",
  "(the Lord God)",
  "(LORD God)",
  "(Lord God)",
  // ---- Adonai construction (canon-only, requires `<nd>` reparse) ------------
  "(the Lord GOD)",
  // ---- El constructions -----------------------------------------------------
  "(God Almighty)",
  "(Almighty God)",
  "(mighty God)",
  "(most High)",
  "(Most High)",
  // ---- Isaiah 9:6 titles ----------------------------------------------------
  "(Prince of Peace)",
  // ---- Yahuah Yireh / Nissi / Shalom ----------------------------------------
  "(Jehovah-jireh)",
  "(Jehovah-nissi)",
  "(Jehovah-shalom)",
  // ---- Messianic personal forms ---------------------------------------------
  "(I AM THAT I AM)",
  "(Jesus Christ)",
  "(Christ Jesus)",
  // ---- Ruach HaKodesh -------------------------------------------------------
  "(Holy Spirit)",
  "(Holy Ghost)",
  // ---- Single divine names --------------------------------------------------
  "(LORD)",
  "(Lord)",
  "(God)",
  "(Jesus)",
  "(Christ)",
  // ---- Covenant people-names ------------------------------------------------
  "(Israel)",
  "(Judah)",
  "(Jews)",
  "(Jewish)",
  "(Jew)",
  // ---- Patriarch / prophet / figure forms (translator's-call names) ---------
  "(Abraham)",
  "(Isaac)",
  "(Jacob)",
  "(Moses)",
  "(Aaron)",
  "(Joshua)",
  "(Jerusalem)",
  "(John)",
  "(James)",
  "(Timothy)",
  "(Saul)",
  "(Paul)",
  "(Cain)",
  "(Abel)",
  "(Noah)",
  "(Jonah)",
  "(Solomon)",
  "(David)",
  "(Michael)",
  "(Gabriel)",
  "(Melchizedek)",
  "(Mary)",
  "(Joseph)",
  "(Peter)",
  "(Elijah)",
  "(Elisha)",
  "(Ahab)",
  "(Jezebel)",
  "(Naboth)",
  "(Isaiah)",
  "(Jeremiah)",
  "(Ezekiel)",
  "(Hosea)",
  "(Joel)",
  "(Micaiah)",
  "(Zechariah)",
  "(Berachiah)",
  "(Adam)",
  "(Eve)",
  "(Sarah)",
  "(Rebekah)",
  "(Rachel)",
  // ---- KJV Greek-form variants used in NT scripture quotations --------------
  "(Elias)",
  "(Esaias)",
  "(Jonas)",
  "(Noe)",
  "(Jeremias)",
];

/**
 * Build the strip regex from STRIP_LIST. Compounds first (longest) to
 * win against shorter substrings inside the alternation. The leading
 * `\s?` optionally captures one whitespace character before the
 * parenthetical so the joined result reads cleanly.
 */
function buildStripRegex(): RegExp {
  const sorted = [...STRIP_LIST].sort((a, b) => b.length - a.length);
  const escape = (s: string): string =>
    s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const alternation = sorted.map(escape).join("|");
  return new RegExp(`\\s?(?:${alternation})`, "g");
}

// Cached once at module load — the strip list is static.
const STRIP_REGEX = buildStripRegex();

/**
 * Strip the canonical English-form parentheticals from text. Returns a
 * new string with every literal-string match (and its leading
 * whitespace, if any) removed.
 *
 * Example:
 *   stripParentheticals(
 *     "Yahuah (LORD) saith unto Yashar'el (Israel) by Mosheh (Moses)."
 *   )
 *   → "Yahuah saith unto Yashar'el by Mosheh."
 *
 * Untouched-by-design (literal-match only):
 *   stripParentheticals("(per Red Line #11) the Father (God) names...")
 *   → "(per Red Line #11) the Father names..."
 */
export function stripParentheticals(text: string): string {
  if (!text) return text;
  return text.replace(STRIP_REGEX, "");
}

/**
 * Conditional helper for render sites. Caller passes the toggle state
 * and the text; the function applies the strip only when `hide` is
 * true. Lets each render site write
 *   `applyParentheticalsToggle(verse.text, hide)`
 * instead of
 *   `hide ? stripParentheticals(verse.text) : verse.text`.
 */
export function applyParentheticalsToggle(
  text: string,
  hide: boolean,
): string {
  return hide ? stripParentheticals(text) : text;
}

/**
 * Read-only export of the strip list, intended for tests and for the
 * voice-skill governance audit (so a script can diff this list against
 * the voice-skill's Sacred Names section).
 */
export const STRIP_LIST_FOR_AUDIT: readonly string[] = STRIP_LIST;
