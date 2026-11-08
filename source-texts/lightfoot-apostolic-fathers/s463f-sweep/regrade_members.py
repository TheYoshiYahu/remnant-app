"""S463e — member notes and thread summaries: every extra-book quotation (italic labelled/trailing/lead, and prose
phrase quotes) checked against the live text; canon lead quotes against canon.json; markers in the prose only."""
import json, re, collections, sys
sys.argv = ['x']; exec(open('regrade.py').read().split("# ---- CARDS ----")[0])   # reuse everything above the card loop
mem_out = []
for m in live['members']:
    note = m['member_note'] or ''
    sj, tj = m['s_ed'] in EDS, m['t_ed'] in EDS
    if not (sj or tj):
        mem_out.append(dict(thread=m['thread_id'], slug=m['slug'], xref=m['xref_id'], verdict='MENTION_ONLY')); continue
    side = 'S' if sj else 'T'
    book = f"{m['s_ed']}|{m['s_book']}" if side == 'S' else f"{m['t_ed']}|{m['t_book']}"
    addr = f"{book}|{m['s_ch']}:{m['s_vn']}" if side == 'S' else f"{book}|{m['t_ch']}:{m['t_vn']}"
    other_book = f"{m['t_ed']}|{m['t_book']}" if side == 'S' else f"{m['s_ed']}|{m['s_book']}"
    quotes = extra_quotes(note)
    om = OTHER_LABEL.match(note); other_first = bool(om) and (om.group(1).strip().lower() not in BOOK_OF)
    if not quotes and not other_first:
        mm = re.search(r"\*([^*]+)\*", note)
        if mm and len(norm(mm.group(1)).split()) >= 4: quotes.append((mm.group(1), None, None, None))
    prose = re.sub(r"\*[^*]+\*", " ", note)
    chains = [h for h in HYPHEN_CHAIN.findall(prose) if not SLUG_CITE.match(h + ' 1:1') and not NUMERIC_CHAIN.match(h)]
    lead = canon_lead(note) if other_book.startswith('canon|') else None
    phr = []
    for q in phrase_quotes(note, ''):
        ok = addr in NL and contains_from(addr, q, n=3)
        phr.append(dict(quote=q, verdict='STAND' if ok else ('REWORDED' if (addr in NL and grade_at(q, addr) >= 0.6) else 'NOT_FOUND')))
    base = dict(thread=m['thread_id'], slug=m['slug'], xref=m['xref_id'], side=side, book=book, held=(book.split('|')[1] in HELD), addr=addr, note=note,
                degraded=bool(DEGRADED.search(prose)), hyphen_chain=bool(chains), chains=chains, slug_cite=bool(SLUG_CITE.search(note)),
                t_range_bad=t_range_check(note), canon_lead=lead, phrases=phr)
    if not quotes: mem_out.append(dict(base, verdict='NO_EXTRA_QUOTE', quotes=[])); continue
    graded = []
    for q, lab, rng, nm in quotes:
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
print('MEMBERS in dump', len(mem_out), '| on anchored cards', len(mm_), dict(collections.Counter(o['verdict'] for o in mm_)))
print(' italic quotations:', dict(collections.Counter(g['verdict'] for o in mm_ for g in o.get('quotes', []))))
print(' phrase quotes:', dict(collections.Counter(p['verdict'] for o in mm_ for p in o['phrases'])))
print(' canon lead:', dict(collections.Counter((o['canon_lead'] or {}).get('verdict', 'none') for o in mm_)))
print(' flagged (degraded/chain):', sum(1 for o in mm_ if o['degraded'] or o['hyphen_chain']), '| slug cites:', sum(1 for o in mm_ if o['slug_cite']), '| T.XII range bad:', sum(1 for o in mm_ if o['t_range_bad']))
print(' per book flagged:', dict(collections.Counter(o['book'] for o in mm_ if o['degraded'] or o['hyphen_chain'])))

th_out = []
for t in live['threads']:
    anchored = (t['a_ed'] in EDS) if t['a_ed'] else False
    book = f"{t['a_ed']}|{t['a_book']}" if anchored else None
    s = t['summary_md'] or ''
    qs = extra_quotes(s)
    bad = [(q, a) for q, a, _, _ in qs if not (a in NL and contains_from(a, q))]
    prose = re.sub(r"\*[^*]+\*", " ", s)
    chains = [h for h in HYPHEN_CHAIN.findall(prose) if not SLUG_CITE.match(h + ' 1:1') and not NUMERIC_CHAIN.match(h)]
    # every canon-labelled italic in the summary checked against canon.json
    canon_off = []
    hits = [(mm.group(1), mm.group(2), mm.group(3), mm.group(4)) for mm in re.finditer(rf"(?<!of )\b({CANON_RE})\.?\s+(\d+):(\d+)(?:\s*[–-]\s*\d+)?\s*[—–-]\s*\*([^*]+)\*", s, re.I)]
    hits += [(mm.group(2), mm.group(3), mm.group(4), mm.group(1)) for mm in re.finditer(rf"\*([^*]+)\*\s*\((?!Ascension of )({CANON_RE})\.?\s+(\d+):(\d+)(?:\s*[–-]\s*\d+)?\)", s, re.I)]
    for bk, chn, vn, qt in hits:
        class mm: pass
        mm.group = lambda k, _v=(None, bk, chn, vn, qt): _v[k]
        slug = CANON_NAMES[bk.lower()]; a = f"{slug}|{chn}:{vn}"
        if a not in CL: canon_off.append(dict(cite=mm.group(0)[:60], verdict='NO_SUCH_VERSE')); continue
        span = ' '.join(norm(CL.get(f"{slug}|{mm.group(2)}:{int(mm.group(3))+i}", '')) for i in range(4))
        pos = 0; ok = True
        for p in pieces(mm.group(4)):
            i = span.find(p, pos)
            if i < 0: ok = False; break
            pos = i + len(p)
        if not ok: canon_off.append(dict(cite=f"{mm.group(1)} {mm.group(2)}:{mm.group(3)}", quote=mm.group(4), live=CL[a]))
    th_out.append(dict(id=t['id'], slug=t['slug'], title=t['title'], anchored=anchored, book=book, held=(book.split('|')[1] in HELD) if book else False,
                       anchor=(f"{t['a_book']} {t['a_ch']}:{t['a_vn']}" + (f"–{t['z_ch']}:{t['z_vn']}" if t['z_vn'] else '')) if t['a_ed'] else None,
                       n_quotes=len(qs), off=[dict(quote=q, addr=a, live=L.get(a)) for q, a in bad], canon_off=canon_off,
                       degraded=bool(DEGRADED.search(prose + ' ' + (t['title'] or ''))), hyphen_chain=bool(chains), chains=chains,
                       slug_cite=bool(SLUG_CITE.search(s)), t_range_bad=t_range_check(s), hebrew_book=bool(HEBREW_BOOK.search(s))))
json.dump(th_out, open(HERE/'regrade_threads.json', 'w'), ensure_ascii=False, indent=1)
an = [t for t in th_out if t['anchored']]
print('THREADS in dump', len(th_out), '| anchored in these editions', len(an), '| not anchored (name a book only)', len(th_out)-len(an))
print(' with extra quotes', sum(1 for t in an if t['n_quotes']), '| extra quotes off', sum(len(t['off']) for t in an), 'in', sum(1 for t in an if t['off']), 'threads',
      '| canon italics off', sum(len(t['canon_off']) for t in an), 'in', sum(1 for t in an if t['canon_off']),
      '| slug-cited', sum(1 for t in an if t['slug_cite']), '| flagged', sum(1 for t in an if t['degraded'] or t['hyphen_chain']),
      '| Hebrew book names', sum(1 for t in an if t['hebrew_book']), '| T.XII range bad', sum(1 for t in an if t['t_range_bad']))
print(' per book anchored:', dict(collections.Counter(t['book'] for t in an)))
print(' per book flagged:', dict(collections.Counter(t['book'] for t in an if t['degraded'] or t['hyphen_chain'])))
print(' per book extra-quote off:', dict(collections.Counter(t['book'] for t in an if t['off'])))
print(' per book canon off:', dict(collections.Counter(t['book'] for t in an if t['canon_off'])))
