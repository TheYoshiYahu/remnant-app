// S477 scratch — PGlite (Postgres in WASM; no Postgres server reachable from Claude's shells) seeded from the Oct 26 read-back
// (pseud-cards-live.json), then the migration run TWICE, with a read-back after each run.
// Run on the Mac (node 22, `npm install @electric-sql/pglite` in $HOME/pglite):
//   NODE_PATH=$HOME/pglite/node_modules node seed477.mjs
import { createRequire } from 'node:module'; import fs from 'node:fs'; import path from 'node:path';
const require = createRequire(import.meta.url);
const { PGlite } = require(path.join(process.env.NODE_PATH || (process.env.HOME + '/pglite/node_modules'), '@electric-sql/pglite'));
const HERE = path.dirname(new URL(import.meta.url).pathname);
const APP = path.resolve(HERE, '../../..');
const D = JSON.parse(fs.readFileSync(path.join(HERE, '..', 'pseud-cards-live.json')));
const M = JSON.parse(fs.readFileSync(path.join(HERE, 's477_map.json')));
const CM = JSON.parse(fs.readFileSync(path.join(HERE, 's477_cards_map.json')));
const MIG = fs.readFileSync(path.join(APP, 'data-schema/migrations/session477_adam_eve_4macc_text_lane.sql'), 'utf8').split('\n').filter(l => !l.startsWith('\\echo')).join('\n');
let schema = fs.readFileSync(path.join(APP, 'data-schema/schema.sql'), 'utf8')
  .split('\n').filter(l => !/CREATE EXTENSION/.test(l) && !/gin_trgm_ops/.test(l)).join('\n');
schema += `
CREATE TABLE IF NOT EXISTS kingdom_verses (id BIGSERIAL PRIMARY KEY, verse_id BIGINT NOT NULL REFERENCES verses(id) ON DELETE CASCADE, card_title TEXT);
CREATE TABLE IF NOT EXISTS red_pill_verses (id BIGSERIAL PRIMARY KEY, verse_id BIGINT NOT NULL REFERENCES verses(id) ON DELETE CASCADE, card_title TEXT);`;
const BOOKS = ['adam-eve', '4-maccabees'];
const db = new PGlite();
const notices = [];
await db.exec(schema);
const Q = async (s, p) => (await db.query(s, p)).rows;
// ---- seed editions / books / chapters / verses
const eds = new Map(); const bks = new Map(); const chs = new Map(); const vs = new Map();
async function ed(slug) { if (eds.has(slug)) return eds.get(slug); const r = await Q(`INSERT INTO editions (slug,title,public_domain_base,restoration_pipeline_version) VALUES ($1,$1,'x','phase4-v2') RETURNING id`, [slug]); eds.set(slug, r[0].id); return r[0].id; }
async function bk(e, slug) { const k = e + '|' + slug; if (bks.has(k)) return bks.get(k); const r = await Q(`INSERT INTO books (edition_id,slug,title,canonical_order,witness_category,tier_required) VALUES ($1,$2,$2,0,'canon','free') RETURNING id`, [await ed(e), slug]); bks.set(k, r[0].id); return r[0].id; }
async function ch(e, b, c) { const k = e + '|' + b + '|' + c; if (chs.has(k)) return chs.get(k); const r = await Q(`INSERT INTO chapters (book_id,chapter_number) VALUES ($1,$2) RETURNING id`, [await bk(e, b), c]); chs.set(k, r[0].id); return r[0].id; }
async function vv(e, b, c, v, text) { const k = e + '|' + b + '|' + c + ':' + v; if (vs.has(k)) return vs.get(k); const r = await Q(`INSERT INTO verses (chapter_id,verse_number,text) VALUES ($1,$2,$3) RETURNING id`, [await ch(e, b, c), v, text]); vs.set(k, r[0].id); return r[0].id; }
// the two books, every live verse, in order
for (const b of BOOKS) for (const k of Object.keys(D.live).filter(k => k.startsWith('pseudepigrapha|' + b + '|')).sort((a, b2) => { const [c1, v1] = a.split('|')[2].split(':').map(Number), [c2, v2] = b2.split('|')[2].split(':').map(Number); return c1 - c2 || v1 - v2; })) { const [e, bb, cv] = k.split('|'); const [c, v] = cv.split(':').map(Number); await vv(e, bb, c, v, D.live[k]); }
// cards touching the two books, with their other ends
const cards = D.cards.filter(c => (c.s_ed === 'pseudepigrapha' && BOOKS.includes(c.s_book)) || (c.t_ed === 'pseudepigrapha' && BOOKS.includes(c.t_book)));
for (const c of cards) {
  const s = await vv(c.s_ed, c.s_book, c.s_ch, c.s_vn, c.s_text); const t = await vv(c.t_ed, c.t_book, c.t_ch, c.t_vn, c.t_text);
  await Q(`INSERT INTO cross_references (id,source_verse_id,target_verse_id,source,note) VALUES ($1,$2,$3,'manual',$4)`, [c.id, s, t, c.note]);
}
const cardIds = new Set(cards.map(c => c.id));
const threads = D.threads.filter(t => D.members.some(m => m.thread_id === t.id && cardIds.has(m.xref_id)));
for (const t of threads) {
  const a = t.a_ed ? vs.get(`${t.a_ed}|${t.a_book}|${t.a_ch}:${t.a_vn}`) ?? null : null; const z = t.a_ed && t.z_ch ? vs.get(`${t.a_ed}|${t.a_book}|${t.z_ch}:${t.z_vn}`) ?? null : null;
  await Q(`INSERT INTO cross_reference_threads (id,slug,title,summary_md,anchor_verse_id_start,anchor_verse_id_end) VALUES ($1,$2,$3,$4,$5,$6)`, [t.id, t.slug, t.title, t.summary_md, a, z]);
}
for (const m of D.members.filter(m => cardIds.has(m.xref_id) && threads.some(t => t.id === m.thread_id))) await Q(`INSERT INTO cross_reference_thread_members (thread_id,cross_reference_id,sort_order,member_note) VALUES ($1,$2,$3,$4)`, [m.thread_id, m.xref_id, m.sort_order, m.member_note]);
// user data on swallowed lines (these must survive, re-pointed)
const u = (await Q(`INSERT INTO users (email) VALUES ('scratch@example.com') RETURNING id`))[0].id;
const swallowed = vs.get('pseudepigrapha|adam-eve|1:2'), swallowed2 = vs.get('pseudepigrapha|4-maccabees|1:3'), head = vs.get('pseudepigrapha|adam-eve|1:1');
await Q(`INSERT INTO bookmarks (user_id,verse_id) VALUES ($1,$2),($1,$3)`, [u, swallowed, swallowed2]);
await Q(`INSERT INTO bookmarks (user_id,verse_id) VALUES ($1,$2)`, [u, head]); // a bookmark already on the head: the swallowed one must be dropped, not collide
await Q(`INSERT INTO verse_highlights (user_id,verse_id,word_start,word_end) VALUES ($1,$2,1,3)`, [u, swallowed]);
await Q(`INSERT INTO study_notes (user_id,verse_id,body) VALUES ($1,$2,'n')`, [u, swallowed]);
await Q(`INSERT INTO reading_positions (user_id,verse_id) VALUES ($1,$2)`, [u, swallowed2]);
const con = (await Q(`INSERT INTO concepts (slug,title,summary) VALUES ('c','c','c') RETURNING id`))[0].id;
await Q(`INSERT INTO concept_verse_index (concept_id,verse_id) VALUES ($1,$2),($1,$3)`, [con, swallowed, head]);
await Q(`INSERT INTO commentary_entries (verse_id,body,surface_kind,tier_required) VALUES ($1,'b','inline','free')`, [swallowed]);
await Q(`INSERT INTO kingdom_verses (verse_id) VALUES ($1)`, [swallowed]); await Q(`INSERT INTO red_pill_verses (verse_id) VALUES ($1)`, [swallowed2]);
await Q(`INSERT INTO verse_words (verse_id,position,surface) VALUES ($1,1,'w')`, [swallowed]).catch(e => console.log('verse_words seed skipped:', e.message.slice(0, 60)));
console.log('seeded: verses', (await Q('select count(*) n from verses'))[0].n, 'cards', cards.length, 'threads', threads.length);
// ---- read-back
async function readback(label) {
  const out = {};
  for (const b of BOOKS) {
    const rows = await Q(`SELECT c.chapter_number ch, v.verse_number vn, v.text FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books bk ON bk.id=c.book_id WHERE bk.slug=$1 ORDER BY 1,2`, [b]);
    const want = M[b].new_verses; let ok = 0;
    for (const w of want) if (rows.some(r => r.ch === w.ch && r.vn === w.vn && r.text === w.text)) ok++;
    out[b] = { live: rows.length, expected: want.length, as_written: ok };
  }
  let cardsOk = 0, cardsBad = [];
  for (const r of CM.cards) {
    const x = (await Q(`SELECT x.source_verse_id s, x.target_verse_id t FROM cross_references x WHERE x.id=$1`, [r.xid]))[0];
    const want = (await Q(`SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id WHERE b.slug=$1 AND c.chapter_number=$2 AND v.verse_number=$3`, [r.book, ...r.new.split(':').map(Number)]))[0];
    if (x && want && ((r.side === 'S' && x.s === want.id) || (r.side === 'T' && x.t === want.id))) cardsOk++; else cardsBad.push(r.xid);
  }
  let anchOk = 0;
  for (const a of CM.anchors) {
    const t = (await Q(`SELECT anchor_verse_id_start a, anchor_verse_id_end z FROM cross_reference_threads WHERE id=$1`, [a.thread_id]))[0];
    const ida = (await Q(`SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id WHERE b.slug=$1 AND c.chapter_number=$2 AND v.verse_number=$3`, [a.book, ...a.new_start.split(':').map(Number)]))[0];
    const idz = a.new_end ? (await Q(`SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id WHERE b.slug=$1 AND c.chapter_number=$2 AND v.verse_number=$3`, [a.book, ...a.new_end.split(':').map(Number)]))[0] : null;
    if (t && ida && t.a === ida.id && (!idz || t.z === idz.id)) anchOk++;
  }
  const members = (await Q('select count(*) n from cross_reference_thread_members'))[0].n; const xr = (await Q('select count(*) n from cross_references'))[0].n;
  const user = { bookmarks: (await Q('select count(*) n from bookmarks'))[0].n, highlights: await Q('select verse_id,word_start,word_end from verse_highlights'), notes: (await Q('select count(*) n from study_notes'))[0].n, pos: (await Q('select count(*) n from reading_positions'))[0].n, cvi: (await Q('select count(*) n from concept_verse_index'))[0].n, comm: (await Q('select count(*) n from commentary_entries'))[0].n, kingdom: (await Q('select count(*) n from kingdom_verses'))[0].n, redpill: (await Q('select count(*) n from red_pill_verses'))[0].n, verse_words: (await Q('select count(*) n from verse_words'))[0].n };
  const dup = (await Q('select count(*) n from (select source_verse_id,target_verse_id,source from cross_references group by 1,2,3 having count(*)>1) d'))[0].n;
  const quotes = {}; // every card's own-book italic quotation still inside its verse
  console.log(`== read-back ${label}:`, JSON.stringify(out), `cards at new address ${cardsOk}/${CM.cards.length}`, cardsBad.slice(0, 10), `anchors ${anchOk}/${CM.anchors.length}`, `xrefs ${xr} members ${members} dup pairs ${dup}`, JSON.stringify(user));
  return { out, cardsOk, anchOk, xr, members };
}
await readback('before');
if (process.env.S477_TAMPER) {
  if (process.env.S477_TAMPER === 'text') await Q(`UPDATE verses SET text = text || ' x' WHERE id = $1`, [vs.get('pseudepigrapha|4-maccabees|3:9')]);
  if (process.env.S477_TAMPER === 'extra') await Q(`INSERT INTO verses (chapter_id, verse_number, text) VALUES ($1, 99, 'stray')`, [chs.get('pseudepigrapha|adam-eve|5')]);
  const before = JSON.stringify(await Q('select id, chapter_id, verse_number, text from verses order by id'));
  let err = null; try { await db.exec(MIG); } catch (e) { err = e.message; await db.exec('ROLLBACK'); }
  const after = JSON.stringify(await Q('select id, chapter_id, verse_number, text from verses order by id'));
  console.log('GUARD', process.env.S477_TAMPER, '-> raised:', err ? err.split('\n')[0].slice(0, 160) : 'NO ERROR', '| rolled back, nothing changed:', before === after);
  process.exit(0);
}
const t0 = Date.now(); await db.exec(MIG); console.log('run 1 done in', Date.now() - t0, 'ms');
const r1 = await readback('after run 1');
const snap1 = JSON.stringify(await Q('select id, chapter_id, verse_number, text from verses order by id')) + JSON.stringify(await Q('select id, source_verse_id, target_verse_id from cross_references order by id'));
await db.exec(MIG); console.log('run 2 done');
const r2 = await readback('after run 2');
const snap2 = JSON.stringify(await Q('select id, chapter_id, verse_number, text from verses order by id')) + JSON.stringify(await Q('select id, source_verse_id, target_verse_id from cross_references order by id'));
console.log('run 2 changed nothing:', snap1 === snap2);
// guard tests on fresh copies are in the deploy notes: live text changed -> RAISE (tested below on this db by tampering a verse after a rollback-free restore is not possible in PGlite without re-seeding; see test_guard477.mjs)
