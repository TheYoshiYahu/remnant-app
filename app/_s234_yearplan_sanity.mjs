// S234 (Read-the-Scriptures-in-a-Year pacing, roadmap minion B-1) sanity
// test for the pure helpers in:
//
//   app/src/lib/reading-plan/pacing.ts        (buildYearPlan / chunkEvenly /
//                                               dayNumberFor)
//   app/src/lib/reading-plan/plan-store.ts     (state shape: scope /
//                                               startDateISO / position)
//
// The TS modules import chronological-reading.json via a bundler path that
// won't resolve under bare Node, so this test reads the JSON with fs and
// inlines JS ports of the pure chunking + day-math 1:1. Any divergence from
// pacing.ts is a bug.
//
// Asserts:
//   - exactly 365 buckets for BOTH scopes ("canon", "all")
//   - every sequence row appears exactly once across the buckets (no drops,
//     no dupes) for both scopes
//   - bucket sizes differ by at most 1 (remainder front-loaded, no giant day)
//   - Day-N math is correct for sample dates (1-indexed, clamped to [1,365])
//
// Run with: node _s234_yearplan_sanity.mjs

import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";

const __dirname = dirname(fileURLToPath(import.meta.url));
const JSON_PATH = join(__dirname, "src", "data", "chronological-reading.json");

const DAYS_IN_PLAN = 365;

const plan = JSON.parse(readFileSync(JSON_PATH, "utf8"));
const ENTRIES = plan.entries;

// ─────────────────────────────────────────────────────────────────────
// Inlined helper logic — must mirror pacing.ts 1:1
// ─────────────────────────────────────────────────────────────────────

function sequenceForScope(scope) {
  if (scope === "all") return ENTRIES;
  return ENTRIES.filter((e) => e.source === "canon");
}

function chunkEvenly(items, buckets) {
  if (buckets <= 0) return [];
  const total = items.length;
  const base = Math.floor(total / buckets);
  const remainder = total % buckets;
  const out = [];
  let cursor = 0;
  for (let i = 0; i < buckets; i += 1) {
    const size = base + (i < remainder ? 1 : 0);
    out.push(items.slice(cursor, cursor + size));
    cursor += size;
  }
  return out;
}

function buildYearPlan(scope) {
  return chunkEvenly(sequenceForScope(scope), DAYS_IN_PLAN);
}

function civilMidnight(d) {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate()).getTime();
}

function dayNumberFor(startDate, today) {
  const msPerDay = 24 * 60 * 60 * 1000;
  const elapsedDays = Math.round(
    (civilMidnight(today) - civilMidnight(startDate)) / msPerDay,
  );
  const n = elapsedDays + 1;
  if (n < 1) return 1;
  if (n > DAYS_IN_PLAN) return DAYS_IN_PLAN;
  return n;
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

// ── Counts sanity (informational + guards the fixture) ─────────────

const canonCount = sequenceForScope("canon").length;
const allCount = sequenceForScope("all").length;
console.log(`fixture: total=${ENTRIES.length} canon=${canonCount} all=${allCount}`);
ok("fixture has rows", ENTRIES.length > 0);
ok("all scope === full entries length", allCount === ENTRIES.length);
ok("canon scope < all scope (extras exist)", canonCount < allCount);

// ── Per-scope structural assertions ────────────────────────────────

for (const scope of ["canon", "all"]) {
  const seq = sequenceForScope(scope);
  const buckets = buildYearPlan(scope);

  // exactly 365 buckets
  ok(`[${scope}] exactly 365 buckets`, buckets.length === DAYS_IN_PLAN);

  // total rows preserved
  const flat = buckets.flat();
  ok(`[${scope}] total rows preserved (${flat.length} === ${seq.length})`,
    flat.length === seq.length);

  // every row exactly once (no drops, no dupes) — check by seq id
  const seenSeq = new Map();
  for (const row of flat) seenSeq.set(row.seq, (seenSeq.get(row.seq) ?? 0) + 1);
  const sourceSeqs = new Set(seq.map((r) => r.seq));
  let allOnce = seenSeq.size === sourceSeqs.size;
  for (const c of seenSeq.values()) if (c !== 1) allOnce = false;
  for (const s of sourceSeqs) if (!seenSeq.has(s)) allOnce = false;
  ok(`[${scope}] every row appears exactly once (no drops/dupes)`, allOnce);

  // order is preserved end-to-end (flattened buckets === original sequence)
  let orderOk = flat.length === seq.length;
  for (let i = 0; orderOk && i < flat.length; i += 1) {
    if (flat[i].seq !== seq[i].seq) orderOk = false;
  }
  ok(`[${scope}] flattened order matches source sequence`, orderOk);

  // bucket sizes differ by at most 1
  const sizes = buckets.map((b) => b.length);
  const min = Math.min(...sizes);
  const max = Math.max(...sizes);
  ok(`[${scope}] bucket sizes differ by at most 1 (min=${min} max=${max})`,
    max - min <= 1);

  // remainder front-loaded: any larger buckets come before smaller ones
  let frontLoaded = true;
  let sawSmall = false;
  for (const s of sizes) {
    if (s === min) sawSmall = true;
    else if (s === max && sawSmall) frontLoaded = false;
  }
  ok(`[${scope}] larger (remainder) buckets are front-loaded`, frontLoaded);

  // no empty buckets (both scopes have well over 365 chapters)
  ok(`[${scope}] no empty buckets`, min >= 1);
}

// ── Day-N math (1-indexed, civil-day, clamped to [1,365]) ──────────

const start = new Date(2026, 0, 1); // local Jan 1 2026

ok("Day N: start date itself is Day 1",
  dayNumberFor(start, new Date(2026, 0, 1)) === 1);

ok("Day N: next day is Day 2",
  dayNumberFor(start, new Date(2026, 0, 2)) === 2);

ok("Day N: +9 days is Day 10",
  dayNumberFor(start, new Date(2026, 0, 10)) === 10);

ok("Day N: time-of-day ignored (same civil day → Day 1)",
  dayNumberFor(start, new Date(2026, 0, 1, 23, 59)) === 1);

ok("Day N: day 365 exactly (start + 364 days)",
  dayNumberFor(start, new Date(2026, 11, 31)) === 365); // 2026 not leap: Dec 31 = day 365

ok("Day N: before start clamps to 1",
  dayNumberFor(start, new Date(2025, 11, 25)) === 1);

ok("Day N: far past end clamps to 365",
  dayNumberFor(start, new Date(2030, 0, 1)) === 365);

// dayNumber - 1 indexes a valid bucket
{
  const buckets = buildYearPlan("canon");
  const n = dayNumberFor(start, new Date(2026, 0, 10)); // Day 10
  ok("Day N: (dayNumber-1) indexes a non-empty bucket",
    Array.isArray(buckets[n - 1]) && buckets[n - 1].length >= 1);
}

// ── Report ──────────────────────────────────────────────────────────

console.log(`\nS234 yearplan pacing sanity: ${passed} passed, ${failed} failed`);
if (failed > 0) {
  console.log("\nFailures:");
  for (const f of failures) console.log(`  - ${f}`);
  process.exit(1);
}
