-- Session 203 — My Study (Session C): collections on notes.
--
-- The My Study home (DESIGN_LANGUAGE.md §-pending, proof signed off
-- S203) organizes the partner's whole apparatus — notes, bookmarks,
-- highlights — under "Collections": folder-feel in the UI, flat tags
-- underneath, so one note can live under several headings and the
-- same field powers search + export filters.
--
-- Bookmarks have carried `tags TEXT[]` (GIN-indexed) since S124.
-- This migration brings study_notes to parity. Highlights do NOT get
-- tags — their organizational vocabulary is the color + style pair
-- plus the partner's color-label dictionary (user_highlight_labels),
-- which the Highlights tab renders as color sections with
-- fill/underline/outline sub-groups.
--
-- Idempotent: IF NOT EXISTS on both statements.

BEGIN;

ALTER TABLE study_notes
    ADD COLUMN IF NOT EXISTS tags TEXT[];

CREATE INDEX IF NOT EXISTS idx_notes_tags_gin
    ON study_notes USING GIN (tags);

DO $verify$
DECLARE
    has_col BOOL;
BEGIN
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns
         WHERE table_name = 'study_notes' AND column_name = 'tags'
    ) INTO has_col;
    IF NOT has_col THEN
        RAISE EXCEPTION 'session203 verify failed: study_notes.tags missing';
    END IF;
    RAISE NOTICE 'session203: study_notes.tags + GIN index in place.';
END
$verify$;

COMMIT;
