import asyncio,asyncpg,sys
from pathlib import Path
def url():
    for raw in Path("../api/.env").read_text().splitlines():
        if raw.strip().startswith("DATABASE_URL="): return raw.split("=",1)[1].strip().strip('"').strip("'")
async def main():
    eds = sys.argv[1:] or ['lightfoot-apostolic-fathers','mrjames-apocryphal-nt']
    c=await asyncpg.connect(url(),ssl='require')
    for ed in eds:
        edid=await c.fetchval("SELECT id FROM editions WHERE slug=$1", ed)
        print(f"\n=== EDITION {ed} (id={edid}) ===")
        if edid is None:
            print("  NOT FOUND"); continue
        rows=await c.fetch("""
          SELECT b.id, b.slug, b.title, count(DISTINCT ch.id) chapters, count(DISTINCT v.id) verses
          FROM books b
          LEFT JOIN chapters ch ON ch.book_id=b.id
          LEFT JOIN verses v ON v.chapter_id=ch.id
          WHERE b.edition_id=$1 GROUP BY b.id,b.slug,b.title ORDER BY b.slug""", edid)
        for r in rows:
            tc=await c.fetchval("""SELECT count(*) FROM cross_reference_threads t
              JOIN verses v ON t.anchor_verse_id_start=v.id JOIN chapters ch ON v.chapter_id=ch.id
              WHERE ch.book_id=$1""", r['id'])
            flag = "GREENFIELD" if tc==0 else f"** {tc} THREADS EXIST **"
            print(f"  {r['slug']:<34} ch={r['chapters']:>3} v={r['verses']:>5}  threads={tc:>4}  {flag}")
    await c.close()
asyncio.run(main())
