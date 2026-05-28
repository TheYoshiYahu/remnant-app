/**
 * S161 — tests for verse-align.ts.
 *
 * Same convention as `stripParentheticals.test.ts`: no test runner is
 * wired into package.json (the existing project pattern as of S144).
 * These assertions document the contract for the multi-word surface
 * match and the cursor-advance-on-mismatch (single-step orphan skip)
 * landed at S161. When a runner is added the suite picks up
 * automatically; in the meantime they serve as the spec.
 *
 * Coverage:
 *   1. Single-word match (S121 regression baseline).
 *   2. Multi-word surface match — USFX "wilt thou" wrapped under a
 *      single G2309 tag aligns to displayed "will you" (S149-
 *      modernized) as ONE tappable span carrying G2309.
 *   3. Cursor-advance on mismatch — a single orphan surface (one whose
 *      surface text doesn't appear at its expected position, typically
 *      due to parenthetical-protection or rare punctuation drift)
 *      gets skipped instead of cascading.
 *   4. Sacred-name cluster preserved — Yahuah Elohim (the LORD God)
 *      pattern still aligns as the S121 algorithm intended.
 */

import { describe, expect, test } from "vitest";
import { alignVerse } from "./verse-align";

describe("alignVerse", () => {
  test("single-word match — baseline", () => {
    const text = "In the beginning God created the heaven and the earth.";
    const words = [
      { position: 1, surface: "beginning", strong_number: "H7225" },
      { position: 2, surface: "God",       strong_number: "H0430" },
      { position: 3, surface: "created",   strong_number: "H1254" },
      { position: 4, surface: "heaven",    strong_number: "H8064" },
      { position: 5, surface: "and",       strong_number: "H0853" },
      { position: 6, surface: "earth",     strong_number: "H0776" },
    ];
    const segs = alignVerse(text, words);
    const tappable = segs.filter((s) => s.kind === "tappable");
    expect(tappable.length).toBe(6);
    expect(tappable.map((s) => (s as { strong: string }).strong)).toEqual([
      "H7225", "H0430", "H1254", "H8064", "H0853", "H0776",
    ]);
  });

  test("multi-word surface match — wilt thou → will you", () => {
    // Matthew 20:21 fragment: "What will you?" — the displayed
    // (S149-modernized) text. USFX has <w s="G2309">wilt thou</w>
    // as a single token; after the S161 re-modernization the
    // verse_words.surface for that row reads "will you". The
    // algorithm should match both display tokens as one tappable
    // span carrying G2309.
    const text = "What will you?";
    const words = [
      { position: 1, surface: "What",     strong_number: "G5101" },
      { position: 2, surface: "will you", strong_number: "G2309" },
    ];
    const segs = alignVerse(text, words);
    const tappable = segs.filter((s) => s.kind === "tappable") as Array<{
      kind: "tappable";
      text: string;
      strong: string;
    }>;
    expect(tappable.length).toBe(2);
    expect(tappable[0].strong).toBe("G5101");
    expect(tappable[0].text).toBe("What");
    expect(tappable[1].strong).toBe("G2309");
    // The combined display token preserves trailing punctuation
    // (the "?" after "you") so the verse renders identically.
    expect(tappable[1].text).toBe("will you?");
  });

  test("cursor-advance on mismatch — single orphan skip prevents cascade", () => {
    // Synthesized case: the second surface ("ghostword") has no
    // counterpart in display (modeling a parenthetical-protected
    // or rare-drift orphan). Without the cursor-advance fix the
    // algorithm would stick on "ghostword" and drop "ran" and
    // "fast" both. With the fix it skips the orphan and aligns
    // "ran" against the next surface.
    const text = "The dog ran fast.";
    const words = [
      { position: 1, surface: "dog",       strong_number: "X0001" },
      { position: 2, surface: "ghostword", strong_number: "X0002" },
      { position: 3, surface: "ran",       strong_number: "X0003" },
      { position: 4, surface: "fast",      strong_number: "X0004" },
    ];
    const segs = alignVerse(text, words);
    const tappable = segs.filter((s) => s.kind === "tappable") as Array<{
      kind: "tappable";
      text: string;
      strong: string;
    }>;
    // dog, ran, fast should align; ghostword is skipped as orphan.
    expect(tappable.map((s) => s.strong)).toEqual(["X0001", "X0003", "X0004"]);
  });

  test("sacred-name cluster — Yahuah Elohim (the LORD God) regression", () => {
    // S121 cluster pattern still holds after the S161 changes —
    // two Hebrew head tokens claim two USFX surfaces in order,
    // the parenthetical itself renders as plain orientation text.
    const text =
      "And Yahuah Elohim (the LORD God) commanded the man.";
    const words = [
      { position: 1, surface: "LORD",     strong_number: "H3068" },
      { position: 2, surface: "God",      strong_number: "H0430" },
      { position: 3, surface: "commanded", strong_number: "H6680" },
      { position: 4, surface: "man",      strong_number: "H0120" },
    ];
    const segs = alignVerse(text, words);
    const tappable = segs.filter((s) => s.kind === "tappable") as Array<{
      kind: "tappable";
      text: string;
      strong: string;
    }>;
    expect(tappable.map((s) => s.strong)).toEqual([
      "H3068", "H0430", "H6680", "H0120",
    ]);
    expect(tappable[0].text).toBe("Yahuah");
    expect(tappable[1].text).toBe("Elohim");
  });

  test("multi-word fallback to plain when display doesn't form the phrase", () => {
    // If verse_words.surface is "will you" but the displayed text
    // has only "will" followed by an unrelated word, the multi-
    // word match must fall through cleanly. Without Part 1's
    // verify-against-display gate this case shouldn't arise in
    // production data, but the algorithm should not over-claim.
    const text = "Surely will come.";
    const words = [
      { position: 1, surface: "will you", strong_number: "G2309" },
      { position: 2, surface: "come",     strong_number: "G2064" },
    ];
    const segs = alignVerse(text, words);
    const tappable = segs.filter((s) => s.kind === "tappable") as Array<{
      kind: "tappable";
      text: string;
      strong: string;
    }>;
    // The multi-word match fails (no "you" after "will"); the
    // single-word match against "will you" also fails (single
    // displayed token can't equal the multi-word surface). The
    // cursor-advance peek lets "come" align against G2064 by
    // skipping G2309 as the orphan.
    expect(tappable.map((s) => s.strong)).toEqual(["G2064"]);
  });
});
