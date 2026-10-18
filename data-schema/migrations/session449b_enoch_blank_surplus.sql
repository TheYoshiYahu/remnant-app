-- =====================================================================
-- Session 449b migration — 2026-10-15
-- 1 Enoch: blank the surplus verse rows the S449 rebuild could not delete
-- =====================================================================
-- After session449_enoch_full_rebuild.sql, 241 rows above Charles's last
-- verse in their chapter remain because cross_reference cards, thread
-- anchors, 4 reader highlights and 2 reader study notes point at them.
-- They still carried the OLD text (invented, or Charles text from another
-- chapter). This sets their text to a short notice so no invented scripture
-- is shown while the cards are re-pointed or retired (S449 step F).
-- Rows, ids and every reference are untouched. Reversible: the old text is
-- in source-texts/enoch-charles-1917/enoch-surplus-rows.tsv (first 70
-- chars) and in full in parsed/enoch.json.pre-s449.
-- Idempotent. Run:
--   python3 api/apply_migration.py data-schema/migrations/session449b_enoch_blank_surplus.sql
-- =====================================================================
\echo 'session449b — blanking surplus Enoch rows...'
BEGIN;
CREATE TEMP TABLE _s449b_max (ch INT PRIMARY KEY, hi INT) ON COMMIT DROP;
INSERT INTO _s449b_max (ch, hi) VALUES (1,9), (2,3), (3,1), (4,1), (5,9), (6,8), (7,6), (8,4), (9,11), (10,22), (11,2), (12,6), (13,10), (14,25), (15,12), (16,4), (17,8), (18,16), (19,3), (20,8), (21,10), (22,14), (23,4), (24,6), (25,7), (26,6), (27,5), (28,3), (29,2), (30,3), (31,3), (32,6), (33,4), (34,3), (35,1), (36,4), (37,5), (38,6), (39,14), (40,10), (41,9), (42,3), (43,4), (44,1), (45,6), (46,8), (47,4), (48,10), (49,4), (50,5), (51,5), (52,9), (53,7), (54,10), (55,4), (56,8), (57,3), (58,6), (59,3), (60,25), (61,13), (62,16), (63,12), (64,2), (65,12), (66,3), (67,13), (68,5), (69,29), (70,4), (71,17), (72,37), (73,8), (74,17), (75,9), (76,14), (77,8), (78,17), (79,6), (80,8), (81,10), (82,20), (83,11), (84,6), (85,10), (86,6), (87,4), (88,3), (89,77), (90,42), (91,19), (92,5), (93,14), (94,11), (95,7), (96,8), (97,10), (98,16), (99,16), (100,13), (101,9), (102,11), (103,15), (104,13), (105,2), (106,19), (107,3), (108,15);

UPDATE verses v
   SET text = '[Not in 1 Enoch. This verse number was removed when the text was corrected to the R.H. Charles 1917 edition; see the chapter above.]'
  FROM chapters c, books b, editions e, _s449b_max m
 WHERE v.chapter_id = c.id AND c.book_id = b.id AND b.slug = '1-enoch'
   AND b.edition_id = e.id AND e.slug = 'enoch'
   AND m.ch = c.chapter_number AND v.verse_number > m.hi
   AND v.text NOT LIKE '[Not in 1 Enoch.%';

DO $verify$
DECLARE n INT; bad INT;
BEGIN
    SELECT count(*) INTO n FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id AND b.slug='1-enoch'
      JOIN editions e ON e.id=b.edition_id AND e.slug='enoch' JOIN _s449b_max m ON m.ch=c.chapter_number
     WHERE v.verse_number > m.hi AND v.text LIKE '[Not in 1 Enoch.%';
    SELECT count(*) INTO bad FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id AND b.slug='1-enoch'
      JOIN editions e ON e.id=b.edition_id AND e.slug='enoch' JOIN _s449b_max m ON m.ch=c.chapter_number
     WHERE v.verse_number > m.hi AND v.text NOT LIKE '[Not in 1 Enoch.%';
    IF bad <> 0 THEN RAISE EXCEPTION 'S449b: % surplus rows still carry old text', bad; END IF;
    RAISE NOTICE 'S449b: % surplus Enoch rows now blanked', n;
END
$verify$;
COMMIT;
\echo 'session449b — done.'
