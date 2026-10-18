import re,json,difflib,sys
base=json.load(open('jubilees-charles-1917.json'))
B={int(c):{int(v):t for v,t in vs.items()} for c,vs in base['chapters'].items()}
PRO=base['prologue']
app=json.load(open((sys.argv[1] if len(sys.argv)>1 else "app_jubilees.json")))
A={c['number']:{v['number']:v['text'] for v in c['verses']} for c in app['books'][0]['chapters']}
MAP=[(r"\((?:god|lord|the lord|the lord god|jesus|christ|israel|judah|jews?|holy spirit|lord of hosts|most high|god almighty|almighty god|the most high|the most high god|most high god)\)",""),
     (r"\byahuah elohim\b","the lord god"),(r"\bel shaddai\b","god almighty"),(r"\bel elyon\b","most high"),
     (r"\byahuah tseva'ot\b","lord of hosts"),(r"\belohim\b","god"),(r"\byahuah\b","the lord"),(r"\byahusha\b","jesus"),(r"\bmessiah\b","christ"),
     (r"\byashar'el\b","israel"),(r"\byahudah\b","judah"),(r"\byahudim\b","jews"),(r"\byahudi\b","jew"),(r"\bsons? of adam\b","son of man"),(r"\bruach hakodesh\b","holy spirit")]
def norm(s):
    s=s.lower()
    for a,b in MAP: s=re.sub(a,b,s)
    s=re.sub(r"[⌈⌉〈〉\[\]()†‘’'“”\"\-–—.,:;!?]",' ',s)
    s=re.sub(r'\bthe lord\b','lord',s)
    return re.sub(r'\s+',' ',s).strip()
R=lambda a,b: difflib.SequenceMatcher(None,a,b,autojunk=False).ratio()
rows=[]; tot=dict(base=0,app=0,matched=0,changed=0,merged_into=0,missing=0,extra=0); detail={}
for c in range(1,51):
    bv={v:norm(t) for v,t in B[c].items()}; av={w:norm(t) for w,t in A.get(c,{}).items()}
    if c==1: bv[0]=norm(PRO)   # prologue precedes 1:1; edition may fold it into 1:1
    bkeys=sorted(bv); akeys=sorted(av)
    i=0; j=0; matched=changed=merged=missing=0; extra=[]; notes=[]
    while i<len(bkeys) and j<len(akeys):
        a=av[akeys[j]]
        # best single or concatenation of k base verses starting at i
        best=(0,1)
        for k in range(1,6):
            if i+k>len(bkeys): break
            cat=' '.join(bv[bkeys[x]] for x in range(i,i+k))
            r=R(cat,a)
            if r>best[0]: best=(r,k)
        r,k=best
        if r>=0.85:
            if k==1: matched+=1
            else: merged+=k; notes.append(f"app {c}:{akeys[j]} = base {bkeys[i]}–{bkeys[i+k-1]} ({r:.2f})")
            i+=k; j+=1
        elif r>=0.55:
            changed+=1; notes.append(f"app {c}:{akeys[j]} ~ base {bkeys[i]}{'' if k==1 else '–'+str(bkeys[i+k-1])} CHANGED ({r:.2f})"); i+=k; j+=1
        else:
            # is the base verse absent (app skips ahead) or is the app verse extra?
            r_next=max([R(bv[bkeys[x]],a) for x in range(i+1,min(i+4,len(bkeys)))] or [0])
            r_app_next=max([R(bv[bkeys[i]],av[akeys[y]]) for y in range(j+1,min(j+4,len(akeys)))] or [0])
            if r_next>=0.55 and r_next>=r_app_next:
                missing+=1; notes.append(f"base {c}:{bkeys[i]} MISSING from app"); i+=1
            elif r_app_next>=0.55:
                extra.append(akeys[j]); notes.append(f"app {c}:{akeys[j]} EXTRA (no base match) «{A[c][akeys[j]][:70]}»"); j+=1
            else:
                changed+=1; notes.append(f"app {c}:{akeys[j]} ~ base {bkeys[i]} LOW ({r:.2f})"); i+=1; j+=1
    while i<len(bkeys): missing+=1; notes.append(f"base {c}:{bkeys[i]} MISSING from app (tail)"); i+=1
    while j<len(akeys): extra.append(akeys[j]); notes.append(f"app {c}:{akeys[j]} EXTRA (tail) «{A[c][akeys[j]][:70]}»"); j+=1
    nb=len(B[c]); na=len(av)
    rows.append(f"| {c} | {nb} | {na} | {matched} | {merged} | {changed} | {missing} | {len(extra)} |")
    for k_,v_ in zip(('base','app','matched','merged_into','changed','missing','extra'),(nb,na,matched,merged,changed,missing,len(extra))): tot[k_]+=v_
    detail[c]=notes
print("| ch | 1917 vv | app vv | matched 1:1 | base vv merged | changed | missing | extra |\n|---|---|---|---|---|---|---|---|")
print('\n'.join(rows)); print(tot)
json.dump(detail,open('jub-diff-detail.json','w'),indent=1,ensure_ascii=False)
