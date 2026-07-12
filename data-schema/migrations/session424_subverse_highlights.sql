-- =====================================================================
-- Session 424 — sub-verse (word / phrase) highlights
-- =====================================================================
-- Extends verse_highlights so a mark can target a single word or a run
-- of words (a phrase) INSIDE a verse, not just the whole verse. The
-- anchor is expressed as a [word_start, word_end] span over
-- verse_words.position (the same 1-based per-word positions the S121
-- tap-on-word alignment already uses):
--
--   * word_start = word_end        → a single word.
--   * word_start < word_end        → a phrase (inclusive run of words).
--   * word_start IS NULL           → a WHOLE-VERSE mark (the S113→S117
--     behavior, unchanged). word_end is NULL in lockstep.
--
-- BACKWARD COMPATIBILITY (hard requirement): every existing row has
-- word_start / word_end defaulting to NULL, so every pre-S424 highlight
-- is a whole-verse mark and renders / behaves exactly as before. The new
-- columns are nullable with no default value change to existing rows.
--
-- UNIQUE CONSTRAINT WIDENING. S117 keyed uniqueness on
-- (user_id, verse_id, color, style) so up to 3 (color, style) marks
-- coexist per verse. S424 adds word_start, word_end to that tuple so a
-- word/phrase mark is distinct from a whole-verse mark AND from other
-- word/phrase ranges of the same color+style on the same verse. The
-- catch: a plain UNIQUE treats NULL as DISTINCT, which would BREAK the
-- whole-verse insert-or-no-op semantics (two identical whole-verse rows
-- both carry NULL/NULL and would no longer collide). Postgres 15+
-- (prod is PG16) fixes this with UNIQUE NULLS NOT DISTINCT — NULLs
-- compare equal, so whole-verse re-marks still dedup on
-- (user, verse, color, style) exactly as before, while non-NULL ranges
-- distinguish normally.
--
-- Idempotent throughout — ADD COLUMN IF NOT EXISTS, DROP CONSTRAINT IF
-- EXISTS, DO-block guard on the new constraint. Safe to re-run.
-- =====================================================================

\echo 'Session 424 — sub-verse (word/phrase) highlights migration starting...'
BEGIN;

-- ---------- 1. nullable sub-verse anchor columns ----------------------
-- Reference verse_words.position (a 1-based ordinal, not a FK target —
-- verse_words has UNIQUE (verse_id, position) but no standalone unique
-- on position alone, and the anchor is validated at the API layer
-- against the mark's own verse). NULL/NULL = whole-verse (default).

ALTER TABLE verse_highlights
    ADD COLUMN IF NOT EXISTS word_start INT;
ALTER TABLE verse_highlights
    ADD COLUMN IF NOT EXISTS word_end   INT;

COMMENT ON COLUMN verse_highlights.word_start IS
    'S424 sub-verse anchor: 1-based verse_words.position of the first marked word. NULL = whole-verse mark (pre-S424 behavior). word_end is NULL in lockstep.';
COMMENT ON COLUMN verse_highlights.word_end IS
    'S424 sub-verse anchor: 1-based verse_words.position of the last marked word (== word_start for a single word). NULL = whole-verse mark.';

-- ---------- 2. shape check: both NULL or both set & ordered -----------
ALTER TABLE verse_highlights
    DROP CONSTRAINT IF EXISTS verse_highlights_subverse_range_check;
ALTER TABLE verse_highlights
    ADD CONSTRAINT verse_highlights_subverse_range_check
    CHECK (
        (word_start IS NULL AND word_end IS NULL)
        OR (word_start IS NOT NULL AND word_end IS NOT NULL
            AND word_start >= 1 AND word_start <= word_end)
    );

-- ---------- 3. widen the multi-mark unique to include the range -------
-- Drop the S117 (user_id, verse_id, color, style) unique and replace it
-- with (…, word_start, word_end) UNIQUE NULLS NOT DISTINCT so whole-verse
-- (NULL/NULL) rows still dedup while word/phrase ranges are distinct.
-- The API's ON CONFLICT ON CONSTRAINT targets the NEW constraint name.

ALTER TABLE verse_highlights
    DROP CONSTRAINT IF EXISTS verse_highlights_user_verse_color_style_unique;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
         WHERE conname = 'verse_highlights_user_verse_color_style_word_unique'
    ) THEN
        ALTER TABLE verse_highlights
            ADD CONSTRAINT verse_highlights_user_verse_color_style_word_unique
            UNIQUE NULLS NOT DISTINCT
            (user_id, verse_id, color, style, word_start, word_end);
    END IF;
END $$;

COMMIT;
\echo 'Session 424 — sub-verse (word/phrase) highlights migration complete.'
