-- =====================================================================
-- Session 423 migration — 2026-07-11
-- Galatians 1 sacred-name corrections (S182 NT-Lord convention)
-- =====================================================================
-- Two sacred-name fixes on the CANON edition's Galatians chapter 1,
-- keyed by the natural key editions.slug='canon' -> books.slug='galatians'
-- -> chapters.chapter_number=1 -> verses.verse_number in (3,19),
-- updating verses.text (the display-text column the reader UI serves).
--
--   1. Galatians 1:3 — the Master's title "Lord" before the name Yahusha
--      renders as "Adonai" per Yoshi's decision under the S182 NT-Lord
--      convention (the Master's title "Lord" must never collapse to
--      "Yahuah"; here it is named "Adonai"). Only the single title word
--      changes: "our Lord Yahusha HaMashiach" -> "our Adonai Yahusha
--      HaMashiach". The source-echo parenthetical "(Lord Jesus Christ)"
--      is left unchanged.
--
--   2. Galatians 1:19 — "James Yahuah's (Lord's) brother" is corrected to
--      "James Yahusha's (Lord's) brother". The standalone "the Lord['s]"
--      naming the Master is Yahusha, not Yahuah. The source-echo curly
--      apostrophe in the "(Lord's)" parenthetical is preserved exactly.
--
-- Mirrors source-texts/parsed/canon.json (the reseed source) so the fix
-- is live now AND permanent on reseed.
--
-- Idempotent: each UPDATE is guarded with `AND v.text = <old string>`, so
-- the row changes only on the first apply; re-running matches zero rows.
-- The verify block asserts the FINAL state equals the corrected string
-- (true both on first apply and on any re-run), and fails loudly if a
-- target row is missing or its text drifted to an unexpected value.
--
-- Run in the Render remnant-app-api Shell (cwd /app):
--   python3 apply_migration.py /data-schema/migrations/session423_galatians1_sacred_names.sql
-- =====================================================================

BEGIN;

-- ---------------------------------------------------------------------
-- 1. Galatians 1:3 — "our Lord Yahusha HaMashiach" -> "our Adonai Yahusha HaMashiach"
-- ---------------------------------------------------------------------
UPDATE verses v
   SET text = $gal$Grace be to you and peace from Elohim (God) the Father, and from our Adonai Yahusha HaMashiach (Lord Jesus Christ),$gal$
  FROM chapters c
  JOIN books    b ON b.id = c.book_id      AND b.slug = 'galatians'
  JOIN editions e ON e.id = b.edition_id   AND e.slug = 'canon'
 WHERE v.chapter_id     = c.id
   AND c.chapter_number = 1
   AND v.verse_number   = 3
   AND v.text = $gal$Grace be to you and peace from Elohim (God) the Father, and from our Lord Yahusha HaMashiach (Lord Jesus Christ),$gal$;

-- ---------------------------------------------------------------------
-- 2. Galatians 1:19 — "James Yahuah's (Lord's)" -> "James Yahusha's (Lord's)"
-- ---------------------------------------------------------------------
UPDATE verses v
   SET text = $gal$But other of the apostles saw I none, save James Yahusha's (Lord’s) brother.$gal$
  FROM chapters c
  JOIN books    b ON b.id = c.book_id      AND b.slug = 'galatians'
  JOIN editions e ON e.id = b.edition_id   AND e.slug = 'canon'
 WHERE v.chapter_id     = c.id
   AND c.chapter_number = 1
   AND v.verse_number   = 19
   AND v.text = $gal$But other of the apostles saw I none, save James Yahuah's (Lord’s) brother.$gal$;

-- ---------------------------------------------------------------------
-- Verify final state (idempotent-safe: asserts the corrected text is in
-- place whether or not this run performed the update).
-- ---------------------------------------------------------------------
DO $verify$
DECLARE
    n_rows   INT;
    cur_text TEXT;
BEGIN
    SELECT count(*) INTO n_rows
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 1
      JOIN books    b ON b.id = c.book_id    AND b.slug = 'galatians'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 3;
    IF n_rows <> 1 THEN
        RAISE EXCEPTION 'S423: expected exactly 1 canon Galatians 1:3 row, found %', n_rows;
    END IF;
    SELECT v.text INTO cur_text
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 1
      JOIN books    b ON b.id = c.book_id    AND b.slug = 'galatians'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 3;
    IF cur_text <> $gal$Grace be to you and peace from Elohim (God) the Father, and from our Adonai Yahusha HaMashiach (Lord Jesus Christ),$gal$ THEN
        RAISE EXCEPTION 'S423: Galatians 1:3 final text mismatch — got %', cur_text;
    END IF;

    SELECT count(*) INTO n_rows
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 1
      JOIN books    b ON b.id = c.book_id    AND b.slug = 'galatians'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 19;
    IF n_rows <> 1 THEN
        RAISE EXCEPTION 'S423: expected exactly 1 canon Galatians 1:19 row, found %', n_rows;
    END IF;
    SELECT v.text INTO cur_text
      FROM verses v
      JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 1
      JOIN books    b ON b.id = c.book_id    AND b.slug = 'galatians'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 19;
    IF cur_text <> $gal$But other of the apostles saw I none, save James Yahusha's (Lord’s) brother.$gal$ THEN
        RAISE EXCEPTION 'S423: Galatians 1:19 final text mismatch — got %', cur_text;
    END IF;

    RAISE NOTICE 'S423 Galatians 1 sacred-name fix: verses 3 and 19 confirmed corrected.';
END
$verify$;

COMMIT;
