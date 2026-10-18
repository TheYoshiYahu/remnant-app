-- =====================================================================
-- Session 454b migration — 2026-10-17
-- Rest of Esther 10 cross-reference cards: move each card to the verse it describes
-- =====================================================================
-- Until S454 the app's Rest of Esther 10 was ONE row (old 10:1 = KJV 10:4-13; now 10:4).
-- Its 12 session253 cards and 4 threads sit on that row. Each card's note names the
-- verse it is written on ("The Rest of Esther 10:N") — the card moves there (report:
-- source-texts/apocrypha-kjv-ebible/apoc-card-sort-report.md). Thread anchors are set to
-- the span of their members. Skips a move if a card already sits on the destination pair.
-- Idempotent. Run AFTER session454_apocrypha_fix.sql:
--   python3 api/apply_migration.py data-schema/migrations/session454b_apocrypha_xref_sort.sql
-- =====================================================================
\echo 'session454b — Rest of Esther 10 xref sort starting...'
BEGIN;
CREATE TEMP TABLE _s454b_mv (obook TEXT, oc INT, ov INT, nv INT, how TEXT) ON COMMIT DROP;
INSERT INTO _s454b_mv VALUES
    ('esther', 9, 1, 6, E'note cites The Rest of Esther 10:6'),
    ('genesis', 50, 20, 5, E'note cites The Rest of Esther 10:5'),
    ('romans', 8, 28, 5, E'note cites The Rest of Esther 10:5'),
    ('exodus', 17, 8, 7, E'note cites The Rest of Esther 10:7'),
    ('deuteronomy', 25, 17, 8, E'note cites The Rest of Esther 10:8'),
    ('deuteronomy', 25, 19, 8, E'note cites The Rest of Esther 10:8'),
    ('psalms', 124, 1, 9, E'note cites The Rest of Esther 10:9'),
    ('psalms', 124, 3, 9, E'note cites The Rest of Esther 10:9'),
    ('isaiah', 54, 17, 9, E'note cites The Rest of Esther 10:9'),
    ('matthew', 25, 32, 11, E'note cites The Rest of Esther 10:11'),
    ('leviticus', 23, 4, 13, E'note cites The Rest of Esther 10:13'),
    ('esther', 9, 22, 13, E'note cites The Rest of Esther 10:13');
CREATE TEMP TABLE _s454b_an (slug TEXT, va INT, vb INT) ON COMMIT DROP;
INSERT INTO _s454b_an VALUES
    ('rest-of-esther-10-the-dream-interpreted-hidden-hand', 5, 6),
    ('rest-of-esther-10-two-dragons-seed-war-amalek', 7, 8),
    ('rest-of-esther-10-cried-to-yahuah-and-were-saved', 9, 9),
    ('rest-of-esther-10-two-lots-day-of-judgment-feast', 11, 13);
CREATE TEMP VIEW _s454b_v AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $sort$
DECLARE m RECORD; a RECORD; xid INT; nid INT; aid INT; bid INT; dup INT; moved INT := 0; skipped INT := 0; absent INT := 0; left_ INT;
BEGIN
  FOR m IN SELECT * FROM _s454b_mv ORDER BY nv LOOP
    SELECT id INTO nid FROM _s454b_v WHERE es='apocrypha' AND bs='the-rest-of-esther' AND ch=10 AND vn=m.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S454b: destination Rest of Esther 10:% missing — run session454_apocrypha_fix.sql first', m.nv; END IF;
    SELECT x.id INTO xid FROM cross_references x
      JOIN _s454b_v s ON s.id=x.source_verse_id AND s.es='apocrypha' AND s.bs='the-rest-of-esther' AND s.ch=10 AND s.vn=4
      JOIN _s454b_v t ON t.id=x.target_verse_id AND t.es='canon' AND t.bs=m.obook AND t.ch=m.oc AND t.vn=m.ov LIMIT 1;
    IF xid IS NULL THEN absent := absent + 1; RAISE NOTICE 'S454b not found (already moved, or edited): Rest of Esther 10:4 -> % %:%', m.obook, m.oc, m.ov; CONTINUE; END IF;
    SELECT count(*) INTO dup FROM cross_references x JOIN _s454b_v t ON t.id=x.target_verse_id AND t.es='canon' AND t.bs=m.obook AND t.ch=m.oc AND t.vn=m.ov
     WHERE x.source_verse_id = nid AND x.id <> xid;
    IF dup > 0 THEN skipped := skipped + 1; RAISE NOTICE 'S454b SKIPPED card %: a card already sits on 10:% -> % %:%', xid, m.nv, m.obook, m.oc, m.ov; CONTINUE; END IF;
    UPDATE cross_references SET source_verse_id = nid WHERE id = xid;
    moved := moved + 1;
    RAISE NOTICE 'S454b moved card %: Rest of Esther 10:4 -> 10:%  (target % %:%)  [%]', xid, m.nv, m.obook, m.oc, m.ov, m.how;
  END LOOP;
  FOR a IN SELECT * FROM _s454b_an LOOP
    SELECT id INTO aid FROM _s454b_v WHERE es='apocrypha' AND bs='the-rest-of-esther' AND ch=10 AND vn=a.va;
    SELECT id INTO bid FROM _s454b_v WHERE es='apocrypha' AND bs='the-rest-of-esther' AND ch=10 AND vn=a.vb;
    UPDATE cross_reference_threads SET anchor_verse_id_start = aid, anchor_verse_id_end = bid WHERE slug = a.slug;
    IF FOUND THEN RAISE NOTICE 'S454b thread % anchored 10:%–10:%', a.slug, a.va, a.vb; ELSE RAISE NOTICE 'S454b thread % NOT FOUND', a.slug; END IF;
  END LOOP;
  SELECT count(*) INTO left_ FROM cross_references x JOIN _s454b_v s ON s.id=x.source_verse_id AND s.es='apocrypha' AND s.bs='the-rest-of-esther' AND s.ch=10 AND s.vn=4;
  RAISE NOTICE 'S454b cards moved: %, skipped: %, not found: %; cards still on Rest of Esther 10:4: % (expect 0 — any left is from a later session, sort by hand)', moved, skipped, absent, left_;
END $sort$;
COMMIT;
\echo 'session454b — done.'
