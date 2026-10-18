"""S453 — split the 244 merged Jubilees verses at the Charles 1917 boundaries.
Output: jubilees.fixed.json (same shape as parsed/jubilees.json), remap.json
(old c:v -> new c:v range), split-report.md (every split verified by content)."""
import re,json,difflib
base=json.load(open('jubilees-charles-1917.json'))
B={int(c):{int(v):t for v,t in vs.items()} for c,vs in base['chapters'].items()}
PRO=base['prologue']
app=json.load(open('app_jubilees.json'))
chs=app['books'][0]['chapters']
detail=json.load(open('jub-diff-detail.json'))
TOK=[(r"^yahuah$","lord"),(r"^elohim$","god"),(r"^yahusha$","jesus"),(r"^messiah$","christ"),(r"^yashar[’']el$","israel"),(r"^yahudah$","judah"),(r"^yahudim$","jews"),(r"^yahudi$","jew"),(r"^el$","god"),(r"^shaddai$","almighty"),(r"^elyon$","high"),(r"^tseva[’']ot$","hosts"),(r"^adonai$","lord"),(r"^ruach$","holy"),(r"^hakodesh$","spirit")]
ARCH=[(r"^thou$","you"),(r"^thee$","you"),(r"^thy$","your"),(r"^thine$","your"),(r"^ye$","you"),(r"^hath$","has"),(r"^hast$","have"),(r"^art$","are"),(r"^wast$","were"),(r"^shalt$","shall"),(r"^wilt$","will"),(r"^doth$","does"),(r"^dost$","do"),(r"^didst$","did"),(r"^unto$","to"),(r"^spake$","spoke"),(r"^bare$","bore"),(r"^saith$","says"),(r"^(\w{3,})est$",r"\1"),(r"^(\w{3,})eth$",r"\1s"),(r"^(\w{3,})edst$",r"\1ed"),(r"^(\w{3,})st$",r"\1")]
def ntok(w):
    w=w.lower()
    for a,b in TOK: w=re.sub(a,b,w)
    for a,b in ARCH: w=re.sub(a,b,w)
    return w
def tokens(s):
    """[(norm, start, end)] for words outside parentheses; 'the' dropped (restoration adds/removes it)."""
    out=[]; depth=0
    for m in re.finditer(r'\(|\)|[A-Za-z’\']+',s):
        t=m.group(0)
        if t=='(': depth+=1; continue
        if t==')': depth=max(0,depth-1); continue
        if depth: continue
        n=ntok(t.replace('’',"'"))
        if n in ('the','a','an'): continue
        out.append((n,m.start(),m.end()))
    return out
def bwords(s): return [t[0] for t in tokens(s)]
R=lambda a,b: difflib.SequenceMatcher(None,a,b,autojunk=False).ratio()
merges=[]   # (ch, app_v, [base vs])
for c in detail:
    for n in detail[c]:
        m=re.match(r'app (\d+):(\d+) = base (\d+)–(\d+)',n)
        if m: merges.append((int(m[1]),int(m[2]),list(range(int(m[3]),int(m[4])+1))))
M={(c,v):bs for c,v,bs in merges}
report=[]; low=[]
newchs=[]; remap={}
for ch in chs:
    c=ch['number']; newv=[]; nxt=1
    for v in ch['verses']:
        ov=v['number']
        if (c,ov) not in M:
            newv.append(dict(v,number=nxt)); remap[f'{c}:{ov}']=[nxt]; nxt+=1; continue
        bs=M[(c,ov)]; txt=v['text']
        at=tokens(txt); aw=[t[0] for t in at]
        parts=[]; cum=0; bw_all=[]
        for b in bs:
            if b==0: continue          # the prologue rides inside 1:1 (group 0–1)
            w=bwords(PRO+' '+B[c][b]) if (c==1 and b==1 and 0 in bs) else bwords(B[c][b])
            bw_all.append((b,w))
        # if prologue in group, treat group as [1,...] with 1 incl prologue
        bs2=[b for b,_ in bw_all]
        flat=[w for _,ws in bw_all for w in ws]
        bounds=[]; k=0
        for b,ws in bw_all[:-1]:
            k+=len(ws); bounds.append(k)
        sm=difflib.SequenceMatcher(None,flat,aw,autojunk=False)
        blocks=[bl for bl in sm.get_matching_blocks() if bl.size>0]
        cuts=[]
        for bnd in bounds:
            pos=None
            for bl in blocks:
                if bl.a<=bnd<bl.a+bl.size: pos=bl.b+(bnd-bl.a); break
            if pos is None:
                after=[bl for bl in blocks if bl.a>=bnd]
                pos=after[0].b if after else None
            if pos is None or pos>=len(at): low.append(f'{c}:{ov} boundary not found'); pos=len(at)-1
            cuts.append(at[pos][1])
        # cut at the start of that word; move cut back over an opening quote
        pieces=[]; prev=0
        for cpos in cuts+[len(txt)]:
            seg=txt[prev:cpos]
            pieces.append(seg); prev=cpos
        pieces=[p.strip() for p in pieces]
        # a cut that split off a leading quote mark: move it to the next piece
        fixed=[]
        for i,p in enumerate(pieces):
            if i>0 and fixed[-1].endswith(('“','‘')):
                q=fixed[-1][-1]; fixed[-1]=fixed[-1][:-1].rstrip(); p=q+p
            elif i>0 and fixed[-1].endswith('"') and B[c][bs2[i]].lstrip().startswith(('"','“')):
                q=fixed[-1][-1]; fixed[-1]=fixed[-1][:-1].rstrip(); p=q+p   # Charles opens the next verse with a quote
            fixed.append(p)
        pieces=fixed
        for b,p in zip(bs2,pieces):
            ref=(PRO+' '+B[c][b]) if (c==1 and b==1 and 0 in bs) else B[c][b]
            r=R(' '.join(bwords(ref)),' '.join(bwords(p)))
            report.append((c,ov,b,nxt,round(r,3),p[:70]))
            if r<0.85: low.append(f'{c}:{ov}->{c}:{nxt} (base {b}) ratio {r:.2f} | {p[:80]}')
            newv.append(dict(v,number=nxt,text=p)); nxt+=1
        remap[f'{c}:{ov}']=list(range(nxt-len(pieces),nxt))
    newchs.append(dict(ch,verses=newv))
    assert nxt-1==len(B[c]), (c,nxt-1,len(B[c]))
out=dict(app); out['books']=[dict(app['books'][0],chapters=newchs)]
json.dump(out,open('jubilees.fixed.json','w'),ensure_ascii=False,indent=2)
json.dump(remap,open('jubilees-remap.json','w'),indent=0)
tot=sum(len(c['verses']) for c in newchs)
with open('split-report.md','w') as f:
    f.write(f"# Jubilees split report (S453) — {len(merges)} merged app verses split into {sum(len(b) for _,_,b in merges)} verses; result {tot} verses\n\n")
    f.write("| ch | old app v | base v | new v | match | new text (start) |\n|---|---|---|---|---|---|\n")
    for c,ov,b,nv,r,p in report: f.write(f"| {c} | {ov} | {b} | {nv} | {r} | {p} |\n")
print('total verses',tot,'pieces',len(report),'low (<0.85):',len(low))
for l in low: print(' ',l)
