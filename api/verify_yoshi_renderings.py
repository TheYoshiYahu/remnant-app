#!/usr/bin/env python3
"""
verify_yoshi_renderings.py
--------------------------
Smoke-test that Yoshi-rendered passages landed correctly in the live
database. Connects to the API's Postgres instance, queries the verses
table for known LANDED renderings, and prints a PASS/FAIL report.

Run after `python seed.py --seed-only` (or --bootstrap) to confirm the
canon.json substitutions made it through to the DB.

Usage:
    python verify_yoshi_renderings.py
"""

from __future__ import annotations

import asyncio
import sys

import asyncpg

from config import settings


# Expected verse snippets — first ~60 chars of each verse. The check is
# substring containment so minor punctuation drift doesn't trip the test.
EXPECTED: list[tuple[str, int, int, str]] = [
    # (book_slug, chapter, verse, expected_snippet)
    ("1-corinthians", 11, 1, "Be ye imitators of me"),
    ("1-corinthians", 11, 2, "hold fast the traditions"),
    ("1-corinthians", 11, 4, "having his head cast down"),
    ("1-corinthians", 11, 5, "the dishonor is upon her that is shaven"),
    ("1-corinthians", 11, 6, "the woman shorn yet wholly covered standeth not in disgrace"),
    ("1-corinthians", 11, 7, "out of shame"),
    ("1-corinthians", 11, 10, "because of the angels"),
    ("1-corinthians", 11, 15, "given to her as her covering"),
    ("1-corinthians", 11, 19, "factions"),
    ("1-corinthians", 11, 25, "new covenant"),
    ("1-corinthians", 11, 29, "judgment to himself"),
]


async def fetch_verse(conn: asyncpg.Connection, book_slug: str, ch: int, v: int) -> str | None:
    row = await conn.fetchrow(
        """
        SELECT verses.text
        FROM verses
        JOIN chapters ON verses.chapter_id = chapters.id
        JOIN books    ON chapters.book_id = books.id
        WHERE books.slug = $1
          AND chapters.chapter_number = $2
          AND verses.verse_number = $3
        LIMIT 1
        """,
        book_slug, ch, v,
    )
    return row["text"] if row else None


async def fetch_chapter_commentary(conn: asyncpg.Connection, book_slug: str, ch: int) -> str | None:
    row = await conn.fetchrow(
        """
        SELECT chapters.chapter_intro
        FROM chapters
        JOIN books ON chapters.book_id = books.id
        WHERE books.slug = $1
          AND chapters.chapter_number = $2
        LIMIT 1
        """,
        book_slug, ch,
    )
    return row["chapter_intro"] if row else None


async def run() -> int:
    conn = await asyncpg.connect(settings.database_url)
    try:
        fails = 0
        for book, ch, v, expected in EXPECTED:
            text = await fetch_verse(conn, book, ch, v)
            if text is None:
                print(f"  FAIL  {book} {ch}:{v}  (verse not found in DB)")
                fails += 1
            elif expected not in text:
                print(f"  FAIL  {book} {ch}:{v}  (expected snippet '{expected}' not in '{text[:100]}…')")
                fails += 1
            else:
                print(f"  PASS  {book} {ch}:{v}  '{expected}'")

        # Chapter commentary
        commentary = await fetch_chapter_commentary(conn, "1-corinthians", 11)
        if not commentary:
            print("  FAIL  1-corinthians 11 chapter commentary missing")
            fails += 1
        elif "katakalúptō" not in commentary and "katakalupto" not in commentary.lower():
            print("  WARN  1-corinthians 11 chapter commentary present but distinct content not detected")
        else:
            print(f"  PASS  1-corinthians 11 chapter commentary ({len(commentary)} chars)")

        print()
        if fails:
            print(f"VERIFY FAILED: {fails} check(s) failed.")
        else:
            print("VERIFY PASSED: all Yoshi-rendering snippets present.")
        return fails
    finally:
        await conn.close()


def main():
    exit_code = asyncio.run(run())
    sys.exit(exit_code)


if __name__ == "__main__":
    main()
