"""S454 — read back the live DB after _session454_apocrypha_deploy.sh."""
import asyncio, os, re, json
from pathlib import Path
import asyncpg
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", Path("api/.env").read_text()); url = m.group(1).strip().strip("'\"")
Q = """FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id AND e.slug='apocrypha'"""
async def main():
    con = await asyncpg.connect(url, ssl="require")
    n = await con.fetchval(f"select count(v.id) {Q}"); print("Apocrypha rows live:", n, "(expect 5720)")
    want = {(b['book_id'], c['number']): len(c['verses']) for b in json.load(open('source-texts/parsed/apocrypha.json'))['books'] for c in b['chapters'] if c['number']}
    rows = await con.fetch(f"select b.slug bk, c.chapter_number ch, count(v.id) n {Q} group by 1,2")
    bad = [(r['bk'], r['ch'], r['n'], want.get((r['bk'], r['ch']))) for r in rows if r['n'] != want.get((r['bk'], r['ch']))]; print("chapters off:", bad or "none")
    for bk, ch, vn in [('the-rest-of-esther',10,4),('the-rest-of-esther',10,13),('the-rest-of-esther',11,1),('the-rest-of-esther',13,7),('2-esdras',14,48),('1-maccabees',5,35)]:
        t = await con.fetchval(f"select v.text {Q} where b.slug=$1 and c.chapter_number=$2 and v.verse_number=$3", bk, ch, vn)
        print(f"{bk} {ch}:{vn} -> …{(t or 'MISSING')[-80:]}")
    rows = await con.fetch(f"select v.verse_number vn, count(x.id) n from cross_references x join verses v on v.id=x.source_verse_id join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id and b.slug='the-rest-of-esther' join editions e on e.id=b.edition_id and e.slug='apocrypha' where c.chapter_number=10 group by 1 order by 1")
    print("cards per Rest of Esther 10 verse (expect 5:2 6:1 7:1 8:2 9:3 11:1 13:2, none on 4):", ' '.join(f"{r['vn']}:{r['n']}" for r in rows))
    rows = await con.fetch("select t.slug, a.verse_number va, z.verse_number vb from cross_reference_threads t join verses a on a.id=t.anchor_verse_id_start join verses z on z.id=t.anchor_verse_id_end where t.slug like 'rest-of-esther-10-%' order by 1")
    for r in rows: print(f"thread {r['slug']}: 10:{r['va']}–10:{r['vb']}")
    await con.close()
asyncio.run(main())
