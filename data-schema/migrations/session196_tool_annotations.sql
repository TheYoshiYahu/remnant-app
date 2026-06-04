-- session-196 — tool_annotations (the framework annotation-layer overlay)
-- Spec: APP_BUILDOUT_ROADMAP.md "Why we include the flawed tools — the framework
--       annotation layer (locked S194)" + SOURCE_TEXT_INVENTORY.md §III.
-- Phase: Session B (tooling integration). Builds the keyed overlay FIRST so every
--        public-domain tool ships as an untouched base with our corrections beside it.
-- Additive: no existing table touched. Fully reversible (DROP TABLE).
--
-- Relationship to lexicon_callouts (S162): lexicon_callouts is the strong-number-keyed
-- overlay for the BDB / LSJ depth-lexicon surface (§26 LexiconSheet) and stays the
-- canonical home for those 34 Hebrew/Greek word callouts. tool_annotations is the
-- GENERALIZED overlay for every other public-domain tool whose entries are NOT keyed
-- by a Strong's number — Vincent's (verse + Greek lemma), Nave's (topic slug), Maps
-- (place / region id), TSK (verse-pair or source-verse) — plus the single-point
-- Nikkudot Tetragrammaton-pointing note and the interlinear gloss-cell notes. The
-- two tables share the same shape (keyed overlay on a fixed PD base) and the same
-- discipline: the base is auditable and untouched; the correction is unmistakably ours.

BEGIN;

-- One row per (tool, entry_key). entry_key conventions per tool:
--   bdb / lsj / strongs   → Strong's number (H#### / G####); these mostly defer to
--                           lexicon_callouts, indexed here for a single program view.
--   vincents              → '<book-slug>.<chapter>.<verse>:<greek-lemma>' (NT only)
--   interlinear           → Strong's number of the gloss cell being annotated
--   nikkudot              → 'tetragrammaton' (the one pointing-mask conflict)
--   naves                 → topic slug (lower-kebab of the Nave's subject heading)
--   maps                  → openbible place id, region key, or 'dispersion-overlay'
--   tsk                   → '<from-verse>' source-verse key, or 'sweep:<class>' for a
--                           distortion-class note covering a pattern of pairs
CREATE TABLE tool_annotations (
    id                  BIGSERIAL PRIMARY KEY,
    tool                TEXT NOT NULL CHECK (tool IN (
                            'bdb','lsj','strongs','vincents','interlinear',
                            'nikkudot','naves','maps','tsk'
                        )),
    entry_key           TEXT NOT NULL,
    term_display        TEXT,                     -- human label for the annotated entry
    conflict_summary    TEXT NOT NULL,            -- the punch-list line: where the tool needs correction
    annotation_md       TEXT NOT NULL,            -- the framework correction (markdown, Sacred Names + Come-and-See)
    tier_required       content_tier NOT NULL DEFAULT 'complete_study',
    red_lines_cited     TEXT[] NOT NULL DEFAULT '{}',
    is_punch_list_only  BOOLEAN NOT NULL DEFAULT FALSE,  -- TRUE = conflict logged, full annotation still to be authored
    last_reviewed_at    TIMESTAMPTZ,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (tool, entry_key)
);

CREATE INDEX idx_tool_annotations_tool ON tool_annotations(tool);
CREATE INDEX idx_tool_annotations_key  ON tool_annotations(tool, entry_key);

COMMENT ON TABLE tool_annotations IS
    'Framework annotation-layer overlay (APP_BUILDOUT_ROADMAP "annotation layer", locked S194). One keyed row per public-domain tool entry that needs a framework correction. The PD base tables (lexicon_entries, naves_topical, tsk_cross_references, maps_*, vincents_*) stay untouched; this is the separate keyed overlay rendered beside them at point of use, so the reader taps the trusted tool, sees what it says, and sees the restored reading correct it. BDB/LSJ strong-number word callouts live in lexicon_callouts; this table carries every other tool plus the single-point notes. is_punch_list_only TRUE rows are conflict points logged for the authoring wheel but not yet given a full author-reviewed annotation — the surface renders only is_punch_list_only=FALSE rows as live corrections.';

UPDATE schema_version
   SET version   = '1.0.0-phase-sessionB-session196',
       landed_at = NOW(),
       notes     = 'Session 196 (Session B tooling integration) — tool_annotations framework annotation-layer overlay landed (the keyed correction layer beside every PD tool base, per APP_BUILDOUT_ROADMAP annotation-layer lock S194 + SOURCE_TEXT_INVENTORY §III). Additive only; no existing table touched. Seed rows loaded by session196_tool_annotations_seed_v1.sql. Prior version: 1.0.0-phase4-session173.'
 WHERE id = 1;

DO $verify$
DECLARE
    tbl_exists  BOOLEAN;
    uniq_exists BOOLEAN;
    fk_tier_ok  BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1 FROM information_schema.tables
        WHERE table_name = 'tool_annotations'
    ) INTO tbl_exists;

    SELECT EXISTS (
        SELECT 1 FROM information_schema.table_constraints
        WHERE table_name = 'tool_annotations'
          AND constraint_type = 'UNIQUE'
    ) INTO uniq_exists;

    -- tier_required must resolve through the content_tier lattice
    SELECT tier_satisfies('everything'::content_tier, 'complete_study'::content_tier)
      INTO fk_tier_ok;

    IF NOT tbl_exists OR NOT uniq_exists OR NOT fk_tier_ok THEN
        RAISE EXCEPTION
            'session196 tool_annotations verify failed: tbl=% uniq=% tier=%',
            tbl_exists, uniq_exists, fk_tier_ok;
    END IF;

    RAISE NOTICE 'session196 tool_annotations verified: table + unique + 2 indexes landed.';
END
$verify$;

COMMIT;
