// S140 sanity test for teaserOfVerse() in app/src/lib/search-helpers.ts.
//
// Powers the free-tier cross-edition search funnel (DESIGN_LANGUAGE.md §9
// reconciliation note #4): tier-locked search hits render a ~25-word
// teaser centered on the match so the free reader sees what their search
// matched in a paid-tier edition. Curiosity does the selling.
//
// Run with: node _s140_search_teaser_sanity.mjs

const TEASER_WORD_TARGET = 25;
const TEASER_WORDS_BEFORE = 10;

function teaserOfVerse(verseText, query) {
  const words = verseText.split(/\s+/);
  if (words.length <= TEASER_WORD_TARGET) return verseText;

  const trimmedQuery = (query || "").trim();
  if (!trimmedQuery) {
    return words.slice(0, TEASER_WORD_TARGET).join(" ") + "…";
  }

  const lowerText = verseText.toLowerCase();
  const lowerQuery = trimmedQuery.toLowerCase();
  const matchCharIdx = lowerText.indexOf(lowerQuery);
  if (matchCharIdx === -1) {
    return words.slice(0, TEASER_WORD_TARGET).join(" ") + "…";
  }

  let charCursor = 0;
  let matchWordIdx = 0;
  for (let i = 0; i < words.length; i++) {
    const wordEnd = charCursor + words[i].length;
    if (matchCharIdx <= wordEnd) {
      matchWordIdx = i;
      break;
    }
    charCursor = wordEnd + 1;
  }

  if (matchWordIdx < TEASER_WORD_TARGET) {
    return words.slice(0, TEASER_WORD_TARGET).join(" ") + "…";
  }

  const start = Math.max(0, matchWordIdx - TEASER_WORDS_BEFORE);
  const end = Math.min(words.length, start + TEASER_WORD_TARGET);
  const leading = start > 0 ? "…" : "";
  const trailing = end < words.length ? "…" : "";
  return leading + words.slice(start, end).join(" ") + trailing;
}

// ─────────────────────────────────────────────────────────────────────
// Boundary cases
// ─────────────────────────────────────────────────────────────────────

const longVerse =
  "And it came to pass when the children of men had multiplied that in those days were born unto them beautiful and comely daughters and the watchers the sons of the heaven saw and lusted after them and said to one another come let us choose us wives from among the children of men and beget us children";

const shortVerse =
  "And he answered and said Watchers be gone.";

let passed = 0;
let failed = 0;
function check(label, actual, expected) {
  const ok = actual === expected;
  if (ok) {
    passed++;
    console.log(`  ✓ ${label}`);
  } else {
    failed++;
    console.log(`  ✗ ${label}`);
    console.log(`      expected: ${JSON.stringify(expected)}`);
    console.log(`      actual:   ${JSON.stringify(actual)}`);
  }
}

console.log("teaserOfVerse — boundary cases");

check(
  "short verse (under target word count) returns full text unchanged",
  teaserOfVerse(shortVerse, "Watchers"),
  shortVerse,
);

check(
  "long verse, empty query, returns first 25 words + ellipsis",
  teaserOfVerse(longVerse, ""),
  longVerse.split(/\s+/).slice(0, 25).join(" ") + "…",
);

check(
  "long verse, query in first 25 words, returns first 25 words + ellipsis",
  teaserOfVerse(longVerse, "multiplied"),
  longVerse.split(/\s+/).slice(0, 25).join(" ") + "…",
);

check(
  "long verse, query deeper, returns ellipsis + 25 words centered + ellipsis",
  teaserOfVerse(longVerse, "wives"),
  (() => {
    const words = longVerse.split(/\s+/);
    const matchWordIdx = words.findIndex((w) => w.toLowerCase().includes("wives"));
    const start = Math.max(0, matchWordIdx - 10);
    const end = Math.min(words.length, start + 25);
    return (start > 0 ? "…" : "") + words.slice(start, end).join(" ") + (end < words.length ? "…" : "");
  })(),
);

check(
  "long verse, query not found, returns first 25 words + ellipsis",
  teaserOfVerse(longVerse, "Hippopotamus"),
  longVerse.split(/\s+/).slice(0, 25).join(" ") + "…",
);

check(
  "case-insensitive match — uppercase query against lowercase text",
  teaserOfVerse(longVerse, "WATCHERS"),
  (() => {
    const words = longVerse.split(/\s+/);
    const matchWordIdx = words.findIndex((w) => w.toLowerCase().includes("watchers"));
    if (matchWordIdx < 25) {
      return words.slice(0, 25).join(" ") + "…";
    }
    const start = Math.max(0, matchWordIdx - 10);
    const end = Math.min(words.length, start + 25);
    return (start > 0 ? "…" : "") + words.slice(start, end).join(" ") + (end < words.length ? "…" : "");
  })(),
);

console.log();
console.log(`${passed} passed, ${failed} failed`);
process.exit(failed > 0 ? 1 : 0);
