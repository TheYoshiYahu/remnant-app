/**
 * moedim.ts — the Leviticus 23 appointed times (+ Qumran extras for Enoch).
 *
 * Family-agnostic: the caller supplies a `resolve(month, day) → instant`
 * function (how this reckoning places a month/day on the civil calendar), a
 * `daytimeWeekday` (for the "morrow after the Sabbath" Firstfruits variant),
 * and a `labelOf(instant)` (to label the computed Feast of Weeks). The eight
 * Lev 23 moedim plus, behind a flag, the three Qumran festivals are returned
 * for ONE biblical year.
 */

import type { FirstfruitsRule, GeoLocation, Moed } from "./types.ts";
import { addBiblicalDays } from "./time.ts";

export interface MoedimYearOptions {
  resolve: (month: number, day: number) => Date;
  /** Daytime weekday of a biblical day, 0 = Sunday … 6 = Saturday. */
  daytimeWeekday: (month: number, day: number) => number;
  /** Month/day label for an arbitrary instant (used for Feast of Weeks). */
  labelOf: (instant: Date) => { month: number; day: number };
  firstfruitsRule: FirstfruitsRule;
  /**
   * Enoch/Qumran overrides Firstfruits to a fixed day-of-month-1 (1/26 — the
   * morrow after the weekly Sabbath that FOLLOWS Unleavened Bread, not the
   * Sunday within it). When set, it takes precedence over `firstfruitsRule`.
   */
  fixedFirstfruitsDay?: number;
  includeQumran: boolean;
  loc: GeoLocation;
}

export function buildMoedimForYear(opts: MoedimYearOptions): Moed[] {
  const { resolve, daytimeWeekday, labelOf, firstfruitsRule, loc } = opts;
  const out: Moed[] = [];

  const add = (
    kind: Moed["kind"],
    name: string,
    month: number,
    day: number,
    endDay?: number,
    extra?: boolean,
  ) => {
    out.push({ kind, name, month, day, startInstant: resolve(month, day), endDay, extra });
  };

  // --- Spring feasts (month 1, Abib) ---
  add("passover", "Passover (Pesach)", 1, 14);
  add("unleavened-bread", "Feast of Unleavened Bread", 1, 15, 21);

  // Firstfruits / Wave Sheaf — rule-dependent.
  let ffDay = 16; // fixed-16 (rabbinic)
  if (opts.fixedFirstfruitsDay !== undefined) {
    ffDay = opts.fixedFirstfruitsDay; // Enoch/Qumran: 1/26
  } else if (firstfruitsRule === "after-weekly-sabbath") {
    // The morrow after the weekly Sabbath that falls within Unleavened Bread:
    // the first day in 15..21 whose daytime weekday is Sunday (0).
    for (let d = 15; d <= 21; d++) {
      if (daytimeWeekday(1, d) === 0) {
        ffDay = d;
        break;
      }
    }
  }
  add("firstfruits", "Firstfruits (Wave Sheaf)", 1, ffDay);

  // Feast of Weeks (Shavuot) — the 50th day, i.e. Firstfruits + 49.
  const weeksInstant = addBiblicalDays(resolve(1, ffDay), 49, loc);
  const weeksLabel = labelOf(weeksInstant);
  out.push({
    kind: "weeks",
    name: "Feast of Weeks (Shavuot)",
    month: weeksLabel.month,
    day: weeksLabel.day,
    startInstant: weeksInstant,
  });

  // --- Fall feasts (month 7) ---
  add("trumpets", "Day of Trumpets (Yom Teruah)", 7, 1);
  add("atonement", "Day of Atonement (Yom Kippur)", 7, 10);
  add("tabernacles", "Feast of Tabernacles (Sukkot)", 7, 15, 21);
  add("shemini-atzeret", "Eighth Day (Shemini Atzeret)", 7, 22);

  // --- Qumran extras (Enoch only, behind the flag) ---
  if (opts.includeQumran) {
    add("new-wine", "Festival of New Wine", 5, 3, undefined, true);
    add("new-oil", "Festival of New Oil", 6, 22, undefined, true);
    add("wood-offering", "Wood Offering", 6, 23, 28, true);
  }

  return out;
}

/** Filter to upcoming moedim (start ≥ query − 18h) and sort ascending. */
export function upcomingMoedim(all: Moed[], query: Date): Moed[] {
  const cutoff = query.getTime() - 18 * 3600 * 1000;
  const seen = new Set<string>();
  return all
    .filter((m) => m.startInstant.getTime() >= cutoff)
    .filter((m) => {
      const key = `${m.kind}@${m.startInstant.getTime()}`;
      if (seen.has(key)) return false;
      seen.add(key);
      return true;
    })
    .sort((a, b) => a.startInstant.getTime() - b.startInstant.getTime());
}
