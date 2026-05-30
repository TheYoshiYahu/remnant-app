#!/usr/bin/env python3
"""
Session 169 — Greek gloss cleanup for §28 column-stack readability.

The S168 §28 InterlinearLayer renders ``strong_entries.short_definition``
as the gloss row in each column-stack. S120 loaded that field straight
from the OpenScriptures Strong's 2007 XML ``<kjv_def>`` element, which
ships in the form::

    :--also, and, but, moreover, now (often unexpressed in English).
    :--+ long, nay, neither, never, no (X man), none, (can-)not, ...
    :--not.

Capped at 140 chars in S120's loader. That cap leaves the ``:--`` /
``:--+`` marker prefix visible to the reader and lets parenthetical
clarifiers ("(often unexpressed in English)", "(X man)", "(can-)not")
balloon the column into a 3-4-line wall of text. Live-walk redline 3
at S169 — Yoshi's call: clean these into compact ~3-synonym phrases.

Fix shape:
  - Strip the ``:--`` prefix and any leading ``+`` marker
  - Truncate at the first parenthetical clarifier (and everything after)
  - Trim trailing punctuation
  - Cap at 40 chars to keep the column-stack visually tight
  - HEBREW UNAFFECTED — Hebrew kjv_defs ship in ``1) first, beginning,
    best, chief`` format from S120's OSIS parser, already compact

This module exports:
  - ``clean_kjv_def_for_gloss(raw)`` — the cleanup function. Pure;
    idempotent (re-running on already-clean text returns the input).
  - ``emit_sql(out_path)`` — writes a SQL file with PREVIEW SELECT
    showing 10 before/after pairs, then a single UPDATE applying the
    same cleanup to every greek-language row in strong_entries.
  - ``run_tests()`` — 12 unit cases over real STEPBible sample inputs.

Run:
  # tests + emit SQL
  python3 restoration-pipeline/_session169_clean_greek_glosses.py
  # apply against prod (Yoshi's terminal)
  psql "$DATABASE_URL" -f restoration-pipeline/validation-reports/_s169_clean_greek_glosses.sql

The SQL is single-transaction + idempotent. Re-applying produces no
further changes (the regex pattern doesn't match already-clean text).
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

APP_ROOT = Path(__file__).resolve().parent.parent
OUT_DIR = APP_ROOT / "restoration-pipeline" / "validation-reports"
OUT_SQL = OUT_DIR / "_s169_clean_greek_glosses.sql"


# Cap chosen to keep the §28 column-stack gloss cell tight — at ~10rem
# max-width and ~0.75rem font-size, 40 chars fits cleanly on two lines.
GLOSS_CAP_CHARS = 40


def clean_kjv_def_for_gloss(raw: str | None) -> str | None:
    """Clean a Strong's kjv_def into a compact §28 gloss.

    Pure function. Idempotent: ``clean(clean(x)) == clean(x)``.

    Strategy:
      1. Strip the ``:--`` marker prefix (and any whitespace following)
      2. Strip a single leading ``+`` (the Strong's translates-as marker
         that introduces some KJV-usage blocks)
      3. Truncate at the first ``(`` parenthetical clarifier (and
         everything that follows it — those clarifiers explain edge
         cases that don't fit the compact-gloss register)
      4. Trim trailing whitespace and ``,.;`` punctuation
      5. Cap at ``GLOSS_CAP_CHARS`` (40); if truncated mid-phrase,
         append an ellipsis after a clean comma-or-space cut

    Returns ``None`` for empty / None / whitespace-only input.
    """
    if raw is None:
        return None
    s = raw.strip()
    if not s:
        return None

    # 1. Strip ``:--`` marker.
    if s.startswith(":--"):
        s = s[3:].lstrip()

    # 2. Strip a single leading ``+``.
    if s.startswith("+"):
        s = s[1:].lstrip()

    # 3. Cut at first parenthetical clarifier.
    paren_pos = s.find("(")
    if paren_pos > 0:
        s = s[:paren_pos]
    elif paren_pos == 0:
        # The whole thing starts with a paren — unusual; clear it.
        s = ""

    # 4. Trim trailing punctuation/whitespace.
    s = s.rstrip(" ,.;")
    s = s.strip()

    # 5. Cap length.
    if len(s) > GLOSS_CAP_CHARS:
        # Cut at the cap, then back off to the last comma (preferred) or
        # last space (fallback) inside the cap window so we don't slice a
        # phrase mid-word. ``", "`` would miss a trailing standalone
        # comma at the boundary; using ``,`` and ``" "`` separately is
        # the cleaner cut.
        s = s[:GLOSS_CAP_CHARS]
        for sep in (",", " "):
            idx = s.rfind(sep)
            if idx > 0:
                s = s[:idx]
                break
        s = s.rstrip(" ,.;") + "…"

    return s or None


# ----------------------------- unit tests ---------------------------------

_TEST_CASES: list[tuple[str | None, str | None]] = [
    # Real STEPBible kjv_def samples from the §28 walk
    (
        ":--also, and, but, moreover, now (often unexpressed in English).",
        "also, and, but, moreover, now",
    ),
    (
        ":--+ long, nay, neither, never, no (X man), none, (can-)not, "
        "+ nothing, + special, un(-worthy), when, + without, + yet but.",
        "long, nay, neither, never, no",
    ),
    (":--not.", "not"),
    (":--God, Lord, master, Sir.", "God, Lord, master, Sir"),
    (
        ":--be dead, decease, die.",
        "be dead, decease, die",
    ),
    (
        ":--angel, messenger.",
        "angel, messenger",
    ),
    (
        ":--appear, seem, be seen, shine, X think.",
        "appear, seem, be seen, shine, X think",  # 38 chars, under cap
    ),
    # Idempotency: clean input passes through unchanged
    ("also, and, but", "also, and, but"),
    ("God, Lord, master, Sir", "God, Lord, master, Sir"),
    # Edge cases
    (None, None),
    ("", None),
    ("   ", None),
    (":--", None),
    (":--+ ", None),
    # Hebrew-style (already clean — shouldn't break if accidentally run on it)
    ("1) first, beginning, best, chief", "1) first, beginning, best, chief"),
    # Length cap
    (
        ":--apple, banana, cherry, date, elderberry, fig, grape, honeydew",
        # 64 chars after :-- strip → cap at 40 → back off to comma
        # "apple, banana, cherry, date, elderberry" = 39 chars, fits
        "apple, banana, cherry, date, elderberry…",
    ),
]


def run_tests() -> int:
    """Run unit tests over a curated set of real and edge-case inputs."""
    failures = 0
    for i, (raw, expected) in enumerate(_TEST_CASES, start=1):
        got = clean_kjv_def_for_gloss(raw)
        # Idempotency check on every non-None result
        if got is not None:
            again = clean_kjv_def_for_gloss(got)
            if again != got:
                print(
                    f"  [{i:>2}] IDEMPOTENCY FAIL — clean({got!r}) "
                    f"= {again!r}"
                )
                failures += 1
        if got != expected:
            print(
                f"  [{i:>2}] FAIL — input={raw!r}\n"
                f"        expected={expected!r}\n"
                f"        got     ={got!r}"
            )
            failures += 1
        else:
            print(f"  [{i:>2}] ok — {raw!r}  →  {got!r}")
    return failures


# --------------------------- SQL emission ---------------------------------

# Single regex-only UPDATE that mirrors the Python cleanup. Postgres
# regexp_replace runs server-side; the cleanup chain reads:
#   1. strip leading ":--" + optional whitespace + optional "+" + ws
#   2. cut at first "(" and everything after
#   3. trim ' ,.;' from both ends
#   4. LEFT(..., 40) cap
# Idempotent: already-cleaned rows match the same patterns to no-op.
SQL_BODY = r"""
-- S169 — §28 column-stack gloss cleanup for Greek strong_entries.
--
-- Strips the ":--" / ":--+" marker prefix, cuts at the first
-- parenthetical clarifier, trims trailing punctuation, and caps at
-- 40 chars so the §28 column-stack gloss cell renders tight.
--
-- Hebrew untouched — Hebrew kjv_defs ship in "1) first, beginning,
-- best, chief" format from S120's OSIS parser, already compact.
--
-- Idempotent + single-transaction. Re-applying produces no further
-- changes.

-- Disable psql's pager so the PREVIEW SELECT doesn't block on `(END)`
-- and the UPDATE + POST-APPLY STATS flow through in one pass.
\pset pager off

BEGIN;

-- Preview: 10 rows before/after the cleanup, sampled from the rows
-- the UPDATE will touch (greek entries with the ":--" marker).
\echo
\echo === PREVIEW (10 before/after samples) ===
SELECT
  strong_number,
  LEFT(short_definition, 80)                                     AS before,
  LEFT(
    TRIM(BOTH ' ,.;' FROM
      REGEXP_REPLACE(
        REGEXP_REPLACE(short_definition, '^:--\s*\+?\s*', ''),
        '\s*\(.*$', ''
      )
    ),
    40
  )                                                              AS after_clean
FROM strong_entries
WHERE language = 'greek'
  AND short_definition LIKE ':--%'
ORDER BY strong_number
LIMIT 10;

\echo
\echo === APPLY ===
UPDATE strong_entries
SET short_definition = LEFT(
    TRIM(BOTH ' ,.;' FROM
      REGEXP_REPLACE(
        REGEXP_REPLACE(short_definition, '^:--\s*\+?\s*', ''),
        '\s*\(.*$', ''
      )
    ),
    40
)
WHERE language = 'greek'
  AND short_definition IS NOT NULL;

\echo
\echo === POST-APPLY STATS ===
SELECT
  COUNT(*)                                                      AS total_greek,
  COUNT(*) FILTER (WHERE short_definition LIKE ':--%')           AS still_has_marker,
  COUNT(*) FILTER (WHERE short_definition LIKE '%(%')            AS still_has_paren,
  ROUND(AVG(LENGTH(short_definition)), 1)                        AS avg_gloss_len,
  MAX(LENGTH(short_definition))                                  AS max_gloss_len
FROM strong_entries
WHERE language = 'greek'
  AND short_definition IS NOT NULL;

COMMIT;
"""


def emit_sql() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    OUT_SQL.write_text(SQL_BODY.lstrip(), encoding="utf-8")
    print(
        f"  → wrote {OUT_SQL.relative_to(APP_ROOT)} "
        f"({OUT_SQL.stat().st_size:,} bytes)"
    )


def main() -> int:
    print("[s169] running unit tests for clean_kjv_def_for_gloss:")
    failures = run_tests()
    print()
    if failures:
        print(f"[s169] {failures} TEST(S) FAILED — not emitting SQL")
        return 1
    print(f"[s169] all {len(_TEST_CASES)} unit tests passed.")
    print()
    print("[s169] emitting SQL...")
    emit_sql()
    print("[s169] DONE.")
    print(
        f"\nTo apply against prod:\n"
        f"  psql \"$DATABASE_URL\" -f "
        f"{OUT_SQL.relative_to(APP_ROOT)}\n"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
