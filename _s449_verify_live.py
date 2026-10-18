#!/usr/bin/env python3
"""S449 — read-only check of the LIVE 1 Enoch rows against parsed/enoch.json. Run: python3 ~/Desktop/App/_s449_verify_live.py"""
import asyncio, json, os, re, sys
from pathlib import Path
APP=Path(__file__).resolve().parent
url=os.environ.get('DATABASE_URL') or re.search(r'DATABASE_URL=(.*)', open(APP/'api/.env').read()).group(1).strip().strip('"\'')
local=json.load(open(APP/'source-texts/parsed/enoch.json',encoding='utf-8'))
want={(int(c['number']),int(v['number'])):v['text'] for c in local['books'][0]['chapters'] for v in c['verses']}
async def main():
    import asyncpg
    con=await asyncpg.connect(url)
    rows=await con.fetch("""SELECT c.chapter_number ch, v.verse_number vn, v.text FROM verses v
        JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id AND b.slug='1-enoch'
        JOIN editions e ON e.id=b.edition_id AND e.slug='enoch' ORDER BY 1,2""")
    xr=await con.fetchval("""SELECT count(*) FROM cross_references x
        JOIN verses sv ON sv.id=x.source_verse_id JOIN chapters sc ON sc.id=sv.chapter_id JOIN books sb ON sb.id=sc.book_id
        JOIN verses tv ON tv.id=x.target_verse_id JOIN chapters tc ON tc.id=tv.chapter_id JOIN books tb ON tb.id=tc.book_id
        WHERE sb.slug='1-enoch' OR tb.slug='1-enoch'""")
    await con.close()
    live={(r['ch'],r['vn']):r['text'] for r in rows}
    wrong=[k for k in want if live.get(k)!=want[k]]
    surplus=sorted(k for k in live if k not in want)
    print(f"live Enoch verse rows: {len(live)}   expected: {len(want)}")
    print(f"rows differing from parsed/enoch.json: {len(wrong)} {wrong[:10]}")
    print(f"surplus rows kept (referenced by cards): {len(surplus)} {surplus[:40]}")
    print(f"cross_references touching 1 Enoch: {xr}")
    def ch(n): return ' '.join(live[k] for k in sorted(live) if k[0]==n)
    for a,b in ((28,29),(95,97),(103,104)):
        print(f"ch {a} == ch {b}? {ch(a)==ch(b)}   (ch {a}: {sum(1 for k in live if k[0]==a)} vv, ch {b}: {sum(1 for k in live if k[0]==b)} vv)")
    print("live 14:18 =", live.get((14,18),'')[:110])
    print("live 14:20 =", live.get((14,20),'')[:110])
asyncio.run(main())
