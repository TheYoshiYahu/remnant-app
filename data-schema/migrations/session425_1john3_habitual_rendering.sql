-- =====================================================================
-- Session 425 migration — 1 John 3:4–8 habitual-present rendering
-- =====================================================================
-- Retranslates 1 John 3:4,5,6,7,8 on the CANON edition from the KJV base
-- to a clear, original habitual-present rendering (the Greek present tense
-- = a continual practice of sin, not a single act), independently worded
-- (not tracking any modern copyrighted translation). Verse 8 keeps the
-- already-restored "Son of Elohim (God)".
--
-- Keyed by editions.slug='canon' -> books.slug='1-john'
-- -> chapters.chapter_number=3 -> verses.verse_number in (4,5,6,7,8),
-- updating verses.text (the display-text column the reader UI serves).
--
-- Idempotent: each UPDATE carries `AND v.text IS DISTINCT FROM <new>`, so a
-- re-run after the first apply matches zero rows and is a no-op. The verify
-- block asserts the FINAL state equals the corrected text for all five
-- verses (true on first apply and on any re-run) and fails loudly if any
-- target row is missing or uncorrected.
--
-- Run in the Render remnant-app-api Shell (cwd /app):
--   python3 apply_migration.py /data-schema/migrations/session425_1john3_habitual_rendering.sql
-- =====================================================================

BEGIN;

-- Report pre-images so the operator sees what is changing.
DO $before$
DECLARE r RECORD;
BEGIN
  FOR r IN
    SELECT v.verse_number AS n, v.text AS t
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 3
      JOIN books    b ON b.id = c.book_id    AND b.slug = '1-john'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number IN (4,5,6,7,8)
     ORDER BY v.verse_number
  LOOP
    RAISE NOTICE '1 John 3:% (before) = %', r.n, r.t;
  END LOOP;
END $before$;

UPDATE verses v
   SET text = 'Everyone who goes on sinning is living in lawlessness; and this is what sin is — lawlessness.'
  FROM chapters c, books b, editions e
 WHERE v.chapter_id = c.id AND c.chapter_number = 3
   AND c.book_id = b.id    AND b.slug = '1-john'
   AND b.edition_id = e.id AND e.slug = 'canon'
   AND v.verse_number = 4
   AND v.text IS DISTINCT FROM 'Everyone who goes on sinning is living in lawlessness; and this is what sin is — lawlessness.';

UPDATE verses v
   SET text = 'And you know that he was revealed to take our sins away — and in him there is no sin at all.'
  FROM chapters c, books b, editions e
 WHERE v.chapter_id = c.id AND c.chapter_number = 3
   AND c.book_id = b.id    AND b.slug = '1-john'
   AND b.edition_id = e.id AND e.slug = 'canon'
   AND v.verse_number = 5
   AND v.text IS DISTINCT FROM 'And you know that he was revealed to take our sins away — and in him there is no sin at all.';

UPDATE verses v
   SET text = 'No one who remains in him goes on sinning; whoever keeps on sinning has neither seen him nor come to know him.'
  FROM chapters c, books b, editions e
 WHERE v.chapter_id = c.id AND c.chapter_number = 3
   AND c.book_id = b.id    AND b.slug = '1-john'
   AND b.edition_id = e.id AND e.slug = 'canon'
   AND v.verse_number = 6
   AND v.text IS DISTINCT FROM 'No one who remains in him goes on sinning; whoever keeps on sinning has neither seen him nor come to know him.';

UPDATE verses v
   SET text = 'Little children, do not let anyone lead you astray: whoever practices righteousness is righteous, just as he is righteous.'
  FROM chapters c, books b, editions e
 WHERE v.chapter_id = c.id AND c.chapter_number = 3
   AND c.book_id = b.id    AND b.slug = '1-john'
   AND b.edition_id = e.id AND e.slug = 'canon'
   AND v.verse_number = 7
   AND v.text IS DISTINCT FROM 'Little children, do not let anyone lead you astray: whoever practices righteousness is righteous, just as he is righteous.';

UPDATE verses v
   SET text = 'Whoever goes on sinning belongs to the devil, for the devil has been sinning from the very beginning. This is why the Son of Elohim (God) was revealed: to undo the works of the devil.'
  FROM chapters c, books b, editions e
 WHERE v.chapter_id = c.id AND c.chapter_number = 3
   AND c.book_id = b.id    AND b.slug = '1-john'
   AND b.edition_id = e.id AND e.slug = 'canon'
   AND v.verse_number = 8
   AND v.text IS DISTINCT FROM 'Whoever goes on sinning belongs to the devil, for the devil has been sinning from the very beginning. This is why the Son of Elohim (God) was revealed: to undo the works of the devil.';

-- Verify final state (fails loudly if any target row is missing or uncorrected).
DO $verify$
DECLARE
  expected JSONB := jsonb_build_object(
    '4', 'Everyone who goes on sinning is living in lawlessness; and this is what sin is — lawlessness.',
    '5', 'And you know that he was revealed to take our sins away — and in him there is no sin at all.',
    '6', 'No one who remains in him goes on sinning; whoever keeps on sinning has neither seen him nor come to know him.',
    '7', 'Little children, do not let anyone lead you astray: whoever practices righteousness is righteous, just as he is righteous.',
    '8', 'Whoever goes on sinning belongs to the devil, for the devil has been sinning from the very beginning. This is why the Son of Elohim (God) was revealed: to undo the works of the devil.'
  );
  n TEXT; got TEXT; want TEXT; cnt INT;
BEGIN
  FOR n IN SELECT jsonb_object_keys(expected) LOOP
    want := expected ->> n;
    SELECT count(*), max(v.text) INTO cnt, got
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 3
      JOIN books    b ON b.id = c.book_id    AND b.slug = '1-john'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = n::int;
    IF cnt <> 1 THEN
      RAISE EXCEPTION '1 John 3:% — expected exactly 1 row, found %', n, cnt;
    END IF;
    IF got IS DISTINCT FROM want THEN
      RAISE EXCEPTION '1 John 3:% NOT corrected. got=%', n, got;
    END IF;
    RAISE NOTICE '1 John 3:% (after) OK = %', n, got;
  END LOOP;
END $verify$;

COMMIT;
