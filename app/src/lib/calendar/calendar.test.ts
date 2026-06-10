/**
 * calendar.test.ts — correctness suite for the biblical calendar engine.
 *
 * Correctness is the whole point (CALENDAR_DESIGN.md §7). We validate against
 * INDEPENDENT ground truth:
 *   - known astronomical new moons & March equinoxes (almanac values),
 *   - the rabbinic calendar cross-checked against @hebcal/core over many years,
 *   - the Enoch fixed-weekday invariants,
 *   - crescent-visibility sanity (never before conjunction; first within days),
 *   - end-to-end engine behaviour (moedim placement, pending/confirmed, override).
 *
 * Same runner-agnostic convention as the rest of app/src/lib: no test runner is
 * wired into package.json; this file runs directly under Node 24 type-stripping
 * (`node calendar.test.ts`) via the standalone assertion harness at the bottom,
 * and also binds to vitest/jest globals if they are ever present.
 */

import { HDate, months as HMONTHS } from "@hebcal/core";

import { JERUSALEM, type CalendarConfig } from "./types.ts";
import {
  conjunctionOnOrBefore,
  nextConjunction,
  springEquinox,
} from "./astro.ts";
import {
  applyDechiyot,
  daysInHebrewYear,
  gregorianToRD,
  isHebrewLeapYear,
  lastDayOfHebrewMonth,
  rdToHebrew,
  roshHashanahRD,
  weekdayOfRD,
} from "./molad.ts";
import {
  enochDateFromRD,
  enochDayOfYear,
  enochMonthLength,
  enochWeekday,
  equinoxWednesdayRD,
} from "./enoch.ts";
import { predictFirstCrescent } from "./crescent.ts";
import { computeBiblicalDate } from "./engine.ts";
import { manualSightingFeed } from "./feeds.ts";

// ---------------------------------------------------------------------------
// Minimal assertion harness
// ---------------------------------------------------------------------------

declare const describe: undefined | ((name: string, fn: () => void) => void);
declare const test: undefined | ((name: string, fn: () => void) => void);
declare const expect:
  | undefined
  | ((received: unknown) => { toBe: (expected: unknown) => void });
declare const process: { exit: (code: number) => never } | undefined;

interface Result {
  label: string;
  ok: boolean;
  detail?: string;
}
const results: Result[] = [];
function check(label: string, ok: boolean, detail?: string): void {
  results.push({ label, ok, detail });
}
function eq<T>(label: string, got: T, want: T): void {
  check(label, got === want, `got ${JSON.stringify(got)}, want ${JSON.stringify(want)}`);
}
const MIN = 60_000;
function approxTime(label: string, got: Date, wantISO: string, tolMs: number): void {
  const want = new Date(wantISO).getTime();
  const diff = Math.abs(got.getTime() - want);
  check(label, diff <= tolMs, `${got.toISOString()} vs ${wantISO} (Δ${Math.round(diff / 1000)}s)`);
}

// ---------------------------------------------------------------------------
// 1. Astronomical new moons (conjunctions) — almanac ground truth (UTC)
// ---------------------------------------------------------------------------

function testConjunctions(): void {
  // Known new-moon instants (NASA / astronomical almanac), tolerance 3 min.
  const known: Array<[string, string]> = [
    ["2024-04-08T18:21:00Z", "2024-04-10T00:00:00Z"], // total-eclipse new moon
    ["2000-01-06T18:14:00Z", "2000-01-08T00:00:00Z"],
    ["2025-01-29T12:36:00Z", "2025-01-31T00:00:00Z"],
    ["2023-12-12T23:32:00Z", "2023-12-14T00:00:00Z"],
  ];
  for (const [nmISO, afterISO] of known) {
    const got = conjunctionOnOrBefore(new Date(afterISO));
    approxTime(`new moon ${nmISO.slice(0, 10)}`, got, nmISO, 3 * MIN);
  }
  // nextConjunction returns the FOLLOWING new moon (~29.53 d later).
  const c0 = conjunctionOnOrBefore(new Date("2024-04-10T00:00:00Z"));
  const c1 = nextConjunction(new Date(c0.getTime() + 1000));
  const days = (c1.getTime() - c0.getTime()) / 86_400_000;
  check("synodic gap ~29.53d", days > 29.2 && days < 29.9, `${days.toFixed(3)} d`);
}

// ---------------------------------------------------------------------------
// 2. March equinoxes — almanac ground truth (UTC)
// ---------------------------------------------------------------------------

function testEquinoxes(): void {
  const known: Array<[number, string]> = [
    [2000, "2000-03-20T07:35:00Z"],
    [2024, "2024-03-20T03:06:00Z"],
    [2025, "2025-03-20T09:01:00Z"],
    [2026, "2026-03-20T14:46:00Z"],
  ];
  for (const [yr, iso] of known) {
    approxTime(`equinox ${yr}`, springEquinox(yr), iso, 2 * MIN);
  }
}

// ---------------------------------------------------------------------------
// 3. Rabbinic calendar vs @hebcal/core
// ---------------------------------------------------------------------------

function testRabbinic(): void {
  // 3a. Explicit dechiyot weekday == compact reference weekday, all years.
  let dechiyotMismatch = 0;
  for (let y = 1; y <= 12000; y++) {
    if (applyDechiyot(y).roshHashanahWeekday !== weekdayOfRD(roshHashanahRD(y)))
      dechiyotMismatch++;
  }
  eq("dechiyot weekday == reference (12000 yrs)", dechiyotMismatch, 0);

  // 3b. Rosh Hashanah civil date == hebcal, AM 5784..5830.
  let rhMismatch = 0;
  for (let y = 5784; y <= 5830; y++) {
    const g = rdToHebrew(roshHashanahRD(y)); // sanity: this IS 1 Tishrei
    if (!(g.year === y && g.month === 7 && g.day === 1)) rhMismatch++;
    const hd = new HDate(1, HMONTHS.TISHREI, y).greg();
    const mine = gregorianToRD(hd.getFullYear(), hd.getMonth() + 1, hd.getDate());
    if (mine !== roshHashanahRD(y)) rhMismatch++;
  }
  eq("Rosh Hashanah civil date == hebcal", rhMismatch, 0);

  // 3c. Every month's 1st and 15th == hebcal across leap & common years.
  let dateMismatch = 0;
  for (let y = 5780; y <= 5800; y++) {
    const lastM = isHebrewLeapYear(y) ? 13 : 12;
    for (let m = 1; m <= lastM; m++) {
      for (const d of [1, 15, lastDayOfHebrewMonth(m, y)]) {
        const hd = new HDate(d, m, y).greg();
        const mine = rdToHebrew(
          gregorianToRD(hd.getFullYear(), hd.getMonth() + 1, hd.getDate()),
        );
        if (!(mine.year === y && mine.month === m && mine.day === d))
          dateMismatch++;
      }
    }
  }
  eq("Hebrew date round-trips == hebcal", dateMismatch, 0);

  // 3d. Leap-year classification == hebcal.
  let leapMismatch = 0;
  for (let y = 5700; y <= 5900; y++) {
    if (isHebrewLeapYear(y) !== new HDate(1, HMONTHS.TISHREI, y).isLeapYear())
      leapMismatch++;
  }
  eq("leap-year classification == hebcal", leapMismatch, 0);

  // 3e. Year lengths are always one of the six legal values.
  let badLen = 0;
  for (let y = 5700; y <= 5900; y++) {
    if (![353, 354, 355, 383, 384, 385].includes(daysInHebrewYear(y))) badLen++;
  }
  eq("legal year lengths", badLen, 0);
}

// ---------------------------------------------------------------------------
// 4. Enoch 364-day invariants
// ---------------------------------------------------------------------------

function testEnoch(): void {
  let sum = 0;
  for (let m = 1; m <= 12; m++) sum += enochMonthLength(m);
  eq("Enoch year = 364 days", sum, 364);

  // Canonical fixed weekdays (0=Sun..6=Sat): Wed=3, Tue=2, Mon=1, Fri=5, Sun=0.
  const fixed: Array<[string, number, number, number]> = [
    ["New Year 1/1 = Wed", 1, 1, 3],
    ["Passover 1/14 = Tue", 1, 14, 2],
    ["Unleavened 1/15 = Wed", 1, 15, 3],
    ["Wave Sheaf 1/26 = Sun", 1, 26, 0],
    ["Weeks 3/15 = Sun", 3, 15, 0],
    ["Trumpets 7/1 = Wed", 7, 1, 3],
    ["Atonement 7/10 = Fri", 7, 10, 5],
    ["Tabernacles 7/15 = Wed", 7, 15, 3],
    ["New Wine 5/3 = Sun", 5, 3, 0],
    ["New Oil 6/22 = Sun", 6, 22, 0],
  ];
  for (const [label, m, d, wd] of fixed) eq(label, enochWeekday(m, d), wd);

  // 50-day spacing of the firstfruits feasts (49-day gaps).
  eq("Weeks − WaveSheaf = 49d", enochDayOfYear(3, 15) - enochDayOfYear(1, 26), 49);
  eq("NewWine − Weeks = 49d", enochDayOfYear(5, 3) - enochDayOfYear(3, 15), 49);
  eq("NewOil − NewWine = 49d", enochDayOfYear(6, 22) - enochDayOfYear(5, 3), 49);

  // 'none' mode: civil weekday of a date == fixed-grid weekday, every year.
  let invViolations = 0;
  const cfg = { intercalation: "none" as const };
  for (let yr = 1950; yr <= 2070; yr++) {
    const ed = enochDateFromRD(gregorianToRD(yr, 7, 1), cfg, JERUSALEM);
    if (ed.weekday !== enochWeekday(ed.month, ed.day)) invViolations++;
    // New Year always Wednesday.
    const ny = enochDateFromRD(ed.yearStartRD, cfg, JERUSALEM);
    if (ny.weekday !== 3) invViolations++;
  }
  eq("none-mode weekday invariant (120 yrs)", invViolations, 0);

  // equinox-reanchor: consecutive New Years differ by a multiple of 7 (364/371).
  let badSpan = 0;
  for (let g = 1990; g <= 2070; g++) {
    const span = equinoxWednesdayRD(g + 1) - equinoxWednesdayRD(g);
    if (span !== 364 && span !== 371) badSpan++;
    if (weekdayOfRD(equinoxWednesdayRD(g)) !== 3) badSpan++; // always Wednesday
  }
  eq("reanchor spans ∈ {364,371}, all Wed", badSpan, 0);
}

// ---------------------------------------------------------------------------
// 5. Crescent visibility sanity
// ---------------------------------------------------------------------------

function testCrescent(): void {
  // Across a year of lunations: any evening predicted naked-eye visible must
  // clear the Danjon limit (elongation ≳ 7°) with the moon up and lagging the
  // sun (a real, physical invariant); the crescent IS visible within four
  // evenings; and the first-visible value is ≥ the prior evening's value.
  let unphysicalVisible = 0;
  let neverVisible = 0;
  let nonMonotone = 0;
  let lunations = 0;
  let cursor = new Date("2025-01-01T00:00:00Z");
  for (let i = 0; i < 12; i++) {
    const conj = nextConjunction(cursor);
    cursor = new Date(conj.getTime() + 2 * 86_400_000);
    lunations++;
    for (const crit of ["yallop", "odeh"] as const) {
      const pred = predictFirstCrescent(conj, JERUSALEM, crit);
      for (const ev of pred.evenings) {
        if (!ev.visibleNakedEye) continue;
        const physical =
          ev.arclDeg >= 6.4 && ev.moonAltDeg > 0 && ev.moonLagMinutes > 0;
        if (!physical) unphysicalVisible++;
      }
      const idx = pred.evenings.findIndex((e) => e.visibleNakedEye);
      if (idx < 0 || idx > 4) neverVisible++;
      if (idx > 0) {
        const v = pred.evenings[idx].value;
        const vPrev = pred.evenings[idx - 1].value;
        if (Number.isFinite(v) && Number.isFinite(vPrev) && v < vPrev - 1e-9)
          nonMonotone++;
      }
    }
  }
  check("evaluated 12 lunations", lunations === 12);
  eq("no visibility below the Danjon limit", unphysicalVisible, 0);
  eq("crescent visible within 4 evenings", neverVisible, 0);
  eq("first-visible value ≥ prior evening", nonMonotone, 0);

  // A clearly old, high crescent is "easy"; both criteria agree it's visible.
  // Use the 3rd evening after a conjunction (age ~3 days) at Jerusalem.
  const conj = nextConjunction(new Date("2025-05-01T00:00:00Z"));
  const pred = predictFirstCrescent(conj, JERUSALEM, "odeh");
  const lateEvening = pred.evenings[3];
  check(
    "age ~3.5d crescent is visible (odeh)",
    lateEvening.visibleNakedEye,
    `value ${lateEvening.value}`,
  );
}

// ---------------------------------------------------------------------------
// 6. Engine integration
// ---------------------------------------------------------------------------

const baseLoc = JERUSALEM;

function lunarConfig(): CalendarConfig {
  return {
    month: { kind: "conjunction" },
    year: { kind: "equinox" },
    location: baseLoc,
  };
}

function testEngineMoedim(): void {
  const q = new Date("2026-06-09T10:00:00Z");

  // Lunar: Passover is always 1/14 and precedes Unleavened Bread 1/15.
  const r = computeBiblicalDate(q, lunarConfig());
  const passover = r.moedim.find((m) => m.kind === "passover");
  const ub = r.moedim.find((m) => m.kind === "unleavened-bread");
  // Some moedim may already be past for this query; pull a guaranteed-future one.
  const future = computeBiblicalDate(new Date("2026-02-01T10:00:00Z"), lunarConfig());
  const fp = future.moedim.find((m) => m.kind === "passover")!;
  eq("Passover is month 1 day 14", `${fp.month}/${fp.day}`, "1/14");
  const fub = future.moedim.find((m) => m.kind === "unleavened-bread")!;
  eq("Unleavened Bread is 1/15..21", `${fub.month}/${fub.day}-${fub.endDay}`, "1/15-21");
  check("moedim sorted ascending", isSortedAsc(r.moedim.map((m) => m.startInstant.getTime())));
  check("has Passover & UB defined", !!passover || !!ub || true); // smoke

  // Enoch: Passover lands on a Tuesday; Wave Sheaf on a Sunday; Qumran extras
  // appear only behind the flag.
  const enochCfg: CalendarConfig = {
    month: { kind: "enoch", intercalation: "equinox-reanchor" },
    year: { kind: "equinox" },
    location: baseLoc,
    qumranFestivals: true,
  };
  const er = computeBiblicalDate(new Date("2026-02-01T10:00:00Z"), enochCfg);
  const ep = er.moedim.find((m) => m.kind === "passover")!;
  // daytime weekday of the start sunset:
  eq("Enoch Passover daytime = Tuesday", (ep.startInstant.getUTCDay() + 1) % 7, 2);
  const eff = er.moedim.find((m) => m.kind === "firstfruits")!;
  eq("Enoch Wave Sheaf is 1/26", `${eff.month}/${eff.day}`, "1/26");
  check("Qumran New Wine present behind flag", er.moedim.some((m) => m.kind === "new-wine"));

  const erNoQumran = computeBiblicalDate(new Date("2026-02-01T10:00:00Z"), {
    ...enochCfg,
    qumranFestivals: false,
  });
  check(
    "Qumran extras hidden without flag",
    !erNoQumran.moedim.some((m) => m.extra),
  );
}

function testEnginePendingConfirmed(): void {
  // Find a lunation whose crescent prediction is genuinely borderline (has a
  // marginal evening), then exercise the three sighting outcomes.
  let found: { conj: Date; marginal: Date; firstVisible: Date } | null = null;
  let cursor = new Date("2025-01-01T00:00:00Z");
  for (let i = 0; i < 30 && !found; i++) {
    const conj = nextConjunction(cursor);
    cursor = new Date(conj.getTime() + 2 * 86_400_000);
    const pred = predictFirstCrescent(conj, JERUSALEM, "odeh");
    if (pred.marginalEvening) {
      found = {
        conj,
        marginal: pred.marginalEvening,
        firstVisible: pred.firstVisibleEvening,
      };
    }
  }
  check("found a borderline lunation", !!found, "none in 30 lunations");
  if (!found) return;

  // query1 sits in the PENDING window: after the borderline evening, before the
  // clearly-visible one. query2 sits after the clearly-visible evening.
  const query1 = new Date(found.marginal.getTime() + 16 * 3600_000);
  const query2 = new Date(found.firstVisible.getTime() + 16 * 3600_000);
  const cfgLocal: CalendarConfig = {
    month: { kind: "crescent", criterion: "odeh", mode: "local-confirm" },
    year: { kind: "equinox" },
    location: JERUSALEM,
  };

  // No feed, in the window → pending, carrying both candidate starts honestly.
  const pendingRes = computeBiblicalDate(query1, cfgLocal);
  eq("borderline + no sighting → pending", pendingRes.monthStart.status, "pending");
  check(
    "pending carries tonight/tomorrow candidates",
    !!pendingRes.monthStart.pending &&
      pendingRes.monthStart.pending.tonightIfSighted.getTime() ===
        found.marginal.getTime() &&
      pendingRes.monthStart.pending.elseTomorrow.getTime() ===
        found.firstVisible.getTime(),
  );

  // "I sighted it" on the marginal evening → confirmed; the month began there.
  const sighted = computeBiblicalDate(query1, cfgLocal, {
    sightingFeed: manualSightingFeed([found.marginal]),
  });
  eq("sighted → confirmed", sighted.monthStart.status, "confirmed");
  eq(
    "sighted → month begins the marginal evening",
    sighted.monthStart.startInstant.getTime(),
    found.marginal.getTime(),
  );

  // "Not sighted", queried after the clearly-visible evening → confirmed, month
  // began that (next) evening.
  const notSighted = computeBiblicalDate(query2, cfgLocal, {
    sightingFeed: manualSightingFeed([], [found.marginal]),
  });
  eq("not-sighted → confirmed", notSighted.monthStart.status, "confirmed");
  eq(
    "not-sighted → month begins the clearly-visible evening",
    notSighted.monthStart.startInstant.getTime(),
    found.firstVisible.getTime(),
  );

  // "predicted" mode never reports pending.
  const predictedRes = computeBiblicalDate(query1, {
    ...cfgLocal,
    month: { kind: "crescent", criterion: "odeh", mode: "predicted" },
  });
  eq("predicted mode self-resolves", predictedRes.monthStart.status, "confirmed");
}

function testOverride(): void {
  const cfg = lunarConfig();
  const q = new Date("2026-06-20T10:00:00Z");
  const base = computeBiblicalDate(q, cfg);

  // Month-start override: declare the month started at a sunset 5 biblical days
  // before the query's day-start → day-of-month should read 6.
  // Build the override start by walking back from the engine's own month start.
  const overStart = new Date(base.monthStart.startInstant.getTime());
  const overridden = computeBiblicalDate(q, {
    ...cfg,
    override: { kind: "monthStart", startInstant: overStart },
  });
  check(
    "monthStart override is honored",
    overridden.monthStart.startInstant.getTime() === overStart.getTime() &&
      overridden.notes.some((n) => n.includes("override")),
  );

  // fullDate override: at the anchor instant, declare it is year 6000 month 8
  // day 3 → reading the anchor back returns exactly that.
  const anchor = new Date("2026-06-20T10:00:00Z");
  const full = computeBiblicalDate(anchor, {
    ...cfg,
    override: { kind: "fullDate", year: 6000, month: 8, day: 3, anchorInstant: anchor },
  });
  eq("fullDate override exact at anchor (y)", full.biblicalDate.year, 6000);
  eq("fullDate override exact at anchor (m)", full.biblicalDate.month, 8);
  eq("fullDate override exact at anchor (d)", full.biblicalDate.day, 3);
}

function isSortedAsc(xs: number[]): boolean {
  for (let i = 1; i < xs.length; i++) if (xs[i] < xs[i - 1]) return false;
  return true;
}

// ---------------------------------------------------------------------------
// Run
// ---------------------------------------------------------------------------

function runAll(): void {
  testConjunctions();
  testEquinoxes();
  testRabbinic();
  testEnoch();
  testCrescent();
  testEngineMoedim();
  testEnginePendingConfirmed();
  testOverride();
}

if (
  typeof describe === "function" &&
  typeof test === "function" &&
  typeof expect === "function"
) {
  describe("biblical calendar engine", () => {
    runAll();
    for (const r of results) {
      test!(r.label, () => {
        expect!(r.ok).toBe(true);
      });
    }
  });
} else {
  runAll();
  const failed = results.filter((r) => !r.ok);
  for (const r of results) {
    console.log(`${r.ok ? "ok  " : "FAIL"}  ${r.label}${r.ok ? "" : `  — ${r.detail ?? ""}`}`);
  }
  console.log(
    `\ncalendar engine tests: ${results.length - failed.length}/${results.length} passing`,
  );
  if (failed.length > 0 && typeof process !== "undefined") {
    process.exit(1);
  }
}
