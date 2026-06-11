#!/usr/bin/env python3
"""Generic prod reconciliation for an extra-canonical book's cross-reference apparatus.
Usage: recon.py <edition> <book> <slug_prefix>
  e.g. recon.py enoch 1-enoch 1-enoch      ;  recon.py jubilees jubilees jubilees
"""
import asyncio, sys, asyncpg
from pathlib import Path
def url():
    for raw in Path("../api/.env").read_text().splitlines():
        if raw.strip().startswith("DATABASE_URL="):
            return raw.split("=",1)[1].strip().strip('"').strip("'")
async def main():
    ed, bk, pref = sys.argv[1], sys.argv[2], sys.argv[3]
    c = await asyncpg.connect(url(), ssl='require')
    n = await c.fetchval("SELECT count(*) FROM cross_reference_threads WHERE slug LIKE $1", pref+'-%')
    m = await c.fetchval("""SELECT count(*) FROM cross_reference_thread_members tm
      JOIN cross_reference_threads t ON tm.thread_id=t.id WHERE t.slug LIKE $1""", pref+'-%')
    print(f"LIVE {pref}: {n} threads / {m} members")
    rows = await c.fetch("""SELECT ch.chapter_number chn, count(*) c FROM cross_reference_threads t
      JOIN verses v ON t.anchor_verse_id_start=v.id JOIN chapters ch ON v.chapter_id=ch.id
      JOIN books b ON ch.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug=$1 AND b.slug=$2 GROUP BY ch.chapter_number ORDER BY ch.chapter_number""", ed, bk)
    print("per-chapter:", {r['chn']: r['c'] for r in rows})
    b = await c.fetch("SELECT min(sort_order) lo, max(sort_order) hi FROM cross_reference_threads WHERE slug LIKE $1", pref+'-%')
    print(f"band: {b[0]['lo']}-{b[0]['hi']}")
    orph = await c.fetchval("""SELECT count(*) FROM cross_reference_thread_members tm
      JOIN cross_reference_threads t ON tm.thread_id=t.id
      LEFT JOIN cross_references x ON tm.cross_reference_id=x.id
      WHERE t.slug LIKE $1 AND x.id IS NULL""", pref+'-%')
    print("orphan members:", orph)
    await c.close()
asyncio.run(main())
