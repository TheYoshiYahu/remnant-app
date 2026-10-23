"""S463c — member notes and thread summaries: find each Apocrypha/3 Macc quotation and check it against the live text."""
import json, re, collections, sys
sys.argv=['x']; exec(open('regrade.py').read().split("out = []")[0])   # reuse ALIAS/LABEL/norm/NL/etc. without re-running cards
mem_out=[]
for m in live['members']:
    note=m['member_note'] or ''
    side='T' if in_scope(m['t_ed'],m['t_book']) else ('S' if in_scope(m['s_ed'],m['s_book']) else None)
    book=m['t_book'] if side=='T' else (m['s_book'] if side=='S' else None)
    addr=f"{book}|{m['t_ch']}:{m['t_vn']}" if side=='T' else (f"{book}|{m['s_ch']}:{m['s_vn']}" if side=='S' else None)
    quotes=apoc_quotes(note)
    om=OTHER_LABEL.match(note); other_first=bool(om) and om.group(1).strip().lower() not in ALIAS
    if not quotes and side and not other_first:
        mm=re.search(r"\*([^*]+)\*",note)
        if mm and len(norm(mm.group(1)).split())>=4: quotes.append((mm.group(1),None))
    base=dict(thread=m['thread_id'],slug=m['slug'],xref=m['xref_id'],side=side,addr=addr,note=note,
              degraded=bool(DEGRADED.search(note)),hyphen_chain=bool([h for h in HYPHEN_CHAIN.findall(note) if not SLUG_CITE.match(h+' 1:1')]),slug_cite=bool(SLUG_CITE.search(note)))
    if not quotes: mem_out.append(dict(base,verdict='NO_APOC_QUOTE' if side else 'MENTION_ONLY')); continue
    q,lab=quotes[0]; at=lab or addr
    if at in NL and contains_from(at,q): v='STAND'
    else:
        r=grade_at(q,at) if at in NL else 0.0
        v='REWORDED' if r>=0.6 else 'OFF'
    mem_out.append(dict(base,quote=q,labelled=lab,verdict=v,ratio=round(r if v!='STAND' else 1.0,2),live_here=L.get(at)))
json.dump(mem_out,open(HERE/'regrade_members.json','w'),ensure_ascii=False,indent=1)
print('MEMBERS',collections.Counter(o['verdict'] for o in mem_out))
print(' flagged (degraded/chain):',sum(1 for o in mem_out if o['degraded'] or o['hyphen_chain']),
      collections.Counter(o['verdict'] for o in mem_out if o['degraded'] or o['hyphen_chain']))
th_out=[]
for t in live['threads']:
    anchored=in_scope(t['a_ed'],t['a_book']) if t['a_ed'] else False
    s=t['summary_md'] or ''
    qs=apoc_quotes(s)
    bad=[(q,a) for q,a in qs if not (a in NL and contains_from(a,q))]
    th_out.append(dict(id=t['id'],slug=t['slug'],anchored=anchored,anchor=f"{t['a_book']} {t['a_ch']}:{t['a_vn']}" if t['a_ed'] else None,
                       n_quotes=len(qs),off=[dict(quote=q,addr=a,live=L.get(a)) for q,a in bad],
                       degraded=bool(DEGRADED.search(s+' '+(t['title'] or ''))),hyphen_chain=bool([h for h in HYPHEN_CHAIN.findall(s) if not SLUG_CITE.match(h+' 1:1')]),slug_cite=bool(SLUG_CITE.search(s))))
json.dump(th_out,open(HERE/'regrade_threads.json','w'),ensure_ascii=False,indent=1)
print('THREADS total',len(th_out),'anchored in scope',sum(1 for t in th_out if t['anchored']),
      '| with apoc quotes',sum(1 for t in th_out if t['n_quotes']),'| quotes off',sum(len(t['off']) for t in th_out),'in',sum(1 for t in th_out if t['off']),'threads',
      '| slug-cited summaries',sum(1 for t in th_out if t['slug_cite']),'(anchored:',sum(1 for t in th_out if t['slug_cite'] and t['anchored']),')',
      '| flagged summaries',sum(1 for t in th_out if t['degraded'] or t['hyphen_chain']),'(anchored:',sum(1 for t in th_out if (t['degraded'] or t['hyphen_chain']) and t['anchored']),')')
