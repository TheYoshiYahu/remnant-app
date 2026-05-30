// S173 (Capacitor deep-link router) sanity test for the pure helpers
// in:
//
//   app/src/lib/deep-link.ts
//
// Inlines a JS port of `parseStrongsDeepLink` + `normalizeStrongNumber`
// — the TS module imports @capacitor/* dynamically which Node can't
// resolve under ESM without bundler shims, but the parsing logic
// itself is dependency-free regex + URL parsing. The inlined logic
// must mirror the TS source 1:1; any divergence is a bug.
//
// Boundary cases (per S173 spec):
//
//   parseStrongsDeepLink
//     - apex bible.remnantofpromise.org/strongs/G3056      → "G3056"
//     - api.bible.remnantofpromise.org/strongs/G3056       → "G3056"
//     - lowercase host accepted (URL host comparison)
//     - https vs http scheme both work
//     - query string ignored: /strongs/G3056?utm_source=im → "G3056"
//     - trailing slash: /strongs/G3056/                    → "G3056"
//     - lowercase prefix normalized: /strongs/g3056        → "G3056"
//     - H-prefix Hebrew: /strongs/H1                       → "H0001"
//     - leading zeros preserved: /strongs/H0001            → "H0001"
//     - non-prefixed bare number: /strongs/3056            → null (ambiguous)
//     - wrong path: /something-else/G3056                  → null
//     - not our domain: example.com/strongs/G3056          → null
//     - malformed URL: not a URL at all                    → null
//     - empty path component: /strongs/                    → null
//     - non-numeric: /strongs/Gabc                         → null
//
// Run with: node _s173_deep_link_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic — must mirror deep-link.ts 1:1
// ─────────────────────────────────────────────────────────────────────

function normalizeStrongNumber(raw) {
  const trimmed = raw.trim();
  if (trimmed.length === 0) return null;
  const head = trimmed[0].toUpperCase();
  let prefix;
  let digits;
  if (head === "H" || head === "G") {
    prefix = head;
    digits = trimmed.slice(1);
  } else {
    return null;
  }
  if (!/^[0-9]+$/.test(digits)) return null;
  const padded = digits.padStart(4, "0");
  return `${prefix}${padded}`;
}

function parseStrongsDeepLink(rawUrl) {
  let url;
  try {
    url = new URL(rawUrl);
  } catch {
    return null;
  }
  const host = url.hostname.toLowerCase();
  if (
    host !== "bible.remnantofpromise.org" &&
    host !== "api.bible.remnantofpromise.org"
  ) {
    return null;
  }
  const match = url.pathname.match(/^\/strongs\/([A-Za-z]?[0-9]+)\/?$/);
  if (!match) return null;
  return normalizeStrongNumber(match[1]);
}

// ─────────────────────────────────────────────────────────────────────
// Sanity-test rig
// ─────────────────────────────────────────────────────────────────────

let passed = 0;
let failed = 0;
const failures = [];

function eq(name, actual, expected) {
  if (actual === expected) passed += 1;
  else { failed += 1; failures.push(`${name}\n    expected: ${JSON.stringify(expected)}\n    actual:   ${JSON.stringify(actual)}`); }
}

// ── normalizeStrongNumber ─────────────────────────────────────────

eq("normalize G3056", normalizeStrongNumber("G3056"), "G3056");
eq("normalize g3056 (lowercase)", normalizeStrongNumber("g3056"), "G3056");
eq("normalize H1 → H0001", normalizeStrongNumber("H1"), "H0001");
eq("normalize h1 → H0001", normalizeStrongNumber("h1"), "H0001");
eq("normalize H0001 → H0001 (idempotent)", normalizeStrongNumber("H0001"), "H0001");
eq("normalize H12 → H0012", normalizeStrongNumber("H12"), "H0012");
eq("normalize H123 → H0123", normalizeStrongNumber("H123"), "H0123");
eq("normalize H9999 → H9999", normalizeStrongNumber("H9999"), "H9999");
eq("normalize bare 3056 (no prefix) → null", normalizeStrongNumber("3056"), null);
eq("normalize Habc → null", normalizeStrongNumber("Habc"), null);
eq("normalize empty → null", normalizeStrongNumber(""), null);
eq("normalize G → null (no digits)", normalizeStrongNumber("G"), null);
eq("normalize whitespace → null", normalizeStrongNumber("   "), null);
eq("normalize with surrounding whitespace", normalizeStrongNumber(" G3056 "), "G3056");

// ── parseStrongsDeepLink — happy paths ────────────────────────────

eq("apex https /strongs/G3056",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/G3056"),
  "G3056");

eq("apex http /strongs/G3056",
  parseStrongsDeepLink("http://bible.remnantofpromise.org/strongs/G3056"),
  "G3056");

eq("api subdomain /strongs/G3056",
  parseStrongsDeepLink("https://api.bible.remnantofpromise.org/strongs/G3056"),
  "G3056");

eq("Hebrew /strongs/H1 → H0001",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/H1"),
  "H0001");

eq("query string ignored",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/G3056?utm_source=im&utm_medium=share"),
  "G3056");

eq("trailing slash accepted",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/G3056/"),
  "G3056");

eq("lowercase prefix normalized",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/g3056"),
  "G3056");

eq("zero-padded form passes through",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/H0001"),
  "H0001");

eq("fragment ignored",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/G3056#notes"),
  "G3056");

eq("uppercase host accepted",
  parseStrongsDeepLink("https://BIBLE.REMNANTOFPROMISE.ORG/strongs/G3056"),
  "G3056");

// ── parseStrongsDeepLink — null cases ─────────────────────────────

eq("non-strongs path: /pricing",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/pricing"),
  null);

eq("non-strongs path: /read",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/read"),
  null);

eq("non-strongs path: /something/G3056",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/something/G3056"),
  null);

eq("wrong domain: example.com",
  parseStrongsDeepLink("https://example.com/strongs/G3056"),
  null);

eq("wrong domain: another remnantofpromise subdomain",
  parseStrongsDeepLink("https://www.remnantofpromise.org/strongs/G3056"),
  null);

eq("bare number (no prefix): /strongs/3056",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/3056"),
  null);

eq("non-numeric: /strongs/Gabc",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/Gabc"),
  null);

eq("empty strongs id: /strongs/",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/"),
  null);

eq("malformed URL string",
  parseStrongsDeepLink("not a url"),
  null);

eq("relative URL string",
  parseStrongsDeepLink("/strongs/G3056"),
  null);

eq("nested path: /strongs/G3056/foo",
  parseStrongsDeepLink("https://bible.remnantofpromise.org/strongs/G3056/foo"),
  null);

eq("empty string",
  parseStrongsDeepLink(""),
  null);

// ── Report ────────────────────────────────────────────────────────

console.log(`\nS173 deep-link sanity: ${passed} passed, ${failed} failed`);
if (failed > 0) {
  console.log("\nFailures:");
  for (const f of failures) console.log(`  - ${f}`);
  process.exit(1);
}
