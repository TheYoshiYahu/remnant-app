#!/usr/bin/env python3
"""
Build the consonantal-skeleton lens data ("Without the vowels").

Two outputs, both idempotent:
  1. strong_entries.consonantal_skeleton — for every Hebrew/Aramaic entry, the
     `lemma` with Hebrew points + accents (U+0591–U+05C7) stripped to bare
     consonants. (Greek rows are left NULL.)
  2. strong_skeleton_near — the single-consonant-swap near-match map between
     distinct skeletons (edit distance 1: substitution, insertion, deletion),
     stored symmetrically so a lookup on either skeleton finds the other.

Run from the Render Web Shell on the API service (internal DB, asyncpg — the
image has no psql), AFTER applying migrations/consonantal_skeleton.sql:

    python3 /restoration-pipeline/_build_consonantal_skeleton.py

DO NOT run against live from the build environment — staged only.

Design notes:
  - Skeleton = remove the Unicode block U+0591–U+05C7 (Hebrew cantillation
    accents + niqqud/vowel points + the sof-pasuq/maqaf area). Letters,
    including matres lectionis (א ה ו י) and final forms, are kept as-is:
    matres ARE part of the skeleton, and the lexicon lemmas are dictionary
    headwords so final-form normalization isn't needed here.
  - Near-match generation is O(distinct_skeletons × alphabet × length), tiny
    for ~8.6k Hebrew entries / a few thousand distinct skeletons. Candidates
    are intersected with the set of skeletons that actually exist, so the map
    only ever links real words.
"""

from __future__ import annotations

import asyncio
import os
import re

import asyncpg

# Hebrew points + accents block. Stripping this leaves the consonant skeleton.
_POINTS = re.compile(r"[֑-ׇ]")

# The 22 Hebrew consonants + the 5 final forms, used to generate single-swap
# candidates. Final forms are included so swaps that land on a final letter are
# still considered; non-existent results are filtered against real skeletons.
_HEBREW_LETTERS = list(
    "אבגדהוזחטיכלמנסעפצקרשת"  # 22 base consonants
    "ךםןףץ"                    # 5 final forms
)


def skeleton(lemma: str) -> str:
    """Strip Hebrew points/accents from a pointed lemma -> consonant skeleton."""
    return _POINTS.sub("", lemma or "").strip()


def single_edit_variants(s: str) -> set[str]:
    """All strings one consonant-edit away from s (substitution/insertion/deletion).

    Returns the variant set EXCLUDING s itself. The caller intersects with the
    real-skeleton set, so junk variants are harmless.
    """
    out: set[str] = set()
    # substitution
    for i in range(len(s)):
        for ch in _HEBREW_LETTERS:
            if ch != s[i]:
                out.add(s[:i] + ch + s[i + 1:])
    # deletion
    for i in range(len(s)):
        out.add(s[:i] + s[i + 1:])
    # insertion
    for i in range(len(s) + 1):
        for ch in _HEBREW_LETTERS:
            out.add(s[:i] + ch + s[i:])
    out.discard(s)
    out.discard("")
    return out


def edit_kind(a: str, b: str) -> str:
    """Classify the single edit from a -> b (a != b, distance assumed 1)."""
    if len(a) == len(b):
        return "substitution"
    return "insertion" if len(b) > len(a) else "deletion"


async def main() -> None:
    dsn = os.environ["DATABASE_URL"]
    conn = await asyncpg.connect(dsn)
    try:
        # 1) Populate skeletons for Hebrew + Aramaic rows.
        rows = await conn.fetch(
            "SELECT strong_number, lemma FROM strong_entries "
            " WHERE language IN ('hebrew', 'aramaic')"
        )
        updates = [(skeleton(r["lemma"]), r["strong_number"]) for r in rows]
        await conn.executemany(
            "UPDATE strong_entries SET consonantal_skeleton = $1 "
            " WHERE strong_number = $2",
            updates,
        )
        print(f"skeletons set: {len(updates)} Hebrew/Aramaic entries")

        # 2) Distinct real skeletons.
        skel_rows = await conn.fetch(
            "SELECT DISTINCT consonantal_skeleton AS s FROM strong_entries "
            " WHERE consonantal_skeleton IS NOT NULL AND consonantal_skeleton <> ''"
        )
        real = {r["s"] for r in skel_rows}
        print(f"distinct skeletons: {len(real)}")

        # 3) Build the near-match map (edit distance 1), symmetric.
        pairs: list[tuple[str, str, str]] = []
        for s in real:
            for cand in single_edit_variants(s):
                if cand in real:
                    pairs.append((s, cand, edit_kind(s, cand)))
        # Idempotent reload.
        await conn.execute("TRUNCATE strong_skeleton_near")
        await conn.executemany(
            "INSERT INTO strong_skeleton_near (skeleton, near_skeleton, edit_kind) "
            "VALUES ($1, $2, $3) ON CONFLICT DO NOTHING",
            pairs,
        )
        print(f"near-match pairs: {len(pairs)}")
    finally:
        await conn.close()


if __name__ == "__main__":
    asyncio.run(main())
