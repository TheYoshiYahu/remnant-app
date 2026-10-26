-- S475 (2026-10-26) — canonical verse pointer, for a second canon edition (the Restored-Name Berean).
--
-- Every feature in the app is keyed to a verse id, and those ids are the Restored King James verses.
-- Instead of migrating partner data, each verse of another canon edition points at the King James verse
-- at the same book / chapter / verse. NULL = the verse is its own canonical verse (every row today).
-- Nothing is backfilled here; the pointer is set when the Berean edition is loaded.
-- Partner tables (verse_highlights, bookmarks, study_notes, reading_positions) are NOT touched.
BEGIN;

ALTER TABLE verses ADD COLUMN IF NOT EXISTS canonical_verse_id BIGINT NULL REFERENCES verses(id) ON DELETE SET NULL;
CREATE INDEX IF NOT EXISTS idx_verses_canonical ON verses(canonical_verse_id) WHERE canonical_verse_id IS NOT NULL;

-- canonical id of a verse: itself unless it points at another verse.
CREATE OR REPLACE FUNCTION canon_verse_id(vid BIGINT) RETURNS BIGINT
LANGUAGE sql STABLE AS $$
  SELECT COALESCE(canonical_verse_id, id) FROM verses WHERE id = vid
$$;

UPDATE schema_version SET
  version = '1.0.0-phase4-session475',
  landed_at = now(),
  notes = 'Session 475 (2026-10-26) — verses.canonical_verse_id (NULL = self) + canon_verse_id(). Groundwork for the Restored-Name Berean as a second canon edition: marks, notes, bookmarks, cross-references and people pages resolve through the King James verse at the same reference. No partner rows changed.';

COMMIT;
