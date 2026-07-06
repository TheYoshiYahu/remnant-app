-- Migration: consonantal-skeleton lens ("Without the vowels")
--
-- Adds the consonantal skeleton (vowel-/accent-stripped Hebrew lemma) to each
-- Strong's entry, plus a precomputed single-consonant-swap near-match map, so
-- the app can show "every word that shares this consonantal skeleton" and the
-- netzer↔nazir-style near-match deep dive.
--
-- Apply with the build script (computes the actual values; this file only makes
-- the columns/tables): restoration-pipeline/_build_consonantal_skeleton.py.
-- Both are idempotent. Do NOT run against live from here — see the deploy notes.

-- 1) Skeleton column on strong_entries. Populated by the build script as
--    strip([֑-ׇ]) over the pointed `lemma` (Hebrew points + accents).
ALTER TABLE strong_entries
    ADD COLUMN IF NOT EXISTS consonantal_skeleton TEXT;

CREATE INDEX IF NOT EXISTS idx_strong_skeleton
    ON strong_entries (consonantal_skeleton);

COMMENT ON COLUMN strong_entries.consonantal_skeleton IS
    'Vowel/accent-stripped Hebrew consonant skeleton of `lemma` (points/accents U+0591–U+05C7 removed). NULL for Greek. Powers GET /v1/skeleton/{skeleton}.';

-- 2) Precomputed single-consonant-swap near-match map between distinct
--    skeletons (edit distance 1: substitution, insertion, or deletion of one
--    consonant). Symmetric pairs are stored both directions by the build script
--    so a lookup on either skeleton finds the other. Powers
--    GET /v1/skeleton/{skeleton}/near.
CREATE TABLE IF NOT EXISTS strong_skeleton_near (
    skeleton        TEXT NOT NULL,   -- the query skeleton
    near_skeleton   TEXT NOT NULL,   -- a skeleton one consonant away
    edit_kind       TEXT NOT NULL    -- 'substitution' | 'insertion' | 'deletion'
        CHECK (edit_kind IN ('substitution', 'insertion', 'deletion')),
    PRIMARY KEY (skeleton, near_skeleton)
);

CREATE INDEX IF NOT EXISTS idx_skeleton_near_skeleton
    ON strong_skeleton_near (skeleton);

COMMENT ON TABLE strong_skeleton_near IS
    'Single-consonant-swap near-match map between Hebrew consonantal skeletons (edit distance 1). Precomputed by _build_consonantal_skeleton.py. Powers the netzer↔nazir-style near-match deep dive.';
