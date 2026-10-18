-- =====================================================================
-- Session 454 migration — 2026-10-17
-- Apocrypha (KJV 1611 edition): text audit against eBible KJV, by content, S454
-- =====================================================================
-- WHY: S454 diffed the app's Apocrypha (parsed/apocrypha.json = live DB) against the
-- KJV 1611 Apocrypha VERSE BY VERSE, BY CONTENT (source-texts/apocrypha-kjv-ebible/,
-- 14 books / 5,720 verses from the local eBible eng-kjv_usfx.xml). THE TEXT IS
-- FAITHFUL: 5,710 of 5,720 match 1:1, 0 changed, 0 missing, 0 extra. Four defects:
--   1. The Rest of Esther 10: KJV 10:4-13 sat in ONE row numbered 1 with the digits
--      inline. That row keeps its id and becomes v.4; vv.5-13 are inserted.
--   2. The Rest of Esther 11:1 and 13:7 ended with a 1611 marginal note printed
--      inside the verse ("[PLACED IN THE GREEK ...]") — removed from the text.
--   3. 2 Esdras 14:48 ended with a stray chapter-rule glyph — removed.
--   4. 1 Maccabees 5:35 "and and burnt" — doubled word removed.
-- Table: source-texts/apocrypha-kjv-ebible/apocrypha-damage-table.md
-- Source of truth: source-texts/parsed/apocrypha.json (S454).
-- Rule 10 — ids preserved, rows updated in place. Cards on the old Esther 10:1 row
-- are moved by session454b_apocrypha_xref_sort.sql. Idempotent. Run:
--   python3 api/apply_migration.py data-schema/migrations/session454_apocrypha_fix.sql
-- =====================================================================
\echo 'session454 — Apocrypha fix starting...'
BEGIN;

DO $before$
DECLARE n INT;
BEGIN
    SELECT count(v.id) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id
      JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha';
    RAISE NOTICE 'S454 BEFORE  Apocrypha verse rows: % (expect 5711)', n;
END $before$;

-- 1. Rest of Esther 10: the merged row (verse_number 1) keeps its id and becomes v.4
DO $ren$
DECLARE cid INT; n1 INT; n4 INT;
BEGIN
    SELECT c.id INTO cid FROM chapters c JOIN books b ON b.id = c.book_id AND b.slug = 'the-rest-of-esther'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha' WHERE c.chapter_number = 10;
    IF cid IS NULL THEN RAISE EXCEPTION 'S454: Rest of Esther 10 not found'; END IF;
    SELECT count(*) INTO n1 FROM verses WHERE chapter_id = cid AND verse_number = 1;
    SELECT count(*) INTO n4 FROM verses WHERE chapter_id = cid AND verse_number = 4;
    IF n1 = 1 AND n4 = 0 THEN
        UPDATE verses SET verse_number = 4, text = E'Then Mardocheus said, Yahuah (God) has done these things.' WHERE chapter_id = cid AND verse_number = 1;
        RAISE NOTICE 'S454 Rest of Esther 10:1 (merged row) renumbered to 10:4, id kept';
    ELSIF n1 = 0 AND n4 = 1 THEN
        RAISE NOTICE 'S454 Rest of Esther 10:4 already in place (re-run)';
    ELSE
        RAISE EXCEPTION 'S454: unexpected Rest of Esther 10 state: v1 rows=%, v4 rows=%', n1, n4;
    END IF;
END $ren$;

-- 2. The other 13 rows: upsert by (chapter, verse)
CREATE TEMP TABLE _s454_verses (bk TEXT, ch INT, vn INT, txt TEXT, PRIMARY KEY (bk, ch, vn)) ON COMMIT DROP;
INSERT INTO _s454_verses (bk, ch, vn, txt) VALUES
    ('the-rest-of-esther', 11, 1, E'In the fourth year of the reign of Ptolemeus and Cleopatra, Dositheus, who said he was a priest and Levite, and Ptolemeus his son, brought this epistle of Phurim, which they said was the same, and that Lysimachus the son of Ptolemeus, that was in Jerusalem, had interpreted it.'),
    ('the-rest-of-esther', 13, 7, E'That they, who of old and now also are malicious, may in one day with violence go into the grave, and so ever hereafter cause our affairs to be well settled, and without trouble.'),
    ('2-esdras', 14, 48, E'And I did so.'),
    ('1-maccabees', 5, 35, E'This done, Judas turned aside to Maspha; and after he had assaulted it he took and slew all the males in it, and received the spoils thereof and burnt it with fire.'),
    ('the-rest-of-esther', 10, 5, E'For I remember a dream which I saw concerning these matters, and nothing thereof has failed.'),
    ('the-rest-of-esther', 10, 6, E'A little fountain became a river, and there was light, and the sun, and much water: this river is Esther, whom the king married, and made queen:'),
    ('the-rest-of-esther', 10, 7, E'And the two dragons are I and Aman.'),
    ('the-rest-of-esther', 10, 8, E'And the nations were those that were assembled to destroy the name of the Yahudim (Jews):'),
    ('the-rest-of-esther', 10, 9, E'And my nation is this Yashar\'el (Israel), which cried to Yahuah (God), and were saved: for Yahuah (God) has saved his people, and Yahuah (God) has delivered us from all those evils, and Yahuah (God) has wrought signs and great wonders, which have not been done among the Gentiles.'),
    ('the-rest-of-esther', 10, 10, E'Therefore has he made two lots, one for the people of Yahuah (God), and another for all the Gentiles.'),
    ('the-rest-of-esther', 10, 11, E'And these two lots came at the hour, and time, and day of judgment, before Yahuah (God) among all nations.'),
    ('the-rest-of-esther', 10, 12, E'So Yahuah (God) remembered his people, and justified his inheritance.'),
    ('the-rest-of-esther', 10, 13, E'Therefore those days shall be to them in the month Adar, the fourteenth and fifteenth day of the same month, with an assembly, and joy, and with gladness before Yahuah (God), according to the generations for ever among his people. ⸻');

INSERT INTO verses (chapter_id, verse_number, text)
SELECT c.id, s.vn, s.txt FROM _s454_verses s
  JOIN books b ON b.slug = s.bk JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha'
  JOIN chapters c ON c.book_id = b.id AND c.chapter_number = s.ch
ON CONFLICT (chapter_id, verse_number) DO UPDATE SET text = EXCLUDED.text WHERE verses.text IS DISTINCT FROM EXCLUDED.text;

-- 3. search_vocabulary — additive
DO $vocab$
BEGIN
    IF to_regclass('public.search_vocabulary') IS NOT NULL THEN
        INSERT INTO search_vocabulary (lexeme, occurrences)
        SELECT word, ndoc FROM ts_stat($q$
            SELECT v.text_tsv FROM verses v JOIN chapters c ON c.id = v.chapter_id
              JOIN books b ON b.id = c.book_id AND b.slug = 'the-rest-of-esther'
              JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha' $q$)
        ON CONFLICT (lexeme) DO NOTHING;
    END IF;
END $vocab$;

-- 4. Verify
DO $verify$
DECLARE missing INT; wrong INT; n INT; n10 INT;
BEGIN
    SELECT count(*) INTO missing FROM _s454_verses s WHERE NOT EXISTS (
        SELECT 1 FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = s.ch
          JOIN books b ON b.id = c.book_id AND b.slug = s.bk JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha'
         WHERE v.verse_number = s.vn AND v.text = s.txt);
    SELECT count(*) INTO n10 FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 10
      JOIN books b ON b.id = c.book_id AND b.slug = 'the-rest-of-esther' JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha';
    SELECT count(v.id) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id
      JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha';
    IF missing <> 0 OR n10 <> 10 OR n <> 5720 THEN
        RAISE EXCEPTION 'S454: fix incomplete — rows missing/wrong text=%, Esther 10 rows=% (expect 10), Apocrypha rows=% (expect 5720)', missing, n10, n;
    END IF;
    RAISE NOTICE 'S454 AFTER   Apocrypha verse rows: % (expect 5720); Rest of Esther 10 has vv.4-13; all 14 edited rows carry the new text', n;
END $verify$;
COMMIT;
\echo 'session454 — Apocrypha fix done.'
