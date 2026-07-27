-- =====================================================================
-- Session 428 migration — Amos 3:7 rewording (clearer, translation-comparable)
-- =====================================================================
--   FROM: "Surely Adonai Yahuah (the Lord GOD) will do nothing, but he
--          revealeth his secret unto his servants the prophets."
--   TO:   "Surely Adonai Yahuah (the Lord GOD) does nothing without first
--          revealing his secret unto his servants the prophets."
-- Canon edition only. Keyed editions.slug='canon' -> books.slug='amos'
-- -> chapters.chapter_number=3 -> verses.verse_number=7. Idempotent + verify.
--
-- Run:  python3 api/apply_migration.py data-schema/migrations/session428_amos3_7_rewording.sql
-- =====================================================================
BEGIN;

DO $before$
DECLARE t TEXT;
BEGIN
  SELECT v.text INTO t FROM verses v
    JOIN chapters c ON c.id=v.chapter_id AND c.chapter_number=3
    JOIN books b ON b.id=c.book_id AND b.slug='amos'
    JOIN editions e ON e.id=b.edition_id AND e.slug='canon'
   WHERE v.verse_number=7;
  RAISE NOTICE 'Amos 3:7 (before) = %', t;
END $before$;

UPDATE verses v
   SET text = 'Surely Adonai Yahuah (the Lord GOD) does nothing without first revealing his secret unto his servants the prophets.'
  FROM chapters c, books b, editions e
 WHERE v.chapter_id = c.id AND c.chapter_number = 3
   AND c.book_id = b.id    AND b.slug = 'amos'
   AND b.edition_id = e.id AND e.slug = 'canon'
   AND v.verse_number = 7
   AND v.text IS DISTINCT FROM 'Surely Adonai Yahuah (the Lord GOD) does nothing without first revealing his secret unto his servants the prophets.';

DO $verify$
DECLARE t TEXT; cnt INT;
BEGIN
  SELECT count(*), max(v.text) INTO cnt, t FROM verses v
    JOIN chapters c ON c.id=v.chapter_id AND c.chapter_number=3
    JOIN books b ON b.id=c.book_id AND b.slug='amos'
    JOIN editions e ON e.id=b.edition_id AND e.slug='canon'
   WHERE v.verse_number=7;
  IF cnt<>1 THEN RAISE EXCEPTION 'Amos 3:7 — expected 1 row, found %', cnt; END IF;
  IF t IS DISTINCT FROM 'Surely Adonai Yahuah (the Lord GOD) does nothing without first revealing his secret unto his servants the prophets.' THEN
    RAISE EXCEPTION 'Amos 3:7 NOT corrected. got=%', t;
  END IF;
  RAISE NOTICE 'Amos 3:7 (after) OK = %', t;
END $verify$;

COMMIT;
