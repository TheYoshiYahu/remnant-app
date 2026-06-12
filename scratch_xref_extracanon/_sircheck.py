import asyncio,asyncpg
from pathlib import Path
def url():
    for raw in Path("../api/.env").read_text().splitlines():
        if raw.strip().startswith("DATABASE_URL="): return raw.split("=",1)[1].strip().strip('"').strip("'")
async def main():
    c=await asyncpg.connect(url(),ssl='require')
    # threads + members anchored on apocrypha/ecclesiasticus
    n=await c.fetchval("""SELECT count(*) FROM cross_reference_threads t
      JOIN verses v ON t.anchor_verse_id_start=v.id JOIN chapters ch ON v.chapter_id=ch.id
      JOIN books b ON ch.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='apocrypha' AND b.slug='ecclesiasticus'""")
    m=await c.fetchval("""SELECT count(*) FROM cross_reference_thread_members tm
      JOIN cross_reference_threads t ON tm.thread_id=t.id
      JOIN verses v ON t.anchor_verse_id_start=v.id JOIN chapters ch ON v.chapter_id=ch.id
      JOIN books b ON ch.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='apocrypha' AND b.slug='ecclesiasticus'""")
    bnd=await c.fetch("""SELECT min(t.sort_order) lo, max(t.sort_order) hi FROM cross_reference_threads t
      JOIN verses v ON t.anchor_verse_id_start=v.id JOIN chapters ch ON v.chapter_id=ch.id
      JOIN books b ON ch.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='apocrypha' AND b.slug='ecclesiasticus'""")
    print(f"AUTHORITATIVE (anchored on apocrypha/ecclesiasticus): {n} threads / {m} members, band {bnd[0]['lo']}-{bnd[0]['hi']}")
    await c.close()
asyncio.run(main())
