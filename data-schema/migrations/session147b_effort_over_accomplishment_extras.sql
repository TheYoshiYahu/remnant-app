-- =====================================================================
-- Session 147b migration — 2026-05-27
-- =====================================================================
-- Extension to session147_effort_over_accomplishment_thread.sql —
-- adds the Apocrypha and Pseudepigrapha pairs that should have landed
-- in the original session147 migration. The defer was Claude's call,
-- not Yoshi's, and is corrected here. The voice skill is explicit:
-- the cross-reference apparatus is "all-of-the-library ↔ all-of-the-
-- library" across every scripture-level text the framework restores.
-- The Reformation cut these books precisely because they carry the
-- effort-over-accomplishment architecture with the heaviest weight.
-- Restoring them to the chapter-end-card thread is the framework's
-- core move, not an optional V2 nicety.
--
-- Editions confirmed live in the seed.py and the parsed JSON:
--   - 'apocrypha' edition: 2-esdras, the-wisdom-of-solomon,
--     ecclesiasticus (Sirach), the-prayer-of-manasseh,
--     baruch-with-the-letter-of-jeremiah, tobit, judith, 1-esdras,
--     the-song-of-the-three-holy-children, 1-maccabees, 2-maccabees,
--     bel-and-the-dragon, the-history-of-susanna, the-rest-of-esther
--   - 'enoch' edition: 1-enoch
--   - 'jubilees' edition: jubilees
--   - 'pseudepigrapha-charles-vol2' edition: 2-baruch, 3-baruch,
--     adam-eve, and others
--
-- This migration adds 11 additional pairs to the
-- effort-over-accomplishment thread, all anchored on the canonical
-- pillars from session147 but extending the witnesses into the cut
-- books. The reader meets the same architecture whether they open
-- canon Romans 3, apocryphal 2 Esdras 7, pseudepigraphic 2 Baruch
-- 54, or the Book of Enoch — one voice across the whole library.
--
-- The thread row already exists from session147; this migration only
-- INSERTs additional cross_references rows and links them to the
-- existing thread via cross_reference_thread_members. Idempotent via
-- ON CONFLICT DO NOTHING throughout.
--
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session147b_effort_over_accomplishment_extras.sql
-- =====================================================================

\echo 'Session 147b migration starting — apocrypha/pseudepigrapha pairs...'

BEGIN;

-- ---------------------------------------------------------------------
-- Cross-edition verse lookup. Spans canon + the four extras editions
-- this migration needs.
-- ---------------------------------------------------------------------
CREATE TEMP VIEW _s147b_verse_lookup AS
SELECT
    e.slug          AS edition_slug,
    b.slug          AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id            AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books b    ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon', 'apocrypha', 'enoch', 'jubilees', 'pseudepigrapha-charles-vol2')
   AND b.slug IN (
       -- canon books referenced as targets
       'romans','ezekiel','daniel','isaiah','genesis',
       -- apocrypha
       '2-esdras','the-wisdom-of-solomon','ecclesiasticus',
       'the-prayer-of-manasseh','baruch-with-the-letter-of-jeremiah',
       -- pseudepigrapha
       '1-enoch','jubilees','2-baruch'
   );

-- ---------------------------------------------------------------------
-- Additional cross-reference pairs for the effort-over-accomplishment
-- thread — Apocrypha + Pseudepigrapha extension.
-- ---------------------------------------------------------------------
WITH new_xrefs(
    source_edition, source_book, source_chap, source_v,
    target_edition, target_book, target_chap, target_v,
    sort_order, member_note
) AS (
    VALUES
        -- Universal verdict — the leveling, pre-Paul witnesses
        ('apocrypha', '2-esdras',                              7, 46,
         'canon',     'romans',                                3, 10,
         101, 'Who is there alive that hath not sinned — the leveling baseline before Paul'),

        ('apocrypha', '2-esdras',                              8, 35,
         'canon',     'romans',                                3, 23,
         102, 'No man... but he hath dealt wickedly — the universal verdict pre-Paul'),

        ('apocrypha', 'the-wisdom-of-solomon',                13,  8,
         'canon',     'romans',                                1, 20,
         103, 'Howbeit neither are they to be pardoned — the Romans 1 argument before Romans 1'),

        ('apocrypha', 'the-wisdom-of-solomon',                13,  9,
         'canon',     'romans',                                1, 20,
         104, 'How did they not sooner find out Yahuah (the Lord) — without-excuse, source argument'),

        ('apocrypha', 'ecclesiasticus',                        8,  5,
         'canon',     'romans',                                3, 23,
         105, 'We are all worthy of punishment — the universal verdict in wisdom register'),

        -- Hanging-head pillar — the return-prayer pattern in the cut books
        ('apocrypha', 'the-prayer-of-manasseh',                1, 11,
         'canon',     'ezekiel',                              36, 31,
         106, 'I have sinned, I acknowledge mine iniquities — the model return-prayer matches the new heart''s loathing'),

        ('apocrypha', 'the-prayer-of-manasseh',                1, 12,
         'canon',     'daniel',                                9,  5,
         107, 'Forgive me, I humbly beseech thee — Manasseh''s confession in Daniel-style posture'),

        ('apocrypha', 'baruch-with-the-letter-of-jeremiah',    1, 15,
         'canon',     'daniel',                                9,  7,
         108, 'Righteousness belongeth unto thee, but unto us confusion of faces — Baruch echoes Daniel verbatim'),

        -- Effort-over-accomplishment pillar — the personal accountability
        ('pseudepigrapha-charles-vol2', '2-baruch',           54, 19,
         'canon',                       'romans',              5, 12,
         109, 'Each of us has been the Adam of his own soul — personal accountability pre-Paul'),

        ('pseudepigrapha-charles-vol2', '2-baruch',           48, 42,
         'apocrypha',                   '2-esdras',            7, 48,
         110, 'O Adam, what hast thou done — 2 Baruch and 4 Ezra carry the same Adam-lament together'),

        -- The end declared from the beginning — the gathering completes in the cut books
        ('enoch',    '1-enoch',                              10, 17,
         'canon',    'isaiah',                                46, 10,
         111, 'All the righteous escape and live — the gathering completing; Enoch witnesses the end declared from the beginning'),

        ('jubilees', 'jubilees',                              23, 26,
         'canon',    'ezekiel',                               36, 26,
         112, 'The children begin to study the laws and return — Jubilees names the new-heart restoration in latter-days register')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    sv.verse_id,
    tv.verse_id,
    'manual',
    'thread:effort-over-accomplishment | ' || nx.member_note,
    'free'::content_tier
  FROM new_xrefs nx
  JOIN _s147b_verse_lookup sv
    ON sv.edition_slug = nx.source_edition
   AND sv.book_slug = nx.source_book
   AND sv.chapter_number = nx.source_chap
   AND sv.verse_number = nx.source_v
  JOIN _s147b_verse_lookup tv
    ON tv.edition_slug = nx.target_edition
   AND tv.book_slug = nx.target_book
   AND tv.chapter_number = nx.target_chap
   AND tv.verse_number = nx.target_v
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link the new cross-reference rows to the existing thread.
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    -- Continue numbering after the canon set (canon set ended at 48).
    -- The 100-offset keeps extras members after canon members in the
    -- card render order. books.canonical_order encodes cross-edition
    -- ordering on its own (canon 1-66, extras start at 100), so no
    -- editions-table column is needed in the ORDER BY.
    100 + ROW_NUMBER() OVER (
        ORDER BY
            sb.canonical_order, sc.chapter_number, sv.verse_number,
            tb.canonical_order, tc.chapter_number, tv.verse_number
    ) AS sort_order,
    SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'effort-over-accomplishment'
  JOIN verses sv     ON sv.id = x.source_verse_id
  JOIN chapters sc   ON sc.id = sv.chapter_id
  JOIN books sb      ON sb.id = sc.book_id
  JOIN editions se   ON se.id = sb.edition_id
  JOIN verses tv     ON tv.id = x.target_verse_id
  JOIN chapters tc   ON tc.id = tv.chapter_id
  JOIN books tb      ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:effort-over-accomplishment | %'
   AND se.slug <> 'canon'  -- only new (non-canon-source) members get linked here
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Sanity check — report the count of members landed.
-- ---------------------------------------------------------------------
DO $$
DECLARE
    member_count INT;
    canon_count INT;
    extras_count INT;
BEGIN
    SELECT COUNT(*) INTO member_count
      FROM cross_reference_thread_members m
      JOIN cross_reference_threads t ON t.id = m.thread_id
     WHERE t.slug = 'effort-over-accomplishment';

    SELECT COUNT(*) INTO canon_count
      FROM cross_reference_thread_members m
      JOIN cross_reference_threads t ON t.id = m.thread_id
      JOIN cross_references x ON x.id = m.cross_reference_id
      JOIN verses sv ON sv.id = x.source_verse_id
      JOIN chapters sc ON sc.id = sv.chapter_id
      JOIN books sb ON sb.id = sc.book_id
      JOIN editions se ON se.id = sb.edition_id
     WHERE t.slug = 'effort-over-accomplishment'
       AND se.slug = 'canon';

    extras_count := member_count - canon_count;

    RAISE NOTICE 'effort-over-accomplishment thread now has % members total (% canon, % extras).',
        member_count, canon_count, extras_count;
END $$;

COMMIT;

\echo 'Session 147b migration complete.'
