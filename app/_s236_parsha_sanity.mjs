// S236 (Torah Portions, roadmap C-2) sanity test for the pure parsha helper in:
//
//   app/src/lib/torah/parsha.ts          (getParshaForDate / book mapping /
//                                          rabbinic lookup / non-rabbinic walk)
//   app/src/lib/torah/parsha-data.json   (the 54-portion table + bookToSlug)
//
// The TS module imports the calendar engine + JSON via bundler paths that won't
// resolve under bare Node, so — exactly like _s234_yearplan_sanity.mjs — this
// test reads the JSON with fs and inlines JS ports of the pure logic 1:1. Any
// divergence from parsha.ts is a bug. @hebcal/core imports fine under bare Node,
// so the rabbinic assertions call the real package.
//
// Asserts:
//   - data integrity: every HebCal parsha name has a table row; 54 portions
//   - THE gotcha: every parsha's opening book (and every Haftarah's leading
//     book) maps to a real book_id present in chronological-reading.json
//   - rabbinic: known dates → known parshiot (real HebCal lookup)
//   - non-rabbinic: the walk anchors on the elected Sabbath and indexes the
//     portion list by whole weeks from the cycle anchor
//
// Run with: node _s236_parsha_sanity.mjs

import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";
import { HDate, Sedra, parshiot } from "@hebcal/core";

const __dirname = dirname(fileURLToPath(import.meta.url));
const DATA = JSON.parse(
  readFileSync(join(__dirname, "src", "lib", "torah", "parsha-data.json"), "utf8"),
);
const CANON = JSON.parse(
  readFileSync(join(__dirname, "src", "data", "chronological-reading.json"), "utf8"),
);
const CANON_SLUGS = new Set(CANON.entries.map((e) => e.book_id));

const TABLE = DATA.table;
const BOOK_TO_SLUG = DATA.bookToSlug;
const PARSHA_ORDER = parshiot;
const DAY_MS = 86400000;

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic — must mirror parsha.ts 1:1
// ─────────────────────────────────────────────────────────────────────

function bookSlugForName(name) {
  return BOOK_TO_SLUG[name.trim()] ?? null;
}

function upcomingSaturday(date) {
  const d = new Date(date.getFullYear(), date.getMonth(), date.getDate());
  const delta = (6 - d.getDay() + 7) % 7;
  return new Date(d.getTime() + delta * DAY_MS);
}

function weeksBetween(fromSat, toSat) {
  return Math.round((toSat.getTime() - fromSat.getTime()) / (7 * DAY_MS));
}

function parseLeadingBook(ref) {
  const m = ref.match(/^([1-3]?\s?[A-Za-z'’.\- ]+?)\s+(\d+):/);
  if (!m) return null;
  return { book: m[1].trim(), chapter: Number(m[2]) };
}

function entryToPortion(names, sabbathDate, reckoning) {
  const parts = names.map((n) => TABLE[n]).filter(Boolean);
  if (parts.length === 0) return null;
  const first = parts[0];
  const openingSlug = bookSlugForName(first.book);
  if (!openingSlug) return null;
  return {
    name: names.join("-"),
    names,
    torahRef: parts.map((p) => p.torah).join(" · "),
    opening: { book_id: openingSlug, chapter: first.chapter },
    sabbathDate,
    reckoning,
  };
}

function rabbinicParsha(date, reckoning = "rabbinic") {
  for (let wk = 0; wk < 4; wk++) {
    const probe = new Date(date.getTime() + wk * 7 * DAY_MS);
    const hd = new HDate(probe);
    const sedra = new Sedra(hd.getFullYear(), false);
    const res = sedra.lookup(hd);
    if (res.parsha && res.parsha.length > 0 && !res.chag) {
      const sabbath = new HDate(res.hdate.rd).greg();
      return entryToPortion(res.parsha, sabbath, reckoning);
    }
  }
  return null;
}

function nonRabbinicWalk(date, reckoning, anchorSaturday) {
  const thisSat = upcomingSaturday(date);
  const idx = weeksBetween(anchorSaturday, thisSat);
  const clamped = Math.max(0, Math.min(PARSHA_ORDER.length - 1, idx));
  return entryToPortion([PARSHA_ORDER[clamped]], thisSat, reckoning);
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

// ── Data integrity ─────────────────────────────────────────────────
console.log(`fixture: parshiot=${PARSHA_ORDER.length} tableRows=${Object.keys(TABLE).length} canonSlugs=${CANON_SLUGS.size}`);
ok("HebCal lists 54 parshiot", PARSHA_ORDER.length === 54);

let everyNameHasRow = true;
for (const name of PARSHA_ORDER) {
  if (!TABLE[name]) { everyNameHasRow = false; failures.push(`missing table row: ${name}`); }
}
ok("every HebCal parsha name has a table row", everyNameHasRow);
ok("no stray table rows beyond the 54", Object.keys(TABLE).length === PARSHA_ORDER.length);

// ── THE gotcha: every opening + Haftarah book maps to a REAL book_id ───
let everyOpeningMaps = true;
let everyHaftarahMaps = true;
for (const [name, entry] of Object.entries(TABLE)) {
  const slug = bookSlugForName(entry.book);
  if (!slug || !CANON_SLUGS.has(slug)) {
    everyOpeningMaps = false;
    failures.push(`opening book unmapped/not-in-canon: ${name} → ${entry.book} → ${slug}`);
  }
  if (!Number.isInteger(entry.chapter) || entry.chapter < 1) {
    everyOpeningMaps = false;
    failures.push(`bad opening chapter: ${name} → ${entry.chapter}`);
  }
  const haft = parseLeadingBook(entry.haftarah);
  const hslug = haft ? bookSlugForName(haft.book) : null;
  if (!haft || !hslug || !CANON_SLUGS.has(hslug)) {
    everyHaftarahMaps = false;
    failures.push(`haftarah book unmapped/not-in-canon: ${name} → ${entry.haftarah}`);
  }
}
ok("every parsha opening maps to a real book_id + valid chapter", everyOpeningMaps);
ok("every Haftarah leading book maps to a real book_id", everyHaftarahMaps);

// every value in bookToSlug must itself be a real canon slug
let everySlugReal = true;
for (const [bk, slug] of Object.entries(BOOK_TO_SLUG)) {
  if (!CANON_SLUGS.has(slug)) { everySlugReal = false; failures.push(`bookToSlug points nowhere: ${bk} → ${slug}`); }
}
ok("every bookToSlug value exists in chronological-reading.json", everySlugReal);

// ── Rabbinic: known dates → known parshiot (real HebCal) ───────────
const KNOWN = [
  { date: new Date(2026, 5, 20), parsha: "Korach", book: "numbers", chapter: 16 },   // Sat Jun 20 2026
  { date: new Date(2026, 5, 17), parsha: "Korach", book: "numbers", chapter: 16 },   // Wed → coming Shabbat
  { date: new Date(2025, 9, 18), parsha: "Bereshit", book: "genesis", chapter: 1 },  // Sat Oct 18 2025
];
for (const k of KNOWN) {
  const p = rabbinicParsha(k.date);
  ok(`rabbinic ${k.date.toDateString()} → ${k.parsha}`,
    p && p.name === k.parsha && p.opening.book_id === k.book && p.opening.chapter === k.chapter);
  ok(`rabbinic ${k.date.toDateString()} sabbath is a Saturday`,
    p && p.sabbathDate.getDay() === 6);
}

// combined portion still resolves with a real opening (Matot-Masei, Aug 2024)
{
  const p = rabbinicParsha(new Date(2024, 6, 30));
  ok("rabbinic combined portion resolves with mapped opening",
    p && p.names.length >= 1 && CANON_SLUGS.has(p.opening.book_id));
}

// ── Non-rabbinic: anchor walk lands on the elected Sabbath ─────────
{
  // Anchor Bereshit to a known Saturday; week N must yield PARSHA_ORDER[N].
  const anchor = upcomingSaturday(new Date(2025, 9, 18)); // a Saturday
  ok("anchor is a Saturday", anchor.getDay() === 6);

  // Same week as the anchor → portion index 0 (Bereshit).
  const p0 = nonRabbinicWalk(new Date(2025, 9, 18), "enoch", anchor);
  ok("non-rabbinic week 0 → Bereshit", p0 && p0.name === PARSHA_ORDER[0]);
  ok("non-rabbinic sabbathDate equals the elected (this-week) Saturday",
    p0 && p0.sabbathDate.getDay() === 6 &&
    p0.sabbathDate.getTime() === upcomingSaturday(new Date(2025, 9, 18)).getTime());

  // 5 weeks on → PARSHA_ORDER[5].
  const fiveWeeksOn = new Date(anchor.getTime() + 5 * 7 * DAY_MS);
  const p5 = nonRabbinicWalk(fiveWeeksOn, "crescent", anchor);
  ok("non-rabbinic week 5 → 6th portion in order",
    p5 && p5.name === PARSHA_ORDER[5]);
  ok("non-rabbinic walk opening maps to a real book_id",
    p5 && CANON_SLUGS.has(p5.opening.book_id));

  // A weekday mid-week resolves to that week's coming Saturday.
  const wednesday = new Date(anchor.getTime() + 5 * 7 * DAY_MS - 3 * DAY_MS);
  const pw = nonRabbinicWalk(wednesday, "conjunction", anchor);
  ok("non-rabbinic weekday → its coming Shabbat (Saturday)",
    pw && pw.sabbathDate.getDay() === 6);
}

// ── Report ──────────────────────────────────────────────────────────
console.log(`\nS236 parsha sanity: ${passed} passed, ${failed} failed`);
if (failed > 0) {
  console.log("\nFailures:");
  for (const f of failures) console.log(`  - ${f}`);
  process.exit(1);
}
