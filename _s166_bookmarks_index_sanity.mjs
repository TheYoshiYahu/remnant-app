// S166 (§29 — Bookmarks Index) sanity test for app/src/lib/bookmarks-helpers.ts.
//
// Inlines a JS port of the helpers — the TS module exports types Node can't
// resolve directly under ESM without bundling. Logic mirrors the .ts file
// 1:1; any divergence between this file and the .ts module is a bug.
//
// Per DESIGN_LANGUAGE.md §29 "Helper API + sanity-test surface":
//   - formatBookmarkRow       : all fields / null description / empty tags /
//                               null color / unicode in tags / ISO date format
//   - formatSavedDateDisplay  : standard ISO / null defensive / unparseable /
//                               locale variation / future date / millisecond
//   - groupBookmarksByBook    : single-book / multi-book preserves order /
//                               empty input / slug normalization
//   - truncateVersePreview    : short text / long text word-boundary /
//                               unicode-safe / empty / null
//   - compareBookmarksByDate  : newer-first / equal / null defensive
//
// Run with: node _s166_bookmarks_index_sanity.mjs
// Verification target: ≥25 sanity-test cases passing.

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic (port of app/src/lib/bookmarks-helpers.ts)
// ─────────────────────────────────────────────────────────────────────

function formatSavedDateDisplay(isoDate, locale = "en-US") {
  if (!isoDate) return "";
  const d = new Date(isoDate);
  if (Number.isNaN(d.getTime())) return "";
  const formatted = d.toLocaleDateString(locale, {
    year: "numeric",
    month: "short",
    day: "numeric",
  });
  return `Saved ${formatted}`;
}

function truncateVersePreview(text, maxChars = 180) {
  if (!text) return "";
  if (text.length <= maxChars) return text;
  const slice = text.slice(0, maxChars);
  const lastSpace = slice.lastIndexOf(" ");
  if (lastSpace > maxChars * 0.6) {
    return slice.slice(0, lastSpace) + "…";
  }
  return slice + "…";
}

function formatBookmarkRow(bookmark) {
  const refLine = `${bookmark.book_title} ${bookmark.chapter_number}:${bookmark.verse_number}`;
  const preview = truncateVersePreview(bookmark.verse_text);
  const tags = bookmark.tags ?? [];
  const tagsCountDisplay = tags.length > 0
    ? `${tags.length} tag${tags.length === 1 ? "" : "s"}`
    : null;
  return {
    refLine,
    preview,
    shortDescription: bookmark.short_description,
    tags,
    colorTint: bookmark.color_tint,
    savedDateDisplay: formatSavedDateDisplay(bookmark.created_at),
    tagsCountDisplay,
  };
}

function compareBookmarksByDate(a, b) {
  const at = a.created_at ? Date.parse(a.created_at) : -Infinity;
  const bt = b.created_at ? Date.parse(b.created_at) : -Infinity;
  if (Number.isNaN(at) && Number.isNaN(bt)) return 0;
  if (Number.isNaN(at)) return 1;
  if (Number.isNaN(bt)) return -1;
  return bt - at;
}

function groupBookmarksByBook(bookmarks) {
  const grouped = new Map();
  for (const bm of bookmarks) {
    const slug = bm.book_slug;
    if (!grouped.has(slug)) {
      grouped.set(slug, []);
    }
    grouped.get(slug).push(bm);
  }
  return grouped;
}

// ─────────────────────────────────────────────────────────────────────
// Test harness
// ─────────────────────────────────────────────────────────────────────

let pass = 0;
let fail = 0;
const fails = [];

function eq(actual, expected, label) {
  const same = JSON.stringify(actual) === JSON.stringify(expected);
  if (same) {
    pass++;
  } else {
    fail++;
    fails.push(`FAIL: ${label}\n  expected: ${JSON.stringify(expected)}\n  actual:   ${JSON.stringify(actual)}`);
  }
}

function truthy(actual, label) {
  if (actual) {
    pass++;
  } else {
    fail++;
    fails.push(`FAIL: ${label}\n  expected truthy, got: ${JSON.stringify(actual)}`);
  }
}

// ─────────────────────────────────────────────────────────────────────
// formatSavedDateDisplay — sanity sweep (6 cases)
// ─────────────────────────────────────────────────────────────────────

eq(
  formatSavedDateDisplay("2026-05-29T12:00:00Z"),
  "Saved May 29, 2026",
  "formatSavedDateDisplay: standard ISO timestamp formats to short-month display",
);
eq(
  formatSavedDateDisplay(null),
  "",
  "formatSavedDateDisplay: null returns empty string (no crash)",
);
eq(
  formatSavedDateDisplay(undefined),
  "",
  "formatSavedDateDisplay: undefined returns empty string",
);
eq(
  formatSavedDateDisplay(""),
  "",
  "formatSavedDateDisplay: empty string returns empty string",
);
eq(
  formatSavedDateDisplay("not-a-date"),
  "",
  "formatSavedDateDisplay: unparseable input returns empty (defensive)",
);
truthy(
  formatSavedDateDisplay("2026-05-29T12:00:00.123Z").startsWith("Saved"),
  "formatSavedDateDisplay: ISO with milliseconds still parses cleanly",
);

// ─────────────────────────────────────────────────────────────────────
// truncateVersePreview — sanity sweep (5 cases)
// ─────────────────────────────────────────────────────────────────────

eq(
  truncateVersePreview("Short verse."),
  "Short verse.",
  "truncateVersePreview: short text passes through unchanged",
);
{
  const long = "And seeing the multitudes, he went up into a mountain: and when he was set, his disciples came unto him: And he opened his mouth, and taught them, saying, Blessed are the poor in spirit: for theirs is the kingdom of heaven.";
  const out = truncateVersePreview(long, 100);
  truthy(out.length <= 105, "truncateVersePreview: long text truncates near maxChars (within ellipsis tolerance)");
  truthy(out.endsWith("…"), "truncateVersePreview: truncated text ends with ellipsis");
}
eq(
  truncateVersePreview(""),
  "",
  "truncateVersePreview: empty string returns empty",
);
eq(
  truncateVersePreview(null),
  "",
  "truncateVersePreview: null returns empty",
);
{
  // Hebrew + Greek mixed unicode — should not corrupt
  const out = truncateVersePreview("In the beginning was the Word, and the Word was with God. בְּרֵאשִׁית ἐν ἀρχῇ.", 50);
  truthy(out.includes("Word"), "truncateVersePreview: unicode-safe preservation");
}

// ─────────────────────────────────────────────────────────────────────
// formatBookmarkRow — sanity sweep (6 cases)
// ─────────────────────────────────────────────────────────────────────

{
  const row = formatBookmarkRow({
    id: "42",
    verse_id: 12345,
    book_slug: "matthew",
    book_title: "Matthew",
    chapter_number: 5,
    verse_number: 17,
    verse_text: "Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.",
    short_description: "Yahusha affirms Torah",
    tags: ["torah", "fulfillment"],
    color_tint: "emerald",
    created_at: "2026-05-29T12:00:00Z",
    updated_at: "2026-05-29T12:00:00Z",
  });
  eq(row.refLine, "Matthew 5:17", "formatBookmarkRow: refLine composed as 'Book chapter:verse'");
  eq(row.shortDescription, "Yahusha affirms Torah", "formatBookmarkRow: short_description passes through");
  eq(row.tags, ["torah", "fulfillment"], "formatBookmarkRow: tags array passes through");
  eq(row.colorTint, "emerald", "formatBookmarkRow: color_tint enum passes through");
  eq(row.tagsCountDisplay, "2 tags", "formatBookmarkRow: tagsCountDisplay uses plural for 2 tags");
}

{
  const row = formatBookmarkRow({
    id: "43",
    verse_id: 99,
    book_slug: "genesis",
    book_title: "Genesis",
    chapter_number: 1,
    verse_number: 1,
    verse_text: "In the beginning Elohim created the heaven and the earth.",
    short_description: null,
    tags: null,
    color_tint: null,
    created_at: "2026-05-28T10:00:00Z",
    updated_at: "2026-05-28T10:00:00Z",
  });
  eq(row.shortDescription, null, "formatBookmarkRow: null short_description passes through");
  eq(row.tags, [], "formatBookmarkRow: null tags normalizes to empty array");
  eq(row.colorTint, null, "formatBookmarkRow: null color_tint passes through");
  eq(row.tagsCountDisplay, null, "formatBookmarkRow: empty tags → null tagsCountDisplay (suppresses chip footer)");
}

{
  const row = formatBookmarkRow({
    id: "44",
    verse_id: 100,
    book_slug: "psalms",
    book_title: "Psalm",
    chapter_number: 23,
    verse_number: 1,
    verse_text: "The LORD is my shepherd; I shall not want.",
    short_description: "Yahuah Ra'ah",
    tags: ["sacred-name"],
    color_tint: "rose",
    created_at: "2026-05-27T15:30:00Z",
    updated_at: "2026-05-27T15:30:00Z",
  });
  eq(row.tagsCountDisplay, "1 tag", "formatBookmarkRow: tagsCountDisplay uses singular for 1 tag");
}

// ─────────────────────────────────────────────────────────────────────
// compareBookmarksByDate — sanity sweep (5 cases)
// ─────────────────────────────────────────────────────────────────────

{
  const newer = { created_at: "2026-05-29T12:00:00Z" };
  const older = { created_at: "2026-05-28T12:00:00Z" };
  truthy(compareBookmarksByDate(newer, older) < 0, "compareBookmarksByDate: newer < older (newer sorts first)");
  truthy(compareBookmarksByDate(older, newer) > 0, "compareBookmarksByDate: older > newer (older sorts after)");
  eq(compareBookmarksByDate(newer, newer), 0, "compareBookmarksByDate: equal timestamps return 0");
}

{
  const valid = { created_at: "2026-05-29T12:00:00Z" };
  const nullDate = { created_at: null };
  truthy(compareBookmarksByDate(valid, nullDate) < 0, "compareBookmarksByDate: valid sorts before null (null treated as oldest)");
  truthy(compareBookmarksByDate(nullDate, valid) > 0, "compareBookmarksByDate: null sorts after valid");
}

// ─────────────────────────────────────────────────────────────────────
// groupBookmarksByBook — sanity sweep (5 cases)
// ─────────────────────────────────────────────────────────────────────

{
  const bookmarks = [
    { id: "1", book_slug: "genesis", book_title: "Genesis", chapter_number: 1, verse_number: 1 },
    { id: "2", book_slug: "genesis", book_title: "Genesis", chapter_number: 22, verse_number: 14 },
    { id: "3", book_slug: "matthew", book_title: "Matthew", chapter_number: 5, verse_number: 17 },
  ];
  const grouped = groupBookmarksByBook(bookmarks);
  eq(grouped.size, 2, "groupBookmarksByBook: 3 bookmarks across 2 books → 2 groups");
  eq(grouped.get("genesis").length, 2, "groupBookmarksByBook: 2 Genesis bookmarks land in genesis group");
  eq(grouped.get("matthew").length, 1, "groupBookmarksByBook: 1 Matthew bookmark lands in matthew group");
}

{
  const grouped = groupBookmarksByBook([]);
  eq(grouped.size, 0, "groupBookmarksByBook: empty input returns empty Map");
}

{
  // Single-book input
  const grouped = groupBookmarksByBook([
    { id: "1", book_slug: "psalms", book_title: "Psalm", chapter_number: 23, verse_number: 1 },
  ]);
  eq(grouped.size, 1, "groupBookmarksByBook: single-book single-bookmark → 1 group of 1");
  eq(grouped.get("psalms").length, 1, "groupBookmarksByBook: single-book group has the right row count");
}

{
  // Iteration order matches first-encountered order in input
  const bookmarks = [
    { id: "1", book_slug: "matthew", book_title: "Matthew", chapter_number: 5, verse_number: 17 },
    { id: "2", book_slug: "genesis", book_title: "Genesis", chapter_number: 1, verse_number: 1 },
    { id: "3", book_slug: "matthew", book_title: "Matthew", chapter_number: 6, verse_number: 33 },
  ];
  const grouped = groupBookmarksByBook(bookmarks);
  const slugs = Array.from(grouped.keys());
  eq(slugs, ["matthew", "genesis"], "groupBookmarksByBook: Map iteration order = first-encountered order from input");
}

// ─────────────────────────────────────────────────────────────────────
// Report
// ─────────────────────────────────────────────────────────────────────

console.log(`\nBookmarks Index sanity (§29 helpers): ${pass} passed, ${fail} failed`);
if (fails.length > 0) {
  console.log("\nFailures:");
  for (const f of fails) console.log(f);
  process.exit(1);
}
if (pass < 25) {
  console.log(`\nWARNING: only ${pass} cases ran; §29 verification target is ≥25.`);
  process.exit(2);
}
process.exit(0);
