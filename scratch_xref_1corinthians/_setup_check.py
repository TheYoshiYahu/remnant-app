import asyncio, os
import asyncpg
from pathlib import Path
def load_db_url():
    url=os.environ.get("DATABASE_URL")
    if url: return url
    for raw in (Path(__file__).parent.parent/"api"/".env").read_text().splitlines():
        if raw.strip().startswith("DATABASE_URL="):
            return raw.split("=",1)[1].strip().strip('"').strip("'")
    raise SystemExit("no DATABASE_URL")
async def main():
    url=load_db_url()
    ssl='require' if 'sslmode' not in url else None
    conn=None
    for attempt in range(6):
        try:
            conn=await asyncpg.connect(url, ssl=ssl, timeout=30) if ssl else await asyncpg.connect(url, timeout=30)
            break
        except (asyncpg.exceptions.ConnectionDoesNotExistError, ConnectionError, OSError) as e:
            if attempt==5: raise
            await asyncio.sleep(2)

    # 1. all thread slugs -> EXISTING_SLUGS.txt
    rows=await conn.fetch("SELECT slug FROM cross_reference_threads ORDER BY slug")
    slugs=[r['slug'] for r in rows]
    Path(__file__).parent.joinpath("EXISTING_SLUGS.txt").write_text("\n".join(slugs)+"\n")
    print(f"EXISTING_SLUGS.txt regenerated: {len(slugs)} slugs")
    # 2. 1-corinthians-* threads (greenfield check)
    heb=[s for s in slugs if s.startswith("1-corinthians-")]
    print(f"1-corinthians-* threads in live DB: {len(heb)}")
    if heb: print("  ", heb[:10])
    # 3. revelation anchored threads via book join (any slug)
    n=await conn.fetchval("""SELECT count(*) FROM cross_reference_threads t
      JOIN verses v ON t.anchor_verse_id_start=v.id JOIN chapters c ON v.chapter_id=c.id
      JOIN books b ON c.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='canon' AND b.slug='1-corinthians'""")
    print(f"canon/revelation-anchored threads (any slug): {n}")
    # 4. band ceiling
    mx=await conn.fetchval("SELECT max(sort_order) FROM cross_reference_threads")
    print(f"max sort_order live: {mx}")
    # 5. confirm canon revelation book exists + verse count
    bk=await conn.fetchrow("""SELECT b.slug,b.id FROM books b JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='canon' AND b.slug='1-corinthians'""")
    print(f"canon revelation book row: {bk}")
    vc=await conn.fetchval("""SELECT count(*) FROM verses v JOIN chapters c ON v.chapter_id=c.id
      JOIN books b ON c.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='canon' AND b.slug='1-corinthians'""")
    print(f"canon revelation verse count: {vc}")
    chs=await conn.fetchval("""SELECT count(*) FROM chapters c JOIN books b ON c.book_id=b.id
      JOIN editions e ON b.edition_id=e.id WHERE e.slug='canon' AND b.slug='1-corinthians'""")
    print(f"canon revelation chapter count: {chs}")
    await conn.close()
asyncio.run(main())
