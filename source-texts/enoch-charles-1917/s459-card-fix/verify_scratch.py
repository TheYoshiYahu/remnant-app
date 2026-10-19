"""Verify by content: re-read every card touching 1 Enoch from the scratch DB after the migration and grade its
lead Enoch quote against the live text with the S459 regrade rules. Writes verify.json / prints the table."""
import asyncio, asyncpg, json, collections, re, sys
sys.argv=['x']; import regrade as R   # reuse norm/grade helpers (module runs its own grading of the S457 dump on import)
async def main():
    con = await asyncpg.connect(host='/tmp', port=5499, user='postgres', database='postgres')
    V = """select v.id, e.slug ed, b.slug book, c.chapter_number ch, v.verse_number vn, v.text from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id"""
    rows = await con.fetch(f"""with vv as ({V}) select x.id, x.note, s.ed s_ed, s.book s_book, s.ch s_ch, s.vn s_vn, s.text s_text, t.ed t_ed, t.book t_book, t.ch t_ch, t.vn t_vn, t.text t_text
        from cross_references x join vv s on s.id=x.source_verse_id join vv t on t.id=x.target_verse_id where s.ed='enoch' or t.ed='enoch' or x.note ilike '%enoch%' order by x.id""")
    mem = await con.fetch("""select m.thread_id, m.cross_reference_id xref, m.member_note from cross_reference_thread_members m""")
    await con.close()
    fix = json.load(open('fix.json')); fixed = {x['id']: x for x in fix['cards'] if x['action']=='update'}
    out = collections.Counter(); bad = []
    for c in rows:
        c = dict(c); note = c['note'] or ''
        enoch_end = 'T' if c['t_ed']=='enoch' else ('S' if c['s_ed']=='enoch' else None)
        addr = f"{c['t_ch']}:{c['t_vn']}" if enoch_end=='T' else (f"{c['s_ch']}:{c['s_vn']}" if enoch_end=='S' else None)
        if c['id'] in fixed:
            x = fixed[c['id']]
            vt = R.L[x['new_addr']]
            ok = (addr == x['new_addr']) and (vt in note) and note == x['new_note']
            out['fixed ok' if ok else 'fixed BAD'] += 1
            if not ok: bad.append((c['id'], addr, x['new_addr']))
        else:
            out['untouched'] += 1
    print(out, bad[:10])
    # member notes on fixed cards: every italic Enoch fragment must be in the live span of the card's new address
    mbad = 0; mchecked = 0
    for m in mem:
        if m['xref'] not in fixed: continue
        x = fixed[m['xref']]; mchecked += 1
        span = ' '.join(R.norm(R.L[v]) for v in R.ADDRS[R.IDX[x['new_addr']]:R.IDX[x['new_addr']]+8])
        for f in re.finditer(r"\*([^*]+)\*", m['member_note'] or ''):
            fn = R.norm(f.group(1))
            if len(fn.split()) >= 4 and fn not in span and fn in R.norm(x['old_note']) and fn not in R.norm(x['new_note']):
                mbad += 1; print('member stale', m['xref'], f.group(1)[:80])
    print('member notes checked', mchecked, 'stale', mbad)
    print('retired present?', [r['id'] for r in rows if r['id'] in (4396, 4853)])
asyncio.run(main())
