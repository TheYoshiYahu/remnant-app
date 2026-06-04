#!/usr/bin/env python3
"""S199 — apply the Maps overlay rewrite to the production database.

Ships in the API image so it runs from the Render Web Shell with ONE short
typed command (Render Web Shell paste fails in Safari — keep it short):

    python3 /restoration-pipeline/_session199_apply_overlay.py

Applies data-schema/migrations/session199_maps_overlay_rewrite.sql, which
rewrites the maps/dispersion-overlay framework band from the S197 ANE-confined
copy (Assyrian/Babylonian exile + return to the old land) to the worldwide
scattering/gathering reading (all nations, the four corners, the islands of the
sea — the prophets quoted in full). Idempotent: the migration is a single
INSERT ... ON CONFLICT (tool, entry_key) DO UPDATE, so re-runs are safe.

The file is small and has no psql meta-commands, so it executes whole (no
chunking needed). Validated locally against pgserver in
restoration-pipeline/_session199_verify_overlay.py before shipping.
"""
from __future__ import annotations
import asyncio, os, sys

SQL_PATH = "/data-schema/migrations/session199_maps_overlay_rewrite.sql"


async def main() -> int:
    import asyncpg

    url = os.environ.get("DATABASE_URL")
    if not url:
        sys.path.insert(0, "/app")
        from config import settings
        url = settings.database_url

    sql = open(SQL_PATH).read()
    conn = await asyncpg.connect(url, command_timeout=120)
    conn.add_log_listener(lambda c, m: print("   ", getattr(m, "message", m)))
    try:
        await conn.execute(sql)
        print("=== applied session199_maps_overlay_rewrite.sql")
        row = await conn.fetchrow(
            "SELECT term_display, left(annotation_md, 80) AS head, "
            "       array_to_string(red_lines_cited, ',') AS red_lines, "
            "       (annotation_md LIKE '%four corners%' "
            "        AND annotation_md LIKE '%islands of the sea%' "
            "        AND annotation_md LIKE '%ends of the earth%') AS worldwide "
            "FROM tool_annotations WHERE tool='maps' AND entry_key='dispersion-overlay'"
        )
        if row is None:
            print("!! maps/dispersion-overlay row NOT found — apply failed")
            return 1
        print(f"   term_display : {row['term_display']}")
        print(f"   head         : {row['head']}…")
        print(f"   red_lines    : [{row['red_lines']}]")
        print(f"   worldwide?   : {row['worldwide']}")
        if not row["worldwide"]:
            print("!! worldwide-gathering language missing — wrong copy loaded")
            return 1
        print("DONE")
        return 0
    finally:
        await conn.close()


if __name__ == "__main__":
    raise SystemExit(asyncio.run(main()))
