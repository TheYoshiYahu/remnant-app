import asyncio,os
import asyncpg
from pathlib import Path
def url():
    for raw in (Path("api/.env")).read_text().splitlines():
        if raw.strip().startswith("DATABASE_URL="):
            return raw.split("=",1)[1].strip().strip('"').strip("'")
async def main():
    u=url(); ssl='require' if 'sslmode' not in u else None
    c=await asyncpg.connect(u,ssl=ssl) if ssl else await asyncpg.connect(u)
    print("=== EDITIONS + BOOKS (extra-canon) ===")
    rows=await c.fetch("""SELECT e.slug ed, b.slug bk, b.id bid, count(distinct ch.id) chs, count(v.id) vs
      FROM editions e JOIN books b ON b.edition_id=e.id
      JOIN chapters ch ON ch.book_id=b.id JOIN verses v ON v.chapter_id=ch.id
      WHERE e.slug <> 'canon'
      GROUP BY e.slug,b.slug,b.id ORDER BY e.slug,b.id""")
    cur=None
    for r in rows:
        if r['ed']!=cur: print(f"\n-- edition: {r['ed']}"); cur=r['ed']
        print(f"   {r['bk']:40} id={r['bid']:6} ch={r['chs']:4} v={r['vs']:5}")
    print("\n=== GREENFIELD CHECK: threads anchored on NON-canon editions ===")
    n=await c.fetch("""SELECT e.slug ed, count(*) n FROM cross_reference_threads t
      JOIN verses v ON t.anchor_verse_id_start=v.id JOIN chapters ch ON v.chapter_id=ch.id
      JOIN books b ON ch.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug<>'canon' GROUP BY e.slug""")
    print("threads anchored on non-canon:", [(r['ed'],r['n']) for r in n] or "NONE (greenfield)")
    mx=await c.fetchval("SELECT max(sort_order) FROM cross_reference_threads")
    print("max sort_order (band) live:", mx)
    await c.close()
asyncio.run(main())
