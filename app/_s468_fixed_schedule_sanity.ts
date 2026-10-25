// S468 sanity: the fixed reading schedule. Run: node --experimental-strip-types _s468_t.ts
import { readFileSync } from "node:fs";
import { pacePlan, diffDaysISO, addDaysISO } from "./src/lib/reading-plan/paced.ts";
const json = JSON.parse(readFileSync("src/data/chronological-reading.json", "utf8"));
const CANON = json.entries.filter((e: any) => e.source === "canon");
let fail = 0; const ok = (c: boolean, m: string) => { if (!c) { fail++; console.error("FAIL", m); } };
const START = "2026-10-01";
// Mirrors year-plan.ts pacedPlanFor: laid from fixedFrom, plus history.
function fixed(st: any) {
  const from = st.fixedFrom ?? { dateISO: START, position: 0 };
  const laid = pacePlan({ sequence: CANON, startISO: START, todayISO: from.dateISO, anchorPosition: from.position, weekAnchorPosition: from.position, pace: st.pace });
  const past = (st.history ?? []).filter(([d]: any) => diffDaysISO(d, from.dateISO) > 0)
    .map(([d, a, b]: any) => ({ dateISO: d, items: CANON.filter((e: any) => e.seq >= a && e.seq <= b) }));
  return [...past, ...laid.days];
}
const pace = { mode: "perDay", perDay: 6 };
const base = fixed({ pace });
ok(base[0].dateISO === START && base[0].items.length === 6, "day 1 = 6 chapters");
// Reading more or less never changes the schedule (position isn't an input).
for (const pos of [0, 3, 40, 200]) ok(JSON.stringify(fixed({ pace, position: pos })) === JSON.stringify(base), "steady at pos " + pos);
// Pace change on day 15 keeps days 1-14 exactly.
const today = addDaysISO(START, 14);
const hist = base.filter((d: any) => diffDaysISO(d.dateISO, today) > 0).map((d: any) => [d.dateISO, d.items[0].seq, d.items.at(-1).seq]);
const after = fixed({ pace: { mode: "perDay", perDay: 3 }, history: hist, fixedFrom: { dateISO: today, position: base[5].items.at(-1).seq } });
const key = (ds: any[]) => JSON.stringify(ds.map((d) => [d.dateISO, d.items.map((i: any) => i.seq)]));
ok(key(after.slice(0, 14)) === key(base.slice(0, 14)), "past days kept");
ok(after[14].dateISO === today && after[14].items.length === 3, "new pace from today");
const seqs = after.slice(14).flatMap((d: any) => d.items.map((i: any) => i.seq));
ok(seqs.length === CANON.filter((e: any) => e.seq > base[5].items.at(-1).seq).length, "nothing lost after relay");
// Default year: even ~3-4/day, 365 days.
const yr = fixed({ pace: { mode: "byDate" } });
ok(yr.length === 365 && yr.at(-1).dateISO === addDaysISO(START, 364), "default year 365 days");
console.log(fail ? `${fail} failures` : "S468 fixed-schedule sanity: all pass");
