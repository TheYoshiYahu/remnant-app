#!/usr/bin/env python3
"""S449 — READ-ONLY. Lists every surplus 1 Enoch verse row (above Charles's last verse)
and what references it; dumps all cross-references touching Enoch to
source-texts/enoch-charles-1917/enoch-xrefs-live.tsv for the step-F sweep.
Run: python3 ~/Desktop/App/_s449_surplus_report.py"""
import asyncio, json, os, re
from pathlib import Path
APP=Path(__file__).resolve().parent
url=os.environ.get('DATABASE_URL') or re.search(r'DATABASE_URL=(.*)', open(APP/'api/.env').read()).group(1).strip().strip('"\'')
local=json.load(open(APP/'source-texts/parsed/enoch.json',encoding='utf-8'))
hi={int(c['number']):max(int(v['number']) for v in c['verses']) for c in local['books'][0]['chapters']}
async def main():
    import asyncpg
    con=await asyncpg.connect(url)
    fks=await con.fetch("""SELECT cl.relname tbl, a.attname col FROM pg_constraint con
        JOIN pg_class cl ON cl.oid=con.conrelid JOIN pg_namespace ns ON ns.oid=cl.relnamespace
        JOIN pg_attribute a ON a.attrelid=con.conrelid AND a.attnum=con.conkey[1]
        WHERE con.contype='f' AND con.confrelid='verses'::regclass AND ns.nspname NOT LIKE 'pg_temp%'""")
    print("tables with a FK to verses:", ', '.join(f"{r['tbl']}.{r['col']}" for r in fks))
    rows=await con.fetch("""SELECT v.id, c.chapter_number ch, v.verse_number vn, left(v.text,70) t FROM verses v
        JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id AND b.slug='1-enoch'
        JOIN editions e ON e.id=b.edition_id AND e.slug='enoch' ORDER BY 1""")
    surplus=[r for r in rows if r['vn']>hi[r['ch']]]
    print(f"surplus rows: {len(surplus)}")
    from collections import Counter
    byref=Counter(); detail=[]
    for r in surplus:
        refs=[]
        for fk in fks:
            n=await con.fetchval(f'SELECT count(*) FROM "{fk["tbl"]}" WHERE "{fk["col"]}"=$1', r['id'])
            if n: refs.append(f"{fk['tbl']}.{fk['col']}×{n}")
        byref[' '.join(refs)]+=1
        detail.append((r['ch'],r['vn'],r['id'],' '.join(refs),r['t']))
    print("what holds them (pattern → rows):")
    for k,v in byref.most_common(): print(f"  {v:4d}  {k}")
    xr=await con.fetch("""SELECT x.id, sb.slug sbook, sc.chapter_number sch, sv.verse_number svn,
               tb.slug tbook, tc.chapter_number tch, tv.verse_number tvn, coalesce(x.note,'') note
          FROM cross_references x
          JOIN verses sv ON sv.id=x.source_verse_id JOIN chapters sc ON sc.id=sv.chapter_id JOIN books sb ON sb.id=sc.book_id
          JOIN verses tv ON tv.id=x.target_verse_id JOIN chapters tc ON tc.id=tv.chapter_id JOIN books tb ON tb.id=tc.book_id
         WHERE sb.slug='1-enoch' OR tb.slug='1-enoch' ORDER BY sb.slug, sc.chapter_number, sv.verse_number""")
    await con.close()
    out=APP/'source-texts/enoch-charles-1917/enoch-xrefs-live.tsv'
    with open(out,'w',encoding='utf-8') as f:
        f.write("xref_id\tsource\ttarget\tsource_is_surplus\ttarget_is_surplus\tnote\n")
        sur={(d[0],d[1]) for d in detail}
        for x in xr:
            ss = x['sbook']=='1-enoch' and (x['sch'],x['svn']) in sur
            ts = x['tbook']=='1-enoch' and (x['tch'],x['tvn']) in sur
            f.write(f"{x['id']}\t{x['sbook']} {x['sch']}:{x['svn']}\t{x['tbook']} {x['tch']}:{x['tvn']}\t{int(ss)}\t{int(ts)}\t{x['note'].replace(chr(9),' ').replace(chr(10),' ')}\n")
    onsur=sum(1 for x in xr if (x['sbook']=='1-enoch' and (x['sch'],x['svn']) in sur) or (x['tbook']=='1-enoch' and (x['tch'],x['tvn']) in sur))
    print(f"cross-references touching Enoch: {len(xr)}; of those attached to a surplus (invented/misplaced) verse: {onsur}")
    with open(APP/'source-texts/enoch-charles-1917/enoch-surplus-rows.tsv','w',encoding='utf-8') as f:
        f.write("ch\tvn\tverse_id\treferenced_by\told_text\n")
        for d in detail: f.write('\t'.join(map(str,d))+'\n')
    print("written: source-texts/enoch-charles-1917/enoch-xrefs-live.tsv and enoch-surplus-rows.tsv")
asyncio.run(main())
