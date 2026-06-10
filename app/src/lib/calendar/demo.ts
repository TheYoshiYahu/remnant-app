/**
 * demo.ts — a tiny console harness to eyeball engine output.
 *
 * Not part of the app UI (that's a follow-up). Run directly:
 *   node src/lib/calendar/demo.ts
 *   node src/lib/calendar/demo.ts 2026-09-13T12:00:00Z
 */

import { computeBiblicalDate } from "./engine.ts";
import { JERUSALEM, type CalendarConfig, type EngineResult } from "./types.ts";

const WEEKDAYS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

const CONFIGS: Array<{ label: string; config: CalendarConfig }> = [
  {
    label: "Dark moon (conjunction) + equinox year",
    config: {
      month: { kind: "conjunction" },
      year: { kind: "equinox" },
      location: JERUSALEM,
    },
  },
  {
    label: "First crescent (Odeh, predicted) + equinox year",
    config: {
      month: { kind: "crescent", criterion: "odeh", mode: "predicted" },
      year: { kind: "equinox" },
      location: JERUSALEM,
    },
  },
  {
    label: "First crescent (Odeh, local-confirm) + aviv year",
    config: {
      month: { kind: "crescent", criterion: "odeh", mode: "local-confirm" },
      year: { kind: "aviv" },
      location: JERUSALEM,
    },
  },
  {
    label: "Rabbinic (HebCal / calculated)",
    config: {
      month: { kind: "rabbinic" },
      year: { kind: "equinox" },
      location: JERUSALEM,
    },
  },
  {
    label: "Enoch 364-day (equinox re-anchor) + Qumran festivals",
    config: {
      month: { kind: "enoch", intercalation: "equinox-reanchor" },
      year: { kind: "equinox" },
      location: JERUSALEM,
      qumranFestivals: true,
    },
  },
];

function fmt(d: Date): string {
  const wd = WEEKDAYS[(d.getUTCDay() + 1) % 7]; // daytime weekday after sunset
  return `${d.toISOString().replace(".000", "")} (eve→${wd})`;
}

function render(r: EngineResult): string {
  const bd = r.biblicalDate;
  const name = bd.monthName ? ` ${bd.monthName}` : "";
  const lines: string[] = [];
  lines.push(
    `  date:        year ${bd.year}, month ${bd.month}${name}, day ${bd.day}`,
  );
  lines.push(
    `  month start: ${fmt(r.monthStart.startInstant)}  [${r.monthStart.status}]`,
  );
  if (r.monthStart.pending) {
    lines.push(
      `               ↳ tonight-if-sighted ${fmt(r.monthStart.pending.tonightIfSighted)}`,
    );
    lines.push(
      `               ↳ else-tomorrow      ${fmt(r.monthStart.pending.elseTomorrow)}`,
    );
  }
  if (r.yearStart) {
    lines.push(
      `  year start:  ${fmt(r.yearStart.startInstant)}${r.yearStart.assumed ? "  [assumed — no aviv report]" : ""}`,
    );
  }
  const next3 = r.moedim.slice(0, 3);
  lines.push("  next moedim:");
  for (const m of next3) {
    const span = m.endDay ? `${m.month}/${m.day}–${m.endDay}` : `${m.month}/${m.day}`;
    lines.push(
      `    • ${m.name.padEnd(30)} ${span.padEnd(9)} ${fmt(m.startInstant).slice(0, 16)}${m.extra ? "  [Qumran]" : ""}`,
    );
  }
  for (const n of r.notes) lines.push(`  note: ${n}`);
  return lines.join("\n");
}

function main(): void {
  const argv = typeof process !== "undefined" ? process.argv.slice(2) : [];
  const when = argv[0] ? new Date(argv[0]) : new Date("2026-06-09T12:00:00Z");
  console.log(`\nBiblical calendar — ${when.toISOString()} @ Jerusalem\n${"=".repeat(64)}`);
  for (const { label, config } of CONFIGS) {
    console.log(`\n${label}`);
    console.log(render(computeBiblicalDate(when, config)));
  }
  console.log("");
}

declare const process: { argv: string[] } | undefined;
main();
