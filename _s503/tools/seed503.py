"""S503 — seed503.py [--tamper text|note|threaded|partial] — scratch rehearsal of sql/session503_stragglers_rebuild.sql on a LOCAL Postgres.
Drops and recreates database s503 (role s496/s496, the S496 scratch role), loads ref/schema.sql (minus CREATE EXTENSION / gin_trgm_ops), seeds it
from the live read-backs of the EIGHT straggler books (every verse of every edition the dumps carry, every card with its id and both ends, every
thread with its id and anchor, every member row — de-duplicated across the dumps). Runs the migration TWICE through apply_migration.py (the deploy
path, wrapped so NOTICE lines show), re-dumps the eight books after run 1 into scratch/live_run1/, runs check503.py on them, and after run 2 asserts
the full snapshot is unchanged and the summary reports 0 everywhere. Also asserts NOTHING outside the fix changed. Tampers: text (a source verse's
live text changed), note (a card's live note edited), threaded (a card already in another thread) → expect RAISE and nothing landed; partial (one
card already rewritten and threaded by hand) → reported as already there, the rest landed. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import asyncio, json, sys, os, subprocess
from pathlib import Path
import asyncpg
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
from dump495 import dump_book
from seed496 import RUNNER
ADMIN = os.environ.get('S503_ADMIN', 'postgresql://s496:s496@localhost/s496')
results = []
def report(name, ok, detail=''): results.append(ok); print(f"{'PASS' if ok else 'FAIL'}: {name}" + (f" — {detail}" if detail else ''), flush=True)

async def main(tamper):
    fx = json.load(open(W3 / 'fix' / 'stragglers503.json')); DS = {(e, b): load503(e, b) for e, b in BOOKS503}
    dbname = 's503' + (f'_{tamper}' if tamper else ''); URL = ADMIN.rsplit('/', 1)[0] + f'/{dbname}'
    MIG = W3 / 'sql' / 'session503_stragglers_rebuild.sql'; SCR = W3 / 'scratch'; SCR.mkdir(exist_ok=True)
    runner = SCR / '_apply_with_notices.py'; runner.write_text(RUNNER)
    SCHEMA = next(p for p in (W6 / 'ref' / 'schema.sql', W3.parent / 'data-schema' / 'schema.sql') if p.exists()); APPLY = next(p for p in (W6 / 'ref' / 'apply_migration.py', W3.parent / 'api' / 'apply_migration.py') if p.exists())
    admin = await asyncpg.connect(ADMIN); await admin.execute(f'DROP DATABASE IF EXISTS "{dbname}"'); await admin.execute(f'CREATE DATABASE "{dbname}"'); await admin.close()
    con = await asyncpg.connect(URL)
    await con.execute('\n'.join(l for l in SCHEMA.read_text().split('\n') if 'CREATE EXTENSION' not in l and 'gin_trgm_ops' not in l))
    titles = {}
    for D in DS.values():
        for b in D['books']: titles[b['ed'] + '|' + b['slug']] = b
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
    allive = {}
    for D in DS.values(): allive.update(D['live'])
    for k in sorted(allive, key=keyf):
        e, b, c, v = keyf(k); await v_(e, b, c, v, allive[k])
    seen_cards, seen_threads, seen_m = set(), set(), set()
    for D in DS.values():
        for c in D['cards']:
            if c['id'] in seen_cards: continue
            seen_cards.add(c['id'])
            s = await v_(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text']); t = await v_(c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
            await con.execute("INSERT INTO cross_references (id,source_verse_id,target_verse_id,source,note,tier_required) VALUES ($1,$2,$3,$4,$5,$6)", c['id'], s, t, c['source'], c['note'], c['tier'])
    await con.execute("SELECT setval('cross_references_id_seq', (SELECT max(id) FROM cross_references))")
    for D in DS.values():
        for t in D['threads']:
            if t['id'] in seen_threads: continue
            seen_threads.add(t['id'])
            a = await v_(t['a_ed'], t['a_book'], t['a_ch'], t['a_vn'], allive.get(f"{t['a_ed']}|{t['a_book']}|{t['a_ch']}:{t['a_vn']}", 'stub anchor')) if t['a_ed'] else None
            z = await v_(t['a_ed'], t['a_book'], t['z_ch'], t['z_vn'], allive.get(f"{t['a_ed']}|{t['a_book']}|{t['z_ch']}:{t['z_vn']}", 'stub anchor')) if (t['a_ed'] and t['z_vn'] is not None) else None
            await con.execute("INSERT INTO cross_reference_threads (id,slug,title,summary_md,sort_order,tier_required,anchor_verse_id_start,anchor_verse_id_end) VALUES ($1,$2,$3,$4,$5,$6,$7,$8)", t['id'], t['slug'], t['title'], t['summary_md'] or '', t['sort_order'] or 0, t['tier'], a, z)
    for D in DS.values():
        for m in D['members']:
            k = (m['thread_id'], m['xref_id'])
            if k in seen_m or m['xref_id'] not in seen_cards: continue
            seen_m.add(k)
            await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,$3,$4)", m['thread_id'], m['xref_id'], m['sort_order'], m['member_note'])
    await con.execute("SELECT setval('cross_reference_threads_id_seq', (SELECT max(id) FROM cross_reference_threads))")
    await con.execute("INSERT INTO schema_version (id, version) VALUES (1, 'scratch-s503') ON CONFLICT DO NOTHING")
    print(f"seeded {dbname}: verses {await con.fetchval('select count(*) from verses')} | cards {len(seen_cards)} | threads {len(seen_threads)} | members {len(seen_m)}")

    def run_mig():
        r = subprocess.run([sys.executable, str(runner), str(APPLY), str(MIG)], env=dict(os.environ, DATABASE_URL=URL), capture_output=True, text=True)
        return r.returncode, r.stdout + r.stderr
    def summary(out): return next((l for l in out.splitlines() if 'S503' in l and 'summary' in l), '')
    def s503line(out): return next((l for l in out.splitlines() if 'S503' in l), out[-300:])
    async def snapshot():
        parts = [await con.fetch("select id, source_verse_id, target_verse_id, source, note, tier_required::text from cross_references order by id"),
                 await con.fetch("select id, slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required::text, sort_order from cross_reference_threads order by id"),
                 await con.fetch("select thread_id, cross_reference_id, sort_order, member_note from cross_reference_thread_members order by 1,2"),
                 await con.fetch("select id, text from verses order by id")]
        return [[dict(r) for r in p] for p in parts]
    nc, nm = len(fx['cards']), len(fx['members']); fixed = {c['id'] for c in fx['cards']}
    seed = await snapshot()
    def untouched(after):
        a_c = {r['id']: r for r in after[0]}; ok = all(a_c.get(r['id']) == r for r in seed[0] if r['id'] not in fixed) and len(after[0]) == len(seed[0])
        ok &= all({k: v for k, v in r.items() if k != 'note'} == {k: v for k, v in a_c[r['id']].items() if k != 'note'} for r in seed[0] if r['id'] in fixed)
        ok &= after[1] == seed[1]
        a_m = {(r['thread_id'], r['cross_reference_id']): r for r in after[2]}
        ok &= all(a_m.get((r['thread_id'], r['cross_reference_id'])) == r for r in seed[2])
        ok &= all(r['cross_reference_id'] in fixed for k, r in a_m.items() if k not in {(s['thread_id'], s['cross_reference_id']) for s in seed[2]})
        ok &= after[3] == seed[3]
        return bool(ok)
    if tamper in ('text', 'note', 'threaded'):
        c0 = fx['cards'][0]
        if tamper == 'text': await con.execute("UPDATE verses SET text = text || ' x' WHERE id = $1", vs[f"{c0['s_ed']}|{c0['s_book']}|{c0['src_ch']}:{c0['src_vn']}"]); want = 'differs from the read-back'
        elif tamper == 'note': await con.execute("UPDATE cross_references SET note = note || ' (edited)' WHERE id = $1", fx['cards'][-1]['id']); want = 'live note of card'
        else:
            other = next(t for t in seen_threads if t != c0['thread_id'])
            await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,999,'x')", other, c0['id']); want = 'already sits in a thread'
        before = await snapshot(); rc, out = run_mig()
        report(f'tamper {tamper}: migration RAISED', rc != 0 and want in out, f"rc {rc}; " + s503line(out))
        report(f'tamper {tamper}: nothing landed', await snapshot() == before)
    elif tamper == 'partial':
        c0 = fx['cards'][0]
        await con.execute("UPDATE cross_references SET note = $1 WHERE id = $2", c0['note'], c0['id'])
        await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,500,$3)", c0['thread_id'], c0['id'], c0['member_note'])
        rc, out = run_mig(); sm = summary(out)
        report('tamper partial: migration committed', rc == 0, f"rc {rc}" + ('' if rc == 0 else '; ' + out[-400:]))
        report('tamper partial: summary reports 1 already there, the rest landed', f"notes rewritten {nc - 1} / already there 1;" in sm and f"members inserted {nm - 1} / already there 1" in sm, sm)
    else:
        rc, out = run_mig(); sm = summary(out)
        report('run 1: migration committed', rc == 0, f"rc {rc}" + ('' if rc == 0 else '; ' + out[-800:]))
        report('run 1: summary counts', sm.endswith(f"notes rewritten {nc} / already there 0; members inserted {nm} / already there 0"), sm)
        s1 = await snapshot()
        report('run 1: nothing outside the fix changed (other notes, other members, every thread, every verse)', untouched(s1))
        LD = SCR / 'live_run1'; LD.mkdir(exist_ok=True)
        for e, b in BOOKS503:
            d = await dump_book(con, e, b, note='S503 scratch dump run 1'); json.dump(d, open(LD / f'{e}__{b}.json', 'w'), ensure_ascii=False, default=str)
        chk = subprocess.run([sys.executable, str(W3 / 'tools' / 'check503.py'), str(LD)], capture_output=True, text=True, env=os.environ)
        print(chk.stdout + chk.stderr)
        report('run 1: check503 on the dump', chk.returncode == 0)
        rc, out = run_mig(); sm = summary(out)
        report('run 2: migration committed', rc == 0, f"rc {rc}")
        report('run 2: summary reports 0 everywhere', sm.endswith(f"notes rewritten 0 / already there {nc}; members inserted 0 / already there {nm}"), sm)
        report('run 2: full snapshot identical to post-run-1', await snapshot() == s1)
    await con.close()
    ok = all(results); print(f"seed503{' --tamper ' + tamper if tamper else ''}: {'PASS' if ok else 'FAIL'} ({sum(results)}/{len(results)})")
    return 0 if ok else 1
if __name__ == '__main__':
    tamper = sys.argv[sys.argv.index('--tamper') + 1] if '--tamper' in sys.argv else None
    sys.exit(asyncio.run(main(tamper)))
