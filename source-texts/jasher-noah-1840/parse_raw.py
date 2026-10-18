#!/usr/bin/env python3
"""S450 — parse the Downloads jasher-raw-1840.txt (Noah 1840 via sacred-texts,
Apr 13 download) into one-verse-per-line 'c:v text' with per-chapter counts."""
import re, json, sys
from pathlib import Path
HERE=Path(__file__).parent
src=HERE/'jasher-downloads-raw-1840.txt'
ch={}; cur=None; v=None; buf=[]
def flush():
    if cur is not None and v is not None:
        ch.setdefault(cur,{})[v]=re.sub(r'\s+',' ',' '.join(buf)).strip()
for line in open(src,encoding='utf-8'):
    s=line.rstrip('\n')
    m=re.match(r'^CHAPTER (\d+)\s*$',s)
    if m: flush(); cur=int(m.group(1)); v=None; buf=[]; continue
    if cur is None: continue
    if s.startswith('=') or s.strip() in ('THE END','Sacred Texts |','Christianity','«'): 
        if s.strip()=='THE END': flush(); v=None
        continue
    m=re.match(r'^(\d{1,3}) (.*)',s)
    if m:
        flush(); v=int(m.group(1)); buf=[m.group(2)]
    elif v is not None and s.strip():
        buf.append(s.strip())
flush()
out=open(HERE/'jasher-noah-1840.txt','w',encoding='utf-8')
counts={}
for c in sorted(ch):
    vs=sorted(ch[c]); counts[c]=len(vs)
    gaps=[i for i in range(1,vs[-1]+1) if i not in ch[c]]
    if gaps or vs!=list(range(1,len(vs)+1)): print(f"ch {c}: numbering irregular, gaps={gaps} max={vs[-1]} n={len(vs)}")
    for n in vs: out.write(f"{c}:{n} {ch[c][n]}\n")
json.dump(counts,open(HERE/'jasher-noah-1840.counts.json','w'),indent=0)
print(len(ch),'chapters',sum(counts.values()),'verses')
print(' '.join(f"{c}:{n}" for c,n in counts.items()))
