// S123 sanity test for lib/range-selection.ts.
//
// Inlines a JS port of the helper's logic (the TS module imports a
// type-only `Verse` from ./api which Node can't resolve directly under
// ESM without bundling). The logic mirrors range-selection.ts 1:1 —
// any divergence between this file and the .ts module is a bug.
//
// Boundary cases covered (per the S123 brief):
//   - same-chapter forward range
//   - same-chapter range-of-one (start === end)
//   - same-chapter reversed range (auto-normalize)
//   - cross-chapter (helper supports state; resolver returns [])
//   - cross-book (helper supports state; resolver returns [])
//   - non-captured state (idle / selecting / null endpoints)
//   - state-machine transitions (idle → selecting → captured → idle)
//   - chapterVerses array out of order (resolver sorts)
//   - chapterVerses missing range endpoints (resolver returns partial)
//
// Run with: node _s123_range_selection_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic (port of range-selection.ts)
// ─────────────────────────────────────────────────────────────────────

const IDLE_STATE = { status: "idle", start: null, end: null };

function startSelecting(start) {
  return { status: "selecting", start, end: null };
}

function commitEnd(state, end) {
  if (state.status !== "selecting" || state.start === null) {
    return state;
  }
  const [lo, hi] = orderRefs(state.start, end);
  return { status: "captured", start: lo, end: hi };
}

function cancel() {
  return IDLE_STATE;
}

function isReversed(state) {
  if (state.start === null || state.end === null) return false;
  return compareRefs(state.start, state.end) > 0;
}

function isSameChapter(state) {
  if (state.start === null || state.end === null) return false;
  return (
    state.start.bookSlug === state.end.bookSlug &&
    state.start.chapterNumber === state.end.chapterNumber
  );
}

function isSameBook(state) {
  if (state.start === null || state.end === null) return false;
  return state.start.bookSlug === state.end.bookSlug;
}

function sameChapterRangeSize(state) {
  if (state.status !== "captured" || state.start === null || state.end === null) {
    return 0;
  }
  if (!isSameChapter(state)) return 0;
  return state.end.verseNumber - state.start.verseNumber + 1;
}

function resolveSameChapterRange(state, chapterVerses) {
  if (state.status !== "captured" || state.start === null || state.end === null) {
    return [];
  }
  if (!isSameChapter(state)) return [];
  const lo = state.start.verseNumber;
  const hi = state.end.verseNumber;
  const matched = [];
  for (const v of chapterVerses) {
    if (v.verse_number >= lo && v.verse_number <= hi) {
      matched.push(v);
    }
  }
  matched.sort((a, b) => a.verse_number - b.verse_number);
  return matched.map((v) => v.id);
}

function orderRefs(a, b) {
  return compareRefs(a, b) <= 0 ? [a, b] : [b, a];
}

function compareRefs(a, b) {
  if (a.bookSlug !== b.bookSlug) {
    return a.bookSlug < b.bookSlug ? -1 : 1;
  }
  if (a.chapterNumber !== b.chapterNumber) {
    return a.chapterNumber - b.chapterNumber;
  }
  return a.verseNumber - b.verseNumber;
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
// Fixtures — verse refs and chapter-verse tables for the boundary cases
// ─────────────────────────────────────────────────────────────────────

// Genesis 1 verses 1–6 (synthetic verseIds for the test; the real
// schema BIGSERIALs across the canon, but for same-chapter the helper
// only uses verseNumber comparison + verseId mapping).
const gen1_1 = { verseId: 10001, verseNumber: 1, bookSlug: "genesis", chapterNumber: 1 };
const gen1_3 = { verseId: 10003, verseNumber: 3, bookSlug: "genesis", chapterNumber: 1 };
const gen1_5 = { verseId: 10005, verseNumber: 5, bookSlug: "genesis", chapterNumber: 1 };
const gen1_6 = { verseId: 10006, verseNumber: 6, bookSlug: "genesis", chapterNumber: 1 };

const genesis1Verses = [
  { id: 10001, verse_number: 1 },
  { id: 10002, verse_number: 2 },
  { id: 10003, verse_number: 3 },
  { id: 10004, verse_number: 4 },
  { id: 10005, verse_number: 5 },
  { id: 10006, verse_number: 6 },
];

const gen2_1 = { verseId: 10101, verseNumber: 1, bookSlug: "genesis", chapterNumber: 2 };
const exo1_1 = { verseId: 20001, verseNumber: 1, bookSlug: "exodus", chapterNumber: 1 };

// ─────────────────────────────────────────────────────────────────────
// Tests
// ─────────────────────────────────────────────────────────────────────

test("idle → selecting transition pins the anchor", () => {
  const s = startSelecting(gen1_3);
  assertEqual(s.status, "selecting");
  assertEqual(s.start, gen1_3);
  assertEqual(s.end, null);
});

test("selecting → captured forward range commits cleanly", () => {
  let s = startSelecting(gen1_3);
  s = commitEnd(s, gen1_5);
  assertEqual(s.status, "captured");
  assertEqual(s.start, gen1_3);
  assertEqual(s.end, gen1_5);
  assertFalse(isReversed(s), "forward range should not be reversed");
});

test("range-of-one (start === end) captures a 1-verse range", () => {
  let s = startSelecting(gen1_3);
  s = commitEnd(s, gen1_3);
  assertEqual(s.status, "captured");
  assertEqual(s.start.verseId, gen1_3.verseId);
  assertEqual(s.end.verseId, gen1_3.verseId);
  assertEqual(sameChapterRangeSize(s), 1);
  assertEqual(resolveSameChapterRange(s, genesis1Verses), [10003]);
});

test("reversed range auto-normalizes (end < start swaps in)", () => {
  let s = startSelecting(gen1_5);
  s = commitEnd(s, gen1_1); // end before start by verse_number
  assertEqual(s.status, "captured");
  // After normalization, start should be the earlier verse
  assertEqual(s.start.verseNumber, 1);
  assertEqual(s.end.verseNumber, 5);
  assertFalse(isReversed(s), "auto-normalized state should not be reversed");
});

test("cancel returns to idle from any state", () => {
  let s = startSelecting(gen1_3);
  s = cancel();
  assertEqual(s, IDLE_STATE);
  s = commitEnd(startSelecting(gen1_3), gen1_5);
  s = cancel();
  assertEqual(s, IDLE_STATE);
});

test("commitEnd on idle state is a no-op", () => {
  const s = commitEnd(IDLE_STATE, gen1_5);
  assertEqual(s, IDLE_STATE);
});

test("commitEnd on already-captured state is a no-op", () => {
  let s = startSelecting(gen1_3);
  s = commitEnd(s, gen1_5);
  const after = commitEnd(s, gen1_1);
  // Should remain unchanged (still captured 3-5)
  assertEqual(after.start.verseNumber, 3);
  assertEqual(after.end.verseNumber, 5);
});

test("same-chapter resolver returns ordered verse_ids in range", () => {
  let s = startSelecting(gen1_3);
  s = commitEnd(s, gen1_5);
  const ids = resolveSameChapterRange(s, genesis1Verses);
  assertEqual(ids, [10003, 10004, 10005]);
  assertEqual(sameChapterRangeSize(s), 3);
});

test("same-chapter resolver handles full-chapter range", () => {
  let s = startSelecting(gen1_1);
  s = commitEnd(s, gen1_6);
  const ids = resolveSameChapterRange(s, genesis1Verses);
  assertEqual(ids, [10001, 10002, 10003, 10004, 10005, 10006]);
  assertEqual(sameChapterRangeSize(s), 6);
});

test("cross-chapter range: helper captures state, same-chapter resolver returns []", () => {
  let s = startSelecting(gen1_5);
  s = commitEnd(s, gen2_1);
  assertEqual(s.status, "captured");
  assertFalse(isSameChapter(s), "cross-chapter should not be same-chapter");
  assertTrue(isSameBook(s), "Genesis 1 → Genesis 2 is same book");
  // Same-chapter resolver returns [] for cross-chapter (per W4 scope)
  assertEqual(resolveSameChapterRange(s, genesis1Verses), []);
  assertEqual(sameChapterRangeSize(s), 0);
});

test("cross-book range: helper captures state, same-chapter resolver returns []", () => {
  let s = startSelecting(gen1_5);
  s = commitEnd(s, exo1_1);
  assertEqual(s.status, "captured");
  assertFalse(isSameChapter(s));
  assertFalse(isSameBook(s));
  // Same-chapter resolver returns [] for cross-book
  assertEqual(resolveSameChapterRange(s, genesis1Verses), []);
});

test("cross-book reversed range normalizes by bookSlug lexicographic order (NOT canonical)", () => {
  // CRITICAL: bookSlug lexicographic order is NOT canonical canon order.
  // "exodus" < "genesis" lexicographically (because 'e' < 'g'), even
  // though canonically Genesis comes before Exodus. The helper's
  // compareRefs documents this gap; W7's cross-book consumer is expected
  // to wrap with a witness_category canonical_order-aware comparator.
  // W4 UX never exercises the cross-book branch (same-chapter constraint
  // forbids it), so the lexicographic fallback is acceptable for V1.
  let s = startSelecting(gen1_5);
  s = commitEnd(s, exo1_1);
  // After normalize, start = exodus (lexically earlier), end = genesis
  assertEqual(s.start.bookSlug, "exodus");
  assertEqual(s.end.bookSlug, "genesis");
  assertFalse(isReversed(s), "helper considers lexicographic order — not reversed");
});

test("resolveSameChapterRange handles out-of-order chapterVerses input", () => {
  let s = startSelecting(gen1_1);
  s = commitEnd(s, gen1_3);
  const scrambled = [
    { id: 10003, verse_number: 3 },
    { id: 10001, verse_number: 1 },
    { id: 10002, verse_number: 2 },
  ];
  const ids = resolveSameChapterRange(s, scrambled);
  assertEqual(ids, [10001, 10002, 10003]);
});

test("resolveSameChapterRange returns partial when chapterVerses missing endpoints", () => {
  let s = startSelecting(gen1_1);
  s = commitEnd(s, gen1_6);
  const partial = [
    { id: 10002, verse_number: 2 },
    { id: 10003, verse_number: 3 },
    { id: 10004, verse_number: 4 },
  ];
  const ids = resolveSameChapterRange(s, partial);
  assertEqual(ids, [10002, 10003, 10004]);
});

test("isReversed correctly flags reversed-but-unnormalized states", () => {
  const fakeReversed = { status: "captured", start: gen1_5, end: gen1_1 };
  assertTrue(isReversed(fakeReversed), "manually reversed state should flag as reversed");
});

test("predicates return false for null endpoints", () => {
  assertFalse(isReversed(IDLE_STATE));
  assertFalse(isSameChapter(IDLE_STATE));
  assertFalse(isSameBook(IDLE_STATE));
  assertEqual(sameChapterRangeSize(IDLE_STATE), 0);
});

test("compareRefs orders by book (lex) → chapter → verse", () => {
  // Within a book: chapter and verse drive ordering canonically.
  assertEqual(Math.sign(compareRefs(gen1_1, gen1_3)), -1);
  assertEqual(Math.sign(compareRefs(gen1_5, gen1_3)), 1);
  assertEqual(compareRefs(gen1_3, gen1_3), 0);
  assertEqual(Math.sign(compareRefs(gen1_5, gen2_1)), -1);
  // Across books: compareRefs uses lexicographic bookSlug ordering,
  // NOT canonical canon order. "exodus" < "genesis" lexicographically,
  // so compareRefs(genesis2:1, exodus1:1) returns positive. W7 wraps
  // this with a canonical-order comparator; W4 doesn't exercise it.
  assertEqual(Math.sign(compareRefs(gen2_1, exo1_1)), 1);
  assertEqual(Math.sign(compareRefs(exo1_1, gen2_1)), -1);
});

test("orderRefs returns [earlier, later] regardless of input order", () => {
  const [lo1, hi1] = orderRefs(gen1_1, gen1_5);
  assertEqual(lo1, gen1_1);
  assertEqual(hi1, gen1_5);
  const [lo2, hi2] = orderRefs(gen1_5, gen1_1);
  assertEqual(lo2, gen1_1);
  assertEqual(hi2, gen1_5);
});

// ─────────────────────────────────────────────────────────────────────
// Summary
// ─────────────────────────────────────────────────────────────────────

console.log();
console.log(`${passed} passed, ${failed} failed`);
if (failed > 0) {
  console.log();
  for (const f of failures) {
    console.log(`FAIL: ${f.name}`);
    console.log(`  ${f.err.message}`);
  }
  process.exit(1);
}
