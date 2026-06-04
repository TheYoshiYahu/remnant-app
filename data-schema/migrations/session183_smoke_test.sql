-- =====================================================================
-- Session 183 SMOKE TEST — verify the mark migration landed clean
-- =====================================================================
-- Run AFTER applying:
--   session183_mark_xref_members_and_threads.sql
--
-- Expected results inline. If any check returns the wrong count, the
-- migration should be re-investigated (most likely cause: a verse
-- reference in a member row that does not exist in the canon edition,
-- which the JOIN silently drops).
--
-- Usage: psql "$DATABASE_URL" -f data-schema/migrations/session183_smoke_test.sql
-- =====================================================================

\echo '--- S183 smoke test ---'

\echo ''
\echo 'CHECK 1 — S183 new thread count (expected: 15 — 17 proposed minus B.3 dropped minus A.2 rejected/rerouted)'
SELECT COUNT(*) AS s183_thread_count
  FROM cross_reference_threads
 WHERE sort_order BETWEEN 1201 AND 1216;

\echo ''
\echo 'CHECK 2 — Threads anchored to mark (expected: 15 — all S183 NEW threads anchor in Mark)'
SELECT b.slug AS anchor_book, COUNT(*) AS thread_count
  FROM cross_reference_threads t
  JOIN verses v ON v.id = t.anchor_verse_id_start
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b ON b.id = c.book_id
 WHERE t.sort_order BETWEEN 1201 AND 1216
 GROUP BY b.slug
 ORDER BY thread_count DESC, b.slug;

\echo ''
\echo 'CHECK 3 — Total S183 NEW-thread member rows (expected: 76 across the 15 NEW threads)'
SELECT COUNT(*) AS s183_new_thread_member_count
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
 WHERE t.sort_order BETWEEN 1201 AND 1216;

\echo ''
\echo 'CHECK 3b — Total S183 mark-source cross_references landed (expected: NEW + reroute + bulk = ~330; the JOIN silently drops any target verses that do not resolve in canon edition)'
SELECT COUNT(DISTINCT x.id) AS s183_mark_source_xref_count
  FROM cross_references x
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN editions e ON e.id = sb.edition_id
 WHERE e.slug = 'canon'
   AND sb.slug = 'mark'
   AND x.source = 'manual'
   AND x.note LIKE 'thread:%';

\echo ''
\echo 'CHECK 4 — Members per S183 NEW thread (any with 0 members indicates a verse-resolution failure)'
SELECT t.slug,
       (SELECT COUNT(*) FROM cross_reference_thread_members m WHERE m.thread_id = t.id) AS member_count
  FROM cross_reference_threads t
 WHERE t.sort_order BETWEEN 1201 AND 1216
 ORDER BY member_count, t.slug;

\echo ''
\echo 'CHECK 5 — Decision-2 thread (tehillim-110-1-davids-lord-formed-at-the-right-hand) integrity check'
SELECT t.slug, t.title,
       LENGTH(t.summary_md) AS summary_chars,
       (SELECT COUNT(*) FROM cross_reference_thread_members m WHERE m.thread_id = t.id) AS members
  FROM cross_reference_threads t
 WHERE t.slug = 'tehillim-110-1-davids-lord-formed-at-the-right-hand';

\echo ''
\echo 'CHECK 6 — Decision-1 verification: B.2 talitha-cumi and B.4 ephphatha stand alone (B.3 dropped — meta-thread should NOT exist)'
SELECT t.slug,
       (SELECT COUNT(*) FROM cross_reference_thread_members m WHERE m.thread_id = t.id) AS members
  FROM cross_reference_threads t
 WHERE t.slug IN ('talitha-cumi-and-the-twelve-year-resurrection-of-the-daughter-of-the-house',
                  'ephphatha-be-opened-the-deaf-hearing-and-the-dumb-speaking-as-messianic-credential',
                  'aramaic-preserved-words-of-the-king-talitha-cumi-and-ephphatha')
 ORDER BY t.slug;

\echo ''
\echo 'CHECK 7 — A.2 reroute: Mark 3:23 and 3:27 members attached to existing binding-of-the-watchers thread (expected: 2 mark-anchored members)'
SELECT t.slug, sv.verse_number AS mark_verse, m.sort_order, LENGTH(m.member_note) AS note_len
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
 WHERE t.slug = 'binding-of-the-watchers-typological-anchor-for-binding-the-strong-man'
   AND sb.slug = 'mark'
   AND sc.chapter_number = 3
 ORDER BY sv.verse_number;

\echo ''
\echo 'CHECK 8 — Sacred-name discipline: no Hebrew book names in S183 member notes (Bereshit/Shemot/Vayikra/Tehillim etc. as standalone tokens)'
SELECT COUNT(*) AS hebrew_book_name_violations
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
 WHERE t.sort_order BETWEEN 1201 AND 1216
   AND (m.member_note LIKE '%Devarim %'
        OR m.member_note LIKE '%Mishlei %'
        OR m.member_note LIKE '%Tehillim %'
        OR m.member_note LIKE '%Yeshayahu %'
        OR m.member_note LIKE '%Yirmeyahu %'
        OR m.member_note LIKE '%Yechezk%'
        OR m.member_note LIKE '%Bereshit %'
        OR m.member_note LIKE '%Mattityahu%'
        OR m.member_note LIKE '%Hitgalut%'
        OR m.member_note LIKE '%Sh''mot %');

\echo ''
\echo 'CHECK 9 — Sample anchor-verse resolution: Mark 12:36 (Decision-2 anchor for tehillim-110-1 thread)'
SELECT t.slug, sv.book_slug, sv.chapter_number, sv.verse_number AS anchor_start
  FROM cross_reference_threads t
  JOIN (SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
          FROM verses v JOIN chapters c ON v.chapter_id = c.id
          JOIN books b ON c.book_id = b.id
          JOIN editions e ON b.edition_id = e.id WHERE e.slug = 'canon') sv
    ON sv.verse_id = t.anchor_verse_id_start
 WHERE t.slug = 'tehillim-110-1-davids-lord-formed-at-the-right-hand';

\echo ''
\echo 'CHECK 10 — End-to-end API path for Mark chapter 13 (Olivet Discourse — abomination, no-man-knoweth threads)'
\echo '         (this simulates what the GET /api/chapters/mark/13/cross-references endpoint returns)'
SELECT t.slug, COUNT(m.cross_reference_id) AS members_in_chapter
  FROM cross_reference_threads t
  JOIN cross_reference_thread_members m ON m.thread_id = t.id
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN editions e ON e.id = sb.edition_id
 WHERE e.slug = 'canon'
   AND sb.slug = 'mark'
   AND sc.chapter_number = 13
 GROUP BY t.slug
 ORDER BY t.slug;

\echo ''
\echo '--- S183 smoke test complete ---'
