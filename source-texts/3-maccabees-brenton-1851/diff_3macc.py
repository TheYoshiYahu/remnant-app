"""S455 — 3 Maccabees: Brenton 1851 (eBible eng-Brenton VPL, public domain) vs the app's apocrypha-charles-vol1 3-maccabees rows.
Verse-by-verse by CONTENT (restored names mapped back). Writes 3macc-damage-table.md + 3macc-worddiff.log."""
import re,json,difflib,sys
base={}
for line in open('../compare-versions/raw/Brenton_vpl.txt',encoding='utf-8'):
    if not line.startswith('3MA '): continue
    _,ref,text=line.rstrip('\n').split(' ',2); c,v=map(int,ref.split(':'))
    base.setdefault(c,{})[v]=text
app=json.load(open(sys.argv[1] if len(sys.argv)>1 else '../parsed/apocrypha-charles-vol1.json'))
bk=[b for b in app['books'] if b['book_id']=='3-maccabees'][0]
A={c['number']:{v['number']:v['text'] for v in c['verses']} for c in bk['chapters']}
MAP=[(r"\((?:god|lord|the lord|the lord god|israel|judah|jews?|jewish|most high|god almighty|almighty god|the most high|lord of hosts)\)",""),
     (r"\byahuah elohim\b","the lord god"),(r"\bel shaddai\b","god almighty"),(r"\bel elyon\b","most high"),(r"\byahuah tseva'ot\b","lord of hosts"),
     (r"\belohim\b","god"),(r"\byahuah\b","lord"),(r"\byashar'el\b","israel"),(r"\byahudah\b","judah"),(r"\byahudim\b","jews"),(r"\byahudi\b","jew")]
def norm(s):
    s=s.lower()
    for a,b in MAP: s=re.sub(a,b,s)
    s=re.sub(r"[⌈⌉〈〉\[\]()†‘’'“”\"\-–—.,:;!?]",' ',s)
    return re.sub(r'\s+',' ',s).strip()
R=lambda a,b: difflib.SequenceMatcher(None,a,b,autojunk=False).ratio()
rows=["| ch | Brenton vv | app vv | identical | ≥0.95 | 0.85–0.95 | <0.85 | missing | extra |","|---|---|---|---|---|---|---|---|---|"]
log=[]; tot=dict(base=0,app=0,ident=0,hi=0,mid=0,low=0,missing=0,extra=0)
for c in sorted(set(base)|set(A)):
    bv=base.get(c,{}); av=A.get(c,{})
    ident=hi=mid=low=0; miss=[v for v in bv if v not in av]; extra=[v for v in av if v not in bv]
    for v in sorted(set(bv)&set(av)):
        b=norm(bv[v]); a=norm(av[v]); r=R(b,a)
        if a==b: ident+=1; continue
        if r>=0.95: hi+=1
        elif r>=0.85: mid+=1
        else: low+=1
        # word-level diff
        d=[t for t in difflib.ndiff(b.split(),a.split()) if t[0] in '+-']
        # also check neighbour alignment
        nb=max([(R(norm(bv[x]),a),x) for x in bv if x!=v and abs(x-v)<=3] or [(0,0)])
        log.append(f"3 Macc {c}:{v}  ratio={r:.3f}  best-other-base={nb[1]}({nb[0]:.2f})\n  BRENTON: {bv[v]}\n  APP    : {av[v]}\n  DIFF   : {' '.join(d)}\n")
    rows.append(f"| {c} | {len(bv)} | {len(av)} | {ident} | {hi} | {mid} | {low} | {len(miss)} {miss if miss else ''} | {len(extra)} {extra if extra else ''} |")
    for k,x in zip(tot,(len(bv),len(av),ident,hi,mid,low,len(miss),len(extra))): tot[k]+=x
md="# 3 Maccabees damage table — S455\n\nBase: Brenton 1851 (eBible eng-Brenton, public domain). App: apocrypha-charles-vol1 / 3-maccabees (= live DB).\n\n"+'\n'.join(rows)+f"\n\n**Totals:** {tot}\n\nEvery non-identical verse is read at word level in 3macc-worddiff.log.\n"
open('3macc-damage-table.md','w').write(md); open('3macc-worddiff.log','w').write('\n'.join(log)); print(md); print(f"{len(log)} non-identical verses logged")
