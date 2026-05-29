// S167 (§28 — Hebrew & Greek Interlinear) sanity test for
// app/src/lib/interlinear-helpers.ts.
//
// Inlines a JS port of the helpers — the TS module exports types Node can't
// resolve directly under ESM without bundling. Logic mirrors the .ts file
// 1:1; any divergence between this file and the .ts module is a bug.
//
// Per DESIGN_LANGUAGE.md §28 "Helper API + sanity-test surface":
//   - formatMorphology         : Greek POS families (V/N/A/T/P/CONJ/PREP/etc.)
//                                across tense/voice/mood/person/number/gender/
//                                case; Hebrew binyanim (qal/niphal/piel/pual/
//                                hiphil/hophal/hitpael) + Aramaic peal; unknown
//                                code defensive; null/empty defensive; language
//                                mismatch defensive; expanded register
//   - selectInterlinearFontStack: each language returns expected stack;
//                                unknown returns body-text fallback
//   - wrapHebrewBidi          : RTL isolation; niqqud preserved; empty
//                                defensive; Aramaic; LTR passthrough
//   - buildInterlinearColumn  : Hebrew + Greek full strong_entry; null
//                                strong_entry; null morphology; English filler
//   - groupVerseColumns       : in-order; out-of-order sorts; duplicate
//                                position last-wins; missing strong defensive;
//                                empty input
//
// Run with: node _s167_interlinear_sanity.mjs
// Verification target: ≥30 sanity-test cases passing.

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic (port of app/src/lib/interlinear-helpers.ts)
// ─────────────────────────────────────────────────────────────────────

const HEBREW_FONT_STACK = "'SBL Hebrew', 'Ezra SIL', 'Times New Roman', serif";
const GREEK_FONT_STACK = "'SBL BibLit', 'Cardo', 'Times New Roman', serif";
const BODY_FONT_STACK = "inherit";

function selectInterlinearFontStack(language) {
  if (language === "hebrew" || language === "aramaic") return HEBREW_FONT_STACK;
  if (language === "greek") return GREEK_FONT_STACK;
  return BODY_FONT_STACK;
}

const RTL_ISOLATE_START = "⁨";
const RTL_ISOLATE_END = "⁩";

function wrapHebrewBidi(lemma) {
  if (!lemma) return "";
  return `${RTL_ISOLATE_START}${lemma}${RTL_ISOLATE_END}`;
}

const GREEK_POS = {
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
const GREEK_TENSE = {
  P: { short: "pres.", expanded: "present" },
  I: { short: "impf.", expanded: "imperfect" },
  F: { short: "fut.", expanded: "future" },
  A: { short: "aor.", expanded: "aorist" },
  X: { short: "perf.", expanded: "perfect" },
  R: { short: "perf.", expanded: "perfect" },
  L: { short: "plupf.", expanded: "pluperfect" },
};
const GREEK_VOICE = {
  A: { short: "act.", expanded: "active" },
  M: { short: "mid.", expanded: "middle" },
  P: { short: "pass.", expanded: "passive" },
  D: { short: "dep.", expanded: "deponent" },
  N: { short: "m/p dep.", expanded: "middle/passive deponent" },
  O: { short: "m/p.", expanded: "middle or passive" },
  E: { short: "m/p.", expanded: "middle or passive" },
};
const GREEK_MOOD = {
  I: { short: "ind.", expanded: "indicative" },
  S: { short: "subj.", expanded: "subjunctive" },
  O: { short: "opt.", expanded: "optative" },
  M: { short: "imv.", expanded: "imperative" },
  N: { short: "inf.", expanded: "infinitive" },
  P: { short: "ptcp.", expanded: "participle" },
};
const GREEK_CASE = {
  N: { short: "nom.", expanded: "nominative" },
  G: { short: "gen.", expanded: "genitive" },
  D: { short: "dat.", expanded: "dative" },
  A: { short: "acc.", expanded: "accusative" },
  V: { short: "voc.", expanded: "vocative" },
};
const GREEK_GENDER = {
  M: { short: "masc.", expanded: "masculine" },
  F: { short: "fem.", expanded: "feminine" },
  N: { short: "neut.", expanded: "neuter" },
};
const GREEK_NUMBER = {
  S: { short: "sg.", expanded: "singular" },
  P: { short: "pl.", expanded: "plural" },
  D: { short: "dual", expanded: "dual" },
};
const GREEK_EXTRAS_EXPANDED = {
  P: "proper", L: "location", T: "title", G: "gentilic",
  LG: "location gentilic", PG: "person gentilic", TG: "title gentilic",
  C: "comparative", S: "superlative", NUI: "numeral",
  PRI: "proper indeclinable", LI: "letter indeclinable", ATT: "Attic",
};

function parseCaseNumberGender(seg, register) {
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

function formatExtras(rawCode, pos, extra, register, current) {
  const base = current ?? (register === "short" ? pos.short : pos.expanded);
  if (register === "short") {
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

function formatGreekVerb(rawCode, parts, register) {
  if (parts.length < 2) return rawCode;
  let tvm = parts[1];
  let secondForm = false;
  if (tvm.startsWith("2")) { secondForm = true; tvm = tvm.slice(1); }
  if (tvm.length < 3) return rawCode;
  const tense = GREEK_TENSE[tvm[0]];
  const voice = GREEK_VOICE[tvm[1]];
  const mood = GREEK_MOOD[tvm[2]];
  if (!tense || !voice || !mood) return rawCode;
  let tail = "";
  if (parts.length >= 3) {
    const t = parts[2];
    if (tvm[2] === "P") {
      const cng = parseCaseNumberGender(t, register);
      if (cng) tail = cng;
    } else if (tvm[2] === "N") {
      tail = "";
    } else if (t.length >= 2 && /^[123]/.test(t)) {
      const person = t[0];
      const number = GREEK_NUMBER[t[1]];
      if (number) {
        tail = register === "short"
          ? `${person}${number.short.replace(".", "")}`.replace(/sg$/, "s").replace(/pl$/, "p").replace(/dual$/, "d")
          : `${person === "1" ? "1st" : person === "2" ? "2nd" : "3rd"} ${number.expanded}`;
      }
    }
  }
  const tenseStr = register === "short" ? tense.short : tense.expanded;
  const voiceStr = register === "short" ? voice.short : voice.expanded;
  const moodStr = register === "short" ? mood.short : mood.expanded;
  const secondStr = secondForm ? "2nd " : "";
  if (register === "short") {
    return [secondStr + tenseStr, voiceStr, moodStr, tail].filter(Boolean).join(" ").trim();
  }
  const head = `${secondStr}${tenseStr} ${voiceStr} ${moodStr}`.trim();
  return tail ? `${head}, ${tail}` : head;
}

function formatGreekMorphology(rawCode, register) {
  const code = rawCode.replace(/^G:/, "");
  const parts = code.split("-");
  if (parts.length === 0 || parts[0] === "") return rawCode;
  const head = parts[0];
  if (head.length > 1 && GREEK_POS[head]) {
    const pos = GREEK_POS[head];
    const tail = parts.slice(1).join("-");
    if (!tail) return register === "short" ? pos.short : pos.expanded;
    return formatExtras(rawCode, pos, tail, register);
  }
  const pos = GREEK_POS[head];
  if (!pos) return rawCode;
  if (head === "V") return formatGreekVerb(rawCode, parts, register);
  if (parts.length < 2) return register === "short" ? pos.short : pos.expanded;
  let person = null;
  let coreSeg = parts[1];
  if ((head === "P" || head === "S") && /^[123]/.test(coreSeg)) {
    person = coreSeg[0];
    coreSeg = coreSeg.slice(1);
  }
  const core = parseCaseNumberGender(coreSeg, register);
  if (!core) return register === "short" ? pos.short : pos.expanded;
  let result = (register === "short" ? pos.short : pos.expanded) + " " + core;
  if (person) {
    const personStr = register === "short"
      ? person + "p."
      : person === "1" ? "1st person" : person === "2" ? "2nd person" : "3rd person";
    result = (register === "short" ? pos.short : pos.expanded) + " " + personStr + " " + core;
  }
  if (parts.length > 2) {
    return formatExtras(rawCode, pos, parts.slice(2).join("-"), register, result);
  }
  return result;
}

const HEBREW_POS = {
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
const HEBREW_VERB_STEM = {
  q: { short: "qal", expanded: "qal" },
  N: { short: "niph.", expanded: "niphal" },
  p: { short: "piel", expanded: "piel" },
  P: { short: "pual", expanded: "pual" },
  h: { short: "hiph.", expanded: "hiphil" },
  H: { short: "hoph.", expanded: "hophal" },
  t: { short: "hith.", expanded: "hithpael" },
  Q: { short: "peal", expanded: "peal" },
  o: { short: "polel", expanded: "polel" },
  O: { short: "polal", expanded: "polal" },
  r: { short: "polel", expanded: "polel" },
  m: { short: "piel", expanded: "piel" },
};
const HEBREW_VERB_ASPECT = {
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
const HEBREW_GENDER = {
  m: { short: "m.", expanded: "masculine" },
  f: { short: "f.", expanded: "feminine" },
  b: { short: "m/f.", expanded: "masculine or feminine" },
  c: { short: "com.", expanded: "common" },
};
const HEBREW_NUMBER = {
  s: { short: "sg.", expanded: "singular" },
  p: { short: "pl.", expanded: "plural" },
  d: { short: "du.", expanded: "dual" },
};
const HEBREW_STATE = {
  a: { short: "abs.", expanded: "absolute" },
  c: { short: "cstr.", expanded: "construct" },
  d: { short: "det.", expanded: "determined" },
};
const HEBREW_BARE_POS_CODES = {
  C: { short: "conj.", expanded: "conjunction" },
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

function decodeHebrewVerb(rest, register, lang) {
  if (rest.length === 0) return register === "short" ? "v." : "verb";
  const stem = HEBREW_VERB_STEM[rest[0]];
  const aspect = rest.length >= 2 ? HEBREW_VERB_ASPECT[rest[1]] : null;
  if (!stem || !aspect) return register === "short" ? "v." : "verb";
  const stemStr = register === "short" ? stem.short : stem.expanded;
  const aspectStr = register === "short" ? aspect.short : aspect.expanded;
  const langMark = lang === "A" ? (register === "short" ? "Aram. " : "Aramaic ") : "";
  let person = null, gender = null, number = null;
  const tail = rest.slice(2);
  if (tail.length >= 1 && /^[123]/.test(tail)) {
    person = tail[0];
    if (tail.length >= 2) gender = HEBREW_GENDER[tail[1]] || null;
    if (tail.length >= 3) number = HEBREW_NUMBER[tail[2]] || null;
  } else if (tail.length >= 1) {
    gender = HEBREW_GENDER[tail[0]] || null;
    if (tail.length >= 2) number = HEBREW_NUMBER[tail[1]] || null;
  }
  if (register === "short") {
    const pgn = [
      person ? `${person}${gender ? gender.short[0] : ""}${number ? number.short[0] : ""}` : null,
      person ? null : gender?.short,
      person ? null : number?.short,
    ].filter(Boolean).join("");
    return `${langMark}${stemStr} ${aspectStr}${pgn ? " " + pgn : ""}`.trim();
  }
  const pnStr = person
    ? `${person === "1" ? "1st" : person === "2" ? "2nd" : "3rd"}${gender ? " " + gender.expanded : ""}${number ? " " + number.expanded : ""}`
    : [gender?.expanded, number?.expanded].filter(Boolean).join(" ");
  const head = `${langMark}${stemStr} ${aspectStr}`;
  return pnStr ? `${head}, ${pnStr}` : head;
}

function decodeHebrewNoun(rest, register, pos) {
  if (rest.length === 0) return register === "short" ? pos.short : pos.expanded;
  const form = rest[0];
  const formStr = form === "p"
    ? (register === "short" ? "pr." : "proper")
    : form === "c"
      ? (register === "short" ? "com." : "common")
      : "";
  const gender = rest.length >= 2 ? HEBREW_GENDER[rest[1]] : null;
  const number = rest.length >= 3 ? HEBREW_NUMBER[rest[2]] : null;
  const state = rest.length >= 4 ? HEBREW_STATE[rest[3]] : null;
  if (register === "short") {
    return [pos.short, formStr, gender?.short, number?.short, state?.short]
      .filter(Boolean).join(" ");
  }
  return [pos.expanded, formStr, gender?.expanded, number?.expanded, state?.expanded]
    .filter(Boolean).join(" ");
}

function decodeHebrewAdjective(rest, register, pos) {
  const gender = rest.length >= 1 ? HEBREW_GENDER[rest[0]] : null;
  const number = rest.length >= 2 ? HEBREW_NUMBER[rest[1]] : null;
  const state = rest.length >= 3 ? HEBREW_STATE[rest[2]] : null;
  if (register === "short") {
    return [pos.short, gender?.short, number?.short, state?.short]
      .filter(Boolean).join(" ");
  }
  return [pos.expanded, gender?.expanded, number?.expanded, state?.expanded]
    .filter(Boolean).join(" ");
}

function decodeHebrewPronoun(rest, register, pos) {
  if (rest.length === 0) return register === "short" ? pos.short : pos.expanded;
  const tail = rest.slice(1);
  let person = null, gender = null, number = null;
  if (tail.length >= 1 && /^[123]/.test(tail)) {
    person = tail[0];
    if (tail.length >= 2) gender = HEBREW_GENDER[tail[1]] || null;
    if (tail.length >= 3) number = HEBREW_NUMBER[tail[2]] || null;
  }
  if (register === "short") {
    return [pos.short, person ? `${person}${gender ? gender.short.replace(".", "") : ""}${number ? number.short.replace(".", "") : ""}` : null]
      .filter(Boolean).join(" ");
  }
  const pnStr = person
    ? `${person === "1" ? "1st" : person === "2" ? "2nd" : "3rd"}${gender ? " " + gender.expanded : ""}${number ? " " + number.expanded : ""}`
    : "";
  return pnStr ? `${pos.expanded}, ${pnStr}` : pos.expanded;
}

function decodeHebrewSuffix(rest, register, pos) {
  if (rest.length === 0) return register === "short" ? pos.short : pos.expanded;
  const tail = rest.slice(1);
  let person = null, gender = null, number = null;
  if (tail.length >= 1 && /^[123]/.test(tail)) {
    person = tail[0];
    if (tail.length >= 2) gender = HEBREW_GENDER[tail[1]] || null;
    if (tail.length >= 3) number = HEBREW_NUMBER[tail[2]] || null;
  }
  if (register === "short") {
    return [pos.short, person ? `${person}${gender ? gender.short.replace(".", "") : ""}${number ? number.short.replace(".", "") : ""}` : null]
      .filter(Boolean).join(" ");
  }
  const pnStr = person
    ? `${person === "1" ? "1st" : person === "2" ? "2nd" : "3rd"}${gender ? " " + gender.expanded : ""}${number ? " " + number.expanded : ""}`
    : "";
  return pnStr ? `${pos.expanded}, ${pnStr}` : pos.expanded;
}

function decodeOneHebrewSegment(seg, register) {
  if (seg.length < 2) return null;
  const lang = seg[0];
  if (lang !== "H" && lang !== "A") return null;
  const rest = seg.slice(1);
  if (HEBREW_BARE_POS_CODES[rest]) {
    return register === "short"
      ? HEBREW_BARE_POS_CODES[rest].short
      : HEBREW_BARE_POS_CODES[rest].expanded;
  }
  const pos = HEBREW_POS[rest[0]];
  if (!pos) return null;
  if (rest[0] === "V") return decodeHebrewVerb(rest.slice(1), register, lang);
  if (rest[0] === "N") return decodeHebrewNoun(rest.slice(1), register, pos);
  if (rest[0] === "A") return decodeHebrewAdjective(rest.slice(1), register, pos);
  if (rest[0] === "P") return decodeHebrewPronoun(rest.slice(1), register, pos);
  if (rest[0] === "S") return decodeHebrewSuffix(rest.slice(1), register, pos);
  return register === "short" ? pos.short : pos.expanded;
}

function formatHebrewMorphology(rawCode, register) {
  const segments = rawCode.split("/");
  if (segments.length === 0) return rawCode;
  const decoded = [];
  let anyOk = false;
  for (let i = 0; i < segments.length; i++) {
    const seg = i === 0 ? segments[0] : `H${segments[i]}`;
    const out = decodeOneHebrewSegment(seg, register);
    if (out !== null) { decoded.push(out); anyOk = true; }
    else decoded.push(segments[i]);
  }
  if (!anyOk) return rawCode;
  return decoded.join(" + ");
}

function formatMorphology(rawCode, language, register = "short") {
  if (rawCode == null || rawCode === "") return "";
  if (language === "greek") {
    if (rawCode.length >= 3 && /^[HA][VNACRTPSD][a-z]/.test(rawCode)) return rawCode;
    return formatGreekMorphology(rawCode, register);
  }
  if (language === "hebrew" || language === "aramaic") {
    if (rawCode[0] !== "H" && rawCode[0] !== "A") return rawCode;
    return formatHebrewMorphology(rawCode, register);
  }
  return rawCode;
}

function buildInterlinearColumn(verseWord, strongEntry, fontStackOverride) {
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
  const fontStack = fontStackOverride ?? selectInterlinearFontStack(language);
  let morphology = null;
  if (verseWord.morphology) {
    morphology = {
      short: formatMorphology(verseWord.morphology, language, "short"),
      expanded: formatMorphology(verseWord.morphology, language, "expanded"),
    };
  }
  return {
    position: verseWord.position,
    surface: verseWord.surface,
    lemma: (language === "hebrew" || language === "aramaic")
      ? wrapHebrewBidi(strongEntry.lemma)
      : strongEntry.lemma,
    transliteration: strongEntry.transliteration,
    morphology,
    gloss: strongEntry.short_definition,
    language,
    fontStack,
  };
}

function groupVerseColumns(verseWords, strongEntries) {
  if (verseWords.length === 0) return [];
  const byPosition = new Map();
  for (const vw of verseWords) byPosition.set(vw.position, vw);
  const sorted = [...byPosition.values()].sort((a, b) => a.position - b.position);
  return sorted.map((vw) => {
    const entry = vw.strong_number ? strongEntries.get(vw.strong_number) ?? null : null;
    return buildInterlinearColumn(vw, entry);
  });
}

// ─────────────────────────────────────────────────────────────────────
// Test harness
// ─────────────────────────────────────────────────────────────────────

let pass = 0, fail = 0;
const fails = [];

function eq(actual, expected, label) {
  const same = JSON.stringify(actual) === JSON.stringify(expected);
  if (same) pass++;
  else { fail++; fails.push({ label, actual, expected }); }
}

// ─────────────────────────────────────────────────────────────────────
// formatMorphology — Greek
// ─────────────────────────────────────────────────────────────────────

// (1) Verb — aorist active indicative 3sg (γεννάω → ἐγέννησεν, "begat")
eq(formatMorphology("V-AAI-3S", "greek", "short"), "aor. act. ind. 3s", "G1");
// (2) Verb — same code, expanded
eq(formatMorphology("V-AAI-3S", "greek", "expanded"),
  "aorist active indicative, 3rd singular", "G2");
// (3) Verb — present active indicative 1pl
eq(formatMorphology("V-PAI-1P", "greek", "short"), "pres. act. ind. 1p", "G3");
// (4) Verb — 2nd aorist active indicative 3sg
eq(formatMorphology("V-2AAI-3S", "greek", "short"), "2nd aor. act. ind. 3s", "G4");
// (5) Verb — participle (present active participle nom sg masc)
eq(formatMorphology("V-PAP-NSM", "greek", "short"),
  "pres. act. ptcp. nom. sg. masc.", "G5");
// (6) Verb — infinitive (aorist active infinitive)
eq(formatMorphology("V-AAN", "greek", "short"), "aor. act. inf.", "G6");
// (7) Noun — genitive singular masculine ("of David" — G1138)
eq(formatMorphology("N-GSM", "greek", "short"), "n. gen. sg. masc.", "G7");
// (8) Noun proper — accusative singular masculine (-P suffix on Mat 1:1)
eq(formatMorphology("N-ASM-P", "greek", "expanded"),
  "noun accusative singular masculine proper", "G8");
// (9) Article — accusative singular masculine (G3588 τὸν)
eq(formatMorphology("T-ASM", "greek", "short"), "art. acc. sg. masc.", "G9");
// (10) Adjective — accusative plural feminine
eq(formatMorphology("A-APF", "greek", "short"), "adj. acc. pl. fem.", "G10");
// (11) Personal pronoun — genitive singular masculine (αὐτοῦ)
eq(formatMorphology("P-GSM", "greek", "short"), "pron. gen. sg. masc.", "G11");
// (12) Personal pronoun with person prefix — 1st person genitive singular
eq(formatMorphology("P-1GS", "greek", "short"), "pron. 1p. gen. sg.", "G12");
// (13) Single POS — CONJ
eq(formatMorphology("CONJ", "greek", "short"), "conj.", "G13");
// (14) Single POS — PREP
eq(formatMorphology("PREP", "greek", "expanded"), "preposition", "G14");
// (15) Single POS with negative — PRT-N
eq(formatMorphology("PRT-N", "greek", "short"), "prt. neg.", "G15");
// (16) Adverb interrogative — ADV-I
eq(formatMorphology("ADV-I", "greek", "expanded"), "adverb interrogative", "G16");

// ─────────────────────────────────────────────────────────────────────
// formatMorphology — Hebrew
// ─────────────────────────────────────────────────────────────────────

// (17) Verb — qal perfect 3ms (בָּרָא at Gen 1:1)
eq(formatMorphology("HVqp3ms", "hebrew", "short"), "qal pf. 3ms", "H1");
// (18) Same, expanded
eq(formatMorphology("HVqp3ms", "hebrew", "expanded"),
  "qal perfect, 3rd masculine singular", "H2");
// (19) Verb — niphal imperfect 3fs
eq(formatMorphology("HVNq3fs", "hebrew", "short"), "niph. impf. 3fs", "H3");
// (20) Verb — piel perfect 3ms
eq(formatMorphology("HVpp3ms", "hebrew", "short"), "piel pf. 3ms", "H4");
// (21) Verb — hiphil imperfect 3ms
eq(formatMorphology("HVhq3ms", "hebrew", "short"), "hiph. impf. 3ms", "H5");
// (22) Verb — hithpael perfect 3ms
eq(formatMorphology("HVtp3ms", "hebrew", "short"), "hith. pf. 3ms", "H6");
// (23) Verb — pual perfect 3ms
eq(formatMorphology("HVPp3ms", "hebrew", "short"), "pual pf. 3ms", "H7");
// (24) Verb — hophal perfect 3ms
eq(formatMorphology("HVHp3ms", "hebrew", "short"), "hoph. pf. 3ms", "H8");
// (25) Noun — common masculine plural absolute (אֱלֹהִים at Gen 1:1)
eq(formatMorphology("HNcmpa", "hebrew", "short"),
  "n. com. m. pl. abs.", "H9");
// (26) Noun — common feminine singular absolute (רֵאשִׁית at Gen 1:1)
eq(formatMorphology("HNcfsa", "hebrew", "expanded"),
  "noun common feminine singular absolute", "H10");
// (27) Compound — preposition + common-fem-sg-abs (HR/Ncfsa)
eq(formatMorphology("HR/Ncfsa", "hebrew", "short"),
  "prep. + n. com. f. sg. abs.", "H11");
// (28) Compound — conjunction + object-marker (HC/To)
eq(formatMorphology("HC/To", "hebrew", "short"), "conj. + obj.", "H12");
// (29) Compound — definite article + common-masc-pl-abs (HTd/Ncmpa)
eq(formatMorphology("HTd/Ncmpa", "hebrew", "short"),
  "def.art. + n. com. m. pl. abs.", "H13");
// (30) Bare POS — object marker (HTo — אֵת)
eq(formatMorphology("HTo", "hebrew", "expanded"), "object marker", "H14");
// (31) Bare POS — conjunction (HC — וְ)
eq(formatMorphology("HC", "hebrew", "short"), "conj.", "H15");
// (32) Aramaic verb — peal perfect 3ms (Dan 2:4b–7:28 territory)
eq(formatMorphology("AVQp3ms", "aramaic", "short"), "Aram. peal pf. 3ms", "A1");

// ─────────────────────────────────────────────────────────────────────
// formatMorphology — defensive
// ─────────────────────────────────────────────────────────────────────

// (33) Unknown raw code returns raw unchanged
eq(formatMorphology("XYZZY-FOO", "greek", "short"), "XYZZY-FOO", "D1");
// (34) Null / empty raw code returns empty string
eq(formatMorphology(null, "greek", "short"), "", "D2");
eq(formatMorphology("", "hebrew", "short"), "", "D3");
// (35) Language mismatch — Hebrew code in Greek context returns raw
eq(formatMorphology("HNcmpa", "greek", "short"), "HNcmpa", "D4");
// (36) Language mismatch — Greek code in Hebrew context returns raw
eq(formatMorphology("V-AAI-3S", "hebrew", "short"), "V-AAI-3S", "D5");

// ─────────────────────────────────────────────────────────────────────
// selectInterlinearFontStack
// ─────────────────────────────────────────────────────────────────────

// (37) Hebrew → SBL Hebrew stack
eq(selectInterlinearFontStack("hebrew"), HEBREW_FONT_STACK, "F1");
// (38) Aramaic → SBL Hebrew stack (covers Aramaic per §28)
eq(selectInterlinearFontStack("aramaic"), HEBREW_FONT_STACK, "F2");
// (39) Greek → SBL BibLit stack
eq(selectInterlinearFontStack("greek"), GREEK_FONT_STACK, "F3");
// (40) Unknown → body fallback (never empty per spec)
eq(selectInterlinearFontStack("klingon"), BODY_FONT_STACK, "F4");
eq(selectInterlinearFontStack(null), BODY_FONT_STACK, "F5");

// ─────────────────────────────────────────────────────────────────────
// wrapHebrewBidi
// ─────────────────────────────────────────────────────────────────────

// (41) Hebrew with niqqud wrapped — niqqud preserved within isolation
eq(wrapHebrewBidi("בְּרֵאשִׁית"),
  `${RTL_ISOLATE_START}בְּרֵאשִׁית${RTL_ISOLATE_END}`, "B1");
// (42) Hebrew without niqqud
eq(wrapHebrewBidi("ברא"), `${RTL_ISOLATE_START}ברא${RTL_ISOLATE_END}`, "B2");
// (43) Aramaic lemma
eq(wrapHebrewBidi("מַלְכוּ"),
  `${RTL_ISOLATE_START}מַלְכוּ${RTL_ISOLATE_END}`, "B3");
// (44) Empty defensive
eq(wrapHebrewBidi(""), "", "B4");
eq(wrapHebrewBidi(null), "", "B5");
// (45) Non-RTL passes through (still wrapped — isolation is no-op for LTR)
eq(wrapHebrewBidi("logos"), `${RTL_ISOLATE_START}logos${RTL_ISOLATE_END}`, "B6");

// ─────────────────────────────────────────────────────────────────────
// buildInterlinearColumn
// ─────────────────────────────────────────────────────────────────────

// (46) Hebrew word with full strong_entry populates all fields
{
  const col = buildInterlinearColumn(
    { position: 2, surface: "created", strong_number: "H1254", morphology: "HVqp3ms" },
    { strong_number: "H1254", language: "hebrew", lemma: "בָּרָא",
      transliteration: "bara", short_definition: "to create" },
  );
  eq(col.position, 2, "C1.pos");
  eq(col.surface, "created", "C1.surf");
  eq(col.lemma, `${RTL_ISOLATE_START}בָּרָא${RTL_ISOLATE_END}`, "C1.lemma");
  eq(col.transliteration, "bara", "C1.trans");
  eq(col.morphology?.short, "qal pf. 3ms", "C1.morph.short");
  eq(col.morphology?.expanded,
    "qal perfect, 3rd masculine singular", "C1.morph.expanded");
  eq(col.gloss, "to create", "C1.gloss");
  eq(col.language, "hebrew", "C1.lang");
  eq(col.fontStack, HEBREW_FONT_STACK, "C1.font");
}
// (47) Greek word with full strong_entry — Greek lemma NOT bidi-wrapped
{
  const col = buildInterlinearColumn(
    { position: 7, surface: "son", strong_number: "G5207", morphology: "N-GSM" },
    { strong_number: "G5207", language: "greek", lemma: "υἱός",
      transliteration: "huios", short_definition: "son" },
  );
  eq(col.lemma, "υἱός", "C2.lemma_no_bidi");
  eq(col.morphology?.short, "n. gen. sg. masc.", "C2.morph");
  eq(col.fontStack, GREEK_FONT_STACK, "C2.font");
}
// (48) verse_word with strong_number = null → surface-only column
{
  const col = buildInterlinearColumn(
    { position: 3, surface: "and", strong_number: null, morphology: null },
    null,
  );
  eq(col.lemma, null, "C3.lemma");
  eq(col.transliteration, null, "C3.trans");
  eq(col.morphology, null, "C3.morph");
  eq(col.gloss, null, "C3.gloss");
  eq(col.language, null, "C3.lang");
  eq(col.surface, "and", "C3.surf");
}
// (49) strong_entry present but morphology null → morphology field null
{
  const col = buildInterlinearColumn(
    { position: 5, surface: "the", strong_number: "G3588", morphology: null },
    { strong_number: "G3588", language: "greek", lemma: "ὁ",
      transliteration: "ho", short_definition: "the" },
  );
  eq(col.morphology, null, "C4.morph_null");
  eq(col.lemma, "ὁ", "C4.lemma");
}

// ─────────────────────────────────────────────────────────────────────
// groupVerseColumns
// ─────────────────────────────────────────────────────────────────────

// (50) In-order 3-word verse
{
  const vw = [
    { position: 1, surface: "In", strong_number: "H7225", morphology: "HNcfsa" },
    { position: 2, surface: "beginning", strong_number: "H7225", morphology: "HNcfsa" },
    { position: 3, surface: "created", strong_number: "H1254", morphology: "HVqp3ms" },
  ];
  const entries = new Map([
    ["H7225", { strong_number: "H7225", language: "hebrew", lemma: "רֵאשִׁית",
                transliteration: "reshit", short_definition: "beginning" }],
    ["H1254", { strong_number: "H1254", language: "hebrew", lemma: "בָּרָא",
                transliteration: "bara", short_definition: "to create" }],
  ]);
  const cols = groupVerseColumns(vw, entries);
  eq(cols.length, 3, "GV1.len");
  eq(cols.map(c => c.position), [1, 2, 3], "GV1.order");
}
// (51) Out-of-order input sorts by position
{
  const vw = [
    { position: 3, surface: "c", strong_number: null, morphology: null },
    { position: 1, surface: "a", strong_number: null, morphology: null },
    { position: 2, surface: "b", strong_number: null, morphology: null },
  ];
  const cols = groupVerseColumns(vw, new Map());
  eq(cols.map(c => c.surface), ["a", "b", "c"], "GV2.sort");
}
// (52) Duplicate position — last wins
{
  const vw = [
    { position: 1, surface: "first", strong_number: null, morphology: null },
    { position: 1, surface: "last", strong_number: null, morphology: null },
  ];
  const cols = groupVerseColumns(vw, new Map());
  eq(cols.length, 1, "GV3.dedupe");
  eq(cols[0].surface, "last", "GV3.last_wins");
}
// (53) Missing strong_entry in map → surface-only column emitted
{
  const vw = [
    { position: 1, surface: "x", strong_number: "G9999", morphology: "N-NSM" },
  ];
  const cols = groupVerseColumns(vw, new Map());
  eq(cols[0].lemma, null, "GV4.miss_lemma");
  eq(cols[0].morphology, null, "GV4.miss_morph");
}
// (54) Empty input
eq(groupVerseColumns([], new Map()), [], "GV5.empty");

// ─────────────────────────────────────────────────────────────────────
// Report
// ─────────────────────────────────────────────────────────────────────

const total = pass + fail;
console.log(`\n${pass}/${total} sanity cases passed.`);
if (fails.length) {
  console.log(`\nFailures (${fails.length}):`);
  for (const f of fails) {
    console.log(`  ✗ ${f.label}`);
    console.log(`      actual:   ${JSON.stringify(f.actual)}`);
    console.log(`      expected: ${JSON.stringify(f.expected)}`);
  }
  process.exit(1);
}
console.log("All clean.");
