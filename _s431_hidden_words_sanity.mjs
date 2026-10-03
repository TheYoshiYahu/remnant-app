#!/usr/bin/env node
/**
 * S431 — Hidden Words bundle sanity check.
 *
 * Validates the two static bundles the reader ships with:
 *   app/public/hidden-words-index.json   (surface -> {k, n})
 *   app/public/hidden-words-table.json   (key -> {n, rows:[...]})
 *
 * Checks (fail-loud, exit 1 on any failure):
 *   1. Both bundles parse as JSON objects.
 *   2. Every index entry points at a real table key, and its n matches
 *      the table entry's n (index.n === table[k].n === rows.length).
 *   3. Restored names (god/lord/jesus/christ/israel/judah/jew...) never
 *      appear as a table key — they are excluded by design.
 *   4. Spec test words resolve with the expected minimum counts and the
 *      expected Strong's numbers are present among their rows.
 *   5. Every table row carries the required fields (o, x, s, m, byb).
 *
 * Run:  node ~/Desktop/App/_s431_hidden_words_sanity.mjs
 */
import { readFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const here = dirname(fileURLToPath(import.meta.url));
const PUB = join(here, "app", "public");

let fails = 0;
const fail = (msg) => {
  console.error("  ✗ " + msg);
  fails++;
};
const ok = (msg) => console.log("  ✓ " + msg);

// ---- 1. parse ------------------------------------------------------------
const index = JSON.parse(readFileSync(join(PUB, "hidden-words-index.json"), "utf8"));
const table = JSON.parse(readFileSync(join(PUB, "hidden-words-table.json"), "utf8"));
const indexKeys = Object.keys(index);
const tableKeys = Object.keys(table);
console.log(`\nindex: ${indexKeys.length} surface forms   table: ${tableKeys.length} english keys\n`);
if (indexKeys.length === 0) fail("index is empty");
if (tableKeys.length === 0) fail("table is empty");

// ---- 2. index -> table coherence ----------------------------------------
let missing = 0, mismatched = 0;
for (const surf of indexKeys) {
  const hit = index[surf];
  const te = table[hit.k];
  if (!te) { if (missing < 5) fail(`index "${surf}" -> key "${hit.k}" has no table entry`); missing++; continue; }
  const rowsLen = Array.isArray(te.rows) ? te.rows.length : -1;
  if (hit.n !== te.n || te.n !== rowsLen) {
    if (mismatched < 5) fail(`count mismatch for "${hit.k}": index.n=${hit.n} table.n=${te.n} rows=${rowsLen}`);
    mismatched++;
  }
}
if (missing === 0) ok("every index entry points at a real table key");
else fail(`${missing} index entries point at missing table keys`);
if (mismatched === 0) ok("index.n === table.n === rows.length everywhere");
else fail(`${mismatched} count mismatches`);

// ---- 3. restored names excluded ------------------------------------------
const RESTORED = ["god","lord","jesus","christ","jah","israel","judah","jew","jews","jewish","melchizedek","melchisedec"];
const leaked = RESTORED.filter((n) => table[n]);
if (leaked.length === 0) ok("no restored names appear as table keys");
else fail("restored names leaked into table: " + leaked.join(", "));

// ---- 4. spec test words ---------------------------------------------------
// [key, minCount, [strong numbers that MUST be present]]
const SPEC = [
  ["serpent", 2, ["H5175", "G3789"]],
  ["devil",   2, ["G1228", "G1140"]],
  ["beast",   3, ["G2342", "G2226"]],
  ["dragon",  2, ["G1404"]],
];
for (const [key, minN, musts] of SPEC) {
  const te = table[key];
  if (!te) { fail(`spec word "${key}" missing from table`); continue; }
  const strongs = new Set((te.rows || []).map((r) => r.s));
  const have = musts.filter((s) => strongs.has(s));
  const okCount = te.n >= minN;
  const okStrongs = have.length === musts.length;
  if (okCount && okStrongs) ok(`${key}: ${te.n} originals, includes ${musts.join("+")}`);
  else {
    if (!okCount) fail(`${key}: n=${te.n} < expected >=${minN}`);
    if (!okStrongs) fail(`${key}: missing Strong's ${musts.filter((s)=>!strongs.has(s)).join(",")}  (has: ${[...strongs].join(",")})`);
  }
}

// ---- 5. row shape ---------------------------------------------------------
let badRows = 0;
for (const k of tableKeys) {
  for (const r of table[k].rows || []) {
    if (!r.o || !r.s || typeof r.m !== "string" || typeof r.byb !== "object") {
      if (badRows < 5) fail(`malformed row in "${k}": ${JSON.stringify(r).slice(0,120)}`);
      badRows++;
    }
  }
}
if (badRows === 0) ok("every table row has o / s / m / byb");
else fail(`${badRows} malformed rows`);

// ---- verdict --------------------------------------------------------------
console.log();
if (fails === 0) { console.log("ALL SANITY CHECKS PASSED ✓\n"); process.exit(0); }
else { console.error(`SANITY FAILED — ${fails} problem(s) ✗\n`); process.exit(1); }
