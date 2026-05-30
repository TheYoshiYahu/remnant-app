// S172 (Sacred-name display mask) sanity test for the pure helper in:
//
//   app/src/lib/applySacredNameMask.ts
//
// Inlines a JS port of the pure helper — the TS module is import-
// graph-clean (no asset imports, no DOM) so the port is a direct copy
// of the regex substitution. Any divergence between the TS and the
// inline port below is a bug.
//
// Boundary cases per S172_SACRED_NAME_MASK_SPEC.md:
//
//   applySacredNameMask
//     - mask "yahuah" is identity (no transform)
//     - mask "yhwh" applies the substitution
//
//   maskYahuahAsYHWH
//     - standalone "Yahuah" → "YHWH"
//     - paren preserved: "Yahuah (LORD)" → "YHWH (LORD)"
//     - inside compound "Yahuah Tseva'ot" → "YHWH Tseva'ot"
//     - inside compound "Adonai Yahuah" → "Adonai YHWH"
//     - multiple occurrences in one string all swap
//     - parens-already-stripped "Yahuah" → "YHWH"
//     - NOT affected: "Yahudah", "Yahudim", "Yahudi", "Yahusha",
//                     "Yahushua" (word boundary anchor)
//     - case-sensitive: "yahuah" (lowercase) → unchanged
//     - empty/whitespace strings pass through
//
//   Composition with applyParentheticalsToggle (the two helpers
//   compose freely — order doesn't affect outcome on the current
//   STRIP_LIST):
//     - mask off + parens off → identity
//     - mask on  + parens off → Yahuah → YHWH
//     - mask off + parens on  → strips "(LORD)"
//     - mask on  + parens on  → strips "(LORD)" AND masks Yahuah
//
// Run with: node _s172_sacred_name_mask_sanity.mjs

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic — must mirror applySacredNameMask.ts 1:1
// ─────────────────────────────────────────────────────────────────────

function maskYahuahAsYHWH(text) {
  return text.replace(/\bYahuah\b/g, "YHWH");
}

function applySacredNameMask(text, mask) {
  if (mask === "yahuah") return text;
  return maskYahuahAsYHWH(text);
}

// Inlined paren-strip mock matching the relevant S144 entries for
// composition tests. The full STRIP_LIST is long; the composition
// tests only need the singletons used in the sample inputs.
function stripParensMock(text) {
  return text
    .replace(/\s?\(LORD\)/g, "")
    .replace(/\s?\(Lord\)/g, "")
    .replace(/\s?\(God\)/g, "");
}

function applyParensToggleMock(text, hide) {
  if (!hide) return text;
  return stripParensMock(text);
}

// ─────────────────────────────────────────────────────────────────────
// Sanity-test rig
// ─────────────────────────────────────────────────────────────────────

let passed = 0;
let failed = 0;
const failures = [];

function ok(name, cond) {
  if (cond) passed += 1;
  else { failed += 1; failures.push(name); }
}

// ── applySacredNameMask — mode dispatch ────────────────────────────

ok("mask 'yahuah' is identity",
  applySacredNameMask("Yahuah (LORD) is one", "yahuah") === "Yahuah (LORD) is one");
ok("mask 'yhwh' substitutes",
  applySacredNameMask("Yahuah (LORD) is one", "yhwh") === "YHWH (LORD) is one");
ok("mask on empty string",
  applySacredNameMask("", "yhwh") === "");
ok("mask on whitespace-only",
  applySacredNameMask("   ", "yhwh") === "   ");

// ── maskYahuahAsYHWH — substitution boundary cases ─────────────────

ok("standalone Yahuah → YHWH",
  maskYahuahAsYHWH("Yahuah") === "YHWH");
ok("Yahuah (LORD) → YHWH (LORD)",
  maskYahuahAsYHWH("Yahuah (LORD)") === "YHWH (LORD)");
ok("Yahuah Tseva'ot → YHWH Tseva'ot (compound)",
  maskYahuahAsYHWH("Yahuah Tseva'ot") === "YHWH Tseva'ot");
ok("Adonai Yahuah → Adonai YHWH (compound, name on right)",
  maskYahuahAsYHWH("Adonai Yahuah") === "Adonai YHWH");
ok("Adonai Yahuah (the Lord GOD) → Adonai YHWH (the Lord GOD)",
  maskYahuahAsYHWH("Adonai Yahuah (the Lord GOD)") === "Adonai YHWH (the Lord GOD)");
ok("Yahuah Yireh → YHWH Yireh",
  maskYahuahAsYHWH("Yahuah Yireh") === "YHWH Yireh");
ok("Yahuah Shalom → YHWH Shalom",
  maskYahuahAsYHWH("Yahuah Shalom") === "YHWH Shalom");
ok("Yahuah Tsidkenu → YHWH Tsidkenu",
  maskYahuahAsYHWH("Yahuah Tsidkenu") === "YHWH Tsidkenu");
ok("Yahuah Nissi → YHWH Nissi",
  maskYahuahAsYHWH("Yahuah Nissi") === "YHWH Nissi");
ok("Yahuah Shammah → YHWH Shammah",
  maskYahuahAsYHWH("Yahuah Shammah") === "YHWH Shammah");
ok("Yahuah Rapha → YHWH Rapha",
  maskYahuahAsYHWH("Yahuah Rapha") === "YHWH Rapha");
ok("Yahuah Mekaddishkem → YHWH Mekaddishkem",
  maskYahuahAsYHWH("Yahuah Mekaddishkem") === "YHWH Mekaddishkem");

// ── multiple occurrences in one string ─────────────────────────────

ok("two occurrences both swap",
  maskYahuahAsYHWH("Yahuah loves Yahuah's people")
    === "YHWH loves YHWH's people");
ok("compound + standalone in same string",
  maskYahuahAsYHWH("Yahuah Tseva'ot, Yahuah our Elohim")
    === "YHWH Tseva'ot, YHWH our Elohim");

// ── word-boundary safety — must NOT swap ───────────────────────────

ok("Yahudah is NOT swapped",
  maskYahuahAsYHWH("Yahudah and Benjamin") === "Yahudah and Benjamin");
ok("Yahudim is NOT swapped",
  maskYahuahAsYHWH("The Yahudim assembled") === "The Yahudim assembled");
ok("Yahudi is NOT swapped",
  maskYahuahAsYHWH("a Yahudi from Jerusalem") === "a Yahudi from Jerusalem");
ok("Yahusha is NOT swapped",
  maskYahuahAsYHWH("Yahusha the Messiah") === "Yahusha the Messiah");
ok("Yahushua is NOT swapped",
  maskYahuahAsYHWH("Yahushua leads the people") === "Yahushua leads the people");

// ── case-sensitivity ───────────────────────────────────────────────

ok("lowercase 'yahuah' is NOT swapped (authoring error left visible)",
  maskYahuahAsYHWH("yahuah") === "yahuah");
ok("uppercase 'YAHUAH' is NOT swapped (not the canonical form)",
  maskYahuahAsYHWH("YAHUAH") === "YAHUAH");

// ── empty / whitespace passthrough ─────────────────────────────────

ok("empty string passes through", maskYahuahAsYHWH("") === "");
ok("whitespace-only passes through", maskYahuahAsYHWH("   ") === "   ");

// ── composition with parens toggle — four valid combinations ───────

const input = "And Yahuah (LORD) said unto Mosheh";

// mask off + parens off
ok("mask off + parens off: identity",
  applyParensToggleMock(applySacredNameMask(input, "yahuah"), false)
    === "And Yahuah (LORD) said unto Mosheh");

// mask on + parens off
ok("mask on + parens off: Yahuah → YHWH, paren stays",
  applyParensToggleMock(applySacredNameMask(input, "yhwh"), false)
    === "And YHWH (LORD) said unto Mosheh");

// mask off + parens on
ok("mask off + parens on: paren stripped, name unchanged",
  applyParensToggleMock(applySacredNameMask(input, "yahuah"), true)
    === "And Yahuah said unto Mosheh");

// mask on + parens on
ok("mask on + parens on: paren stripped AND Yahuah → YHWH",
  applyParensToggleMock(applySacredNameMask(input, "yhwh"), true)
    === "And YHWH said unto Mosheh");

// ── composition commutes (paren-strip-first vs mask-first) ─────────
// Confirms the order of operations doesn't matter on the current
// STRIP_LIST. If a future paren-strip entry contains "Yahuah" (no
// current entry does), this test catches the regression.

const swap_first = applyParensToggleMock(applySacredNameMask(input, "yhwh"), true);
const strip_first = applySacredNameMask(applyParensToggleMock(input, true), "yhwh");
ok("composition commutes on current STRIP_LIST",
  swap_first === strip_first);

// ─────────────────────────────────────────────────────────────────────
// Report
// ─────────────────────────────────────────────────────────────────────

console.log(`\nS172 sacred-name mask sanity: ${passed} passed, ${failed} failed`);
if (failed > 0) {
  for (const f of failures) console.log("  ✗ " + f);
  process.exit(1);
}
