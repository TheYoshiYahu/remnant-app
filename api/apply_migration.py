#!/usr/bin/env python3
"""
Apply a SQL migration file to the live Render Postgres.

Lightweight stand-in for `psql -f` when psql isn't installed locally.
Reads the same SQL files that live at data-schema/migrations/sessionNN_*.sql,
strips out psql-only backslash directives (\\echo, etc.), and executes the
remainder against the DATABASE_URL via asyncpg in a single connection.

Usage:
    DATABASE_URL='postgresql://...' python3 api/apply_migration.py \\
        data-schema/migrations/session73_cross_references.sql

DATABASE_URL resolution order:
    1. The DATABASE_URL environment variable.
    2. api/.env (a single line: DATABASE_URL=...).

SSL: Render external connections require SSL. The script forces ssl='require'
unless the URL already specifies sslmode.

The migration files carry their own BEGIN/COMMIT. asyncpg executes the whole
body as one block; if anything fails, the BEGIN/COMMIT rolls everything back.

After applying, the script prints the schema_version row so the operator can
confirm the migration landed.
"""
from __future__ import annotations

import asyncio
import os
import sys
from pathlib import Path

try:
    import asyncpg
except ImportError:
    print("asyncpg not installed.\n  Install with: pip3 install asyncpg --break-system-packages", file=sys.stderr)
    sys.exit(2)


def load_database_url() -> str:
    url = os.environ.get("DATABASE_URL")
    if url:
        return url
    env_path = Path(__file__).parent / ".env"
    if env_path.exists():
        for raw in env_path.read_text().splitlines():
            line = raw.strip()
            if line.startswith("DATABASE_URL="):
                return line.split("=", 1)[1].strip().strip('"').strip("'")
    print("DATABASE_URL not set in environment or api/.env", file=sys.stderr)
    sys.exit(3)


def strip_psql_directives(sql: str) -> str:
    """Remove psql-only backslash commands so asyncpg can execute the rest."""
    out_lines = []
    for line in sql.split("\n"):
        if line.lstrip().startswith("\\"):
            continue
        out_lines.append(line)
    return "\n".join(out_lines)


async def main() -> int:
    if len(sys.argv) < 2:
        print("Usage: python3 api/apply_migration.py <path-to-migration.sql>", file=sys.stderr)
        return 1

    sql_path = Path(sys.argv[1])
    if not sql_path.exists():
        print(f"Migration file not found: {sql_path}", file=sys.stderr)
        return 4

    sql_text = sql_path.read_text()
    sql_clean = strip_psql_directives(sql_text)

    url = load_database_url()
    if url.startswith("postgres://"):
        url = url.replace("postgres://", "postgresql://", 1)

    redacted = url.split("@", 1)[-1] if "@" in url else url
    print(f"Applying {sql_path}")
    print(f"Target:   {redacted}")
    print()

    needs_ssl = "sslmode=" not in url
    conn = await asyncpg.connect(url, ssl="require") if needs_ssl else await asyncpg.connect(url)

    try:
        await conn.execute(sql_clean)
        print("=== Migration committed. Verifying schema_version ===")
        row = await conn.fetchrow("SELECT id, version, landed_at FROM schema_version WHERE id = 1")
        if row:
            print(f"  id        : {row['id']}")
            print(f"  version   : {row['version']}")
            print(f"  landed_at : {row['landed_at']}")
        else:
            print("  schema_version row not found.")
    finally:
        await conn.close()

    print()
    print("Done.")
    return 0


if __name__ == "__main__":
    sys.exit(asyncio.run(main()))
