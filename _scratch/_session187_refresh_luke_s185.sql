-- S187 — refresh Luke S185 cross-reference migration with current prose
-- =====================================================================
-- Use when _session187_diagnose_luke.sql reports that the DB carries
-- mixed prose state (some thread summaries FIXED, some still OLD) or
-- that any divergence-report-restored sentinel member row is MISSING.
--
-- IMPORTANT — Luke-anchored scoping:
--
-- Sort_orders 1217-1221 are SHARED between two migrations:
--   S185 Luke threads (anchored in Luke)
--   S184 right-hand-face-east cluster (anchored in OT/NT, NOT in Luke)
--
-- This refresh deletes ONLY rows anchored in Luke. The 5 S184 right-
-- hand-face-east threads at sort_orders 1217-1221 are preserved.
--
-- Run BOTH files in sequence:
--
--   psql "$DATABASE_URL" -f _scratch/_session187_refresh_luke_s185.sql
--   psql "$DATABASE_URL" -f data-schema/migrations/session185_luke_xref_members_and_threads.sql
--
-- Idempotent: if rows aren't present, the DELETEs are no-ops.
-- Wraps in a single transaction so a failed clear rolls back cleanly.
-- =====================================================================

\echo 'S187 refresh: clearing S185 Luke rows (preserving S184 right-hand-face-east cluster)...'
BEGIN;

-- ---------------------------------------------------------------------
-- 1. Identify S185 Luke-anchored thread IDs (preserving S184 cluster).
--    S185 threads: sort_order 1216-1250 AND anchor_verse in Luke.
--    S184 threads: sort_order 1217-1221 BUT anchor_verse NOT in Luke.
-- ---------------------------------------------------------------------
CREATE TEMP TABLE _s187_s185_thread_ids AS
SELECT t.id, t.slug
  FROM cross_reference_threads t
  JOIN verses v   ON v.id = t.anchor_verse_id_start
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b    ON b.id = c.book_id
 WHERE t.sort_order BETWEEN 1216 AND 1250
   AND b.slug = 'luke';

\echo 'Identified S185 Luke-anchored thread count (expect 35):'
SELECT count(*) AS s185_luke_threads_to_refresh FROM _s187_s185_thread_ids;

-- ---------------------------------------------------------------------
-- 2. Identify all S185-related cross_references rows.
--    S185 NEW-thread member rows: Luke source AND note attaches to
--      a slug in _s187_s185_thread_ids.
--    S185 bulk-attach member rows: Luke source AND note format
--      'thread:%' (attach to non-S185 existing threads with Luke
--      source verses — only S185 introduced Luke-source manual rows).
-- ---------------------------------------------------------------------
CREATE TEMP TABLE _s187_s185_cross_reference_ids AS
SELECT x.id
  FROM cross_references x
  JOIN verses sv   ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb    ON sb.id = sc.book_id
 WHERE sb.slug = 'luke'
   AND x.source = 'manual'
   AND x.note LIKE 'thread:%';

\echo 'Identified S185 cross_references rows to refresh (expect ~398):'
SELECT count(*) AS s185_cross_refs_to_refresh FROM _s187_s185_cross_reference_ids;

-- ---------------------------------------------------------------------
-- 3. DELETE cross_reference_thread_members in two passes:
--    a) Members whose cross_reference_id is in S185 (covers BOTH the
--       NEW-thread members AND the bulk-attach members).
--    b) Members whose thread_id is an S185 thread (catches any stragglers
--       attached via cross_references rows not picked up above).
-- ---------------------------------------------------------------------
DELETE FROM cross_reference_thread_members
 WHERE cross_reference_id IN (SELECT id FROM _s187_s185_cross_reference_ids);

DELETE FROM cross_reference_thread_members
 WHERE thread_id IN (SELECT id FROM _s187_s185_thread_ids);

-- ---------------------------------------------------------------------
-- 4. DELETE the cross_references rows themselves.
-- ---------------------------------------------------------------------
DELETE FROM cross_references
 WHERE id IN (SELECT id FROM _s187_s185_cross_reference_ids);

-- ---------------------------------------------------------------------
-- 5. DELETE the 35 S185 Luke-anchored thread headers.
--    The 5 S184 right-hand-face-east threads at sort 1217-1221 are
--    PRESERVED because their anchor_verse is not in Luke.
-- ---------------------------------------------------------------------
DELETE FROM cross_reference_threads
 WHERE id IN (SELECT id FROM _s187_s185_thread_ids);

-- ---------------------------------------------------------------------
-- 6. Report post-clear state.
-- ---------------------------------------------------------------------
\echo ''
\echo 'Post-clear counts (S185 rows expect zero; S184 cluster expect 5 preserved):'

SELECT count(*) AS remaining_s185_luke_threads
  FROM cross_reference_threads t
  JOIN verses v   ON v.id = t.anchor_verse_id_start
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b    ON b.id = c.book_id
 WHERE t.sort_order BETWEEN 1216 AND 1250
   AND b.slug = 'luke';

SELECT count(*) AS preserved_s184_threads_in_range
  FROM cross_reference_threads t
  JOIN verses v   ON v.id = t.anchor_verse_id_start
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b    ON b.id = c.book_id
 WHERE t.sort_order BETWEEN 1216 AND 1250
   AND b.slug <> 'luke';

SELECT count(*) AS remaining_luke_manual_xrefs
  FROM cross_references x
  JOIN verses v   ON v.id = x.source_verse_id
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b    ON b.id = c.book_id
 WHERE b.slug = 'luke'
   AND x.source = 'manual'
   AND x.note LIKE 'thread:%';

DROP TABLE _s187_s185_cross_reference_ids;
DROP TABLE _s187_s185_thread_ids;

COMMIT;

\echo ''
\echo 'S187 refresh clear complete. S184 right-hand-face-east cluster preserved.'
\echo ''
\echo 'Next step: re-apply the S185 migration with the corrected prose:'
\echo '  psql "$DATABASE_URL" -f data-schema/migrations/session185_luke_xref_members_and_threads.sql'
\echo ''
\echo 'After re-apply, INSERT counts should be NON-zero (1 per thread, 1 per member).'
\echo 'Then re-run _scratch/_session187_diagnose_luke.sql to confirm all sentinels FIXED + PRESENT.'
