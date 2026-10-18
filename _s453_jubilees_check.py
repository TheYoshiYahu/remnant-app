"""S453 — read back the live DB after _session453_jubilees_deploy.sh (asyncpg hides the NOTICE lines)."""
import asyncio, os, re, json
from pathlib import Path
import asyncpg
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", Path("api/.env").read_text()); url = m.group(1).strip().strip("'\"")
async def main():
    con = await asyncpg.connect(url, ssl="require")
    rows = await con.fetch("""select c.chapter_number ch, count(v.id) n from verses v join chapters c on c.id=v.chapter_id
        join books b on b.id=c.book_id join editions e on e.id=b.edition_id where b.slug='jubilees' and e.slug='jubilees' group by 1 order by 1""")
    tot = sum(r['n'] for r in rows); print("Jubilees rows live:", tot, "(expect 1307) —", ' '.join(f"{r['ch']}:{r['n']}" for r in rows))
    want = {int(c['number']): len(c['verses']) for c in json.load(open('source-texts/parsed/jubilees.json'))['books'][0]['chapters']}
    bad = [(r['ch'], r['n'], want[r['ch']]) for r in rows if r['n'] != want[r['ch']]]; print("chapters off:", bad or "none")
    for ch, vn in [(1,6),(13,25),(17,3),(17,16),(45,14)]:
        t = await con.fetchval("""select v.text from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id
            join editions e on e.id=b.edition_id where b.slug='jubilees' and e.slug='jubilees' and c.chapter_number=$1 and v.verse_number=$2""", ch, vn)
        print(f"{ch}:{vn} ->", (t or 'MISSING')[:95])
    n = await con.fetchval("""select count(*) from cross_references x join verses tv on tv.id=x.target_verse_id join chapters tc on tc.id=tv.chapter_id
        join books tb on tb.id=tc.book_id where tb.slug='jubilees' and tc.chapter_number=45 and tv.verse_number=14""")
    print("cards now targeting Jubilees 45:14 (moved there by 453b; expect >=2):", n)
    await con.close()
asyncio.run(main())
