-- =====================================================================
-- Session 455 migration — 2026-10-17
-- Retire the `apocrypha-charles-vol1` edition; keep 3 Maccabees inside `pseudepigrapha`
-- =====================================================================
-- WHY: S454 audited the Charles-1913-vol-1 edition against the KJV/RV structure: 37% of its
-- verse numbers are missing and 36% of its 3,318 rows carry OCR/apparatus garbage (tesseract
-- scan, no clean digital Charles vol. 1 exists). Yoshi decided (Oct 17, 9:28 PM): retire the
-- edition. Its ONE clean book, 3 Maccabees, is kept — S455 verified it by content against
-- Brenton 1851 (eBible, public domain): 228/228 verses equal Brenton, the only differences are
-- restored-name renderings (source-texts/3-maccabees-brenton-1851/3macc-damage-table.md).
--
-- WHAT:
--   1. 3 Maccabees: UPDATE books SET edition_id = pseudepigrapha, witness_category =
--      'pseudepigrapha', canonical_order = 366 (4 Maccabees moves 366 -> 367 so 3 sits before 4).
--      book / chapter / verse ids are UNCHANGED, so every cross-reference card, thread anchor,
--      bookmark, highlight, note and reading position on 3 Maccabees survives untouched.
--   2. The other 14 Charles-vol-1 books: deleted ONLY if nothing references them (dynamic FK
--      scan of every table that points at books / chapters / verses — the S453 surplus pattern).
--      A referenced book is KEPT and reported (the reader already hides Charles-vol-1 books
--      other than 3 Maccabees, so a kept book stays invisible).
--   3. The edition row is deleted once it has no books left.
-- Rule 10 — no id changes. Idempotent: re-running finds nothing to move or delete. Run:
--   python3 api/apply_migration.py data-schema/migrations/session455_retire_charles_vol1.sql
-- =====================================================================
\echo 'session455 — retire apocrypha-charles-vol1 starting...'
BEGIN;

-- 0. BEFORE: how many cards touch 3 Maccabees (must be identical AFTER)
CREATE TEMP TABLE _s455_before AS
SELECT
  (SELECT count(*) FROM cross_references x
     WHERE x.source_verse_id IN (SELECT v.id FROM verses v JOIN chapters c ON c.id = v.chapter_id
                                   JOIN books b ON b.id = c.book_id AND b.slug = '3-maccabees')
        OR x.target_verse_id IN (SELECT v.id FROM verses v JOIN chapters c ON c.id = v.chapter_id
                                   JOIN books b ON b.id = c.book_id AND b.slug = '3-maccabees')) AS cards_3macc,
  (SELECT count(*) FROM cross_reference_threads t
     WHERE t.anchor_verse_id_start IN (SELECT v.id FROM verses v JOIN chapters c ON c.id = v.chapter_id
                                         JOIN books b ON b.id = c.book_id AND b.slug = '3-maccabees')) AS threads_3macc,
  (SELECT count(v.id) FROM verses v JOIN chapters c ON c.id = v.chapter_id
     JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha-charles-vol1') AS rows_cv1,
  (SELECT count(*) FROM books b JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha-charles-vol1') AS books_cv1,
  (SELECT b.id FROM books b JOIN editions e ON e.id = b.edition_id AND e.slug IN ('apocrypha-charles-vol1','pseudepigrapha')
     WHERE b.slug = '3-maccabees' ORDER BY (e.slug = 'apocrypha-charles-vol1') DESC LIMIT 1) AS book_id_3macc;

DO $before$
DECLARE r RECORD;
BEGIN
    SELECT * INTO r FROM _s455_before;
    RAISE NOTICE 'S455 BEFORE  charles-vol1: % books, % verse rows (expect 15 / 3318 on first run); 3 Maccabees book id %, cards on it %, threads anchored on it %',
        r.books_cv1, r.rows_cv1, r.book_id_3macc, r.cards_3macc, r.threads_3macc;
END $before$;

-- 1. Move 3 Maccabees into the pseudepigrapha edition, beside 4 Maccabees (ids unchanged)
DO $move$
DECLARE cv1 INT; pse INT; in_cv1 INT; in_pse INT; o4 INT;
BEGIN
    SELECT id INTO cv1 FROM editions WHERE slug = 'apocrypha-charles-vol1';
    SELECT id INTO pse FROM editions WHERE slug = 'pseudepigrapha';
    IF pse IS NULL THEN RAISE EXCEPTION 'S455: pseudepigrapha edition not found'; END IF;
    SELECT id INTO in_cv1 FROM books WHERE edition_id = cv1 AND slug = '3-maccabees';
    SELECT id INTO in_pse FROM books WHERE edition_id = pse AND slug = '3-maccabees';
    IF in_cv1 IS NULL AND in_pse IS NOT NULL THEN
        RAISE NOTICE 'S455 3 Maccabees already in pseudepigrapha (book id %) — nothing to move', in_pse;
    ELSIF in_cv1 IS NOT NULL AND in_pse IS NOT NULL THEN
        RAISE EXCEPTION 'S455: a 3-maccabees book already exists in pseudepigrapha (id %) AND in charles-vol1 (id %) — sort by hand', in_pse, in_cv1;
    ELSIF in_cv1 IS NULL THEN
        RAISE EXCEPTION 'S455: 3-maccabees not found in either edition';
    ELSE
        SELECT canonical_order INTO o4 FROM books WHERE edition_id = pse AND slug = '4-maccabees';
        IF o4 IS NULL THEN RAISE EXCEPTION 'S455: 4-maccabees not found in pseudepigrapha'; END IF;
        -- open the slot: 4 Maccabees and anything after it in this edition shift by one
        UPDATE books SET canonical_order = canonical_order + 1 WHERE edition_id = pse AND canonical_order >= o4;
        UPDATE books SET edition_id = pse, witness_category = 'pseudepigrapha', canonical_order = o4
         WHERE id = in_cv1;
        RAISE NOTICE 'S455 moved 3 Maccabees (book id %) into pseudepigrapha at canonical_order % (4 Maccabees now %)', in_cv1, o4, o4 + 1;
    END IF;
END $move$;

-- 2. The other Charles-vol-1 books: delete only if nothing references the book, its chapters or its verses
DO $retire$
DECLARE cv1 INT; r RECORD; fk RECORD; hit BOOLEAN; refs TEXT; ndel INT := 0; nkept INT := 0;
BEGIN
    SELECT id INTO cv1 FROM editions WHERE slug = 'apocrypha-charles-vol1';
    IF cv1 IS NULL THEN RAISE NOTICE 'S455 edition apocrypha-charles-vol1 already gone'; RETURN; END IF;
    FOR r IN SELECT id, slug FROM books WHERE edition_id = cv1 ORDER BY canonical_order LOOP
        refs := '';
        -- every FK that points at books / chapters / verses, except the content chain itself
        FOR fk IN
            SELECT cl.relname AS tbl, a.attname AS col, con.confrelid::regclass::text AS parent
              FROM pg_constraint con
              JOIN pg_class cl     ON cl.oid = con.conrelid
              JOIN pg_namespace ns ON ns.oid = cl.relnamespace
              JOIN pg_attribute a  ON a.attrelid = con.conrelid AND a.attnum = con.conkey[1]
             WHERE con.contype = 'f'
               AND con.confrelid IN ('books'::regclass, 'chapters'::regclass, 'verses'::regclass)
               AND ns.nspname NOT LIKE 'pg_temp%'
               AND NOT (cl.relname = 'chapters' AND a.attname = 'book_id')
               AND NOT (cl.relname = 'verses'   AND a.attname = 'chapter_id')
        LOOP
            IF fk.parent = 'books' THEN
                EXECUTE format('SELECT EXISTS (SELECT 1 FROM %I WHERE %I = $1)', fk.tbl, fk.col) INTO hit USING r.id;
            ELSIF fk.parent = 'chapters' THEN
                EXECUTE format('SELECT EXISTS (SELECT 1 FROM %I t WHERE t.%I IN (SELECT id FROM chapters WHERE book_id = $1))', fk.tbl, fk.col) INTO hit USING r.id;
            ELSE
                EXECUTE format('SELECT EXISTS (SELECT 1 FROM %I t WHERE t.%I IN (SELECT v.id FROM verses v JOIN chapters c ON c.id = v.chapter_id WHERE c.book_id = $1))', fk.tbl, fk.col) INTO hit USING r.id;
            END IF;
            IF hit THEN refs := refs || fk.tbl || '.' || fk.col || ' '; END IF;
        END LOOP;
        IF refs = '' THEN
            DELETE FROM books WHERE id = r.id;   -- cascades chapters -> verses
            ndel := ndel + 1;
        ELSE
            nkept := nkept + 1;
            RAISE NOTICE 'S455 KEPT charles-vol1 book % (id %) — referenced by: %', r.slug, r.id, refs;
        END IF;
    END LOOP;
    RAISE NOTICE 'S455 charles-vol1 books deleted: %, kept (referenced): %', ndel, nkept;
    -- 3. edition row goes once it is empty
    IF NOT EXISTS (SELECT 1 FROM books WHERE edition_id = cv1) THEN
        DELETE FROM editions WHERE id = cv1;
        RAISE NOTICE 'S455 edition apocrypha-charles-vol1 deleted';
    ELSE
        RAISE NOTICE 'S455 edition apocrypha-charles-vol1 KEPT (still has referenced books) — the reader filter in App.tsx keeps them hidden';
    END IF;
END $retire$;

-- 4. Verify
DO $verify$
DECLARE b RECORD; bid INT; nch INT; nv INT; cards INT; threads INT; left_rows INT;
BEGIN
    SELECT * INTO b FROM _s455_before;
    SELECT bk.id INTO bid FROM books bk JOIN editions e ON e.id = bk.edition_id AND e.slug = 'pseudepigrapha' WHERE bk.slug = '3-maccabees';
    IF bid IS NULL THEN RAISE EXCEPTION 'S455: 3 Maccabees is not in pseudepigrapha after the move'; END IF;
    IF b.book_id_3macc IS NOT NULL AND bid <> b.book_id_3macc THEN RAISE EXCEPTION 'S455: 3 Maccabees book id changed % -> %', b.book_id_3macc, bid; END IF;
    SELECT count(*) INTO nch FROM chapters WHERE book_id = bid;
    SELECT count(v.id) INTO nv FROM verses v JOIN chapters c ON c.id = v.chapter_id WHERE c.book_id = bid;
    SELECT count(*) INTO cards FROM cross_references x
     WHERE x.source_verse_id IN (SELECT v.id FROM verses v JOIN chapters c ON c.id = v.chapter_id WHERE c.book_id = bid)
        OR x.target_verse_id IN (SELECT v.id FROM verses v JOIN chapters c ON c.id = v.chapter_id WHERE c.book_id = bid);
    SELECT count(*) INTO threads FROM cross_reference_threads t
     WHERE t.anchor_verse_id_start IN (SELECT v.id FROM verses v JOIN chapters c ON c.id = v.chapter_id WHERE c.book_id = bid);
    IF nch <> 7 OR nv <> 228 THEN RAISE EXCEPTION 'S455: 3 Maccabees has % chapters / % verses (expect 7 / 228)', nch, nv; END IF;
    IF cards <> b.cards_3macc OR threads <> b.threads_3macc THEN
        RAISE EXCEPTION 'S455: cards on 3 Maccabees changed % -> %, threads % -> %', b.cards_3macc, cards, b.threads_3macc, threads;
    END IF;
    SELECT count(v.id) INTO left_rows FROM verses v JOIN chapters c ON c.id = v.chapter_id
      JOIN books bk ON bk.id = c.book_id JOIN editions e ON e.id = bk.edition_id AND e.slug = 'apocrypha-charles-vol1';
    RAISE NOTICE 'S455 AFTER   3 Maccabees in pseudepigrapha (book id %): 7 ch / 228 vv, cards % (unchanged), threads % (unchanged); charles-vol1 verse rows left: % (expect 0)',
        bid, cards, threads, left_rows;
END $verify$;

INSERT INTO schema_version (id, version, notes) VALUES (1, '1.0.0-phase4-session455',
  'Session 455 (2026-10-17) — apocrypha-charles-vol1 edition retired (OCR text, S454 audit); 3 Maccabees moved into pseudepigrapha with ids unchanged (verified by content vs Brenton 1851, S455).')
ON CONFLICT (id) DO UPDATE SET version = EXCLUDED.version, landed_at = now(), notes = EXCLUDED.notes;

COMMIT;
\echo 'session455 — retire apocrypha-charles-vol1 done.'
