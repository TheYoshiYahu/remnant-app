"""S496 — seed496.py <batch> [--tamper text|note|threaded|anchor|partial]  — scratch rehearsal of sql/session496_<book>_<batch>_rebuild.sql
on the LOCAL Postgres 16. Drops and recreates database s496_<batch> (role s496/s496), loads ref/schema.sql (minus CREATE EXTENSION /
gin_trgm_ops), seeds it from the live read-back of the book (every verse, every card with its id and both ends, every thread with its id
and anchor, every member row) plus stub verses for the anchors the fix sets. Runs the migration TWICE through ref/apply_migration.py (the
deploy path, wrapped so NOTICE lines show), dumps after run 1 in the read-back shape, runs check496.py on the dump, and after run 2
asserts the full snapshot is unchanged and the summary reports 0 everywhere. Also asserts NOTHING outside the fix changed (every other
card note, every other member row, every thread summary byte-identical to the seed).
Tampers (each: expect RAISE and nothing landed, except partial): text = a source verse's live text changed; note = a card's live note
edited since the dump; threaded = a card already put in some other thread; anchor = a thread to anchor already anchored elsewhere;
partial = one card already rewritten and threaded by hand → reported as already there, the rest landed.
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import asyncio, json, sys, os, subprocess
from pathlib import Path
import asyncpg
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *
from dump496 import dump_canon

ADMIN = 'postgresql://s496:s496@localhost/s496'
RUNNER = '''import sys, runpy, asyncpg
_orig = asyncpg.connect
async def _connect(*a, **k):
    k.pop('ssl', None)
    con = await _orig(*a, **k)
    con.add_log_listener(lambda c, m: print('NOTICE:', m.message, flush=True))
    return con
asyncpg.connect = _connect
sys.argv = [sys.argv[1]] + sys.argv[2:]
runpy.run_path(sys.argv[0], run_name='__main__')
'''
results = []
def report(name, ok, detail=''):
    results.append(ok); print(f"{'PASS' if ok else 'FAIL'}: {name}" + (f" — {detail}" if detail else ''), flush=True)

async def main(batch, tamper):
    book, chapters = BATCHES[batch]; stem = f'{book}_{batch}'; fx = json.load(open(W6 / 'fix' / f'{stem}.json')); D = load_live_book(book)
    dbname = f's496_{batch}' + (f'_{tamper}' if tamper else ''); URL = f'postgresql://s496:s496@localhost/{dbname}'
    MIG = W6 / 'sql' / f'session496_{stem}_rebuild.sql'; SCR = W6 / 'scratch'; SCR.mkdir(exist_ok=True)
    runner = SCR / '_apply_with_notices.py'; runner.write_text(RUNNER)
    admin = await asyncpg.connect(ADMIN)
    await admin.execute(f'DROP DATABASE IF EXISTS "{dbname}"'); await admin.execute(f'CREATE DATABASE "{dbname}"'); await admin.close()
    con = await asyncpg.connect(URL)
    SCHEMA = next(p for p in (W6 / 'ref' / 'schema.sql', W6.parent / 'data-schema' / 'schema.sql') if p.exists()); APPLY = next(p for p in (W6 / 'ref' / 'apply_migration.py', W6.parent / 'api' / 'apply_migration.py') if p.exists())
    schema = '\n'.join(l for l in SCHEMA.read_text().split('\n') if 'CREATE EXTENSION' not in l and 'gin_trgm_ops' not in l)
    await con.execute(schema)
    titles = {b['ed'] + '|' + b['slug']: b for b in D['books']}
    eds, bks, chs, vs = {}, {}, {}, {}
    async def e_(slug):
        if slug not in eds: eds[slug] = await con.fetchval("INSERT INTO editions (slug,title,public_domain_base,restoration_pipeline_version) VALUES ($1,$1,'x','phase4-v2') RETURNING id", slug)
        return eds[slug]
    async def b_(e, slug):
        k = e + '|' + slug
        if k not in bks:
            t = titles.get(k)
            bks[k] = await con.fetchval("INSERT INTO books (edition_id,slug,title,canonical_order,witness_category,tier_required) VALUES ($1,$2,$3,$4,'canon','free') RETURNING id", await e_(e), slug, t['title'] if t else slug, t['canonical_order'] if t else 0)
        return bks[k]
    async def c_(e, b, c):
        k = f"{e}|{b}|{c}"
        if k not in chs: chs[k] = await con.fetchval("INSERT INTO chapters (book_id,chapter_number) VALUES ($1,$2) RETURNING id", await b_(e, b), c)
        return chs[k]
    async def v_(e, b, c, v, text):
        k = f"{e}|{b}|{c}:{v}"
        if k not in vs: vs[k] = await con.fetchval("INSERT INTO verses (chapter_id,verse_number,text) VALUES ($1,$2,$3) RETURNING id", await c_(e, b, c), v, text)
        return vs[k]
    def keyf(k):
        e, b, cv = k.split('|'); c, v = map(int, cv.split(':')); return (e, b, c, v)
    for k in sorted(D['live'], key=keyf):
        e, b, c, v = keyf(k); await v_(e, b, c, v, D['live'][k])
    for c in D['cards']:
        s = await v_(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text']); t = await v_(c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
        await con.execute("INSERT INTO cross_references (id,source_verse_id,target_verse_id,source,note,tier_required) VALUES ($1,$2,$3,$4,$5,$6)", c['id'], s, t, c['source'], c['note'], c['tier'])
    await con.execute("SELECT setval('cross_references_id_seq', (SELECT max(id) FROM cross_references))")
    ids = {c['id'] for c in D['cards']}
    for t in D['threads']:
        a = await v_(t['a_ed'], t['a_book'], t['a_ch'], t['a_vn'], D['live'].get(f"{t['a_ed']}|{t['a_book']}|{t['a_ch']}:{t['a_vn']}", 'stub anchor')) if t['a_ed'] else None
        z = await v_(t['a_ed'], t['a_book'], t['z_ch'], t['z_vn'], D['live'].get(f"{t['a_ed']}|{t['a_book']}|{t['z_ch']}:{t['z_vn']}", 'stub anchor')) if (t['a_ed'] and t['z_vn'] is not None) else None
        await con.execute("INSERT INTO cross_reference_threads (id,slug,title,summary_md,sort_order,tier_required,anchor_verse_id_start,anchor_verse_id_end) VALUES ($1,$2,$3,$4,$5,$6,$7,$8)", t['id'], t['slug'], t['title'], t['summary_md'] or '', t['sort_order'] or 0, t['tier'], a, z)
    seen = set()
    for m in D['members']:
        k = (m['thread_id'], m['xref_id'])
        if k in seen or m['xref_id'] not in ids: continue
        seen.add(k)
        await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,$3,$4)", m['thread_id'], m['xref_id'], m['sort_order'], m['member_note'])
    await con.execute("SELECT setval('cross_reference_threads_id_seq', (SELECT max(id) FROM cross_reference_threads))")
    stubs = 0
    for a in fx['anchors']:
        for vn in (a['a_vn'], a['z_vn']):
            if f"canon|{a['book']}|{a['ch']}:{vn}" not in vs: await v_('canon', a['book'], a['ch'], vn, parsed_text('canon', a['book'], a['ch'], vn)); stubs += 1
    await con.execute("INSERT INTO schema_version (id, version) VALUES (1, 'scratch-s496') ON CONFLICT DO NOTHING")
    print(f"seeded {dbname}: verses {await con.fetchval('select count(*) from verses')} (anchor stubs {stubs}) | cards {len(D['cards'])} | threads {len(D['threads'])} | members {len(seen)}")

    def run_mig():
        r = subprocess.run([sys.executable, str(runner), str(APPLY), str(MIG)], env=dict(os.environ, DATABASE_URL=URL), capture_output=True, text=True)
        return r.returncode, r.stdout + r.stderr
    def summary(out): return next((l for l in out.splitlines() if 'S496' in l and 'summary' in l), '')
    def s496line(out): return next((l for l in out.splitlines() if 'S496' in l), out[-300:])
    async def snapshot():
        parts = [await con.fetch("select id, source_verse_id, target_verse_id, source, note, tier_required::text from cross_references order by id"),
                 await con.fetch("select id, slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required::text, sort_order from cross_reference_threads order by id"),
                 await con.fetch("select thread_id, cross_reference_id, sort_order, member_note from cross_reference_thread_members order by 1,2"),
                 await con.fetch("select id, text from verses order by id")]
        return [[dict(r) for r in p] for p in parts]
    nc, nt, na, nm = len(fx['cards']), len(fx['threads']), len(fx['anchors']), len(fx['members'])
    fixed = {c['id'] for c in fx['cards']}; anchored = {a['slug'] for a in fx['anchors']}; newt = {t['slug'] for t in fx['threads']}
    seed = await snapshot()
    def untouched(after):
        """everything the fix does not name is byte-identical to the seed"""
        a_c = {r['id']: r for r in after[0]}; ok = all(a_c.get(r['id']) == r for r in seed[0] if r['id'] not in fixed) and len(after[0]) == len(seed[0])
        ok &= all({k: v for k, v in r.items() if k != 'note'} == {k: v for k, v in a_c[r['id']].items() if k != 'note'} for r in seed[0] if r['id'] in fixed)
        a_t = {r['slug']: r for r in after[1]}
        for r in seed[1]:
            x = a_t.get(r['slug'])
            if x is None: return False
            keys = [k for k in r if not (r['slug'] in anchored and k.startswith('anchor_'))]
            ok &= all(x[k] == r[k] for k in keys)
        ok &= {r['slug'] for r in after[1]} - {r['slug'] for r in seed[1]} <= newt
        a_m = {(r['thread_id'], r['cross_reference_id']): r for r in after[2]}
        ok &= all(a_m.get((r['thread_id'], r['cross_reference_id'])) == r for r in seed[2])
        ok &= all(r['cross_reference_id'] in fixed for k, r in a_m.items() if k not in {(s['thread_id'], s['cross_reference_id']) for s in seed[2]})
        ok &= after[3] == seed[3]
        return bool(ok)

    if tamper in ('text', 'note', 'threaded', 'anchor'):
        c0 = fx['cards'][0]
        if tamper == 'text': await con.execute("UPDATE verses SET text = text || ' x' WHERE id = $1", vs[f"canon|{book}|{c0['src_ch']}:{c0['src_vn']}"]); want = 'differs from the read-back'
        elif tamper == 'note': await con.execute("UPDATE cross_references SET note = note || ' (edited)' WHERE id = $1", fx['cards'][-1]['id']); want = 'live note of card'
        elif tamper == 'threaded':
            other = next(t['id'] for t in D['threads'] if t['slug'] != c0['thread'])
            await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,999,'x')", other, c0['id']); want = 'already sits in a thread'
        else:
            if not fx['anchors']: print('no anchors in the fix — tamper anchor skipped'); await con.close(); return 0
            last = max((k for k in vs if k.startswith(f'canon|{book}|')), key=lambda k: tuple(map(int, k.split('|')[2].split(':'))))   # the book's last verse (Matthew 28:20, Mark 16:20, Luke 24:53)
            await con.execute("UPDATE cross_reference_threads SET anchor_verse_id_start = $1, anchor_verse_id_end = $1 WHERE slug = $2", vs[last], fx['anchors'][0]['slug']); want = 'already carries a different anchor'
        before = await snapshot(); rc, out = run_mig()
        report(f'tamper {tamper}: migration RAISED', rc != 0 and want in out, f"rc {rc}; " + s496line(out))
        report(f'tamper {tamper}: nothing landed', await snapshot() == before)
    elif tamper == 'partial':
        c0 = fx['cards'][0]
        await con.execute("UPDATE cross_references SET note = $1 WHERE id = $2", c0['note'], c0['id'])
        if c0['thread'] not in newt:
            await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) SELECT id,$1,500,$2 FROM cross_reference_threads WHERE slug=$3", c0['id'], c0['member_note'], c0['thread'])
        rc, out = run_mig(); sm = summary(out)
        report('tamper partial: migration committed', rc == 0, f"rc {rc}" + ('' if rc == 0 else '; ' + out[-400:]))
        em = 1 if c0['thread'] not in newt else 0
        report('tamper partial: summary reports 1 note (and its member) already there, the rest landed', f"notes rewritten {nc - 1} / already there 1;" in sm and f"members inserted {nm - em} / already there {em}" in sm, sm)
        report('tamper partial: every card carries its new note', await con.fetchval("select count(*) from cross_references where id = any($1::bigint[]) and note = any($2::text[])", list(fixed), [c['note'] for c in fx['cards']]) == nc)
    else:
        rc, out = run_mig(); sm = summary(out)
        report('run 1: migration committed', rc == 0, f"rc {rc}" + ('' if rc == 0 else '; ' + out[-800:]))
        report('run 1: summary counts', sm.endswith(f"notes rewritten {nc} / already there 0; threads inserted {nt} / already there 0; anchors set {na} / already there 0; members inserted {nm} / already there 0"), sm)
        s1 = await snapshot()
        report('run 1: nothing outside the fix changed (other notes, other members, every thread summary, every verse)', untouched(s1))
        d1 = await dump_canon(con, book, note='S496 scratch dump run 1'); p1 = SCR / f'{stem}_run1.json'
        json.dump(d1, open(p1, 'w'), ensure_ascii=False, default=str)
        chk = subprocess.run([sys.executable, str(W6 / 'tools' / 'check496.py'), batch, str(p1)], capture_output=True, text=True, env=os.environ)
        print(chk.stdout + chk.stderr)
        report('run 1: check496 on the dump', chk.returncode == 0)
        rc, out = run_mig(); sm = summary(out)
        report('run 2: migration committed', rc == 0, f"rc {rc}")
        report('run 2: summary reports 0 everywhere', sm.endswith(f"notes rewritten 0 / already there {nc}; threads inserted 0 / already there {nt}; anchors set 0 / already there {na}; members inserted 0 / already there {nm}"), sm)
        report('run 2: full snapshot identical to post-run-1', await snapshot() == s1)
    await con.close()
    ok = all(results); print(f"seed496 {batch}{' --tamper ' + tamper if tamper else ''}: {'PASS' if ok else 'FAIL'} ({sum(results)}/{len(results)})")
    return 0 if ok else 1

if __name__ == '__main__':
    if len(sys.argv) < 2 or sys.argv[1] not in BATCHES: sys.exit(__doc__)
    tamper = sys.argv[sys.argv.index('--tamper') + 1] if '--tamper' in sys.argv else None
    sys.exit(asyncio.run(main(sys.argv[1], tamper)))
