-- =====================================================================
-- Session 184 SMOKE TEST — verify the right-hand / face-of / east cluster landed clean
-- =====================================================================
-- Run AFTER applying:
--   session184_right_hand_face_east_xref_threads.sql
--
-- Expected results inline. If any check returns the wrong count, the
-- migration should be re-investigated (most likely cause: a verse
-- reference in a member row that does not exist in the canon edition,
-- which the JOIN silently drops).
--
-- Usage: psql "$DATABASE_URL" -f data-schema/migrations/session184_smoke_test.sql
-- =====================================================================

\echo '--- S184 smoke test ---'

\echo ''
\echo 'CHECK 1 — S184 NEW thread count (expected: 5 at sort_order 1217-1221)'
SELECT COUNT(*) AS s184_thread_count
  FROM cross_reference_threads
 WHERE sort_order BETWEEN 1217 AND 1221;

\echo ''
\echo 'CHECK 2 — Per-thread member count for the 5 NEW threads (catches zero-member threads)'
\echo '          Expected (anchors recorded on thread record, not duplicated as self-ref members):'
\echo '            Thread 1 (right-hand acting): 23 members'
\echo '            Thread 2 (Formed own right hand): 18 members'
\echo '            Thread 3 (face of Yahuah): 31 members'
\echo '            Thread 4 (east as glory-direction): 33 members'
\echo '            Thread 5 (counterfeit register): 5 members'
\echo '          Particularly want to confirm Thread 5 (counterfeit, only 5 members) does not drop to zero.'
SELECT t.sort_order, t.slug,
       (SELECT COUNT(*) FROM cross_reference_thread_members m WHERE m.thread_id = t.id) AS member_count
  FROM cross_reference_threads t
 WHERE t.sort_order BETWEEN 1217 AND 1221
 ORDER BY t.sort_order;

\echo ''
\echo 'CHECK 3 — Total S184 NEW-thread member row count (expected: 110 across the 5 new threads)'
SELECT COUNT(*) AS s184_new_member_count
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
 WHERE t.sort_order BETWEEN 1217 AND 1221;

\echo ''
\echo 'CHECK 4 — Thread 1 anchor verification (Exodus 15:6 anchor)'
SELECT t.slug, b.slug AS anchor_book, c.chapter_number, v.verse_number
  FROM cross_reference_threads t
  JOIN verses v ON v.id = t.anchor_verse_id_start
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b ON b.id = c.book_id
 WHERE t.sort_order = 1217;

\echo ''
\echo 'CHECK 5 — Thread 3 anchor verification (Genesis 32:30 anchor)'
SELECT t.slug, b.slug AS anchor_book, c.chapter_number, v.verse_number
  FROM cross_reference_threads t
  JOIN verses v ON v.id = t.anchor_verse_id_start
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b ON b.id = c.book_id
 WHERE t.sort_order = 1219;

\echo ''
\echo 'CHECK 6 — Range-anchor verification for Thread 2 (Acts 7:55-56) and Thread 4 (Ezekiel 43:1-4)'
SELECT t.sort_order, t.slug,
       sb.slug AS start_book, sc.chapter_number AS start_ch, sv.verse_number AS start_v,
       eb.slug AS end_book,   ec.chapter_number AS end_ch,   ev.verse_number AS end_v
  FROM cross_reference_threads t
  JOIN verses sv ON sv.id = t.anchor_verse_id_start
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses ev ON ev.id = t.anchor_verse_id_end
  JOIN chapters ec ON ec.id = ev.chapter_id
  JOIN books eb ON eb.id = ec.book_id
 WHERE t.sort_order IN (1218, 1220)
 ORDER BY t.sort_order;

\echo ''
\echo 'CHECK 7 — Existing-thread attachments to tehillim-110-1-davids-lord-formed-at-the-right-hand'
\echo '         (expected 6 rows added: Heb 8:1, Heb 10:12, Eph 1:20, Col 3:1, Rom 8:34, Ps 110:5)'
SELECT tb.slug AS target_book, tc.chapter_number AS target_ch, tv.verse_number AS target_v
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE t.slug = 'tehillim-110-1-davids-lord-formed-at-the-right-hand'
   AND sb.slug = 'psalms' AND sc.chapter_number = 110 AND sv.verse_number = 1
   AND (   (tb.slug = 'hebrews'     AND tc.chapter_number = 8  AND tv.verse_number = 1)
        OR (tb.slug = 'hebrews'     AND tc.chapter_number = 10 AND tv.verse_number = 12)
        OR (tb.slug = 'ephesians'   AND tc.chapter_number = 1  AND tv.verse_number = 20)
        OR (tb.slug = 'colossians'  AND tc.chapter_number = 3  AND tv.verse_number = 1)
        OR (tb.slug = 'romans'      AND tc.chapter_number = 8  AND tv.verse_number = 34)
        OR (tb.slug = 'psalms'      AND tc.chapter_number = 110 AND tv.verse_number = 5)
       )
 ORDER BY tb.slug, tc.chapter_number, tv.verse_number;

\echo ''
\echo 'CHECK 8 — Count of the 6 expected Tehillim 110 attachments (expected: 6)'
SELECT COUNT(*) AS tehillim_110_attachment_count
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE t.slug = 'tehillim-110-1-davids-lord-formed-at-the-right-hand'
   AND sb.slug = 'psalms' AND sc.chapter_number = 110 AND sv.verse_number = 1
   AND (   (tb.slug = 'hebrews'     AND tc.chapter_number = 8  AND tv.verse_number = 1)
        OR (tb.slug = 'hebrews'     AND tc.chapter_number = 10 AND tv.verse_number = 12)
        OR (tb.slug = 'ephesians'   AND tc.chapter_number = 1  AND tv.verse_number = 20)
        OR (tb.slug = 'colossians'  AND tc.chapter_number = 3  AND tv.verse_number = 1)
        OR (tb.slug = 'romans'      AND tc.chapter_number = 8  AND tv.verse_number = 34)
        OR (tb.slug = 'psalms'      AND tc.chapter_number = 110 AND tv.verse_number = 5)
       );

\echo ''
\echo 'CHECK 9 — Sanhedrin-trial attachments verification (Mark 14:62 + Luke 22:69 added)'
SELECT tb.slug AS target_book, tc.chapter_number AS target_ch, tv.verse_number AS target_v
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE t.slug = 'sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth'
   AND sb.slug = 'matthew' AND sc.chapter_number = 26 AND sv.verse_number = 64
   AND (   (tb.slug = 'mark' AND tc.chapter_number = 14 AND tv.verse_number = 62)
        OR (tb.slug = 'luke' AND tc.chapter_number = 22 AND tv.verse_number = 69)
       )
 ORDER BY tb.slug;

\echo ''
\echo 'CHECK 10 — All-existing-thread attachment-row count (expected: 17 rows landed across the 6 attached threads:'
\echo '          Tehillim 110 spine: 6, Sanhedrin trial: 2, Gather-tribes: 3, Like-son-of-adam-clouds: 1,'
\echo '          Four-winds-gathering: 3, Walking-on-sea: 2. The elect-one-at-right-hand''s 1 Enoch 55 row is'
\echo '          extras-only and resolves to 0 in the canon edition; framework-only, intentionally skipped.)'
SELECT COUNT(*) AS s184_attachment_row_count
  FROM cross_references x
 WHERE x.note LIKE 'thread:tehillim-110-1-davids-lord-formed-at-the-right-hand | %'
    OR x.note LIKE 'thread:sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth | %'
    OR x.note LIKE 'thread:gather-all-the-tribes-of-jacob-in-sirach-and-enoch | %'
    OR x.note LIKE 'thread:like-the-son-of-adam-coming-with-the-clouds | %'
    OR x.note LIKE 'thread:the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables | %'
    OR x.note LIKE 'thread:walking-on-the-sea-formed-cloud-rider | %';

\echo ''
\echo 'CHECK 11 — Sacred-name discipline: no Hebrew book names in S184 member notes'
\echo '          (expected: 0 violations — book names in notes stay English)'
SELECT COUNT(*) AS hebrew_book_name_violations
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
 WHERE t.sort_order BETWEEN 1217 AND 1221
   AND (m.member_note LIKE '%Devarim%'
        OR m.member_note LIKE '%Vayikra%'
        OR m.member_note LIKE '%Yeshayahu%'
        OR m.member_note LIKE '%Yirmeyahu%'
        OR m.member_note LIKE '%Yechezk%'
        OR m.member_note LIKE '%Sh''mot%'
        OR m.member_note LIKE '%Habaqquq%'
        OR m.member_note LIKE '%Bereshit%'
        OR m.member_note LIKE '%Hitgalut%'
        OR m.member_note LIKE '%Bemidbar%');

\echo ''
\echo 'CHECK 12 — Acts 7:55-56 sacred-name discipline: both *theos* occurrences render as *Elohim (God)*'
\echo '          (per S182 NT-Lord rule; Yahuah must NOT appear in the Acts 7:55-56 member notes)'
SELECT m.sort_order, m.member_note
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE t.slug = 'the-formed-acting-with-his-own-right-hand-stephen-vision-and-the-seven-stars-and-the-book-of-the-throne'
   AND tb.slug = 'acts' AND tc.chapter_number = 7 AND tv.verse_number IN (55, 56)
 ORDER BY tv.verse_number;

\echo ''
\echo 'CHECK 13 — Total cluster member row count across new + attachments (expected: 127 = 110 new + 17 attachments)'
SELECT
  ( SELECT COUNT(*)
      FROM cross_reference_thread_members m
      JOIN cross_reference_threads t ON t.id = m.thread_id
     WHERE t.sort_order BETWEEN 1217 AND 1221
  ) +
  ( SELECT COUNT(*)
      FROM cross_reference_thread_members m
      JOIN cross_references x ON x.id = m.cross_reference_id
     WHERE x.note LIKE 'thread:tehillim-110-1-davids-lord-formed-at-the-right-hand | %'
        OR x.note LIKE 'thread:sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth | %'
        OR x.note LIKE 'thread:gather-all-the-tribes-of-jacob-in-sirach-and-enoch | %'
        OR x.note LIKE 'thread:like-the-son-of-adam-coming-with-the-clouds | %'
        OR x.note LIKE 'thread:the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables | %'
        OR x.note LIKE 'thread:walking-on-the-sea-formed-cloud-rider | %'
  ) AS s184_cluster_total_member_count;

\echo ''
\echo '--- S184 smoke test complete ---'
