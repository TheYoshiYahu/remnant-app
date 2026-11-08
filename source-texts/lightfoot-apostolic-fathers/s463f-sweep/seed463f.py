"""S463f scratch — a real Postgres 16 seeded from the Nov 8 read-back (af-cards-live.json): the two editions' full live text, every card
touching them (with ids), stub verses for the other ends, every member row and thread; then the two migrations run TWICE through
api/apply_migration.py (the same path the live deploy uses), a dump written after each run in the read-back's own shape, and
_s463f_check.py run on each dump. Guards: S463F_TAMPER=text (a live verse changed → RAISE, nothing lands) | moved (a card moved since the
read-back → skipped with NOTICE, the rest lands).
Run (cloud sandbox or any box with a local Postgres):  python3 seed463f.py <DATABASE_URL>
"""
import asyncio, json, sys, os, subprocess, re
from pathlib import Path
import asyncpg
HERE = Path(__file__).resolve().parent
URL = sys.argv[1]
D = json.load(open(HERE / 'af-cards-live.json'))
EDS = {'lightfoot-apostolic-fathers', 'sonnini-acts-29'}
MIGS = [HERE / 'sql' / 'session463f_apostolic_fathers_sweep.sql', HERE / 'sql' / 'session463f_sonnini_sweep.sql']
schema = '\n'.join(l for l in (HERE / 'schema.sql').read_text().split('\n') if 'CREATE EXTENSION' not in l and 'gin_trgm_ops' not in l)
titles = {b['ed'] + '|' + b['slug']: b for b in D['books']}

async def main():
    con = await asyncpg.connect(URL)
    await con.execute(schema)
    eds, bks, chs, vs = {}, {}, {}, {}
    async def ed(slug):
        if slug not in eds: eds[slug] = await con.fetchval("INSERT INTO editions (slug,title,public_domain_base,restoration_pipeline_version) VALUES ($1,$1,'x','phase4-v2') RETURNING id", slug)
        return eds[slug]
    async def bk(e, slug):
        k = e + '|' + slug
        if k not in bks:
            t = titles.get(k)
            bks[k] = await con.fetchval("INSERT INTO books (edition_id,slug,title,canonical_order,witness_category,tier_required) VALUES ($1,$2,$3,$4,'canon','free') RETURNING id", await ed(e), slug, t['title'] if t else slug, t['canonical_order'] if t else 0)
        return bks[k]
    async def ch(e, b, c):
        k = f"{e}|{b}|{c}"
        if k not in chs: chs[k] = await con.fetchval("INSERT INTO chapters (book_id,chapter_number) VALUES ($1,$2) RETURNING id", await bk(e, b), c)
        return chs[k]
    async def vv(e, b, c, v, text):
        k = f"{e}|{b}|{c}:{v}"
        if k not in vs: vs[k] = await con.fetchval("INSERT INTO verses (chapter_id,verse_number,text) VALUES ($1,$2,$3) RETURNING id", await ch(e, b, c), v, text)
        return vs[k]
    def keyf(k):
        e, b, cv = k.split('|'); c, v = map(int, cv.split(':')); return (e, b, c, v)
    for k in sorted(D['live'], key=keyf):
        e, b, c, v = keyf(k); await vv(e, b, c, v, D['live'][k])
    for c in D['cards']:
        s = await vv(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text']); t = await vv(c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
        await con.execute("INSERT INTO cross_references (id,source_verse_id,target_verse_id,source,note,tier_required) VALUES ($1,$2,$3,$4,$5,$6)", c['id'], s, t, c['source'], c['note'], c['tier'])
    ids = {c['id'] for c in D['cards']}
    for t in D['threads']:
        a = vs.get(f"{t['a_ed']}|{t['a_book']}|{t['a_ch']}:{t['a_vn']}") if t['a_ed'] in EDS else None
        z = vs.get(f"{t['a_ed']}|{t['a_book']}|{t['z_ch']}:{t['z_vn']}") if (t['a_ed'] in EDS and t['z_vn']) else None
        await con.execute("INSERT INTO cross_reference_threads (id,slug,title,summary_md,sort_order,tier_required,anchor_verse_id_start,anchor_verse_id_end) VALUES ($1,$2,$3,$4,$5,$6,$7,$8) ON CONFLICT DO NOTHING", t['id'], t['slug'], t['title'], t['summary_md'], t['sort_order'] or 0, t['tier'], a, z)
    seen = set()
    for m in D['members']:
        k = (m['thread_id'], m['xref_id'])
        if k in seen or m['xref_id'] not in ids: continue
        seen.add(k)
        await con.execute("INSERT INTO cross_reference_threads (id,slug,title,summary_md) VALUES ($1,$2,$2,'') ON CONFLICT DO NOTHING", m['thread_id'], m['slug'])
        await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,$3,$4)", m['thread_id'], m['xref_id'], m['sort_order'], m['member_note'])
    await con.execute("INSERT INTO schema_version (id, version) VALUES (1, 'scratch-s463f') ON CONFLICT DO NOTHING")
    print('seeded: verses', await con.fetchval('select count(*) from verses'), 'cards', len(D['cards']), 'threads', await con.fetchval('select count(*) from cross_reference_threads'), 'members', len(seen))

    async def dump(file):
        vrows = await con.fetch("SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id")
        by = {r['id']: r for r in vrows}; live = {f"{r['es']}|{r['bs']}|{r['ch']}:{r['vn']}": r['text'] for r in vrows if r['es'] in EDS}
        xr = await con.fetch("SELECT id, source_verse_id s, target_verse_id t, source, note, tier_required::text tier FROM cross_references ORDER BY id")
        cards = [dict(id=x['id'], note=x['note'], tier=x['tier'], source=x['source'], s_ed=by[x['s']]['es'], s_book=by[x['s']]['bs'], s_ch=by[x['s']]['ch'], s_vn=by[x['s']]['vn'], s_text=by[x['s']]['text'],
                      t_ed=by[x['t']]['es'], t_book=by[x['t']]['bs'], t_ch=by[x['t']]['ch'], t_vn=by[x['t']]['vn'], t_text=by[x['t']]['text']) for x in xr]
        cm = {c['id']: c for c in cards}
        mem = [dict(thread_id=m['thread_id'], slug=m['slug'], xref_id=m['xref_id'], sort_order=m['sort_order'], member_note=m['member_note'],
                    **{k: cm[m['xref_id']][k] for k in ('s_ed', 's_book', 's_ch', 's_vn', 't_ed', 't_book', 't_ch', 't_vn')})
               for m in await con.fetch("SELECT m.thread_id, m.cross_reference_id xref_id, m.sort_order, m.member_note, t.slug FROM cross_reference_thread_members m JOIN cross_reference_threads t ON t.id=m.thread_id ORDER BY 1,2")]
        th = []
        for t in await con.fetch("SELECT id, slug, title, summary_md, sort_order, tier_required::text tier, anchor_verse_id_start a, anchor_verse_id_end z FROM cross_reference_threads ORDER BY id"):
            a = by.get(t['a']); z = by.get(t['z'])
            th.append(dict(id=t['id'], slug=t['slug'], title=t['title'], summary_md=t['summary_md'], sort_order=t['sort_order'], tier=t['tier'],
                           a_ed=a['es'] if a else None, a_book=a['bs'] if a else None, a_ch=a['ch'] if a else None, a_vn=a['vn'] if a else None, z_ch=z['ch'] if z else None, z_vn=z['vn'] if z else None))
        json.dump(dict(schema_note='S463f scratch dump', editions=D['editions'], books=D['books'], parse_match={}, live=live, cards=cards, members=mem, threads=th), open(file, 'w'), ensure_ascii=False, default=str)

    def run_migs():
        out = ''
        for m in MIGS:
            r = subprocess.run([sys.executable, str(HERE / 'apply_migration.py'), str(m)], env=dict(os.environ, DATABASE_URL=URL), capture_output=True, text=True)
            out += r.stdout + r.stderr
            if r.returncode != 0: return r.returncode, out
        return 0, out
    tamper = os.environ.get('S463F_TAMPER')
    if tamper == 'text':
        await con.execute("UPDATE verses SET text = text || ' x' WHERE id = $1", vs['lightfoot-apostolic-fathers|hermas|9:1'])
        rc, out = run_migs()
        n = await con.fetchval("SELECT count(*) FROM cross_references WHERE id = 50090 AND note LIKE '%(1 Clement 1:4)%' AND note LIKE '%Genesis 4:8 —%'")
        landed = await con.fetchval("SELECT count(*) FROM cross_references x JOIN verses v ON v.id=x.source_verse_id JOIN chapters c ON c.id=v.chapter_id WHERE x.id=50096 AND v.verse_number=13")
        print('GUARD text -> rc', rc, '| raised:', 'text differs' in out, '| card 50096 still at 1:12 (nothing landed):', landed == 0); return
    if tamper == 'moved':
        await con.execute("UPDATE cross_references SET source_verse_id=$1 WHERE id=50097", vs['lightfoot-apostolic-fathers|1-clement|1:30'])
        rc, out = run_migs()
        where = await con.fetchval("SELECT v.verse_number FROM cross_references x JOIN verses v ON v.id=x.source_verse_id WHERE x.id=50097")
        print('GUARD moved -> rc', rc, '| 50097 left at 1:', where, '| summary lines:', [l for l in out.splitlines() if 'summary:' in l or 'SKIPPED' in l or '50097' in l][:4]); return
    rc, out = run_migs(); print('run 1 rc', rc); print('\n'.join(l for l in out.splitlines() if 'NOTICE' in l or 'summary' in l or 'rror' in l)[:3000])
    await dump(HERE / 'out' / 'scratch_run1.json')
    print(subprocess.run([sys.executable, str(HERE / '_s463f_check.py'), str(HERE / 'out' / 'scratch_run1.json')], capture_output=True, text=True).stdout)
    snap = lambda: con.fetch("select id, source_verse_id, target_verse_id, note from cross_references order by id")
    s1 = json.dumps([dict(r) for r in await snap()]) + json.dumps([dict(r) for r in await con.fetch("select id, summary_md, title, anchor_verse_id_start from cross_reference_threads order by id")]) + json.dumps([dict(r) for r in await con.fetch("select thread_id, cross_reference_id, member_note from cross_reference_thread_members order by 1,2")]) + json.dumps([dict(r) for r in await con.fetch("select id, text from verses order by id")])
    rc, out = run_migs(); print('run 2 rc', rc); print('\n'.join(l for l in out.splitlines() if 'summary' in l))
    s2 = json.dumps([dict(r) for r in await snap()]) + json.dumps([dict(r) for r in await con.fetch("select id, summary_md, title, anchor_verse_id_start from cross_reference_threads order by id")]) + json.dumps([dict(r) for r in await con.fetch("select thread_id, cross_reference_id, member_note from cross_reference_thread_members order by 1,2")]) + json.dumps([dict(r) for r in await con.fetch("select id, text from verses order by id")])
    print('run 2 changed nothing:', s1 == s2)
    await dump(HERE / 'out' / 'scratch_run2.json')
    print(subprocess.run([sys.executable, str(HERE / '_s463f_check.py'), str(HERE / 'out' / 'scratch_run2.json')], capture_output=True, text=True).stdout)
    await con.close()
asyncio.run(main())
