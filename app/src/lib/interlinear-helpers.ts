/**
 * §28 — Hebrew & Greek Interlinear helpers.
 *
 * Five pure helpers per DESIGN_LANGUAGE.md §28 "Helper API + sanity-test
 * surface". No React imports, no global state, no async. Each function is
 * independently sanity-testable via the JS port in `_s167_interlinear_sanity.mjs`
 * (≥30 cases per the §28 verification target).
 *
 * The InterlinearLayer React component (S168) consumes these via the
 * `useInterlinearToggle()` hook + the per-chapter words endpoint. Each
 * verse_word + its joined strong_entry is fed through `buildInterlinearColumn`
 * to produce the render-ready column structure. `groupVerseColumns` assembles
 * the per-verse list in English-flow order. `formatMorphology` decodes the
 * raw STEPBible morph code to the short or expanded English register;
 * `selectInterlinearFontStack` picks the original-script font; `wrapHebrewBidi`
 * isolates Hebrew/Aramaic from the surrounding LTR column-flow.
 *
 * Morph-code coverage notes:
 *
 *  - Greek: STEPBible TAGNT uses Robinson-style tagged codes (`V-AAI-3S`,
 *    `N-GSM-P`, `T-ASM`, etc.). The dictionaries below cover the
 *    grammatical-axis values across the canon. Unknown raw codes return
 *    the raw code unchanged (defensive fallback per spec).
 *
 *  - Hebrew/Aramaic: STEPBible TAHOT uses the Westminster scheme
 *    (`HVqp3ms`, `HNcmpa`, `AVqp3ms`, etc.). Hebrew prefixes (definite
 *    article, vav-consec, prepositions) attach via slash-compound codes
 *    like `HR/Ncfsa` (preposition + common noun); the parser splits on
 *    `/` and joins the decoded morphemes with `+` so the column-stack
 *    shows the morphological composition the partner is reading.
 */

// ─────────────────────────────────────────────────────────────────────
// Types
// ─────────────────────────────────────────────────────────────────────

export type InterlinearLanguage = "hebrew" | "aramaic" | "greek";

export type MorphologyRegister = "short" | "expanded";

export interface InterlinearVerseWord {
  position: number;
  surface: string;
  strong_number: string | null;
  morphology: string | null;
}

export interface InterlinearStrongEntry {
  strong_number: string;
  language: InterlinearLanguage;
  lemma: string;
  transliteration: string;
  short_definition: string | null;
}

export interface InterlinearMorphology {
  short: string;
  expanded: string;
}

export interface InterlinearColumn {
  position: number;
  surface: string;
  lemma: string | null;
  transliteration: string | null;
  morphology: InterlinearMorphology | null;
  gloss: string | null;
  language: InterlinearLanguage | null;
  fontStack: string;
}

// ─────────────────────────────────────────────────────────────────────
// Font-stack selection
// ─────────────────────────────────────────────────────────────────────

const HEBREW_FONT_STACK =
  "'SBL Hebrew', 'Ezra SIL', 'Times New Roman', serif";
const GREEK_FONT_STACK =
  "'SBL BibLit', 'Cardo', 'Times New Roman', serif";
const BODY_FONT_STACK = "inherit";

/**
 * Return the CSS `font-family` string for the lemma cell in a given
 * interlinear column. SBL Hebrew covers Hebrew + Aramaic (Daniel 2:4b–
 * 7:28, Ezra 4:8–6:18 + 7:12–26, Jer 10:11); SBL BibLit covers Greek.
 * Unknown language returns the inherited body-text stack so the column
 * renders without a font-face mismatch error.
 */
export function selectInterlinearFontStack(
  language: InterlinearLanguage | string | null | undefined,
): string {
  if (language === "hebrew" || language === "aramaic") {
    return HEBREW_FONT_STACK;
  }
  if (language === "greek") {
    return GREEK_FONT_STACK;
  }
  return BODY_FONT_STACK;
}

// ─────────────────────────────────────────────────────────────────────
// Hebrew/Aramaic bidi isolation
// ─────────────────────────────────────────────────────────────────────

const RTL_ISOLATE_START = "⁨"; // FIRST STRONG ISOLATE
const RTL_ISOLATE_END = "⁩"; // POP DIRECTIONAL ISOLATE

/**
 * Wrap a Hebrew or Aramaic lemma string in Unicode FSI/PDI isolation
 * markers so the within-cell RTL rendering doesn't bleed into the
 * surrounding LTR column-flow when column ordering follows English. The
 * isolation is transparent to copy-paste and to screen readers that
 * honor BiDi controls. Empty input returns empty string defensively.
 */
export function wrapHebrewBidi(
  lemma: string | null | undefined,
): string {
  if (!lemma) return "";
  return `${RTL_ISOLATE_START}${lemma}${RTL_ISOLATE_END}`;
}

// ─────────────────────────────────────────────────────────────────────
// Morphology decoding — Greek (TAGNT / Robinson-style)
// ─────────────────────────────────────────────────────────────────────

// Tag-token → { short, expanded } for the leading POS segment. Verbs
// take an additional tense/voice/mood/person/number parser; the rest of
// the table covers single-segment POS tokens that don't need further
// decomposition (CONJ, PREP, ADV, COND, INJ, PRT, etc.).
const GREEK_POS: Record<string, { short: string; expanded: string }> = {
  V: { short: "v.", expanded: "verb" },
  N: { short: "n.", expanded: "noun" },
  A: { short: "adj.", expanded: "adjective" },
  T: { short: "art.", expanded: "article" },
  P: { short: "pron.", expanded: "personal pronoun" },
  D: { short: "dem.", expanded: "demonstrative pronoun" },
  R: { short: "rel.", expanded: "relative pronoun" },
  S: { short: "poss.", expanded: "possessive pronoun" },
  F: { short: "refl.", expanded: "reflexive pronoun" },
  C: { short: "recip.", expanded: "reciprocal pronoun" },
  Q: { short: "corr.", expanded: "correlative or interrogative" },
  K: { short: "corr.", expanded: "correlative" },
  I: { short: "interr.", expanded: "interrogative" },
  X: { short: "indef.", expanded: "indefinite pronoun" },
  ADV: { short: "adv.", expanded: "adverb" },
  CONJ: { short: "conj.", expanded: "conjunction" },
  COND: { short: "cond.", expanded: "conditional" },
  PREP: { short: "prep.", expanded: "preposition" },
  PRT: { short: "prt.", expanded: "particle" },
  INJ: { short: "intj.", expanded: "interjection" },
};

const GREEK_TENSE: Record<string, { short: string; expanded: string }> = {
  P: { short: "pres.", expanded: "present" },
  I: { short: "impf.", expanded: "imperfect" },
  F: { short: "fut.", expanded: "future" },
  A: { short: "aor.", expanded: "aorist" },
  X: { short: "perf.", expanded: "perfect" },
  R: { short: "perf.", expanded: "perfect" },
  L: { short: "plupf.", expanded: "pluperfect" },
};

const GREEK_VOICE: Record<string, { short: string; expanded: string }> = {
  A: { short: "act.", expanded: "active" },
  M: { short: "mid.", expanded: "middle" },
  P: { short: "pass.", expanded: "passive" },
  D: { short: "dep.", expanded: "deponent" },
  N: { short: "m/p dep.", expanded: "middle/passive deponent" },
  O: { short: "m/p.", expanded: "middle or passive" },
  E: { short: "m/p.", expanded: "middle or passive" },
};

const GREEK_MOOD: Record<string, { short: string; expanded: string }> = {
  I: { short: "ind.", expanded: "indicative" },
  S: { short: "subj.", expanded: "subjunctive" },
  O: { short: "opt.", expanded: "optative" },
  M: { short: "imv.", expanded: "imperative" },
  N: { short: "inf.", expanded: "infinitive" },
  P: { short: "ptcp.", expanded: "participle" },
};

const GREEK_CASE: Record<string, { short: string; expanded: string }> = {
  N: { short: "nom.", expanded: "nominative" },
  G: { short: "gen.", expanded: "genitive" },
  D: { short: "dat.", expanded: "dative" },
  A: { short: "acc.", expanded: "accusative" },
  V: { short: "voc.", expanded: "vocative" },
};

const GREEK_GENDER: Record<string, { short: string; expanded: string }> = {
  M: { short: "masc.", expanded: "masculine" },
  F: { short: "fem.", expanded: "feminine" },
  N: { short: "neut.", expanded: "neuter" },
};

const GREEK_NUMBER: Record<string, { short: string; expanded: string }> = {
  S: { short: "sg.", expanded: "singular" },
  P: { short: "pl.", expanded: "plural" },
  D: { short: "dual", expanded: "dual" },
};

// Trailing extras: -P proper-name, -LG location-gentilic, -PG person-
// gentilic, -L location, -T title, -G gentilic, -C comparative,
// -S superlative, -NUI numeral indeclinable, -PRI proper indeclinable,
// -LI letter indeclinable. The short register suppresses these for
// brevity; the expanded register names them.
const GREEK_EXTRAS_EXPANDED: Record<string, string> = {
  P: "proper",
  L: "location",
  T: "title",
  G: "gentilic",
  LG: "location gentilic",
  PG: "person gentilic",
  TG: "title gentilic",
  C: "comparative",
  S: "superlative",
  NUI: "numeral",
  PRI: "proper indeclinable",
  LI: "letter indeclinable",
  ATT: "Attic",
};

/**
 * Decode a Greek morphology code (e.g. `V-AAI-3S`, `N-GSM-P`, `T-ASM`,
 * `CONJ`) into the short or expanded English register. Returns the raw
 * code unchanged on parse failure (defensive fallback).
 */
function formatGreekMorphology(
  rawCode: string,
  register: MorphologyRegister,
): string {
  // Strip optional leading G: namespace if STEPBible tags include it.
  const code = rawCode.replace(/^G:/, "");
  const parts = code.split("-");
  if (parts.length === 0 || parts[0] === "") return rawCode;

  const head = parts[0];

  // Multi-letter POS: CONJ, PREP, ADV, COND, INJ, PRT.
  if (head.length > 1 && GREEK_POS[head]) {
    const pos = GREEK_POS[head];
    const tail = parts.slice(1).join("-");
    if (!tail) return register === "short" ? pos.short : pos.expanded;
    // Tails on these POS classes are normally suffix modifiers
    // (PRT-N "particle negative", PRT-I "particle interrogative",
    // ADV-C "adverb comparative", CONJ-N "conjunction negative").
    return formatExtras(rawCode, pos, tail, register);
  }

  // Single-letter POS: V, N, A, T, P, D, R, S, F, C, Q, K, I, X.
  const pos = GREEK_POS[head];
  if (!pos) return rawCode;

  if (head === "V") {
    // V-[2]TVM-PN  e.g. V-AAI-3S, V-2AAI-3S (2nd aorist), V-PAP-NSM
    // (participle has case/num/gen instead of person/num).
    return formatGreekVerb(rawCode, parts, register);
  }

  // Non-verb POS — parts[1] is typically [C][N][G][-EX]
  // e.g. N-GSM, T-ASM, A-APF, P-GSM, P-1GS, N-GSM-P
  if (parts.length < 2) {
    return register === "short" ? pos.short : pos.expanded;
  }

  // Personal-pronoun person-prefix: P-1GS, P-2NP, P-3DSM
  // First segment may be P; second may be a digit followed by case/num/gen.
  let person: string | null = null;
  let coreSeg = parts[1];
  if ((head === "P" || head === "S") && /^[123]/.test(coreSeg)) {
    person = coreSeg[0];
    coreSeg = coreSeg.slice(1);
  }
  const core = parseCaseNumberGender(coreSeg, register);
  if (!core) {
    return register === "short" ? pos.short : pos.expanded;
  }

  let result =
    (register === "short" ? pos.short : pos.expanded) +
    " " +
    core;
  if (person) {
    const personStr =
      register === "short"
        ? person + "p."
        : person === "1"
          ? "1st person"
          : person === "2"
            ? "2nd person"
            : "3rd person";
    result =
      (register === "short" ? pos.short : pos.expanded) +
      " " +
      personStr +
      " " +
      core;
  }
  if (parts.length > 2) {
    return formatExtras(rawCode, pos, parts.slice(2).join("-"), register, result);
  }
  return result;
}

function formatGreekVerb(
  rawCode: string,
  parts: string[],
  register: MorphologyRegister,
): string {
  if (parts.length < 2) return rawCode;
  // parts[1] is the TVM segment: optional leading "2" (2nd aorist/
  // 2nd perfect/2nd future), then T (tense letter), V (voice), M (mood).
  let tvm = parts[1];
  let secondForm = false;
  if (tvm.startsWith("2")) {
    secondForm = true;
    tvm = tvm.slice(1);
  }
  if (tvm.length < 3) return rawCode;
  const tense = GREEK_TENSE[tvm[0]];
  const voice = GREEK_VOICE[tvm[1]];
  const mood = GREEK_MOOD[tvm[2]];
  if (!tense || !voice || !mood) return rawCode;

  // parts[2] varies by mood:
  //   ind/subj/opt/imv → Person+Number (e.g., 3S, 1P)
  //   participle (P)  → Case+Number+Gender (e.g., NSM, GPF)
  //   infinitive (N)  → may be empty or a tag
  let tail = "";
  if (parts.length >= 3) {
    const t = parts[2];
    if (tvm[2] === "P") {
      // participle: case+num+gen, fall back to surfacing the raw
      const cng = parseCaseNumberGender(t, register);
      if (cng) tail = cng;
    } else if (tvm[2] === "N") {
      // infinitive — usually no further fields
      tail = "";
    } else {
      // finite verb: person+number, e.g. 1S, 2P, 3S
      if (t.length >= 2 && /^[123]/.test(t)) {
        const person = t[0];
        const number = GREEK_NUMBER[t[1]];
        if (number) {
          tail =
            register === "short"
              ? `${person}${number.short.replace(".", "")}`.replace(/sg$/, "s").replace(/pl$/, "p").replace(/dual$/, "d")
              : `${person === "1" ? "1st" : person === "2" ? "2nd" : "3rd"} ${number.expanded}`;
        }
      }
    }
  }

  const tenseStr = register === "short" ? tense.short : tense.expanded;
  const voiceStr = register === "short" ? voice.short : voice.expanded;
  const moodStr = register === "short" ? mood.short : mood.expanded;
  const secondStr = secondForm
    ? register === "short"
      ? "2nd "
      : "2nd "
    : "";

  if (register === "short") {
    return [secondStr + tenseStr, voiceStr, moodStr, tail]
      .filter(Boolean)
      .join(" ")
      .trim();
  }
  // Expanded:  "2nd aorist active indicative, 3rd singular"
  const head = `${secondStr}${tenseStr} ${voiceStr} ${moodStr}`.trim();
  return tail ? `${head}, ${tail}` : head;
}

function parseCaseNumberGender(
  seg: string,
  register: MorphologyRegister,
): string | null {
  if (seg.length < 2) return null;
  const c = GREEK_CASE[seg[0]];
  const n = GREEK_NUMBER[seg[1]];
  if (!c || !n) return null;
  const g = seg.length >= 3 ? GREEK_GENDER[seg[2]] : null;
  if (register === "short") {
    return [c.short, n.short, g?.short].filter(Boolean).join(" ");
  }
  return [c.expanded, n.expanded, g?.expanded].filter(Boolean).join(" ");
}

function formatExtras(
  _rawCode: string,
  pos: { short: string; expanded: string },
  extra: string,
  register: MorphologyRegister,
  current?: string,
): string {
  const base =
    current ?? (register === "short" ? pos.short : pos.expanded);
  if (register === "short") {
    // Short register suppresses name-type extras for brevity, except
    // negation markers ("-N") on particles/conjunctions which are
    // semantically load-bearing.
    if (extra === "N") return `${base} neg.`;
    if (extra === "I") return `${base} interr.`;
    if (extra === "C") return `${base} comp.`;
    if (extra === "S") return `${base} sup.`;
    return base;
  }
  const expanded = GREEK_EXTRAS_EXPANDED[extra];
  if (expanded) return `${base} ${expanded}`;
  if (extra === "N") return `${base} negative`;
  if (extra === "I") return `${base} interrogative`;
  return base;
}

// ─────────────────────────────────────────────────────────────────────
// Morphology decoding — Hebrew / Aramaic (TAHOT / Westminster)
// ─────────────────────────────────────────────────────────────────────

// Hebrew code structure (per STEPBible TEHMC FULL CODES):
//   Char 1: H (Hebrew) | A (Aramaic) — language marker
//   Char 2: POS letter
//   Remaining chars depend on POS
//
// Compound morphemes (Hebrew prefixes attached to a base word) use
// slash separation: HR/Ncfsa = preposition + common-feminine-singular-
// absolute noun. The parser splits and decodes each segment; the first
// segment carries the H/A language prefix, subsequent segments inherit.

const HEBREW_POS: Record<string, { short: string; expanded: string }> = {
  V: { short: "v.", expanded: "verb" },
  N: { short: "n.", expanded: "noun" },
  A: { short: "adj.", expanded: "adjective" },
  C: { short: "conj.", expanded: "conjunction" },
  R: { short: "prep.", expanded: "preposition" },
  T: { short: "prt.", expanded: "particle" },
  D: { short: "adv.", expanded: "adverb" },
  P: { short: "pron.", expanded: "pronoun" },
  S: { short: "suf.", expanded: "suffix" },
};

const HEBREW_VERB_STEM: Record<string, { short: string; expanded: string }> = {
  q: { short: "qal", expanded: "qal" },
  N: { short: "niph.", expanded: "niphal" },
  p: { short: "piel", expanded: "piel" },
  P: { short: "pual", expanded: "pual" },
  h: { short: "hiph.", expanded: "hiphil" },
  H: { short: "hoph.", expanded: "hophal" },
  t: { short: "hith.", expanded: "hithpael" },
  // Aramaic stems
  Q: { short: "peal", expanded: "peal" }, // Aramaic qal-equivalent
  o: { short: "polel", expanded: "polel" },
  O: { short: "polal", expanded: "polal" },
  r: { short: "polel", expanded: "polel" },
  m: { short: "piel", expanded: "piel" },
};

const HEBREW_VERB_ASPECT: Record<string, { short: string; expanded: string }> = {
  p: { short: "pf.", expanded: "perfect" },
  q: { short: "impf.", expanded: "imperfect" },
  w: { short: "vc.impf.", expanded: "vav-consecutive imperfect" },
  i: { short: "imv.", expanded: "imperative" },
  v: { short: "vc.pf.", expanded: "vav-consecutive perfect" },
  h: { short: "coh.", expanded: "cohortative" },
  j: { short: "juss.", expanded: "jussive" },
  r: { short: "ptcp.", expanded: "participle" },
  s: { short: "ptcp.pass.", expanded: "passive participle" },
  c: { short: "inf.cstr.", expanded: "infinitive construct" },
  a: { short: "inf.abs.", expanded: "infinitive absolute" },
};

const HEBREW_GENDER: Record<string, { short: string; expanded: string }> = {
  m: { short: "m.", expanded: "masculine" },
  f: { short: "f.", expanded: "feminine" },
  b: { short: "m/f.", expanded: "masculine or feminine" },
  c: { short: "com.", expanded: "common" },
};

const HEBREW_NUMBER: Record<string, { short: string; expanded: string }> = {
  s: { short: "sg.", expanded: "singular" },
  p: { short: "pl.", expanded: "plural" },
  d: { short: "du.", expanded: "dual" },
};

const HEBREW_STATE: Record<string, { short: string; expanded: string }> = {
  a: { short: "abs.", expanded: "absolute" },
  c: { short: "cstr.", expanded: "construct" },
  d: { short: "det.", expanded: "determined" },
};

// Subset of single-segment Hebrew POS-only codes where the entire
// morphology is the POS marker itself (no further fields).
//
// S169 — `c` (lowercase) added per Yoshi live-walk redline 4. STEPBible
// distinguishes plain conjunction `HC` (uppercase — the freestanding ו
// "and") from vav-consecutive `Hc` (lowercase — the ו that flips an
// imperfect to past-tense narrative or a perfect to future / sequential).
// 21,218 source rows carry `Hc/` prefix; without this entry the decoder
// dropped through to raw-emit `Hc + qal vc.impf. 3ms`. The short form
// `consec.` reads tight in the column-stack; the expanded form names
// the construction in full.
const HEBREW_BARE_POS_CODES: Record<string, { short: string; expanded: string }> = {
  C: { short: "conj.", expanded: "conjunction" },
  c: { short: "consec.", expanded: "vav-consecutive" },
  R: { short: "prep.", expanded: "preposition" },
  Rd: { short: "prep. def.", expanded: "preposition + definite" },
  Td: { short: "def.art.", expanded: "definite article" },
  Te: { short: "interr.", expanded: "interrogative particle" },
  Ti: { short: "interj.", expanded: "interjection" },
  Tj: { short: "demon.", expanded: "demonstrative" },
  Tm: { short: "demon.", expanded: "demonstrative" },
  Tn: { short: "neg.", expanded: "negative" },
  To: { short: "obj.", expanded: "object marker" },
  Sp: { short: "suf.", expanded: "possessive suffix" },
  D: { short: "adv.", expanded: "adverb" },
};

/**
 * Decode a Hebrew/Aramaic morphology code (e.g. `HVqp3ms`, `HNcmpa`,
 * `HR/Ncfsa`, `AVqp3ms`) into the short or expanded English register.
 * Splits compound codes on `/` and joins decoded morphemes with ` + `.
 * Returns the raw code unchanged on parse failure (defensive fallback).
 */
function formatHebrewMorphology(
  rawCode: string,
  register: MorphologyRegister,
): string {
  const segments = rawCode.split("/");
  if (segments.length === 0) return rawCode;

  // The first segment carries the H/A language prefix. Subsequent
  // segments are bare codes (no language prefix) that inherit.
  const decoded: string[] = [];
  let anyOk = false;
  for (let i = 0; i < segments.length; i++) {
    const seg = i === 0 ? segments[0] : `H${segments[i]}`;
    const out = decodeOneHebrewSegment(seg, register);
    if (out !== null) {
      decoded.push(out);
      anyOk = true;
    } else {
      decoded.push(segments[i]); // raw fallback for unknown segment
    }
  }
  if (!anyOk) return rawCode;
  return decoded.join(" + ");
}

function decodeOneHebrewSegment(
  seg: string,
  register: MorphologyRegister,
): string | null {
  if (seg.length < 2) return null;
  const lang = seg[0];
  if (lang !== "H" && lang !== "A") return null;
  const rest = seg.slice(1);

  // Bare-POS code (e.g. HC, HR, HTd, HTo, HTn) — look up against the
  // multi-char table; fall back to single-char POS.
  if (HEBREW_BARE_POS_CODES[rest]) {
    return register === "short"
      ? HEBREW_BARE_POS_CODES[rest].short
      : HEBREW_BARE_POS_CODES[rest].expanded;
  }

  const pos = HEBREW_POS[rest[0]];
  if (!pos) return null;

  if (rest[0] === "V") {
    return decodeHebrewVerb(rest.slice(1), register, lang);
  }

  if (rest[0] === "N") {
    return decodeHebrewNoun(rest.slice(1), register, pos);
  }

  if (rest[0] === "A") {
    return decodeHebrewAdjective(rest.slice(1), register, pos);
  }

  if (rest[0] === "P") {
    return decodeHebrewPronoun(rest.slice(1), register, pos);
  }

  if (rest[0] === "S") {
    return decodeHebrewSuffix(rest.slice(1), register, pos);
  }

  // Single-letter POS, no further fields decoded.
  return register === "short" ? pos.short : pos.expanded;
}

function decodeHebrewVerb(
  rest: string,
  register: MorphologyRegister,
  lang: string,
): string {
  // Verb form: stem(1) aspect(1) [person(1)] [gender(1)] [number(1)]
  // Examples: qp3ms (qal perf 3ms), Vqp3fp, Hi2ms, hh2mp
  if (rest.length === 0) return register === "short" ? "v." : "verb";
  const stem = HEBREW_VERB_STEM[rest[0]];
  const aspect = rest.length >= 2 ? HEBREW_VERB_ASPECT[rest[1]] : null;
  if (!stem || !aspect) {
    return register === "short" ? "v." : "verb";
  }
  const stemStr = register === "short" ? stem.short : stem.expanded;
  const aspectStr = register === "short" ? aspect.short : aspect.expanded;
  // Aramaic peal/peil get an "Aram." marker in expanded register.
  const langMark =
    lang === "A"
      ? register === "short"
        ? "Aram. "
        : "Aramaic "
      : "";

  let person: string | null = null;
  let gender: { short: string; expanded: string } | null = null;
  let number: { short: string; expanded: string } | null = null;
  const tail = rest.slice(2);
  if (tail.length >= 1 && /^[123]/.test(tail)) {
    person = tail[0];
    if (tail.length >= 2) gender = HEBREW_GENDER[tail[1]] || null;
    if (tail.length >= 3) number = HEBREW_NUMBER[tail[2]] || null;
  } else if (tail.length >= 1) {
    // Participle / infinitive: gender + number, no person
    gender = HEBREW_GENDER[tail[0]] || null;
    if (tail.length >= 2) number = HEBREW_NUMBER[tail[1]] || null;
  }

  if (register === "short") {
    const personGenderNumber = [
      person ? `${person}${gender ? gender.short[0] : ""}${number ? number.short[0] : ""}` : null,
      person ? null : gender?.short,
      person ? null : number?.short,
    ]
      .filter(Boolean)
      .join("");
    return `${langMark}${stemStr} ${aspectStr}${personGenderNumber ? " " + personGenderNumber : ""}`.trim();
  }
  // Expanded
  const pnStr = person
    ? `${person === "1" ? "1st" : person === "2" ? "2nd" : "3rd"}${gender ? " " + gender.expanded : ""}${number ? " " + number.expanded : ""}`
    : [gender?.expanded, number?.expanded].filter(Boolean).join(" ");
  const head = `${langMark}${stemStr} ${aspectStr}`;
  return pnStr ? `${head}, ${pnStr}` : head;
}

function decodeHebrewNoun(
  rest: string,
  register: MorphologyRegister,
  pos: { short: string; expanded: string },
): string {
  // Noun form: form(c/p) gender(m/f/b/c) number(s/p/d) state(a/c/d)
  // Examples: Ncmpa, Ncfsa, Ncfsc, Npmsa (proper noun masc sg abs)
  if (rest.length === 0) return register === "short" ? pos.short : pos.expanded;
  const form = rest[0];
  const formStr =
    form === "p"
      ? register === "short"
        ? "pr."
        : "proper"
      : form === "c"
        ? register === "short"
          ? "com."
          : "common"
        : "";
  const gender = rest.length >= 2 ? HEBREW_GENDER[rest[1]] : null;
  const number = rest.length >= 3 ? HEBREW_NUMBER[rest[2]] : null;
  const state = rest.length >= 4 ? HEBREW_STATE[rest[3]] : null;
  if (register === "short") {
    return [
      pos.short,
      formStr,
      gender?.short,
      number?.short,
      state?.short,
    ]
      .filter(Boolean)
      .join(" ");
  }
  return [
    pos.expanded,
    formStr,
    gender?.expanded,
    number?.expanded,
    state?.expanded,
  ]
    .filter(Boolean)
    .join(" ");
}

function decodeHebrewAdjective(
  rest: string,
  register: MorphologyRegister,
  pos: { short: string; expanded: string },
): string {
  // Adjective form: gender(m/f) number(s/p) state(a/c/d)
  const gender = rest.length >= 1 ? HEBREW_GENDER[rest[0]] : null;
  const number = rest.length >= 2 ? HEBREW_NUMBER[rest[1]] : null;
  const state = rest.length >= 3 ? HEBREW_STATE[rest[2]] : null;
  if (register === "short") {
    return [pos.short, gender?.short, number?.short, state?.short]
      .filter(Boolean)
      .join(" ");
  }
  return [pos.expanded, gender?.expanded, number?.expanded, state?.expanded]
    .filter(Boolean)
    .join(" ");
}

function decodeHebrewPronoun(
  rest: string,
  register: MorphologyRegister,
  pos: { short: string; expanded: string },
): string {
  // Pronoun form: type(p=personal/x=demonstrative/...) person(1/2/3)
  // gender(m/f/c) number(s/p)
  // Examples: Pp3ms (personal 3ms), Pi (interrogative)
  if (rest.length === 0) return register === "short" ? pos.short : pos.expanded;
  const tail = rest.slice(1);
  let person: string | null = null;
  let gender: { short: string; expanded: string } | null = null;
  let number: { short: string; expanded: string } | null = null;
  if (tail.length >= 1 && /^[123]/.test(tail)) {
    person = tail[0];
    if (tail.length >= 2) gender = HEBREW_GENDER[tail[1]] || null;
    if (tail.length >= 3) number = HEBREW_NUMBER[tail[2]] || null;
  }
  if (register === "short") {
    return [
      pos.short,
      person ? `${person}${gender ? gender.short[0] : ""}${number ? number.short[0] : ""}` : null,
    ]
      .filter(Boolean)
      .join(" ");
  }
  const pnStr = person
    ? `${person === "1" ? "1st" : person === "2" ? "2nd" : "3rd"}${gender ? " " + gender.expanded : ""}${number ? " " + number.expanded : ""}`
    : "";
  return pnStr ? `${pos.expanded}, ${pnStr}` : pos.expanded;
}

function decodeHebrewSuffix(
  rest: string,
  register: MorphologyRegister,
  pos: { short: string; expanded: string },
): string {
  // Possessive/object suffix: person gender number — e.g., Sp3ms
  if (rest.length === 0) return register === "short" ? pos.short : pos.expanded;
  const tail = rest.slice(1);
  let person: string | null = null;
  let gender: { short: string; expanded: string } | null = null;
  let number: { short: string; expanded: string } | null = null;
  if (tail.length >= 1 && /^[123]/.test(tail)) {
    person = tail[0];
    if (tail.length >= 2) gender = HEBREW_GENDER[tail[1]] || null;
    if (tail.length >= 3) number = HEBREW_NUMBER[tail[2]] || null;
  }
  if (register === "short") {
    return [
      pos.short,
      person ? `${person}${gender ? gender.short[0] : ""}${number ? number.short[0] : ""}` : null,
    ]
      .filter(Boolean)
      .join(" ");
  }
  const pnStr = person
    ? `${person === "1" ? "1st" : person === "2" ? "2nd" : "3rd"}${gender ? " " + gender.expanded : ""}${number ? " " + number.expanded : ""}`
    : "";
  return pnStr ? `${pos.expanded}, ${pnStr}` : pos.expanded;
}

// ─────────────────────────────────────────────────────────────────────
// formatMorphology — dispatcher
// ─────────────────────────────────────────────────────────────────────

/**
 * Convert a STEPBible/Robinson raw morphology code to the abbreviated
 * English register (`'short'`, e.g. `aor. act. ind. 3s`) or the
 * fully-written register (`'expanded'`, e.g. `aorist active indicative,
 * 3rd singular`). Hebrew + Greek + Aramaic code dictionaries are
 * inlined above. Unknown raw code returns the raw code unchanged
 * (defensive fallback). Null/empty input returns empty string.
 * Language-mismatch defensive: a Hebrew code passed in a Greek context
 * returns the raw code unchanged.
 */
export function formatMorphology(
  rawCode: string | null | undefined,
  language: InterlinearLanguage | string | null | undefined,
  register: MorphologyRegister = "short",
): string {
  if (rawCode == null || rawCode === "") return "";
  if (language === "greek") {
    // Hebrew/Aramaic codes have shape [HA] + uppercase POS + lowercase
    // sub-field letter (HVqp3ms, HNcmpa, AVqp3ms, etc.). Greek POS
    // codes are all-uppercase before the dash (V-AAI-3S, N-GSM, ADV-I,
    // A-APF). The lowercase 3rd-char discriminator is the cleanest
    // language-mismatch tripwire — defensive without false positives
    // on legitimate Greek A-prefixed POS (Adjective, ADV, AAI tense).
    if (rawCode.length >= 3 && /^[HA][VNACRTPSD][a-z]/.test(rawCode)) {
      return rawCode;
    }
    return formatGreekMorphology(rawCode, register);
  }
  if (language === "hebrew" || language === "aramaic") {
    if (rawCode[0] !== "H" && rawCode[0] !== "A") {
      return rawCode; // language-mismatch defensive (Greek code in Hebrew context)
    }
    return formatHebrewMorphology(rawCode, register);
  }
  return rawCode;
}

// ─────────────────────────────────────────────────────────────────────
// buildInterlinearColumn
// ─────────────────────────────────────────────────────────────────────

/**
 * Assemble the per-word column-data structure ready for render in the
 * InterlinearLayer React component. When the verse_word has a
 * strong_number that joins to a strong_entry, returns the full column
 * with lemma + transliteration + morphology + gloss + surface. When
 * strong_number is null (English filler like "the", "and" not tagged
 * in USFX), returns a surface-only column with lemma/translit/morph/
 * gloss as null and font-stack resolved to the body-text fallback.
 *
 * Morphology decoding is performed at column-build time using the
 * strong_entry's language; the result is { short, expanded } so the
 * render layer can swap registers on the long-press tap without re-
 * decoding.
 */
export function buildInterlinearColumn(
  verseWord: InterlinearVerseWord,
  strongEntry: InterlinearStrongEntry | null,
  fontStackOverride?: string,
): InterlinearColumn {
  if (strongEntry == null) {
    return {
      position: verseWord.position,
      surface: verseWord.surface,
      lemma: null,
      transliteration: null,
      morphology: null,
      gloss: null,
      language: null,
      fontStack: fontStackOverride ?? BODY_FONT_STACK,
    };
  }
  const language = strongEntry.language;
  const fontStack =
    fontStackOverride ?? selectInterlinearFontStack(language);
  let morphology: InterlinearMorphology | null = null;
  if (verseWord.morphology) {
    morphology = {
      short: formatMorphology(verseWord.morphology, language, "short"),
      expanded: formatMorphology(verseWord.morphology, language, "expanded"),
    };
  }
  return {
    position: verseWord.position,
    surface: verseWord.surface,
    lemma: language === "hebrew" || language === "aramaic"
      ? wrapHebrewBidi(strongEntry.lemma)
      : strongEntry.lemma,
    transliteration: strongEntry.transliteration,
    morphology,
    gloss: strongEntry.short_definition,
    language,
    fontStack,
  };
}

// ─────────────────────────────────────────────────────────────────────
// groupVerseColumns
// ─────────────────────────────────────────────────────────────────────

/**
 * Given the verse_words rows for a verse + a map of strong_number →
 * strong_entry, return the per-word interlinear columns in English-flow
 * (verse_words.position) order. Defensive against out-of-order input
 * (sorts by position), duplicate positions (last wins), and verse_words
 * rows whose strong_number doesn't resolve in the map (surface-only
 * column emitted).
 */
export function groupVerseColumns(
  verseWords: InterlinearVerseWord[],
  strongEntries: Map<string, InterlinearStrongEntry>,
): InterlinearColumn[] {
  if (verseWords.length === 0) return [];
  // De-dup by position, last wins.
  const byPosition = new Map<number, InterlinearVerseWord>();
  for (const vw of verseWords) {
    byPosition.set(vw.position, vw);
  }
  const sorted = [...byPosition.values()].sort(
    (a, b) => a.position - b.position,
  );
  return sorted.map((vw) => {
    const entry = vw.strong_number
      ? strongEntries.get(vw.strong_number) ?? null
      : null;
    return buildInterlinearColumn(vw, entry);
  });
}
