// S125 (W6 Search V1 UI) sanity test for app/src/lib/search-helpers.ts.
//
// Inlines a JS port of the helper's logic — the TS module imports
// type-only `PartnerTier` + `VerseSearchHit` from ./api which Node
// can't resolve directly under ESM without bundling. Logic mirrors
// search-helpers.ts 1:1; any divergence between this file and the .ts
// module is a bug.
//
// Boundary cases (per the §23 spec + S121 W2 / W3 / S122 / S123 forward
// standard):
//
//   - empty hit array → empty grouping
//   - single hit → single group of one
//   - multi-hit single-book preserves server order (no client re-sort)
//   - multi-book preserves first-occurrence order
//   - out-of-order book interleaving still groups correctly
//   - empty + whitespace-only query produces a single plain segment
//   - single-token query, case-insensitive match
//   - multi-token query, each token matches independently
//   - overlapping tokens (e.g. "the the") dedup + longest-wins, no
//     infinite loop
//   - tier-lock resolution: anonymous / free / 4 paid tiers × row
//     tier_required of free / study_notes / extras / complete_study /
//     everything
//   - tier-badge label: study_notes → Notes, extras → Library, others
//     → null
//   - formatHitCount pluralization at 0 / 1 / 2 / N
//   - formatTotalSummary across 0 / 1 / 2 / N books
//
// Run with: node _s125_search_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic (port of search-helpers.ts)
// ─────────────────────────────────────────────────────────────────────

function groupResultsByBook(hits) {
  const groups = [];
  const indexBySlug = new Map();
  for (const hit of hits) {
    const existingIdx = indexBySlug.get(hit.book_slug);
    if (existingIdx === undefined) {
      indexBySlug.set(hit.book_slug, groups.length);
      groups.push({
        bookSlug: hit.book_slug,
        bookTitle: hit.book_title,
        hits: [hit],
      });
    } else {
      groups[existingIdx].hits.push(hit);
    }
  }
  return groups;
}

function highlightQueryMatches(text, query) {
  if (!text) return [];
  const tokens = Array.from(
    new Set(
      query
        .toLowerCase()
        .split(/\s+/)
        .filter((t) => t.length > 0),
    ),
  );
  if (tokens.length === 0) {
    return [{ type: "plain", text }];
  }
  const lower = text.toLowerCase();
  const segments = [];
  let cursor = 0;
  let plainStart = 0;
  while (cursor < text.length) {
    let matchedLen = 0;
    for (const token of tokens) {
      if (token.length > matchedLen && lower.startsWith(token, cursor)) {
        matchedLen = token.length;
      }
    }
    if (matchedLen > 0) {
      if (cursor > plainStart) {
        segments.push({ type: "plain", text: text.slice(plainStart, cursor) });
      }
      segments.push({
        type: "match",
        text: text.slice(cursor, cursor + matchedLen),
      });
      cursor += matchedLen;
      plainStart = cursor;
    } else {
      cursor += 1;
    }
  }
  if (plainStart < text.length) {
    segments.push({ type: "plain", text: text.slice(plainStart) });
  }
  return segments;
}

const TIER_LADDER = [
  "free",
  "study_notes",
  "extras",
  "complete_study",
  "everything",
];

function tierRank(tier) {
  if (!tier) return 0;
  const idx = TIER_LADDER.indexOf(tier);
  return idx === -1 ? 0 : idx;
}

function isResultLocked(hit, partnerTier) {
  return tierRank(hit.tier_required) > tierRank(partnerTier);
}

function tierBadgeLabel(tierRequired) {
  if (tierRequired === "study_notes") return "Notes";
  if (tierRequired === "extras") return "Library";
  return null;
}

function formatHitCount(group) {
  const n = group.hits.length;
  return n === 1 ? "1 hit" : `${n} hits`;
}

function formatTotalSummary(groups) {
  const hitCount = groups.reduce((acc, g) => acc + g.hits.length, 0);
  const bookCount = groups.length;
  const hitWord = hitCount === 1 ? "hit" : "hits";
  const bookWord = bookCount === 1 ? "book" : "books";
  return `${hitCount} ${hitWord} across ${bookCount} ${bookWord}`;
}

// ─────────────────────────────────────────────────────────────────────
// Test framework — minimal assert wrapper, prints PASS/FAIL summary
// ─────────────────────────────────────────────────────────────────────

let passed = 0;
let failed = 0;
const failures = [];

function test(name, fn) {
  try {
    fn();
    passed++;
    console.log(`✓ ${name}`);
  } catch (err) {
    failed++;
    failures.push({ name, err });
    console.log(`✗ ${name}`);
    console.log(`  ${err.message}`);
  }
}

function assertEqual(actual, expected, msg) {
  const a = JSON.stringify(actual);
  const e = JSON.stringify(expected);
  if (a !== e) {
    throw new Error(`${msg || "assertEqual"}: expected ${e}, got ${a}`);
  }
}

function assertTrue(cond, msg) {
  if (!cond) throw new Error(msg || "expected true");
}

function assertFalse(cond, msg) {
  if (cond) throw new Error(msg || "expected false");
}

// ─────────────────────────────────────────────────────────────────────
// Fixtures
// ─────────────────────────────────────────────────────────────────────

function hit(verse_id, book_slug, book_title, chapter_number, verse_number, text, similarity, tier_required = "free") {
  return {
    verse_id,
    book_slug,
    book_title,
    chapter_number,
    verse_number,
    text,
    similarity,
    tier_required,
  };
}

const psa23_1 = hit(1, "psalms", "Psalms", 23, 1, "The LORD is my shepherd; I shall not want.", 0.82);
const psa28_9 = hit(2, "psalms", "Psalms", 28, 9, "Save thy people... feed them also, and lift them up for ever.", 0.71);
const psa80_1 = hit(3, "psalms", "Psalms", 80, 1, "Give ear, O Shepherd of Israel.", 0.69);
const joh10_11 = hit(4, "john", "John", 10, 11, "I am the good shepherd: the good shepherd giveth his life for the sheep.", 0.78);
const joh10_14 = hit(5, "john", "John", 10, 14, "I am the good shepherd, and know my sheep.", 0.77);
const eze34_2 = hit(6, "ezekiel", "Ezekiel", 34, 2, "Woe be to the shepherds of Israel that do feed themselves!", 0.64);

// A tier-locked hit fixture — represents a future W10 BDB/Thayer's lemma
// row at extras tier ($4.99 Library). At V1 ship verses.text rows are
// all 'free' so this is synthetic; documented in §23.
const lockedExtras = hit(7, "bdb-headword-shepherd", "BDB: רעה", 1, 1, "ra'ah — to pasture, tend, graze; the shepherd's verb.", 0.85, "extras");
const lockedStudyNotes = hit(8, "synthetic-study-notes", "Synthetic", 1, 1, "Synthetic notes-tier row.", 0.60, "study_notes");

// ─────────────────────────────────────────────────────────────────────
// groupResultsByBook
// ─────────────────────────────────────────────────────────────────────

test("groupResultsByBook: empty input → empty output", () => {
  assertEqual(groupResultsByBook([]), []);
});

test("groupResultsByBook: single hit → single group of one", () => {
  const groups = groupResultsByBook([psa23_1]);
  assertEqual(groups.length, 1);
  assertEqual(groups[0].bookSlug, "psalms");
  assertEqual(groups[0].bookTitle, "Psalms");
  assertEqual(groups[0].hits.length, 1);
  assertEqual(groups[0].hits[0].verse_id, 1);
});

test("groupResultsByBook: multi-hit single book preserves server order", () => {
  const groups = groupResultsByBook([psa23_1, psa28_9, psa80_1]);
  assertEqual(groups.length, 1);
  assertEqual(groups[0].hits.map((h) => h.verse_id), [1, 2, 3]);
});

test("groupResultsByBook: multi-book preserves first-occurrence order", () => {
  // Server order: Psalms first (strongest book match), then John, then Ezekiel.
  const groups = groupResultsByBook([psa23_1, joh10_11, eze34_2, psa28_9, joh10_14, psa80_1]);
  assertEqual(groups.length, 3);
  assertEqual(groups[0].bookSlug, "psalms");
  assertEqual(groups[1].bookSlug, "john");
  assertEqual(groups[2].bookSlug, "ezekiel");
  // Within each group, hits in server order (NOT re-sorted)
  assertEqual(groups[0].hits.map((h) => h.verse_id), [1, 2, 3]);
  assertEqual(groups[1].hits.map((h) => h.verse_id), [4, 5]);
  assertEqual(groups[2].hits.map((h) => h.verse_id), [6]);
});

test("groupResultsByBook: out-of-order book interleaving groups correctly", () => {
  // Same books appear at non-contiguous indices in the input. First-
  // occurrence order should still drive group ordering.
  const groups = groupResultsByBook([eze34_2, psa23_1, eze34_2, joh10_11, psa28_9]);
  assertEqual(groups.length, 3);
  assertEqual(groups[0].bookSlug, "ezekiel"); // first seen
  assertEqual(groups[1].bookSlug, "psalms");
  assertEqual(groups[2].bookSlug, "john");
  assertEqual(groups[0].hits.length, 2); // ezekiel appears twice
  assertEqual(groups[1].hits.length, 2); // psalms appears twice
  assertEqual(groups[2].hits.length, 1);
});

// ─────────────────────────────────────────────────────────────────────
// highlightQueryMatches
// ─────────────────────────────────────────────────────────────────────

test("highlightQueryMatches: empty text → empty segments", () => {
  assertEqual(highlightQueryMatches("", "shepherd"), []);
});

test("highlightQueryMatches: empty query → single plain segment", () => {
  const segs = highlightQueryMatches("The LORD is my shepherd.", "");
  assertEqual(segs, [{ type: "plain", text: "The LORD is my shepherd." }]);
});

test("highlightQueryMatches: whitespace-only query → single plain segment", () => {
  const segs = highlightQueryMatches("The LORD is my shepherd.", "   \t  ");
  assertEqual(segs, [{ type: "plain", text: "The LORD is my shepherd." }]);
});

test("highlightQueryMatches: single-token query, case-insensitive", () => {
  const segs = highlightQueryMatches("The LORD is my shepherd.", "Shepherd");
  assertEqual(segs, [
    { type: "plain", text: "The LORD is my " },
    { type: "match", text: "shepherd" },
    { type: "plain", text: "." },
  ]);
});

test("highlightQueryMatches: no match → single plain segment", () => {
  const segs = highlightQueryMatches("The LORD is my shepherd.", "vineyard");
  assertEqual(segs, [{ type: "plain", text: "The LORD is my shepherd." }]);
});

test("highlightQueryMatches: multi-token query — each token matches independently", () => {
  const segs = highlightQueryMatches("I am the good shepherd, and know my sheep.", "good sheep");
  // Both 'good' and 'sheep' should be marked
  const matchedTexts = segs.filter((s) => s.type === "match").map((s) => s.text);
  assertEqual(matchedTexts, ["good", "sheep"]);
});

test("highlightQueryMatches: overlapping tokens dedup + longest wins", () => {
  // "the the" should dedup to one token; "shepherd" should still match
  // around it. Critical regression: previously the inner-while pattern
  // could infinite-loop on zero-length matches.
  const segs = highlightQueryMatches("The shepherd the shepherd.", "the the shepherd");
  const matchedTexts = segs.filter((s) => s.type === "match").map((s) => s.text);
  // 4 matches: 'The', 'shepherd', 'the', 'shepherd' (longest at each pos)
  assertEqual(matchedTexts, ["The", "shepherd", "the", "shepherd"]);
});

test("highlightQueryMatches: longest-token-wins at each position", () => {
  // 'good' and 'goodshep' — at the start of "goodshep" the longer one should match
  const segs = highlightQueryMatches("goodshepherd", "good goodshep");
  const matchedTexts = segs.filter((s) => s.type === "match").map((s) => s.text);
  assertEqual(matchedTexts, ["goodshep"]);
});

// ─────────────────────────────────────────────────────────────────────
// isResultLocked — 6 partner tiers × 5 row tiers
// ─────────────────────────────────────────────────────────────────────

const TIERS = ["free", "study_notes", "extras", "complete_study", "everything"];

test("isResultLocked: anonymous partner sees free rows unlocked", () => {
  assertFalse(isResultLocked({ tier_required: "free" }, null));
});

test("isResultLocked: anonymous partner sees all paid rows locked", () => {
  for (const t of ["study_notes", "extras", "complete_study", "everything"]) {
    assertTrue(isResultLocked({ tier_required: t }, null), `anonymous should be locked at ${t}`);
  }
});

test("isResultLocked: free partner sees all paid rows locked", () => {
  for (const t of ["study_notes", "extras", "complete_study", "everything"]) {
    assertTrue(isResultLocked({ tier_required: t }, "free"), `free should be locked at ${t}`);
  }
});

test("isResultLocked: study_notes partner unlocked at study_notes + free; locked above", () => {
  assertFalse(isResultLocked({ tier_required: "free" }, "study_notes"));
  assertFalse(isResultLocked({ tier_required: "study_notes" }, "study_notes"));
  assertTrue(isResultLocked({ tier_required: "extras" }, "study_notes"));
  assertTrue(isResultLocked({ tier_required: "complete_study" }, "study_notes"));
  assertTrue(isResultLocked({ tier_required: "everything" }, "study_notes"));
});

test("isResultLocked: extras partner unlocked at extras-and-below; locked above", () => {
  assertFalse(isResultLocked({ tier_required: "free" }, "extras"));
  assertFalse(isResultLocked({ tier_required: "study_notes" }, "extras"));
  assertFalse(isResultLocked({ tier_required: "extras" }, "extras"));
  assertTrue(isResultLocked({ tier_required: "complete_study" }, "extras"));
  assertTrue(isResultLocked({ tier_required: "everything" }, "extras"));
});

test("isResultLocked: complete_study partner unlocked at complete_study-and-below; locked at everything", () => {
  for (const t of ["free", "study_notes", "extras", "complete_study"]) {
    assertFalse(isResultLocked({ tier_required: t }, "complete_study"));
  }
  assertTrue(isResultLocked({ tier_required: "everything" }, "complete_study"));
});

test("isResultLocked: everything partner unlocked at every row", () => {
  for (const t of TIERS) {
    assertFalse(isResultLocked({ tier_required: t }, "everything"), `everything should be unlocked at ${t}`);
  }
});

// ─────────────────────────────────────────────────────────────────────
// tierBadgeLabel
// ─────────────────────────────────────────────────────────────────────

test("tierBadgeLabel: study_notes → Notes", () => {
  assertEqual(tierBadgeLabel("study_notes"), "Notes");
});

test("tierBadgeLabel: extras → Library", () => {
  assertEqual(tierBadgeLabel("extras"), "Library");
});

test("tierBadgeLabel: free → null (no badge)", () => {
  assertEqual(tierBadgeLabel("free"), null);
});

test("tierBadgeLabel: complete_study + everything → null (higher tiers invisible per S118)", () => {
  assertEqual(tierBadgeLabel("complete_study"), null);
  assertEqual(tierBadgeLabel("everything"), null);
});

test("tierBadgeLabel: unknown value → null (defensive)", () => {
  assertEqual(tierBadgeLabel("unknown_tier_value"), null);
});

// ─────────────────────────────────────────────────────────────────────
// formatHitCount
// ─────────────────────────────────────────────────────────────────────

test("formatHitCount: 0 hits", () => {
  assertEqual(formatHitCount({ hits: [] }), "0 hits");
});

test("formatHitCount: 1 hit (singular)", () => {
  assertEqual(formatHitCount({ hits: [psa23_1] }), "1 hit");
});

test("formatHitCount: 2 hits (plural)", () => {
  assertEqual(formatHitCount({ hits: [psa23_1, psa28_9] }), "2 hits");
});

test("formatHitCount: N hits (plural)", () => {
  assertEqual(formatHitCount({ hits: [psa23_1, psa28_9, psa80_1, joh10_11, joh10_14] }), "5 hits");
});

// ─────────────────────────────────────────────────────────────────────
// formatTotalSummary
// ─────────────────────────────────────────────────────────────────────

test("formatTotalSummary: 0 groups → 0 hits across 0 books", () => {
  assertEqual(formatTotalSummary([]), "0 hits across 0 books");
});

test("formatTotalSummary: 1 hit, 1 book (both singular)", () => {
  const groups = groupResultsByBook([psa23_1]);
  assertEqual(formatTotalSummary(groups), "1 hit across 1 book");
});

test("formatTotalSummary: 2 hits, 1 book (mixed)", () => {
  const groups = groupResultsByBook([psa23_1, psa28_9]);
  assertEqual(formatTotalSummary(groups), "2 hits across 1 book");
});

test("formatTotalSummary: 1 hit, 2 books (mixed)", () => {
  // Synthetic case; usually if 1 hit total it's also 1 book
  const groups = [
    { bookSlug: "psalms", bookTitle: "Psalms", hits: [] },
    { bookSlug: "john", bookTitle: "John", hits: [joh10_11] },
  ];
  assertEqual(formatTotalSummary(groups), "1 hit across 2 books");
});

test("formatTotalSummary: 6 hits, 3 books (both plural)", () => {
  const groups = groupResultsByBook([psa23_1, joh10_11, eze34_2, psa28_9, joh10_14, psa80_1]);
  assertEqual(formatTotalSummary(groups), "6 hits across 3 books");
});

// ─────────────────────────────────────────────────────────────────────
// Integration — full pipeline on a realistic "shepherd" search
// ─────────────────────────────────────────────────────────────────────

test("integration: shepherd search produces grouped results with mixed lock states", () => {
  const hits = [psa23_1, joh10_11, joh10_14, eze34_2, psa28_9, lockedExtras, lockedStudyNotes];
  const groups = groupResultsByBook(hits);
  assertEqual(groups.length, 5); // psalms, john, ezekiel, bdb, synthetic

  // Free partner sees the two paid hits as locked.
  assertFalse(isResultLocked(psa23_1, "free"));
  assertTrue(isResultLocked(lockedExtras, "free"));
  assertTrue(isResultLocked(lockedStudyNotes, "free"));

  // study_notes partner unlocks the study_notes hit but not extras
  assertFalse(isResultLocked(lockedStudyNotes, "study_notes"));
  assertTrue(isResultLocked(lockedExtras, "study_notes"));

  // extras partner unlocks both
  assertFalse(isResultLocked(lockedStudyNotes, "extras"));
  assertFalse(isResultLocked(lockedExtras, "extras"));

  // Badge labels are right
  assertEqual(tierBadgeLabel(lockedStudyNotes.tier_required), "Notes");
  assertEqual(tierBadgeLabel(lockedExtras.tier_required), "Library");

  // Total summary
  assertEqual(formatTotalSummary(groups), "7 hits across 5 books");
});

// ─────────────────────────────────────────────────────────────────────
// Summary
// ─────────────────────────────────────────────────────────────────────

console.log("");
console.log(`Passed: ${passed}`);
console.log(`Failed: ${failed}`);
if (failed > 0) {
  console.log("");
  console.log("Failures:");
  for (const f of failures) {
    console.log(`  - ${f.name}: ${f.err.message}`);
  }
  process.exit(1);
}
process.exit(0);
