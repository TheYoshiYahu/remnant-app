-- =====================================================================
-- Session 455b migration — 2026-10-18 (built S456)
-- Canon (KJV edition): fix for the five presentation items the S455 content audit found
-- =====================================================================
-- WHY: S455 diffed the app's canon against eBible's KJV 1769 VERSE BY VERSE, BY CONTENT
-- (source-texts/kjv-canon-audit/): FAITHFUL — 31,102/31,102, 0 missing, 0 extra. Five items:
--   1. All 116 Psalm superscriptions were absent (the parse dropped eBible's <d>). They go into
--      chapters.chapter_title (the reader shows it as the italic subtitle; NOT chapter_intro, which
--      the app renders as the free commentary). Names restored; same modernized register as the body.
--   2. Psalm 119: the 21 stanza letters (ב BETH. ... ת TAU.) sat glued to the END of vv.8,16,...,168.
--      Stripped; the acrostic is named in ch.119's chapter_title instead.
--   3. The 14 Pauline subscriptions ("Written to the Romans from Corinthus...") sat inside the last verse
--      of 14 epistles. Cut after "Amen." (kept in parsed/canon.json footnote field only — no DB column).
--   4. Amos 3:7, 1 John 3:4-8, Psalm 81:3 are Yoshi's renderings — KEPT, not touched here.
--   5. Romans 15:30 echo: (Jesus Christ's) -> (Lord Jesus Christ's).
-- The live canon text is the session-149 MODERNIZED register, so verse edits are surgical pattern edits,
-- never whole-text replacements. Rule 10 — ids preserved, UPDATE in place, no verse numbers change, no card
-- moves. Idempotent. Table: source-texts/kjv-canon-audit/canon-damage-table.md; report: canon-fix-report.md.
-- Run:  python3 api/apply_migration.py data-schema/migrations/session455b_canon_fix.sql
-- =====================================================================
\echo 'session455b — canon fix starting...'
BEGIN;

DO $before$
DECLARE n INT; t INT;
BEGIN
    SELECT count(v.id) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id
      JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon';
    SELECT count(*) INTO t FROM chapters c JOIN books b ON b.id = c.book_id AND b.slug = 'psalms'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon' WHERE c.chapter_title IS DISTINCT FROM 'Chapter ' || c.chapter_number;
    RAISE NOTICE 'S455b BEFORE  canon verse rows: % (expect 31102); Psalm chapters already titled: % (0 first run, 117 re-run)', n, t;
END $before$;

-- 1 + 2. Psalm superscriptions + the Psalm 119 acrostic note -> chapters.chapter_title (116 + 1)
CREATE TEMP TABLE _s455b_titles (ch INT PRIMARY KEY, title TEXT NOT NULL) ON COMMIT DROP;
INSERT INTO _s455b_titles (ch, title) VALUES
    (3, E'A Psalm of David, when he fled from Absalom his son.'),
    (4, E'To the chief Musician on Neginoth, A Psalm of David.'),
    (5, E'To the chief Musician upon Nehiloth, A Psalm of David.'),
    (6, E'To the chief Musician on Neginoth upon Sheminith, A Psalm of David.'),
    (7, E'Shiggaion of David, which he sang unto Yahuah (LORD), concerning the words of Cush the Benjamite.'),
    (8, E'To the chief Musician upon Gittith, A Psalm of David.'),
    (9, E'To the chief Musician upon Muthlabben, A Psalm of David.'),
    (11, E'To the chief Musician, A Psalm of David.'),
    (12, E'To the chief Musician upon Sheminith, A Psalm of David.'),
    (13, E'To the chief Musician, A Psalm of David.'),
    (14, E'To the chief Musician, A Psalm of David.'),
    (15, E'A Psalm of David.'),
    (16, E'Michtam of David.'),
    (17, E'A Prayer of David.'),
    (18, E'To the chief Musician, A Psalm of David, the servant of Yahuah (LORD), who spake unto Yahuah (LORD) the words of this song in the day that Yahuah (LORD) delivered him from the hand of all his enemies, and from the hand of Saul: And he said,'),
    (19, E'To the chief Musician, A Psalm of David.'),
    (20, E'To the chief Musician, A Psalm of David.'),
    (21, E'To the chief Musician, A Psalm of David.'),
    (22, E'To the chief Musician upon Aijeleth Shahar, A Psalm of David.'),
    (23, E'A Psalm of David.'),
    (24, E'A Psalm of David.'),
    (25, E'A Psalm of David.'),
    (26, E'A Psalm of David.'),
    (27, E'A Psalm of David.'),
    (28, E'A Psalm of David.'),
    (29, E'A Psalm of David.'),
    (30, E'A Psalm and Song at the dedication of the house of David.'),
    (31, E'To the chief Musician, A Psalm of David.'),
    (32, E'A Psalm of David, Maschil.'),
    (34, E'A Psalm of David, when he changed his behaviour before Abimelech; who drove him away, and he departed.'),
    (35, E'A Psalm of David.'),
    (36, E'To the chief Musician, A Psalm of David the servant of Yahuah (LORD).'),
    (37, E'A Psalm of David.'),
    (38, E'A Psalm of David, to bring to remembrance.'),
    (39, E'To the chief Musician, even to Jeduthun, A Psalm of David.'),
    (40, E'To the chief Musician, A Psalm of David.'),
    (41, E'To the chief Musician, A Psalm of David.'),
    (42, E'To the chief Musician, Maschil, for the sons of Korah.'),
    (44, E'To the chief Musician for the sons of Korah, Maschil.'),
    (45, E'To the chief Musician upon Shoshannim, for the sons of Korah, Maschil, A Song of loves.'),
    (46, E'To the chief Musician for the sons of Korah, A Song upon Alamoth.'),
    (47, E'To the chief Musician, A Psalm for the sons of Korah.'),
    (48, E'A Song and Psalm for the sons of Korah.'),
    (49, E'To the chief Musician, A Psalm for the sons of Korah.'),
    (50, E'A Psalm of Asaph.'),
    (51, E'To the chief Musician, A Psalm of David, when Nathan the prophet came unto him, after he had gone in to Bath-sheba.'),
    (52, E'To the chief Musician, Maschil, A Psalm of David, when Doeg the Edomite came and told Saul, and said unto him, David is come to the house of Ahimelech.'),
    (53, E'To the chief Musician upon Mahalath, Maschil, A Psalm of David.'),
    (54, E'To the chief Musician on Neginoth, Maschil, A Psalm of David, when the Ziphims came and said to Saul, Does not David hide himself with us?'),
    (55, E'To the chief Musician on Neginoth, Maschil, A Psalm of David.'),
    (56, E'To the chief Musician upon Jonath-elem-rechokim, Michtam of David, when the Philistines took him in Gath.'),
    (57, E'To the chief Musician, Al-taschith, Michtam of David, when he fled from Saul in the cave.'),
    (58, E'To the chief Musician, Al-taschith, Michtam of David.'),
    (59, E'To the chief Musician, Al-taschith, Michtam of David; when Saul sent, and they watched the house to kill him.'),
    (60, E'To the chief Musician upon Shushan-eduth, Michtam of David, to teach; when he strove with Aram-naharaim and with Aram-zobah, when Joab returned, and smote of Edom in the valley of salt twelve thousand.'),
    (61, E'To the chief Musician upon Neginah, A Psalm of David.'),
    (62, E'To the chief Musician, to Jeduthun, A Psalm of David.'),
    (63, E'A Psalm of David, when he was in the wilderness of Yahudah (Judah).'),
    (64, E'To the chief Musician, A Psalm of David.'),
    (65, E'To the chief Musician, A Psalm and Song of David.'),
    (66, E'To the chief Musician, A Song or Psalm.'),
    (67, E'To the chief Musician on Neginoth, A Psalm or Song.'),
    (68, E'To the chief Musician, A Psalm or Song of David.'),
    (69, E'To the chief Musician upon Shoshannim, A Psalm of David.'),
    (70, E'To the chief Musician, A Psalm of David, to bring to remembrance.'),
    (72, E'A Psalm for Solomon.'),
    (73, E'A Psalm of Asaph.'),
    (74, E'Maschil of Asaph.'),
    (75, E'To the chief Musician, Al-taschith, A Psalm or Song of Asaph.'),
    (76, E'To the chief Musician on Neginoth, A Psalm or Song of Asaph.'),
    (77, E'To the chief Musician, to Jeduthun, A Psalm of Asaph.'),
    (78, E'Maschil of Asaph.'),
    (79, E'A Psalm of Asaph.'),
    (80, E'To the chief Musician upon Shoshannim-eduth, A Psalm of Asaph.'),
    (81, E'To the chief Musician upon Gittith, A Psalm of Asaph.'),
    (82, E'A Psalm of Asaph.'),
    (83, E'A Song or Psalm of Asaph.'),
    (84, E'To the chief Musician upon Gittith, A Psalm for the sons of Korah.'),
    (85, E'To the chief Musician, A Psalm for the sons of Korah.'),
    (86, E'A Prayer of David.'),
    (87, E'A Psalm or Song for the sons of Korah.'),
    (88, E'A Song or Psalm for the sons of Korah, to the chief Musician upon Mahalath Leannoth, Maschil of Heman the Ezrahite.'),
    (89, E'Maschil of Ethan the Ezrahite.'),
    (90, E'A Prayer of Moses the man of Elohim (God).'),
    (92, E'A Psalm or Song for the sabbath day.'),
    (98, E'A Psalm.'),
    (100, E'A Psalm of praise.'),
    (101, E'A Psalm of David.'),
    (102, E'A Prayer of the afflicted, when he is overwhelmed, and pours out his complaint before Yahuah (LORD).'),
    (103, E'A Psalm of David.'),
    (108, E'A Song or Psalm of David.'),
    (109, E'To the chief Musician, A Psalm of David.'),
    (110, E'A Psalm of David.'),
    (119, E'An acrostic of twenty-two stanzas, eight verses each, one for every letter of the Hebrew alphabet in order: א Aleph (1–8), ב Beth (9–16), ג Gimel (17–24), ד Daleth (25–32), ה He (33–40), ו Vau (41–48), ז Zain (49–56), ח Cheth (57–64), ט Teth (65–72), י Jod (73–80), כ Caph (81–88), ל Lamed (89–96), מ Mem (97–104), נ Nun (105–112), ס Samech (113–120), ע Ain (121–128), פ Pe (129–136), צ Tzaddi (137–144), ק Koph (145–152), ר Resh (153–160), ש Schin (161–168), ת Tau (169–176).'),
    (120, E'A Song of degrees.'),
    (121, E'A Song of degrees.'),
    (122, E'A Song of degrees of David.'),
    (123, E'A Song of degrees.'),
    (124, E'A Song of degrees of David.'),
    (125, E'A Song of degrees.'),
    (126, E'A Song of degrees.'),
    (127, E'A Song of degrees for Solomon.'),
    (128, E'A Song of degrees.'),
    (129, E'A Song of degrees.'),
    (130, E'A Song of degrees.'),
    (131, E'A Song of degrees of David.'),
    (132, E'A Song of degrees.'),
    (133, E'A Song of degrees of David.'),
    (134, E'A Song of degrees.'),
    (138, E'A Psalm of David.'),
    (139, E'To the chief Musician, A Psalm of David.'),
    (140, E'To the chief Musician, A Psalm of David.'),
    (141, E'A Psalm of David.'),
    (142, E'Maschil of David; A Prayer when he was in the cave.'),
    (143, E'A Psalm of David.'),
    (144, E'A Psalm of David.'),
    (145, E'David’s Psalm of praise.');
UPDATE chapters c SET chapter_title = s.title
  FROM _s455b_titles s, books b, editions e
 WHERE c.book_id = b.id AND b.slug = 'psalms' AND e.id = b.edition_id AND e.slug = 'canon'
   AND c.chapter_number = s.ch AND c.chapter_title IS DISTINCT FROM s.title;

-- 2. Psalm 119: strip "<hebrew letter> NAME." from the end of vv.8,16,...,168 (register-agnostic)
DO $ps119$
DECLARE cid INT; n INT;
BEGIN
    SELECT c.id INTO cid FROM chapters c JOIN books b ON b.id = c.book_id AND b.slug = 'psalms'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon' WHERE c.chapter_number = 119;
    IF cid IS NULL THEN RAISE EXCEPTION 'S455b: Psalm 119 not found'; END IF;
    UPDATE verses SET text = rtrim(regexp_replace(text, '\s*[\u05d0-\u05ea]\s+[A-Z]+\.$', ''))
     WHERE chapter_id = cid AND verse_number % 8 = 0 AND verse_number < 176
       AND text ~ '\s*[\u05d0-\u05ea]\s+[A-Z]+\.$';
    GET DIAGNOSTICS n = ROW_COUNT;
    RAISE NOTICE 'S455b Psalm 119: stanza letters stripped from % verses (21 first run, 0 re-run)', n;
END $ps119$;

-- 3. The 14 Pauline subscriptions: keep the verse up to and including "Amen."; the subscription must be
--    the text that follows (checked by its opening words) so an unexpected verse is never cut.
CREATE TEMP TABLE _s455b_subs (bk TEXT, ch INT, vn INT, opening TEXT, PRIMARY KEY (bk, ch, vn)) ON COMMIT DROP;
INSERT INTO _s455b_subs (bk, ch, vn, opening) VALUES
    (E'romans', 16, 27, E'Written to the Romans'),
    (E'1-corinthians', 16, 24, E'The first epistle to'),
    (E'2-corinthians', 13, 14, E'The second epistle to'),
    (E'galatians', 6, 18, E'Unto the Galatians written'),
    (E'ephesians', 6, 24, E'Written from Rome unto'),
    (E'philippians', 4, 23, E'It was written to'),
    (E'colossians', 4, 18, E'Written from Rome to'),
    (E'1-thessalonians', 5, 28, E'The first epistle unto'),
    (E'2-thessalonians', 3, 18, E'The second epistle to'),
    (E'1-timothy', 6, 21, E'The first to Timothy'),
    (E'2-timothy', 4, 22, E'The second epistle unto'),
    (E'titus', 3, 15, E'It was written to'),
    (E'philemon', 1, 25, E'Written from Rome to'),
    (E'hebrews', 13, 25, E'Written to the Hebrews');
DO $subs$
DECLARE r RECORD; vid BIGINT; t TEXT; p INT; done INT := 0; already INT := 0;
BEGIN
    FOR r IN SELECT * FROM _s455b_subs LOOP
        SELECT v.id, v.text INTO vid, t FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = r.ch
          JOIN books b ON b.id = c.book_id AND b.slug = r.bk JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
         WHERE v.verse_number = r.vn;
        IF vid IS NULL THEN RAISE EXCEPTION 'S455b: % %:% not found', r.bk, r.ch, r.vn; END IF;
        p := position('Amen.' IN t);
        IF p = 0 THEN RAISE EXCEPTION 'S455b: % %:% has no "Amen." — not touched', r.bk, r.ch, r.vn; END IF;
        IF substr(t, p + 5) ~ ('^\s*' || regexp_replace(r.opening, '([.^$*+?()\[\]{}|\\])', '\\\1', 'g')) THEN
            UPDATE verses SET text = substr(t, 1, p + 4) WHERE id = vid; done := done + 1;
        ELSIF btrim(substr(t, p + 5)) = '' THEN
            already := already + 1;
        ELSE
            RAISE EXCEPTION 'S455b: % %:% — text after "Amen." is not the expected subscription: %', r.bk, r.ch, r.vn, substr(t, p + 5, 60);
        END IF;
    END LOOP;
    RAISE NOTICE 'S455b subscriptions cut: % (14 first run), already clean: %', done, already;
END $subs$;

-- 5. Romans 15:30 — the echo carries the title (apostrophe/quote characters matched loosely, kept as found)
DO $rom$
DECLARE n INT;
BEGIN
    UPDATE verses v SET text = regexp_replace(v.text, 'Lord Yahusha HaMashiach(.)s \(Jesus Christ(.)s\)', 'Lord Yahusha HaMashiach\1s (Lord Jesus Christ\2s)')
      FROM chapters c, books b, editions e
     WHERE v.chapter_id = c.id AND c.chapter_number = 15 AND v.verse_number = 30 AND c.book_id = b.id AND b.slug = 'romans'
       AND e.id = b.edition_id AND e.slug = 'canon' AND v.text ~ 'Lord Yahusha HaMashiach.s \(Jesus Christ.s\)';
    GET DIAGNOSTICS n = ROW_COUNT;
    RAISE NOTICE 'S455b Romans 15:30 echo fixed: % (1 first run, 0 re-run)', n;
END $rom$;

-- search_vocabulary — additive, Psalms only (the only book whose words could be new)
DO $vocab$
BEGIN
    IF to_regclass('public.search_vocabulary') IS NOT NULL THEN
        INSERT INTO search_vocabulary (lexeme, occurrences)
        SELECT word, ndoc FROM ts_stat($q$
            SELECT v.text_tsv FROM verses v JOIN chapters c ON c.id = v.chapter_id
              JOIN books b ON b.id = c.book_id AND b.slug = 'psalms'
              JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon' AND c.chapter_number = 119 $q$)
        ON CONFLICT (lexeme) DO NOTHING;
    END IF;
END $vocab$;

-- Verify — by content
DO $verify$
DECLARE titles_wrong INT; letters_left INT; subs_left INT; rom INT; n INT;
BEGIN
    SELECT count(*) INTO titles_wrong FROM _s455b_titles s WHERE NOT EXISTS (
        SELECT 1 FROM chapters c JOIN books b ON b.id = c.book_id AND b.slug = 'psalms'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon' WHERE c.chapter_number = s.ch AND c.chapter_title = s.title);
    SELECT count(*) INTO letters_left FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 119
      JOIN books b ON b.id = c.book_id AND b.slug = 'psalms' JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.text ~ '[\u05d0-\u05ea]\s+[A-Z]+\.$';
    SELECT count(*) INTO subs_left FROM _s455b_subs s JOIN books b ON b.slug = s.bk JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
      JOIN chapters c ON c.book_id = b.id AND c.chapter_number = s.ch JOIN verses v ON v.chapter_id = c.id AND v.verse_number = s.vn
     WHERE v.text NOT LIKE '%Amen.' OR v.text LIKE '%' || s.opening || '%';
    SELECT count(*) INTO rom FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 15
      JOIN books b ON b.id = c.book_id AND b.slug = 'romans' JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 30 AND v.text ~ '\(Lord Jesus Christ.s\)';
    SELECT count(v.id) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id
      JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon';
    IF titles_wrong <> 0 OR letters_left <> 0 OR subs_left <> 0 OR rom <> 1 OR n <> 31102 THEN
        RAISE EXCEPTION 'S455b: fix incomplete — titles wrong=%, Ps119 letters left=%, subscriptions left=%, Rom 15:30 ok=%, canon rows=% (expect 0,0,0,1,31102)',
            titles_wrong, letters_left, subs_left, rom, n;
    END IF;
    RAISE NOTICE 'S455b AFTER   117 Psalm titles in place; Psalm 119 clean; 14 epistles end at "Amen."; Romans 15:30 carries (Lord Jesus Christ''s); canon rows % (unchanged)', n;
END $verify$;

INSERT INTO schema_version (id, version, notes) VALUES (1, '1.0.0-phase4-session455b',
  'Session 455b (2026-10-18, built S456) — canon KJV presentation fix after the S455 content audit: 116 Psalm superscriptions + Psalm 119 acrostic note into chapter_title; Psalm 119 stanza letters stripped from 21 verses; 14 Pauline subscriptions cut from the last verse; Romans 15:30 echo. Ids unchanged.')
ON CONFLICT (id) DO UPDATE SET version = EXCLUDED.version, landed_at = now(), notes = EXCLUDED.notes;
COMMIT;
\echo 'session455b — canon fix done.'