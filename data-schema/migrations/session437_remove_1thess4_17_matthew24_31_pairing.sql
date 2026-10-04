-- =====================================================================
-- Session 437 — remove the 1 Thessalonians 4:17 -> Matthew 24:31 pairing
-- The catching-up of 4:17 is the "Come up hither" of Revelation 11:12, after the
-- reign; the Olivet gathering of Matthew 24:31 is at his return. The settled order
-- of the end (2026-10-02) rules this pairing out. Session 434 reworded the note;
-- this removes the row and its thread membership. The source migration
-- (session233) was corrected in place to match.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session437_remove_1thess4_17_matthew24_31_pairing.sql
-- =====================================================================
\echo 'session437 — removing 1 Thess 4:17 -> Matthew 24:31...'
BEGIN;

CREATE TEMP VIEW _s437_lu AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

CREATE TEMP TABLE _s437_x AS
SELECT x.id FROM cross_references x, _s437_lu sv, _s437_lu tv
 WHERE sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

DELETE FROM cross_reference_thread_members WHERE cross_reference_id IN (SELECT id FROM _s437_x);
DELETE FROM cross_references WHERE id IN (SELECT id FROM _s437_x);

COMMIT;
\echo 'session437 done.'
