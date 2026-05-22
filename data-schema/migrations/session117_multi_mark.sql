-- =====================================================================
-- Session 117 — multi-mark highlights
-- =====================================================================
-- Drops the S113 one-mark-per-verse-per-user lock and replaces it with
-- the multi-mark unique constraint Yoshi asked for in S114:
--
--   "i wanted it to be able to underline outline and highlight the same
--    verse, and would like the ability to underline more than once in a
--    different color, possibly three times"
--
-- The locked S113 design shipped (user_id, verse_id) UNIQUE — one mark
-- per verse per user, re-marking replaces. That was an S113
-- implementation choice (DESIGN_LANGUAGE.md §6/§7/§8 never explicitly
-- said one-per-verse — that's an S117 doc update). S117 swaps the
-- constraint to (user_id, verse_id, color, style) UNIQUE — same exact
-- (color, style) tuple can't double-stack on the same verse, but
-- different combos coexist (crimson fill + emerald underline + sky_blue
-- outline all live on the same verse simultaneously; same color across
-- different styles also OK; different colors across same style ALSO OK
-- — that's the explicit Yoshi case: 3 colored underlines per verse).
--
-- Cap: hard limit of 3 marks per verse enforced at the PWA picker layer
-- per S117 Yoshi gate. Schema doesn't enforce the cap — the picker
-- prevents adding a 4th mark, and the design lock at DESIGN_LANGUAGE.md
-- §8 records the cap. If we ever need server-side enforcement, add a
-- CHECK via a trigger; for V1, picker-side cap is sufficient.
--
-- Idempotent throughout — DROP CONSTRAINT IF EXISTS, DO-block guard on
-- the new constraint, same shape as the S113 migration.
-- =====================================================================

\echo 'Session 117 — multi-mark highlights migration starting...'
BEGIN;

-- ---------- 1. drop the S113 one-mark-per-verse unique ----------------
-- The S113 constraint was named verse_highlights_user_verse_unique per
-- the explicit ADD CONSTRAINT in session113_user_highlight_labels.sql.
-- Drop is idempotent — re-runs against an already-migrated schema are
-- no-ops.

ALTER TABLE verse_highlights
    DROP CONSTRAINT IF EXISTS verse_highlights_user_verse_unique;

-- ---------- 2. add the multi-mark unique tuple ------------------------
-- Same (color, style) tuple on the same verse is unique — re-applying
-- an exact duplicate is a no-op. Different (color, style) combos on the
-- same verse coexist.

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
         WHERE conname = 'verse_highlights_user_verse_color_style_unique'
    ) THEN
        ALTER TABLE verse_highlights
            ADD CONSTRAINT verse_highlights_user_verse_color_style_unique
            UNIQUE (user_id, verse_id, color, style);
    END IF;
END $$;

COMMIT;
\echo 'Session 117 — multi-mark highlights migration complete.'
