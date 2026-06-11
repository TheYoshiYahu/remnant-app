#!/usr/bin/env python3
"""Verify each rendered cross-ref tuple's quoted note actually matches the parsed
TARGET verse text. Flags tuples whose note shares no 4-gram with the real target
verse (quoted from memory / wrong versification). Extra-canonical edition map is
the full restored library."""
import json, re, glob, os, sys

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'source-texts', 'parsed')
EDFILES = {'canon':'canon','enoch':'enoch','jubilees':'jubilees','jasher':'jasher',
 'apocrypha':'apocrypha','apocrypha-charles-vol1':'apocrypha-charles-vol1',
 'pseudepigrapha':'pseudepigrapha-charles-vol2','adam-eve-conflict':'adam-eve-conflict',
 'apocalypse-of-abraham':'apocalypse-of-abraham','ascension-isaiah':'ascension-isaiah',
 'sonnini-acts-29':'sonnini-acts-29','josephus':'josephus',
 'lightfoot-apostolic-fathers':'lightfoot-apostolic-fathers',
 'mrjames-apocryphal-nt':'mrjames-apocryphal-nt'}
VERSE = {}
for es, fn in EDFILES.items():
    p = os.path.join(BASE, fn + '.json')
    if not os.path.exists(p): continue
    d = json.load(open(p))
    for b in d['books']:
        bid = b.get('book_id') or b.get('slug')
        for c in b['chapters']:
            cn = c.get('number') or c.get('chapter_number')
            for v in c.get('verses', []):
                VERSE[(es, bid, cn, v['number'])] = v['text']

def norm(s):
    s = s.lower(); s = re.sub(r"\(([^)]*)\)", " ", s); s = re.sub(r"[^a-z0-9 ]", " ", s)
    return re.sub(r"\s+", " ", s).strip()
def shingles(s, n=4):
    t = norm(s).split()
    return set(" ".join(t[i:i+n]) for i in range(len(t)-n+1)) if len(t) >= n else {norm(s)}
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

flagged=[]; ok=0; total=0
globpat = sys.argv[1] if len(sys.argv)>1 else os.path.join(os.path.dirname(os.path.abspath(__file__)),'minion_*.sql')
for f in sorted(glob.glob(globpat)):
    sql=open(f,encoding='utf-8',errors='replace').read()
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
                        te,tb=strs[2],strs[3];note=strs[-1];tc,tv=ints[2],ints[3]
                        actual=VERSE.get((te,tb,tc,tv))
                        if actual and len(note)>30:
                            total+=1
                            if shingles(actual)&shingles(note): ok+=1
                            else: flagged.append((os.path.basename(f),te,tb,tc,tv,actual[:90],note[:90]))
                    start=None
print(f"checked {total} extras tuples | faithful {ok} | FLAGGED {len(flagged)}\n")
by_ed={}
for f,te,tb,tc,tv,act,note in flagged: by_ed[te]=by_ed.get(te,0)+1
print("flagged by edition:",by_ed,"\n")
for f,te,tb,tc,tv,act,note in flagged:
    print(f"[{f}] {te}/{tb} {tc}:{tv}")
    print(f"    ACTUAL: {act}")
    print(f"    NOTE  : {note}")
sys.exit(0)
