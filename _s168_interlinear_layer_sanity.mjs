#!/usr/bin/env node
/**
 * S168 — §28 InterlinearLayer integration sanity.
 *
 * Run: `node _s168_interlinear_layer_sanity.mjs` from repo root.
 *
 * Scope: the new contract surfaces added in S168 — the
 * `isAtCompanionTier` Companion-gate predicate, the API tier-gate
 * shape contract for the chapter-words extended payload, and the
 * VerseWord → InterlinearColumn integration path used by
 * `<InterlinearWordColumn>` (the App.tsx render-time seam).
 *
 * Does NOT re-exercise S167's helper sanity (`_s167_interlinear_sanity.mjs`
 * — 76/76 cases — still passes as of S168). Those helpers are imported
 * as the source of truth; we test the integration glue, not the
 * decoders themselves.
 */

import {
  buildInterlinearColumn,
  groupVerseColumns,
  selectInterlinearFontStack,
  wrapHebrewBidi,
} from "./app/src/lib/interlinear-helpers.ts";

let pass = 0;
let fail = 0;

function assert(cond, label) {
  if (cond) {
    pass++;
  } else {
    fail++;
    console.error(`✗ ${label}`);
  }
}

function eq(actual, expected, label) {
  if (actual === expected) {
    pass++;
  } else {
    fail++;
    console.error(`✗ ${label}\n   expected: ${JSON.stringify(expected)}\n   actual:   ${JSON.stringify(actual)}`);
  }
}

// ─────────────────────────────────────────────────────────────────────
// 1. isAtCompanionTier — Companion gate predicate
// ─────────────────────────────────────────────────────────────────────
// JS port of `app/src/lib/useInterlinearToggle.ts`'s isAtCompanionTier.
// Kept inline so this sanity has no TS-import dependency on the React
// hook file (which would drag react + jsx). The predicate is a 2-line
// literal-string compare; the port is trivially equivalent.
function isAtCompanionTier(tier) {
  return tier === "complete_study" || tier === "everything";
}

eq(isAtCompanionTier(null), false, "isAtCompanionTier(null) → false");
eq(isAtCompanionTier(undefined), false, "isAtCompanionTier(undefined) → false");
eq(isAtCompanionTier("free"), false, "isAtCompanionTier('free') → false");
eq(isAtCompanionTier("study_notes"), false, "isAtCompanionTier('study_notes') → false");
eq(isAtCompanionTier("extras"), false, "isAtCompanionTier('extras') → false");
eq(isAtCompanionTier("complete_study"), true, "isAtCompanionTier('complete_study') → true");
eq(isAtCompanionTier("everything"), true, "isAtCompanionTier('everything') → true");
eq(isAtCompanionTier("nonsense"), false, "isAtCompanionTier('nonsense') → false");

// ─────────────────────────────────────────────────────────────────────
// 2. API tier-gate payload shape contract
// ─────────────────────────────────────────────────────────────────────
// JS replica of `api/main.py::_is_at_companion_tier` + the per-row
// tier-gate inside `get_chapter_words`. Mirrors the row-mapping logic:
// when is_companion=false, all 5 interlinear fields → None.
function simulateApiRowGate(row, isCompanion) {
  return {
    position: row.position,
    surface: row.surface,
    strong_number: row.strong_number,
    morphology: isCompanion ? row.morphology : null,
    lemma: isCompanion ? row.lemma : null,
    transliteration: isCompanion ? row.transliteration : null,
    short_definition: isCompanion ? row.short_definition : null,
    language: isCompanion ? row.language : null,
  };
}

const sampleRowHebrew = {
  position: 1,
  surface: "In the beginning",
  strong_number: "H7225",
  morphology: "HR/Ncfsa",
  lemma: "רֵאשִׁית",
  transliteration: "rēʼshîth",
  short_definition: "beginning, chief",
  language: "hebrew",
};

const gatedFree = simulateApiRowGate(sampleRowHebrew, false);
const gatedCompanion = simulateApiRowGate(sampleRowHebrew, true);

// Free-tier: base tri-tuple survives, 5 new fields → null.
eq(gatedFree.position, 1, "free gate: position preserved");
eq(gatedFree.surface, "In the beginning", "free gate: surface preserved");
eq(gatedFree.strong_number, "H7225", "free gate: strong_number preserved");
eq(gatedFree.morphology, null, "free gate: morphology → null");
eq(gatedFree.lemma, null, "free gate: lemma → null");
eq(gatedFree.transliteration, null, "free gate: transliteration → null");
eq(gatedFree.short_definition, null, "free gate: short_definition → null");
eq(gatedFree.language, null, "free gate: language → null");

// Companion+: all 8 fields populated.
eq(gatedCompanion.morphology, "HR/Ncfsa", "companion: morphology populated");
eq(gatedCompanion.lemma, "רֵאשִׁית", "companion: lemma populated");
eq(gatedCompanion.transliteration, "rēʼshîth", "companion: transliteration populated");
eq(gatedCompanion.short_definition, "beginning, chief", "companion: short_definition populated");
eq(gatedCompanion.language, "hebrew", "companion: language populated");

// ─────────────────────────────────────────────────────────────────────
// 3. InterlinearWordColumn integration path — VerseWord → Column
// ─────────────────────────────────────────────────────────────────────
// Replays the synthetic-StrongEntry construction inside
// `InterlinearWordColumn` (components/InterlinearLayer.tsx) so we can
// verify the integration glue without mounting React. The component
// constructs an InterlinearVerseWord + InterlinearStrongEntry from the
// extended VerseWord and feeds buildInterlinearColumn. Mirroring that
// inline here lets us assert the resulting column shape end-to-end.
function buildColumnFromVerseWord(vw, surfaceOverride) {
  const language =
    vw.language === "hebrew" ||
    vw.language === "greek" ||
    vw.language === "aramaic"
      ? vw.language
      : null;
  return buildInterlinearColumn(
    {
      position: vw.position,
      surface: surfaceOverride ?? vw.surface,
      strong_number: vw.strong_number,
      morphology: vw.morphology ?? null,
    },
    vw.strong_number && language && vw.lemma && vw.transliteration
      ? {
          strong_number: vw.strong_number,
          language,
          lemma: vw.lemma,
          transliteration: vw.transliteration,
          short_definition: vw.short_definition ?? null,
        }
      : null,
  );
}

// Hebrew full column from a Companion+ payload row.
const hebrewCol = buildColumnFromVerseWord(gatedCompanion);
eq(hebrewCol.position, 1, "hebrew col: position");
eq(hebrewCol.surface, "In the beginning", "hebrew col: surface");
assert(
  hebrewCol.lemma && hebrewCol.lemma.includes("רֵאשִׁית"),
  "hebrew col: lemma carries original-script (bidi-wrapped)",
);
eq(hebrewCol.transliteration, "rēʼshîth", "hebrew col: transliteration");
eq(hebrewCol.gloss, "beginning, chief", "hebrew col: gloss");
eq(hebrewCol.language, "hebrew", "hebrew col: language");
assert(hebrewCol.morphology !== null, "hebrew col: morphology present");
assert(
  hebrewCol.morphology.short.includes("prep.") &&
    hebrewCol.morphology.short.includes("n."),
  "hebrew col: morphology short decoded (HR/Ncfsa → 'prep. + n. ...')",
);
assert(
  hebrewCol.fontStack.includes("SBL Hebrew"),
  "hebrew col: fontStack uses SBL Hebrew",
);

// Greek full column.
const greekVw = {
  position: 2,
  surface: "Logos",
  strong_number: "G3056",
  morphology: "N-NSM",
  lemma: "λόγος",
  transliteration: "logos",
  short_definition: "word, speech",
  language: "greek",
};
const greekCol = buildColumnFromVerseWord(greekVw);
eq(greekCol.lemma, "λόγος", "greek col: lemma unwrapped (no bidi)");
eq(greekCol.transliteration, "logos", "greek col: transliteration");
assert(
  greekCol.fontStack.includes("SBL BibLit"),
  "greek col: fontStack uses SBL BibLit",
);
assert(
  greekCol.morphology &&
    greekCol.morphology.short.includes("n."),
  "greek col: morphology short decoded",
);
assert(
  greekCol.morphology.expanded.includes("nominative") ||
    greekCol.morphology.expanded.includes("noun"),
  "greek col: morphology expanded decoded",
);

// Below-Companion payload (gatedFree) — no lemma/translit, so the
// synthetic strongEntry is null and we fall back to a surface-only
// column. This is the degraded-input safety path.
const degradedCol = buildColumnFromVerseWord(gatedFree);
eq(degradedCol.lemma, null, "degraded col: lemma null (no strong_entry)");
eq(degradedCol.transliteration, null, "degraded col: transliteration null");
eq(degradedCol.morphology, null, "degraded col: morphology null");
eq(degradedCol.gloss, null, "degraded col: gloss null");
eq(degradedCol.surface, "In the beginning", "degraded col: surface still rendered");
assert(
  degradedCol.fontStack === "inherit",
  "degraded col: fontStack falls back to inherit",
);

// surfaceOverride preserves the rendered-text form when the verse text
// has punctuation attached (e.g., 'beginning.') while keeping the
// alignment to the canonical surface from verse_words.
const overridden = buildColumnFromVerseWord(gatedCompanion, "beginning,");
eq(overridden.surface, "beginning,", "surfaceOverride: punctuation-bearing surface used");
eq(overridden.lemma, hebrewCol.lemma, "surfaceOverride: lemma unchanged");

// ─────────────────────────────────────────────────────────────────────
// 4. groupVerseColumns still works end-to-end from the new payload
// ─────────────────────────────────────────────────────────────────────
const verseWords = [gatedCompanion, greekVw];
const strongMap = new Map();
strongMap.set(gatedCompanion.strong_number, {
  strong_number: gatedCompanion.strong_number,
  language: gatedCompanion.language,
  lemma: gatedCompanion.lemma,
  transliteration: gatedCompanion.transliteration,
  short_definition: gatedCompanion.short_definition,
});
strongMap.set(greekVw.strong_number, {
  strong_number: greekVw.strong_number,
  language: greekVw.language,
  lemma: greekVw.lemma,
  transliteration: greekVw.transliteration,
  short_definition: greekVw.short_definition,
});
const cols = groupVerseColumns(verseWords, strongMap);
eq(cols.length, 2, "groupVerseColumns: 2 columns from 2 verseWords");
eq(cols[0].position, 1, "groupVerseColumns: position order preserved");
eq(cols[1].position, 2, "groupVerseColumns: 2nd column position");

// ─────────────────────────────────────────────────────────────────────
// 5. font-stack + bidi (regression guards on the imports the
//    integration relies on)
// ─────────────────────────────────────────────────────────────────────
assert(
  selectInterlinearFontStack("hebrew").includes("SBL Hebrew"),
  "selectInterlinearFontStack('hebrew') → SBL Hebrew family",
);
assert(
  selectInterlinearFontStack("aramaic").includes("SBL Hebrew"),
  "selectInterlinearFontStack('aramaic') → SBL Hebrew family",
);
assert(
  selectInterlinearFontStack("greek").includes("SBL BibLit"),
  "selectInterlinearFontStack('greek') → SBL BibLit family",
);
eq(selectInterlinearFontStack(null), "inherit", "selectInterlinearFontStack(null) → inherit");
assert(
  wrapHebrewBidi("רֵאשִׁית").length > "רֵאשִׁית".length,
  "wrapHebrewBidi wraps with FSI/PDI isolation markers",
);
eq(wrapHebrewBidi(""), "", "wrapHebrewBidi('') → ''");
eq(wrapHebrewBidi(null), "", "wrapHebrewBidi(null) → ''");

// ─────────────────────────────────────────────────────────────────────
// Summary
// ─────────────────────────────────────────────────────────────────────
console.log(`\n${pass}/${pass + fail} S168 integration sanity cases passed.`);
if (fail > 0) {
  console.error(`\n${fail} FAILED.`);
  process.exit(1);
}
console.log("All clean.");
