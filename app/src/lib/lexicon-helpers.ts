/**
 * Phase 9.3 — §26 LexiconSheet helpers.
 *
 * Five pure helpers per DESIGN_LANGUAGE.md §26 "Helper API + sanity-test
 * surface". No React imports, no global state, no async. Each function is
 * independently sanity-testable via `node --test` against the JS port in
 * `_s163_lexicon_sanity.mjs` (≥30 cases per the §26 verification target).
 *
 * The LexiconSheet React component consumes these via the
 * `useLexiconEntry(strongNumber)` hook which calls the combined endpoint
 * `GET /v1/lexicon/{strong_number}` (per S163 Q3 decision — single endpoint
 * returning { entries, callout, available_sources }, supersedes the
 * two-endpoint pattern in the S158 skeleton).
 *
 * Disclaimer copy mirrors the API's `LEXICON_DISCLAIMERS` constant; the
 * API returns disclaimer text in each LexiconEntry payload so the surface
 * works even if these constants drift. The local constants are a fallback
 * for offline-cache resilience (per §12 offline-first architecture).
 */

// ─────────────────────────────────────────────────────────────────────
// Types
// ─────────────────────────────────────────────────────────────────────

export type LexiconSource = "bdb" | "lsj" | "gesenius";
export type LexiconLanguage = "hebrew" | "greek" | "aramaic";

export interface BreadcrumbSegment {
  strong_number: string;
  lemma: string;
  source: LexiconSource;
}

export interface LexiconCalloutLike {
  term_display: string;
  gloss_error_summary: string;
}

export interface ExtractedLink {
  kind: "verse" | "strong";
  target: string;
}

export interface ParsedLexiconBody {
  verseLinks: ExtractedLink[];
  strongLinks: ExtractedLink[];
  unresolvedCount: number;
}

// ─────────────────────────────────────────────────────────────────────
// Standing disclaimers — fallback constants for offline-cache resilience.
// The API returns disclaimer text in each LexiconEntry payload; these only
// fire when the surface renders a row that arrived without one.
// ─────────────────────────────────────────────────────────────────────

const DISCLAIMERS: Record<LexiconSource, string> = {
  bdb:
    "The lexicon below is BDB (Brown-Driver-Briggs, 1906) — a 19th-century " +
    "Christian-era Hebrew scholarship work, preserved as data so you can see " +
    "how the inherited tradition handled the word. The framework's reading " +
    "lives in the verse commentary and in the framework callouts below; where " +
    "the lexicon and the framework diverge, the framework is the standard.",
  lsj:
    "The lexicon below is LSJ (Liddell-Scott-Jones, 1940 — Tyndale-edited from " +
    "the 9th edition), with Abbott-Smith's Manual Greek Lexicon of the New " +
    "Testament (1922) filling in NT-only vocabulary where LSJ has no entry. " +
    "Preserved as data so you can see how the inherited 19th–20th-century " +
    "classical-philological and NT-Greek scholarship handled the word. The " +
    "framework's reading lives in the verse commentary and in the framework " +
    "callouts below; where the lexicon and the framework diverge, the " +
    "framework is the standard.",
  gesenius:
    "The lexicon below is Gesenius (Tregelles 1846 English), a 19th-century " +
    "Christian-era Hebrew scholarship work, preserved as data so you can see " +
    "how the inherited tradition handled the word. The framework's reading " +
    "lives in the verse commentary and in the framework callouts below; where " +
    "the lexicon and the framework diverge, the framework is the standard.",
};

const GENERIC_DISCLAIMER =
  "Source lexicon — preserved as data. The framework's reading lives in the " +
  "verse commentary and in the framework callouts below; where the lexicon " +
  "and the framework diverge, the framework is the standard.";

/**
 * Standing-disclaimer text per source. Surfaces in the LexiconSheet body
 * top in §5 spectral-blue accent muted register per §26 Gate #1.
 *
 * Unknown sources fall through to a generic disclaimer so the surface never
 * renders without one. Refinement post-launch happens by editing this
 * constant; no schema change, no migration.
 */
export function formatDisclaimer(source: string): string {
  if (source === "bdb" || source === "lsj" || source === "gesenius") {
    return DISCLAIMERS[source];
  }
  return GENERIC_DISCLAIMER;
}

// ─────────────────────────────────────────────────────────────────────
// Breadcrumb: §26 lexicographic-chain navigation. Three-segment cap on
// what renders at once; deeper chains elide the leftmost segments to `…`
// (per §26 "three-segment cap on the breadcrumb visible at once; deeper
// chains render the leftmost segment as `…` with the full chain available
// on tap for advanced partners").
// ─────────────────────────────────────────────────────────────────────

const MAX_VISIBLE_SEGMENTS = 3;
const SEP = " › "; // " › "

/**
 * Render the breadcrumb string for a lexicographic chain. Each
 * BreadcrumbSegment becomes one navigational unit reading
 * `Strong's H#### (lemma) › SOURCE` (per §26 Header — breadcrumb +
 * source picker).
 *
 * Empty stack returns an empty string (defensive — the LexiconSheet's
 * empty-state surface handles the no-entry case separately).
 *
 * Chains deeper than 3 elide the leftmost segments to `…` so the
 * breadcrumb fits the mobile sheet header. Tap-back navigation walks
 * the full underlying stack regardless of what's visible.
 */
export function buildBreadcrumb(stack: BreadcrumbSegment[]): string {
  if (!stack || stack.length === 0) return "";

  const segments = stack.map(
    (seg) =>
      `Strong's ${seg.strong_number} (${seg.lemma})${SEP}${seg.source.toUpperCase()}`,
  );

  if (segments.length <= MAX_VISIBLE_SEGMENTS) {
    return segments.join(SEP);
  }

  // Show only the last MAX_VISIBLE_SEGMENTS segments with an elision marker.
  const visible = segments.slice(-MAX_VISIBLE_SEGMENTS);
  return `…${SEP}${visible.join(SEP)}`;
}

// ─────────────────────────────────────────────────────────────────────
// Default-source selection: which lexicon source renders first for a
// given language. Hebrew → BDB; Greek → LSJ; Aramaic → BDB (BDB has the
// Aramaic block). At V1 the available set typically has 0 or 1 entries
// per word; the function also handles the §26 default-source-flip
// behavior for v1.1+ when BDB has no entry but Gesenius does.
// ─────────────────────────────────────────────────────────────────────

/**
 * Select the default source to render given a language and the set of
 * available sources for this Strong's number.
 *
 * Behavior matrix:
 *   - hebrew  + bdb available    → 'bdb'
 *   - hebrew  + only gesenius    → 'gesenius'   (v1.1+ fallback)
 *   - aramaic + bdb available    → 'bdb'
 *   - greek   + lsj available    → 'lsj'
 *   - empty available            → null         (empty-state)
 *   - unknown language           → first available source (defensive)
 */
export function selectDefaultSource(
  language: LexiconLanguage,
  available: Set<LexiconSource> | LexiconSource[],
): LexiconSource | null {
  const availSet = available instanceof Set ? available : new Set(available);
  if (availSet.size === 0) return null;

  if (language === "hebrew" || language === "aramaic") {
    if (availSet.has("bdb")) return "bdb";
    if (availSet.has("gesenius")) return "gesenius";
  }
  if (language === "greek") {
    if (availSet.has("lsj")) return "lsj";
  }
  // Defensive fallback — return whichever source is present.
  // Sort so the result is deterministic for sanity tests.
  const sorted = Array.from(availSet).sort();
  return sorted[0] ?? null;
}

// ─────────────────────────────────────────────────────────────────────
// Callout header formatter: composes `Framework reading · {term} · {error}`
// per §26 callout band title.
// ─────────────────────────────────────────────────────────────────────

/**
 * Render the framework-callout title string per §26. Example:
 *
 *   formatCalloutHeader({
 *     term_display: 'charis',
 *     gloss_error_summary: 'The Reformation grace-against-law reading',
 *   })
 *   → "Framework reading · charis · The Reformation grace-against-law reading"
 *
 * Empty gloss_error_summary collapses to just the term. Unicode-safe for
 * Hebrew/Greek lemmas in term_display.
 */
export function formatCalloutHeader(callout: LexiconCalloutLike): string {
  const term = (callout.term_display || "").trim();
  const err = (callout.gloss_error_summary || "").trim();
  if (!term && !err) return "Framework reading";
  if (!err) return `Framework reading · ${term}`;
  if (!term) return `Framework reading · ${err}`;
  return `Framework reading · ${term} · ${err}`;
}

// ─────────────────────────────────────────────────────────────────────
// Body-link extraction: parse `body_html` for tap-link targets. Returns
// flat lists the PWA's click-event delegate uses to route taps to the
// correct verse-navigate or cross-lemma sheet-push action.
//
// The actual render still happens via dangerouslySetInnerHTML — content
// is curated public-domain (BDB 1906, LSJ 1940, Abbott-Smith 1922) so
// XSS surface is zero. This parser is for the JS-side index, not the
// render tree.
//
// Regex-based for sanity-test parity (node tests don't load a DOM); the
// regex extracts the data-* attribute value without recursing into nested
// inner HTML, so anchors with nested spans (typical for BDB cross-lemma:
// `<a data-strong="H0410"><span class="bdb-hebrew">אֵל</span></a>`) parse
// cleanly.
// ─────────────────────────────────────────────────────────────────────

const VERSE_RE = /<a\b[^>]*\bdata-verse="([^"]+)"/g;
const STRONG_RE = /<a\b[^>]*\bdata-strong="([^"]+)"/g;
const UNRESOLVED_RE =
  /<span\b[^>]*\bclass="[^"]*\blexicon-unresolved-cite\b[^"]*"/g;

/**
 * Parse the body_html for tap-link targets. Returns:
 *   - verseLinks   : every <a data-verse="..."> target, in DOM order
 *   - strongLinks  : every <a data-strong="..."> target, in DOM order
 *   - unresolvedCount : count of <span class="lexicon-unresolved-cite">
 *
 * Survives malformed HTML (returns whatever it can find; never throws).
 * Empty/null/undefined input returns an empty result.
 */
export function parseLexiconBodyLinks(
  html: string | null | undefined,
): ParsedLexiconBody {
  const result: ParsedLexiconBody = {
    verseLinks: [],
    strongLinks: [],
    unresolvedCount: 0,
  };
  if (!html) return result;

  let m: RegExpExecArray | null;

  // Use fresh regex objects each call so lastIndex resets cleanly.
  const verseRe = new RegExp(VERSE_RE.source, "g");
  const strongRe = new RegExp(STRONG_RE.source, "g");
  const unresolvedRe = new RegExp(UNRESOLVED_RE.source, "g");

  while ((m = verseRe.exec(html)) !== null) {
    result.verseLinks.push({ kind: "verse", target: m[1] });
  }
  while ((m = strongRe.exec(html)) !== null) {
    result.strongLinks.push({ kind: "strong", target: m[1] });
  }
  while ((m = unresolvedRe.exec(html)) !== null) {
    result.unresolvedCount++;
  }

  return result;
}
