-- session-162 — lexicon_entries + lexicon_callouts tables
-- Phase 9.3 (BDB / LSJ depth lexicons, Companion tier; Gesenius deferred to v1.1+).
-- Spec: DESIGN_LANGUAGE.md §26. Parse plan: _scratch/S158_LEXICON_PARSE_PLAN.md.
-- Additive: no existing table touched. Fully reversible (DROP TABLE on both).

BEGIN;

-- The depth-lexicon body table. One row per (source, strong_number). Each
-- Strong's number can have at most one row per source — BDB rows for
-- Hebrew/Aramaic Strong's, LSJ rows for Greek Strong's (with Abbott-Smith
-- NT-only fallback rendered under the same 'lsj' source enum). Gesenius
-- is reserved in the source CHECK constraint for the v1.1+ wheel that
-- picks up the OCR / alternate-source investigation; no rows at V1.
CREATE TABLE lexicon_entries (
    id                  BIGSERIAL PRIMARY KEY,
    source              TEXT NOT NULL CHECK (source IN ('bdb','lsj','gesenius')),
    strong_number       TEXT NOT NULL REFERENCES strong_entries(strong_number),
    lemma               TEXT NOT NULL,
    transliteration     TEXT,
    pronunciation       TEXT,
    part_of_speech      TEXT,
    short_definition    TEXT,
    body_html           TEXT NOT NULL,
    derivation          TEXT,
    citations_count     INT NOT NULL DEFAULT 0,
    UNIQUE (source, strong_number)
);

CREATE INDEX idx_lexicon_strong ON lexicon_entries(strong_number);
CREATE INDEX idx_lexicon_source ON lexicon_entries(source);

COMMENT ON TABLE lexicon_entries IS
    'BDB / LSJ / Gesenius depth-lexicon entries. Public domain. Loaded from STEPBible / OpenScriptures public-domain dumps per source-texts/SOURCE_TEXT_INVENTORY.md. LSJ rows include Abbott-Smith NT-only fallback entries under the same source enum. Gesenius source enum reserved for v1.1+ (S160 dropped Gesenius from V1 — body content not on disk in OpenScriptures; AugIndex.xml is pointer-only). The voice skill is the standard; these entries are data. Framework callouts are stored in lexicon_callouts and rendered above the entry body per DESIGN_LANGUAGE.md §26.';

-- Curated framework-callout authored under the 12 Red Lines, surfaced
-- above the lexicon body when a Strong's number matches. One row per
-- strong_number (the callout applies to all sources for that word).
-- V1 list: 34 entries (16 Hebrew + 18 Greek), each author-reviewed by
-- Yoshi at S162. Loaded by session162_lexicon_callouts_v1.sql sibling
-- migration after this DDL applies.
CREATE TABLE lexicon_callouts (
    strong_number       TEXT PRIMARY KEY REFERENCES strong_entries(strong_number),
    term_display        TEXT NOT NULL,
    gloss_error_summary TEXT NOT NULL,
    body_md             TEXT NOT NULL,
    red_lines_cited     TEXT[] NOT NULL,
    last_reviewed_at    TIMESTAMPTZ,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE lexicon_callouts IS
    'Framework reading-callouts surfaced above the lexicon body in the §26 LexiconSheet when a Strong''s number matches. Locked V1 list per DESIGN_LANGUAGE.md §26 (16 Hebrew + 18 Greek = 34 high-impact terms). Grows as a curated wheel post-launch; never generated at runtime.';

UPDATE schema_version
   SET version   = '1.0.0-phase9.3-session162',
       landed_at = NOW(),
       notes     = 'Session 162 (Phase 9.3) — lexicon_entries + lexicon_callouts tables landed (BDB + LSJ; Gesenius deferred to v1.1+). Schema additive only, no existing table touched. Data loaded by session162_lexicon_callouts_v1.sql (callout assembly, S162) and session163_lexicon_entries_load.sql (full-corpus loader output, S163). Prior version: 1.0.0-phase4-session154.'
 WHERE id = 1;

DO $verify$
DECLARE
    entries_table_exists BOOLEAN;
    callouts_table_exists BOOLEAN;
    entries_fk_exists BOOLEAN;
    callouts_fk_exists BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1 FROM information_schema.tables
        WHERE table_name = 'lexicon_entries'
    ) INTO entries_table_exists;

    SELECT EXISTS (
        SELECT 1 FROM information_schema.tables
        WHERE table_name = 'lexicon_callouts'
    ) INTO callouts_table_exists;

    SELECT EXISTS (
        SELECT 1 FROM information_schema.referential_constraints rc
        JOIN information_schema.table_constraints tc
          ON tc.constraint_name = rc.constraint_name
        WHERE tc.table_name = 'lexicon_entries'
          AND rc.unique_constraint_schema = 'public'
    ) INTO entries_fk_exists;

    SELECT EXISTS (
        SELECT 1 FROM information_schema.referential_constraints rc
        JOIN information_schema.table_constraints tc
          ON tc.constraint_name = rc.constraint_name
        WHERE tc.table_name = 'lexicon_callouts'
          AND rc.unique_constraint_schema = 'public'
    ) INTO callouts_fk_exists;

    IF NOT entries_table_exists
       OR NOT callouts_table_exists
       OR NOT entries_fk_exists
       OR NOT callouts_fk_exists THEN
        RAISE EXCEPTION
            'Phase 9.3 lexicon-tables verify failed: entries=% callouts=% entries_fk=% callouts_fk=%',
            entries_table_exists, callouts_table_exists,
            entries_fk_exists, callouts_fk_exists;
    END IF;

    RAISE NOTICE 'Phase 9.3 lexicon-tables verified: 2 tables + 2 FKs + 2 indexes landed.';
END
$verify$;

COMMIT;
