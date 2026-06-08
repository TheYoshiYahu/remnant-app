#!/usr/bin/env python3
"""For each extras cross-ref row targeting a risk edition (enoch, pseudepigrapha,
apocrypha-charles-vol1, jubilees, jasher), extract the note's leading italic
quote and find which verse in the target chapter best matches it. Report when the
best-match verse != the targeted verse (a versification offset / wrong target)."""
import json, re, glob, os
BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'source-texts', 'parsed')
EDFILES = {'canon':'canon','enoch':'enoch','jubilees':'jubilees','jasher':'jasher',
 'apocrypha':'apocrypha','apocrypha-charles-vol1':'apocrypha-charles-vol1',
 'pseudepigrapha':'pseudepigrapha-charles-vol2','adam-eve-conflict':'adam-eve-conflict',
 'apocalypse-of-abraham':'apocalypse-of-abraham','ascension-isaiah':'ascension-isaiah',
 'sonnini-acts-29':'sonnini-acts-29'}
RISK = {'enoch','pseudepigrapha','apocrypha-charles-vol1','jubilees','jasher',
        'adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29'}
CH = {}  # (ed,book,ch) -> {v:text}
for es, fn in EDFILES.items():
    d = json.load(open(os.path.join(BASE, fn + '.json')))
    for b in d['books']:
        bid = b.get('book_id') or b.get('slug')
        for c in b['chapters']:
            cn = c.get('number') or c.get('chapter_number')
            CH.setdefault((es,bid,cn), {})
            for v in c.get('verses', []):
                CH[(es,bid,cn)][v['number']] = v['text']
def norm(s):
    s=s.lower(); s=re.sub(r"\(([^)]*)\)"," ",s); s=re.sub(r"[^a-z0-9 ]"," ",s)
    return re.sub(r"\s+"," ",s).strip()
def toks(s,n=4):
    t=norm(s).split(); return set(" ".join(t[i:i+n]) for i in range(len(t)-n+1)) if len(t)>=n else {norm(s)}
def tokenize(block):
    out=[]; i=0; n=len(block)
    while i<n:
        c=block[i]
        if c=="'":
            i+=1; buf=[]
            while i<n:
                if block[i]=="'":
                    if i+1<n and block[i+1]=="'": buf.append("'"); i+=2; continue
                    i+=1; break
                buf.append(block[i]); i+=1
            out.append(('s',''.join(buf)))
        elif c.isdigit():
            j=i
            while j<n and block[j].isdigit(): j+=1
            out.append(('i',int(block[i:j]))); i=j
        else: i+=1
    return out
issues=[]; checked=0
for f in sorted(glob.glob(os.path.join(os.path.dirname(os.path.abspath(__file__)),'minion_*.sql'))):
    sql=open(f,encoding='utf-8',errors='replace').read()
    for hm in re.finditer(r"WITH\s+input\([^)]*\)\s+AS\s*\(VALUES(.*?)\)\s*INSERT", sql, re.DOTALL|re.IGNORECASE):
        region=hm.group(1); depth=0; start=None
        for idx,ch in enumerate(region):
            if ch=='(' and depth==0: depth=1; start=idx+1
            elif ch=='(': depth+=1
            elif ch==')':
                depth-=1
                if depth==0 and start is not None:
                    tup=region[start:idx]; tk=tokenize(tup)
                    strs=[v for k,v in tk if k=='s']; ints=[v for k,v in tk if k=='i']
                    if len(strs)>=5 and len(ints)>=4:
                        ted,tb=strs[2],strs[3]; tch,tv=ints[2],ints[3]; note=strs[-1]
                        if ted in RISK:
                            checked+=1
                            # leading italic quote
                            m=re.search(r"\*([^*]{15,})\*", note)
                            quote=m.group(1) if m else note
                            verses=CH.get((ted,tb,tch),{})
                            if not verses: continue
                            qsh=toks(quote)
                            best=None;bestscore=0
                            for vn,vt in verses.items():
                                sc=len(qsh & toks(vt))
                                if sc>bestscore: bestscore=sc; best=vn
                            tgtscore=len(qsh & toks(verses.get(tv,"")))
                            if best is not None and best!=tv and bestscore>=tgtscore+1:
                                issues.append((os.path.basename(f),ted,tb,tch,tv,best,tgtscore,bestscore,quote[:70]))
print(f"checked {checked} risk-edition rows | OFFSET/MISMATCH {len(issues)}\n")
for f,ted,tb,tch,tv,best,ts,bs,q in issues:
    print(f"[{f}] {ted}/{tb} {tch}: targets v{tv} (score {ts}) but best match = v{best} (score {bs})")
    print(f"    quote: {q}")
