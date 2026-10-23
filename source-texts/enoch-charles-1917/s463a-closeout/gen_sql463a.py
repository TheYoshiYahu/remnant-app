"""Write data-schema/migrations/session463a_enoch_closeout.sql from fix463a.json (63 degraded STAND cards, note-only)
and fix463a_gloss.json (the glosses on verses the S449 rebuild changed: re-pointed / rewritten / retired)."""
import json, sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
A = json.load(open(HERE / 'fix463a.json'))          # degraded STAND cards (prose rewrite, same address)
G = json.load(open(HERE / 'fix463a_gloss.json'))    # glosses
OUT = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE / 'session463a_enoch_closeout.sql'

def q(s):
    assert '$n$' not in s
    return '$n$' + s + '$n$'
def addr(a): c, v = a.split(':'); return int(c), int(v)

rows = []   # (xid, side, oc, ov, nc, nv, new_note, live_text, quotes_live)
for x in A['cards']:
    oc, ov = addr(x['addr'])
    rows.append(f"({x['id']},'T',{oc},{ov},{oc},{ov},{q(x['new_note'])},{q(x['live_text'])},true)")
for x in G['cards']:
    if x['kind'] == 'retire': continue
    oc, ov = addr(x['old_addr']); nc, nv = addr(x['new_addr'])
    rows.append(f"({x['id']},'{x['side']}',{oc},{ov},{nc},{nv},{q(x['new_note'])},{q(x['live_text'])},false)")
mrows = [f"({m['thread_id']},{m['xref']},{q(m['new'])})" for m in A['members']] + \
        [f"({m['thread_id']},{m['xref']},{q(m['new'])})" for m in G['members']]
ret = [x for x in G['cards'] if x['kind'] == 'retire']
ret_ids = ', '.join(str(x['id']) for x in ret) or 'NULL'
n_moves = sum(1 for x in G['cards'] if x['kind'] != 'retire' and x['old_addr'] != x['new_addr'])

sql = f"""-- =====================================================================
-- Session 463a migration — 2026-10-22
-- 1 Enoch close-out, two jobs:
--   (1) {len(A['cards'])} cards that stood on the right verse but carried degraded prose: note rewritten
--       (full live verse in stand-alone italics, cited, then prose), address unchanged;
--       {len(A['members'])} thread member notes ride along.
--   (2) The glosses on verses the S449 rebuild changed: {len([x for x in G['cards'] if x['kind']!='retire'])} cards —
--       {n_moves} re-pointed to the live verse the old (misplaced) text actually came from (ids kept, Rule 10;
--       the card's 1 Enoch end moves, whether it is the source or the target), the rest re-worded in place;
--       {len(G['members'])} member notes ride along; {len(ret)} cards retired because, once re-pointed, a card
--       already carries the same pairing on the true verse (listed in the report).
-- Safety: a card is skipped (NOTICE) if its 1 Enoch end is not at the expected address (edited since the
-- read-back), if a card already sits on the destination pair, or if the move would make source = target.
-- RAISES if the live 1 Enoch verse text differs from the read-back the fix was written against, or if a
-- note that quotes its verse does not carry the live text verbatim.
-- Idempotent: a re-run finds every card already landed and reports 0 changed.
-- Run: python3 api/apply_migration.py data-schema/migrations/session463a_enoch_closeout.sql
-- =====================================================================
\\echo 'session463a — 1 Enoch close-out starting...'
BEGIN;
CREATE TEMP TABLE _s463 (xid INT, side CHAR(1), oc INT, ov INT, nc INT, nv INT, new_note TEXT, live_text TEXT, quotes_live BOOLEAN) ON COMMIT DROP;
INSERT INTO _s463 VALUES
{',\n'.join(rows)};
CREATE TEMP TABLE _s463m (thread_id INT, xid INT, new_note TEXT) ON COMMIT DROP;
INSERT INTO _s463m VALUES
{',\n'.join(mrows)};
CREATE TEMP VIEW _s463v AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $fix$
DECLARE r RECORD; cur RECORD; pass INT; nid INT; dup INT; other INT;
        n_moved INT := 0; n_requoted INT := 0; n_same INT := 0; n_absent INT := 0; n_skipped INT := 0; n_mem INT := 0; n_ret INT := 0; n_retm INT := 0;
BEGIN
  DELETE FROM cross_reference_thread_members WHERE cross_reference_id IN ({ret_ids});
  GET DIAGNOSTICS n_retm = ROW_COUNT;
  DELETE FROM cross_references WHERE id IN ({ret_ids});
  GET DIAGNOSTICS n_ret = ROW_COUNT;

  FOR pass IN 1..3 LOOP
  FOR r IN SELECT * FROM _s463 ORDER BY xid LOOP
    IF r.side = 'T' THEN
      SELECT x.id, x.note, t.ch, t.vn, t.es, x.source_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _s463v t ON t.id = x.target_verse_id WHERE x.id = r.xid;
    ELSE
      SELECT x.id, x.note, s.ch, s.vn, s.es, x.target_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _s463v s ON s.id = x.source_verse_id WHERE x.id = r.xid;
    END IF;
    IF cur.id IS NULL THEN
      IF pass = 3 THEN n_absent := n_absent + 1; RAISE NOTICE 'S463a card % absent', r.xid; END IF; CONTINUE;
    END IF;
    IF cur.es <> 'enoch' THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463a card % enoch end is not 1 Enoch (%) — skipped', r.xid, cur.es; END IF; CONTINUE;
    END IF;
    IF cur.ch = r.nc AND cur.vn = r.nv AND cur.note = r.new_note THEN
      IF pass = 1 THEN n_same := n_same + 1; END IF; CONTINUE;
    END IF;
    IF NOT (cur.ch = r.oc AND cur.vn = r.ov) AND NOT (cur.ch = r.nc AND cur.vn = r.nv) THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1;
      RAISE NOTICE 'S463a card % is at 1 Enoch %:%, expected %:% — edited since the read-back, skipped', r.xid, cur.ch, cur.vn, r.oc, r.ov; END IF; CONTINUE;
    END IF;
    SELECT id INTO nid FROM _s463v WHERE es='enoch' AND bs='1-enoch' AND ch=r.nc AND vn=r.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S463a: live 1 Enoch %:% missing', r.nc, r.nv; END IF;
    IF (SELECT text FROM _s463v WHERE id = nid) <> r.live_text THEN
      RAISE EXCEPTION 'S463a: live 1 Enoch %:% text differs from the read-back the fix was written against — re-run the dump and rebuild', r.nc, r.nv;
    END IF;
    IF r.quotes_live AND position(r.live_text IN r.new_note) = 0 THEN
      RAISE EXCEPTION 'S463a: new note for card % does not quote the live 1 Enoch %:% verbatim', r.xid, r.nc, r.nv;
    END IF;
    IF nid = cur.other_id THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463a SKIPPED card % (-> 1 Enoch %:%): that is the card''s other verse (cross_references_check)', r.xid, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN
      SELECT count(*) INTO dup FROM cross_references x WHERE x.source_verse_id = cur.other_id AND x.target_verse_id = nid AND x.id <> r.xid;
    ELSE
      SELECT count(*) INTO dup FROM cross_references x WHERE x.target_verse_id = cur.other_id AND x.source_verse_id = nid AND x.id <> r.xid;
    END IF;
    IF dup > 0 THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463a SKIPPED card % (-> 1 Enoch %:%): a card already sits on that pair', r.xid, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN UPDATE cross_references SET target_verse_id = nid, note = r.new_note WHERE id = r.xid;
    ELSE UPDATE cross_references SET source_verse_id = nid, note = r.new_note WHERE id = r.xid; END IF;
    IF r.oc = r.nc AND r.ov = r.nv THEN n_requoted := n_requoted + 1;
    ELSE n_moved := n_moved + 1; RAISE NOTICE 'S463a moved card %: 1 Enoch %:% -> %:% (%)', r.xid, r.oc, r.ov, r.nc, r.nv, CASE WHEN r.side='T' THEN 'target' ELSE 'source' END; END IF;
  END LOOP;
  END LOOP;

  FOR r IN SELECT m.* FROM _s463m m LOOP
    UPDATE cross_reference_thread_members SET member_note = r.new_note
     WHERE thread_id = r.thread_id AND cross_reference_id = r.xid AND member_note IS DISTINCT FROM r.new_note;
    IF FOUND THEN n_mem := n_mem + 1; END IF;
  END LOOP;

  RAISE NOTICE 'S463a summary: notes rewritten in place %, moved + rewritten %, already landed %, skipped %, absent %; member notes updated %; cards retired % (member rows %)',
    n_requoted, n_moved, n_same, n_skipped, n_absent, n_mem, n_ret, n_retm;
  IF n_skipped + n_absent > 0 THEN RAISE NOTICE 'S463a: read the SKIPPED/absent lines above — those cards still carry the old note'; END IF;
END $fix$;
COMMIT;
\\echo 'session463a — done.'
"""
OUT.write_text(sql)
print('rows', len(rows), 'member rows', len(mrows), 'retired', len(ret), 'bytes', len(sql), '->', OUT)
