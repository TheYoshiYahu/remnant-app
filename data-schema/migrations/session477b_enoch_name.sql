-- =====================================================================
-- Session 477b — 2026-10-26 — "Chanok (Enoch)" / "Enoch (Chanok)" -> "Enoch" in the written notes.
-- Yoshi (Oct 26): the name is Enoch, in text and in the readings. No verse ever carried "Chanok"; it sat in three Matthew
-- chapter notes (17, 22, 25 — chapters.chapter_intro, from canon.json) and in two card notes (card 7901 and its thread 635 member note).
-- Guarded: each UPDATE only touches rows that still carry the old form. Idempotent. Run: python3 api/apply_migration.py data-schema/migrations/session477b_enoch_name.sql
-- =====================================================================
BEGIN;
UPDATE chapters c SET chapter_intro = replace(c.chapter_intro, 'Chanok (Enoch)', 'Enoch')
  FROM books b JOIN editions e ON e.id = b.edition_id
 WHERE c.book_id = b.id AND e.slug = 'canon' AND b.slug = 'matthew' AND c.chapter_number IN (17, 22, 25) AND c.chapter_intro LIKE '%Chanok (Enoch)%';
UPDATE cross_references SET note = replace(note, 'Enoch (Chanok)', 'Enoch') WHERE id = 7901 AND note LIKE '%Enoch (Chanok)%';
UPDATE cross_reference_thread_members SET member_note = replace(member_note, 'Enoch (Chanok)', 'Enoch') WHERE thread_id = 635 AND cross_reference_id = 7901 AND member_note LIKE '%Enoch (Chanok)%';
DO $$ DECLARE n INT; BEGIN
  SELECT count(*) INTO n FROM chapters WHERE chapter_intro ILIKE '%chanok%';
  SELECT n + count(*) INTO n FROM cross_references WHERE note ILIKE '%chanok%';
  SELECT n + count(*) INTO n FROM cross_reference_thread_members WHERE member_note ILIKE '%chanok%';
  SELECT n + count(*) INTO n FROM cross_reference_threads WHERE summary_md ILIKE '%chanok%';
  SELECT n + count(*) INTO n FROM verses WHERE text ILIKE '%chanok%';
  IF n > 0 THEN RAISE EXCEPTION 'S477b: % rows still carry "Chanok" — read them before this commits', n; END IF;
END $$;
COMMIT;
