import asyncio,os
import asyncpg
from pathlib import Path
def url():
    for raw in Path("../api/.env").read_text().splitlines():
        if raw.strip().startswith("DATABASE_URL="): return raw.split("=",1)[1].strip().strip('"').strip("'")
async def main():
    u=url(); c=await asyncpg.connect(u,ssl='require')
    n=await c.fetchval("SELECT count(*) FROM cross_reference_threads WHERE slug LIKE '1-enoch-%'")
    m=await c.fetchval("""SELECT count(*) FROM cross_reference_thread_members tm
      JOIN cross_reference_threads t ON tm.thread_id=t.id WHERE t.slug LIKE '1-enoch-%'""")
    xr=await c.fetchval("""SELECT count(*) FROM cross_references x
      JOIN verses v ON x.source_verse_id=v.id JOIN chapters ch ON v.chapter_id=ch.id
      JOIN books b ON ch.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='enoch' AND b.slug='1-enoch'""")
    print(f"LIVE: {n} threads / {m} members / {xr} cross_references anchored on 1-enoch")
    rows=await c.fetch("""SELECT ch.chapter_number chn, count(*) c FROM cross_reference_threads t
      JOIN verses v ON t.anchor_verse_id_start=v.id JOIN chapters ch ON v.chapter_id=ch.id
      JOIN books b ON ch.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='enoch' AND b.slug='1-enoch' GROUP BY ch.chapter_number ORDER BY ch.chapter_number""")
    print("per-chapter threads:", {r['chn']:r['c'] for r in rows})
    bands=await c.fetch("SELECT min(sort_order) lo, max(sort_order) hi FROM cross_reference_threads WHERE slug LIKE '1-enoch-%'")
    print(f"band range: {bands[0]['lo']}-{bands[0]['hi']}")
    orph=await c.fetchval("""SELECT count(*) FROM cross_reference_thread_members tm
      JOIN cross_reference_threads t ON tm.thread_id=t.id
      LEFT JOIN cross_references x ON tm.cross_reference_id=x.id
      WHERE t.slug LIKE '1-enoch-%' AND x.id IS NULL""")
    print("orphan members:", orph)
    await c.close()
asyncio.run(main())
