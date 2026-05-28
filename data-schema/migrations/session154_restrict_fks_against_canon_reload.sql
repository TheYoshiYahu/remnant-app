-- S154 Wheel #A — flip the FKs that bit S153 from ON DELETE CASCADE to
-- ON DELETE RESTRICT. The schema-level half of the architectural fix; the
-- seed.py half (default --seed-only skips canon, explicit --reseed-canon
-- flag, sanity guard) lands in the same commit. Together they make the
-- S153 emergency impossible to recur even if a future session-Claude
-- instructs the seed call.
--
-- Background. S153 opened on the v2.1 polish wheel and pivoted within the
-- first turn to an emergency: all Matthew commentary + cross-references
-- vanished from the live PWA. Root cause was structural — the post-seed
-- loaders' output (commentary_entries, cross_references,
-- cross_reference_thread_members) attached to canon verses via FKs whose
-- ON DELETE CASCADE was correct for verses-replacing-verses-in-place but
-- wrong for the actual operational case: a seed reload of canon (which
-- routes through `DELETE FROM books WHERE edition_id = canon` and
-- cascade-deletes chapters → verses → everything attached). The reload
-- of canon also wiped every commentary entry from S110 / S112 and every
-- xref from S110+S131..S146 + S111 + S140b + S147 + S147b. Restored in
-- one pass via `_scratch/_s153_restore_matthew.py`; restored state
-- confirmed live on the PWA.
--
-- The S149 modernization wheel had already authored Rule 10 ("seed.py is
-- destructive for content edits") so the seed-call pattern was clearly
-- not supposed to be the canon-change vehicle. The architectural fix
-- here closes the loop at the schema level: even if a future session
-- instructs seed.py, the FK constraints make the cascade impossible.
-- Failing-loud at the FK is the right behavior — if the framework-
-- bearing data exists, a canon reload should abort before damage, not
-- silently take everything down with it.
--
-- This migration:
--   * commentary_entries.chapter_id_fkey      CASCADE -> RESTRICT
--   * commentary_entries.verse_id_fkey        CASCADE -> RESTRICT
--   * cross_references.source_verse_id_fkey   CASCADE -> RESTRICT
--   * cross_references.target_verse_id_fkey   CASCADE -> RESTRICT
--   * cross_reference_thread_members.cross_reference_id_fkey CASCADE -> RESTRICT
--
-- NOT changed by this migration (left as-is):
--   * cross_reference_threads.anchor_verse_id_{start,end}_fkey  SET NULL
--     (intentionally tolerant — pre-existing threads with NULL anchors
--     are S153 cosmetic Wheel #C, deferred. API uses LEFT JOIN.)
--   * cross_reference_thread_members.thread_id_fkey  CASCADE
--     (deleting a thread should delete its members — the join row IS
--     the thread membership.)
--   * Everything in concept_verse_index, study_notes, bookmarks,
--     verse_highlights, reading_positions — those carry user data and
--     have their own CASCADE story; not S154 scope.
--
-- ALTER FK pattern in PostgreSQL is DROP + ADD (no in-place edit of the
-- ON DELETE clause). Both halves run inside the same transaction so the
-- constraint is never absent in the visible DB state. No data changes;
-- this is pure DDL.
--
-- Verify post-apply:
--   * All five constraints now report CONFDELTYPE='r' (RESTRICT) in
--     pg_constraint, not 'c' (CASCADE).
--   * Cascade-from-verses no longer reaches commentary_entries /
--     cross_references / thread members; an attempted DELETE on books
--     for the canon edition will fail with FK violation rather than
--     silently cascade.
--
-- Sibling change this session: api/seed.py adds --reseed-canon flag
-- (default --seed-only skips canon entirely, matching what
-- hosting/render.yaml has been falsely claiming since launch). Also a
-- sanity guard that aborts if a reload would touch >0 commentary or
-- cross-reference rows without --reseed-canon. Belt + suspenders + the
-- schema-level RESTRICT means three independent layers have to all be
-- defeated for the S153 emergency to recur.

BEGIN;

-- ---------------- commentary_entries ----------------

ALTER TABLE commentary_entries
    DROP CONSTRAINT commentary_entries_chapter_id_fkey;
ALTER TABLE commentary_entries
    ADD CONSTRAINT commentary_entries_chapter_id_fkey
    FOREIGN KEY (chapter_id) REFERENCES chapters(id) ON DELETE RESTRICT;

ALTER TABLE commentary_entries
    DROP CONSTRAINT commentary_entries_verse_id_fkey;
ALTER TABLE commentary_entries
    ADD CONSTRAINT commentary_entries_verse_id_fkey
    FOREIGN KEY (verse_id) REFERENCES verses(id) ON DELETE RESTRICT;

-- ---------------- cross_references ------------------

ALTER TABLE cross_references
    DROP CONSTRAINT cross_references_source_verse_id_fkey;
ALTER TABLE cross_references
    ADD CONSTRAINT cross_references_source_verse_id_fkey
    FOREIGN KEY (source_verse_id) REFERENCES verses(id) ON DELETE RESTRICT;

ALTER TABLE cross_references
    DROP CONSTRAINT cross_references_target_verse_id_fkey;
ALTER TABLE cross_references
    ADD CONSTRAINT cross_references_target_verse_id_fkey
    FOREIGN KEY (target_verse_id) REFERENCES verses(id) ON DELETE RESTRICT;

-- ---------------- cross_reference_thread_members ----

ALTER TABLE cross_reference_thread_members
    DROP CONSTRAINT cross_reference_thread_members_cross_reference_id_fkey;
ALTER TABLE cross_reference_thread_members
    ADD CONSTRAINT cross_reference_thread_members_cross_reference_id_fkey
    FOREIGN KEY (cross_reference_id) REFERENCES cross_references(id) ON DELETE RESTRICT;

-- ---------------- verification ----------------------

DO $verify$
DECLARE
  v_cascading_count INT;
  v_restricting_count INT;
BEGIN
  -- All five target FKs should now report confdeltype = 'r' (RESTRICT).
  -- pg_constraint.confdeltype codes: 'a' = no action, 'r' = restrict,
  -- 'c' = cascade, 'n' = set null, 'd' = set default.
  SELECT count(*)
    INTO v_restricting_count
    FROM pg_constraint
   WHERE conname IN (
           'commentary_entries_chapter_id_fkey',
           'commentary_entries_verse_id_fkey',
           'cross_references_source_verse_id_fkey',
           'cross_references_target_verse_id_fkey',
           'cross_reference_thread_members_cross_reference_id_fkey'
         )
     AND confdeltype = 'r';

  IF v_restricting_count <> 5 THEN
    RAISE EXCEPTION
      'S154 FK flip incomplete: expected 5 RESTRICT constraints, found %',
      v_restricting_count;
  END IF;

  -- And none of the five should still report CASCADE.
  SELECT count(*)
    INTO v_cascading_count
    FROM pg_constraint
   WHERE conname IN (
           'commentary_entries_chapter_id_fkey',
           'commentary_entries_verse_id_fkey',
           'cross_references_source_verse_id_fkey',
           'cross_references_target_verse_id_fkey',
           'cross_reference_thread_members_cross_reference_id_fkey'
         )
     AND confdeltype = 'c';

  IF v_cascading_count <> 0 THEN
    RAISE EXCEPTION
      'S154 FK flip incomplete: % constraints still CASCADE',
      v_cascading_count;
  END IF;
END;
$verify$;

-- ---------------- schema_version stamp --------------

UPDATE schema_version
   SET version    = '1.0.0-phase4-session154',
       landed_at  = now(),
       notes      = 'S154 Wheel #A — architectural fix preventing recurrence of the S153 emergency. Five FKs flipped from ON DELETE CASCADE to ON DELETE RESTRICT: commentary_entries.{chapter_id, verse_id}, cross_references.{source_verse_id, target_verse_id}, cross_reference_thread_members.cross_reference_id. After this migration a canon edition reload via seed.py (DELETE FROM books WHERE edition_id = canon) can no longer silently cascade through chapters and verses into the framework-bearing apparatus — the DELETE will fail at the FK if any commentary or cross-reference rows attach to the affected verses. Sibling change this session in api/seed.py: --reseed-canon flag added (default --seed-only now skips canon entirely, matching the long-standing render.yaml comment); sanity guard aborts if the seed would touch framework-bearing rows without --reseed-canon. Three independent layers (seed.py default, sanity guard, schema RESTRICT) must all be defeated for the S153 reload pattern to recur. Prior version: 1.0.0-phase4-session152.'
 WHERE id = 1;

COMMIT;
