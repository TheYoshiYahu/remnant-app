-- =====================================================================
-- Session 113 — highlights schema for the 12 + 1 / 3-style design lock
-- =====================================================================
-- Brings the highlights schema into alignment with DESIGN_LANGUAGE.md
-- §6, §7, §8 (locked S77/S78). The original verse_highlights schema
-- (Section 8 of schema.sql) carried only (user_id, verse_id, color);
-- the locked design adds the mark-style dimension and tightens the
-- one-mark-per-verse-per-user rule. The user_highlight_labels table
-- adds the free-form color-meaning dictionary surfaced at the $1.99
-- tier (DESIGN_LANGUAGE.md §9 / Tier-Feature Matrix).
--
-- Three schema moves in one migration:
--
--   1. verse_highlights gains a TEXT style column ('fill' | 'underline'
--      | 'outline'). Free-tier marks are always 'fill' + neon yellow.
--      $1.99-and-above can apply any of 3 styles × 12 tribe colors.
--
--   2. verse_highlights unique constraint moves from (user_id, verse_id,
--      color) to (user_id, verse_id). One mark per (user, verse) — re-
--      marking the same verse replaces the existing mark. Multiple
--      marks per verse would compose visually unpredictably; the design
--      lock is one mark per verse per user.
--
--   3. user_highlight_labels — partner-assigned color labels (the
--      "free-form color-meaning dictionary" at $1.99). Empty by default;
--      the partner fills in whatever label they want for each color
--      ("rose = the Father's love" etc.). NO framework defaults preloaded
--      in V1 — symbolic tribe/gemstone labels are a V2 enrichment per
--      DESIGN_LANGUAGE.md §6. The API layer returns empty labels for
--      unset colors; the PWA shows "Add a meaning…" placeholder.
--
-- Idempotent throughout — ADD COLUMN IF NOT EXISTS, DROP CONSTRAINT IF
-- EXISTS, CREATE TABLE IF NOT EXISTS, CREATE INDEX IF NOT EXISTS, and a
-- DO-block guard on the new constraint.
-- =====================================================================

\echo 'Session 113 — highlights schema migration starting...'
BEGIN;

-- ---------- 1. verse_highlights.style ----------------------------------
-- Default 'fill' so existing rows (and free-tier marks going forward)
-- carry the right value without the API having to backfill.

ALTER TABLE verse_highlights
    ADD COLUMN IF NOT EXISTS style TEXT NOT NULL DEFAULT 'fill';

-- Enum-like CHECK constraint on the style column. Idempotent: drop
-- existing if any, then re-add — keeps the constraint in lockstep with
-- the values the API treats as valid.
ALTER TABLE verse_highlights
    DROP CONSTRAINT IF EXISTS verse_highlights_style_check;

ALTER TABLE verse_highlights
    ADD CONSTRAINT verse_highlights_style_check
    CHECK (style IN ('fill', 'underline', 'outline'));

COMMENT ON COLUMN verse_highlights.style IS
    'The mark-render style: fill (translucent tinted background), underline (solid colored line below text), or outline (4-direction text-shadow exterior outline, same technique as sacred-name treatment). Free tier locked to fill; $1.99+ unlocks all three. See DESIGN_LANGUAGE.md §8.';

-- ---------- 2. unique constraint swap ----------------------------------
-- The original schema's UNIQUE (user_id, verse_id, color) allowed a
-- partner to layer multiple colored marks on a single verse (one row
-- per color). The locked design ships ONE mark per (user, verse) —
-- re-marking replaces. The unique constraint becomes (user_id, verse_id).
--
-- Defensive ordering: drop the old constraint first (named per asyncpg's
-- default for UNIQUE created in the schema definition); then add the
-- new constraint guarded by a DO block so we don't trip on re-runs.

ALTER TABLE verse_highlights
    DROP CONSTRAINT IF EXISTS verse_highlights_user_id_verse_id_color_key;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
         WHERE conname = 'verse_highlights_user_verse_unique'
    ) THEN
        ALTER TABLE verse_highlights
            ADD CONSTRAINT verse_highlights_user_verse_unique
            UNIQUE (user_id, verse_id);
    END IF;
END $$;

-- ---------- 3. user_highlight_labels ------------------------------------
-- Partner-assigned free-form labels for the 12 tribe colors + neon
-- yellow. Composite PK on (user_id, color); rows store user-defined
-- overrides only (unset (user, color) pairs return empty-string in the
-- API response). NO framework defaults preloaded at the schema layer.

CREATE TABLE IF NOT EXISTS user_highlight_labels (
    user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    color       TEXT NOT NULL,
    label       TEXT NOT NULL,
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id, color)
);

COMMENT ON TABLE user_highlight_labels IS
    'Partner-assigned free-form color labels — the "color-meaning dictionary" at the $1.99 tier per DESIGN_LANGUAGE.md §9. Empty by default; the partner fills in whatever meaning they want for each color. No framework defaults preloaded in V1. Tier-gated at the API layer (writes restricted to study_notes-and-above; reads return empty labels for free callers since their only color is neon yellow).';

CREATE INDEX IF NOT EXISTS idx_user_highlight_labels_user
    ON user_highlight_labels(user_id);

COMMIT;
\echo 'Session 113 — highlights schema migration complete.'
