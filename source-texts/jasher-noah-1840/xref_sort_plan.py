#!/usr/bin/env python3
"""S450 — cards and thread anchors that sit on the three blob verses (7:18, 9:7,
20:13) in session252_jasher_extracanon_cross_references.sql: find the verse each
card really describes (note text vs the true verse texts) and write the plan."""
import re, json
from pathlib import Path
HERE=Path(__file__).parent; APP=HERE.resolve().parents[1]
sql=open(APP/'data-schema/migrations/session252_jasher_extracanon_cross_references.sql',encoding='utf-8').read()
fixed=json.load(open(HERE/'jasher.fixed.json'))
V={(c['number'],v['number']):v['text'] for c in fixed['books'][0]['chapters'] for v in c['verses']}
BLOBS={(7,18):range(18,52),(9,7):range(7,40),(20,13):range(13,31)}
STOP=set("and the of to in a that he his for was with is as they them it be from which him her she their had were this all not but by on at you your my me i will shall said says are have has or so then an into unto upon".split())
def words(s): return set(w for w in re.findall(r"[a-z']+",s.lower()) if w not in STOP and len(w)>2)
# card rows: ('jasher','jasher', c, v, ted, tbook, tc, tv, tier, E'note')
row_re=re.compile(r"\('jasher', 'jasher', (\d+), (\d+), '([^']+)', '([^']+)', (\d+), (\d+), '(\w+)', E'((?:[^']|'')*)'\)")
plan=[]
for m in row_re.finditer(sql):
    c,v=int(m.group(1)),int(m.group(2))
    if (c,v) not in BLOBS: continue
    note=m.group(8).replace("''","'")
    # the Jasher half of the note: text after the target quote's closing '*'
    tail=note.split('*')[-1] if '*' in note else note
    tw=words(tail)
    best=[]
    for n in BLOBS[(c,v)]:
        vw=words(V[(c,n)]); 
        if not vw: continue
        best.append((len(tw&vw)/ (len(tw)+1e-9), n))
    best.sort(reverse=True)
    sc,n=best[0]; sc2,n2=best[1] if len(best)>1 else (0,None)
    # a note may cite the verse explicitly in canon style "Jasher 7:19" (rare — they were written to the blob)
    plan.append(dict(oc=c,ov=v,nc=c,nv=n,score=round(sc,2),runner=(n2,round(sc2,2)),target=f"{m.group(3)}/{m.group(4)} {m.group(5)}:{m.group(6)}",tail=tail.strip()[:140],note=note))
# threads anchored on a blob
thr=[]
for m in re.finditer(r"SELECT '([^']+)',\n\s+E'((?:[^']|'')*)',\n\s+E'((?:[^']|'')*)',\n\s+sv\.verse_id, ev\.verse_id, '(\w+)', (\d+)\n\s+FROM [^\n]+\n\s+WHERE sv\.edition_slug='jasher' AND sv\.book_slug='jasher' AND sv\.chapter_number=(\d+) AND sv\.verse_number=(\d+)\n\s+AND ev\.edition_slug='jasher' AND ev\.book_slug='jasher' AND ev\.chapter_number=(\d+) AND ev\.verse_number=(\d+)",sql):
    s=(int(m.group(6)),int(m.group(7))); e=(int(m.group(8)),int(m.group(9)))
    if s in BLOBS or e in BLOBS: thr.append(dict(slug=m.group(1),title=m.group(2).replace("''","'"),start=s,end=e))
# thread members: which cards belong to which thread (for anchor ranges)
mem={}
for m in re.finditer(r"INSERT INTO cross_reference_thread_members[\s\S]*?SELECT t\.id, x\.id[\s\S]*?WHERE t\.slug='([^']+)'[\s\S]*?AND sv\.chapter_number=(\d+) AND sv\.verse_number=(\d+)[\s\S]*?(?=INSERT|-- -----|\Z)",sql):
    pass
json.dump(dict(cards=plan,threads=thr),open(HERE/'jasher-xref-sort-plan.json','w'),indent=1)
with open(HERE/'jasher-xref-sort-plan.tsv','w') as f:
    f.write("old\tnew\tscore\trunner-up\ttarget\tJasher half of the note\n")
    for p in plan: f.write(f"{p['oc']}:{p['ov']}\t{p['nc']}:{p['nv']}\t{p['score']}\t{p['runner']}\t{p['target']}\t{p['tail']}\n")
    f.write("\nthreads anchored on a blob verse:\n")
    for t in thr: f.write(f"{t['slug']}\t{t['start']}→{t['end']}\t{t['title']}\n")
print(open(HERE/'jasher-xref-sort-plan.tsv').read())
