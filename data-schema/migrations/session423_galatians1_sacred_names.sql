-- =====================================================================
-- Session 423 migration — 2026-07-11  (corrected 2026-07-12)
-- Galatians 1 sacred-name corrections (S182 NT-Lord convention)
-- =====================================================================
-- Two sacred-name fixes on the CANON edition's Galatians chapter 1,
-- keyed by editions.slug='canon' -> books.slug='galatians'
-- -> chapters.chapter_number=1 -> verses.verse_number in (3,19),
-- updating verses.text (the display-text column the reader UI serves).
--
--   1. Galatians 1:3 — the Master's title "Lord" before the name Yahusha
--      renders "Adonai" (S182: the Master's title "Lord" must never
--      collapse to "Yahuah"; here it is named "Adonai"). ONLY the title
--      token changes: "our Lord Yahusha HaMashiach" -> "our Adonai
--      Yahusha HaMashiach". The source-echo parenthetical is left exactly
--      as it stands in the DB.
--
--   2. Galatians 1:19 — the standalone "the Lord['s]" naming the Master is
--      Yahusha, not Yahuah: "James Yahuah('s)" -> "James Yahusha('s)".
--      ONLY the name stem changes; the possessive apostrophe and the
--      "(Lord's)" parenthetical are left exactly as they stand in the DB.
--
-- WHY REPLACE, NOT A FULL-STRING SET (corrected 2026-07-12):
--   The live DB row for 1:3 carries the OLDER parenthetical "(Jesus
--   Christ)" while source-texts/parsed/canon.json carries "(Lord Jesus
--   Christ)". A full-string guard keyed to canon.json therefore matched
--   ZERO rows. This migration instead REPLACEs only the changed token, so
--   it applies regardless of which parenthetical (or apostrophe form) the
--   DB row currently holds, and touches nothing but the sacred name. The
--   pre-existing canon.json-vs-DB parenthetical divergence is out of scope
--   here (a reseed from canon.json aligns it) and is NOT altered.
--
-- Idempotent: each UPDATE is guarded with `AND v.text LIKE '%<old token>%'`
-- and uses REPLACE, so re-running after the first apply matches zero rows
-- and is a no-op. The verify block asserts the FINAL state contains the
-- corrected token and no longer contains the old token (true on first
-- apply and on any re-run), RAISEs NOTICE with the actual before/after
-- text, and fails loudly if a target row is missing or uncorrected.
--
-- Run in the Render remnant-app-api Shell (cwd /app):
--   python3 apply_migration.py /data-schema/migrations/session423_galatians1_sacred_names.sql
-- =====================================================================

BEGIN;

-- Report the pre-images so the operator sees exactly what is being changed.
DO $before$
DECLARE t3 TEXT; t19 TEXT;
BEGIN
    SELECT v.text INTO t3
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 1
      JOIN books    b ON b.id = c.book_id    AND b.slug = 'galatians'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 3;
    SELECT v.text INTO t19
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 1
      JOIN books    b ON b.id = c.book_id    AND b.slug = 'galatians'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 19;
    RAISE NOTICE 'S423 BEFORE  Gal 1:3  : %', t3;
    RAISE NOTICE 'S423 BEFORE  Gal 1:19 : %', t19;
END
$before$;

-- ---------------------------------------------------------------------
-- 1. Galatians 1:3 — "our Lord Yahusha HaMashiach" -> "our Adonai Yahusha HaMashiach"
-- ---------------------------------------------------------------------
UPDATE verses v
   SET text = REPLACE(v.text,
                      'our Lord Yahusha HaMashiach',
                      'our Adonai Yahusha HaMashiach')
  FROM chapters c
  JOIN books    b ON b.id = c.book_id      AND b.slug = 'galatians'
  JOIN editions e ON e.id = b.edition_id   AND e.slug = 'canon'
 WHERE v.chapter_id     = c.id
   AND c.chapter_number = 1
   AND v.verse_number   = 3
   AND v.text LIKE '%our Lord Yahusha HaMashiach%';

-- ---------------------------------------------------------------------
-- 2. Galatians 1:19 — "James Yahuah('s)" -> "James Yahusha('s)"
-- ---------------------------------------------------------------------
UPDATE verses v
   SET text = REPLACE(v.text, 'James Yahuah', 'James Yahusha')
  FROM chapters c
  JOIN books    b ON b.id = c.book_id      AND b.slug = 'galatians'
  JOIN editions e ON e.id = b.edition_id   AND e.slug = 'canon'
 WHERE v.chapter_id     = c.id
   AND c.chapter_number = 1
   AND v.verse_number   = 19
   AND v.text LIKE '%James Yahuah%';

-- ---------------------------------------------------------------------
-- Verify final state (idempotent-safe) + report the after-images.
-- ---------------------------------------------------------------------
DO $verify$
DECLARE t3 TEXT; t19 TEXT;
BEGIN
    SELECT v.text INTO t3
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 1
      JOIN books    b ON b.id = c.book_id    AND b.slug = 'galatians'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 3;
    SELECT v.text INTO t19
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 1
      JOIN books    b ON b.id = c.book_id    AND b.slug = 'galatians'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 19;

    IF t3 IS NULL THEN
        RAISE EXCEPTION 'S423: canon Galatians 1:3 row not found';
    END IF;
    IF t19 IS NULL THEN
        RAISE EXCEPTION 'S423: canon Galatians 1:19 row not found';
    END IF;

    RAISE NOTICE 'S423 AFTER   Gal 1:3  : %', t3;
    RAISE NOTICE 'S423 AFTER   Gal 1:19 : %', t19;

    IF position('our Adonai Yahusha HaMashiach' in t3) = 0
       OR position('our Lord Yahusha HaMashiach' in t3) > 0 THEN
        RAISE EXCEPTION 'S423: Galatians 1:3 title not corrected to Adonai — got %', t3;
    END IF;
    IF position('James Yahusha' in t19) = 0
       OR position('James Yahuah' in t19) > 0 THEN
        RAISE EXCEPTION 'S423: Galatians 1:19 name not corrected to Yahusha — got %', t19;
    END IF;

    RAISE NOTICE 'S423 Galatians 1 sacred-name fix confirmed (v3 Adonai, v19 Yahusha).';
END
$verify$;

COMMIT;
