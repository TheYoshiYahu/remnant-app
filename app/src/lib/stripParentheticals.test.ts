/**
 * S144 — tests for the parentheticals-strip utility.
 *
 * No test runner is wired into the app's package.json scripts as of
 * S144. This file documents the expected behavior as
 * runner-agnostic assertions. The patterns work in vitest and jest
 * (both expose globals `describe` / `test` / `expect`), and when a
 * runner is added in a future session the suite will pick up
 * automatically. In the meantime the assertions are clear
 * documentation of the contract and can be run manually via tsx /
 * ts-node.
 *
 * Coverage:
 *   1. The Matt 1:1 verse with multiple parentheticals from the spec
 *      (`Yahusha (Jesus)`, `Mashiach (Christ)`, `David`, `Avraham
 *      (Abraham)`) confirms that the strip correctly hides only the
 *      strip-list entries and leaves the rest intact.
 *   2. The compound-divine-form precedence — `(the LORD God)` must
 *      win against `(God)` so the result reads `Yahuah Elohim` not
 *      `Yahuah Elohim (the LORD)`.
 *   3. The non-strip-list parentheticals (verse refs, technical
 *      asides, KJV-style `(Behold)`) pass through untouched.
 *   4. Empty / nullish input is handled gracefully.
 *   5. The conditional helper respects the `hide` flag.
 */

import {
  stripParentheticals,
  applyParentheticalsToggle,
  STRIP_LIST_FOR_AUDIT,
} from "./stripParentheticals";

// Lightweight test-runner-agnostic harness. When vitest/jest is wired
// up, the global `test`/`describe`/`expect` symbols supersede this.
declare const describe: undefined | ((name: string, fn: () => void) => void);
declare const test: undefined | ((name: string, fn: () => void) => void);
declare const expect: undefined | ((received: unknown) => {
  toBe: (expected: unknown) => void;
  toEqual: (expected: unknown) => void;
  toContain: (expected: unknown) => void;
});
// `process` is the node global, available when this file is executed
// via tsx for the standalone runner path below. Declared here so this
// file compiles under the strict app tsconfig without requiring
// `@types/node` as a dev-dependency.
declare const process: { exit: (code: number) => never } | undefined;

// Fallback assertion runner — invoked when no test framework is present
// so the file can be executed directly via tsx for a quick sanity check.
function assertEq(actual: unknown, expected: unknown, label: string): void {
  if (actual !== expected) {
    throw new Error(
      `FAIL [${label}]\n  expected: ${JSON.stringify(expected)}\n  actual:   ${JSON.stringify(actual)}`,
    );
  }
}

const cases: Array<{ label: string; input: string; expected: string }> = [
  // ---- Case 1: the spec's Matt 1:1 example -------------------------------
  {
    label: "matt 1:1 multi-parenthetical example from spec",
    input:
      "The book of the generation of Yahusha (Jesus) Mashiach (Christ), the son of David, the son of Avraham (Abraham).",
    expected:
      "The book of the generation of Yahusha Mashiach, the son of David, the son of Avraham.",
  },
  // ---- Case 2: compound-form precedence ---------------------------------
  {
    label: "compound (the LORD God) wins against single (God)",
    input:
      "And Yahuah Elohim (the LORD God) formed man of the dust of the ground.",
    expected: "And Yahuah Elohim formed man of the dust of the ground.",
  },
  {
    label: "compound (LORD of hosts) wins against single (LORD)",
    input: "Thus saith Yahuah Tseva'ot (LORD of hosts).",
    expected: "Thus saith Yahuah Tseva'ot.",
  },
  // ---- Case 3: non-strip-list parentheticals pass through ---------------
  {
    label: "verse refs pass through untouched",
    input:
      "The disciples in Matt 13:16-17 (vv.16-17 in some editions) see and hear.",
    expected:
      "The disciples in Matt 13:16-17 (vv.16-17 in some editions) see and hear.",
  },
  {
    label: "technical asides pass through untouched",
    input:
      "The framework reads this (per Red Line #11) as election precedes hearing.",
    expected:
      "The framework reads this (per Red Line #11) as election precedes hearing.",
  },
  {
    label: "KJV-style (Behold) passes through untouched",
    input: "(Behold) the man.",
    expected: "(Behold) the man.",
  },
  // ---- Case 4: edge cases -----------------------------------------------
  {
    label: "empty string returns empty",
    input: "",
    expected: "",
  },
  {
    label: "no parentheticals returns input unchanged",
    input: "The kingdom of heaven is at hand.",
    expected: "The kingdom of heaven is at hand.",
  },
  // ---- Case 5: multiple Hebrew restorations in a single verse -----------
  {
    label: "Matt 14:25 walking-on-water with restored names",
    input:
      "And in the fourth watch of the night Yahusha (Jesus) went unto them, walking on the sea, and the disciples saw him and worshipped the Son of Elohim (God).",
    expected:
      "And in the fourth watch of the night Yahusha went unto them, walking on the sea, and the disciples saw him and worshipped the Son of Elohim.",
  },
  // ---- Case 6: covenant people-names ------------------------------------
  {
    label: "covenant people-names stripped (Israel / Jews / Judah)",
    input:
      "The Yahudim (Jews) of Yahudah (Judah) and the scattered seed of Yashar'el (Israel) are one covenant body.",
    expected:
      "The Yahudim of Yahudah and the scattered seed of Yashar'el are one covenant body.",
  },
  // ---- Case 7: prophet names --------------------------------------------
  {
    label: "Eliyahu / Eliyahu KJV-Greek-form both strip",
    input:
      "Eliyahu (Elijah) the prophet stood up; Sirach calls him Eliyahu (Elias).",
    expected:
      "Eliyahu the prophet stood up; Sirach calls him Eliyahu.",
  },
];

const conditionalCases: Array<{
  label: string;
  input: string;
  hide: boolean;
  expected: string;
}> = [
  {
    label: "applyParentheticalsToggle with hide=true strips",
    input: "Yahuah (LORD) saith.",
    hide: true,
    expected: "Yahuah saith.",
  },
  {
    label: "applyParentheticalsToggle with hide=false returns unchanged",
    input: "Yahuah (LORD) saith.",
    hide: false,
    expected: "Yahuah (LORD) saith.",
  },
];

// ---- Test-runner-agnostic top-level invocation ---------------------------

if (typeof describe === "function" && typeof test === "function" && typeof expect === "function") {
  // Running under vitest / jest — use their globals.
  describe("stripParentheticals", () => {
    for (const c of cases) {
      test(c.label, () => {
        expect!(stripParentheticals(c.input)).toBe(c.expected);
      });
    }
    test("strip list has 50-100 entries (voice-skill spec target ~50-70)", () => {
      expect!(STRIP_LIST_FOR_AUDIT.length >= 50).toBe(true);
      expect!(STRIP_LIST_FOR_AUDIT.length <= 100).toBe(true);
    });
  });

  describe("applyParentheticalsToggle", () => {
    for (const c of conditionalCases) {
      test(c.label, () => {
        expect!(applyParentheticalsToggle(c.input, c.hide)).toBe(c.expected);
      });
    }
  });
} else {
  // No test framework — run the assertions directly so this file can be
  // executed via `tsx app/src/lib/stripParentheticals.test.ts` for a
  // quick sanity check during development.
  let failures = 0;
  for (const c of cases) {
    try {
      assertEq(stripParentheticals(c.input), c.expected, c.label);
    } catch (e) {
      failures += 1;
      console.error((e as Error).message);
    }
  }
  for (const c of conditionalCases) {
    try {
      assertEq(
        applyParentheticalsToggle(c.input, c.hide),
        c.expected,
        c.label,
      );
    } catch (e) {
      failures += 1;
      console.error((e as Error).message);
    }
  }
  console.log(
    `stripParentheticals tests: ${cases.length + conditionalCases.length - failures}/${
      cases.length + conditionalCases.length
    } passing (strip list size: ${STRIP_LIST_FOR_AUDIT.length})`,
  );
  if (failures > 0 && typeof process !== "undefined") {
    process.exit(1);
  }
}
