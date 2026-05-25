#!/usr/bin/env python3
"""
Diagnostic: check whether S140 (Matt 11 extras) and S140b (S131-S139 thread
promotion to tier_required='complete_study') have landed on the live Render
Postgres.

Used at S142 open to confirm the apply state before writing the S142 migration.
S142 threads land at tier_required='complete_study' by architecture; if the
earlier S131-S139 threads still sit at 'extras' (S140b unapplied), the chapter
set will be tier-inconsistent.

Usage (from ~/Desktop/App, Mac terminal):
    DATABASE_URL="$(cat _scratch/_db_url.txt)" python3 api/_check_s140_s140b_apply.py

What it prints:
    - Total threads in cross_reference_threads
    - Tier distribution across all threads
    - Whether S140's Matt 11 threads (sort_order 260-270) exist at all
    - Sort-order range covered (S131 starts low; S140 ends at 270)
    - Diagnostic verdict + recommended next step
"""
from __future__ import annotations

import asyncio
import os
import sys
import ssl as ssl_lib
from pathlib import Path
from urllib.parse import urlparse, unquote

try:
    import asyncpg
except ImportError:
    print("asyncpg not installed.\n  Install with: pip3 install asyncpg --break-system-packages",
          file=sys.stderr)
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


async def main() -> int:
    url = load_database_url()
    if url.startswith("postgres://"):
        url = url.replace("postgres://", "postgresql://", 1)

    ssl_ctx = ssl_lib.create_default_context()
    ssl_ctx.check_hostname = False
    ssl_ctx.verify_mode = ssl_lib.CERT_NONE

    parsed = urlparse(url)
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
        total = await conn.fetchval("SELECT COUNT(*) FROM cross_reference_threads;")
        print(f"Total threads: {total}")
        print()

        rows = await conn.fetch(
            "SELECT tier_required, COUNT(*) AS n "
            "FROM cross_reference_threads "
            "GROUP BY tier_required ORDER BY tier_required;"
        )
        print("Tier distribution:")
        for r in rows:
            print(f"  {r['tier_required']:<16} {r['n']}")
        print()

        s140_count = await conn.fetchval(
            "SELECT COUNT(*) FROM cross_reference_threads "
            "WHERE sort_order BETWEEN 260 AND 270;"
        )
        print(f"S140 Matt 11 threads (sort_order 260-270): {s140_count} (expected 11)")

        pre_s140_total = await conn.fetchval(
            "SELECT COUNT(*) FROM cross_reference_threads WHERE sort_order < 260;"
        )
        pre_s140_extras = await conn.fetchval(
            "SELECT COUNT(*) FROM cross_reference_threads "
            "WHERE sort_order < 260 AND tier_required = 'extras';"
        )
        pre_s140_complete = await conn.fetchval(
            "SELECT COUNT(*) FROM cross_reference_threads "
            "WHERE sort_order < 260 AND tier_required = 'complete_study';"
        )
        print(f"Pre-S140 threads (S131-S139 territory, sort_order < 260): {pre_s140_total}")
        print(f"  at tier_required='extras':         {pre_s140_extras}")
        print(f"  at tier_required='complete_study': {pre_s140_complete}")
        print()

        sort_min = await conn.fetchval(
            "SELECT MIN(sort_order) FROM cross_reference_threads;"
        )
        sort_max = await conn.fetchval(
            "SELECT MAX(sort_order) FROM cross_reference_threads;"
        )
        print(f"Sort-order range: {sort_min} - {sort_max}")
        print()

        # ---- Verdict --------------------------------------------------------
        print("=" * 60)
        print("VERDICT:")
        if s140_count == 0:
            print("  S140 has NOT applied. Walk Block 1 first.")
        elif s140_count < 11:
            print(f"  S140 partially applied ({s140_count}/11 threads). Re-run Block 1.")
        else:
            print(f"  S140 applied cleanly ({s140_count}/11 threads).")

        if pre_s140_total == 0:
            print("  No pre-S140 threads found at all. Earlier sessions may not have applied.")
        elif pre_s140_extras > 0:
            print(f"  S140b has NOT applied. {pre_s140_extras} pre-S140 threads still at 'extras'.")
            print("  Walk Block 2 before S142 applies, or S142's 'complete_study' threads")
            print("  will create a tier inconsistency across the chapter set.")
        else:
            print(f"  S140b applied cleanly ({pre_s140_complete}/{pre_s140_total} pre-S140 threads")
            print(f"  at 'complete_study').")

        print()
        print("=" * 60)
    finally:
        await conn.close()

    return 0


if __name__ == "__main__":
    sys.exit(asyncio.run(main()))
