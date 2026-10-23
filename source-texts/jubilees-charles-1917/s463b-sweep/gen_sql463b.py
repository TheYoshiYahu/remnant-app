"""Write session463b_jubilees_sweep.sql from fix_cards.json (255 cards: 129 glosses re-pointed, 115 notes rebuilt in place,
11 rebuilt + re-pointed), fix_members.json (256 thread member notes) and fix_summaries.json (5 thread summaries).
Run from the folder holding the three JSONs and jub/jubilees-cards-live.json."""
import json, sys, re
from pathlib import Path
HERE = Path(__file__).resolve().parent
cards = {int(k): v for k, v in json.load(open(HERE / 'fix_cards.json')).items()}
members = json.load(open(HERE / 'fix_members.json'))
summaries = json.load(open(HERE / 'fix_summaries.json'))
L = json.load(open(HERE / 'jub' / 'jubilees-cards-live.json'))['jubilees_live']
OUT = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE / 'session463b_jubilees_sweep.sql'

def q(s):
    assert '$n$' not in s
    return '$n$' + s + '$n$'
def addr(a): c, v = a.split(':'); return int(c), int(v)

rows = []
for i, x in sorted(cards.items()):
    oc, ov = addr(x['old']); nc, nv = addr(x['new'])
    rebuilt = x['kind'].startswith('PROSE') and not x.get('partial_quote')
    live = L[x['new']]
    if rebuilt:
        assert live in x['new_note'], (i, 'rebuilt note must quote the live verse verbatim')
    rows.append(f"({i},'{x['side']}',{oc},{ov},{nc},{nv},{q(x['new_note'])},{q(live)},{'true' if rebuilt else 'false'})")
mrows = [f"({m['thread_id']},{m['xref_id']},{q(m['new'])})" for m in members]
srows = [f"({s['thread_id']},{q(s['old'])},{q(s['new'])})" for s in summaries]
n_moves = sum(1 for x in cards.values() if x['old'] != x['new'])
n_rebuilt = sum(1 for x in cards.values() if x['kind'].startswith('PROSE'))

sql = f"""-- =====================================================================
-- Session 463b migration — 2026-10-23
-- Jubilees card sweep (the S459/S460/S463a chain for Jubilees, in one migration):
--   {n_rebuilt} cards whose note carried degraded prose or a stale quote: note rebuilt (full live Jubilees verse in
--       stand-alone italics, cited; the other verse the same; then prose) — {sum(1 for x in cards.values() if x['kind']=='PROSE_MOVE')} of them also re-pointed to the
--       verse the old note actually described;
--   {sum(1 for x in cards.values() if x['kind']=='GLOSS_MOVE')} glosses on verses the S453 split left them beside: re-pointed to the neighbor verse their words
--       sit in (ids kept, Rule 10; the Jubilees end moves whether source or target; addresses in the prose patched);
--   {len(members)} thread member notes ride along ({sum(1 for m in members if m['kind']=='MEMBER_REQUOTE')} re-quoted from the live text on their own);
--   {len(summaries)} thread summaries re-quoted from the live text (old summary must match exactly or the row is skipped).
-- Two independent cold reads of every re-pointing before this was written (1 wrong move and 2 prose addresses caught, fixed).
-- Safety: a card is skipped (NOTICE) if its Jubilees end is not at the expected address (edited since the Oct 23 read-back),
-- if a card already sits on the destination pair, or if the move would make source = target. RAISES if the live Jubilees
-- verse text differs from the read-back, or if a rebuilt note does not carry the live verse verbatim.
-- Idempotent: a re-run finds every card already landed and reports 0 changed.
-- Run: python3 api/apply_migration.py data-schema/migrations/session463b_jubilees_sweep.sql
-- =====================================================================
\\echo 'session463b — Jubilees sweep starting...'
BEGIN;
CREATE TEMP TABLE _s463b (xid INT, side CHAR(1), oc INT, ov INT, nc INT, nv INT, new_note TEXT, live_text TEXT, quotes_live BOOLEAN) ON COMMIT DROP;
INSERT INTO _s463b VALUES
{',\n'.join(rows)};
CREATE TEMP TABLE _s463bm (thread_id INT, xid INT, new_note TEXT) ON COMMIT DROP;
INSERT INTO _s463bm VALUES
{',\n'.join(mrows)};
CREATE TEMP TABLE _s463bs (thread_id INT, old_summary TEXT, new_summary TEXT) ON COMMIT DROP;
INSERT INTO _s463bs VALUES
{',\n'.join(srows)};
CREATE TEMP VIEW _s463bv AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $fix$
DECLARE r RECORD; cur RECORD; pass INT; nid INT; dup INT;
        n_moved INT := 0; n_requoted INT := 0; n_same INT := 0; n_absent INT := 0; n_skipped INT := 0; n_mem INT := 0; n_sum INT := 0; n_sum_skip INT := 0;
BEGIN
  FOR pass IN 1..3 LOOP
  FOR r IN SELECT * FROM _s463b ORDER BY xid LOOP
    IF r.side = 'T' THEN
      SELECT x.id, x.note, t.ch, t.vn, t.es, x.source_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _s463bv t ON t.id = x.target_verse_id WHERE x.id = r.xid;
    ELSE
      SELECT x.id, x.note, s.ch, s.vn, s.es, x.target_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _s463bv s ON s.id = x.source_verse_id WHERE x.id = r.xid;
    END IF;
    IF cur.id IS NULL THEN
      IF pass = 3 THEN n_absent := n_absent + 1; RAISE NOTICE 'S463b card % absent', r.xid; END IF; CONTINUE;
    END IF;
    IF cur.es <> 'jubilees' THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463b card % Jubilees end is not Jubilees (%) — skipped', r.xid, cur.es; END IF; CONTINUE;
    END IF;
    IF cur.ch = r.nc AND cur.vn = r.nv AND cur.note = r.new_note THEN
      IF pass = 1 THEN n_same := n_same + 1; END IF; CONTINUE;
    END IF;
    IF NOT (cur.ch = r.oc AND cur.vn = r.ov) AND NOT (cur.ch = r.nc AND cur.vn = r.nv) THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1;
      RAISE NOTICE 'S463b card % is at Jubilees %:%, expected %:% — edited since the read-back, skipped', r.xid, cur.ch, cur.vn, r.oc, r.ov; END IF; CONTINUE;
    END IF;
    SELECT id INTO nid FROM _s463bv WHERE es='jubilees' AND bs='jubilees' AND ch=r.nc AND vn=r.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S463b: live Jubilees %:% missing', r.nc, r.nv; END IF;
    IF (SELECT text FROM _s463bv WHERE id = nid) <> r.live_text THEN
      RAISE EXCEPTION 'S463b: live Jubilees %:% text differs from the read-back the fix was written against — re-run the dump and rebuild', r.nc, r.nv;
    END IF;
    IF r.quotes_live AND position(r.live_text IN r.new_note) = 0 THEN
      RAISE EXCEPTION 'S463b: new note for card % does not quote the live Jubilees %:% verbatim', r.xid, r.nc, r.nv;
    END IF;
    IF nid = cur.other_id THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463b SKIPPED card % (-> Jubilees %:%): that is the card''s other verse', r.xid, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN
      SELECT count(*) INTO dup FROM cross_references x WHERE x.source_verse_id = cur.other_id AND x.target_verse_id = nid AND x.id <> r.xid;
    ELSE
      SELECT count(*) INTO dup FROM cross_references x WHERE x.target_verse_id = cur.other_id AND x.source_verse_id = nid AND x.id <> r.xid;
    END IF;
    IF dup > 0 THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463b SKIPPED card % (-> Jubilees %:%): a card already sits on that pair', r.xid, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN UPDATE cross_references SET target_verse_id = nid, note = r.new_note WHERE id = r.xid;
    ELSE UPDATE cross_references SET source_verse_id = nid, note = r.new_note WHERE id = r.xid; END IF;
    IF r.oc = r.nc AND r.ov = r.nv THEN n_requoted := n_requoted + 1;
    ELSE n_moved := n_moved + 1; RAISE NOTICE 'S463b moved card %: Jubilees %:% -> %:% (%)', r.xid, r.oc, r.ov, r.nc, r.nv, CASE WHEN r.side='T' THEN 'target' ELSE 'source' END; END IF;
  END LOOP;
  END LOOP;

  FOR r IN SELECT m.* FROM _s463bm m LOOP
    UPDATE cross_reference_thread_members SET member_note = r.new_note
     WHERE thread_id = r.thread_id AND cross_reference_id = r.xid AND member_note IS DISTINCT FROM r.new_note;
    IF FOUND THEN n_mem := n_mem + 1; END IF;
  END LOOP;

  FOR r IN SELECT s.* FROM _s463bs s LOOP
    UPDATE cross_reference_threads SET summary_md = r.new_summary WHERE id = r.thread_id AND summary_md = r.old_summary;
    IF FOUND THEN n_sum := n_sum + 1;
    ELSIF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE id = r.thread_id AND summary_md = r.new_summary) THEN
      n_sum_skip := n_sum_skip + 1; RAISE NOTICE 'S463b SKIPPED thread % summary: live text is neither the old nor the new', r.thread_id;
    END IF;
  END LOOP;

  RAISE NOTICE 'S463b summary: notes rebuilt in place %, moved %, already landed %, skipped %, absent %; member notes updated %; summaries updated % (skipped %)',
    n_requoted, n_moved, n_same, n_skipped, n_absent, n_mem, n_sum, n_sum_skip;
  IF n_skipped + n_absent + n_sum_skip > 0 THEN RAISE NOTICE 'S463b: read the SKIPPED/absent lines above — those rows still carry the old text'; END IF;
END $fix$;
COMMIT;
\\echo 'session463b — done.'
"""
OUT.write_text(sql)
print('cards', len(rows), 'moves', n_moves, 'rebuilt', n_rebuilt, 'member rows', len(mrows), 'summaries', len(srows), 'bytes', len(sql), '->', OUT)
