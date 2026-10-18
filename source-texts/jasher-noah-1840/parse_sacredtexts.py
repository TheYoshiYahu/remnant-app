#!/usr/bin/env python3
"""S450 — parse jasher-sacredtexts-1887.json (91 chapter pages pulled through the
browser pane, div.contents children as 'TAG\\ttext') into c:v lines; then compare
witness-to-witness against jasher-noah-1840.txt (the Apr-13 Downloads file)."""
import re, json, difflib
from pathlib import Path
HERE=Path(__file__).parent
raw=json.load(open(HERE/'jasher-sacredtexts-1887.json',encoding='utf-8'))
ch={}; odd=[]
for c,items in raw.items():
    c=int(c)
    for it in items:
        tag,_,txt=it.partition('\t')
        m=re.match(r'^(\d{1,3}) (.*)',txt)
        if tag=='P' and m: ch.setdefault(c,{})[int(m.group(1))]=m.group(2).strip()
        elif tag=='H1' and txt.startswith('Book of Jasher'): pass
        else: odd.append((c,tag,txt[:80]))
with open(HERE/'jasher-sacredtexts-1887.txt','w',encoding='utf-8') as f:
    for c in sorted(ch):
        for v in sorted(ch[c]): f.write(f"{c}:{v} {ch[c][v]}\n")
print('odd items:',len(odd)); [print(' ',o) for o in odd[:30]]
counts={c:len(ch[c]) for c in sorted(ch)}
print(len(ch),'chapters',sum(counts.values()),'verses')
# witness-to-witness
A={}
for l in open(HERE/'jasher-noah-1840.txt',encoding='utf-8'):
    m=re.match(r'(\d+):(\d+) (.*)',l); A.setdefault(int(m.group(1)),{})[int(m.group(2))]=m.group(3)
def norm(s): return re.sub(r'\s+',' ',re.sub(r'[^a-z0-9 ]',' ',s.lower())).strip()
diffs=[]
for c in range(1,92):
    for v in sorted(set(A.get(c,{}))|set(ch.get(c,{}))):
        a=A.get(c,{}).get(v); b=ch.get(c,{}).get(v)
        if a is None or b is None: diffs.append((c,v,'ONLY-'+('B' if a is None else 'A'),(a or b)[:70])); continue
        if norm(a)!=norm(b):
            r=difflib.SequenceMatcher(None,norm(a),norm(b),autojunk=False).ratio()
            diffs.append((c,v,f'{r:.2f}',a[:60]+' || '+b[:60]))
print('witness diffs:',len(diffs))
for d in diffs[:60]: print(' ',d)
json.dump(counts,open(HERE/'jasher-sacredtexts-1887.counts.json','w'),indent=0)
