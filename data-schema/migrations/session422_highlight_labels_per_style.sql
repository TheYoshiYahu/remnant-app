-- =====================================================================
-- Session 422 — per-(color × style) highlight labels
-- =====================================================================
-- Re-keys user_highlight_labels from (user_id, color) to
-- (user_id, color, style) so each mark-STYLE of a color carries its own
-- free-form meaning. Before S422 a color had ONE label ("yellow"
-- meant one thing); after S422 yellow FILL, yellow UNDERLINE and yellow
-- OUTLINE are three independent label slots. With 12 tribe colors × 3
-- mark styles that is up to 36 distinct paid label slots (plus the free
-- neon_yellow · fill baseline).
--
-- This touches ONLY the label dictionary. The mark schema itself
-- (verse_highlights) already supports up to 3 coexisting marks per verse
-- — one per style — since Session 117
-- (verse_highlights_user_verse_color_style_unique). S422 does NOT touch
-- verse_highlights.
--
-- Three schema moves in one transaction:
--
--   1. user_highlight_labels gains a TEXT `style` column
--      ('fill' | 'underline' | 'outline'), DEFAULT 'fill'. The DEFAULT
--      backfills every pre-existing per-color row to the FILL style —
--      see the migration-forward note below.
--
--   2. A CHECK constraint pins `style` to the three valid mark styles,
--      in lockstep with verse_highlights.style and the API's MarkStyle.
--
--   3. The composite key moves from PRIMARY KEY (user_id, color) to
--      PRIMARY KEY (user_id, color, style), so the same color can hold a
--      different label per style without colliding.
--
-- MIGRATION-FORWARD DECISION (least-surprising, documented):
--   Existing per-color labels are mapped to the FILL style ONLY — not
--   copied across all three styles. Rationale: `fill` is the default
--   mark style (the free tier's only style and the most common mark), so
--   an existing "yellow = the Father's love" label lands on the slot the
--   partner most likely meant. Copying it into the underline+outline
--   slots would silently pre-fill two slots the partner never set, which
--   is the surprising outcome (they would later find "yellow underline"
--   already carrying a meaning they never typed). The DEFAULT 'fill' on
--   the new column achieves exactly this: every legacy row becomes the
--   (user, color, 'fill') slot; the underline/outline slots start empty.
--
-- Idempotent throughout — ADD COLUMN IF NOT EXISTS, DROP CONSTRAINT IF
-- EXISTS, and DO-block guards on the CHECK and the new PRIMARY KEY, so a
-- re-run against an already-migrated schema is a no-op. Safe to apply via
--     python3 apply_migration.py \
--         /data-schema/migrations/session422_highlight_labels_per_style.sql
-- =====================================================================

\echo 'Session 422 — per-(color × style) highlight labels migration starting...'
BEGIN;

-- ---------- 1. user_highlight_labels.style -----------------------------
-- DEFAULT 'fill' so every existing per-color row is carried forward onto
-- the FILL style slot (the migration-forward decision above), and future
-- inserts that omit style default to fill.
ALTER TABLE user_highlight_labels
    ADD COLUMN IF NOT EXISTS style TEXT NOT NULL DEFAULT 'fill';

-- ---------- 2. style CHECK ---------------------------------------------
-- Enum-like guard; drop-then-add keeps it in lockstep with the values the
-- API's MarkStyle treats as valid (mirrors verse_highlights_style_check).
ALTER TABLE user_highlight_labels
    DROP CONSTRAINT IF EXISTS user_highlight_labels_style_check;

ALTER TABLE user_highlight_labels
    ADD CONSTRAINT user_highlight_labels_style_check
    CHECK (style IN ('fill', 'underline', 'outline'));

COMMENT ON COLUMN user_highlight_labels.style IS
    'The mark-style this label applies to: fill | underline | outline. A color carries an independent label per style (yellow fill vs yellow underline vs yellow outline). Legacy per-color labels were migrated to the fill style in S422.';

-- ---------- 3. swap the key from (user,color) to (user,color,style) -----
-- Drop the original 2-column PRIMARY KEY (default name
-- user_highlight_labels_pkey) then re-add it across all three columns.
-- On first run: existing rows all carry style='fill', so (user, color,
-- 'fill') is unique per the old (user, color) key — the new PK builds
-- cleanly. On a re-run: DROP IF EXISTS removes the 3-col PK and the guard
-- re-adds it, so the table always ends with the 3-col PRIMARY KEY.
ALTER TABLE user_highlight_labels
    DROP CONSTRAINT IF EXISTS user_highlight_labels_pkey;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
         WHERE conname = 'user_highlight_labels_pkey'
    ) THEN
        ALTER TABLE user_highlight_labels
            ADD CONSTRAINT user_highlight_labels_pkey
            PRIMARY KEY (user_id, color, style);
    END IF;
END $$;

COMMENT ON TABLE user_highlight_labels IS
    'Partner-assigned free-form labels — the "color-meaning dictionary" at the $1.99 tier per DESIGN_LANGUAGE.md §9. Keyed by (user_id, color, style) since S422: every (color × style) mark configuration carries its own independent label (up to 12 tribe colors × 3 styles = 36 paid slots, plus neon_yellow · fill). Empty by default; the partner fills in whatever meaning they want. No framework defaults preloaded. Tier-gated at the API layer (writes restricted to study_notes-and-above; reads return empty labels for unset slots).';

COMMIT;
\echo 'Session 422 — per-(color × style) highlight labels migration complete.'
