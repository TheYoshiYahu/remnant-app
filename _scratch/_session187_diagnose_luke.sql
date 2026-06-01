-- S187 — diagnose Luke migration state in DB
-- Read-only. Run: psql "$DATABASE_URL" -f _scratch/_session187_diagnose_luke.sql
-- =====================================================================

\echo '=== 1. Are S185 Luke threads present? (expect 35 if migration applied) ==='
SELECT count(*) AS luke_new_threads
  FROM cross_reference_threads
 WHERE sort_order BETWEEN 1216 AND 1250;

\echo ''
\echo '=== 2. Are Luke source-anchored cross_references present? (expect ~467 if applied + bulk-attach) ==='
SELECT count(*) AS luke_source_manual_xrefs
  FROM cross_references x
  JOIN verses v   ON v.id = x.source_verse_id
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b    ON b.id = c.book_id
 WHERE b.slug = 'luke'
   AND x.source = 'manual';

\echo ''
\echo '=== 3. Does the DB carry the S187 FRAMEWORK-MAJOR prose, or the pre-S186 condensed prose? ==='
\echo '   Sentinel A: rich-man-Lazaros NEW 21 — divergence-report fix names dual-error explicitly.'
\echo '   Sentinel B: pharisee-publican NEW 25 — divergence-report fix carries four-costumes Red Line.'
\echo '   Sentinel C: lost-coin NEW 19 — divergence-report fix carries Red Line discipline framing.'
\echo ''

SELECT
  slug,
  (CASE
     WHEN summary_md LIKE '%inherited soul-sleep doctrine and inherited eternal-conscious-torment doctrine BOTH misread%'
       THEN 'FIXED (S187 prose)'
     ELSE 'OLD (pre-S186 condensed)'
   END) AS rich_man_lazaros_state
  FROM cross_reference_threads
 WHERE slug = 'rich-man-and-lazaros-the-framework-honest-sheol-with-two-compartments-and-the-mosheh-and-the-prophets-test';

SELECT
  slug,
  (CASE
     WHEN summary_md LIKE '%Four costumes, one antichrist gospel%' THEN 'FIXED (S187 prose)'
     ELSE 'OLD (pre-S186 condensed)'
   END) AS pharisee_publican_state
  FROM cross_reference_threads
 WHERE slug = 'pharisee-and-publican-the-flesh-credential-vs-mercy-contrast-and-the-judaizer-architecture-in-parable-form';

SELECT
  slug,
  (CASE
     WHEN summary_md LIKE '%coin is not made-a-coin by the finding; the coin only becomes-findable by the seeking%'
       THEN 'FIXED (S187 prose)'
     ELSE 'OLD (pre-S186 condensed)'
   END) AS lost_coin_state
  FROM cross_reference_threads
 WHERE slug = 'lost-coin-the-recovery-of-what-was-always-the-kings-image-bearing-property';

\echo ''
\echo '=== 4. Are the divergence-report-restored member rows actually in the DB? ==='
\echo '   Each row is a sentinel target verse the S186 divergence report said had been dropped.'
\echo ''

-- NEW 17 great supper → Luke 14:23 → Romans 11:25
SELECT 'NEW 17 great-supper Luke 14:23→romans 11:25' AS sentinel,
       (CASE WHEN count(*) > 0 THEN 'PRESENT' ELSE 'MISSING' END) AS state
  FROM cross_references x
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE sb.slug = 'luke' AND sc.chapter_number = 14 AND sv.verse_number = 23
   AND tb.slug = 'romans' AND tc.chapter_number = 11 AND tv.verse_number = 25
   AND x.source = 'manual';

-- NEW 19 lost coin → Luke 15:9 → Hosea 1:10
SELECT 'NEW 19 lost-coin Luke 15:9→hosea 1:10' AS sentinel,
       (CASE WHEN count(*) > 0 THEN 'PRESENT' ELSE 'MISSING' END) AS state
  FROM cross_references x
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE sb.slug = 'luke' AND sc.chapter_number = 15 AND sv.verse_number = 9
   AND tb.slug = 'hosea' AND tc.chapter_number = 1 AND tv.verse_number = 10
   AND x.source = 'manual';

-- NEW 20 prodigal → Luke 15:12 → Jeremiah 31:18
SELECT 'NEW 20 prodigal Luke 15:12→jeremiah 31:18' AS sentinel,
       (CASE WHEN count(*) > 0 THEN 'PRESENT' ELSE 'MISSING' END) AS state
  FROM cross_references x
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE sb.slug = 'luke' AND sc.chapter_number = 15 AND sv.verse_number = 12
   AND tb.slug = 'jeremiah' AND tc.chapter_number = 31 AND tv.verse_number = 18
   AND x.source = 'manual';

-- NEW 21 rich man → Luke 16:23 → Ezekiel 32:21
SELECT 'NEW 21 rich-man Luke 16:23→ezekiel 32:21' AS sentinel,
       (CASE WHEN count(*) > 0 THEN 'PRESENT' ELSE 'MISSING' END) AS state
  FROM cross_references x
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE sb.slug = 'luke' AND sc.chapter_number = 16 AND sv.verse_number = 23
   AND tb.slug = 'ezekiel' AND tc.chapter_number = 32 AND tv.verse_number = 21
   AND x.source = 'manual';

-- NEW 25 Pharisee → Luke 18:11 → Acts 15:1
SELECT 'NEW 25 pharisee Luke 18:11→acts 15:1' AS sentinel,
       (CASE WHEN count(*) > 0 THEN 'PRESENT' ELSE 'MISSING' END) AS state
  FROM cross_references x
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE sb.slug = 'luke' AND sc.chapter_number = 18 AND sv.verse_number = 11
   AND tb.slug = 'acts' AND tc.chapter_number = 15 AND tv.verse_number = 1
   AND x.source = 'manual';

\echo ''
\echo '=== Interpretation ==='
\echo '  If thread count = 35 and all sentinels show FIXED + PRESENT → DB is CURRENT. No action needed.'
\echo '  If thread count = 35 but sentinels show OLD or MISSING → DB has pre-divergence-fix prose.'
\echo '       Action: run _scratch/_session187_refresh_luke_s185.sql to clear + re-apply.'
\echo '  If thread count = 0 → migration did not actually apply (lookup view returned 0 rows).'
\echo '       Action: check edition slug = ''canon'' and book slug = ''luke'' exist in books table.'
