#!/usr/bin/env python3
"""Authoritative resolution check against PROD DB for extra-canonical fragments.
For each input tuple, confirm BOTH the source ref (the extra-canonical anchor) and
the target ref resolve to a real verse in the live DB — exactly what the migration's
inner JOINs require. Any ref that does NOT resolve = a silently-dropped row.
Also prints the live thread/member count for a given anchor edition+book.

Usage: resolve_check.py <edition> <book> <frag1.sql> [frag2.sql ...]
       (edition/book = the anchor, e.g. enoch 1-enoch)
"""
import asyncio, os, re, sys
import asyncpg
from pathlib import Path

EDITIONS = ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
 'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah',
 'sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt')

def load_db_url():
    url = os.environ.get("DATABASE_URL")
    if url: return url
    for raw in (Path(__file__).parent.parent/"api"/".env").read_text().splitlines():
        if raw.strip().startswith("DATABASE_URL="):
            return raw.split("=",1)[1].strip().strip('"').strip("'")
    raise SystemExit("no DATABASE_URL")

def toks(block):
    out=[];i=0;n=len(block)
    while i<n:
        c=block[i]
        if c=="'":
            i+=1;buf=[]
            while i<n:
                if block[i]=="'":
                    if i+1<n and block[i+1]=="'": buf.append("'");i+=2;continue
                    i+=1;break
                buf.append(block[i]);i+=1
            out.append(('s',''.join(buf)))
        elif c.isdigit():
            j=i
            while j<n and block[j].isdigit(): j+=1
            out.append(('i',int(block[i:j])));i=j
        else: i+=1
    return out

def parse_tuples(frag):
    sql=open(frag,encoding='utf-8',errors='replace').read()
    rows=[]
    for hm in re.finditer(r"WITH\s+input\([^)]*\)\s+AS\s*\(VALUES(.*?)\)\s*INSERT",sql,re.DOTALL|re.IGNORECASE):
        region=hm.group(1);depth=0;start=None
        for idx,ch in enumerate(region):
            if ch=='(' and depth==0: depth=1;start=idx+1
            elif ch=='(': depth+=1
            elif ch==')':
                depth-=1
                if depth==0 and start is not None:
                    tk=toks(region[start:idx])
                    strs=[v for k,v in tk if k=='s'];ints=[v for k,v in tk if k=='i']
                    if len(strs)>=5 and len(ints)>=4:
                        rows.append((strs[0],strs[1],ints[0],ints[1],strs[2],strs[3],ints[2],ints[3]))
                    start=None
    return rows

async def main():
    anchor_ed, anchor_bk = sys.argv[1], sys.argv[2]
    frags=sys.argv[3:]
    url=load_db_url()
    ssl='require' if 'sslmode' not in url else None
    conn=await asyncpg.connect(url, ssl=ssl) if ssl else await asyncpg.connect(url)
    recs=await conn.fetch("""
      SELECT e.slug AS ed, b.slug AS bk, c.chapter_number AS ch, v.verse_number AS vn
      FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
      JOIN editions e ON b.edition_id=e.id WHERE e.slug = ANY($1::text[])
    """, list(EDITIONS))
    resolved=set((r['ed'],r['bk'],r['ch'],r['vn']) for r in recs)
    print(f"DB resolution set: {len(resolved)} verses across {len(EDITIONS)} editions")
    n=await conn.fetchval("""
      SELECT count(*) FROM cross_reference_threads t
      JOIN verses v ON t.anchor_verse_id_start=v.id
      JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
      JOIN editions e ON b.edition_id=e.id
      WHERE e.slug=$1 AND b.slug=$2""", anchor_ed, anchor_bk)
    m=await conn.fetchval("""
      SELECT count(*) FROM cross_reference_thread_members tm
      JOIN cross_reference_threads t ON tm.thread_id=t.id
      JOIN verses v ON t.anchor_verse_id_start=v.id
      JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
      JOIN editions e ON b.edition_id=e.id
      WHERE e.slug=$1 AND b.slug=$2""", anchor_ed, anchor_bk)
    print(f"LIVE {anchor_ed}/{anchor_bk} threads: {n}  members: {m}")
    await conn.close()
    total_bad=0
    for frag in frags:
        rows=parse_tuples(frag)
        bad=[]
        for (se,ss,sc,sv,te,ts,tc,tv) in rows:
            if (se,ss,sc,sv) not in resolved: bad.append(('SRC',se,ss,sc,sv))
            if (te,ts,tc,tv) not in resolved: bad.append(('TGT',te,ts,tc,tv))
        print(f"\n{os.path.basename(frag)}: {len(rows)} tuples, {len(bad)} UNRESOLVED refs")
        for b in bad: print("   UNRESOLVED", b)
        total_bad+=len(bad)
    print(f"\n=== TOTAL UNRESOLVED REFS: {total_bad} ===")
    sys.exit(1 if total_bad else 0)

asyncio.run(main())
