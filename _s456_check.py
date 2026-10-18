"""S456 — read back the live DB after _session456_deploy.sh. Prints the fixed rows so they can be read, not counted."""
import asyncio, os, re
from pathlib import Path
import asyncpg
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", (Path(__file__).resolve().parent / "api" / ".env").read_text()); url = m.group(1).strip().strip("'\"")
SUBS = [('romans',16,27),('1-corinthians',16,24),('2-corinthians',13,14),('galatians',6,18),('ephesians',6,24),('philippians',4,23),
        ('colossians',4,18),('1-thessalonians',5,28),('2-thessalonians',3,18),('1-timothy',6,21),('2-timothy',4,22),('titus',3,15),
        ('philemon',1,25),('hebrews',13,25)]
KEEP = [('amos',3,7),('1-john',3,4),('1-john',3,5),('1-john',3,6),('1-john',3,7),('1-john',3,8),('psalms',81,3)]
Q = """select v.text from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id
       join editions e on e.id=b.edition_id and e.slug='canon' where b.slug=$1 and c.chapter_number=$2 and v.verse_number=$3"""
async def main():
    con = await asyncpg.connect(url, ssl="require")
    print("schema_version:", await con.fetchval("select version from schema_version"), "(expect 1.0.0-phase4-session455b)")
    print("canon verse rows:", await con.fetchval("select count(v.id) from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id and e.slug='canon'"), "(expect 31102, unchanged)")
    rows = await con.fetch("select c.chapter_number, c.chapter_title from chapters c join books b on b.id=c.book_id join editions e on e.id=b.edition_id and e.slug='canon' where b.slug='psalms' order by 1")
    titled = [r for r in rows if r['chapter_title'] != f"Chapter {r['chapter_number']}"]
    print(f"Psalm chapters with a title: {len(titled)} (expect 117). Samples:")
    for n in (3, 18, 51, 90, 102, 119, 120, 145):
        print(f"  Ps {n}: {dict(rows[n-1])['chapter_title'][:110]}")
    print("Psalm 119 stanza-end verses (should end with the verse, no Hebrew letter):")
    for vn in (8, 16, 88, 168, 176):
        print(f"  119:{vn} ...{(await con.fetchval(Q, 'psalms', 119, vn))[-60:]}")
    print("The 14 epistle endings (should end at 'Amen.'):")
    for bk, c, vn in SUBS:
        t = await con.fetchval(Q, bk, c, vn); print(f"  {bk} {c}:{vn} ...{t[-55:]}  {'OK' if t.endswith('Amen.') else '<-- CHECK'}")
    print("Romans 15:30:", (await con.fetchval(Q, 'romans', 15, 30))[:120])
    print("Item 4 — Yoshi's renderings, live text (untouched by the migration; compare with canon.json / the registry):")
    for bk, c, vn in KEEP:
        print(f"  {bk} {c}:{vn} | {await con.fetchval(Q, bk, c, vn)}")
    await con.close()
asyncio.run(main())
