#!/usr/bin/env python3
"""
Session 117 — multi-mark highlights schema migration loader.

Applies data-schema/migrations/session117_multi_mark.sql against the
DATABASE_URL Postgres. The migration:

  - drops the S113 (user_id, verse_id) unique constraint on
    verse_highlights ('verse_highlights_user_verse_unique')
  - adds the S117 (user_id, verse_id, color, style) unique constraint
    ('verse_highlights_user_verse_color_style_unique')

The SQL itself is idempotent (DROP IF EXISTS + DO-block guard on the
ADD), so re-running is a no-op. This loader can therefore serve as
both the one-shot S117 apply AND the pattern for future schema-
migration loaders — clone the file, swap the SQL path, swap the
verification constraint name, ship.

Why this exists as a Python loader rather than direct psql: the API
Docker image (api/Dockerfile, python:3.12-slim base) doesn't include
the postgres client tools — only asyncpg via the api/requirements.txt
install. Render Shell on the API service therefore can't `psql -f ...`;
it CAN `python3 /restoration-pipeline/_session117_*.py`. The S112 +
S114 loaders established this pattern; S117 follows it.

The Dockerfile MUST have an explicit COPY line for this file
('COPY restoration-pipeline/_session117_*.py /restoration-pipeline/')
so the script ships in the image. The S117 ship missed this on the
first push; the migration ran via an inline asyncpg here-doc paste in
Render Shell as a workaround, and this loader + Dockerfile COPY
landed as a forward-fix.

Modes:

  --dry-run    Connect + read the SQL file + print what would execute;
               touch the DB only with a SELECT to verify the current
               constraint state.
  (default)    Apply the migration + verify the new constraint exists.

Run from Render Shell on the API service:

  python3 /restoration-pipeline/_session117_apply_multi_mark_migration.py

Run locally against a dev DB:

  DATABASE_URL=postgres://localhost/remnant_app \\
    python3 restoration-pipeline/_session117_apply_multi_mark_migration.py
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
# at /data-schema/migrations/ (per api/Dockerfile lines 49 + 58). Locally,
# both are under APP_ROOT/.
APP_ROOT = Path(
    os.environ.get("APP_ROOT") or Path(__file__).resolve().parent.parent
)
MIGRATION_PATH = (
    APP_ROOT / "data-schema" / "migrations" / "session117_multi_mark.sql"
)

# Constraint we expect to exist AFTER the migration applies. The verify
# step queries pg_constraint for this name.
NEW_CONSTRAINT = "verse_highlights_user_verse_color_style_unique"
OLD_CONSTRAINT = "verse_highlights_user_verse_unique"


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
        # Pre-check: report current constraint state so the operator
        # sees what's there before changes.
        before_old = await conn.fetchval(
            "SELECT 1 FROM pg_constraint WHERE conname = $1",
            OLD_CONSTRAINT,
        )
        before_new = await conn.fetchval(
            "SELECT 1 FROM pg_constraint WHERE conname = $1",
            NEW_CONSTRAINT,
        )
        print(
            f"BEFORE: old constraint present={bool(before_old)}, "
            f"new constraint present={bool(before_new)}"
        )

        if dry_run:
            print("--dry-run: not applying migration.")
            print(f"Migration SQL ({len(sql)} chars) would execute now.")
            return 0

        print(f"Applying {MIGRATION_PATH.name}...")
        await conn.execute(sql)
        print("Migration executed.")

        # Verify the new constraint landed.
        after_new = await conn.fetchval(
            "SELECT 1 FROM pg_constraint WHERE conname = $1",
            NEW_CONSTRAINT,
        )
        after_old = await conn.fetchval(
            "SELECT 1 FROM pg_constraint WHERE conname = $1",
            OLD_CONSTRAINT,
        )
        print(
            f"AFTER: old constraint present={bool(after_old)}, "
            f"new constraint present={bool(after_new)}"
        )
        if not after_new:
            print("ERROR: new constraint missing after migration", file=sys.stderr)
            return 1
        if after_old:
            print("ERROR: old constraint still present after migration", file=sys.stderr)
            return 1
        print(f"OK: {NEW_CONSTRAINT} present, {OLD_CONSTRAINT} dropped.")
        return 0
    finally:
        await conn.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Report current constraint state without applying the migration.",
    )
    args = parser.parse_args()
    sys.exit(asyncio.run(main(dry_run=args.dry_run)))
