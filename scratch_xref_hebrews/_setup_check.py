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
    conn=await asyncpg.connect(load_db_url())
    # 1. all thread slugs -> EXISTING_SLUGS.txt
    rows=await conn.fetch("SELECT slug FROM cross_reference_threads ORDER BY slug")
    slugs=[r['slug'] for r in rows]
    Path(__file__).parent.joinpath("EXISTING_SLUGS.txt").write_text("\n".join(slugs)+"\n")
    print(f"EXISTING_SLUGS.txt regenerated: {len(slugs)} slugs")
    # 2. hebrews-* threads (greenfield check)
    heb=[s for s in slugs if s.startswith("hebrews-")]
    print(f"hebrews-* threads in live DB: {len(heb)}")
    if heb: print("  ", heb[:10])
    # 3. hebrews anchored threads via book join (any slug)
    n=await conn.fetchval("""SELECT count(*) FROM cross_reference_threads t
      JOIN verses v ON t.anchor_verse_id_start=v.id JOIN chapters c ON v.chapter_id=c.id
      JOIN books b ON c.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='canon' AND b.slug='hebrews'""")
    print(f"canon/hebrews-anchored threads (any slug): {n}")
    # 4. band ceiling
    mx=await conn.fetchval("SELECT max(sort_order) FROM cross_reference_threads")
    print(f"max sort_order live: {mx}")
    # 5. confirm canon hebrews book exists + verse count
    bk=await conn.fetchrow("""SELECT b.slug,b.id FROM books b JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='canon' AND b.slug='hebrews'""")
    print(f"canon hebrews book row: {bk}")
    vc=await conn.fetchval("""SELECT count(*) FROM verses v JOIN chapters c ON v.chapter_id=c.id
      JOIN books b ON c.book_id=b.id JOIN editions e ON b.edition_id=e.id
      WHERE e.slug='canon' AND b.slug='hebrews'""")
    print(f"canon hebrews verse count: {vc}")
    chs=await conn.fetchval("""SELECT count(*) FROM chapters c JOIN books b ON c.book_id=b.id
      JOIN editions e ON b.edition_id=e.id WHERE e.slug='canon' AND b.slug='hebrews'""")
    print(f"canon hebrews chapter count: {chs}")
    await conn.close()
asyncio.run(main())
