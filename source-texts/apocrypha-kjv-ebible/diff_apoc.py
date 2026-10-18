"""S454 — content diff: KJV 1611 Apocrypha (eBible) modernized with Yoshi's own modernize rules, vs the app's parsed/apocrypha.json.
Same engine as jubilees-charles-1917/diff_jub.py, run per book. Writes apocrypha-damage-table.md + apoc-diff-detail.json."""
import re,json,difflib,sys,importlib.util,os
spec=importlib.util.spec_from_file_location('mod','../../restoration-pipeline/_reference_modernize_from_apocrypha.py')
src=open(spec.origin).read().replace('os.makedirs(OUT, exist_ok=True)','')
mod=type(sys)('mod'); exec(compile(src,spec.origin,'exec'),mod.__dict__)
base=json.load(open('apocrypha-kjv-ebible.json'))
app=json.load(open(sys.argv[1] if len(sys.argv)>1 else '../parsed/apocrypha.json'))
A={b['book_id']:{c['number']:{v['number']:v['text'] for v in c['verses']} for c in b['chapters'] if c['number']>0} for b in app['books']}
MAP=[(r"\((?:god|lord|the lord|the lord god|jesus|christ|israel|judah|jews?|jewish|holy spirit|lord of hosts|most high|god almighty|almighty god|the most high|the most high god|most high god|melchizedek)\)",""),
     (r"\byahuah elohim\b","the lord god"),(r"\bel shaddai\b","god almighty"),(r"\bel elyon\b","most high"),
     (r"\byahuah tseva'ot\b","lord of hosts"),(r"\belohim\b","god"),(r"\byahuah\b","lord"),(r"\bmessiah\b","christ"),
     (r"\byashar'el\b","israel"),(r"\byahudah\b","judah"),(r"\byahudim\b","jews"),(r"\byahudi\b","jew"),(r"\bsons? of adam\b","son of man"),(r"\bruach hakodesh\b","holy spirit")]
def norm(s):
    s=s.lower()
    for a,b in MAP: s=re.sub(a,b,s)
    s=re.sub(r"[⌈⌉〈〉\[\]()†‘’'“”\"\-–—.,:;!?]",' ',s)
    s=re.sub(r'\b(the|unto|to)\b',' ',s)
    return re.sub(r'\s+',' ',s).strip()
R=lambda a,b: difflib.SequenceMatcher(None,a,b,autojunk=False).ratio()
rows=[]; tot=dict(base=0,app=0,matched=0,merged_into=0,changed=0,missing=0,extra=0); detail={}; scores=[]
for bk in base['books']:
    bid=bk['app_book_id']; rows.append(f"| **{bid}** | | | | | | | |")
    for c,bvs in bk['chapters'].items():
        c=int(c); bv={int(v):norm(mod.modernize_text(t)) for v,t in bvs.items()}; av={w:norm(t) for w,t in A[bid].get(c,{}).items()}
        bkeys=sorted(bv); akeys=sorted(av); notes=[]
        i=j=0; matched=changed=merged=missing=0; extra=[]
        while i<len(bkeys) and j<len(akeys):
            a=av[akeys[j]]; best=(0,1)
            for k in range(1,12):
                if i+k>len(bkeys): break
                r=R(' '.join(bv[bkeys[x]] for x in range(i,i+k)),a)
                if r>best[0]: best=(r,k)
            r,k=best
            if r>=0.85:
                if k==1: matched+=1; scores.append(r)
                else: merged+=k; notes.append(f"app {c}:{akeys[j]} = base {bkeys[i]}–{bkeys[i+k-1]} ({r:.2f})")
                if k==1 and r<0.95: notes.append(f"app {c}:{akeys[j]} ≈ base {bkeys[i]} ({r:.2f})")
                i+=k; j+=1
            elif r>=0.55:
                changed+=1; notes.append(f"app {c}:{akeys[j]} ~ base {bkeys[i]}{'' if k==1 else '–'+str(bkeys[i+k-1])} CHANGED ({r:.2f})"); i+=k; j+=1
            else:
                r_next=max([R(bv[bkeys[x]],a) for x in range(i+1,min(i+4,len(bkeys)))] or [0])
                r_app_next=max([R(bv[bkeys[i]],av[akeys[y]]) for y in range(j+1,min(j+4,len(akeys)))] or [0])
                if r_next>=0.55 and r_next>=r_app_next: missing+=1; notes.append(f"base {c}:{bkeys[i]} MISSING from app"); i+=1
                elif r_app_next>=0.55: extra.append(akeys[j]); notes.append(f"app {c}:{akeys[j]} EXTRA «{A[bid][c][akeys[j]][:70]}»"); j+=1
                else: changed+=1; notes.append(f"app {c}:{akeys[j]} ~ base {bkeys[i]} LOW ({r:.2f})"); i+=1; j+=1
        while i<len(bkeys): missing+=1; notes.append(f"base {c}:{bkeys[i]} MISSING (tail)"); i+=1
        while j<len(akeys): extra.append(akeys[j]); notes.append(f"app {c}:{akeys[j]} EXTRA (tail) «{A[bid][c][akeys[j]][:70]}»"); j+=1
        nb=len(bv); na=len(av)
        if not (merged==changed==missing==len(extra)==0): rows.append(f"| {c} | {nb} | {na} | {matched} | {merged} | {changed} | {missing} | {len(extra)} |")
        for k_,v_ in zip(('base','app','matched','merged_into','changed','missing','extra'),(nb,na,matched,merged,changed,missing,len(extra))): tot[k_]+=v_
        if notes: detail[f"{bid} {c}"]=notes
hdr="| ch | KJV vv | app vv | matched 1:1 | base vv merged | changed | missing | extra |\n|---|---|---|---|---|---|---|---|"
md="# Apocrypha (KJV edition) damage table — S454\n\nOnly chapters with a non-clean row are listed; every other chapter matched 1:1.\n\n"+hdr+"\n"+'\n'.join(rows)+f"\n\n**Totals:** {tot}\n"
import statistics; b=[sum(1 for s in scores if lo<=s<hi) for lo,hi in [(0.85,0.9),(0.9,0.95),(0.95,0.99),(0.99,1.01)]]
md+=f"\nmatched-score buckets (0.85–0.90 / 0.90–0.95 / 0.95–0.99 / ≥0.99): {b}\n"
open('apocrypha-damage-table.md','w').write(md); json.dump(detail,open('apoc-diff-detail.json','w'),indent=1,ensure_ascii=False)
print(md)
