#!/usr/bin/env python3
"""S449 step B — verse-by-verse CONTENT diff of the published
Enoch-Restored-Names-Edition.txt against the clean Charles 1917 base.
Restored names are mapped back to Charles's English before comparing so only
real text differences count.  Writes enoch-damage-table.md."""
import re, difflib, json
from pathlib import Path
HERE=Path(__file__).parent
import sys
ED=Path(sys.argv[1]) if len(sys.argv)>1 else HERE.parent/'existing-restored-editions'/'Enoch-Restored-Names-Edition.txt'
TAG=sys.argv[2] if len(sys.argv)>2 else ''

def load_base():
    ch={}
    for l in open(HERE/'enoch-charles-1917.txt',encoding='utf-8'):
        m=re.match(r'(\d+):(\d+) (.*)',l)
        if m: ch.setdefault(int(m.group(1)),{})[int(m.group(2))]=m.group(3)
    return ch

def load_edition():
    txt=open(ED,encoding='utf-8').read()
    parts=re.split(r'(?m)^Chapter (\d+): (.*)$(?=\n\n1 )', txt)
    ch={}; titles={}
    for i in range(1,len(parts),3):
        n=int(parts[i]); titles[n]=parts[i+1].strip(); body=parts[i+2]
        body=re.split(r'(?m)^Commentary on Chapter \d+', body)[0]
        verses={}; cur=None; buf=[]
        for l in body.split('\n'):
            m=re.match(r'^(\d{1,3}) (.*)',l)
            if m:
                if cur is not None: verses[cur]=' '.join(buf)
                cur=int(m.group(1)); buf=[m.group(2)]
            elif cur is not None:
                if l.strip()=='' : buf.append('')
                else: buf.append(l.strip())
        if cur is not None: verses[cur]=' '.join(buf)
        ch[n]={k:re.sub(r'\s+',' ',v).strip() for k,v in verses.items()}
    return ch, titles

MAP=[(r"\((?:god|lord|jesus|christ|israel|judah|jews?|holy spirit)\)",""),
     (r"\belohim\b","god"),(r"\byahuah\b","lord"),(r"\byahusha\b","jesus"),(r"\bmessiah\b","christ"),
     (r"\byashar'el\b","israel"),(r"\byahudah\b","judah"),(r"\byahudim\b","jews"),
     (r"\bset-apart\b","holy"),(r"\bsons? of adam\b","son of man"),(r"\bchildren of adam\b","children of men"),
     (r"\bruach hakodesh\b","holy spirit")]
def norm(s):
    s=s.lower()
    for a,b in MAP: s=re.sub(a,b,s)
    s=re.sub(r'[⌈⌉〈〉\[\]()†‘’\'“”"\-–—.,:;!?]',' ',s)
    return re.sub(r'\s+',' ',s).strip()

base=load_base(); ed,titles=load_edition()
assert len(base)==108
rows=[]; provenance={}
# index of all base verses for provenance search
allbase=[(c,v,set(norm(t).split())) for c in base for v,t in base[c].items()]
def best_in_base(ntext):
    s=set(ntext.split()); best=(0,None,None)
    if not s: return best
    for c,v,bs in allbase:
        j=len(s&bs)/len(s|bs)
        if j>best[0]: best=(j,c,v)
    return best
summary={}
for c in range(1,109):
    bv={v:norm(t) for v,t in base[c].items()}
    ev={v:norm(t) for v,t in ed.get(c,{}).items()}
    # align each base verse to best edition verse in same chapter
    used=set(); matched=changed=missing=0; detail=[]
    for v in sorted(bv):
        best=(0,None)
        for w,et in ev.items():
            if w in used: continue
            r=difflib.SequenceMatcher(None,bv[v],et,autojunk=False).ratio()
            if r>best[0]: best=(r,w)
        r,w=best
        if r>=0.85: matched+=1; used.add(w)
        elif r>=0.55: changed+=1; used.add(w); detail.append(f"{c}:{v}~ed{w} ({r:.2f})")
        else: missing+=1; detail.append(f"{c}:{v} MISSING")
    extra=[w for w in ev if w not in used]
    srcs=[]
    for w in extra:
        r,sc,sv=best_in_base(ev[w])
        srcs.append(f"ed{w}<-{sc}:{sv}" if r>=0.45 else f"ed{w}<-?")
    summary[c]=dict(charles=len(bv),edition=len(ev),matched=matched,changed=changed,missing=missing,extra=len(extra),extra_from=srcs,detail=detail)
    rows.append(f"| {c} | {len(bv)} | {len(ev)} | {matched} | {changed} | {missing} | {len(extra)} | {' '.join(srcs)[:90]} |")
tot=lambda k: sum(s[k] for s in summary.values())
with open(HERE/f'enoch-damage-table{TAG}.md','w',encoding='utf-8') as f:
    f.write("# 1 Enoch — published edition vs Charles 1917, verse-by-verse by content (S449)\n\n")
    f.write("matched = ≥85% same words after restored names are mapped back; changed = 55–85%; missing = Charles verse with no counterpart in the chapter; extra = edition verse with no Charles counterpart in the chapter (and where its text actually comes from).\n\n")
    f.write("| ch | Charles vv | edition vv | matched | changed | missing | extra | extra text comes from |\n|---|---|---|---|---|---|---|---|\n")
    f.write('\n'.join(rows)+'\n')
    f.write(f"\n**Totals:** Charles {tot('charles')} verses; edition {tot('edition')}; matched {tot('matched')}; changed {tot('changed')}; missing {tot('missing')}; extra {tot('extra')}.\n")
json.dump(summary,open(HERE/f'enoch-damage-summary{TAG}.json','w'),indent=1)
print('\n'.join(rows)); print("TOTALS", {k:tot(k) for k in ('charles','edition','matched','changed','missing','extra')})
