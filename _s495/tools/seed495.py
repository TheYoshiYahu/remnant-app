"""S495 — seed495.py <book> [--tamper text|dup]  — scratch rehearsal of sql/session495_<book>_gap_fill.sql on the LOCAL Postgres 16.
Drops and recreates database s495_<book> (role s495/s495), loads schema.sql (minus CREATE EXTENSION / gin_trgm_ops), seeds it from the
live read-back exactly as seed463f.py did (editions / books / chapters / verses from the live map + card ends + thread anchors, cards
with their ids, every thread of the book, member rows) PLUS stub verses for every TARGET verse of fix/<book>.json (the fix's tgt_text: live
when a read-back carries the verse, else parsed — so the lookup view resolves them; canon stubs carry the parsed wording — the scratch cannot reproduce the live modernised canon text and no check depends on it). Then runs the migration TWICE through ref/apply_migration.py (the deploy path; a tiny wrapper
attaches an asyncpg log listener so the NOTICE summary is visible — apply_migration.py itself swallows notices), dumps after run 1 in
the read-back shape to scratch/<book>_run1.json, runs check495.py on it, and after run 2 asserts the full snapshot is unchanged and the
summary reports 0 inserted. --tamper text: one source verse's live text changed before run 1 → expect RAISE and nothing landed.
--tamper dup: one new card pre-inserted → expect it reported already present and the rest landed. Prints PASS/FAIL per check.
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import asyncio, json, sys, os, subprocess, re
from pathlib import Path
import asyncpg
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common495 import *
from dump495 import dump_book

ADMIN = 'postgresql://s495:s495@localhost/s495'
RUNNER = '''import sys, runpy, asyncpg
_orig = asyncpg.connect
async def _connect(*a, **k):
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

async def main(book, tamper):
    ed = BOOKS[book]; stem = stem_of(book); fx = load_book_fix(book); D = load_live(book)
    dbname = 's495_' + stem.strip('_').replace('-', '_'); URL = f'postgresql://s495:s495@localhost/{dbname}'
    MIG = W / 'sql' / f'session495_{stem}_gap_fill.sql'
    SCR = W / 'scratch'; SCR.mkdir(exist_ok=True)
    runner = SCR / '_apply_with_notices.py'; runner.write_text(RUNNER)
    admin = await asyncpg.connect(ADMIN)
    await admin.execute(f'DROP DATABASE IF EXISTS "{dbname}"'); await admin.execute(f'CREATE DATABASE "{dbname}"'); await admin.close()
    con = await asyncpg.connect(URL)
    schema = '\n'.join(l for l in (W / 'ref' / 'schema.sql').read_text().split('\n') if 'CREATE EXTENSION' not in l and 'gin_trgm_ops' not in l)
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
        await con.execute("INSERT INTO cross_reference_threads (id,slug,title,summary_md,sort_order,tier_required,anchor_verse_id_start,anchor_verse_id_end) VALUES ($1,$2,$3,$4,$5,$6,$7,$8) ON CONFLICT DO NOTHING", t['id'], t['slug'], t['title'], t['summary_md'] or '', t['sort_order'] or 0, t['tier'], a, z)
    seen = set()
    for m in D['members']:
        k = (m['thread_id'], m['xref_id'])
        if k in seen or m['xref_id'] not in ids: continue
        seen.add(k)
        await con.execute("INSERT INTO cross_reference_threads (id,slug,title,summary_md) VALUES ($1,$2,$2,'') ON CONFLICT DO NOTHING", m['thread_id'], m['slug'])
        await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,$3,$4)", m['thread_id'], m['xref_id'], m['sort_order'], m['member_note'])
    await con.execute("SELECT setval('cross_reference_threads_id_seq', (SELECT max(id) FROM cross_reference_threads))")
    # stub verses for every target of the fix, from the parsed files
    stubs = 0
    for c in fx['cards']:
        k = f"{c['tgt_edition']}|{c['tgt_book']}|{c['tgt_ch']}:{c['tgt_vn']}"
        if k not in vs:
            await v_(c['tgt_edition'], c['tgt_book'], c['tgt_ch'], c['tgt_vn'], c['tgt_text']); stubs += 1   # the fix's tgt_text = live text when a read-back carries it, else parsed
    await con.execute("INSERT INTO schema_version (id, version) VALUES (1, 'scratch-s495') ON CONFLICT DO NOTHING")
    print(f"seeded {dbname}: verses {await con.fetchval('select count(*) from verses')} (target stubs {stubs}) | cards {len(D['cards'])} | threads {await con.fetchval('select count(*) from cross_reference_threads')} | members {len(seen)}")

    def run_mig():
        r = subprocess.run([sys.executable, str(runner), str(W / 'ref' / 'apply_migration.py'), str(MIG)], env=dict(os.environ, DATABASE_URL=URL), capture_output=True, text=True)
        return r.returncode, r.stdout + r.stderr
    def summary(out): return next((l for l in out.splitlines() if 'S495' in l and 'summary' in l), '')
    async def snapshot():
        parts = [await con.fetch("select id, source_verse_id, target_verse_id, source, note, tier_required::text from cross_references order by id"),
                 await con.fetch("select id, slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required::text, sort_order from cross_reference_threads order by id"),
                 await con.fetch("select thread_id, cross_reference_id, sort_order, member_note from cross_reference_thread_members order by 1,2"),
                 await con.fetch("select id, text from verses order by id")]
        return json.dumps([[dict(r) for r in p] for p in parts], default=str)
    base_cards = await con.fetchval('select count(*) from cross_references'); base_thr = await con.fetchval('select count(*) from cross_reference_threads'); base_mem = await con.fetchval('select count(*) from cross_reference_thread_members')
    nc, nt, nm = len(fx['cards']), len(fx['threads']), len(fx['members'])

    if tamper == 'text':
        c0 = fx['cards'][0]; before = await snapshot()
        await con.execute("UPDATE verses SET text = text || ' x' WHERE id = $1", vs[f"{ed}|{book}|{c0['src_ch']}:{c0['src_vn']}"])
        before_t = await snapshot()
        rc, out = run_mig()
        report('tamper text: migration RAISED', rc != 0 and 'differs from the read-back' in out, f"rc {rc}; " + next((l for l in out.splitlines() if 'S495' in l), out[-300:]))
        report('tamper text: nothing landed', await snapshot() == before_t, f"cards {await con.fetchval('select count(*) from cross_references')} (seeded {base_cards})")
    elif tamper == 'dup':
        c0 = fx['cards'][0]
        s = vs[f"{ed}|{book}|{c0['src_ch']}:{c0['src_vn']}"]; t = vs[f"{c0['tgt_edition']}|{c0['tgt_book']}|{c0['tgt_ch']}:{c0['tgt_vn']}"]
        await con.execute("INSERT INTO cross_references (source_verse_id,target_verse_id,source,note,tier_required) VALUES ($1,$2,'manual',$3,$4)", s, t, c0['note'], c0['tier'])
        rc, out = run_mig(); sm = summary(out)
        report('tamper dup: migration committed', rc == 0, f"rc {rc}")
        report('tamper dup: summary reports 1 card already there, the rest inserted', f"cards inserted {nc - 1} / already there 1;" in sm, sm)
        report('tamper dup: every new card present exactly once', await con.fetchval('select count(*) from cross_references') == base_cards + nc and await con.fetchval("select count(*) from (select source_verse_id, target_verse_id, source from cross_references group by 1,2,3 having count(*) > 1) d") == 0)
        report('tamper dup: all threads + members landed', await con.fetchval('select count(*) from cross_reference_threads') == base_thr + nt and await con.fetchval('select count(*) from cross_reference_thread_members') == base_mem + nm)
    else:
        rc, out = run_mig(); sm = summary(out)
        report('run 1: migration committed', rc == 0, f"rc {rc}" + ('' if rc == 0 else '; ' + out[-600:]))
        report('run 1: summary counts', sm.endswith(f"cards inserted {nc} / already there 0; threads inserted {nt} / already there 0; members inserted {nm} / already there 0"), sm)
        d1 = await dump_book(con, ed, book, note='S495 scratch dump run 1'); p1 = SCR / f'{stem}_run1.json'
        json.dump(d1, open(p1, 'w'), ensure_ascii=False, default=str)
        chk = subprocess.run([sys.executable, str(W / 'tools' / 'check495.py'), book, str(p1)], capture_output=True, text=True, env=os.environ)
        print(chk.stdout + chk.stderr)
        report('run 1: check495 on the dump', chk.returncode == 0)
        s1 = await snapshot()
        rc, out = run_mig(); sm = summary(out)
        report('run 2: migration committed', rc == 0, f"rc {rc}")
        report('run 2: summary reports 0 inserted everywhere', sm.endswith(f"cards inserted 0 / already there {nc}; threads inserted 0 / already there {nt}; members inserted 0 / already there {nm}"), sm)
        s2 = await snapshot()
        report('run 2: full snapshot identical to post-run-1', s1 == s2)
        d2 = await dump_book(con, ed, book, note='S495 scratch dump run 2'); p2 = SCR / f'{stem}_run2.json'
        json.dump(d2, open(p2, 'w'), ensure_ascii=False, default=str)
    await con.close()
    ok = all(results); print(f"seed495 {book}{' --tamper ' + tamper if tamper else ''}: {'PASS' if ok else 'FAIL'} ({sum(results)}/{len(results)})")
    return 0 if ok else 1

if __name__ == '__main__':
    if len(sys.argv) < 2 or sys.argv[1] not in BOOKS: sys.exit(__doc__)
    tamper = None
    if '--tamper' in sys.argv: tamper = sys.argv[sys.argv.index('--tamper') + 1]
    sys.exit(asyncio.run(main(sys.argv[1], tamper)))
