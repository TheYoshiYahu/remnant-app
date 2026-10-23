import json,re,unicodedata,sys,collections
sys.path.insert(0,'.')
from prose463 import SPAN,PROSE,MEMBERS
P='/mnt/user-data/uploads/Desktop/App/source-texts/'
live=json.load(open(P+'enoch-charles-1917/enoch-cards-live.json')); L=live['enoch_live']
C={c['id']:c for c in live['cards']}
canon=json.load(open(P+'parsed/canon.json'))
CAN={}
for b in canon['books']:
    for c in b['chapters']:
        for v in c['verses']: CAN[f"{b['book_title']} {c['number']}:{v['number']}"]=v['text']
def norm(s):
    s=unicodedata.normalize('NFKD',s or ''); s=''.join(ch for ch in s if not unicodedata.combining(ch))
    s=re.sub(r"\([^)]*\)"," ",s); s=re.sub(r"[\[\]‘’'“”\"]","",s).lower(); s=re.sub(r"[^a-z0-9 ]+"," ",s); return re.sub(r"\s+"," ",s).strip()
CANN=' '.join(norm(t) for t in CAN.values())
LN=' '.join(norm(t) for t in L.values())
JUBJAS=None
DEG=re.compile(r"substance|wisdom-stream|the framework|Yoshi|Red Line|apparatus|FRAMEWORK|\bS1\d\d\b|locked|Christolog|voice skill",re.I)
assert set(SPAN)==set(PROSE), set(SPAN)^set(PROSE)
fix=[]; problems=[]
for cid,addrs in SPAN.items():
    c=C[cid]
    tgt=f"{c['t_ch']}:{c['t_vn']}"; assert addrs[0]==tgt,(cid,addrs,tgt)
    quote=' '.join(L[a].strip() for a in addrs)
    cite=f"1 Enoch {addrs[0]}"+(f"–{addrs[-1].split(':')[1]}" if len(addrs)>1 else "")
    prose=PROSE[cid].strip()
    if DEG.search(prose): problems.append((cid,'DEGRADED',DEG.search(prose).group(0)))
    # italics in prose: must be verbatim canon, verbatim enoch, or verbatim jub/jasher source text
    for m in re.finditer(r"\*([^*]+)\*",prose):
        pieces=[norm(p) for p in re.split(r"\.\.\.|…",m.group(1)) if norm(p)]
        ok=all((p.strip() in CANN) or (p.strip() in LN) or (p.strip() in norm(c['s_text'])) or (p.strip() in norm(c['t_text'])) for p in pieces)
        if not ok: problems.append((cid,'ITALIC_NOT_VERBATIM',m.group(1)))
    new=f"*{quote}* ({cite}). {prose}"
    assert L[tgt] in new
    fix.append(dict(id=cid,addr=tgt,src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}",old_note=c['note'],new_note=new,live_text=L[tgt]))
# members
mem=[]; keys=set(MEMBERS)
rows=[m for m in live['members'] if m['xref_id'] in SPAN]
seen=set()
for m in rows:
    k=(m['thread_id'],m['xref_id'])
    if k not in MEMBERS: problems.append((m['xref_id'],'MEMBER_MISSING',f"thread {m['thread_id']} {m['slug']}")); continue
    seen.add(k); new=MEMBERS[k]
    if DEG.search(new): problems.append((m['xref_id'],'MEMBER_DEGRADED',new[:60]))
    for mm in re.finditer(r"\*([^*]+)\*",new):
        pieces=[norm(p) for p in re.split(r"\.\.\.|…",mm.group(1)) if norm(p)]
        if not all((p in LN) or (p in CANN) or (p in norm(C[m['xref_id']]['s_text'])) for p in pieces): problems.append((m['xref_id'],'MEMBER_ITALIC_NOT_VERBATIM',mm.group(1)))
    mem.append(dict(thread_id=m['thread_id'],slug=m['slug'],xref=m['xref_id'],old=m['member_note'],new=new))
for k in keys-seen: problems.append((k[1],'MEMBER_KEY_UNUSED',str(k)))
print('cards',len(fix),'members',len(mem),'member rows on these cards',len(rows))
for p in problems: print('PROBLEM',p)
json.dump(dict(cards=fix,members=mem),open('fix463a.json','w'),ensure_ascii=False,indent=1)
