"""S463d — member notes and thread summaries: find every Jasher quotation and check it against the live text."""
import json, re, collections, sys
sys.argv = ['x']; exec(open('regrade.py').read().split("out = []")[0])   # reuse LABEL/TRAIL/norm/NL/etc. without re-running cards
mem_out = []
for m in live['members']:
    note = m['member_note'] or ''
    sj, tj = is_jasher(m['s_ed']), is_jasher(m['t_ed'])
    if not (sj or tj):
        mem_out.append(dict(thread=m['thread_id'], slug=m['slug'], xref=m['xref_id'], verdict='MENTION_ONLY')); continue
    side = 'S' if sj else 'T'
    addr = f"jasher|{m['s_ch']}:{m['s_vn']}" if side == 'S' else f"jasher|{m['t_ch']}:{m['t_vn']}"
    quotes = jasher_quotes(note)
    om = OTHER_LABEL.match(note); other_first = bool(om) and not re.match(r'(?i)jasher|yashar', om.group(1).strip())
    if not quotes and not other_first:
        mm = re.search(r"\*([^*]+)\*", note)
        if mm and len(norm(mm.group(1)).split()) >= 4: quotes.append((mm.group(1), None, None))
    prose = re.sub(r"\*[^*]+\*", " ", note)
    chains = [h for h in HYPHEN_CHAIN.findall(prose) if not SLUG_CITE.match(h + ' 1:1') and not NUMERIC_CHAIN.match(h)]
    base = dict(thread=m['thread_id'], slug=m['slug'], xref=m['xref_id'], side=side, addr=addr, note=note,
                degraded=bool(DEGRADED.search(prose)), hyphen_chain=bool(chains), chains=chains, slug_cite=bool(SLUG_CITE.search(note)))
    if not quotes: mem_out.append(dict(base, verdict='NO_JASHER_QUOTE', quotes=[])); continue
    graded = []
    for q, lab, rng in quotes:
        at = lab or addr
        if at in NL and contains_from(at, q): v, r = 'STAND', 1.0
        else:
            r = grade_at(q, at) if at in NL else 0.0
            v = 'REWORDED' if r >= 0.6 else 'OFF'
        graded.append(dict(quote=q, labelled=lab, at=at, verdict=v, ratio=round(r, 2), live_here=L.get(at)))
    worst = ['OFF', 'REWORDED', 'STAND']
    mem_out.append(dict(base, verdict=min(graded, key=lambda g: worst.index(g['verdict']))['verdict'], quotes=graded))
json.dump(mem_out, open(HERE/'regrade_members.json', 'w'), ensure_ascii=False, indent=1)
mm_ = [o for o in mem_out if o['verdict'] != 'MENTION_ONLY']
print('MEMBERS in dump', len(mem_out), '| on Jasher-anchored cards', len(mm_), collections.Counter(o['verdict'] for o in mm_))
print(' quotations:', collections.Counter(g['verdict'] for o in mm_ for g in o.get('quotes', [])))
print(' flagged (degraded/chain):', sum(1 for o in mm_ if o['degraded'] or o['hyphen_chain']), '| slug cites:', sum(1 for o in mm_ if o['slug_cite']))
th_out = []
for t in live['threads']:
    anchored = is_jasher(t['a_ed']) if t['a_ed'] else False
    s = t['summary_md'] or ''
    qs = jasher_quotes(s)
    bad = [(q, a) for q, a, _ in qs if not (a in NL and contains_from(a, q))]
    prose = re.sub(r"\*[^*]+\*", " ", s)
    chains = [h for h in HYPHEN_CHAIN.findall(prose) if not SLUG_CITE.match(h + ' 1:1') and not NUMERIC_CHAIN.match(h)]
    th_out.append(dict(id=t['id'], slug=t['slug'], title=t['title'], anchored=anchored, anchor=f"{t['a_book']} {t['a_ch']}:{t['a_vn']}" + (f"–{t['z_ch']}:{t['z_vn']}" if t['z_vn'] else '') if t['a_ed'] else None,
                       n_quotes=len(qs), off=[dict(quote=q, addr=a, live=L.get(a)) for q, a in bad],
                       degraded=bool(DEGRADED.search(prose + ' ' + (t['title'] or ''))), hyphen_chain=bool(chains), chains=chains, slug_cite=bool(SLUG_CITE.search(s)),
                       names_jasher=bool(re.search(r'\bJasher\b', s + ' ' + (t['title'] or '')))))
json.dump(th_out, open(HERE/'regrade_threads.json', 'w'), ensure_ascii=False, indent=1)
an = [t for t in th_out if t['anchored']]
print('THREADS in dump', len(th_out), '| anchored in Jasher', len(an), '| not anchored but naming Jasher', sum(1 for t in th_out if not t['anchored'] and t['names_jasher']),
      '\n with Jasher quotes', sum(1 for t in an if t['n_quotes']), '| quotes off', sum(len(t['off']) for t in an), 'in', sum(1 for t in an if t['off']), 'threads',
      '| slug-cited', sum(1 for t in an if t['slug_cite']), '| flagged', sum(1 for t in an if t['degraded'] or t['hyphen_chain']))
