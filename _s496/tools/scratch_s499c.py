"""S499c scratch — seeds s499c from live/canon__matthew.json (the Nov 13 20:11 read-back) the way seed496 does, runs the migration twice via
apply_migration.py, asserts: run 1 all counts land, nothing outside the fix changed; run 2 reports 0 and snapshot identical; tampers (note / mnote /
thread summary / text) RAISE with nothing landed. Model: Claude Fable 5.1."""
import asyncio, json, sys, os, subprocess
from pathlib import Path
import asyncpg
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *
from seed496 import RUNNER
ADMIN = 'postgresql://s496:s496@localhost/s496'
fx = json.load(open(W6 / 'c15' / 'fix.json')); D = load_live_book('matthew')
MIG = W6 / 'c15' / 'session499c_matthew_15_canaanite_thread.sql'; SCR = W6 / 'c15'; runner = SCR / '_apply_with_notices.py'; runner.write_text(RUNNER)
APPLY = W6 / 'ref' / 'apply_migration.py'; SCHEMA = W6 / 'ref' / 'schema.sql'
results = []
def report(name, ok, detail=''): results.append(ok); print(f"{'PASS' if ok else 'FAIL'}: {name}" + (f" — {detail}" if detail else ''), flush=True)
async def seed(dbname):
    URL = f'postgresql://s496:s496@localhost/{dbname}'
    admin = await asyncpg.connect(ADMIN); await admin.execute(f'DROP DATABASE IF EXISTS "{dbname}"'); await admin.execute(f'CREATE DATABASE "{dbname}"'); await admin.close()
    con = await asyncpg.connect(URL)
    schema = '\n'.join(l for l in SCHEMA.read_text().split('\n') if 'CREATE EXTENSION' not in l and 'gin_trgm_ops' not in l); await con.execute(schema)
    titles = {b['ed'] + '|' + b['slug']: b for b in D['books']}; eds, bks, chs, vs = {}, {}, {}, {}
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
    for k in sorted(D['live'], key=keyf):
        e, b, c, v = keyf(k); await v_(e, b, c, v, D['live'][k])
    for c in D['cards']:
        s = await v_(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text']); t = await v_(c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
        await con.execute("INSERT INTO cross_references (id,source_verse_id,target_verse_id,source,note,tier_required) VALUES ($1,$2,$3,$4,$5,$6)", c['id'], s, t, c['source'], c['note'], c['tier'])
    ids = {c['id'] for c in D['cards']}
    for t in D['threads']:
        a = await v_(t['a_ed'], t['a_book'], t['a_ch'], t['a_vn'], D['live'].get(f"{t['a_ed']}|{t['a_book']}|{t['a_ch']}:{t['a_vn']}", 'stub anchor')) if t['a_ed'] else None
        z = await v_(t['a_ed'], t['a_book'], t['z_ch'], t['z_vn'], D['live'].get(f"{t['a_ed']}|{t['a_book']}|{t['z_ch']}:{t['z_vn']}", 'stub anchor')) if (t['a_ed'] and t['z_vn'] is not None) else None
        await con.execute("INSERT INTO cross_reference_threads (id,slug,title,summary_md,sort_order,tier_required,anchor_verse_id_start,anchor_verse_id_end) VALUES ($1,$2,$3,$4,$5,$6,$7,$8)", t['id'], t['slug'], t['title'], t['summary_md'] or '', t['sort_order'] or 0, t['tier'], a, z)
    seen = set()
    for m in D['members']:
        k = (m['thread_id'], m['xref_id'])
        if k in seen or m['xref_id'] not in ids: continue
        seen.add(k); await con.execute("INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,$3,$4)", m['thread_id'], m['xref_id'], m['sort_order'], m['member_note'])
    await con.execute("INSERT INTO schema_version (id, version) VALUES (1, 'scratch-s499c') ON CONFLICT DO NOTHING")
    return con, URL, vs
def run_mig(URL):
    r = subprocess.run([sys.executable, str(runner), str(APPLY), str(MIG)], env=dict(os.environ, DATABASE_URL=URL), capture_output=True, text=True); return r.returncode, r.stdout + r.stderr
def summary(out): return next((l for l in out.splitlines() if 'S499c' in l and 'summary' in l), out[-400:])
async def snapshot(con):
    return [[dict(r) for r in await con.fetch(q)] for q in ("select id, source_verse_id, target_verse_id, source, note, tier_required::text from cross_references order by id",
            "select id, slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required::text, sort_order from cross_reference_threads order by id",
            "select thread_id, cross_reference_id, sort_order, member_note from cross_reference_thread_members order by 1,2", "select id, text from verses order by id")]
async def main():
    fixed = {c['id']: c for c in fx['cards']}; tid = fx['thread']['id']; nc = len(fixed)
    con, URL, vs = await seed('s499c'); s0 = await snapshot(con)
    rc, out = run_mig(URL); sm = summary(out)
    report('run 1: committed', rc == 0, f'rc {rc}' + ('' if rc == 0 else out[-600:]))
    report('run 1: counts', sm.endswith(f"notes rewritten {nc} / already there 0; member notes rewritten {nc} / already there 0; thread rewritten 1 / already there 0"), sm)
    s1 = await snapshot(con)
    ok = len(s1[0]) == len(s0[0]) and all((a == b) if a['id'] not in fixed else ({k: v for k, v in a.items() if k != 'note'} == {k: v for k, v in b.items() if k != 'note'} and b['note'] == fixed[a['id']]['note']) for a, b in zip(s0[0], s1[0]))
    ok &= all((a == b) if a['id'] != tid else (a['slug'] == b['slug'] and b['title'] == fx['thread']['title'] and b['summary_md'] == fx['thread']['summary'] and {k: a[k] for k in a if k not in ('title', 'summary_md')} == {k: b[k] for k in b if k not in ('title', 'summary_md')}) for a, b in zip(s0[1], s1[1]))
    ok &= len(s1[2]) == len(s0[2]) and all((a == b) if a['cross_reference_id'] not in fixed else ({k: v for k, v in a.items() if k != 'member_note'} == {k: v for k, v in b.items() if k != 'member_note'} and (b['member_note'] == fixed[a['cross_reference_id']]['member_note'] if a['thread_id'] == fixed[a['cross_reference_id']]['thread_id'] else a == b)) for a, b in zip(s0[2], s1[2]))
    ok &= s1[3] == s0[3]
    report('run 1: every fixed note/member/thread equals the fix and nothing else changed', bool(ok))
    rc, out = run_mig(URL); sm = summary(out)
    report('run 2: committed', rc == 0); report('run 2: 0 everywhere', sm.endswith(f"notes rewritten 0 / already there {nc}; member notes rewritten 0 / already there {nc}; thread rewritten 0 / already there 1"), sm)
    report('run 2: snapshot identical', await snapshot(con) == s1); await con.close()
    for tamper in ('note', 'mnote', 'thread', 'text'):
        con, URL, vs = await seed('s499c_' + tamper); c0 = fx['cards'][0]
        if tamper == 'note': await con.execute("UPDATE cross_references SET note = note || ' x' WHERE id=$1", c0['id']); want = 'live note of card'
        elif tamper == 'mnote': await con.execute("UPDATE cross_reference_thread_members SET member_note = member_note || ' x' WHERE cross_reference_id=$1 AND thread_id=$2", c0['id'], c0['thread_id']); want = 'no member row'
        elif tamper == 'thread': await con.execute("UPDATE cross_reference_threads SET summary_md = summary_md || ' x' WHERE id=$1", tid); want = 'title/summary differ'
        else: await con.execute("UPDATE verses SET text = text || ' x' WHERE id=$1", vs[f"canon|matthew|{c0['src_ch']}:{c0['src_vn']}"]); want = 'differs from the read-back'
        before = await snapshot(con); rc, out = run_mig(URL)
        report(f'tamper {tamper}: RAISED', rc != 0 and want in out, next((l for l in out.splitlines() if 'S499c' in l), out[-200:])[:160])
        report(f'tamper {tamper}: nothing landed', await snapshot(con) == before); await con.close()
    print('scratch_s499c:', 'PASS' if all(results) else 'FAIL', f'({sum(results)}/{len(results)})'); return 0 if all(results) else 1
sys.exit(asyncio.run(main()))
