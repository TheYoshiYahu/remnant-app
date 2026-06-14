#!/usr/bin/env python3
"""OFFLINE resolve-equivalent (used while the prod DB is unreachable).
Mirrors resolve_check.py but resolves every src/tgt/anchor (edition,book,ch,v)
tuple against the PARSED editions in source-texts/parsed (the exact JSON the DB
is loaded from) instead of the live DB. Any tuple that does not resolve = a row
the migration's inner JOIN would silently drop. Also checks thread anchor verses.

Usage: python offline_resolve.py minion_galatians_*.sql
"""
import json, re, os, sys, glob

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'source-texts', 'parsed')
EDFILES = {'canon':'canon','enoch':'enoch','jubilees':'jubilees','jasher':'jasher',
 'apocrypha':'apocrypha','apocrypha-charles-vol1':'apocrypha-charles-vol1',
 'pseudepigrapha':'pseudepigrapha-charles-vol2','adam-eve-conflict':'adam-eve-conflict',
 'apocalypse-of-abraham':'apocalypse-of-abraham','ascension-isaiah':'ascension-isaiah',
 'sonnini-acts-29':'sonnini-acts-29'}
VERSE = set()
for es, fn in EDFILES.items():
    d = json.load(open(os.path.join(BASE, fn + '.json')))
    for b in d['books']:
        bid = b.get('book_id') or b.get('slug')
        for c in b['chapters']:
            cn = c.get('number') or c.get('chapter_number')
            for v in c.get('verses', []):
                VERSE.add((es, bid, cn, v['number']))

# string-aware tuple parser (inlined from resolve_check; importing it would run its DB main())
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
        region=hm.group(1);depth=0;start=None;idx=0;N=len(region);instr=False
        while idx<N:
            ch=region[idx]
            if instr:
                if ch=="'":
                    if idx+1<N and region[idx+1]=="'": idx+=2; continue
                    instr=False
                idx+=1; continue
            if ch=="'":
                instr=True; idx+=1; continue
            if ch=='(':
                if depth==0: start=idx+1
                depth+=1
            elif ch==')':
                depth-=1
                if depth==0 and start is not None:
                    tk=toks(region[start:idx])
                    strs=[v for k,v in tk if k=='s'];ints=[v for k,v in tk if k=='i']
                    if len(strs)>=5 and len(ints)>=4:
                        rows.append((strs[0],strs[1],ints[0],ints[1],strs[2],strs[3],ints[2],ints[3]))
                    start=None
            idx+=1
    return rows

unresolved = []
checked = 0
for f in sys.argv[1:]:
    sql = open(f, encoding='utf-8', errors='replace').read()
    # cross_references src+tgt tuples
    for row in parse_tuples(f):
        se, ss, sc, sv, te, ts, tc, tv = row
        for (e,b,c,v,role) in ((se,ss,sc,sv,'src'),(te,ts,tc,tv,'tgt')):
            checked += 1
            if (e,b,c,v) not in VERSE:
                unresolved.append((os.path.basename(f), role, e, b, c, v))
    # thread anchors: SELECT 'slug', ... FROM view sv, view ev WHERE sv...verse_number=N AND ev...verse_number=M
    for m in re.finditer(r"INSERT INTO cross_reference_threads.*?WHERE\s+(.*?)ON CONFLICT", sql, re.DOTALL):
        w = m.group(1)
        # pull edition/book/chapter/verse pairs for sv (start) and ev (end)
        for tagp in ('sv','ev'):
            ed = re.search(rf"{tagp}\.edition_slug='([^']+)'", w)
            bk = re.search(rf"{tagp}\.book_slug='([^']+)'", w)
            ch = re.search(rf"{tagp}\.chapter_number=(\d+)", w)
            vn = re.search(rf"{tagp}\.verse_number=(\d+)", w)
            if ed and bk and ch and vn:
                key=(ed.group(1),bk.group(1),int(ch.group(1)),int(vn.group(1)))
                checked += 1
                if key not in VERSE:
                    unresolved.append((os.path.basename(f),'anchor-'+tagp,*key))

print(f"OFFLINE RESOLVE — checked {checked} tuples (src+tgt+anchors) across {len(sys.argv)-1} fragments")
print(f"UNRESOLVED: {len(unresolved)}\n")
for u in unresolved:
    print("  ", u)
