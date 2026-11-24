"""S458a — live read-back of 1 Enoch 71:13–16 after the address fix.  Run: python3 ~/Desktop/App/_s458a_check.py"""
import asyncio, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent / "api"))
from apply_migration import load_database_url
import asyncpg
WANT = {13: 'And that Head of Days came with Michael and Gabriel, Raphael and Phanuel, thousands and ten thousands of angels without number.', 14: 'And he came to me and greeted me with his voice, and said unto me: ‘You are the son of Adam who was born unto righteousness, And righteousness abides over you, And the righteousness of the Head of Days forsakes you not.’'}
async def main():
    con = await asyncpg.connect(load_database_url())
    rows = await con.fetch("""SELECT v.verse_number n, v.text t FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id
        WHERE e.slug='enoch' AND b.slug='1-enoch' AND c.chapter_number=71 AND v.verse_number BETWEEN 13 AND 16 ORDER BY 1""")
    ok = 0
    for r in rows:
        print(f"  71:{r['n']}  {r['t']}")
        ok += r['n'] in WANT and r['t'] == WANT[r['n']]
    cards = await con.fetchval("""SELECT count(*) FROM cross_references x JOIN verses v ON v.id IN (x.source_verse_id, x.target_verse_id) JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id
        WHERE b.slug='1-enoch' AND c.chapter_number=71 AND v.verse_number IN (13,14)""")
    print(f"S458a read-back: {ok}/2 verses hold the restored text; cards sitting on 71:13-14 still to rewrite: {cards}")
    await con.close()
asyncio.run(main())
