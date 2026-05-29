#!/usr/bin/env python3
"""
Session 162 — Luke 1:41 narrow Ghost→Spirit + Strong's correction.

S161 Part 1.7 ('Ghost' G4151 → 'Spirit') filtered on
  surface = 'Ghost' AND strong_number = 'G4151'
and intentionally swept the canon. The S162 smoke-test of the Holy
Ghost cluster surfaced one verse the filter missed:

  Luke 1:41 — position 18 — surface 'Ghost' with strong_number 'G0040'.

The upstream USFX tag for that row is wrong on two fronts: the surface
was never modernized and the Strong's number is hagios (G0040) rather
than pneuma (G4151). Without the correction, verse-align.ts's
HEBREW_PAIRING_HINTS for Ruach (→ 'spirit') has no 'spirit' paren-word
to match against, so the Ruach token falls through to positional
fallback. After this fix, Luke 1:41's cluster aligns the same way the
other three test verses (Matthew 28:19, Mark 1:8, John 14:26) already do.

Narrow target — single row by (verse_id, position):
  verse_id = 269031 (Luke 1:41)
  position = 18

Idempotent: re-runs against the corrected row become no-ops because the
WHERE clause requires the original (surface, strong_number) pair.

Run:
  cd ~/Desktop/App
  DATABASE_URL="$(cat _scratch/_db_url.txt)" \\
    python3 restoration-pipeline/_session162_luke_1_41_ghost_fix.py --dry-run

  cd ~/Desktop/App
  DATABASE_URL="$(cat _scratch/_db_url.txt)" \\
    python3 restoration-pipeline/_session162_luke_1_41_ghost_fix.py
"""

from __future__ import annotations

import argparse
import asyncio
import os
import ssl as ssl_lib
import sys
from pathlib import Path
from urllib.parse import unquote, urlparse

import asyncpg


VERSE_ID = 269031   # luke 1:41
POSITION = 18
OLD_SURFACE = "Ghost"
OLD_STRONG = "G0040"
NEW_SURFACE = "Spirit"
NEW_STRONG = "G4151"


async def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--no-confirm", action="store_true")
    args = ap.parse_args()

    db_url = os.environ.get("DATABASE_URL")
    if not db_url:
        url_path = (
            Path(__file__).resolve().parent.parent
            / "_scratch"
            / "_db_url.txt"
        )
        if url_path.exists():
            db_url = url_path.read_text().strip()
        else:
            print(
                "ERROR: DATABASE_URL not set and _scratch/_db_url.txt absent.",
                file=sys.stderr,
            )
            return 2

    parsed = urlparse(db_url)
    print(f"==> connecting to {parsed.hostname}/{parsed.path.lstrip('/')}")

    ssl_ctx = ssl_lib.create_default_context()
    ssl_ctx.check_hostname = False
    ssl_ctx.verify_mode = ssl_lib.CERT_NONE

    conn = await asyncpg.connect(
        host=parsed.hostname,
        port=parsed.port or 5432,
        user=unquote(parsed.username) if parsed.username else None,
        password=unquote(parsed.password) if parsed.password else None,
        database=parsed.path.lstrip("/") if parsed.path else None,
        ssl=ssl_ctx,
        timeout=30,
    )
    try:
        # Read the candidate row.
        row = await conn.fetchrow(
            """
            SELECT vw.id            AS vw_id,
                   vw.surface       AS surface,
                   vw.strong_number AS strong,
                   v.text           AS verse_text,
                   b.slug           AS book_slug,
                   c.chapter_number AS chapter,
                   v.verse_number   AS verse_n
              FROM verse_words vw
              JOIN verses   v ON v.id = vw.verse_id
              JOIN chapters c ON c.id = v.chapter_id
              JOIN books    b ON b.id = c.book_id
             WHERE vw.verse_id = $1
               AND vw.position = $2
            """,
            VERSE_ID,
            POSITION,
        )
        if row is None:
            print(
                f"ERROR: no verse_words row at verse_id={VERSE_ID} "
                f"position={POSITION}.",
                file=sys.stderr,
            )
            return 3

        print()
        print("==> target row")
        print(f"  book/chapter/verse : {row['book_slug']} "
              f"{row['chapter']}:{row['verse_n']}")
        print(f"  vw_id              : {row['vw_id']}")
        print(f"  current surface    : {row['surface']!r}")
        print(f"  current strong     : {row['strong']}")
        print(f"  verse text         : {row['verse_text']}")
        print()
        print(f"  → new surface      : {NEW_SURFACE!r}")
        print(f"  → new strong       : {NEW_STRONG}")

        if row["surface"] == NEW_SURFACE and row["strong"] == NEW_STRONG:
            print()
            print(f"Already corrected — surface={NEW_SURFACE!r}, "
                  f"strong={NEW_STRONG}. No-op.")
            return 0

        if row["surface"] != OLD_SURFACE or row["strong"] != OLD_STRONG:
            print()
            print(
                f"ERROR: row does not match the expected pre-state "
                f"(surface={OLD_SURFACE!r}, strong={OLD_STRONG}). "
                f"Refusing to touch it.",
                file=sys.stderr,
            )
            return 4

        if args.dry_run:
            print()
            print("Dry-run complete; no UPDATE issued.")
            return 0

        if not args.no_confirm:
            print()
            ans = input(
                "Apply the 1-row UPDATE? [y/N] "
            ).strip().lower()
            if ans not in {"y", "yes"}:
                print("Aborted.")
                return 1

        print()
        print("==> applying update ...")
        async with conn.transaction():
            result = await conn.execute(
                """
                UPDATE verse_words
                   SET surface = $1,
                       strong_number = $2
                 WHERE verse_id = $3
                   AND position = $4
                   AND surface = $5
                   AND strong_number = $6
                """,
                NEW_SURFACE,
                NEW_STRONG,
                VERSE_ID,
                POSITION,
                OLD_SURFACE,
                OLD_STRONG,
            )
        # asyncpg returns 'UPDATE <n>' on success.
        print(f"Applied: {result}")

        # Read back to verify.
        verify = await conn.fetchrow(
            "SELECT surface, strong_number FROM verse_words "
            "WHERE verse_id = $1 AND position = $2",
            VERSE_ID,
            POSITION,
        )
        print()
        print("==> verify")
        print(f"  surface = {verify['surface']!r}")
        print(f"  strong  = {verify['strong_number']}")
        if (
            verify["surface"] == NEW_SURFACE
            and verify["strong_number"] == NEW_STRONG
        ):
            print()
            print("✓ Luke 1:41 Holy Ghost row corrected.")
            return 0
        print()
        print("✗ Verification failed.", file=sys.stderr)
        return 5
    finally:
        await conn.close()


if __name__ == "__main__":
    sys.exit(asyncio.run(main()))
