-- =====================================================================
-- Session 73 migration — 2026-05-17
-- =====================================================================
-- End-of-chapter cross-reference apparatus, free tier.
--
-- Adds the framework-diagnostic thread overlay on top of the existing
-- cross_references table (schema.sql Section 4, Phase 5/6 seat). The
-- comprehensive Treasury-of-Scripture-Knowledge baseline is still queued
-- as a v1.1 deliverable; this migration lands the thread layer and the
-- first thread (post-harvest sifting) so the rendering surface has real
-- content from day one.
--
-- Changes:
--   1. cross_references.tier_required default flipped from
--      'study_notes' to 'free'. The cross-reference apparatus moves
--      into the free tier per Yoshi's Session 73 wheel call; every
--      paid tier inherits via the strict-chain lattice locked Session
--      72. Existing rows (none at land time) are untouched.
--   2. UNIQUE constraint on cross_references (source_verse_id,
--      target_verse_id, source) so future inserts are dedupe-safe.
--      Idempotency via pg_constraint check; safe to re-run.
--   3. New table cross_reference_threads — the curated overlay. Each
--      thread is anchored on a Tanakh passage and groups a set of
--      cross-reference pairs under a framework-diagnostic name.
--   4. New table cross_reference_thread_members — join table from a
--      thread to its member cross-reference rows, with sort_order
--      controlling the order they render under the thread callout.
--   5. Seed: thread 'post-harvest-sifting' with 12 anchor pairs from
--      the gospels back to Ezekiel 20:33-44 and Ezekiel 34:17 (the
--      wilderness of the peoples and the shepherd separation).
--
-- Framework note: the post-harvest sifting thread surfaces a Red Line
-- #11 reading directly into the reader's chapter-end card. The sheep/
-- goats separation, 'depart from me, I never knew you,' and the
-- weeping-and-gnashing passages all trace to Ezekiel 20's wilderness
-- sifting of the gathered house — not to eternal-hell judgment of
-- non-believers. The gospel passages are the post-harvest sorting of
-- the gathered wheat, performed in the wilderness of the peoples.
--
-- Idempotent: re-running is safe. ALTER COLUMN SET DEFAULT, ADD
-- CONSTRAINT IF NOT EXISTS (via DO block), CREATE TABLE IF NOT EXISTS,
-- and ON CONFLICT DO NOTHING on every seed insert. Re-running produces
-- zero side effects after the first apply.
--
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session73_cross_references.sql
-- =====================================================================

\echo 'Session 73 migration starting...'

BEGIN;

-- ---------------------------------------------------------------------
-- 1. Flip cross_references.tier_required default to 'free'.
-- ---------------------------------------------------------------------
ALTER TABLE cross_references
    ALTER COLUMN tier_required SET DEFAULT 'free';

COMMENT ON COLUMN cross_references.tier_required IS
    'Lowest tier that grants access to this cross-reference. Default flipped to free in Session 73 — the chapter-end cross-reference apparatus is a free-tier feature; every paid tier inherits per the strict-chain lattice.';

-- ---------------------------------------------------------------------
-- 2. UNIQUE constraint on (source_verse_id, target_verse_id, source).
--    Idempotent via pg_constraint check (Postgres has no native
--    ADD CONSTRAINT IF NOT EXISTS as of v15).
-- ---------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
         WHERE conname = 'cross_references_source_target_source_uniq'
    ) THEN
        ALTER TABLE cross_references
            ADD CONSTRAINT cross_references_source_target_source_uniq
            UNIQUE (source_verse_id, target_verse_id, source);
    END IF;
END$$;

-- ---------------------------------------------------------------------
-- 3. cross_reference_threads — the curated overlay.
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS cross_reference_threads (
    id                      SERIAL PRIMARY KEY,
    slug                    TEXT NOT NULL UNIQUE,
    title                   TEXT NOT NULL,
    summary_md              TEXT NOT NULL,
    anchor_verse_id_start   BIGINT REFERENCES verses(id) ON DELETE SET NULL,
    anchor_verse_id_end     BIGINT REFERENCES verses(id) ON DELETE SET NULL,
    tier_required           content_tier NOT NULL DEFAULT 'free',
    sort_order              INT NOT NULL DEFAULT 0,
    created_at              TIMESTAMPTZ NOT NULL DEFAULT now()
);

COMMENT ON TABLE cross_reference_threads IS
    'Curated framework-diagnostic threads grouping cross-reference pairs under a named theme (e.g., post-harvest sifting, grace-from-name''s-sake, new-heart). Each thread has a Tanakh anchor passage (verse_id range) and surfaces in the chapter-end card whenever any member cross-reference falls in the rendered chapter.';

COMMENT ON COLUMN cross_reference_threads.anchor_verse_id_start IS
    'First verse of the Tanakh anchor passage. Together with anchor_verse_id_end, defines the seminal passage the thread is built around. Nullable so a thread can be created before its anchor is finalized; rendering treats null anchors as "no preface block".';

CREATE INDEX IF NOT EXISTS idx_xref_threads_slug ON cross_reference_threads(slug);

-- ---------------------------------------------------------------------
-- 4. cross_reference_thread_members — join table.
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS cross_reference_thread_members (
    thread_id           INT NOT NULL REFERENCES cross_reference_threads(id) ON DELETE CASCADE,
    cross_reference_id  BIGINT NOT NULL REFERENCES cross_references(id) ON DELETE CASCADE,
    sort_order          INT NOT NULL DEFAULT 0,
    member_note         TEXT,
    PRIMARY KEY (thread_id, cross_reference_id)
);

COMMENT ON TABLE cross_reference_thread_members IS
    'Join from a thread to its constituent cross-reference pairs. A single cross-reference may belong to multiple threads (the same Tanakh→NT pair often serves more than one framework thread). sort_order controls render order under the thread callout.';

CREATE INDEX IF NOT EXISTS idx_xref_thread_members_thread ON cross_reference_thread_members(thread_id);
CREATE INDEX IF NOT EXISTS idx_xref_thread_members_xref   ON cross_reference_thread_members(cross_reference_id);

-- ---------------------------------------------------------------------
-- 5. Seed: post-harvest sifting thread + 12 anchor cross-references.
-- ---------------------------------------------------------------------

-- 5a. Verse-id lookup helper as a temporary view scoped to this txn.
--     The lookup spans editions.slug='canon' for the books we need.
CREATE TEMP VIEW _s73_verse_lookup AS
SELECT
    b.slug          AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id            AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books b    ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon'
   AND b.slug IN ('ezekiel','matthew','luke');

-- 5b. Insert the thread row. Anchor passage is Ezekiel 20:33-44 — the
--     wilderness of the peoples, where Yahuah (the LORD) gathers the
--     scattered house out of all nations, brings them face to face,
--     causes them to pass under the rod, and purges out the rebels.
INSERT INTO cross_reference_threads (
    slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order
)
SELECT
    'post-harvest-sifting',
    'Post-harvest sifting',
    E'The wilderness of the peoples — Ezekiel 20:33–44 — is the Tanakh source for the sheep-and-goats separation, ''depart from me, I never knew you,'' and the weeping-and-gnashing-of-teeth passages.\n\nYahuah (the LORD) gathers the scattered house out of all nations, brings them face to face in the wilderness, causes them to pass under the rod, and purges out the rebels from among them. The ''depart from me, ye cursed'' of Matthew 25:41 is the ''they shall not enter into the land of Yashar''el (Israel)'' of Ezekiel 20:38. The weeping and gnashing of teeth is the loathing of self in Ezekiel 20:43 — ''ye shall lothe yourselves in your own sight for all your evils that ye have committed.''\n\nThe gospel passages are not eternal-hell prooftexts spoken to unbelievers. They are the post-harvest sifting of the gathered wheat. The sheep are the fruitful within the covenant body; the goats are the unfruitful within the covenant body. ''I never knew you'' is spoken to those who prophesied in his name, cast out devils in his name, did many wonderful works in his name (Matthew 7:22) — not to tares. Names get blotted out in this sifting; no name is added.\n\nAnd the same chapter that names the sifting names the mercy: ''I have wrought with you for my name''s sake, not according to your wicked ways'' (Ezekiel 20:44). The hang-the-head and the name''s-sake grace are the same verse pair.',
    sv.verse_id,
    ev.verse_id,
    'free'::content_tier,
    100
  FROM _s73_verse_lookup sv, _s73_verse_lookup ev
 WHERE sv.book_slug = 'ezekiel' AND sv.chapter_number = 20 AND sv.verse_number = 33
   AND ev.book_slug = 'ezekiel' AND ev.chapter_number = 20 AND ev.verse_number = 44
ON CONFLICT (slug) DO NOTHING;

-- 5c. Insert the 12 cross-reference pairs. Each row carries
--     note = 'thread:post-harvest-sifting' so we can identify these
--     rows on re-run for the thread-membership step.
WITH new_xrefs(source_book, source_chap, source_v, target_book, target_chap, target_v, sort_order, member_note) AS (
    VALUES
        ('matthew', 7,  23, 'ezekiel', 20, 38,  1, 'Depart from me = purge out the rebels (Ezek 20:38)'),
        ('matthew', 7,  23, 'ezekiel', 20, 43,  2, 'I never knew you spoken into the loathe-yourselves moment (Ezek 20:43)'),
        ('matthew', 25, 32, 'ezekiel', 20, 38,  3, 'Separation of sheep and goats = the wilderness purge'),
        ('matthew', 25, 33, 'ezekiel', 34, 17,  4, 'Sheep / goats / shepherd language drawn from Ezekiel 34:17'),
        ('matthew', 25, 41, 'ezekiel', 20, 38,  5, 'Depart, ye cursed = they shall not enter the land of Yashar''el (Israel)'),
        ('matthew', 25, 30, 'ezekiel', 20, 43,  6, 'Weeping and gnashing of teeth = loathing self for evils committed'),
        ('matthew', 8,  12, 'ezekiel', 20, 43,  7, 'Weeping and gnashing of teeth = Ezekiel 20:43'),
        ('matthew', 13, 42, 'ezekiel', 20, 43,  8, 'Wailing and gnashing of teeth = Ezekiel 20:43'),
        ('matthew', 22, 13, 'ezekiel', 20, 43,  9, 'Outer darkness, weeping and gnashing = Ezekiel 20:43'),
        ('matthew', 24, 51, 'ezekiel', 20, 43, 10, 'Cut him asunder, weeping and gnashing = Ezekiel 20:43'),
        ('luke',    13, 27, 'ezekiel', 20, 38, 11, 'Depart from me, all ye workers of iniquity = purge out the rebels'),
        ('luke',    13, 28, 'ezekiel', 20, 43, 12, 'Weeping and gnashing, when ye shall see Abraham... and you yourselves thrust out')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    sv.verse_id,
    tv.verse_id,
    'manual',
    'thread:post-harvest-sifting | ' || nx.member_note,
    'free'::content_tier
  FROM new_xrefs nx
  JOIN _s73_verse_lookup sv
    ON sv.book_slug = nx.source_book
   AND sv.chapter_number = nx.source_chap
   AND sv.verse_number = nx.source_v
  JOIN _s73_verse_lookup tv
    ON tv.book_slug = nx.target_book
   AND tv.chapter_number = nx.target_chap
   AND tv.verse_number = nx.target_v
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 5d. Link the cross-references to the thread. Match by the
--     note prefix so re-runs find the same rows.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (
        ORDER BY
            sb.canonical_order,
            sc.chapter_number,
            sv.verse_number,
            tb.canonical_order,
            tc.chapter_number,
            tv.verse_number
    ) AS sort_order,
    -- Strip the 'thread:post-harvest-sifting | ' prefix so the
    -- member_note is just the per-row explanation.
    SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'post-harvest-sifting'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:post-harvest-sifting | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s73_verse_lookup;

-- ---------------------------------------------------------------------
-- 6. Bump schema_version.
-- ---------------------------------------------------------------------
UPDATE schema_version
   SET version   = '1.0.0-phase4-session73',
       landed_at = now(),
       notes     = 'Session 73 (2026-05-17) — end-of-chapter cross-reference apparatus, free tier. cross_references.tier_required default flipped from study_notes to free (the apparatus moves into the free tier; every paid tier inherits via the strict chain). UNIQUE (source_verse_id, target_verse_id, source) added for dedupe safety. New tables cross_reference_threads (curated framework-diagnostic overlay with Tanakh anchor and tier gate) and cross_reference_thread_members (many-to-many join, sort_order, member_note). Seeded first thread: post-harvest-sifting, anchored on Ezekiel 20:33-44, with 12 cross-reference pairs into the gospels (Matthew 7:23, 25:32, 25:33, 25:41, 25:30, 8:12, 13:42, 22:13, 24:51 and Luke 13:27-28). The thread surfaces a Red Line #11 reading directly into the reader''s chapter-end card: sheep/goats, depart-from-me, and weeping-and-gnashing-of-teeth all trace to Ezekiel 20''s wilderness sifting of the gathered house, not to eternal-hell judgment. Treasury of Scripture Knowledge comprehensive baseline ingestion remains queued for v1.1.'
 WHERE id = 1;

COMMIT;

\echo 'Session 73 migration committed. Verifying...'

-- =====================================================================
-- Verification queries (read-only)
-- =====================================================================

\echo ''
\echo '--- Verify 1: cross_references.tier_required default is free ---'
SELECT column_name, column_default
  FROM information_schema.columns
 WHERE table_name = 'cross_references' AND column_name = 'tier_required';

\echo ''
\echo '--- Verify 2: dedupe constraint present ---'
SELECT conname, pg_get_constraintdef(oid) AS def
  FROM pg_constraint
 WHERE conname = 'cross_references_source_target_source_uniq';

\echo ''
\echo '--- Verify 3: post-harvest-sifting thread exists with anchor ---'
SELECT t.slug, t.title, t.tier_required,
       sv_book.slug || ' ' || sc.chapter_number || ':' || sv.verse_number AS anchor_start,
       ev_book.slug || ' ' || ec.chapter_number || ':' || ev.verse_number AS anchor_end
  FROM cross_reference_threads t
  LEFT JOIN verses sv ON sv.id = t.anchor_verse_id_start
  LEFT JOIN chapters sc ON sc.id = sv.chapter_id
  LEFT JOIN books sv_book ON sv_book.id = sc.book_id
  LEFT JOIN verses ev ON ev.id = t.anchor_verse_id_end
  LEFT JOIN chapters ec ON ec.id = ev.chapter_id
  LEFT JOIN books ev_book ON ev_book.id = ec.book_id
 WHERE t.slug = 'post-harvest-sifting';

\echo ''
\echo '--- Verify 4: 12 member cross-references seeded with correct verse pairs ---'
SELECT m.sort_order,
       sb.slug || ' ' || sc.chapter_number || ':' || sv.verse_number AS source_ref,
       tb.slug || ' ' || tc.chapter_number || ':' || tv.verse_number AS target_ref,
       m.member_note
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id AND t.slug = 'post-harvest-sifting'
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 ORDER BY m.sort_order;

\echo ''
\echo '--- Verify 5: schema_version current ---'
SELECT * FROM schema_version;

\echo ''
\echo 'Session 73 migration complete.'
