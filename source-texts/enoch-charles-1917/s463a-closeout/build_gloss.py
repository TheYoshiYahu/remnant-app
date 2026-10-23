import json,re,unicodedata,sys,collections
sys.path.insert(0,'.')
from decisions463a import D, LEADFIX
P='/mnt/user-data/uploads/Desktop/App/source-texts/'
live=json.load(open(P+'enoch-charles-1917/enoch-cards-live.json')); L=live['enoch_live']
C={c['id']:c for c in live['cards']}
rows={r['id']:r for r in json.load(open('../gloss_map2.json'))}
# cards outside the 630 (same-verse glosses) that still carry a degraded marker — rewritten in place
EXTRA={21408:"Names what the flame-treaders of 71:1 are: ministering servants of fire, not gods — an ordered court under the Creator."}
for i,p in EXTRA.items():
    c=C[i]; a=f"{c['s_ch']}:{c['s_vn']}" if c['s_ed']=='enoch' else f"{c['t_ch']}:{c['t_vn']}"
    rows[i]=dict(id=i,addr=a,status='same',old_text=L[a],best_addr=a,best_ratio=1.0,piece_matches=[],auto='EXTRA'); D[i]=('REWRITE',p)
canon=json.load(open(P+'parsed/canon.json'))
CAN=' '.join(v['text'] for b in canon['books'] for c in b['chapters'] for v in c['verses'])
def norm(s):
    s=unicodedata.normalize('NFKD',s or ''); s=''.join(ch for ch in s if not unicodedata.combining(ch))
    s=re.sub(r"\([^)]*\)"," ",s); s=re.sub(r"[\[\]‘’'“”\"]","",s).lower(); s=re.sub(r"[^a-z0-9 ]+"," ",s); return re.sub(r"\s+"," ",s).strip()
CANN=norm(CAN); LN=' '.join(norm(t) for t in L.values())
DEG=re.compile(r"substance|wisdom-stream|the framework|Yoshi|Red Line|apparatus|FRAMEWORK|\bS1\d\d\b|voice skill",re.I)
# fill auto decisions
for i,r in rows.items():
    if i in D: continue
    if r['auto']=='MOVE' and r['best_ratio']>=0.85: D[i]=('MOVE',r['best_addr'],None)
    elif r['auto']=='FITS_SKIM': D[i]=('FITS',)
    else: D[i]=('Q','no decision recorded')
LEAD=re.compile(r"^(.*?\*[^*]+\*)(.*)$",re.S)   # citation + first italic, then the gloss
def split_note(note):
    m=LEAD.match(note or '')
    if not m: return note,''
    return m.group(1),m.group(2)
def patch_addr(text,old,new):
    if old==new: return text
    t=re.sub(r"(1 Enoch |Enoch |\()"+re.escape(old)+r"(?!\d)",lambda m:m.group(1)+new,text)
    t=re.sub(r"(?<![\d:])"+re.escape(old)+r"(?![\d:])",new,t)  # bare address
    return t
fix=[];qs=[];problems=[]
for i,d in D.items():
    c=C[i]; r=rows[i]; side='T' if c['t_ed']=='enoch' else 'S'
    old_addr=r['addr']; note=c['note'] or ''
    kind=d[0]
    if kind=='Q': qs.append(dict(id=i,addr=old_addr,src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}",tgt=f"{c['t_book']} {c['t_ch']}:{c['t_vn']}",why=d[1],note=note,old_text=r['old_text'],live_text=L[old_addr])); continue
    new_addr=old_addr; new_note=note
    if kind=='FITS':
        if len(d)>1 and isinstance(d[1],dict):
            for a,b in d[1].items(): new_note=new_note.replace(a,b)
        if new_note==note: continue   # nothing to change
    elif kind=='MOVE':
        new_addr=d[1]; prose=d[2]
        assert new_addr in L,(i,new_addr)
        lead,gloss=split_note(note)
        if prose: new_note=(lead+' '+prose.strip()).strip()
        else: new_note=patch_addr(note,old_addr,new_addr)
    elif kind=='REWRITE':
        lead,gloss=split_note(note); new_note=(lead+' '+d[1].strip()).strip()
    if i in LEADFIX: new_note=new_note.replace(*LEADFIX[i])
    # checks
    if DEG.search(new_note): problems.append((i,'DEGRADED'))
    for m in re.finditer(r"\*([^*]+)\*",new_note):
        pieces=[norm(p) for p in re.split(r"\.\.\.|…",m.group(1)) if norm(p)]
        other=norm(c['s_text'] if side=='T' else c['t_text'])
        if not all((p in CANN) or (p in LN) or (p in other) for p in pieces): problems.append((i,'ITALIC_NOT_VERBATIM',m.group(1)[:80]))
    if new_addr!=old_addr and re.search(r"(1 Enoch |Enoch |\()"+re.escape(old_addr)+r"(?!\d)",new_note): problems.append((i,'OLD_ADDR_LEFT',old_addr))
    fix.append(dict(id=i,side=side,old_addr=old_addr,new_addr=new_addr,old_note=note,new_note=new_note,kind=kind,
                    src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}",tgt=f"{c['t_book']} {c['t_ch']}:{c['t_vn']}",live_text=L[new_addr]))
# duplicate pairs after moves
def pair(c,addr=None,side=None):
    s=(c['s_ed'],c['s_book'],c['s_ch'],c['s_vn']); t=(c['t_ed'],c['t_book'],c['t_ch'],c['t_vn'])
    if addr:
        ch,vn=map(int,addr.split(':'))
        if side=='S': s=('enoch','1-enoch',ch,vn)
        else: t=('enoch','1-enoch',ch,vn)
    return (s,t)
moved={x['id']:x for x in fix if x['new_addr']!=x['old_addr']}
occupied=collections.defaultdict(list)
for c in live['cards']:
    if c['id'] in moved: continue
    occupied[pair(c)].append(c['id'])
for x in moved.values():
    occupied[pair(C[x['id']],x['new_addr'],x['side'])].append(x['id'])
dups=[(p,ids) for p,ids in occupied.items() if len(ids)>1 and any(i in moved for i in ids)]
print('decisions',len(D),collections.Counter(d[0] for d in D.values()))
print('fix rows',len(fix),collections.Counter(x['kind'] for x in fix),'moved',len(moved),'questions',len(qs))
for p in problems: print('PROBLEM',p)
for p,ids in dups: print('DUP',p[0][2:],'->',p[1][2:],ids,[ (C[i]['s_book'],C[i]['s_ch'],C[i]['s_vn']) for i in ids])
json.dump(dict(cards=fix,questions=qs),open('fix463a_gloss.json','w'),ensure_ascii=False,indent=1)

# ---- duplicates: a moved card landing on a pair where a card already stands is retired (S459 precedent) ----
retire={}
for p,ids in dups:
    resident=[i for i in ids if i not in moved]; movers=[i for i in ids if i in moved]
    if not resident: resident=[min(ids)]; movers=[i for i in ids if i!=resident[0]]
    for i in movers:
        retire[i]=f"duplicate — card {resident[0]} ({C[resident[0]]['s_book']} {C[resident[0]]['s_ch']}:{C[resident[0]]['s_vn']} ↔ {C[resident[0]]['t_book']} {C[resident[0]]['t_ch']}:{C[resident[0]]['t_vn']}) already carries this pairing on the true verse"
fix2=[]
for x in fix:
    if x['id'] in retire: x=dict(id=x['id'],kind='retire',reason=retire[x['id']],old_addr=x['old_addr'],new_addr=x['new_addr'],src=x['src'],tgt=x['tgt'],old_note=x['old_note'])
    fix2.append(x)
# ---- member notes riding on changed cards ----
upd={x['id']:x for x in fix2 if x['kind']!='retire'}
members=[]
for m in live['members']:
    x=upd.get(m['xref_id'])
    if not x: continue
    old=m['member_note'] or ''
    if old.strip()==(x['old_note'] or '').strip(): new=x['new_note']; how='same-as-card'
    else:
        new=patch_addr(old,x['old_addr'],x['new_addr']) if x['new_addr']!=x['old_addr'] else old
        if DEG.search(new) and not re.search(r"\*[^*]*substance[^*]*\*",new): new=x['new_note']; how='replaced (degraded)'
        elif new!=old: how='address patched'
        else: how='unchanged'
    if new!=old: members.append(dict(thread_id=m['thread_id'],slug=m['slug'],xref=m['xref_id'],old=old,new=new,how=how))
members_on_retired=[dict(thread_id=m['thread_id'],slug=m['slug'],xref=m['xref_id']) for m in live['members'] if m['xref_id'] in retire]
print('retire',len(retire),'members changed',len(members),collections.Counter(m['how'] for m in members),'members on retired',len(members_on_retired))
json.dump(dict(cards=fix2,members=members,members_on_retired=members_on_retired,questions=qs),open('fix463a_gloss.json','w'),ensure_ascii=False,indent=1)
