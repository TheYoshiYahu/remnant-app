/** S451 — sleep timer: off, a number of minutes, or stop at the end of this chapter. */
export type SleepSetting = "off" | "chapter" | 15 | 30 | 60;
export const SLEEP_OPTIONS: { value: SleepSetting; label: string }[] = [
  { value: "off", label: "Off" },
  { value: 15, label: "15 min" },
  { value: 30, label: "30 min" },
  { value: 60, label: "60 min" },
  { value: "chapter", label: "End of chapter" },
];
