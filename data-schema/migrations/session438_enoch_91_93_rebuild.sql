-- =====================================================================
-- Session 438 migration — 2026-10-03
-- 1 Enoch 91, 92, 93 rebuilt to the true R.H. Charles text
-- =====================================================================
-- Edition: editions.slug='enoch' -> books.slug='1-enoch' -> chapters 91-93.
--
-- WHY: the seeded text of these three chapters was not Charles.
--   * 91 was ONE verse row (the whole chapter run together, with Charles
--     ch. 85, a doubled line, 93:9-10, and 104:10-12 material mixed in);
--   * 92 was 14 verses of invented "preserve the books / calendar" text
--     (Charles 92 has 5 verses);
--   * 93 was 17 verses of invented, self-repeating "two ways" text
--     (Charles 93 has 14 verses, carrying weeks 1-7 of the Apocalypse
--     of Weeks).
-- The rebuild uses the Charles text (verified against sacred-texts.com
-- /bib/boe/ boe094-boe097) in CANONICAL verse numbering, so every
-- standard 1 Enoch citation resolves to the right words:
--   91:1-11 admonition, 91:12-17 weeks 8-10, 91:18-19 the two paths;
--   92:1-5 the Epistle heading; 93:1-10 weeks 1-7, 93:11-14 (bracketed).
-- Divine names follow this edition's convention ("Lord" -> Yahuah (God);
-- the Holy One, the Holy and Great One, the Great King kept as titles).
-- Source of truth: source-texts/parsed/enoch.json (session 438).
--
-- WHAT IT DOES (ids preserved wherever a row already exists):
--   1. chapters.chapter_title + chapters.chapter_intro (the chapter
--      commentary block seed.py loads into chapter_intro) for 91-93.
--   2. UPSERT verses (chapter_id, verse_number): existing rows have text
--      updated IN PLACE (verses.id unchanged, so every FK survives);
--      missing rows (91:2-19) are INSERTed. verses.text_tsv is a
--      GENERATED column and the trigram index is automatic, so search
--      follows the new text with no extra step.
--   3. Surplus rows (91:>19, 92:>5, 93:>14) are DELETEd ONLY when no row
--      in ANY table holding a foreign key to verses(id) points at them
--      (checked dynamically from pg_constraint: cross_references,
--      cross_reference_threads anchors, thread members via xrefs,
--      commentary_entries, highlights, bookmarks, notes, positions, etc.).
--      A referenced surplus row is KEPT and reported with RAISE NOTICE —
--      it still shows its old text in the reader until its references are
--      re-pointed or retired by an editorial decision.
--   4. search_vocabulary: lexemes from the new text that are not yet in
--      the table are added (ON CONFLICT DO NOTHING; skipped if the table
--      does not exist). Existing counts are not touched.
--   5. Verify: every target verse row exists with exactly the new text;
--      RAISE EXCEPTION otherwise. Lists cross_references touching 91-93.
--
-- NOTE: cross_references on Enoch 92:x and 93:x (session250) and the
-- Testaments XII -> Enoch 91:1 card (session413) were written against
-- the OLD text. They are NOT changed here; their notes need review.
--
-- Idempotent: re-running updates nothing (IS DISTINCT FROM guards) and
-- the verify block passes.
--
-- Run:  python3 api/apply_migration.py data-schema/migrations/session438_enoch_91_93_rebuild.sql
-- =====================================================================
\echo 'session438 — Enoch 91-93 rebuild starting...'
BEGIN;

CREATE TEMP TABLE _s438_verses (ch INT, vn INT, txt TEXT, PRIMARY KEY (ch, vn)) ON COMMIT DROP;
INSERT INTO _s438_verses (ch, vn, txt) VALUES
    (91, 1, E'‘And now, my son Methuselah, call to me all thy brothers And gather together to me all the sons of thy mother; For the word calls me, And the spirit is poured out upon me, That I may show you everything That shall befall you for ever.’'),
    (91, 2, E'And thereupon Methuselah went and summoned to him all his brothers and assembled his relatives.'),
    (91, 3, E'And he spake unto all the children of righteousness and said: ‘Hear, ye sons of Enoch, all the words of your father, And hearken aright to the voice of my mouth; For I exhort you and say unto you, beloved: Love uprightness and walk therein.'),
    (91, 4, E'And draw not nigh to uprightness with a double heart, And associate not with those of a double heart, But walk in righteousness, my sons. And it shall guide you on good paths, And righteousness shall be your companion.'),
    (91, 5, E'For I know that violence must increase on the earth, And a great chastisement be executed on the earth, And all unrighteousness come to an end: Yea, it shall be cut off from its roots, And its whole structure be destroyed.'),
    (91, 6, E'And unrighteousness shall again be consummated on the earth, And all the deeds of unrighteousness and of violence And transgression shall prevail in a twofold degree.'),
    (91, 7, E'And when sin and unrighteousness and blasphemy And violence in all kinds of deeds increase, And apostasy and transgression and uncleanness increase, A great chastisement shall come from heaven upon all these, And the holy Yahuah (God) will come forth with wrath and chastisement To execute judgement on earth.'),
    (91, 8, E'In those days violence shall be cut off from its roots, And the roots of unrighteousness together with deceit, And they shall be destroyed from under heaven.'),
    (91, 9, E'And all the idols of the heathen shall be abandoned, And the temples burned with fire, And they shall remove them from the whole earth, And they (i.e. the heathen) shall be cast into the judgement of fire, And shall perish in wrath and in grievous judgement for ever.'),
    (91, 10, E'And the righteous shall arise from their sleep, And wisdom shall arise and be given unto them.'),
    (91, 11, E'[And after that the roots of unrighteousness shall be cut off, and the sinners shall be destroyed by the sword . . . shall be cut off from the blasphemers in every place, and those who plan violence and those who commit blasphemy shall perish by the sword.]'),
    (91, 12, E'And after that there shall be another, the eighth week, that of righteousness, And a sword shall be given to it that a righteous judgement may be executed on the oppressors, And sinners shall be delivered into the hands of the righteous.'),
    (91, 13, E'And at its close they shall acquire houses through their righteousness, And a house shall be built for the Great King in glory for evermore,'),
    (91, 14, E'And all mankind shall look to the path of uprightness. And after that, in the ninth week, the righteous judgement shall be revealed to the whole world, And all the works of the godless shall vanish from all the earth, And the world shall be written down for destruction.'),
    (91, 15, E'And after this, in the tenth week in the seventh part, There shall be the great eternal judgement, In which He will execute vengeance amongst the angels.'),
    (91, 16, E'And the first heaven shall depart and pass away, And a new heaven shall appear, And all the powers of the heavens shall give sevenfold light.'),
    (91, 17, E'And after that there will be many weeks without number for ever, And all shall be in goodness and righteousness, And sin shall no more be mentioned for ever.'),
    (91, 18, E'And now I tell you, my sons, and show you The paths of righteousness and the paths of violence. Yea, I will show them to you again That ye may know what will come to pass.'),
    (91, 19, E'And now, hearken unto me, my sons, And walk in the paths of righteousness, And walk not in the paths of violence; For all who walk in the paths of unrighteousness shall perish for ever.’'),
    (92, 1, E'The book written by Enoch—[Enoch indeed wrote this complete doctrine of wisdom, (which is) praised of all men and a judge of all the earth] for all my children who shall dwell on the earth. And for the future generations who shall observe uprightness and peace.'),
    (92, 2, E'Let not your spirit be troubled on account of the times; For the Holy and Great One has appointed days for all things.'),
    (92, 3, E'And the righteous one shall arise from sleep, [Shall arise] and walk in the paths of righteousness, And all his path and conversation shall be in eternal goodness and grace.'),
    (92, 4, E'He will be gracious to the righteous and give him eternal uprightness, And He will give him power so that he shall be (endowed) with goodness and righteousness, And he shall walk in eternal light.'),
    (92, 5, E'And sin shall perish in darkness for ever, And shall no more be seen from that day for evermore.'),
    (93, 1, E'And after that Enoch both †gave† and began to recount from the books.'),
    (93, 2, E'And Enoch said: ‘Concerning the children of righteousness and concerning the elect of the world, And concerning the plant of uprightness, I will speak these things, Yea, I Enoch will declare (them) unto you, my sons: According to that which appeared to me in the heavenly vision, And which I have known through the word of the holy angels, And have learnt from the heavenly tablets.’'),
    (93, 3, E'And Enoch began to recount from the books and said: ‘I was born the seventh in the first week, While judgement and righteousness still endured.'),
    (93, 4, E'And after me there shall arise in the second week great wickedness, And deceit shall have sprung up; And in it there shall be the first end. And in it a man shall be saved; And after it is ended unrighteousness shall grow up, And a law shall be made for the sinners.'),
    (93, 5, E'And after that in the third week at its close A man shall be elected as the plant of righteous judgement, And his posterity shall become the plant of righteousness for evermore.'),
    (93, 6, E'And after that in the fourth week, at its close, Visions of the holy and righteous shall be seen, And a law for all generations and an enclosure shall be made for them.'),
    (93, 7, E'And after that in the fifth week, at its close, The house of glory and dominion shall be built for ever.'),
    (93, 8, E'And after that in the sixth week all who live in it shall be blinded, And the hearts of all of them shall godlessly forsake wisdom. And in it a man shall ascend; And at its close the house of dominion shall be burnt with fire, And the whole race of the chosen root shall be dispersed.'),
    (93, 9, E'And after that in the seventh week shall an apostate generation arise, And many shall be its deeds, And all its deeds shall be apostate.'),
    (93, 10, E'And at its close shall be elected The elect righteous of the eternal plant of righteousness, To receive sevenfold instruction concerning all His creation.'),
    (93, 11, E'[For who is there of all the children of men that is able to hear the voice of the Holy One without being troubled? And who can think His thoughts? and who is there that can behold all the works of heaven?'),
    (93, 12, E'And how should there be one who could behold the heaven, and who is there that could understand the things of heaven and see a soul or a spirit and could tell thereof, or ascend and see all their ends and think them or do like them?'),
    (93, 13, E'And who is there of all men that could know what is the breadth and the length of the earth, and to whom has been shown the measure of all of them?'),
    (93, 14, E'Or is there any one who could discern the length of the heaven and how great is its height, and upon what it is founded, and how great is the number of the stars, and where all the luminaries rest?]');

CREATE TEMP TABLE _s438_chapters (ch INT PRIMARY KEY, title TEXT, intro TEXT) ON COMMIT DROP;
INSERT INTO _s438_chapters (ch, title, intro) VALUES
    (91, E'Enoch’s Exhortation and the Apocalypse of Weeks', E'This chapter forms the bridge between the dream-visions and the Epistle proper. Enoch bids Methuselah call to him all his brothers and the sons of his mother, for the word calls him and the spirit is poured out upon him (v. 1); Methuselah assembles his relatives (v. 2), and Enoch exhorts the children of righteousness to love uprightness, not to draw nigh to it with a double heart, and to walk in righteousness (vv. 3–4). He foresees violence and unrighteousness increasing in a twofold degree until a great chastisement comes from heaven, the holy Yahuah (God) comes forth to execute judgement on earth, the idols of the heathen are abandoned, and the righteous arise from their sleep (vv. 5–11). The chapter then carries the last three of the ten “weeks” of the Apocalypse of Weeks (vv. 12–17), a prophetic schema that divides all of history from creation to the final consummation into ten symbolic “weeks” (not literal 7-year periods, but theological eras of roughly 700–800 years each). Weeks 1–7 stand in Chapter 93:3–10; Charles restores the original order by reading 93:1–10 followed by 91:12–17. - Week 8: A week of righteousness; a sword is given that a righteous judgement may be executed on the oppressors; at its close the righteous acquire houses through their righteousness, a house is built for the Great King in glory for evermore, and all mankind look to the path of uprightness (vv. 12–14; Charles sets this last line before the ninth week). - Week 9: The righteous judgement is revealed to the whole world, the works of the godless vanish, and the world is written down for destruction (v. 14). - Week 10: The great eternal judgement, in which He executes vengeance amongst the angels; the first heaven passes away and a new heaven appears, with sevenfold light (vv. 15–16). - After the tenth week: many weeks without number for ever, all in goodness and righteousness, and sin no more mentioned for ever (v. 17). The chapter closes with Enoch showing his sons again the paths of righteousness and the paths of violence, for all who walk in the paths of unrighteousness shall perish for ever (vv. 18–19). Scriptural Cross-References (by section) - Call to gather the house (v. 1) Deuteronomy 31:12–13 — Assemble the people… that they may hear and learn to fear Yahuah (God)… and their children may hear. 2 Timothy 2:2 — Things you have heard from me… entrust to faithful men who will be able to teach others also. - Hear the words of your father (v. 3) Proverbs 1:8–9 — Hear, my son, your father’s instruction… do not forsake your mother’s teaching. Deuteronomy 6:6–7 — These words… shall be on your heart. You shall teach them diligently to your sons. Key Insight for Discernment Chapter 91 is a turning point: Enoch gathers his house, calls for faithful transmission across generations, and (with Chapter 93) gives the Apocalypse of Weeks as a divine timeline showing Yahuah (God) of Spirits’ sovereign plan through history—sin increases, righteous remnant chosen, judgment executed, new creation established. It warns that violence, apostasy and uncleanness will increase before the holy Yahuah (God) comes forth with wrath to execute judgement, and sets before Enoch’s sons the paths of righteousness and the paths of violence. This chapter bridges the dream-visions to the ethical/apocalyptic exhortations of the Epistle.'),
    (92, E'The Book Written by Enoch – The Holy and Great One Has Appointed Days for All Things', E'Chapter 92 opens the Epistle proper. It is the heading of the book Enoch wrote—“this complete doctrine of wisdom”—for all his children who shall dwell on the earth and for the future generations who shall observe uprightness and peace (v. 1). - The book for the generations (v. 1) — Enoch writes for his children and for generations still to come. Cross-refs: Psalm 78:4–7 (tell the coming generation… that the next generation might know… and keep Elohim’s commandments); 2 Timothy 2:2 (what you heard from me… entrust to faithful men who will teach others). - Appointed days (v. 2) — Let not your spirit be troubled on account of the times, for the Holy and Great One has appointed days for all things. - The righteous one arises (vv. 3–5) — The righteous one shall arise from sleep and walk in the paths of righteousness, in eternal goodness and grace; He will be gracious to the righteous and give him eternal uprightness, and he shall walk in eternal light; sin shall perish in darkness for ever and be seen no more. Cross-refs: Psalm 1:1–3 (blessed is the man who delights in the law of Yahuah (God)… prospers); Matthew 25:46 (righteous into eternal life). Key Insight for Discernment Chapter 92 sets the frame for the whole Epistle: the times are not out of hand, for the Holy and Great One has appointed days for all things. The righteous shall arise and walk in eternal light, and sin shall perish in darkness for ever.'),
    (93, E'The Apocalypse of Weeks – The First Seven Weeks and the Coming of the Apostate Generation', E'Chapter 93 carries the first seven of the ten “weeks” of the Apocalypse of Weeks (vv. 3–10); weeks 8–10 follow in Chapter 91:12–17. Enoch recounts from the books concerning the children of righteousness, the elect of the world and the plant of uprightness, according to what appeared to him in the heavenly vision, what he knew through the word of the holy angels, and what he learnt from the heavenly tablets (vv. 1–2). - Week 1: Enoch is born the seventh in the first week, while judgement and righteousness still endured (v. 3). - Week 2: Great wickedness and deceit spring up; in it is the first end (the Flood), and in it a man is saved; after it a law is made for the sinners (v. 4). - Week 3: At its close a man is elected as the plant of righteous judgement, and his posterity becomes the plant of righteousness for evermore (v. 5). - Week 4: Visions of the holy and righteous are seen, and a law for all generations and an enclosure is made for them (Exodus, Sinai, wilderness) (v. 6). - Week 5: The house of glory and dominion is built (Solomon’s temple) (v. 7). - Week 6: All who live in it are blinded and forsake wisdom; a man ascends; at its close the house of dominion is burnt with fire and the whole race of the chosen root is dispersed (divided kingdom to exile) (v. 8). - Week 7: An apostate generation arises, and all its deeds are apostate; at its close the elect righteous of the eternal plant of righteousness are elected to receive sevenfold instruction concerning all His creation (vv. 9–10). The bracketed verses 11–14 ask who among the children of men can hear the voice of the Holy One without being troubled, or behold the works of heaven, or measure the earth, the height of the heaven, and the number of the stars. Scriptural Cross-References (by section) - Week 7 – Apostate generation (v. 9) 2 Timothy 3:1–5 — In the last days perilous times… men will be lovers of self… evil… having a form of godliness but denying its power. 2 Peter 3:3–4 — Scoffers will come in the last days… saying, “Where is the promise of His coming?” - Elect righteous chosen for instruction (v. 10) Daniel 12:3 — Those who are wise shall shine like the brightness of the sky… like the stars forever. Revelation 2:17 — To the one who overcomes… I will give some of the hidden manna… a new name. - No one can fully comprehend Elohim (vv. 11–14) Job 11:7–9 — Can you find out the deep things of Elohim (God)? Can you find out the limit of the Almighty? Romans 11:33 — Oh, the depth of the riches… of Elohim (God)! How unsearchable are His judgments…! Isaiah 55:8–9 — My thoughts are not your thoughts… as the heavens are higher than the earth, so are My ways higher than your ways. Key Insight for Discernment Chapter 93 sets out the first seven weeks of history as Enoch read them from the heavenly tablets: righteousness at the beginning, the first end and a man saved, the plant of righteousness elected, a law for all generations, the house of glory built and then burnt, the chosen root dispersed, and an apostate generation at whose close the elect righteous receive sevenfold instruction. Weeks 8–10 continue in Chapter 91:12–17.');

-- ---------------------------------------------------------------------
-- 0. Pre-images
-- ---------------------------------------------------------------------
DO $before$
DECLARE r RECORD;
BEGIN
    FOR r IN
        SELECT c.chapter_number AS ch, count(v.id) AS n, min(v.verse_number) AS lo, max(v.verse_number) AS hi
          FROM chapters c
          JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
          LEFT JOIN verses v ON v.chapter_id = c.id
         WHERE c.chapter_number IN (91, 92, 93)
         GROUP BY c.chapter_number ORDER BY 1
    LOOP
        RAISE NOTICE 'S438 BEFORE  Enoch %: % verse rows (v%..v%)', r.ch, r.n, r.lo, r.hi;
    END LOOP;
END
$before$;

-- ---------------------------------------------------------------------
-- 1. Chapter titles + chapter commentary (chapter_intro)
-- ---------------------------------------------------------------------
UPDATE chapters c
   SET chapter_title = s.title,
       chapter_intro = s.intro
  FROM _s438_chapters s, books b, editions e
 WHERE c.chapter_number = s.ch
   AND c.book_id = b.id    AND b.slug = '1-enoch'
   AND b.edition_id = e.id AND e.slug = 'enoch'
   AND (c.chapter_title IS DISTINCT FROM s.title OR c.chapter_intro IS DISTINCT FROM s.intro);

-- ---------------------------------------------------------------------
-- 2. Verses: update in place / insert missing
-- ---------------------------------------------------------------------
INSERT INTO verses (chapter_id, verse_number, text)
SELECT c.id, s.vn, s.txt
  FROM _s438_verses s
  JOIN chapters c ON c.chapter_number = s.ch
  JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
  JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
ON CONFLICT (chapter_id, verse_number)
DO UPDATE SET text = EXCLUDED.text
      WHERE verses.text IS DISTINCT FROM EXCLUDED.text;

-- ---------------------------------------------------------------------
-- 3. Surplus rows: delete only if nothing references them
-- ---------------------------------------------------------------------
DO $surplus$
DECLARE r RECORD; fk RECORD; hit BOOLEAN; refs TEXT;
BEGIN
    FOR r IN
        SELECT v.id, c.chapter_number AS ch, v.verse_number AS vn, left(v.text, 60) AS t
          FROM verses v
          JOIN chapters c ON c.id = v.chapter_id
          JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
         WHERE (c.chapter_number = 91 AND v.verse_number > 19)
            OR (c.chapter_number = 92 AND v.verse_number > 5)
            OR (c.chapter_number = 93 AND v.verse_number > 14)
         ORDER BY c.chapter_number, v.verse_number
    LOOP
        refs := '';
        FOR fk IN
            SELECT cl.relname AS tbl, a.attname AS col
              FROM pg_constraint con
              JOIN pg_class cl     ON cl.oid = con.conrelid
              JOIN pg_namespace ns ON ns.oid = cl.relnamespace
              JOIN pg_attribute a  ON a.attrelid = con.conrelid AND a.attnum = con.conkey[1]
             WHERE con.contype = 'f'
               AND con.confrelid = 'verses'::regclass
               AND ns.nspname NOT LIKE 'pg_temp%'
        LOOP
            EXECUTE format('SELECT EXISTS (SELECT 1 FROM %I WHERE %I = $1)', fk.tbl, fk.col)
               INTO hit USING r.id;
            IF hit THEN
                refs := refs || fk.tbl || '.' || fk.col || ' ';
            END IF;
        END LOOP;
        IF refs = '' THEN
            DELETE FROM verses WHERE id = r.id;
            RAISE NOTICE 'S438 DELETED surplus Enoch %:% (id %) "%"', r.ch, r.vn, r.id, r.t;
        ELSE
            RAISE NOTICE 'S438 KEPT surplus Enoch %:% (id %) — referenced by: %  "%"', r.ch, r.vn, r.id, refs, r.t;
        END IF;
    END LOOP;
END
$surplus$;

-- ---------------------------------------------------------------------
-- 4. search_vocabulary — add any new lexemes (additive only)
-- ---------------------------------------------------------------------
DO $vocab$
BEGIN
    IF to_regclass('public.search_vocabulary') IS NOT NULL THEN
        INSERT INTO search_vocabulary (lexeme, occurrences)
        SELECT word, ndoc FROM ts_stat($q$
            SELECT v.text_tsv FROM verses v
              JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number IN (91, 92, 93)
              JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
              JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
        $q$)
        ON CONFLICT (lexeme) DO NOTHING;
    END IF;
END
$vocab$;

-- ---------------------------------------------------------------------
-- 5. Verify + report
-- ---------------------------------------------------------------------
DO $verify$
DECLARE missing INT; wrong INT; nchap INT; r RECORD;
BEGIN
    SELECT count(*) INTO nchap
      FROM chapters c
      JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
      JOIN _s438_chapters s ON s.ch = c.chapter_number
     WHERE c.chapter_title = s.title AND c.chapter_intro = s.intro;
    IF nchap <> 3 THEN
        RAISE EXCEPTION 'S438: expected 3 corrected chapter rows (91-93), found %', nchap;
    END IF;

    SELECT count(*) INTO missing
      FROM _s438_verses s
     WHERE NOT EXISTS (
        SELECT 1 FROM verses v
          JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = s.ch
          JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
         WHERE v.verse_number = s.vn);
    SELECT count(*) INTO wrong
      FROM _s438_verses s
      JOIN chapters c ON c.chapter_number = s.ch
      JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
      JOIN verses   v ON v.chapter_id = c.id AND v.verse_number = s.vn
     WHERE v.text IS DISTINCT FROM s.txt;
    IF missing <> 0 OR wrong <> 0 THEN
        RAISE EXCEPTION 'S438: verse rebuild incomplete — missing=%, wrong text=%', missing, wrong;
    END IF;
    RAISE NOTICE 'S438 AFTER   38 target verses present with new text (91:1-19, 92:1-5, 93:1-14)';

    FOR r IN
        SELECT c.chapter_number AS ch, count(v.id) AS n, max(v.verse_number) AS hi
          FROM chapters c
          JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
          LEFT JOIN verses v ON v.chapter_id = c.id
         WHERE c.chapter_number IN (91, 92, 93)
         GROUP BY c.chapter_number ORDER BY 1
    LOOP
        RAISE NOTICE 'S438 AFTER   Enoch %: % verse rows (max v%)', r.ch, r.n, r.hi;
    END LOOP;

    -- Cross-references touching Enoch 91-93 (written against the OLD text; review)
    FOR r IN
        SELECT x.id, sb.slug AS sbook, sc.chapter_number AS sch, sv.verse_number AS svn,
               tb.slug AS tbook, tc.chapter_number AS tch, tv.verse_number AS tvn,
               left(coalesce(x.note, ''), 90) AS note
          FROM cross_references x
          JOIN verses   sv ON sv.id = x.source_verse_id
          JOIN chapters sc ON sc.id = sv.chapter_id
          JOIN books    sb ON sb.id = sc.book_id
          JOIN editions se ON se.id = sb.edition_id
          JOIN verses   tv ON tv.id = x.target_verse_id
          JOIN chapters tc ON tc.id = tv.chapter_id
          JOIN books    tb ON tb.id = tc.book_id
          JOIN editions te ON te.id = tb.edition_id
         WHERE (se.slug = 'enoch' AND sb.slug = '1-enoch' AND sc.chapter_number IN (91, 92, 93))
            OR (te.slug = 'enoch' AND tb.slug = '1-enoch' AND tc.chapter_number IN (91, 92, 93))
         ORDER BY sc.chapter_number, sv.verse_number, x.id
    LOOP
        RAISE NOTICE 'S438 XREF #% % %:% -> % %:%  | %', r.id, r.sbook, r.sch, r.svn, r.tbook, r.tch, r.tvn, r.note;
    END LOOP;
END
$verify$;

COMMIT;
\echo 'session438 — Enoch 91-93 rebuild complete.'
