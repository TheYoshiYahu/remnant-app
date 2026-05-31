-- =====================================================================
-- Session 181 SMOKE TEST — verify the four book migrations landed clean
-- =====================================================================
-- Run AFTER applying:
--   session181_john_xref_threads.sql
--   session181_romans_xref_threads.sql
--   session181_galatians_xref_threads.sql
--   session181_revelation_xref_threads.sql
--
-- Expected results inline. If any check returns the wrong count, the
-- corresponding migration should be re-investigated (most likely cause:
-- a verse reference in a member row that does not exist in the canon
-- edition, which the JOIN silently drops).
--
-- Usage: psql "$DATABASE_URL" -f data-schema/migrations/session181_smoke_test.sql
-- =====================================================================

\echo '--- S181 smoke test ---'

\echo ''
\echo 'CHECK 1 — Four-book thread count (expected: 61 = 16 john + 16 romans + 12 galatians + 17 revelation)'
SELECT COUNT(*) AS s181_thread_count
  FROM cross_reference_threads
 WHERE sort_order BETWEEN 1001 AND 1100;

\echo ''
\echo 'CHECK 2 — Threads per book (expected: john=16, romans=16, galatians=12, revelation=17)'
SELECT b.slug AS anchor_book, COUNT(*) AS thread_count
  FROM cross_reference_threads t
  JOIN verses v ON v.id = t.anchor_verse_id_start
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b ON b.id = c.book_id
 WHERE t.sort_order BETWEEN 1001 AND 1100
 GROUP BY b.slug
 ORDER BY thread_count DESC, b.slug;

\echo ''
\echo 'CHECK 3 — Total S181 member rows landed (expected ~638 = 640 - 2 extras skipped)'
SELECT COUNT(*) AS s181_member_count
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
 WHERE t.sort_order BETWEEN 1001 AND 1100;

\echo ''
\echo 'CHECK 4 — Members per thread (any with 0 members indicates a verse-resolution failure)'
SELECT t.slug,
       (SELECT COUNT(*) FROM cross_reference_thread_members m WHERE m.thread_id = t.id) AS member_count
  FROM cross_reference_threads t
 WHERE t.sort_order BETWEEN 1001 AND 1100
 ORDER BY member_count, t.slug;

\echo ''
\echo 'CHECK 5 — Sample John thread integrity check (other-sheep-and-the-lost-house-of-yashar-el)'
SELECT t.slug, t.title,
       LENGTH(t.summary_md) AS summary_chars,
       (SELECT COUNT(*) FROM cross_reference_thread_members m WHERE m.thread_id = t.id) AS members
  FROM cross_reference_threads t
 WHERE t.slug = 'other-sheep-and-the-lost-house-of-yashar-el';

\echo ''
\echo 'CHECK 6 — New John thread (born-not-of-blood) exists and has its members'
SELECT t.slug, t.title,
       (SELECT COUNT(*) FROM cross_reference_thread_members m WHERE m.thread_id = t.id) AS members
  FROM cross_reference_threads t
 WHERE t.slug IN ('born-not-of-blood-flesh-credentialing-refused',
                  'son-of-adam-as-judge-and-ladder');

\echo ''
\echo 'CHECK 7 — Romans 11 thread carries the closing-scripture-verse member (Romans 11:26 -> Isaiah 59:20)'
SELECT t.slug, m.sort_order, m.member_note
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE t.slug = 'natural-branches-asleep-grafted-again'
   AND sb.slug = 'romans' AND sc.chapter_number = 11 AND sv.verse_number = 26
   AND tb.slug = 'isaiah' AND tc.chapter_number = 59 AND tv.verse_number = 20;

\echo ''
\echo 'CHECK 8 — Revelation harlot-Babylon thread carries the come-out call'
SELECT t.slug, COUNT(m.cross_reference_id) AS member_count,
       LENGTH(t.summary_md) AS summary_chars,
       (SELECT LENGTH(SUBSTRING(t.summary_md FROM '1 John 2:3-4'))) AS has_1john_diagnostic
  FROM cross_reference_threads t
  LEFT JOIN cross_reference_thread_members m ON m.thread_id = t.id
 WHERE t.slug = 'harlot-babylon-and-come-out-of-her'
 GROUP BY t.slug, t.summary_md;

\echo ''
\echo 'CHECK 9 — Galatians book-name rule pass (no Hebrew book names in member notes)'
SELECT COUNT(*) AS hebrew_book_name_violations
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
 WHERE t.sort_order BETWEEN 1001 AND 1100
   AND (m.member_note LIKE '%Devarim%'
        OR m.member_note LIKE '%Vayikra%'
        OR m.member_note LIKE '%Yeshayahu%'
        OR m.member_note LIKE '%Yirmeyahu%'
        OR m.member_note LIKE '%Yechezk%'
        OR m.member_note LIKE '%Sh''mot%'
        OR m.member_note LIKE '%Habaqquq%'
        OR m.member_note LIKE '%Bereshit%'
        OR m.member_note LIKE '%Hitgalut%');

\echo ''
\echo 'CHECK 10 — End-to-end API path for John chapter 10 (the other-sheep / hearing-reveals chapters)'
\echo '         (this simulates what the GET /api/chapters/john/10/cross-references endpoint returns)'
SELECT t.slug, COUNT(m.cross_reference_id) AS members_in_chapter
  FROM cross_reference_threads t
  JOIN cross_reference_thread_members m ON m.thread_id = t.id
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN editions e ON e.id = sb.edition_id
 WHERE e.slug = 'canon'
   AND sb.slug = 'john'
   AND sc.chapter_number = 10
 GROUP BY t.slug
 ORDER BY t.slug;

\echo ''
\echo '--- S181 smoke test complete ---'
