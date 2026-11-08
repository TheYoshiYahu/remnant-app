"""S463f — write ONE migration per edition (lightfoot-apostolic-fathers, sonnini-acts-29) from fix/fix_cards.json, fix/fix_members.json,
fix/fix_summaries.json, fix/fix_verses.json (+ the Nov 8 read-back af-cards-live.json). No card moves in this sweep: every card stays on
its verse; notes, member notes, summaries (and titles) and one OCR typo in the live text are rewritten under guards. Output dir = argv[1]."""
import json, sys, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
OUTDIR = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE
cards = {int(k): v for k, v in json.load(open(HERE / 'fix' / 'fix_cards.json')).items()}
members = json.load(open(HERE / 'fix' / 'fix_members.json'))
summaries = json.load(open(HERE / 'fix' / 'fix_summaries.json'))
live = json.load(open(HERE / 'af-cards-live.json')); L = live['live']
verses = json.load(open(HERE / 'fix' / 'fix_verses.json'))
anchors = json.load(open(HERE / 'fix' / 'fix_anchors.json'))
for a, v in verses.items(): L[a] = v['new']
C = {c['id']: c for c in live['cards']}; T = {t['id']: t for t in live['threads']}
EDS = {'lightfoot-apostolic-fathers', 'sonnini-acts-29'}
FILES = {'lightfoot-apostolic-fathers': 'session463f_apostolic_fathers_sweep.sql', 'sonnini-acts-29': 'session463f_sonnini_sweep.sql'}
TAG = {'lightfoot-apostolic-fathers': 's463f_af', 'sonnini-acts-29': 's463f_so'}

def q(s):
    assert '$n$' not in s
    return '$n$' + s + '$n$'
def addr(a):
    ed, b, cv = a.split('|'); c, v = cv.split(':'); return ed, b, int(c), int(v)
def card_ed(i):
    if i in cards: return cards[i]['old'].split('|')[0]
    c = C[i]; return c['s_ed'] if c['s_ed'] in EDS else c['t_ed']
def thread_ed(tid):
    t = T[tid]; return t['a_ed'] if t['a_ed'] in EDS else None

for ed, fname in FILES.items():
    tag = TAG[ed]
    rows = []; K = collections.Counter(); n_moves = 0
    for i, x in sorted(cards.items()):
        if x['old'].split('|')[0] != ed: continue
        oe, ob, oc, ov = addr(x['old']); ne, nb, nc, nv = addr(x['new']); assert oe == ne == ed
        rebuilt = x['kind'] == 'REBUILD'
        lv = L[x['new']]
        if rebuilt: assert lv in x['new_note'], (i, 'rebuilt note must quote the live verse verbatim')
        rows.append(f"({i},'{x['side']}','{ob}',{oc},{ov},'{nb}',{nc},{nv},{q(x['new_note'])},{q(lv)},{'true' if rebuilt else 'false'})")
        K[x['kind'].split(':')[0].split('+')[0]] += 1
        if '+MOVE' in x['kind']: K['MOVE'] += 1
        if x['old'] != x['new']: n_moves += 1
    mrows = [f"({m['thread_id']},{m['xref_id']},{q(m['new'])})" for m in members if card_ed(m['xref_id']) == ed]
    srows = [f"({s['thread_id']},{q(s['old'])},{q(s['new'])},{q(s['old_title'] or '')},{q(s['new_title'] or '')})" for s in summaries if thread_ed(s['thread_id']) == ed]
    vrows = [f"('{a.split('|')[1]}',{a.split('|')[2].split(':')[0]},{a.split('|')[2].split(':')[1]},{q(v['old'])},{q(v['new'])})" for a, v in verses.items() if a.split('|')[0] == ed]
    arows = [f"({tid},'{a['old'].split('|')[1]}',{a['old'].split('|')[2].split(':')[0]},{a['old'].split('|')[2].split(':')[1]},'{a['new'].split('|')[1]}',{a['new'].split('|')[2].split(':')[0]},{a['new'].split('|')[2].split(':')[1]})" for tid, a in anchors.items() if a['old'].split('|')[0] == ed]
    if not rows and not mrows and not srows and not vrows and not arows: print(ed, 'nothing'); continue
    books = sorted({addr(x['old'])[1] for x in cards.values() if x['old'].split('|')[0] == ed})
    desc = (f"--   {K.get('REBUILD',0)} cards on the canon side (S1xx-era framework prose) rebuilt Come-and-See — both whole verses in italics, cited, then plain prose;\n"
            f"--   {K.get('PROSE',0)} cards whose prose carried degraded markers / hyphen-chains / a paraphrase inside quotation marks / a bare 'the Lord': that sentence rewritten, all else kept;\n"
            f"--   {K.get('MECH',0)} cards fixed by script and verified by content: canon lead quotations re-quoted from parsed/canon.json (the NT-Lord rule), citations named in English\n"
            f"--   ('Ignatius 1:7' → 'Ignatius to the Ephesians 1:7', '(1:20)' → '(Martyrdom of Polycarp 1:20)', 'hermas 5:1' → 'Hermas 5:1', Hebrew book names → English);\n"
            f"--   {len(mrows)} thread member notes ride along; {len(srows)} thread summaries fixed (old summary must match exactly or the row is skipped), incl. the Hermas\n"
            f"--   Similitude 8–10 summaries that cited an older chapter numbering (23/24 → live 25/26/27) and every witness quotation re-quoted verbatim;\n"
            f"--   {n_moves} cards re-pointed to the verse their own words sit in (ids kept) — the S253 cards were written against a different chapter division; every move\n"
            f"--   agreed by two independent cold reads (Sonnet) by content; {len(arows)} thread anchors follow their member cards; {len(vrows)} live verse(s): the OCR typo 'Cod' → 'Elohim (God)'.")
    sql = f"""-- =====================================================================
-- Session 463f migration — 2026-11-08 — edition `{ed}` (books: {', '.join(books)}) — the last Phase-1 card-fidelity sweep
-- Apostolic Fathers (Lightfoot 1891) / Acts 29 (Sonnini) card sweep (the S463e/S463f chain), one migration per edition:
{desc}
-- Reads before this was written: Sonnet drafters (model named in each out/*.json), every drafted note / member note / summary read against the voice
-- skill on Fable; every quotation checked verbatim against the live text by script (assemble463f.py) before the SQL was written.
-- Safety: a card is skipped (NOTICE) if its extra-book end is not at the expected address (edited since the Nov 8 read-back), if a card
-- already sits on the destination pair, or if the move would make source = target. RAISES if the live verse text differs from
-- the read-back, or if a rebuilt note does not carry the live verse verbatim.
-- Idempotent: a re-run finds every card already landed and reports 0 changed.
-- Run: python3 api/apply_migration.py data-schema/migrations/{fname}
-- =====================================================================
\\echo 'session463f — {ed} sweep starting...'
BEGIN;
CREATE TEMP TABLE _{tag} (xid INT, side CHAR(1), ob TEXT, oc INT, ov INT, nb TEXT, nc INT, nv INT, new_note TEXT, live_text TEXT, quotes_live BOOLEAN) ON COMMIT DROP;
{('INSERT INTO _' + tag + ' VALUES' + chr(10)) if rows else ''}{(',' + chr(10)).join(rows)}{';' if rows else ''}
CREATE TEMP TABLE _{tag}m (thread_id INT, xid INT, new_note TEXT) ON COMMIT DROP;
{('INSERT INTO _' + tag + 'm VALUES' + chr(10)) if mrows else ''}{(',' + chr(10)).join(mrows)}{';' if mrows else ''}
CREATE TEMP TABLE _{tag}s (thread_id INT, old_summary TEXT, new_summary TEXT, old_title TEXT, new_title TEXT) ON COMMIT DROP;
{('INSERT INTO _' + tag + 's VALUES' + chr(10)) if srows else ''}{(',' + chr(10)).join(srows)}{';' if srows else ''}
CREATE TEMP TABLE _{tag}t (bs TEXT, ch INT, vn INT, old_text TEXT, new_text TEXT) ON COMMIT DROP;
CREATE TEMP TABLE _{tag}a (thread_id INT, ob TEXT, oc INT, ov INT, nb TEXT, nc INT, nv INT) ON COMMIT DROP;
{('INSERT INTO _' + tag + 'a VALUES' + chr(10)) if arows else ''}{(',' + chr(10)).join(arows)}{';' if arows else ''}
{('INSERT INTO _' + tag + 't VALUES' + chr(10)) if vrows else ''}{(',' + chr(10)).join(vrows)}{';' if vrows else ''}
CREATE OR REPLACE TEMP VIEW _{tag}v AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $fix$
DECLARE r RECORD; cur RECORD; pass INT; nid INT; dup INT;
        n_moved INT := 0; n_requoted INT := 0; n_same INT := 0; n_absent INT := 0; n_skipped INT := 0; n_mem INT := 0; n_sum INT := 0; n_sum_skip INT := 0; n_txt INT := 0; n_anc INT := 0; vid INT;
BEGIN
  FOR r IN SELECT * FROM _{tag}t LOOP
    SELECT id INTO vid FROM _{tag}v WHERE es = '{ed}' AND bs = r.bs AND ch = r.ch AND vn = r.vn;
    IF vid IS NULL THEN RAISE EXCEPTION 'S463f: live % %:% missing', r.bs, r.ch, r.vn; END IF;
    IF (SELECT text FROM verses WHERE id = vid) = r.old_text THEN UPDATE verses SET text = r.new_text WHERE id = vid; n_txt := n_txt + 1;
    ELSIF (SELECT text FROM verses WHERE id = vid) <> r.new_text THEN RAISE EXCEPTION 'S463f: live % %:% text is neither the read-back nor the fix — re-run the dump', r.bs, r.ch, r.vn; END IF;
  END LOOP;
  FOR pass IN 1..3 LOOP
  FOR r IN SELECT * FROM _{tag} ORDER BY xid LOOP
    IF r.side = 'T' THEN
      SELECT x.id, x.note, t.ch, t.vn, t.es, t.bs, x.source_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _{tag}v t ON t.id = x.target_verse_id WHERE x.id = r.xid;
    ELSE
      SELECT x.id, x.note, s.ch, s.vn, s.es, s.bs, x.target_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _{tag}v s ON s.id = x.source_verse_id WHERE x.id = r.xid;
    END IF;
    IF cur.id IS NULL THEN
      IF pass = 3 THEN n_absent := n_absent + 1; RAISE NOTICE 'S463f card % absent', r.xid; END IF; CONTINUE;
    END IF;
    IF cur.es <> '{ed}' OR cur.bs <> r.ob THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463f card % extra end is %/% not {ed}/% — skipped', r.xid, cur.es, cur.bs, r.ob; END IF; CONTINUE;
    END IF;
    IF cur.bs = r.nb AND cur.ch = r.nc AND cur.vn = r.nv AND cur.note = r.new_note THEN
      IF pass = 1 THEN n_same := n_same + 1; END IF; CONTINUE;
    END IF;
    IF NOT (cur.ch = r.oc AND cur.vn = r.ov) AND NOT (cur.bs = r.nb AND cur.ch = r.nc AND cur.vn = r.nv) THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1;
      RAISE NOTICE 'S463f card % is at % %:%, expected %:% — edited since the read-back, skipped', r.xid, cur.bs, cur.ch, cur.vn, r.oc, r.ov; END IF; CONTINUE;
    END IF;
    SELECT id INTO nid FROM _{tag}v WHERE es = '{ed}' AND bs = r.nb AND ch = r.nc AND vn = r.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S463f: live % %:% missing', r.nb, r.nc, r.nv; END IF;
    IF (SELECT text FROM _{tag}v WHERE id = nid) <> r.live_text THEN
      RAISE EXCEPTION 'S463f: live % %:% text differs from the read-back the fix was written against — re-run the dump and rebuild', r.nb, r.nc, r.nv;
    END IF;
    IF r.quotes_live AND position(r.live_text IN r.new_note) = 0 THEN
      RAISE EXCEPTION 'S463f: new note for card % does not quote the live % %:% verbatim', r.xid, r.nb, r.nc, r.nv;
    END IF;
    IF nid = cur.other_id THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463f SKIPPED card % (-> % %:%): that is the card''s other verse', r.xid, r.nb, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN
      SELECT count(*) INTO dup FROM cross_references x WHERE x.source_verse_id = cur.other_id AND x.target_verse_id = nid AND x.id <> r.xid;
    ELSE
      SELECT count(*) INTO dup FROM cross_references x WHERE x.target_verse_id = cur.other_id AND x.source_verse_id = nid AND x.id <> r.xid;
    END IF;
    IF dup > 0 THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463f SKIPPED card % (-> % %:%): a card already sits on that pair', r.xid, r.nb, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN UPDATE cross_references SET target_verse_id = nid, note = r.new_note WHERE id = r.xid;
    ELSE UPDATE cross_references SET source_verse_id = nid, note = r.new_note WHERE id = r.xid; END IF;
    IF r.oc = r.nc AND r.ov = r.nv AND r.ob = r.nb THEN n_requoted := n_requoted + 1;
    ELSE n_moved := n_moved + 1; RAISE NOTICE 'S463f moved card %: % %:% -> %:% (%)', r.xid, r.nb, r.oc, r.ov, r.nc, r.nv, CASE WHEN r.side='T' THEN 'target' ELSE 'source' END; END IF;
  END LOOP;
  END LOOP;

  FOR r IN SELECT m.* FROM _{tag}m m LOOP
    UPDATE cross_reference_thread_members SET member_note = r.new_note
     WHERE thread_id = r.thread_id AND cross_reference_id = r.xid AND member_note IS DISTINCT FROM r.new_note;
    IF FOUND THEN n_mem := n_mem + 1; END IF;
  END LOOP;

  FOR r IN SELECT a.* FROM _{tag}a a LOOP
    SELECT id INTO vid FROM _{tag}v WHERE es = '{ed}' AND bs = r.nb AND ch = r.nc AND vn = r.nv;
    IF vid IS NULL THEN RAISE EXCEPTION 'S463f: live % %:% missing', r.nb, r.nc, r.nv; END IF;
    UPDATE cross_reference_threads SET anchor_verse_id_start = vid, anchor_verse_id_end = CASE WHEN anchor_verse_id_end = anchor_verse_id_start THEN vid ELSE anchor_verse_id_end END
      WHERE id = r.thread_id AND anchor_verse_id_start = (SELECT id FROM _{tag}v WHERE es = '{ed}' AND bs = r.ob AND ch = r.oc AND vn = r.ov);
    IF FOUND THEN n_anc := n_anc + 1; RAISE NOTICE 'S463f thread % anchor moved %:% -> %:%', r.thread_id, r.oc, r.ov, r.nc, r.nv;
    ELSIF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE id = r.thread_id AND anchor_verse_id_start = vid) THEN
      RAISE NOTICE 'S463f thread % anchor is neither the old nor the new verse — left alone', r.thread_id; END IF;
  END LOOP;

  FOR r IN SELECT s.* FROM _{tag}s s LOOP
    UPDATE cross_reference_threads SET summary_md = r.new_summary, title = r.new_title WHERE id = r.thread_id AND summary_md = r.old_summary;
    IF FOUND THEN n_sum := n_sum + 1;
    ELSIF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE id = r.thread_id AND summary_md = r.new_summary) THEN
      n_sum_skip := n_sum_skip + 1; RAISE NOTICE 'S463f SKIPPED thread % summary: live text is neither the old nor the new', r.thread_id;
    END IF;
  END LOOP;

  RAISE NOTICE 'S463f ({ed}) summary: notes rewritten in place %, moved %, already landed %, skipped %, absent %; member notes updated %; summaries updated % (skipped %); verse texts fixed %; thread anchors moved %',
    n_requoted, n_moved, n_same, n_skipped, n_absent, n_mem, n_sum, n_sum_skip, n_txt, n_anc;
  IF n_skipped + n_absent + n_sum_skip > 0 THEN RAISE NOTICE 'S463f: read the SKIPPED/absent lines above — those rows still carry the old text'; END IF;
END $fix$;
COMMIT;
\\echo 'session463f — {ed} done.'
"""
    (OUTDIR / fname).write_text(sql)
    print(ed, '| cards', len(rows), 'moves', n_moves, dict(K), '| member rows', len(mrows), '| summaries', len(srows), '| bytes', len(sql), '->', OUTDIR / fname)
