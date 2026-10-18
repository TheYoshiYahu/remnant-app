#!/usr/bin/env python3
"""S450 step B — verse-by-verse CONTENT diff of the published Jasher Restored
Names Edition against the clean Noah 1840 base (jasher-noah-1840.txt).
Restored names are mapped back to the 1840 English and the edition's
modernized grammar (thou/hath/unto) is normalized on BOTH sides before
comparing, so only real text differences count.
usage: diff_edition.py [edition.txt | parsed.json] [TAG]"""
import re, difflib, json, sys
from pathlib import Path
HERE=Path(__file__).parent
ED=Path(sys.argv[1]) if len(sys.argv)>1 else HERE.parent/'existing-restored-editions'/'Jasher-Restored-Names-Edition.txt'
TAG=sys.argv[2] if len(sys.argv)>2 else ''

def load_base():
    ch={}
    for l in open(HERE/'jasher-noah-1840.txt',encoding='utf-8'):
        m=re.match(r'(\d+):(\d+) (.*)',l)
        if m: ch.setdefault(int(m.group(1)),{})[int(m.group(2))]=m.group(3)
    return ch

def load_edition_txt():
    txt=open(ED,encoding='utf-8').read()
    parts=re.split(r'(?m)^Chapter (\d+): (.*)$', txt)
    ch={}; titles={}
    for i in range(1,len(parts),3):
        n=int(parts[i]); body=parts[i+2]
        # title may wrap onto next line; verse 1 starts at first '^1.  '
        body=re.split(r'(?m)^• • •', body)[0]
        verses={}; cur=None; buf=[]
        for l in body.split('\n'):
            m=re.match(r'^(\d{1,3})\.\s+(.*)',l)
            if m:
                if cur is not None: verses[cur]=' '.join(buf)
                cur=int(m.group(1)); buf=[m.group(2)]
            elif cur is not None and l.startswith('    '):
                buf.append(l.strip())
            elif cur is not None and l.strip()=='':
                buf.append('')
            elif cur is not None:
                buf.append(l.strip())   # unindented continuation
        if cur is not None: verses[cur]=' '.join(buf)
        ch[n]={k:re.sub(r'\s+',' ',v).strip() for k,v in verses.items()}
    return ch

def load_edition_json():
    d=json.load(open(ED,encoding='utf-8'))
    ch={}
    for c in d['books'][0]['chapters']:
        ch[c['number']]={v['number']:v['text'] for v in c['verses']}
    return ch

MAP=[(r"\((?:god|lord|the lord|the lord god|jesus|christ|israel|judah|jews?|holy spirit|lord of hosts|most high|god almighty|almighty god)\)",""),
     (r"\byahuah elohim\b","the lord god"),(r"\bel shaddai\b","god almighty"),(r"\bel elyon\b","most high"),
     (r"\byahuah tseva'ot\b","lord of hosts"),
     (r"\belohim\b","god"),(r"\byahuah\b","the lord"),(r"\byahusha\b","jesus"),(r"\bmessiah\b","christ"),
     (r"\byashar'el\b","israel"),(r"\byahudah\b","judah"),(r"\byahudim\b","jews"),(r"\byahudi\b","jew"),
     (r"\bset-apart\b","holy"),(r"\bsons? of adam\b","son of man"),(r"\bchildren of adam\b","children of men"),
     (r"\bruach hakodesh\b","holy spirit"),(r"\bthe the\b","the")]
ARCH=[(r"\bthou\b","you"),(r"\bthee\b","you"),(r"\bthy\b","your"),(r"\bthine\b","your"),(r"\bye\b","you"),
      (r"\bhath\b","has"),(r"\bhast\b","have"),(r"\bart\b","are"),(r"\bwast\b","were"),(r"\bwert\b","were"),
      (r"\bshalt\b","shall"),(r"\bwilt\b","will"),(r"\bdost\b","do"),(r"\bdoth\b","does"),(r"\bdidst\b","did"),
      (r"\bcanst\b","can"),(r"\bwouldst\b","would"),(r"\bcouldst\b","could"),(r"\bshouldst\b","should"),
      (r"\bmayest\b","may"),(r"\bmightest\b","might"),(r"\bknowest\b","know"),(r"\bsaith\b","says"),
      (r"\bunto\b","to"),(r"\bbare\b","bore"),(r"\bbegat\b","fathered"),(r"\bspake\b","spoke"),
      (r"\bwhilst\b","while"),(r"\bamongst\b","among"),(r"\bthereof\b","of it"),(r"\bthereto\b","to it"),
      (r"\btherein\b","in it"),(r"\bwherefore\b","therefore"),(r"\byea\b","yes"),(r"\bnay\b","no"),
      (r"\b(\w{3,})est\b",r"\1"),(r"\b(\w{3,})eth\b",r"\1s"),(r"\b(\w{3,})edst\b",r"\1ed")]
def norm(s):
    s=s.lower()
    for a,b in MAP: s=re.sub(a,b,s)
    s=re.sub(r"[⌈⌉〈〉\[\]()†‘’'“”\"\-–—.,:;!?]",' ',s)
    for a,b in ARCH: s=re.sub(a,b,s)
    s=re.sub(r'\bthe lord\b','lord',s)
    return re.sub(r'\s+',' ',s).strip()

base=load_base()
ed = load_edition_json() if ED.suffix=='.json' else load_edition_txt()
assert len(base)==91, len(base)
rows=[]; summary={}
allbase=[(c,v,set(norm(t).split())) for c in base for v,t in base[c].items()]
def best_in_base(ntext):
    s=set(ntext.split()); best=(0,None,None)
    if not s: return best
    for c,v,bs in allbase:
        j=len(s&bs)/len(s|bs)
        if j>best[0]: best=(j,c,v)
    return best
for c in range(1,92):
    bv={v:norm(t) for v,t in base[c].items()}
    ev={v:norm(t) for v,t in ed.get(c,{}).items()}
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
    summary[c]=dict(base=len(bv),edition=len(ev),matched=matched,changed=changed,missing=missing,extra=len(extra),extra_from=srcs,detail=detail)
    rows.append(f"| {c} | {len(bv)} | {len(ev)} | {matched} | {changed} | {missing} | {len(extra)} | {' '.join(srcs)[:90]} |")
tot=lambda k: sum(s[k] for s in summary.values())
with open(HERE/f'jasher-damage-table{TAG}.md','w',encoding='utf-8') as f:
    f.write(f"# Jasher — {ED.name} vs Noah 1840 (sacred-texts), verse-by-verse by content (S450)\n\n")
    f.write("matched = ≥85% same words after restored names are mapped back and archaic grammar normalized on both sides; changed = 55–85%; missing = 1840 verse with no counterpart in the chapter; extra = edition verse with no 1840 counterpart in the chapter (and where its text actually comes from).\n\n")
    f.write("| ch | 1840 vv | edition vv | matched | changed | missing | extra | extra text comes from |\n|---|---|---|---|---|---|---|---|\n")
    f.write('\n'.join(rows)+'\n')
    f.write(f"\n**Totals:** 1840 {tot('base')} verses; edition {tot('edition')}; matched {tot('matched')}; changed {tot('changed')}; missing {tot('missing')}; extra {tot('extra')}.\n")
json.dump(summary,open(HERE/f'jasher-damage-summary{TAG}.json','w'),indent=1)
print('\n'.join(rows)); print("TOTALS", {k:tot(k) for k in ('base','edition','matched','changed','missing','extra')})
