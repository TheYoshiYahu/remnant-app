/**
 * Tests for offlineDownload.ts — the Phase 2 download engine's PURE logic.
 *
 * Same test-runner-agnostic convention as verse-align.test.ts: no runner is
 * wired into package.json, so these compile under tsc and run via the
 * fallback assertion harness (tsx) when executed directly.
 *
 * Scope here is the tier-gating + area invariants — the parts that gate what a
 * partner is allowed to download. The book/chapter WALK isn't exercised here:
 * it needs the api + IndexedDB layers, which belong in an integration test once
 * a runner lands. The gating logic is exactly the part that must never let a
 * download reach above-tier content, so it's the part worth pinning.
 */

import {
  DOWNLOAD_AREAS,
  getArea,
  isAreaUnlocked,
  tierOwns,
  type DownloadArea,
} from "./offlineDownload";

declare const describe: undefined | ((name: string, fn: () => void) => void);
declare const test: undefined | ((name: string, fn: () => void) => void);
declare const expect:
  | undefined
  | ((received: unknown) => {
      toBe: (expected: unknown) => void;
    });
declare const process: { exit: (code: number) => never } | undefined;

type Check = { label: string; run: () => string | null };

function eq<T>(label: string, actual: T, expected: T): string | null {
  return actual === expected
    ? null
    : `FAIL [${label}]\n  expected: ${JSON.stringify(expected)}\n  actual:   ${JSON.stringify(actual)}`;
}

const checks: Check[] = [
  // ---- tierOwns ladder ---------------------------------------------------
  {
    label: "free partner owns free content",
    run: () => eq("free⊇free", tierOwns("free", "free"), true),
  },
  {
    label: "free partner does NOT own complete_study content",
    run: () => eq("free⊉complete_study", tierOwns("free", "complete_study"), false),
  },
  {
    label: "anonymous (null) is treated as free",
    run: () => eq("null=free", tierOwns(null, "free"), true),
  },
  {
    label: "anonymous does NOT own study_notes",
    run: () => eq("null⊉study_notes", tierOwns(null, "study_notes"), false),
  },
  {
    label: "everything owns complete_study",
    run: () => eq("everything⊇complete_study", tierOwns("everything", "complete_study"), true),
  },
  {
    label: "complete_study owns study_notes (ladder is cumulative)",
    run: () => eq("complete⊇study_notes", tierOwns("complete_study", "study_notes"), true),
  },

  // ---- S355 single all-or-nothing area -----------------------------------
  {
    // The download itself is open to EVERY tier — a free partner can keep
    // their (free) library offline. The server gates the CONTENT, not the
    // download button, so there is no per-tier "locked" area / upgrade prompt.
    label: "the library download is unlocked for a free partner",
    run: () =>
      eq("library@free", isAreaUnlocked(getArea("library"), "free"), true),
  },
  {
    label: "the library download is unlocked for an anonymous partner",
    run: () =>
      eq("library@null", isAreaUnlocked(getArea("library"), null), true),
  },

  // ---- catalogue invariants ----------------------------------------------
  {
    label: "exactly ONE download area is catalogued (all-or-nothing)",
    run: () => eq("areaCount", DOWNLOAD_AREAS.length, 1),
  },
  {
    label: "the single area is the reading library",
    run: () => {
      const a: DownloadArea = DOWNLOAD_AREAS[0];
      return eq("id", a.id, "library") ?? eq("kind", a.kind, "reading");
    },
  },
  {
    label:
      "the library seeds EVERY reading layer (canon + cross-refs + interlinear + commentary)",
    run: () => {
      const lib = getArea("library");
      for (const l of [
        "chapters",
        "chapter",
        "witness",
        "kingdom",
        "xrefs",
        "words",
        "commentary",
      ]) {
        if (!lib.layers.includes(l as never))
          return `FAIL [library layers] missing "${l}"`;
      }
      return null;
    },
  },
];

if (
  typeof describe === "function" &&
  typeof test === "function" &&
  typeof expect === "function"
) {
  describe("offlineDownload gating", () => {
    for (const c of checks) {
      test(c.label, () => {
        expect!(c.run()).toBe(null);
      });
    }
  });
} else {
  let failures = 0;
  for (const c of checks) {
    const failure = c.run();
    if (failure !== null) {
      failures += 1;
      console.error(failure);
    }
  }
  console.log(
    `offlineDownload tests: ${checks.length - failures}/${checks.length} passing`,
  );
  if (failures > 0 && typeof process !== "undefined") {
    process.exit(1);
  }
}
