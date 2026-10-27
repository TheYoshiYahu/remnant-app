// S478 scratch — PGlite (Postgres in WASM) seeded from the post-S477 read-back (in/pseud-cards-live.json): the four pseudepigrapha
// editions' full live text, every card touching them (with ids), stub verses for the other ends, every member row and thread; then
// data-schema/migrations/session478_adam_eve_4macc_sweep.sql run TWICE, a dump written after each run in the read-back's own shape,
// and _s478_check.py run on each dump. Guards: S478_TAMPER=text (a live verse changed → RAISE + rollback) | moved (a card moved since
// the read-back → skipped with NOTICE).  Run on the Mac:  NODE_PATH=$HOME/pglite/node_modules node seed478.mjs
import { createRequire } from 'node:module'; import fs from 'node:fs'; import path from 'node:path'; import { execFileSync } from 'node:child_process';
const require = createRequire(import.meta.url);
const { PGlite } = require(path.join(process.env.NODE_PATH || (process.env.HOME + '/pglite/node_modules'), '@electric-sql/pglite'));
const HERE = path.dirname(new URL(import.meta.url).pathname); const APP = path.resolve(HERE, '../../..');
const D = JSON.parse(fs.readFileSync(path.join(HERE, 'in', 'pseud-cards-live.json')));
const MIG = fs.readFileSync(path.join(APP, 'data-schema/migrations/session478_adam_eve_4macc_sweep.sql'), 'utf8').split('\n').filter(l => !l.startsWith('\\echo')).join('\n');
let schema = fs.readFileSync(path.join(APP, 'data-schema/schema.sql'), 'utf8').split('\n').filter(l => !/CREATE EXTENSION/.test(l) && !/gin_trgm_ops/.test(l)).join('\n');
const EDS = new Set(['pseudepigrapha', 'adam-eve-conflict', 'apocalypse-of-abraham', 'ascension-isaiah']);
const db = new PGlite(); const notices = [];
await db.exec(schema);
const Q = async (s, p) => (await db.query(s, p)).rows;
const eds = new Map(), bks = new Map(), chs = new Map(), vs = new Map();
const titles = new Map(D.books.map(b => [b.ed + '|' + b.slug, b]));
async function ed(slug) { if (eds.has(slug)) return eds.get(slug); const r = await Q(`INSERT INTO editions (slug,title,public_domain_base,restoration_pipeline_version) VALUES ($1,$1,'x','phase4-v2') RETURNING id`, [slug]); eds.set(slug, r[0].id); return r[0].id; }
async function bk(e, slug) { const k = e + '|' + slug; if (bks.has(k)) return bks.get(k); const t = titles.get(k); const r = await Q(`INSERT INTO books (edition_id,slug,title,canonical_order,witness_category,tier_required) VALUES ($1,$2,$3,$4,'canon','free') RETURNING id`, [await ed(e), slug, t ? t.title : slug, t ? t.canonical_order : 0]); bks.set(k, r[0].id); return r[0].id; }
async function ch(e, b, c) { const k = e + '|' + b + '|' + c; if (chs.has(k)) return chs.get(k); const r = await Q(`INSERT INTO chapters (book_id,chapter_number) VALUES ($1,$2) RETURNING id`, [await bk(e, b), c]); chs.set(k, r[0].id); return r[0].id; }
async function vv(e, b, c, v, text) { const k = e + '|' + b + '|' + c + ':' + v; if (vs.has(k)) return vs.get(k); const r = await Q(`INSERT INTO verses (chapter_id,verse_number,text) VALUES ($1,$2,$3) RETURNING id`, [await ch(e, b, c), v, text]); vs.set(k, r[0].id); return r[0].id; }
const keys = Object.keys(D.live).sort((a, b2) => { const [ea, ba, ca] = a.split('|'), [eb, bb, cb] = b2.split('|'); if (ea !== eb) return ea < eb ? -1 : 1; if (ba !== bb) return ba < bb ? -1 : 1; const [c1, v1] = ca.split(':').map(Number), [c2, v2] = cb.split(':').map(Number); return c1 - c2 || v1 - v2; });
for (const k of keys) { const [e, b, cv] = k.split('|'); const [c, v] = cv.split(':').map(Number); await vv(e, b, c, v, D.live[k]); }
for (const c of D.cards) {
  const s = await vv(c.s_ed, c.s_book, c.s_ch, c.s_vn, c.s_text); const t = await vv(c.t_ed, c.t_book, c.t_ch, c.t_vn, c.t_text);
  await Q(`INSERT INTO cross_references (id,source_verse_id,target_verse_id,source,note,tier_required) VALUES ($1,$2,$3,$4,$5,$6)`, [c.id, s, t, c.source, c.note, c.tier]);
}
const cardIds = new Set(D.cards.map(c => c.id));
for (const t of D.threads) {
  const a = EDS.has(t.a_ed) ? vs.get(`${t.a_ed}|${t.a_book}|${t.a_ch}:${t.a_vn}`) ?? null : null; const z = EDS.has(t.a_ed) && t.z_vn ? vs.get(`${t.a_ed}|${t.a_book}|${t.z_ch}:${t.z_vn}`) ?? null : null;
  await Q(`INSERT INTO cross_reference_threads (id,slug,title,summary_md,sort_order,tier_required,anchor_verse_id_start,anchor_verse_id_end) VALUES ($1,$2,$3,$4,$5,$6,$7,$8) ON CONFLICT DO NOTHING`, [t.id, t.slug, t.title, t.summary_md, t.sort_order || 0, t.tier, a, z]);
}
const seenM = new Set();
for (const m of D.members) { const k = m.thread_id + '/' + m.xref_id; if (seenM.has(k) || !cardIds.has(m.xref_id)) continue; seenM.add(k);
  await Q(`INSERT INTO cross_reference_threads (id,slug,title,summary_md) VALUES ($1,$2,$2,'') ON CONFLICT DO NOTHING`, [m.thread_id, m.slug]);
  await Q(`INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,$3,$4)`, [m.thread_id, m.xref_id, m.sort_order, m.member_note]); }
console.log('seeded: verses', (await Q('select count(*) n from verses'))[0].n, 'cards', D.cards.length, 'threads', (await Q('select count(*) n from cross_reference_threads'))[0].n, 'members', seenM.size);
// ---- dump in the read-back's shape
async function dump(file) {
  const vrows = await Q(`SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id`);
  const byId = new Map(vrows.map(r => [r.id, r])); const live = {};
  for (const r of vrows) if (EDS.has(r.es)) live[`${r.es}|${r.bs}|${r.ch}:${r.vn}`] = r.text;
  const xr = await Q(`SELECT id, source_verse_id s, target_verse_id t, source, note, tier_required tier FROM cross_references ORDER BY id`);
  const cards = xr.map(x => { const s = byId.get(x.s), t = byId.get(x.t); return { id: x.id, note: x.note, tier: x.tier, source: x.source, s_ed: s.es, s_book: s.bs, s_ch: s.ch, s_vn: s.vn, s_text: s.text, t_ed: t.es, t_book: t.bs, t_ch: t.ch, t_vn: t.vn, t_text: t.text }; });
  const cm = new Map(cards.map(c => [c.id, c]));
  const mem = (await Q(`SELECT m.thread_id, m.cross_reference_id xref_id, m.sort_order, m.member_note, t.slug FROM cross_reference_thread_members m JOIN cross_reference_threads t ON t.id=m.thread_id ORDER BY 1,2`)).map(m => { const c = cm.get(m.xref_id); return { thread_id: m.thread_id, slug: m.slug, xref_id: m.xref_id, sort_order: m.sort_order, member_note: m.member_note, s_ed: c.s_ed, s_book: c.s_book, s_ch: c.s_ch, s_vn: c.s_vn, t_ed: c.t_ed, t_book: c.t_book, t_ch: c.t_ch, t_vn: c.t_vn }; });
  const th = (await Q(`SELECT id, slug, title, summary_md, sort_order, tier_required tier, anchor_verse_id_start a, anchor_verse_id_end z FROM cross_reference_threads ORDER BY id`)).map(t => { const a = t.a ? byId.get(t.a) : null, z = t.z ? byId.get(t.z) : null; return { id: t.id, slug: t.slug, title: t.title, summary_md: t.summary_md, sort_order: t.sort_order, tier: t.tier, a_ed: a ? a.es : null, a_book: a ? a.bs : null, a_ch: a ? a.ch : null, a_vn: a ? a.vn : null, z_ch: z ? z.ch : null, z_vn: z ? z.vn : null }; });
  fs.writeFileSync(file, JSON.stringify({ schema_note: 'S478 scratch dump', editions: D.editions, books: D.books, parse_match: {}, live, cards, members: mem, threads: th }));
}
db.onNotice = n => notices.push(n.message);
if (process.env.S478_TAMPER === 'text') {
  await Q(`UPDATE verses SET text = text || ' x' WHERE id = $1`, [vs.get('pseudepigrapha|4-maccabees|17:12')]);
  let err = null; try { await db.exec(MIG); } catch (e) { err = e.message; try { await db.exec('ROLLBACK'); } catch {} }
  const n = (await Q(`SELECT count(*) n FROM cross_references x WHERE x.id=4448 AND x.note LIKE '%(Matthew 10:28)%'`))[0].n;
  console.log('GUARD text -> raised:', err ? err.split('\n')[0].slice(0, 160) : 'NO ERROR', '| nothing landed:', n === 0 || n === '0'); process.exit(0);
}
if (process.env.S478_TAMPER === 'moved') {
  // move card 69439 to a different verse before the migration: it must be SKIPPED with a NOTICE, the rest must land
  const other = vs.get('pseudepigrapha|adam-eve|60:1'); await Q(`UPDATE cross_references SET source_verse_id=$1 WHERE id=69439`, [other]);
  await db.exec(MIG);
  const where = (await Q(`SELECT v.verse_number vn, c.chapter_number ch FROM cross_references x JOIN verses v ON v.id=x.source_verse_id JOIN chapters c ON c.id=v.chapter_id WHERE x.id=69439`))[0];
  console.log('GUARD moved -> 69439 left at', where, '| NOTICE:', notices.filter(n => /69439/.test(n)).join(' | ').slice(0, 200), '| summary:', notices.filter(n => /summary/.test(n)).join(' ').slice(0, 300)); process.exit(0);
}
let t0 = Date.now(); await db.exec(MIG); console.log('run 1 done in', Date.now() - t0, 'ms |', notices.filter(n => /summary|SKIPPED|absent/.test(n)).join('\n'));
await dump(path.join(HERE, 'out', 'scratch_run1.json')); notices.length = 0;
console.log(execFileSync('python3', [path.join(APP, '_s478_check.py'), path.join(HERE, 'out', 'scratch_run1.json')]).toString());
const snap1 = JSON.stringify(await Q('select id, source_verse_id, target_verse_id, note from cross_references order by id')) + JSON.stringify(await Q('select id, summary_md from cross_reference_threads order by id')) + JSON.stringify(await Q('select thread_id, cross_reference_id, member_note from cross_reference_thread_members order by 1,2'));
await db.exec(MIG); console.log('run 2 |', notices.filter(n => /summary|SKIPPED|absent/.test(n)).join('\n'));
const snap2 = JSON.stringify(await Q('select id, source_verse_id, target_verse_id, note from cross_references order by id')) + JSON.stringify(await Q('select id, summary_md from cross_reference_threads order by id')) + JSON.stringify(await Q('select thread_id, cross_reference_id, member_note from cross_reference_thread_members order by 1,2'));
console.log('run 2 changed nothing:', snap1 === snap2);
await dump(path.join(HERE, 'out', 'scratch_run2.json'));
console.log(execFileSync('python3', [path.join(APP, '_s478_check.py'), path.join(HERE, 'out', 'scratch_run2.json')]).toString());
