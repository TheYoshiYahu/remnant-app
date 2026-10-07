// S442 (Year Plan step 2 — read at your own pace) sanity test for the pure
// pacing engine in app/src/lib/reading-plan/paced.ts.
//
// Run with:  node --experimental-strip-types _s442_paced_sanity.mjs
//
// Asserts, for both scopes (canon / all) and every pace mode:
//   - the same chapters, in the same order — none lost, none duplicated
//   - per-day pace honored (every day = k, the last takes what's left)
//   - by-date pace finishes on or before the date, sizes differ by at most 1
//   - weekly goals honored (10 this week, 1 next week), the current week's
//     goal counts what was already read, and overshooting goals just take
//     what's left
//   - reading ahead re-spreads: tomorrow starts where the reader got to,
//     and today's list doesn't change under them (anchored)
//   - positionAfterOpening only moves for in-order reading

import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";
import {
  pacePlan,
  addDaysISO,
  diffDaysISO,
  weekStartFor,
  positionAfterOpening,
  seqBefore,
} from "./src/lib/reading-plan/paced.ts";

const __dirname = dirname(fileURLToPath(import.meta.url));
const json = JSON.parse(
  readFileSync(join(__dirname, "src", "data", "chronological-reading.json"), "utf8"),
);
const ALL = json.entries.map((e) => ({
  seq: e.seq, book_id: e.book_id, book_title: e.book_title, chapter: e.chapter, source: e.source,
}));
const CANON = ALL.filter((e) => e.source === "canon");

let failures = 0;
let passes = 0;
function ok(cond, msg) {
  if (cond) passes += 1;
  else {
    failures += 1;
    console.error("FAIL:", msg);
  }
}

function flat(plan) {
  return plan.days.flatMap((d) => d.items.map((i) => i.seq));
}
function sameOrder(plan, seq, position, label) {
  const want = seq.filter((e) => e.seq > position).map((e) => e.seq);
  const got = flat(plan);
  ok(got.length === want.length, `${label}: count ${got.length} vs ${want.length}`);
  ok(new Set(got).size === got.length, `${label}: duplicates`);
  ok(got.every((s, i) => s === want[i]), `${label}: order differs`);
  ok(plan.remaining === want.length, `${label}: remaining`);
}

const START = "2026-09-21";
const TODAY = "2026-10-07";

for (const [name, seq] of [["canon", CANON], ["all", ALL]]) {
  for (const position of [0, seq[40].seq, seq[seq.length - 5].seq]) {
    // byDate (default year)
    const byDate = pacePlan({ sequence: seq, startISO: START, todayISO: TODAY, anchorPosition: position, pace: { mode: "byDate" } });
    sameOrder(byDate, seq, position, `${name} byDate pos=${position}`);
    if (byDate.finishDateISO) ok(diffDaysISO(byDate.finishDateISO, addDaysISO(START, 364)) >= 0, `${name} byDate finishes by the year end`);
    const sizes = byDate.days.map((d) => d.items.length);
    if (sizes.length) ok(Math.max(...sizes) - Math.min(...sizes) <= 1, `${name} byDate sizes differ by <=1`);
    ok(byDate.days.length === 0 || byDate.days[0].dateISO === TODAY, `${name} byDate starts today`);

    // byDate (custom early date)
    const early = pacePlan({ sequence: seq, startISO: START, todayISO: TODAY, anchorPosition: position, pace: { mode: "byDate", endDateISO: "2026-12-31" } });
    sameOrder(early, seq, position, `${name} byDate Dec31`);
    if (early.finishDateISO) ok(diffDaysISO(early.finishDateISO, "2026-12-31") >= 0, `${name} finishes by Dec 31`);

    // perDay
    for (const k of [1, 3, 5, 10]) {
      const pd = pacePlan({ sequence: seq, startISO: START, todayISO: TODAY, anchorPosition: position, pace: { mode: "perDay", perDay: k } });
      sameOrder(pd, seq, position, `${name} perDay ${k}`);
      ok(pd.days.slice(0, -1).every((d) => d.items.length === k), `${name} perDay ${k}: each day k`);
      ok(pd.days.every((d, i) => d.dateISO === addDaysISO(TODAY, i)), `${name} perDay ${k}: consecutive days`);
    }

    // weekly: 10 this week, 1 next week
    const thisWeek = weekStartFor(START, TODAY);
    const nextWeek = addDaysISO(thisWeek, 7);
    const wk = pacePlan({
      sequence: seq, startISO: START, todayISO: TODAY, anchorPosition: position,
      pace: { mode: "weekly", weeklyGoals: { [thisWeek]: 10, [nextWeek]: 1 } },
    });
    sameOrder(wk, seq, position, `${name} weekly`);
    const inWeek = (w) => wk.days.filter((d) => d.weekStartISO === w).reduce((s, d) => s + d.items.length, 0);
    const remaining = seq.filter((e) => e.seq > position).length;
    ok(inWeek(thisWeek) === Math.min(10, remaining), `${name} weekly: this week = 10 (got ${inWeek(thisWeek)})`);
    if (remaining > 10) ok(inWeek(nextWeek) === Math.min(1, remaining - 10), `${name} weekly: next week = 1 (got ${inWeek(nextWeek)})`);
  }

  // Current week's goal counts chapters already read since the week began.
  const thisWeek = weekStartFor(START, TODAY);
  const weekAnchor = seq[20].seq;
  const anchorNow = seq[26].seq; // 6 read this week
  const wk2 = pacePlan({
    sequence: seq, startISO: START, todayISO: TODAY, anchorPosition: anchorNow, weekAnchorPosition: weekAnchor,
    pace: { mode: "weekly", weeklyGoals: { [thisWeek]: 10 } },
  });
  const left = wk2.days.filter((d) => d.weekStartISO === thisWeek).reduce((s, d) => s + d.items.length, 0);
  ok(left === 4, `${name} weekly: 10-goal with 6 read leaves 4 (got ${left})`);
  sameOrder(wk2, seq, anchorNow, `${name} weekly partial`);

  // Overshooting goals: huge goals just take what's left.
  const big = pacePlan({
    sequence: seq, startISO: START, todayISO: TODAY, anchorPosition: seq[seq.length - 30].seq,
    pace: { mode: "weekly", weeklyGoals: { [thisWeek]: 25, [addDaysISO(thisWeek, 7)]: 25 } },
  });
  sameOrder(big, seq, seq[seq.length - 30].seq, `${name} weekly overshoot`);
  ok(big.days.filter((d) => d.weekStartISO === addDaysISO(thisWeek, 7)).reduce((s, d) => s + d.items.length, 0) === 4, `${name} overshoot: last week takes the 4 left`);

  // Goals on every week up to the end, too small: the plan runs on past the date.
  const goals = {};
  for (let w = thisWeek; diffDaysISO(w, "2027-09-20") >= 0; w = addDaysISO(w, 7)) goals[w] = 1;
  const small = pacePlan({ sequence: seq, startISO: START, todayISO: TODAY, anchorPosition: 0, pace: { mode: "weekly", weeklyGoals: goals } });
  sameOrder(small, seq, 0, `${name} weekly undershoot`);

  // Read ahead re-spreads: anchored today's list is unchanged by reading;
  // tomorrow re-anchors from where the reader got to.
  const pace = { mode: "perDay", perDay: 4 };
  const morning = pacePlan({ sequence: seq, startISO: START, todayISO: TODAY, anchorPosition: seq[50].seq, pace });
  const todayList = morning.days[0].items.map((i) => i.seq);
  const evening = pacePlan({ sequence: seq, startISO: START, todayISO: TODAY, anchorPosition: seq[50].seq, pace });
  ok(JSON.stringify(evening.days[0].items.map((i) => i.seq)) === JSON.stringify(todayList), `${name} anchored today unchanged`);
  const readAheadTo = seq[50 + 12].seq; // read today's 4 plus 8 more
  const tomorrow = pacePlan({ sequence: seq, startISO: START, todayISO: addDaysISO(TODAY, 1), anchorPosition: readAheadTo, pace });
  ok(tomorrow.days[0].items[0].seq === seq[63].seq, `${name} tomorrow starts after where the reader got to`);
  sameOrder(tomorrow, seq, readAheadTo, `${name} re-spread`);

  // positionAfterOpening
  const pos = seq[100].seq;
  ok(positionAfterOpening(seq, pos, seq[101].book_id, seq[101].chapter) === null, `${name} opening next unread doesn't move`);
  ok(positionAfterOpening(seq, pos, seq[102].book_id, seq[102].chapter) === seq[101].seq, `${name} opening the one after marks the next read`);
  const far = seq[400];
  ok(positionAfterOpening(seq, pos, far.book_id, far.chapter) === null, `${name} browsing far ahead doesn't move`);
  ok(seqBefore(seq, seq[10].seq) === seq[9].seq, `${name} seqBefore`);
}

console.log(`${passes} passed, ${failures} failed`);
if (failures) process.exit(1);
