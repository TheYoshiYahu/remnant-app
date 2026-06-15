// Regression sanity test for the copy/share TEXT builders.
//
// Guards the three live-app bugs fixed in this change:
//
//   1. Copy verse → clean verse text (+ ref + attribution) on the
//      clipboard. (buildTextOnlyFallback — already covered by
//      _s127_share_card_sanity.mjs; re-asserted here for the no-markup
//      invariant.)
//   3. Study / xref SHARE text must be a human-readable caption, NOT
//      the PNG filename (which read as code-like slug text in the share
//      sheet + recipient message). (buildStudyShareText)
//
// Inlines JS ports of the pure builders (the .ts modules import asset
// PNGs / html2canvas that Node can't resolve under ESM without a
// bundler). The inlined logic MUST mirror the .ts modules 1:1.
//
// Run with: node _share_text_regression_sanity.mjs

// ── Port: share-card-render.ts buildTextOnlyFallback ────────────────
function buildTextOnlyFallback(verses, rangeHeader) {
  const body = verses.map((v) => v.text.trim()).join("\n");
  return `${body}\n\n— ${rangeHeader} · The Remnant of Promise Official Study Bible`;
}

// ── Port: study-share-render.ts titleizeBookSlug + buildStudyShareText ─
function titleizeBookSlug(slug) {
  const LOWER = new Set(["of", "the", "and"]);
  return slug
    .split("-")
    .map((part, i) => {
      if (/^\d+$/.test(part)) return part;
      if (i > 0 && LOWER.has(part)) return part;
      return part.charAt(0).toUpperCase() + part.slice(1);
    })
    .join(" ");
}

function buildStudyShareText(meta) {
  const ATTRIBUTION = "The Remnant of Promise Study Bible";
  if (meta.kind === "strongs") {
    return `Strong's ${meta.strongNumber} — word study from ${ATTRIBUTION}`;
  }
  const ref = `${titleizeBookSlug(meta.bookSlug)} ${meta.chapterNumber}:${meta.verseNumber}`;
  if (meta.xrefKind === "thread") {
    return `Cross-reference study on ${ref} — ${ATTRIBUTION}`;
  }
  return `Cross-references for ${ref} — ${ATTRIBUTION}`;
}

// ── Minimal assert wrapper ──────────────────────────────────────────
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
  if (actual !== expected) {
    throw new Error(`${msg || "assertEqual"}: expected ${JSON.stringify(expected)}, got ${JSON.stringify(actual)}`);
  }
}
function assertTrue(cond, msg) {
  if (!cond) throw new Error(msg || "expected true");
}

// The "looks like code" guard: shared text must contain no raw markup
// tags, no uninterpolated template syntax, and no PNG filename slug.
function assertNoCodeLikeMarkup(text, label) {
  assertTrue(!/[<>]/.test(text), `${label}: contains a raw < or > tag: ${JSON.stringify(text)}`);
  assertTrue(!text.includes("${"), `${label}: contains an uninterpolated \${ template: ${JSON.stringify(text)}`);
  assertTrue(!text.includes("[object Object]"), `${label}: contains a raw object: ${JSON.stringify(text)}`);
  assertTrue(!/\.png\b/.test(text), `${label}: contains a .png filename: ${JSON.stringify(text)}`);
  // No markdown emphasis/heading/link residue.
  assertTrue(!/\[[^\]]*\]\([^)]*\)/.test(text), `${label}: contains a markdown link: ${JSON.stringify(text)}`);
}

// ── buildTextOnlyFallback (Copy verse payload) ──────────────────────
test("Copy: single verse → clean verse + ref + attribution, no markup", () => {
  const verses = [{ verseNumber: 1, text: "The LORD is my shepherd; I shall not want." }];
  const got = buildTextOnlyFallback(verses, "Psalm 23:1");
  assertEqual(
    got,
    "The LORD is my shepherd; I shall not want.\n\n— Psalm 23:1 · The Remnant of Promise Official Study Bible"
  );
  assertNoCodeLikeMarkup(got, "Copy single");
});

test("Copy: multi-verse range → newline-joined, no markup", () => {
  const verses = [
    { verseNumber: 1, text: "A" },
    { verseNumber: 2, text: "B" },
  ];
  const got = buildTextOnlyFallback(verses, "Psalm 23:1–2");
  assertTrue(got.includes("A\nB"), "verses joined by newline");
  assertTrue(got.includes("The Remnant of Promise Official Study Bible"), "has attribution");
  assertNoCodeLikeMarkup(got, "Copy range");
});

// ── buildStudyShareText (study / xref share caption) ────────────────
test("Share: strongs caption is clean prose, not a filename", () => {
  const got = buildStudyShareText({ kind: "strongs", strongNumber: "H7225", transliteration: "reshith", source: "bdb" });
  assertEqual(got, "Strong's H7225 — word study from The Remnant of Promise Study Bible");
  assertNoCodeLikeMarkup(got, "Share strongs");
});

test("Share: xref thread caption is clean prose, not a filename", () => {
  const got = buildStudyShareText({ kind: "xref", xrefKind: "thread", bookSlug: "genesis", chapterNumber: 1, verseNumber: 1, subject: "kingdom-gospel" });
  assertEqual(got, "Cross-reference study on Genesis 1:1 — The Remnant of Promise Study Bible");
  assertNoCodeLikeMarkup(got, "Share xref thread");
});

test("Share: xref baseline caption is clean prose, not a filename", () => {
  const got = buildStudyShareText({ kind: "xref", xrefKind: "baseline", bookSlug: "1-thessalonians", chapterNumber: 4, verseNumber: 16, subject: "verse-16" });
  assertEqual(got, "Cross-references for 1 Thessalonians 4:16 — The Remnant of Promise Study Bible");
  assertNoCodeLikeMarkup(got, "Share xref baseline");
});

test("titleizeBookSlug: numbers, multi-word, lowercase connectives", () => {
  assertEqual(titleizeBookSlug("genesis"), "Genesis");
  assertEqual(titleizeBookSlug("1-thessalonians"), "1 Thessalonians");
  assertEqual(titleizeBookSlug("song-of-songs"), "Song of Songs");
  assertEqual(titleizeBookSlug("acts-of-the-apostles"), "Acts of the Apostles");
});

// The exact pre-fix bug: the filename must never be the share text.
test("Regression: study share text must NOT equal the PNG filename", () => {
  const filename = "thread-kingdom-gospel-rop-study.png";
  const got = buildStudyShareText({ kind: "xref", xrefKind: "thread", bookSlug: "genesis", chapterNumber: 1, verseNumber: 1, subject: "kingdom-gospel" });
  assertTrue(got !== filename, "share text must not be the filename");
  assertTrue(!/\.png/.test(got), "share text must not contain a .png filename");
});

console.log("");
console.log(`${passed} passed, ${failed} failed`);
if (failed > 0) {
  console.log("");
  console.log("Failures:");
  for (const { name, err } of failures) console.log(`  ${name}: ${err.message}`);
  process.exit(1);
}
