-- Session 454c — 2026-10-17 — Apocrypha (KJV edition): strip the chapter-rule glyph "⸻"
-- that the parser glued onto the LAST verse of 172 chapters (the 2 Esdras 14:48 case in
-- session454 was one of them; the S454 read-back showed it on Rest of Esther 10:13).
-- Rule 10: UPDATE in place, ids kept. Idempotent. Run:
--   python3 api/apply_migration.py data-schema/migrations/session454c_apocrypha_chapter_rule.sql
\echo 'session454c — Apocrypha chapter-rule glyph strip starting...'
BEGIN;
DO $fix$
DECLARE n INT; left_ INT;
BEGIN
    UPDATE verses v SET text = rtrim(rtrim(rtrim(v.text), '⸻'))
      FROM chapters c JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha'
     WHERE v.chapter_id = c.id AND v.text LIKE '%⸻%';
    GET DIAGNOSTICS n = ROW_COUNT;
    SELECT count(*) INTO left_ FROM verses v JOIN chapters c ON c.id = v.chapter_id JOIN books b ON b.id = c.book_id
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'apocrypha' WHERE v.text LIKE '%⸻%';
    IF left_ <> 0 THEN RAISE EXCEPTION 'S454c: % rows still carry the glyph', left_; END IF;
    RAISE NOTICE 'S454c rows cleaned: % (expect 172 on first run, 0 on re-run); rows still carrying the glyph: 0', n;
END $fix$;
COMMIT;
\echo 'session454c — done.'
