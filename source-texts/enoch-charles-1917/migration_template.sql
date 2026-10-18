-- =====================================================================
-- Session 449 migration — 2026-10-15
-- 1 Enoch: ALL 108 chapters rebuilt to the R.H. Charles 1917 text
-- =====================================================================
-- Edition: editions.slug='enoch' -> books.slug='1-enoch' -> chapters 1-108.
--
-- WHY: S449 diffed the seeded edition against a clean Charles 1917 base
-- VERSE BY VERSE, BY CONTENT (source-texts/enoch-charles-1917/, two
-- independent witnesses: Wikisource + sacred-texts.com). Of 1,062 Charles
-- verses only 412 were present intact; 561 were missing; 872 seeded verses
-- had no Charles counterpart in their chapter (349 were Charles text from
-- another chapter, 515 matched nothing in Charles at all — invented).
-- Only 17 chapters were intact. Full table: enoch-damage-table.md.
--
-- Source of truth: source-texts/parsed/enoch.json (S449), parsed from
-- existing-restored-editions/Enoch-Restored-Names-Edition.txt, rebuilt from
-- the Charles base through restoration-pipeline/restore.py (source-echo
-- parentheticals: Yahuah (Lord), Elohim (God), El Elyon (Most High), son of
-- Adam). Verified: every verse equals Charles word-for-word once the
-- restored names are mapped back.
--
-- WHAT IT DOES (ids preserved wherever a row already exists):
--   1. UPSERT verses (chapter_id, verse_number): existing rows updated IN
--      PLACE (verses.id unchanged, every FK survives); missing rows INSERTed.
--   2. Surplus rows (verse_number above Charles's last verse) DELETEd ONLY
--      when no table with a FK to verses(id) points at them; otherwise KEPT
--      and reported (they still show old text until their cards are handled).
--   3. search_vocabulary: new lexemes added (additive only).
--   4. Verify: all {{TOTAL}} target rows present with the new text, else EXCEPTION.
--      Reports per-chapter row counts and every cross_reference touching Enoch
--      (all were written against the OLD text; see enoch-commentary-flags.md).
-- Chapter titles and commentary (chapter_intro) are NOT changed here.
-- Idempotent. Run:
--   python3 api/apply_migration.py data-schema/migrations/session449_enoch_full_rebuild.sql
-- =====================================================================
\echo 'session449 — Enoch full rebuild starting...'
BEGIN;

CREATE TEMP TABLE _s449_verses (ch INT, vn INT, txt TEXT, PRIMARY KEY (ch, vn)) ON COMMIT DROP;
INSERT INTO _s449_verses (ch, vn, txt) VALUES
{{VALS}};

CREATE TEMP TABLE _s449_max (ch INT PRIMARY KEY, hi INT) ON COMMIT DROP;
INSERT INTO _s449_max (ch, hi) VALUES {{MAXES}};

DO $before$
DECLARE n INT;
BEGIN
    SELECT count(v.id) INTO n FROM verses v
      JOIN chapters c ON c.id = v.chapter_id
      JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch';
    RAISE NOTICE 'S449 BEFORE  Enoch verse rows: %', n;
END
$before$;

-- 1. Verses: update in place / insert missing
INSERT INTO verses (chapter_id, verse_number, text)
SELECT c.id, s.vn, s.txt
  FROM _s449_verses s
  JOIN chapters c ON c.chapter_number = s.ch
  JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
  JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
ON CONFLICT (chapter_id, verse_number)
DO UPDATE SET text = EXCLUDED.text
      WHERE verses.text IS DISTINCT FROM EXCLUDED.text;

-- 2. Surplus rows: delete only if nothing references them
DO $surplus$
DECLARE r RECORD; fk RECORD; hit BOOLEAN; refs TEXT; ndel INT := 0; nkept INT := 0;
BEGIN
    FOR r IN
        SELECT v.id, c.chapter_number AS ch, v.verse_number AS vn, left(v.text, 60) AS t
          FROM verses v
          JOIN chapters c ON c.id = v.chapter_id
          JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
          JOIN _s449_max m ON m.ch = c.chapter_number
         WHERE v.verse_number > m.hi
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
            IF hit THEN refs := refs || fk.tbl || '.' || fk.col || ' '; END IF;
        END LOOP;
        IF refs = '' THEN
            DELETE FROM verses WHERE id = r.id; ndel := ndel + 1;
        ELSE
            nkept := nkept + 1;
            RAISE NOTICE 'S449 KEPT surplus Enoch %:% (id %) — referenced by: %  "%"', r.ch, r.vn, r.id, refs, r.t;
        END IF;
    END LOOP;
    RAISE NOTICE 'S449 surplus rows deleted: %, kept (referenced): %', ndel, nkept;
END
$surplus$;

-- 3. search_vocabulary — additive
DO $vocab$
BEGIN
    IF to_regclass('public.search_vocabulary') IS NOT NULL THEN
        INSERT INTO search_vocabulary (lexeme, occurrences)
        SELECT word, ndoc FROM ts_stat($q$
            SELECT v.text_tsv FROM verses v
              JOIN chapters c ON c.id = v.chapter_id
              JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
              JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
        $q$)
        ON CONFLICT (lexeme) DO NOTHING;
    END IF;
END
$vocab$;

-- 4. Verify + report
DO $verify$
DECLARE missing INT; wrong INT; n INT; r RECORD;
BEGIN
    SELECT count(*) INTO missing FROM _s449_verses s
     WHERE NOT EXISTS (SELECT 1 FROM verses v
          JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = s.ch
          JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
         WHERE v.verse_number = s.vn);
    SELECT count(*) INTO wrong FROM _s449_verses s
      JOIN chapters c ON c.chapter_number = s.ch
      JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
      JOIN verses   v ON v.chapter_id = c.id AND v.verse_number = s.vn
     WHERE v.text IS DISTINCT FROM s.txt;
    IF missing <> 0 OR wrong <> 0 THEN
        RAISE EXCEPTION 'S449: verse rebuild incomplete — missing=%, wrong text=%', missing, wrong;
    END IF;
    SELECT count(v.id) INTO n FROM verses v
      JOIN chapters c ON c.id = v.chapter_id
      JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch';
    RAISE NOTICE 'S449 AFTER   all {{TOTAL}} Charles verses present with new text; Enoch verse rows now: % (anything above {{TOTAL}} is a kept, referenced surplus row)', n;
    FOR r IN
        SELECT c.chapter_number AS ch, count(v.id) AS n, m.hi
          FROM chapters c
          JOIN books    b ON b.id = c.book_id    AND b.slug = '1-enoch'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'enoch'
          JOIN _s449_max m ON m.ch = c.chapter_number
          LEFT JOIN verses v ON v.chapter_id = c.id
         GROUP BY c.chapter_number, m.hi HAVING count(v.id) <> m.hi ORDER BY 1
    LOOP
        RAISE NOTICE 'S449 AFTER   Enoch %: % rows but Charles has % (kept surplus)', r.ch, r.n, r.hi;
    END LOOP;
    SELECT count(*) INTO n FROM cross_references x
      JOIN verses sv ON sv.id = x.source_verse_id JOIN chapters sc ON sc.id = sv.chapter_id JOIN books sb ON sb.id = sc.book_id
      JOIN verses tv ON tv.id = x.target_verse_id JOIN chapters tc ON tc.id = tv.chapter_id JOIN books tb ON tb.id = tc.book_id
     WHERE sb.slug = '1-enoch' OR tb.slug = '1-enoch';
    RAISE NOTICE 'S449 cross_references touching 1 Enoch (all written against the OLD text — review in step F): %', n;
    FOR r IN
        SELECT x.id, sb.slug AS sbook, sc.chapter_number AS sch, sv.verse_number AS svn,
               tb.slug AS tbook, tc.chapter_number AS tch, tv.verse_number AS tvn, left(coalesce(x.note,''),70) AS note
          FROM cross_references x
          JOIN verses sv ON sv.id = x.source_verse_id JOIN chapters sc ON sc.id = sv.chapter_id JOIN books sb ON sb.id = sc.book_id
          JOIN verses tv ON tv.id = x.target_verse_id JOIN chapters tc ON tc.id = tv.chapter_id JOIN books tb ON tb.id = tc.book_id
         WHERE sb.slug = '1-enoch' OR tb.slug = '1-enoch'
         ORDER BY sb.slug, sc.chapter_number, sv.verse_number
    LOOP
        RAISE NOTICE 'S449 XREF % %:%:% -> %:%:% | %', r.id, r.sbook, r.sch, r.svn, r.tbook, r.tch, r.tvn, r.note;
    END LOOP;
END
$verify$;

COMMIT;
\echo 'session449 — Enoch full rebuild done.'
