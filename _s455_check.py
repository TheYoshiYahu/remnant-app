"""S455 — read back the live DB after _session455_deploy.sh."""
import asyncio, os, re
from pathlib import Path
import asyncpg
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", (Path(__file__).resolve().parent / "api" / ".env").read_text()); url = m.group(1).strip().strip("'\"")
async def main():
    con = await asyncpg.connect(url, ssl="require")
    print("editions left named charles-vol1:", await con.fetchval("select count(*) from editions where slug='apocrypha-charles-vol1'"), "(expect 0)")
    rows = await con.fetch("select b.slug, b.id, b.canonical_order, b.witness_category from books b join editions e on e.id=b.edition_id and e.slug='pseudepigrapha' order by b.canonical_order")
    print("pseudepigrapha books:", ' | '.join(f"{r['slug']}({r['id']},{r['canonical_order']})" for r in rows), "— expect 3-maccabees right before 4-maccabees")
    bid = await con.fetchval("select b.id from books b join editions e on e.id=b.edition_id and e.slug='pseudepigrapha' where b.slug='3-maccabees'")
    print("3 Macc chapters/verses:", await con.fetchval("select count(*) from chapters where book_id=$1", bid), "/", await con.fetchval("select count(v.id) from verses v join chapters c on c.id=v.chapter_id where c.book_id=$1", bid), "(expect 7 / 228)")
    print("3 Macc 1:1:", (await con.fetchval("select v.text from verses v join chapters c on c.id=v.chapter_id where c.book_id=$1 and c.chapter_number=1 and v.verse_number=1", bid))[:70])
    print("cards touching 3 Macc:", await con.fetchval("select count(*) from cross_references x where x.source_verse_id in (select v.id from verses v join chapters c on c.id=v.chapter_id where c.book_id=$1) or x.target_verse_id in (select v.id from verses v join chapters c on c.id=v.chapter_id where c.book_id=$1)", bid), "(S454 counted 172)")
    print("threads anchored on 3 Macc:", await con.fetchval("select count(*) from cross_reference_threads where anchor_verse_id_start in (select v.id from verses v join chapters c on c.id=v.chapter_id where c.book_id=$1)", bid))
    print("schema_version:", await con.fetchval("select version from schema_version"))
    await con.close()
asyncio.run(main())
