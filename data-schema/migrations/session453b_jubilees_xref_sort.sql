-- =====================================================================
-- Session 453b migration — 2026-10-17
-- Jubilees cross-reference cards: move each card to the verse it quotes
-- =====================================================================
-- Context: until S453 the app's Jubilees had 243 rows each holding 2-3 verses.
-- Cards written on (or pointing at) such a row and quoting a verse that is now
-- its own row are moved there. Assignment is by READING: the card note's own
-- italic quotation is matched against the Charles verses of that chapter
-- (source-texts/jubilees-charles-1917/card_sort.py; report jub-card-sort-report.md).
-- side 's' = the card's SOURCE is the Jubilees verse; 't' = its TARGET is.
-- A move is SKIPPED (and reported) if a card already sits on the destination
-- pair. Not-found moves (card edited since the local copy) are reported.
-- Idempotent. Run AFTER session453_jubilees_fix.sql:
--   python3 api/apply_migration.py data-schema/migrations/session453b_jubilees_xref_sort.sql
-- =====================================================================
\echo 'session453b — Jubilees xref sort starting...'
BEGIN;
CREATE TEMP TABLE _s453b_mv (side TEXT, jc INT, jv INT, obook TEXT, oc INT, ov INT, nv INT, how TEXT) ON COMMIT DROP;
INSERT INTO _s453b_mv VALUES
    ('t', 31, 18, 'matthew', 1, 1, 19, E'quote→19 (0.64)'),
    ('t', 45, 13, 'genesis', 49, 1, 14, E'quote→14 (1.00)'),
    ('t', 49, 21, 'exodus', 13, 6, 22, E'quote→22 (0.68)'),
    ('t', 45, 13, 'genesis', 48, 5, 14, E'quote→14 (0.72)'),
    ('t', 48, 12, 'exodus', 14, 19, 13, E'quote→13 (1.00)'),
    ('t', 4, 32, '1-chronicles', 1, 4, 33, E'quote→33 (0.72)'),
    ('t', 15, 5, 'genesis', 17, 5, 7, E'quote→7 (0.69)'),
    ('t', 15, 5, 'genesis', 17, 7, 9, E'quote→9 (1.00)'),
    ('t', 28, 14, 'genesis', 29, 34, 15, E'quote→15 (0.96)'),
    ('t', 28, 14, 'genesis', 29, 35, 15, E'quote→15 (1.00)'),
    ('t', 14, 16, 'genesis', 15, 17, 17, E'quote→17 (1.00)'),
    ('t', 27, 21, 'genesis', 28, 13, 22, E'quote→22 (0.85)'),
    ('t', 27, 26, 'genesis', 28, 20, 27, E'quote→27 (1.00)'),
    ('t', 39, 11, 'genesis', 39, 20, 12, E'quote→12 (0.70)'),
    ('t', 39, 11, 'genesis', 39, 21, 12, E'quote→12 (1.00)'),
    ('t', 11, 14, 'genesis', 11, 28, 16, E'quote→16 (0.62)'),
    ('t', 13, 20, 'genesis', 13, 17, 21, E'quote→21 (1.00)'),
    ('t', 13, 15, 'genesis', 13, 4, 8, E'quote→8 (0.72)'),
    ('t', 13, 7, 'genesis', 12, 7, 8, E'quote→8 (1.00)'),
    ('t', 13, 12, 'genesis', 12, 17, 13, E'quote→13 (1.00)'),
    ('t', 34, 16, 'genesis', 37, 35, 17, E'quote→17 (1.00)'),
    ('t', 18, 1, 'genesis', 22, 2, 2, E'quote→2 (1.00)'),
    ('t', 18, 12, 'genesis', 22, 14, 13, E'quote→13 (1.00)'),
    ('t', 18, 14, 'genesis', 22, 16, 15, E'quote→15 (1.00)'),
    ('t', 38, 14, 'genesis', 36, 31, 15, E'quote→15 (1.00)'),
    ('t', 16, 9, 'genesis', 20, 1, 10, E'quote→10 (1.00)'),
    ('t', 30, 11, 'genesis', 34, 14, 12, E'quote→12 (1.00)'),
    ('t', 31, 13, 'genesis', 35, 23, 14, E'quote→14 (1.00)'),
    ('t', 16, 6, 'genesis', 19, 29, 7, E'quote→7 (1.00)'),
    ('t', 16, 6, 'genesis', 18, 23, 7, E'quote→7 (1.00)'),
    ('t', 19, 19, 'genesis', 24, 60, 21, E'quote→21 (0.71)'),
    ('t', 24, 21, 'genesis', 26, 24, 22, E'quote→22 (1.00)'),
    ('t', 26, 21, 'genesis', 27, 28, 23, E'quote→23 (1.00)'),
    ('t', 26, 31, 'genesis', 27, 38, 32, E'quote→32 (1.00)'),
    ('t', 26, 34, 'genesis', 27, 41, 35, E'quote→35 (1.00)'),
    ('t', 29, 11, 'genesis', 33, 4, 13, E'quote→13 (1.00)'),
    ('t', 29, 11, 'genesis', 33, 16, 13, E'quote→13 (1.00)'),
    ('t', 5, 23, 'genesis', 7, 11, 24, E'quote→24 (0.70)'),
    ('t', 5, 6, 'genesis', 6, 4, 7, E'quote→7 (0.85)'),
    ('t', 1, 10, '2-chronicles', 11, 15, 11, E'quote→11 (1.00)'),
    ('t', 47, 11, 'exodus', 2, 14, 12, E'quote→12 (0.69)'),
    ('t', 14, 6, 'hosea', 1, 10, 7, E'quote→7 (0.74)'),
    ('t', 48, 7, 'exodus', 6, 6, 8, E'quote→8 (0.64)'),
    ('t', 16, 12, 'galatians', 4, 23, 13, E'quote→13 (0.63)'),
    ('s', 44, 34, 'genesis', 46, 12, 15, E'cite→15'),
    ('t', 36, 11, 'jasher', 47, 19, 12, E'quote→12 (0.64)'),
    ('s', 47, 6, 'acts', 7, 21, 5, E'cite→5'),
    ('t', 6, 37, '1-enoch', 74, 12, 38, E'quote→38 (1.00)'),
    ('t', 39, 6, 'jasher', 46, 11, 7, E'quote→7 (1.00)'),
    ('t', 3, 11, '1-adam-eve', 41, 5, 12, E'quote→12 (1.00)'),
    ('t', 45, 11, 'jasher', 55, 30, 12, E'quote→12 (0.72)'),
    ('t', 39, 11, 'jubilees', 40, 8, 12, E'quote→12 (0.63)'),
    ('s', 26, 5, 'genesis', 27, 5, 3, E'cite→3'),
    ('s', 26, 24, 'hebrews', 11, 20, 21, E'cite→21'),
    ('t', 4, 25, '2-adam-eve', 21, 7, 26, E'quote→26 (0.79)'),
    ('t', 29, 11, 'jasher', 32, 73, 13, E'quote→13 (1.00)'),
    ('t', 4, 12, '2-adam-eve', 2, 7, 13, E'quote→13 (0.77)'),
    ('t', 29, 17, 'jasher', 30, 27, 18, E'quote→18 (1.00)'),
    ('t', 19, 17, 'jubilees', 24, 26, 18, E'quote→18 (1.00)'),
    ('s', 30, 14, 'ezra', 9, 12, 11, E'cite→11'),
    ('s', 25, 9, 'genesis', 26, 35, 1, E'cite→1'),
    ('s', 25, 17, 'genesis', 17, 7, 21, E'cite→21'),
    ('s', 19, 2, 'genesis', 23, 1, 6, E'cite→6'),
    ('s', 19, 11, 'genesis', 25, 2, 12, E'quote→12 (0.70)'),
    ('s', 19, 17, 'romans', 9, 11, 16, E'cite→16'),
    ('s', 19, 28, 'romans', 9, 4, 29, E'cite→29'),
    ('t', 4, 12, '2-adam-eve', 7, 7, 13, E'quote→13 (0.77)'),
    ('t', 4, 25, '2-adam-eve', 7, 9, 26, E'quote→26 (0.79)'),
    ('s', 21, 24, '1-enoch', 10, 16, 10, E'cite→10'),
    ('s', 9, 9, 'genesis', 10, 2, 8, E'cite→8'),
    ('s', 9, 10, 'genesis', 10, 5, 9, E'cite→9'),
    ('t', 16, 9, 'jasher', 20, 1, 10, E'quote→10 (1.00)'),
    ('t', 12, 2, 'jasher', 8, 28, 4, E'quote→4 (0.69)'),
    ('s', 20, 2, 'deuteronomy', 6, 7, 1, E'cite→1'),
    ('s', 20, 8, 'jeremiah', 10, 15, 7, E'cite→7'),
    ('t', 4, 10, '2-adam-eve', 19, 4, 11, E'quote→11 (0.69)'),
    ('t', 3, 21, '1-adam-eve', 48, 1, 22, E'quote→22 (0.61)'),
    ('t', 18, 1, 'jasher', 23, 1, 2, E'quote→2 (0.70)'),
    ('t', 5, 11, '1-enoch', 11, 6, 12, E'quote→12 (1.00)'),
    ('s', 37, 3, 'genesis', 25, 32, 1, E'cite→1'),
    ('s', 37, 10, 'amos', 1, 11, 9, E'cite→9'),
    ('t', 5, 23, 'jasher', 6, 14, 24, E'quote→24 (1.00)'),
    ('s', 12, 27, 'genesis', 11, 6, 26, E'cite→26'),
    ('s', 6, 13, 'leviticus', 17, 10, 11, E'cite→11'),
    ('s', 13, 12, 'genesis', 12, 17, 13, E'quote→13 (0.97)'),
    ('t', 13, 2, 'jasher', 13, 7, 3, E'quote→3 (1.00)'),
    ('s', 11, 17, 'acts', 7, 3, 14, E'cite→14'),
    ('s', 4, 17, 'genesis', 5, 24, 23, E'cite→23'),
    ('t', 8, 18, '1-enoch', 26, 2, 19, E'quote→19 (1.00)'),
    ('s', 14, 5, 'genesis', 15, 5, 4, E'cite→4'),
    ('t', 6, 17, 'jubilees', 14, 20, 18, E'quote→18 (0.67)'),
    ('s', 29, 11, 'deuteronomy', 3, 11, 9, E'cite→9'),
    ('t', 27, 26, 'jubilees', 29, 20, 27, E'quote→27 (1.00)'),
    ('t', 13, 12, 'jasher', 15, 28, 13, E'quote→13 (1.00)'),
    ('s', 15, 30, 'deuteronomy', 32, 8, 31, E'cite→31'),
    ('s', 17, 6, 'galatians', 4, 30, 4, E'cite→4'),
    ('t', 4, 25, '1-enoch', 24, 9, 26, E'quote→26 (1.00)'),
    ('t', 6, 37, '1-enoch', 82, 3, 38, E'quote→38 (0.83)'),
    ('t', 6, 37, '1-enoch', 92, 3, 38, E'quote→38 (1.00)'),
    ('s', 48, 16, 'revelation', 15, 3, 15, E'cite→15'),
    ('t', 6, 17, 'acts', 2, 1, 18, E'quote→18 (0.67)'),
    ('t', 5, 23, '2-peter', 3, 6, 29, E'quote→29 (1.00)');

CREATE TEMP VIEW _s453b_v AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $sort$
DECLARE m RECORD; xid INT; nid INT; dup INT; moved INT := 0; skipped INT := 0; absent INT := 0;
BEGIN
  FOR m IN SELECT * FROM _s453b_mv ORDER BY jc, jv, nv LOOP
    SELECT id INTO nid FROM _s453b_v WHERE es='jubilees' AND bs='jubilees' AND ch=m.jc AND vn=m.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S453b: destination Jubilees %:% missing — run session453_jubilees_fix.sql first', m.jc, m.nv; END IF;
    IF m.side = 's' THEN
      SELECT x.id INTO xid FROM cross_references x
        JOIN _s453b_v s ON s.id=x.source_verse_id AND s.es='jubilees' AND s.bs='jubilees' AND s.ch=m.jc AND s.vn=m.jv
        JOIN _s453b_v t ON t.id=x.target_verse_id AND t.bs=m.obook AND t.ch=m.oc AND t.vn=m.ov
       LIMIT 1;
    ELSE
      SELECT x.id INTO xid FROM cross_references x
        JOIN _s453b_v t ON t.id=x.target_verse_id AND t.es='jubilees' AND t.bs='jubilees' AND t.ch=m.jc AND t.vn=m.jv
        JOIN _s453b_v s ON s.id=x.source_verse_id AND s.bs=m.obook AND s.ch=m.oc AND s.vn=m.ov
       LIMIT 1;
    END IF;
    IF xid IS NULL THEN
      absent := absent + 1;
      RAISE NOTICE 'S453b not found (edited since, or never seeded): side % Jubilees %:% <-> % %:%', m.side, m.jc, m.jv, m.obook, m.oc, m.ov;
      CONTINUE;
    END IF;
    IF m.side = 's' THEN
      SELECT count(*) INTO dup FROM cross_references x JOIN _s453b_v t ON t.id=x.target_verse_id AND t.bs=m.obook AND t.ch=m.oc AND t.vn=m.ov
       WHERE x.source_verse_id = nid AND x.id <> xid;
    ELSE
      SELECT count(*) INTO dup FROM cross_references x JOIN _s453b_v s ON s.id=x.source_verse_id AND s.bs=m.obook AND s.ch=m.oc AND s.vn=m.ov
       WHERE x.target_verse_id = nid AND x.id <> xid;
    END IF;
    IF dup > 0 THEN
      skipped := skipped + 1;
      RAISE NOTICE 'S453b SKIPPED card % (Jubilees %:% -> %:%, other end % %:%): a card already sits there', xid, m.jc, m.jv, m.jc, m.nv, m.obook, m.oc, m.ov;
      CONTINUE;
    END IF;
    IF m.side = 's' THEN
      UPDATE cross_references SET source_verse_id = nid,
             note = regexp_replace(coalesce(note,''), 'Jubilees ' || m.jc || ':' || m.jv || '(?!\d)', 'Jubilees ' || m.jc || ':' || m.nv, 'g')
       WHERE id = xid;
    ELSE
      UPDATE cross_references SET target_verse_id = nid,
             note = regexp_replace(coalesce(note,''), 'Jubilees ' || m.jc || ':' || m.jv || '(?!\d)', 'Jubilees ' || m.jc || ':' || m.nv, 'g')
       WHERE id = xid;
    END IF;
    moved := moved + 1;
    RAISE NOTICE 'S453b moved card % (%): Jubilees %:% -> %:%  other end % %:%  [%]', xid, m.side, m.jc, m.jv, m.jc, m.nv, m.obook, m.oc, m.ov, m.how;
  END LOOP;
  RAISE NOTICE 'S453b cards moved: %, skipped (duplicate at destination): %, not found: %', moved, skipped, absent;
END $sort$;
COMMIT;
\echo 'session453b — done.'
