// S127 (W7 Share-and-Copy-with-Watermark) sanity test for
// app/src/lib/share-card-render.ts.
//
// Inlines a JS port of the four pure helpers — the TS module imports
// the v4 brand-mark PNG asset, which Node can't resolve under ESM
// without a bundler shim. The inlined logic must mirror the .ts
// module 1:1; any divergence between this file and share-card-render.ts
// is a bug.
//
// Boundary cases (per DESIGN_LANGUAGE.md §24 + the post-S121 W2 / W3
// / S122 / S123 / S125 forward standard):
//
//   formatRangeHeader
//     - single                       → "{Book} {ch}:{v}"
//     - same-chapter                 → "{Book} {ch}:{s}–{e}"            (EN DASH)
//     - cross-chapter same-book      → "{Book} {ch1}:{v1} → {ch2}:{v2}"  (arrow)
//     - cross-book                   → "{Book1} {ch1}:{v1} → {Book2} {ch2}:{v2}"
//
//   computeBodyFontSize
//     - empty verses array           → MIN_BODY_FONT (14)
//     - zoneHeight <= 0              → MIN_BODY_FONT
//     - zoneWidth <= 0               → MIN_BODY_FONT
//     - single short verse, big zone → near MAX_BODY_FONT (72)
//     - 3-verse small range          → mid-range, less than the single
//                                       short verse picks
//     - very long content, small zone→ MIN_BODY_FONT (floor)
//     - monotonic: more chars → never larger font
//
//   buildShareFilename
//     - single                       → remnant-of-promise-{slug}-{ch}-{v}.png
//     - same-chapter                 → remnant-of-promise-{slug}-{ch}-{s}-{e}.png
//     - cross-chapter same-book      → ...-{slug}-{ch1}-{v1}--{slug}-{ch2}-{v2}.png
//     - cross-book                   → ...-{slug1}-{ch1}-{v1}--{slug2}-{ch2}-{v2}.png
//
//   buildTextOnlyFallback
//     - single verse                 → "{text}\n\n— {header} · The Remnant..."
//     - multi-verse range            → newline-joined verses + attribution
//     - leading/trailing whitespace in verse.text is trimmed
//
// Run with: node _s127_share_card_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic (port of share-card-render.ts pure section)
// ─────────────────────────────────────────────────────────────────────

const MAX_BODY_FONT = 72;
const MIN_BODY_FONT = 14;
const BODY_LINE_HEIGHT = 1.42;
const AVG_GLYPH_RATIO = 0.55;
const VERSE_NUM_OVERHEAD_CHARS = 3;
const EN_DASH = "–";
const ARROW = " → ";

function formatRangeHeader(meta) {
  switch (meta.kind) {
    case "single":
      return `${meta.bookTitle} ${meta.chapter}:${meta.verse}`;
    case "same-chapter":
      return `${meta.bookTitle} ${meta.chapter}:${meta.startVerse}${EN_DASH}${meta.endVerse}`;
    case "cross-chapter":
      return `${meta.bookTitle} ${meta.startChapter}:${meta.startVerse}${ARROW}${meta.endChapter}:${meta.endVerse}`;
    case "cross-book":
      return `${meta.startBookTitle} ${meta.startChapter}:${meta.startVerse}${ARROW}${meta.endBookTitle} ${meta.endChapter}:${meta.endVerse}`;
    default:
      throw new Error(`unknown kind: ${meta.kind}`);
  }
}

function fitsAt(verses, fontSize, zoneHeight, zoneWidth) {
  const charsPerLine = Math.max(
    1,
    Math.floor(zoneWidth / (fontSize * AVG_GLYPH_RATIO))
  );
  const lineHeightPx = fontSize * BODY_LINE_HEIGHT;
  let totalLines = 0;
  for (const v of verses) {
    const effChars = v.text.length + VERSE_NUM_OVERHEAD_CHARS;
    totalLines += Math.max(1, Math.ceil(effChars / charsPerLine));
  }
  totalLines += Math.max(0, verses.length - 1);
  return totalLines * lineHeightPx <= zoneHeight;
}

function computeBodyFontSize(verses, zoneHeight, zoneWidth) {
  if (verses.length === 0) return MIN_BODY_FONT;
  if (zoneHeight <= 0 || zoneWidth <= 0) return MIN_BODY_FONT;
  for (let font = MAX_BODY_FONT; font >= MIN_BODY_FONT; font--) {
    if (fitsAt(verses, font, zoneHeight, zoneWidth)) return font;
  }
  return MIN_BODY_FONT;
}

function buildShareFilename(meta) {
  const base = "remnant-of-promise";
  switch (meta.kind) {
    case "single":
      return `${base}-${meta.bookSlug}-${meta.chapter}-${meta.verse}.png`;
    case "same-chapter":
      return `${base}-${meta.bookSlug}-${meta.chapter}-${meta.startVerse}-${meta.endVerse}.png`;
    case "cross-chapter":
      return `${base}-${meta.bookSlug}-${meta.startChapter}-${meta.startVerse}--${meta.bookSlug}-${meta.endChapter}-${meta.endVerse}.png`;
    case "cross-book":
      return `${base}-${meta.startBookSlug}-${meta.startChapter}-${meta.startVerse}--${meta.endBookSlug}-${meta.endChapter}-${meta.endVerse}.png`;
    default:
      throw new Error(`unknown kind: ${meta.kind}`);
  }
}

function buildTextOnlyFallback(verses, rangeHeader) {
  const body = verses.map((v) => v.text.trim()).join("\n");
  return `${body}\n\n— ${rangeHeader} · The Remnant of Promise Official Study Bible`;
}

// ─────────────────────────────────────────────────────────────────────
// Minimal assert wrapper (same shape as _s125_search_sanity.mjs)
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

// ─────────────────────────────────────────────────────────────────────
// Fixtures — canon book references used across tests
// ─────────────────────────────────────────────────────────────────────

const psalm23_1_meta = {
  kind: "single",
  bookTitle: "Psalm",
  bookSlug: "psalms",
  chapter: 23,
  verse: 1,
};

const psalm23_range_meta = {
  kind: "same-chapter",
  bookTitle: "Psalm",
  bookSlug: "psalms",
  chapter: 23,
  startVerse: 1,
  endVerse: 3,
};

const gen50_51_meta = {
  kind: "cross-chapter",
  bookTitle: "Genesis",
  bookSlug: "genesis",
  startChapter: 50,
  startVerse: 26,
  endChapter: 51,
  endVerse: 1,
};

const gen_exo_meta = {
  kind: "cross-book",
  startBookTitle: "Genesis",
  startBookSlug: "genesis",
  startChapter: 50,
  startVerse: 26,
  endBookTitle: "Exodus",
  endBookSlug: "exodus",
  endChapter: 1,
  endVerse: 1,
};

// Verse text fixtures
const psalm23_1_text = "The LORD is my shepherd; I shall not want.";
const psalm23_2_text =
  "He maketh me to lie down in green pastures: he leadeth me beside the still waters.";
const psalm23_3_text =
  "He restoreth my soul: he leadeth me in the paths of righteousness for his name's sake.";

// A representative full verse from Psalm 119 (~150 chars) repeated to
// simulate a long-range overflow case — Psalm 119 has 176 verses total
// which is the §24-documented outlier triggering the multi-card warning.
const long_psalm_verse =
  "Blessed are the undefiled in the way, who walk in the law of the LORD: blessed are they that keep his testimonies, and that seek him with the whole heart.";

// ─────────────────────────────────────────────────────────────────────
// formatRangeHeader
// ─────────────────────────────────────────────────────────────────────

test("formatRangeHeader: single verse → 'Psalm 23:1'", () => {
  assertEqual(formatRangeHeader(psalm23_1_meta), "Psalm 23:1");
});

test("formatRangeHeader: same-chapter range uses EN DASH (U+2013)", () => {
  const got = formatRangeHeader(psalm23_range_meta);
  assertEqual(got, "Psalm 23:1–3");
  // Belt-and-suspenders: verify it's the en-dash, not a hyphen-minus.
  assertTrue(got.includes("–"), "expected en-dash");
  assertTrue(!got.includes("-"), "expected no hyphen-minus");
});

test("formatRangeHeader: cross-chapter same-book uses arrow with one book title", () => {
  assertEqual(
    formatRangeHeader(gen50_51_meta),
    "Genesis 50:26 → 51:1"
  );
});

test("formatRangeHeader: cross-book uses both book titles with arrow", () => {
  assertEqual(
    formatRangeHeader(gen_exo_meta),
    "Genesis 50:26 → Exodus 1:1"
  );
});

// ─────────────────────────────────────────────────────────────────────
// computeBodyFontSize
// ─────────────────────────────────────────────────────────────────────

// Card body-zone roughly: width ~ 1080 - 2*43.2 = 993.6
// height ~ 1350 - 121.5 (header) - 414 (reserved band) = 814.5
const BODY_W = 994;
const BODY_H = 815;

test("computeBodyFontSize: empty verses → floor", () => {
  assertEqual(computeBodyFontSize([], BODY_H, BODY_W), MIN_BODY_FONT);
});

test("computeBodyFontSize: zoneHeight=0 → floor", () => {
  const v = [{ verseNumber: 1, text: psalm23_1_text }];
  assertEqual(computeBodyFontSize(v, 0, BODY_W), MIN_BODY_FONT);
});

test("computeBodyFontSize: zoneWidth=0 → floor", () => {
  const v = [{ verseNumber: 1, text: psalm23_1_text }];
  assertEqual(computeBodyFontSize(v, BODY_H, 0), MIN_BODY_FONT);
});

test("computeBodyFontSize: single short verse picks a large font", () => {
  const v = [{ verseNumber: 1, text: psalm23_1_text }];
  const font = computeBodyFontSize(v, BODY_H, BODY_W);
  // Psalm 23:1 is ~42 chars — should comfortably fit at MAX_BODY_FONT.
  assertEqual(font, MAX_BODY_FONT);
});

test("computeBodyFontSize: 3-verse range smaller than single-verse pick", () => {
  const single = [{ verseNumber: 1, text: psalm23_1_text }];
  const triple = [
    { verseNumber: 1, text: psalm23_1_text },
    { verseNumber: 2, text: psalm23_2_text },
    { verseNumber: 3, text: psalm23_3_text },
  ];
  const fSingle = computeBodyFontSize(single, BODY_H, BODY_W);
  const fTriple = computeBodyFontSize(triple, BODY_H, BODY_W);
  assertTrue(
    fTriple <= fSingle,
    `triple-verse font ${fTriple} should be <= single-verse font ${fSingle}`
  );
  // Triple should still be comfortably readable (well above floor).
  assertTrue(
    fTriple >= MIN_BODY_FONT * 2,
    `triple-verse font ${fTriple} should be well above floor ${MIN_BODY_FONT}`
  );
});

test("computeBodyFontSize: very long range hits the floor", () => {
  // 30 repetitions of a 150-char Psalm 119 verse — well beyond what
  // the body zone can hold at any reasonable font; should hit floor.
  const longRange = [];
  for (let i = 1; i <= 30; i++) {
    longRange.push({ verseNumber: i, text: long_psalm_verse });
  }
  const font = computeBodyFontSize(longRange, BODY_H, BODY_W);
  assertEqual(font, MIN_BODY_FONT);
});

test("computeBodyFontSize: monotonic — more content never picks larger font", () => {
  // Sanity check the iterate-downward logic stays well-ordered: at the
  // same zone dimensions, the font for N verses must be <= font for
  // (N-1) verses across a sweep.
  const verses = [];
  let lastFont = MAX_BODY_FONT + 1;
  for (let i = 1; i <= 10; i++) {
    verses.push({ verseNumber: i, text: psalm23_2_text });
    const f = computeBodyFontSize(verses, BODY_H, BODY_W);
    assertTrue(
      f <= lastFont,
      `font for ${i} verses (${f}) should be <= font for ${i - 1} verses (${lastFont})`
    );
    lastFont = f;
  }
});

test("computeBodyFontSize: result is always an integer in [floor, max]", () => {
  // Random-ish sweep across content sizes; assert bounds + integrality.
  const cases = [
    [{ verseNumber: 1, text: "a" }],
    [{ verseNumber: 1, text: psalm23_1_text }],
    [{ verseNumber: 1, text: long_psalm_verse }],
    [
      { verseNumber: 1, text: psalm23_1_text },
      { verseNumber: 2, text: psalm23_2_text },
      { verseNumber: 3, text: psalm23_3_text },
      { verseNumber: 4, text: psalm23_1_text },
      { verseNumber: 5, text: psalm23_2_text },
    ],
  ];
  for (const v of cases) {
    const f = computeBodyFontSize(v, BODY_H, BODY_W);
    assertTrue(Number.isInteger(f), `font ${f} should be integer`);
    assertTrue(
      f >= MIN_BODY_FONT && f <= MAX_BODY_FONT,
      `font ${f} should be in [${MIN_BODY_FONT}, ${MAX_BODY_FONT}]`
    );
  }
});

// ─────────────────────────────────────────────────────────────────────
// buildShareFilename
// ─────────────────────────────────────────────────────────────────────

test("buildShareFilename: single verse → 'remnant-of-promise-psalms-23-1.png'", () => {
  assertEqual(
    buildShareFilename(psalm23_1_meta),
    "remnant-of-promise-psalms-23-1.png"
  );
});

test("buildShareFilename: same-chapter range → 'remnant-of-promise-psalms-23-1-3.png'", () => {
  assertEqual(
    buildShareFilename(psalm23_range_meta),
    "remnant-of-promise-psalms-23-1-3.png"
  );
});

test("buildShareFilename: cross-chapter same-book uses double-dash separator + repeats slug", () => {
  assertEqual(
    buildShareFilename(gen50_51_meta),
    "remnant-of-promise-genesis-50-26--genesis-51-1.png"
  );
});

test("buildShareFilename: cross-book uses both slugs across double-dash separator", () => {
  assertEqual(
    buildShareFilename(gen_exo_meta),
    "remnant-of-promise-genesis-50-26--exodus-1-1.png"
  );
});

test("buildShareFilename: filename is filesystem-safe (no spaces, no special chars)", () => {
  // Sweep all four kinds; assert the filename matches a safe pattern.
  const safe = /^[a-z0-9\-]+\.png$/;
  for (const meta of [
    psalm23_1_meta,
    psalm23_range_meta,
    gen50_51_meta,
    gen_exo_meta,
  ]) {
    const name = buildShareFilename(meta);
    assertTrue(safe.test(name), `filename "${name}" should match ${safe}`);
  }
});

// ─────────────────────────────────────────────────────────────────────
// buildTextOnlyFallback
// ─────────────────────────────────────────────────────────────────────

test("buildTextOnlyFallback: single verse format matches §24 spec", () => {
  const verses = [{ verseNumber: 1, text: psalm23_1_text }];
  const header = formatRangeHeader(psalm23_1_meta);
  const got = buildTextOnlyFallback(verses, header);
  const want = `${psalm23_1_text}\n\n— Psalm 23:1 · The Remnant of Promise Official Study Bible`;
  assertEqual(got, want);
});

test("buildTextOnlyFallback: multi-verse range joins verses with newlines", () => {
  const verses = [
    { verseNumber: 1, text: psalm23_1_text },
    { verseNumber: 2, text: psalm23_2_text },
    { verseNumber: 3, text: psalm23_3_text },
  ];
  const header = formatRangeHeader(psalm23_range_meta);
  const got = buildTextOnlyFallback(verses, header);
  const want =
    `${psalm23_1_text}\n${psalm23_2_text}\n${psalm23_3_text}\n\n` +
    `— Psalm 23:1–3 · The Remnant of Promise Official Study Bible`;
  assertEqual(got, want);
});

test("buildTextOnlyFallback: leading/trailing whitespace in verse text is trimmed", () => {
  const verses = [{ verseNumber: 1, text: `  ${psalm23_1_text}\n` }];
  const got = buildTextOnlyFallback(verses, "Psalm 23:1");
  // Body line should be exactly the trimmed text — no spurious
  // leading/trailing whitespace bleeding into the fallback string.
  const lines = got.split("\n");
  assertEqual(lines[0], psalm23_1_text);
});

test("buildTextOnlyFallback: attribution line uses FULL product name, not 'ROP'", () => {
  // The footer of the canvas uses "ROP Official Study Bible" (abbreviated
  // for width) but the text-only fallback uses the full product name
  // since plain-text contexts have no width constraint.
  const verses = [{ verseNumber: 1, text: psalm23_1_text }];
  const got = buildTextOnlyFallback(verses, "Psalm 23:1");
  assertTrue(
    got.includes("The Remnant of Promise Official Study Bible"),
    "expected full product name in attribution"
  );
  assertTrue(
    !got.includes("ROP Official"),
    "expected no 'ROP' abbreviation in plain-text attribution"
  );
});

// ─────────────────────────────────────────────────────────────────────
// Summary
// ─────────────────────────────────────────────────────────────────────

console.log("");
console.log(`${passed} passed, ${failed} failed`);
if (failed > 0) {
  console.log("");
  console.log("Failures:");
  for (const { name, err } of failures) {
    console.log(`  ${name}: ${err.message}`);
  }
  process.exit(1);
}
