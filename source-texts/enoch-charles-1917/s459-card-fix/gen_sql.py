"""Write data-schema/migrations/session459_enoch_card_fix.sql from fix.json."""
import json
from pathlib import Path
HERE = Path(__file__).resolve().parent; UP = HERE.parent; APP = UP.parent.parent
d = json.load(open(HERE / 'fix.json'))
upd = [x for x in d['cards'] if x['action'] == 'update']
ret = [x for x in d['cards'] if x['action'] == 'retire']
mem = [m for m in d['members'] if m['new'] != m['old']]
live = json.load(open(UP / 'enoch-cards-live.json'))['enoch_live']

def q(s):
    assert '$n$' not in s
    return '$n$' + s + '$n$'
def addr(a): c, v = a.split(':'); return int(c), int(v)

rows = []
for x in upd:
    oc, ov = addr(x['old_addr']); nc, nv = addr(x['new_addr'])
    rows.append(f"({x['id']},{oc},{ov},{nc},{nv},{q(x['new_note'])},{q(live[x['new_addr']])})")
mrows = [f"({m['thread_id']},{m['xref']},{q(m['new'])})" for m in mem]

sql = f"""-- =====================================================================
-- Session 459 migration — 2026-10-19
-- 1 Enoch card-fidelity fix: every cross-reference card whose note quoted
-- 1 Enoch words that are not the live Charles 1917 text at the card's
-- address (S457 map, re-read by content S459).
--   {len(upd)} cards: note rewritten to quote the live verse in full
--       (stand-alone italics, cited); {sum(1 for x in upd if x['old_addr']!=x['new_addr'])} of them re-pointed to the verse the
--       words actually live on (ids kept, Rule 10).
--   {len(mem)} thread member notes ride along (address patched, or replaced by
--       the card note where the member note quoted the old words).
--   {len(ret)} cards retired (duplicates of a card already on the true verse):
--       {', '.join(str(x['id']) + ' (' + x['reason'] + ')' for x in ret)}
-- Every card is anchored on its TARGET (the 1 Enoch end); the source
-- verse is never touched.
-- Safety: a card is skipped (NOTICE) if it is not at the expected address
-- (edited since the S457 read-back) or if a card already sits on the
-- destination pair. The migration RAISES if the live 1 Enoch verse text
-- is not the text the new note quotes — the fix was written against the
-- S457 read-back and must not land on a text that has changed since.
-- Idempotent: a re-run finds every card already at its new address with
-- its new note and reports 0 changed.
-- Run: python3 api/apply_migration.py data-schema/migrations/session459_enoch_card_fix.sql
-- =====================================================================
\\echo 'session459 — 1 Enoch card fix starting...'
BEGIN;
CREATE TEMP TABLE _s459 (xid INT, oc INT, ov INT, nc INT, nv INT, new_note TEXT, live_text TEXT) ON COMMIT DROP;
INSERT INTO _s459 VALUES
{',\n'.join(rows)};
CREATE TEMP TABLE _s459m (thread_id INT, xid INT, new_note TEXT) ON COMMIT DROP;
INSERT INTO _s459m VALUES
{',\n'.join(mrows)};
CREATE TEMP VIEW _s459v AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $fix$
DECLARE r RECORD; cur RECORD; pass INT; nid INT; dup INT; n_moved INT := 0; n_requoted INT := 0; n_same INT := 0; n_absent INT := 0; n_skipped INT := 0; n_mem INT := 0; n_ret INT := 0; n_retm INT := 0;
BEGIN
  DELETE FROM cross_reference_thread_members WHERE cross_reference_id IN ({', '.join(str(x['id']) for x in ret)});
  GET DIAGNOSTICS n_retm = ROW_COUNT;
  DELETE FROM cross_references WHERE id IN ({', '.join(str(x['id']) for x in ret)});
  GET DIAGNOSTICS n_ret = ROW_COUNT;

  -- up to three passes: a card can only move onto a pair once the card that was sitting there has moved off it
  FOR pass IN 1..3 LOOP
  FOR r IN SELECT * FROM _s459 ORDER BY xid LOOP
    SELECT x.id, x.note, t.ch, t.vn, t.es, x.source_verse_id INTO cur
      FROM cross_references x JOIN _s459v t ON t.id = x.target_verse_id WHERE x.id = r.xid;
    IF cur.id IS NULL THEN
      IF pass = 3 THEN n_absent := n_absent + 1; RAISE NOTICE 'S459 card % absent', r.xid; END IF; CONTINUE;
    END IF;
    IF cur.es <> 'enoch' THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S459 card % target is not 1 Enoch (%) — skipped', r.xid, cur.es; END IF; CONTINUE;
    END IF;
    IF cur.ch = r.nc AND cur.vn = r.nv AND cur.note = r.new_note THEN
      IF pass = 1 THEN n_same := n_same + 1; END IF; CONTINUE;   -- already landed (re-run, or an earlier pass)
    END IF;
    IF NOT (cur.ch = r.oc AND cur.vn = r.ov) AND NOT (cur.ch = r.nc AND cur.vn = r.nv) THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1;
      RAISE NOTICE 'S459 card % is at 1 Enoch %:%, expected %:% — edited since the read-back, skipped', r.xid, cur.ch, cur.vn, r.oc, r.ov; END IF; CONTINUE;
    END IF;
    SELECT id INTO nid FROM _s459v WHERE es='enoch' AND bs='1-enoch' AND ch=r.nc AND vn=r.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S459: live 1 Enoch %:% missing', r.nc, r.nv; END IF;
    IF (SELECT text FROM _s459v WHERE id = nid) <> r.live_text THEN
      RAISE EXCEPTION 'S459: live 1 Enoch %:% text differs from the S457 read-back the fix was written against — re-run the dump and rebuild', r.nc, r.nv;
    END IF;
    IF position(r.live_text IN r.new_note) = 0 THEN
      RAISE EXCEPTION 'S459: new note for card % does not quote the live 1 Enoch %:% verbatim', r.xid, r.nc, r.nv;
    END IF;
    IF nid = cur.source_verse_id THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S459 SKIPPED card % (-> 1 Enoch %:%): that is the card''s own source verse (cross_references_check)', r.xid, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    SELECT count(*) INTO dup FROM cross_references x WHERE x.source_verse_id = cur.source_verse_id AND x.target_verse_id = nid AND x.id <> r.xid;
    IF dup > 0 THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S459 SKIPPED card % (-> 1 Enoch %:%): a card already sits on that pair', r.xid, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    UPDATE cross_references SET target_verse_id = nid, note = r.new_note WHERE id = r.xid;
    IF r.oc = r.nc AND r.ov = r.nv THEN n_requoted := n_requoted + 1;
    ELSE n_moved := n_moved + 1; RAISE NOTICE 'S459 moved card %: 1 Enoch %:% -> %:%', r.xid, r.oc, r.ov, r.nc, r.nv; END IF;
  END LOOP;
  END LOOP;

  FOR r IN SELECT m.* FROM _s459m m LOOP
    UPDATE cross_reference_thread_members SET member_note = r.new_note
     WHERE thread_id = r.thread_id AND cross_reference_id = r.xid AND member_note IS DISTINCT FROM r.new_note;
    IF FOUND THEN n_mem := n_mem + 1; END IF;
  END LOOP;

  RAISE NOTICE 'S459 summary: cards re-quoted in place %, moved + re-quoted %, already landed %, skipped %, absent %; member notes updated %; cards retired % (member rows %)',
    n_requoted, n_moved, n_same, n_skipped, n_absent, n_mem, n_ret, n_retm;
  IF n_skipped + n_absent > 0 THEN RAISE NOTICE 'S459: read the SKIPPED/absent lines above — those cards still carry the old quote'; END IF;
END $fix$;
COMMIT;
\\echo 'session459 — done.'
"""
open(APP / 'data-schema' / 'migrations' / 'session459_enoch_card_fix.sql', 'w').write(sql)
print('rows', len(rows), 'member rows', len(mrows), 'bytes', len(sql))
