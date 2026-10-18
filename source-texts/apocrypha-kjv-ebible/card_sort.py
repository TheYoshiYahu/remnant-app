"""S454 — by reading: which KJV verse (10:4–13) does each card on Rest of Esther 10:1 describe?
Evidence = the note's own 'The Rest of Esther 10:N' citation(s). Output: apoc-card-moves.json + apoc-card-sort-report.md"""
import re,json
sql=open('../../data-schema/migrations/session253_rest_of_esther_extracanon_cross_references.sql',encoding='utf-8').read()
cards=re.findall(r"\('apocrypha', 'the-rest-of-esther', 10, 1, '(\w+)', '([\w-]+)', (\d+), (\d+), '\w+', E'((?:[^']|'')*)'\)",sql)
assert len(cards)==12, len(cards)
thr={}
for m in re.finditer(r"-- thread: (rest-of-esther-10-[\w-]+)\n((?:  \('apocrypha'.*\n)+)",sql):
    thr[m.group(1)]=len(re.findall(r"^  \('apocrypha'",m.group(2),flags=re.M))
moves=[]; rep=["# Rest of Esther 10 — card sort by reading (S454)","","| card (target) | cites | → verse |","|---|---|---|"]
for te,tb,tc,tv,note in cards:
    cites=sorted({int(x) for x in re.findall(r"The Rest of Esther 10:(\d+)",note)})
    assert cites, note[:80]
    dest=cites[0]   # the first verse the note names is the verse it is written on
    moves.append(dict(te=te,tb=tb,tc=int(tc),tv=int(tv),new_v=dest,cites=cites,how=f"note cites The Rest of Esther 10:{','.join(map(str,cites))}"))
    rep.append(f"| {tb} {tc}:{tv} | 10:{', 10:'.join(map(str,cites))} | 10:{dest} |")
# thread anchors: by order in the SQL, 3 cards per thread
slugs=list(thr); anchors={}; i=0
for s in slugs:
    n=thr[s]; vs=[m['new_v'] for m in moves[i:i+n]]; i+=n; anchors[s]=(min(vs),max(vs))
rep+=["","| thread | members → | anchor start–end |","|---|---|---|"]+[f"| {s} | {[m['new_v'] for m in moves[sum(thr[x] for x in slugs[:k]):sum(thr[x] for x in slugs[:k+1])]]} | 10:{a}–10:{b} |" for k,(s,(a,b)) in enumerate(anchors.items())]
json.dump(dict(moves=moves,anchors=anchors),open('apoc-card-moves.json','w'),indent=1)
open('apoc-card-sort-report.md','w').write('\n'.join(rep)+'\n'); print('\n'.join(rep))
