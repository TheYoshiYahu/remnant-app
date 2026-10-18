"""S453 — decide, by reading, which Charles verse each Jubilees cross-reference card belongs to.
Evidence per card: the italic quotation in the note (*…*) and any 'Jubilees c:v' citation.
Output: jub-card-moves.json + jub-card-sort-report.md"""
import json,re,difflib,collections
cards=json.load(open('jub_cards_local.json'))
fixed=json.load(open('jubilees.fixed.json'))['books'][0]['chapters']
NEW={c['number']:{v['number']:v['text'] for v in c['verses']} for c in fixed}
remap=json.load(open('jubilees-remap.json'))      # 'c:old' -> [new...]
R=lambda a,b: difflib.SequenceMatcher(None,a,b,autojunk=False).ratio()
def norm(s): return re.sub(r'\s+',' ',re.sub(r"[^a-z0-9 ]",' ',re.sub(r'\([^)]*\)','',s.lower()))).strip()
# dedupe on the card key
seen={}; 
for r in cards:
    k=(r['ss'],r['sc'],r['sv'],r['ts'],r['tc'],r['tv'])
    seen[k]=r
cards=list(seen.values())
print('unique cards',len(cards))
moves=[]; stats=collections.Counter(); undecided=[]
for r in cards:
    for side in ('s','t'):
        if r[side+'s']!='jubilees': continue
        ch=r[side+'c']; old=r[side+'v']
        land=remap[f'{ch}:{old}'][0]          # where the row sits after the renumber (id kept)
        group=remap[f'{ch}:{old}']
        note=r['note'].replace("''","'")
        # evidence 1: a Jubilees c:v citation in the note
        cites=[(int(a),int(b)) for a,b in re.findall(r'Jubilees\s+(\d+):(\d+)',note)]
        cites=[v for c_,v in cites if c_==ch]
        # evidence 2: quoted text that matches a verse of this chapter
        quotes=re.findall(r'\*([^*]{25,})\*',note)
        best=(0,None)
        for q in quotes:
            nq=norm(q)
            for v,t in NEW[ch].items():
                nt=norm(t)
                # quote may be a fragment of the verse
                sm=difflib.SequenceMatcher(None,nt,nq,autojunk=False)
                m=sm.find_longest_match(0,len(nt),0,len(nq))
                score=m.size/max(1,len(nq))
                if score>best[0]: best=(score,v)
        qv=best[1] if best[0]>=0.6 else None
        decided=None; how=''
        if qv is not None and (not cites or qv in cites or len(group)>1):
            decided=qv; how=f'quote→{qv} ({best[0]:.2f})'
        elif cites and len(set(cites))==1:
            decided=cites[0]; how=f'cite→{cites[0]}'
        elif cites:
            # several citations: pick the one inside this row's group if any, else the first
            ing=[v for v in cites if v in group]; decided=ing[0] if ing else cites[0]; how=f'cites{cites}→{decided}'
        if decided is None:
            stats['no evidence — stays' ]+=1
            if len(group)>1: undecided.append((side,ch,old,group,note[:100]))
            continue
        if decided<1 or decided>len(NEW[ch]): stats['cite out of range — stays']+=1; continue
        if decided==land: stats['already right']+=1
        else:
            stats['move']+=1
            moves.append(dict(side=side,ch=ch,old_v=old,land_v=land,new_v=decided,how=how,
                              other=(r['ts'],r['tc'],r['tv']) if side=='s' else (r['ss'],r['sc'],r['sv']),note=note[:90]))
print(stats); print('undecided on a merged row:',len(undecided))
json.dump(moves,open('jub-card-moves.json','w'),ensure_ascii=False,indent=0)
with open('jub-card-sort-report.md','w') as f:
    f.write(f"# Jubilees card sort (S453) — {len(cards)} unique cards touch Jubilees (local copies of the inserted SQL)\n\n{dict(stats)}\n\n")
    f.write("## Moves (side s=card's source is Jubilees, t=card's target is Jubilees)\n| side | ch | old row | lands at after renumber | belongs to | evidence | other end | note |\n|---|---|---|---|---|---|---|---|\n")
    for m in moves: f.write(f"| {m['side']} | {m['ch']} | {m['old_v']} | {m['land_v']} | {m['new_v']} | {m['how']} | {':'.join(map(str,m['other']))} | {m['note'][:70].replace('|','/')} |\n")
    f.write("\n## Cards on a formerly-merged row with no evidence (stay on the first piece)\n")
    for u in undecided: f.write(f"- {u}\n")
