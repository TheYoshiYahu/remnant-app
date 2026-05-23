#!/usr/bin/env python3
"""
Session 124 — Bookmarks + Notes V1 schema migration loader.

Applies data-schema/migrations/session124_bookmarks_and_notes_v1.sql
against the DATABASE_URL Postgres. The migration:

  - Creates the NEW `bookmarks` table (single-verse flag with
    short_description + tags + color_tint metadata; UNIQUE (user_id,
    verse_id); GIN index on tags for the future W8 cross-bookmark
    hub queries).
  - Relaxes the legacy `study_notes` CHECK that required chapter_id
    OR verse_id NOT NULL. Free V1 single-global-notepad needs rows
    where BOTH are NULL (the chrome-button free-form path locked at
    DESIGN_LANGUAGE.md §22).

The SQL is idempotent throughout (CREATE TABLE IF NOT EXISTS, DO-block
guards on constraints, dynamic-lookup drop for the auto-named CHECK).
Re-runs are no-ops; safe to run twice from Render Shell.

Why this exists as a Python loader rather than direct psql: the API
Docker image (api/Dockerfile, python:3.12-slim base) doesn't include
the postgres client tools — only asyncpg via the api/requirements.txt
install. Render Shell on the API service therefore can't `psql -f ...`;
it CAN `python3 /restoration-pipeline/_session124_*.py`. The S112 +
S114 + S117 + S120 loaders established this pattern.

The Dockerfile MUST have an explicit COPY line for this file
('COPY restoration-pipeline/_session124_*.py /restoration-pipeline/')
so the script ships in the image. Per the S117 forward standard, every
schema-migration session ships THREE artifacts in lockstep: SQL +
loader + Dockerfile COPY.

Modes:

  --dry-run    Connect + read the SQL file + print current schema
               state; touch the DB only with SELECTs.
  (default)    Apply the migration + verify the new bookmarks table
               exists + verify the study_notes CHECK is gone.

Run from Render Shell on the API service:

  python3 /restoration-pipeline/_session124_apply_bookmarks_and_notes_v1.py

Run locally against a dev DB:

  DATABASE_URL=postgres://localhost/remnant_app \\
    python3 restoration-pipeline/_session124_apply_bookmarks_and_notes_v1.py
"""

from __future__ import annotations

import argparse
import asyncio
import os
import sys
from pathlib import Path

import asyncpg

# Paths are computed relative to this script's location. In the Render
# image, this script lives at /restoration-pipeline/ and the migration
# at /data-schema/migrations/ (per api/Dockerfile COPY lines). Locally,
# both are under APP_ROOT/.
APP_ROOT = Path(
    os.environ.get("APP_ROOT") or Path(__file__).resolve().parent.parent
)
MIGRATION_PATH = (
    APP_ROOT / "data-schema" / "migrations" / "session124_bookmarks_and_notes_v1.sql"
)

BOOKMARKS_TABLE = "bookmarks"
BOOKMARKS_UNIQUE = "bookmarks_user_verse_unique"
BOOKMARKS_USER_VERSE_INDEX = "idx_bookmarks_user_verse"
BOOKMARKS_TAGS_INDEX = "idx_bookmarks_tags_gin"


def _strip_psql_directives(sql: str) -> str:
    """psql-only \\echo / \\set / \\timing lines aren't valid SQL.
    asyncpg parses standard SQL only; filter the directive lines out
    so the rest executes cleanly. Comments (lines starting with --)
    stay — asyncpg handles those."""
    out_lines: list[str] = []
    for line in sql.splitlines():
        stripped = line.lstrip()
        if stripped.startswith("\\"):
            # psql directive — skip entirely
            continue
        out_lines.append(line)
    return "\n".join(out_lines)


async def _find_study_notes_check(conn: asyncpg.Connection) -> str | None:
    """Return the name of the chapter_id-or-verse_id CHECK constraint on
    study_notes if one exists, else None. Matches by constraint
    definition (references both column names) rather than by name, since
    Postgres auto-names table-level CHECKs and the exact name varies."""
    return await conn.fetchval(
        "SELECT con.conname "
        "  FROM pg_constraint con "
        "  JOIN pg_class rel ON rel.oid = con.conrelid "
        " WHERE rel.relname = 'study_notes' "
        "   AND con.contype = 'c' "
        "   AND pg_get_constraintdef(con.oid) ILIKE '%chapter_id%verse_id%' "
        " LIMIT 1"
    )


async def main(*, dry_run: bool) -> int:
    if not MIGRATION_PATH.exists():
        print(f"ERROR: migration not found at {MIGRATION_PATH}", file=sys.stderr)
        return 1
    sql = _strip_psql_directives(MIGRATION_PATH.read_text())

    db_url = os.environ.get("DATABASE_URL")
    if not db_url:
        print("ERROR: DATABASE_URL not set", file=sys.stderr)
        return 1

    conn = await asyncpg.connect(db_url)
    try:
        # Pre-check: report current schema state.
        bookmarks_before = await conn.fetchval(
            "SELECT 1 FROM pg_class WHERE relname = $1 AND relkind = 'r'",
            BOOKMARKS_TABLE,
        )
        unique_before = await conn.fetchval(
            "SELECT 1 FROM pg_constraint WHERE conname = $1",
            BOOKMARKS_UNIQUE,
        )
        tags_index_before = await conn.fetchval(
            "SELECT 1 FROM pg_class WHERE relname = $1 AND relkind = 'i'",
            BOOKMARKS_TAGS_INDEX,
        )
        check_before = await _find_study_notes_check(conn)
        print(
            f"BEFORE: bookmarks table={bool(bookmarks_before)}, "
            f"unique constraint={bool(unique_before)}, "
            f"tags GIN index={bool(tags_index_before)}, "
            f"study_notes CHECK={check_before or 'none'}"
        )

        if dry_run:
            print("--dry-run: not applying migration.")
            print(f"Migration SQL ({len(sql)} chars) would execute now.")
            return 0

        print(f"Applying {MIGRATION_PATH.name}...")
        await conn.execute(sql)
        print("Migration executed.")

        # Verify post-state.
        bookmarks_after = await conn.fetchval(
            "SELECT 1 FROM pg_class WHERE relname = $1 AND relkind = 'r'",
            BOOKMARKS_TABLE,
        )
        unique_after = await conn.fetchval(
            "SELECT 1 FROM pg_constraint WHERE conname = $1",
            BOOKMARKS_UNIQUE,
        )
        user_verse_index_after = await conn.fetchval(
            "SELECT 1 FROM pg_class WHERE relname = $1 AND relkind = 'i'",
            BOOKMARKS_USER_VERSE_INDEX,
        )
        tags_index_after = await conn.fetchval(
            "SELECT 1 FROM pg_class WHERE relname = $1 AND relkind = 'i'",
            BOOKMARKS_TAGS_INDEX,
        )
        check_after = await _find_study_notes_check(conn)
        print(
            f"AFTER: bookmarks table={bool(bookmarks_after)}, "
            f"unique constraint={bool(unique_after)}, "
            f"user-verse index={bool(user_verse_index_after)}, "
            f"tags GIN index={bool(tags_index_after)}, "
            f"study_notes CHECK={check_after or 'none'}"
        )
        ok = (
            bool(bookmarks_after)
            and bool(unique_after)
            and bool(user_verse_index_after)
            and bool(tags_index_after)
            and check_after is None
        )
        if not ok:
            print("ERROR: post-migration state not as expected", file=sys.stderr)
            return 1
        print(
            f"OK: bookmarks table + {BOOKMARKS_UNIQUE} + indices present; "
            f"study_notes CHECK dropped."
        )
        return 0
    finally:
        await conn.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Report current schema state without applying the migration.",
    )
    args = parser.parse_args()
    sys.exit(asyncio.run(main(dry_run=args.dry_run)))
