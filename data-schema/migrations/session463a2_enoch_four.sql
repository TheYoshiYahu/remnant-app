-- =====================================================================
-- Session 463a2 migration — 2026-10-23
-- 1 Enoch close-out, the 4 cards S463a left as questions — retired.
-- Each stands on a 1 Enoch verse that no longer says what its note says (the S449 rebuild
-- renumbered the chapter), and the verse the note actually describes already carries the
-- same canon pairing on another card. Moving them would duplicate; so they are retired:
--   25364  1 Enoch 95:6  -> Amos 6:6     note describes 96:5 (wine in large bowls) — 25467 already pairs Amos 6:6 with 96:5
--   25399  1 Enoch 97:6  -> Amos 6:6     same — 25467 on 96:5
--   25466  1 Enoch 97:8  -> James 5:4    note describes the labourers/husbandmen woe — 25362 already pairs James 5:4 with 97:9
--   25486  1 Enoch 103:14 -> Isaiah 5:8  note describes 97:8 (gold and silver in unrighteousness) — 25504 already pairs Isaiah 5:8 with 97:8
-- Safety: a card is retired only if it still stands at the address above AND its twin is live on the
-- expected pair; otherwise it is skipped with a NOTICE and left as is. Member rows go first (FK RESTRICT).
-- Idempotent: a re-run finds the cards absent and reports 0 retired.
-- Run: python3 api/apply_migration.py data-schema/migrations/session463a2_enoch_four.sql
-- =====================================================================
\echo 'session463a2 — retiring the 4 S463a question cards...'
BEGIN;
CREATE TEMP TABLE _s463q (xid INT, ech INT, evn INT, cbook TEXT, cch INT, cvn INT, twin INT, tch INT, tvn INT) ON COMMIT DROP;
INSERT INTO _s463q VALUES
(25364, 95, 6,  'amos',   6, 6, 25467, 96, 5),
(25399, 97, 6,  'amos',   6, 6, 25467, 96, 5),
(25466, 97, 8,  'james',  5, 4, 25362, 97, 9),
(25486, 103, 14,'isaiah', 5, 8, 25504, 97, 8);

CREATE TEMP VIEW _s463qv AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $fix$
DECLARE r RECORD; cur RECORD; tw RECORD; n_ret INT := 0; n_retm INT := 0; n_skip INT := 0; n_absent INT := 0; k INT;
BEGIN
  FOR r IN SELECT * FROM _s463q ORDER BY xid LOOP
    SELECT x.id, s.es ses, s.ch sch, s.vn svn, t.bs tbs, t.ch tch, t.vn tvn INTO cur
      FROM cross_references x JOIN _s463qv s ON s.id = x.source_verse_id JOIN _s463qv t ON t.id = x.target_verse_id
     WHERE x.id = r.xid;
    IF cur.id IS NULL THEN n_absent := n_absent + 1; RAISE NOTICE 'S463a2 card % absent (already retired)', r.xid; CONTINUE; END IF;
    IF NOT (cur.ses = 'enoch' AND cur.sch = r.ech AND cur.svn = r.evn AND cur.tbs = r.cbook AND cur.tch = r.cch AND cur.tvn = r.cvn) THEN
      n_skip := n_skip + 1;
      RAISE NOTICE 'S463a2 SKIPPED card %: now at % %:% -> % %:%, expected 1 Enoch %:% -> % %:% (edited since the read-back)',
        r.xid, cur.ses, cur.sch, cur.svn, cur.tbs, cur.tch, cur.tvn, r.ech, r.evn, r.cbook, r.cch, r.cvn;
      CONTINUE;
    END IF;
    SELECT x.id, s.es ses, s.ch sch, s.vn svn, t.bs tbs, t.ch tch, t.vn tvn INTO tw
      FROM cross_references x JOIN _s463qv s ON s.id = x.source_verse_id JOIN _s463qv t ON t.id = x.target_verse_id
     WHERE x.id = r.twin;
    IF tw.id IS NULL OR NOT (tw.ses = 'enoch' AND tw.sch = r.tch AND tw.svn = r.tvn AND tw.tbs = r.cbook AND tw.tch = r.cch AND tw.tvn = r.cvn) THEN
      n_skip := n_skip + 1;
      RAISE NOTICE 'S463a2 SKIPPED card %: its twin % is not live on 1 Enoch %:% -> % %:% — nothing would carry the pairing', r.xid, r.twin, r.tch, r.tvn, r.cbook, r.cch, r.cvn;
      CONTINUE;
    END IF;
    DELETE FROM cross_reference_thread_members WHERE cross_reference_id = r.xid; GET DIAGNOSTICS k = ROW_COUNT; n_retm := n_retm + k;
    DELETE FROM cross_references WHERE id = r.xid; n_ret := n_ret + 1;
    RAISE NOTICE 'S463a2 retired card % (1 Enoch %:% -> % %:%); pairing carried by % on 1 Enoch %:%', r.xid, r.ech, r.evn, r.cbook, r.cch, r.cvn, r.twin, r.tch, r.tvn;
  END LOOP;
  RAISE NOTICE 'S463a2 summary: cards retired % (member rows %), skipped %, already absent %', n_ret, n_retm, n_skip, n_absent;
END $fix$;
COMMIT;
\echo 'session463a2 — done.'
