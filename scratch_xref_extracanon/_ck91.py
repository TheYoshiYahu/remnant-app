import asyncio,asyncpg
from pathlib import Path
def url():
    for raw in Path("../api/.env").read_text().splitlines():
        if raw.strip().startswith("DATABASE_URL="): return raw.split("=",1)[1].strip().strip('"').strip("'")
async def main():
    c=await asyncpg.connect(url(),ssl='require')
    rows=await c.fetch("""SELECT v.verse_number vn FROM verses v JOIN chapters ch ON v.chapter_id=ch.id
      JOIN books b ON ch.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='enoch' AND b.slug='1-enoch' AND ch.chapter_number=91 ORDER BY v.verse_number""")
    print("DB ch91 verses:", [r['vn'] for r in rows])
    await c.close()
asyncio.run(main())
