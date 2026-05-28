/**
 * S161 — tests for verse-align.ts.
 *
 * Same convention as `stripParentheticals.test.ts`: no test runner is
 * wired into package.json (the existing project pattern as of S144).
 * These assertions document the contract for the multi-word surface
 * match and the cursor-advance-on-mismatch (single-step orphan skip)
 * landed at S161. When a runner is added the suite picks up
 * automatically via the typeof-guard below; in the meantime they
 * serve as the spec and run via the fallback assertion harness when
 * executed directly (tsx).
 *
 * Coverage:
 *   1. Single-word match (S121 regression baseline).
 *   2. Multi-word surface match — USFX "wilt thou" wrapped under a
 *      single G2309 tag aligns to displayed "will you" (S149-
 *      modernized) as ONE tappable span carrying G2309.
 *   3. Cursor-advance on mismatch — a single orphan surface gets
 *      skipped instead of cascading.
 *   4. Sacred-name cluster preserved — Yahuah Elohim (the LORD God)
 *      pattern still aligns as the S121 algorithm intended.
 *   5. Multi-word fallback to plain when display doesn't form the
 *      phrase — orphan skip takes over.
 */

import { alignVerse, type Segment, type VerseWordInput } from "./verse-align";

// Lightweight test-runner-agnostic harness. Declared as
// `undefined | (...)` so tsc compiles without vitest in
// devDependencies; runtime `typeof === "function"` guard below
// picks up the test framework's globals when present, otherwise
// falls through to the standalone assertion runner.
declare const describe: undefined | ((name: string, fn: () => void) => void);
declare const test: undefined | ((name: string, fn: () => void) => void);
declare const expect: undefined | ((received: unknown) => {
  toBe: (expected: unknown) => void;
  toEqual: (expected: unknown) => void;
  toContain: (expected: unknown) => void;
});
declare const process: { exit: (code: number) => never } | undefined;

interface Case {
  label: string;
  text: string;
  words: VerseWordInput[];
  expectStrongs: string[]; // ordered list of Strong's IDs in tappable segments
  expectFirstTappableText?: string;
  expectSecondTappableText?: string;
}

const cases: Case[] = [
  // ---- Case 1: single-word match — S121 regression baseline -------------
  {
    label: "single-word match — Genesis 1:1 baseline",
    text: "In the beginning God created the heaven and the earth.",
    words: [
      { position: 1, surface: "beginning", strong_number: "H7225" },
      { position: 2, surface: "God",       strong_number: "H0430" },
      { position: 3, surface: "created",   strong_number: "H1254" },
      { position: 4, surface: "heaven",    strong_number: "H8064" },
      { position: 5, surface: "and",       strong_number: "H0853" },
      { position: 6, surface: "earth",     strong_number: "H0776" },
    ],
    expectStrongs: ["H7225", "H0430", "H1254", "H8064", "H0853", "H0776"],
  },

  // ---- Case 2: multi-word surface match — wilt thou → will you ----------
  // Matthew 20:21 fragment after S149 modernization. USFX wraps
  // "wilt thou" as a single G2309 token; the S161 re-modernization
  // updated verse_words.surface to "will you" so it matches display.
  // The algorithm should emit ONE tappable span across "will" and
  // "you?" carrying G2309.
  {
    label: "multi-word surface — wilt thou → will you",
    text: "What will you?",
    words: [
      { position: 1, surface: "What",     strong_number: "G5101" },
      { position: 2, surface: "will you", strong_number: "G2309" },
    ],
    expectStrongs: ["G5101", "G2309"],
    expectFirstTappableText: "What",
    expectSecondTappableText: "will you?",
  },

  // ---- Case 3: cursor-advance on mismatch — orphan skip -----------------
  // Synthesized: surface[1]="ghostword" doesn't appear in display.
  // Without the fix the algorithm sticks the cursor and drops "ran"
  // and "fast" both. With the fix it skips the orphan and aligns
  // "ran" against surface[2].
  {
    label: "cursor-advance on mismatch — single orphan skip",
    text: "The dog ran fast.",
    words: [
      { position: 1, surface: "dog",       strong_number: "X0001" },
      { position: 2, surface: "ghostword", strong_number: "X0002" },
      { position: 3, surface: "ran",       strong_number: "X0003" },
      { position: 4, surface: "fast",      strong_number: "X0004" },
    ],
    expectStrongs: ["X0001", "X0003", "X0004"],
  },

  // ---- Case 4: sacred-name cluster preserved — S121 regression ---------
  {
    label: "sacred-name cluster — Yahuah Elohim (the LORD God)",
    text: "And Yahuah Elohim (the LORD God) commanded the man.",
    words: [
      { position: 1, surface: "LORD",      strong_number: "H3068" },
      { position: 2, surface: "God",       strong_number: "H0430" },
      { position: 3, surface: "commanded", strong_number: "H6680" },
      { position: 4, surface: "man",       strong_number: "H0120" },
    ],
    expectStrongs: ["H3068", "H0430", "H6680", "H0120"],
    expectFirstTappableText: "Yahuah",
    expectSecondTappableText: "Elohim",
  },

  // ---- Case 5: multi-word fallback to plain — orphan skip takes over ---
  {
    label: "multi-word fallback to plain — orphan skip takes over",
    text: "Surely will come.",
    words: [
      { position: 1, surface: "will you", strong_number: "G2309" },
      { position: 2, surface: "come",     strong_number: "G2064" },
    ],
    expectStrongs: ["G2064"],
  },
];

function extractTappables(segs: Segment[]): Array<{ text: string; strong: string }> {
  return segs
    .filter((s): s is Extract<Segment, { kind: "tappable" }> => s.kind === "tappable")
    .map((s) => ({ text: s.text, strong: s.strong }));
}

function runCase(c: Case): string | null {
  const segs = alignVerse(c.text, c.words);
  const tappables = extractTappables(segs);
  const gotStrongs = tappables.map((t) => t.strong);
  if (JSON.stringify(gotStrongs) !== JSON.stringify(c.expectStrongs)) {
    return `FAIL [${c.label}]\n  expected strongs: ${JSON.stringify(c.expectStrongs)}\n  actual strongs:   ${JSON.stringify(gotStrongs)}`;
  }
  if (
    c.expectFirstTappableText !== undefined &&
    tappables[0]?.text !== c.expectFirstTappableText
  ) {
    return `FAIL [${c.label}]\n  expected first tappable text: ${JSON.stringify(c.expectFirstTappableText)}\n  actual:                       ${JSON.stringify(tappables[0]?.text)}`;
  }
  if (
    c.expectSecondTappableText !== undefined &&
    tappables[1]?.text !== c.expectSecondTappableText
  ) {
    return `FAIL [${c.label}]\n  expected second tappable text: ${JSON.stringify(c.expectSecondTappableText)}\n  actual:                        ${JSON.stringify(tappables[1]?.text)}`;
  }
  return null;
}

// ---- Test-runner-agnostic top-level invocation ---------------------------

if (
  typeof describe === "function" &&
  typeof test === "function" &&
  typeof expect === "function"
) {
  describe("alignVerse", () => {
    for (const c of cases) {
      test(c.label, () => {
        const failure = runCase(c);
        expect!(failure).toBe(null);
      });
    }
  });
} else {
  let failures = 0;
  for (const c of cases) {
    const failure = runCase(c);
    if (failure !== null) {
      failures += 1;
      console.error(failure);
    }
  }
  console.log(
    `verse-align tests: ${cases.length - failures}/${cases.length} passing`,
  );
  if (failures > 0 && typeof process !== "undefined") {
    process.exit(1);
  }
}
