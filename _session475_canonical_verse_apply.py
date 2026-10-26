#!/usr/bin/env python3
"""S475 — apply the canonical-verse migration with a built-in dry run.

    cd ~/Desktop/App && DATABASE_URL="$(cat _scratch/_db_url.txt)" python3 _session475_canonical_verse_apply.py

Inside ONE transaction: (1) run data-schema/migrations/session475_canonical_verse.sql, (2) for every partner,
compare the OLD per-chapter highlight / bookmark queries with the NEW canonical-aware ones, row for row.
Nothing is kept unless every comparison is identical. No partner rows are changed by the migration at all.
"""
import asyncio, os, sys
from pathlib import Path
import asyncpg

HERE = Path(__file__).resolve().parent
SQL = (HERE / "data-schema/migrations/session475_canonical_verse.sql").read_text()
body = SQL.replace("BEGIN;", "").replace("COMMIT;", "")

OLD_H = """SELECT vh.id::text, vh.verse_id, vh.color, vh.style, vh.word_start, vh.word_end
             FROM verse_highlights vh JOIN verses v ON vh.verse_id = v.id
            WHERE vh.user_id = $1 ORDER BY vh.user_id, v.chapter_id, vh.created_at, vh.id"""
NEW_H = """SELECT vh.id::text, v.id AS verse_id, vh.color, vh.style,
                  CASE WHEN vh.verse_id = v.id THEN vh.word_start END,
                  CASE WHEN vh.verse_id = v.id THEN vh.word_end END
             FROM verse_highlights vh
             JOIN verses vh_v ON vh_v.id = vh.verse_id
             JOIN verses v ON (vh.verse_id = v.id
                   OR (vh.word_start IS NULL AND vh.verse_id = COALESCE(v.canonical_verse_id, v.id))
                   OR (vh.word_start IS NOT NULL AND COALESCE(vh_v.canonical_verse_id, vh_v.id) = COALESCE(v.canonical_verse_id, v.id)))
            WHERE vh.user_id = $1 ORDER BY vh.user_id, v.chapter_id, vh.created_at, vh.id"""
OLD_B = """SELECT bm.id::text, bm.verse_id FROM bookmarks bm JOIN verses v ON bm.verse_id = v.id
            WHERE bm.user_id = $1 ORDER BY v.chapter_id, bm.created_at, bm.id"""
NEW_B = """SELECT bm.id::text, v.id FROM bookmarks bm JOIN verses v ON bm.verse_id = COALESCE(v.canonical_verse_id, v.id)
            WHERE bm.user_id = $1 ORDER BY v.chapter_id, bm.created_at, bm.id"""

async def main():
    url = os.environ.get("DATABASE_URL")
    if not url:
        print("Set DATABASE_URL (see the command at the top of this file).", file=sys.stderr); sys.exit(2)
    conn = await asyncpg.connect(url, ssl="require")
    try:
        print("schema_version before:", await conn.fetchval("SELECT version FROM schema_version"))
        before = {t: await conn.fetchval(f"SELECT count(*) FROM {t}") for t in ("verse_highlights", "bookmarks", "study_notes", "reading_positions", "verses")}
        async with conn.transaction():
            await conn.execute(body)
            after = {t: await conn.fetchval(f"SELECT count(*) FROM {t}") for t in before}
            assert before == after, f"row counts changed: {before} -> {after}"
            users = [r["user_id"] for r in await conn.fetch("SELECT DISTINCT user_id FROM verse_highlights UNION SELECT DISTINCT user_id FROM bookmarks")]
            bad = 0; h = b = 0
            for u in users:
                oh = [tuple(r) for r in await conn.fetch(OLD_H, u)]; nh = [tuple(r) for r in await conn.fetch(NEW_H, u)]
                ob = [tuple(r) for r in await conn.fetch(OLD_B, u)]; nb = [tuple(r) for r in await conn.fetch(NEW_B, u)]
                h += len(oh); b += len(ob)
                if oh != nh or ob != nb:
                    bad += 1; print("DIFFERS for user", u, len(oh), len(nh), len(ob), len(nb))
            print(f"partners checked: {len(users)}; highlights compared: {h}; bookmarks compared: {b}; differing: {bad}")
            assert bad == 0, "old and new queries differ — rolled back, nothing kept"
            assert await conn.fetchval("SELECT count(*) FROM verses WHERE canonical_verse_id IS NOT NULL") == 0
        print("schema_version after:", await conn.fetchval("SELECT version FROM schema_version"))
        print("ALL GOOD — migration kept; row counts unchanged:", after)
    finally:
        await conn.close()

asyncio.run(main())
