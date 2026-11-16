"""S503 — seed503x.py --mig <sql> --books canon/matthew[,...] --fix <fix.json> [--check "<cmd>"] — generic scratch rehearsal for the S503b (re-point)
and S503c (sweep) migrations on a LOCAL Postgres: seeds database s503x from the listed read-backs (as seed503 does), runs the migration TWICE through
apply_migration.py, asserts run 1 committed and changed ONLY what the fix names (the fix's card ids: note / target / member note; the fix's thread id:
title / summary — every other card, member, thread and verse byte-identical), re-dumps the books into scratch/live_x/ and runs --check on them, then
asserts run 2 reports 0 everywhere and leaves the snapshot identical. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import asyncio, json, sys, os, subprocess, argparse
from pathlib import Path
import asyncpg
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
from dump495 import dump_book
from seed496 import RUNNER
import seed503
ADMIN = os.environ.get('S503_ADMIN', 'postgresql://s496:s496@localhost/s496')
results = []
def report(name, ok, detail=''): results.append(ok); print(f"{'PASS' if ok else 'FAIL'}: {name}" + (f" — {detail}" if detail else ''), flush=True)
async def main(a):
    books = [tuple(b.split('/')) for b in a.books.split(',')]; DS = {(e, b): load503(e, b) for e, b in books}; fx = json.load(open(a.fix))
    ids = {c['id'] for c in fx['cards']}; tids = {fx['thread']['id']} if 'thread' in fx else set()
    dbname = 's503x'; URL = ADMIN.rsplit('/', 1)[0] + f'/{dbname}'; SCR = W3 / 'scratch'; SCR.mkdir(exist_ok=True); runner = SCR / '_apply_with_notices.py'; runner.write_text(RUNNER)
    SCHEMA = next(p for p in (W6 / 'ref' / 'schema.sql', W3.parent / 'data-schema' / 'schema.sql') if p.exists()); APPLY = next(p for p in (W6 / 'ref' / 'apply_migration.py', W3.parent / 'api' / 'apply_migration.py') if p.exists())
    admin = await asyncpg.connect(ADMIN); await admin.execute(f'DROP DATABASE IF EXISTS "{dbname}"'); await admin.execute(f'CREATE DATABASE "{dbname}"'); await admin.close()
    con = await asyncpg.connect(URL); await con.execute('\n'.join(l for l in SCHEMA.read_text().split('\n') if 'CREATE EXTENSION' not in l and 'gin_trgm_ops' not in l))
    # ---- seed (same as seed503) ----
    titles = {}; [titles.update({b['ed'] + '|' + b['slug']: b for b in D['books']}) for D in DS.values()]
    eds, bks, chs, vs = {}, {}, {}, {}
    async def e_(slug):
        if slug not in eds: eds[slug] = await con.fetchval("INSERT INTO editions (slug,title,public_domain_base,restoration_pipeline_version) VALUES ($1,$1,'x','phase4-v2') RETURNING id", slug)
        return eds[slug]
    async def b_(e, slug):
        k = e + '|' + slug
        if k not in bks:
            t = titles.get(k); bks[k] = await con.fetchval("INSERT INTO books (edition_id,slug,title,canonical_order,witness_category,tier_required) VALUES ($1,$2,$3,$4,'canon','free') RETURNING id", await e_(e), slug, t['title'] if t else slug, t['canonical_order'] if t else 0)
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
    allive = {}; [allive.update(D['live']) for D in DS.values()]
    for k in sorted(allive, key=keyf):
        e, b, c, v = keyf(k); await v_(e, b, c, v, allive[k])
    # the re-point needs the NEW target verses present too
    for c in fx['cards']:
        if c.get('t_ed') and c.get('tgt_book'): await v_(c['t_ed'], c['tgt_book'], c['tgt_ch'], c['tgt_vn'], c['tgt_text'])
    sc, st, sm = set(), set(), set()
    for D in DS.values():
        for c in D['cards']:
            if c['id'] in sc: continue
            sc.add(c['id']); s = await v_(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text']); t = await v_(c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
            await con.execute("INSERT INTO cross_references (id,source_verse_id,target_verse_id,source,note,tier_required) VALUES ($1,$2,$3,$4,$5,$6)", c['id'], s, t, c['source'], c['note'], c['tier'])
    await con.execute("SELECT setval('cross_references_id_seq', (SELECT max(id) FROM cross_references))")
    for D in DS.values():
        for t in D['threads']:
            if t['id'] in st: continue
            st.add(t['id'])
            aa = await v_(t['a_ed'], t['a_book'], t['a_ch'], t['a_vn'], allive.get(f"{t['a_ed']}|{t['a_book']}|{t['a_ch']}:{t['a_vn']}", 'stub anchor')) if t['a_ed'] else None
            zz = await v_(t['a_ed'], t['a_book'], t['z_ch'], t['z_vn'], allive.get(f"{t['a_ed']}|{t['a_book']}|{t['z_ch']}:{t['z_vn']}", 'stub anchor')) if (t['a_ed'] and t['z_vn'] is not None) else None
            await con.execute("INSERT INTO cross_reference_threads (id,slug,title,summary_md,sort_order,tier_required,anchor_verse_id_start,anchor_verse_id_end) VALUES ($1,$2,$3,$4,$5,$6,$7,$8)", t['id'], t['slug'], t['title'], t['summary_md'] or '', t['sort_order'] or 0, t['tier'], aa, zz)
    for D in DS.values():
        for m in D['members']:
            k = (m['thread_id'], m['xref_id'])
            if k in sm or m['xref_id'] not in sc: continue
            sm.add(k); await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,$3,$4)", m['thread_id'], m['xref_id'], m['sort_order'], m['member_note'])
    await con.execute("INSERT INTO schema_version (id, version) VALUES (1, 'scratch-s503x') ON CONFLICT DO NOTHING")
    print(f"seeded {dbname}: verses {await con.fetchval('select count(*) from verses')} | cards {len(sc)} | threads {len(st)} | members {len(sm)}")
    def run_mig():
        r = subprocess.run([sys.executable, str(runner), str(APPLY), a.mig], env=dict(os.environ, DATABASE_URL=URL), capture_output=True, text=True); return r.returncode, r.stdout + r.stderr
    def summary(out): return next((l for l in out.splitlines() if 'summary' in l and 'S503' in l), '')
    async def snapshot():
        return [[dict(r) for r in await con.fetch("select id, source_verse_id, target_verse_id, source, note, tier_required::text from cross_references order by id")],
                [dict(r) for r in await con.fetch("select id, slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required::text, sort_order from cross_reference_threads order by id")],
                [dict(r) for r in await con.fetch("select thread_id, cross_reference_id, sort_order, member_note from cross_reference_thread_members order by 1,2")],
                [dict(r) for r in await con.fetch("select id, text from verses order by id")]]
    seed = await snapshot()
    def only_fix_changed(after):
        ok = len(after[0]) == len(seed[0]) and all(r == s for r, s in zip(after[0], seed[0]) if r['id'] not in ids)
        ok &= all({k: v for k, v in r.items() if k not in ('note', 'target_verse_id')} == {k: v for k, v in s.items() if k not in ('note', 'target_verse_id')} for r, s in zip(after[0], seed[0]) if r['id'] in ids)
        ok &= len(after[1]) == len(seed[1]) and all(r == s for r, s in zip(after[1], seed[1]) if r['id'] not in tids)
        ok &= all({k: v for k, v in r.items() if k not in ('title', 'summary_md')} == {k: v for k, v in s.items() if k not in ('title', 'summary_md')} for r, s in zip(after[1], seed[1]) if r['id'] in tids)
        ok &= len(after[2]) == len(seed[2]) and all(r == s for r, s in zip(after[2], seed[2]) if r['cross_reference_id'] not in ids)
        ok &= all({k: v for k, v in r.items() if k != 'member_note'} == {k: v for k, v in s.items() if k != 'member_note'} for r, s in zip(after[2], seed[2]) if r['cross_reference_id'] in ids)
        ok &= after[3] == seed[3]; return bool(ok)
    rc, out = run_mig(); sm1 = summary(out)
    report('run 1: migration committed', rc == 0, f"rc {rc}" + ('' if rc == 0 else '; ' + out[-900:]))
    tchg = 'thread' in fx and (fx['thread'].get('old_title') != fx['thread'].get('title') or fx['thread'].get('old_summary') != fx['thread'].get('summary'))
    want = (f"notes rewritten {len(ids)} / already there 0; member notes rewritten {len(ids)} / already there 0; " if ids else '') + (f"thread rewritten {1 if tchg else 0} / already there {0 if tchg else 1}" if tids else '')
    report('run 1: summary', bool(sm1) and want in sm1, sm1 + ('' if want in sm1 else f'  (wanted: {want})'))
    s1 = await snapshot(); report('run 1: only what the fix names changed', only_fix_changed(s1))
    LD = SCR / 'live_x'; LD.mkdir(exist_ok=True)
    redump = [tuple(b.split('/')) for b in a.redump.split(',')] if a.redump else books
    for e, b in redump:
        d = await dump_book(con, e, b, note='S503x scratch dump'); json.dump(d, open(LD / f'{e}__{b}.json', 'w'), ensure_ascii=False, default=str)
    if a.check:
        chk = subprocess.run(a.check + (f" {LD}" if a.redump else f" {LD / (books[0][0] + '__' + books[0][1] + '.json')}"), shell=True, capture_output=True, text=True, env=os.environ); print(chk.stdout + chk.stderr); report('run 1: check on the dump', chk.returncode == 0)
    rc, out = run_mig(); sm2 = summary(out)
    report('run 2: committed and 0 everywhere', rc == 0 and bool(sm2) and not re.search(r"(?<!\d)[1-9]\d* / already there", sm2), sm2)
    report('run 2: snapshot identical to post-run-1', await snapshot() == s1)
    await con.close(); ok = all(results); print(f"seed503x {Path(a.mig).name}: {'PASS' if ok else 'FAIL'} ({sum(results)}/{len(results)})"); return 0 if ok else 1
if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('--mig', required=True); p.add_argument('--books', required=True); p.add_argument('--fix', required=True); p.add_argument('--check', default=''); p.add_argument('--redump', default='', help='S506: real book slugs to re-dump after run 1 (comma list); the fixture under --books seeds them. --check then gets the dump DIR appended')
    sys.exit(asyncio.run(main(p.parse_args())))
