"""Write session463c_apocrypha_sweep.sql from fix/fix_cards.json, fix/fix_members.json, fix/fix_summaries.json (+ the Oct 23 read-back).
Addresses are 'book-slug|c:v'; the Apocrypha end is in edition `apocrypha`, except 3-maccabees which is in `pseudepigrapha`.
Run from the s463c folder (reads in/apocrypha-cards-live.json)."""
import json, sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
cards = {int(k): v for k, v in json.load(open(HERE / 'fix' / 'fix_cards.json')).items()}
members = json.load(open(HERE / 'fix' / 'fix_members.json'))
summaries = json.load(open(HERE / 'fix' / 'fix_summaries.json'))
L = json.load(open(HERE / 'in' / 'apocrypha-cards-live.json'))['live']
OUT = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE / 'session463c_apocrypha_sweep.sql'

def q(s):
    assert '$n$' not in s
    return '$n$' + s + '$n$'
def addr(a):
    b, cv = a.split('|'); c, v = cv.split(':'); return b, int(c), int(v)
def ed(b): return 'pseudepigrapha' if b == '3-maccabees' else 'apocrypha'

rows = []
for i, x in sorted(cards.items()):
    ob, oc, ov = addr(x['old']); nb, nc, nv = addr(x['new']); assert ob == nb
    rebuilt = x['kind'].startswith('PROSE')
    live = L[x['new']]
    if rebuilt: assert live in x['new_note'], (i, 'rebuilt note must quote the live verse verbatim')
    rows.append(f"({i},'{x['side']}','{ed(nb)}','{nb}',{oc},{ov},{nc},{nv},{q(x['new_note'])},{q(live)},{'true' if rebuilt else 'false'})")
mrows = [f"({m['thread_id']},{m['xref_id']},{q(m['new'])})" for m in members]
srows = [f"({s['thread_id']},{q(s['old'])},{q(s['new'])})" for s in summaries]
K = {}
for x in cards.values(): K[x['kind']] = K.get(x['kind'], 0) + 1
n_moves = sum(1 for x in cards.values() if x['old'] != x['new'])

sql = f"""-- =====================================================================
-- Session 463c migration — 2026-10-23
-- Apocrypha + 3 Maccabees card sweep (the S459/S463a/S463b chain, in one migration):
--   {K.get('PROSE',0)+K.get('PROSE_MOVE',0)} cards whose note carried degraded prose (wisdom-stream / the framework reads / substance / hyphen-chains):
--       note rebuilt Come-and-See — full live Apocrypha verse in stand-alone italics, cited; the other verse the same
--       (canon from parsed/canon.json); then prose — {K.get('PROSE_MOVE',0)} of them also re-pointed to the verse the old note quoted;
--   {K.get('REQUOTE',0)} cards whose Apocrypha quotation was off the live text: re-quoted verbatim, prose kept;
--   {K.get('CITE_RANGE',0)} quotations that run across a verse boundary: citation widened to a range, address unchanged;
--   {K.get('SLUG',0)} cards that printed the database slug as the citation ("the-wisdom-of-solomon 11:4"): English book name;
--   {len(members)} thread member notes ride along ({sum(1 for m in members if m['kind']=='PROSE')} on rebuilt cards, {sum(1 for m in members if m['kind']!='PROSE')} re-quoted / rewritten on their own);
--   {len(summaries)} thread summaries fixed (jargon, slug citations, off quotations; old summary must match exactly or the row is skipped).
-- Reads before this was written: every gloss on an S454-changed verse read by content (13, all stay); every re-pointing / range /
-- re-quote read cold by two agents (19/19 agree; 4507 widened to 35:14–15); every rebuilt note, member note and summary read cold
-- against the voice skill (27 findings, all applied).
-- Safety: a card is skipped (NOTICE) if its Apocrypha end is not at the expected address (edited since the Oct 23 read-back),
-- if a card already sits on the destination pair, or if the move would make source = target. RAISES if the live Apocrypha verse
-- text differs from the read-back, or if a rebuilt note does not carry the live verse verbatim.
-- Idempotent: a re-run finds every card already landed and reports 0 changed.
-- Run: python3 api/apply_migration.py data-schema/migrations/session463c_apocrypha_sweep.sql
-- =====================================================================
\\echo 'session463c — Apocrypha + 3 Maccabees sweep starting...'
BEGIN;
CREATE TEMP TABLE _s463c (xid INT, side CHAR(1), ed TEXT, bk TEXT, oc INT, ov INT, nc INT, nv INT, new_note TEXT, live_text TEXT, quotes_live BOOLEAN) ON COMMIT DROP;
INSERT INTO _s463c VALUES
{',\n'.join(rows)};
CREATE TEMP TABLE _s463cm (thread_id INT, xid INT, new_note TEXT) ON COMMIT DROP;
INSERT INTO _s463cm VALUES
{',\n'.join(mrows)};
CREATE TEMP TABLE _s463cs (thread_id INT, old_summary TEXT, new_summary TEXT) ON COMMIT DROP;
INSERT INTO _s463cs VALUES
{',\n'.join(srows)};
CREATE TEMP VIEW _s463cv AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $fix$
DECLARE r RECORD; cur RECORD; pass INT; nid INT; dup INT;
        n_moved INT := 0; n_requoted INT := 0; n_same INT := 0; n_absent INT := 0; n_skipped INT := 0; n_mem INT := 0; n_sum INT := 0; n_sum_skip INT := 0;
BEGIN
  FOR pass IN 1..3 LOOP
  FOR r IN SELECT * FROM _s463c ORDER BY xid LOOP
    IF r.side = 'T' THEN
      SELECT x.id, x.note, t.ch, t.vn, t.es, t.bs, x.source_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _s463cv t ON t.id = x.target_verse_id WHERE x.id = r.xid;
    ELSE
      SELECT x.id, x.note, s.ch, s.vn, s.es, s.bs, x.target_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _s463cv s ON s.id = x.source_verse_id WHERE x.id = r.xid;
    END IF;
    IF cur.id IS NULL THEN
      IF pass = 3 THEN n_absent := n_absent + 1; RAISE NOTICE 'S463c card % absent', r.xid; END IF; CONTINUE;
    END IF;
    IF cur.es <> r.ed OR cur.bs <> r.bk THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463c card % Apocrypha end is %/% not %/% — skipped', r.xid, cur.es, cur.bs, r.ed, r.bk; END IF; CONTINUE;
    END IF;
    IF cur.ch = r.nc AND cur.vn = r.nv AND cur.note = r.new_note THEN
      IF pass = 1 THEN n_same := n_same + 1; END IF; CONTINUE;
    END IF;
    IF NOT (cur.ch = r.oc AND cur.vn = r.ov) AND NOT (cur.ch = r.nc AND cur.vn = r.nv) THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1;
      RAISE NOTICE 'S463c card % is at % %:%, expected %:% — edited since the read-back, skipped', r.xid, r.bk, cur.ch, cur.vn, r.oc, r.ov; END IF; CONTINUE;
    END IF;
    SELECT id INTO nid FROM _s463cv WHERE es = r.ed AND bs = r.bk AND ch = r.nc AND vn = r.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S463c: live % %:% missing', r.bk, r.nc, r.nv; END IF;
    IF (SELECT text FROM _s463cv WHERE id = nid) <> r.live_text THEN
      RAISE EXCEPTION 'S463c: live % %:% text differs from the read-back the fix was written against — re-run the dump and rebuild', r.bk, r.nc, r.nv;
    END IF;
    IF r.quotes_live AND position(r.live_text IN r.new_note) = 0 THEN
      RAISE EXCEPTION 'S463c: new note for card % does not quote the live % %:% verbatim', r.xid, r.bk, r.nc, r.nv;
    END IF;
    IF nid = cur.other_id THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463c SKIPPED card % (-> % %:%): that is the card''s other verse', r.xid, r.bk, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN
      SELECT count(*) INTO dup FROM cross_references x WHERE x.source_verse_id = cur.other_id AND x.target_verse_id = nid AND x.id <> r.xid;
    ELSE
      SELECT count(*) INTO dup FROM cross_references x WHERE x.target_verse_id = cur.other_id AND x.source_verse_id = nid AND x.id <> r.xid;
    END IF;
    IF dup > 0 THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463c SKIPPED card % (-> % %:%): a card already sits on that pair', r.xid, r.bk, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN UPDATE cross_references SET target_verse_id = nid, note = r.new_note WHERE id = r.xid;
    ELSE UPDATE cross_references SET source_verse_id = nid, note = r.new_note WHERE id = r.xid; END IF;
    IF r.oc = r.nc AND r.ov = r.nv THEN n_requoted := n_requoted + 1;
    ELSE n_moved := n_moved + 1; RAISE NOTICE 'S463c moved card %: % %:% -> %:% (%)', r.xid, r.bk, r.oc, r.ov, r.nc, r.nv, CASE WHEN r.side='T' THEN 'target' ELSE 'source' END; END IF;
  END LOOP;
  END LOOP;

  FOR r IN SELECT m.* FROM _s463cm m LOOP
    UPDATE cross_reference_thread_members SET member_note = r.new_note
     WHERE thread_id = r.thread_id AND cross_reference_id = r.xid AND member_note IS DISTINCT FROM r.new_note;
    IF FOUND THEN n_mem := n_mem + 1; END IF;
  END LOOP;

  FOR r IN SELECT s.* FROM _s463cs s LOOP
    UPDATE cross_reference_threads SET summary_md = r.new_summary WHERE id = r.thread_id AND summary_md = r.old_summary;
    IF FOUND THEN n_sum := n_sum + 1;
    ELSIF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE id = r.thread_id AND summary_md = r.new_summary) THEN
      n_sum_skip := n_sum_skip + 1; RAISE NOTICE 'S463c SKIPPED thread % summary: live text is neither the old nor the new', r.thread_id;
    END IF;
  END LOOP;

  RAISE NOTICE 'S463c summary: notes rewritten in place %, moved %, already landed %, skipped %, absent %; member notes updated %; summaries updated % (skipped %)',
    n_requoted, n_moved, n_same, n_skipped, n_absent, n_mem, n_sum, n_sum_skip;
  IF n_skipped + n_absent + n_sum_skip > 0 THEN RAISE NOTICE 'S463c: read the SKIPPED/absent lines above — those rows still carry the old text'; END IF;
END $fix$;
COMMIT;
\\echo 'session463c — done.'
"""
OUT.write_text(sql)
print('cards', len(rows), 'moves', n_moves, 'kinds', K, 'member rows', len(mrows), 'summaries', len(srows), 'bytes', len(sql), '->', OUT)
