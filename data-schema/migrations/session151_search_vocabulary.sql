-- =====================================================================
-- Session 151 migration — Search Engine v2.1 token-level fuzzy via
-- materialized vocabulary
-- 2026-05-27
-- =====================================================================
-- S150 shipped synonym expansion + tsquery ordering with the fuzzy
-- layer dropped in Round-3 because the live <% word_similarity
-- approach against verses.text was either seq-scanning or returning 0
-- hits at the default threshold (the synagauge → synagogue gap had
-- similarity ~0.25, below 0.6 default). The right design — caught at
-- S150 close — is to materialize the verse vocabulary once and
-- trigram-match against the lexeme table, so the user's typo
-- expansion is a bounded lookup against a small table (~15-25k
-- distinct lexemes across canon + extras) rather than a per-query
-- substring scan of the verse corpus.
--
-- Design record: S150_CHECKPOINT.md → "Wheel #2 — v2.1 token-level
-- fuzzy via materialized vocabulary."
--
-- This migration:
--   * Creates search_vocabulary(lexeme TEXT PK, occurrences INT NOT NULL).
--   * Creates a GIN trigram index on the lexeme column.
--   * Seeds the table from ts_stat over verses.text_tsv — every lexeme
--     the english parser produced across the entire verses table, with
--     its document-frequency count.
--   * Bumps schema_version to '1.0.0-phase4-session151'.
--
-- Run via:
--   cd ~/Desktop/App
--   python3 _scratch/_s151_apply_and_verify.py
--
-- The API change that consumes this table is in api/main.py
-- (_expand_fuzzy helper wired into search_verses). The
-- pg_trgm.similarity_threshold for the fuzzy lookup is set per-query
-- via SET LOCAL — the default 0.6 is too strict for real typos
-- (synagauge → synagogue is ~0.45). S151 ships with 0.3 as the
-- per-query threshold.
--
-- Single transaction; DO-block at the end raises on populated-row
-- count below floor or on missing index.
-- =====================================================================

\echo 'Session 151 migration starting — search vocabulary table for v2.1 fuzzy...'

BEGIN;

-- ---------------------------------------------------------------------
-- 1. pg_trgm — confirm the extension is available.
-- ---------------------------------------------------------------------
-- pg_trgm was already installed at S148b for the original ILIKE-via-trgm
-- substring search; this CREATE EXTENSION IF NOT EXISTS is defensive
-- so a future fresh-DB bootstrap that runs migrations in sequence
-- doesn't fail here. No-op when already present.
CREATE EXTENSION IF NOT EXISTS pg_trgm;


-- ---------------------------------------------------------------------
-- 2. search_vocabulary — the materialized lexeme table.
-- ---------------------------------------------------------------------
-- lexeme: the english parser's normalized form of a word as it
--   appears in any verse (canon + extras together — fuzzy lookup
--   doesn't need to discriminate by edition because the search
--   layer already does that elsewhere).
-- occurrences: ts_stat's ndoc — how many verses contain the lexeme.
--   Used as a tiebreak when multiple lexemes score equal similarity
--   (prefer the more common one — "synagogue" with ~50 occurrences
--   beats "synagaugue" hypothetical low-count rare typo-of-a-typo).
CREATE TABLE search_vocabulary (
    lexeme       TEXT PRIMARY KEY,
    occurrences  INT NOT NULL
);

COMMENT ON TABLE search_vocabulary IS
    'S151 search engine v2.1 — materialized english-parser vocabulary across all verses (canon + extras). Powers token-level fuzzy expansion: for user tokens that match no synonym group, search_verses queries `lexeme % $token` ORDER BY similarity(lexeme, $token) DESC LIMIT 3 to OR-expand the tsquery to the nearest real lexemes. occurrences carries ts_stat''s ndoc value for similarity-tiebreak ordering when multiple lexemes score equal similarity. Refreshed on any large-scale text update (S149-style modernization, future restoration passes) via re-running the ts_stat seed.';

COMMENT ON COLUMN search_vocabulary.lexeme IS
    'English-parser-normalized form of a word as it appears in any verse (output of to_tsvector(''english'', text)). Lowercase, stemmed. PK; lookup is via trigram-similarity (% operator) against the GIN trgm index.';

COMMENT ON COLUMN search_vocabulary.occurrences IS
    'ts_stat ndoc — count of verses containing the lexeme. Tiebreak ordering when multiple lexemes score equal similarity against a user token.';


-- ---------------------------------------------------------------------
-- 3. GIN trigram index.
-- ---------------------------------------------------------------------
-- The `lexeme % $token` operator and similarity(lexeme, $token)
-- function both ride the gin_trgm_ops index. Without it, the fuzzy
-- lookup would seq-scan the table on every query — defeating the
-- whole point of materializing the vocabulary.
CREATE INDEX idx_search_vocab_trgm
    ON search_vocabulary USING gin (lexeme gin_trgm_ops);


-- ---------------------------------------------------------------------
-- 4. Seed from ts_stat over verses.text_tsv.
-- ---------------------------------------------------------------------
-- ts_stat returns one row per distinct lexeme in the corpus with
-- word/ndoc/nentry. We ignore nentry (total occurrences across all
-- documents) in favor of ndoc (doc-frequency — how many verses the
-- lexeme appears in) because doc-frequency is the better tiebreak
-- signal for "is this a common word or a rare one." A user typing
-- "synagaugue" should land on "synagogue" (high ndoc) before any
-- rare typo-shaped lexeme that happens to share trigrams.
INSERT INTO search_vocabulary (lexeme, occurrences)
SELECT word, ndoc
  FROM ts_stat('SELECT text_tsv FROM verses');


-- ---------------------------------------------------------------------
-- 5. Verify.
-- ---------------------------------------------------------------------
DO $verify$
DECLARE
    vocab_count            INT;
    has_synagogue          BOOLEAN;
    has_righteous          BOOLEAN;
    has_yahuah             BOOLEAN;
    index_exists           BOOLEAN;
BEGIN
    -- Floor on populated-row count. The canon+extras corpus has on
    -- the order of 15-25k distinct stemmed lexemes; anything below
    -- 5k means the seed query failed silently.
    SELECT count(*) INTO vocab_count FROM search_vocabulary;
    RAISE NOTICE 'S151 verify: search_vocabulary rows = %', vocab_count;
    IF vocab_count < 5000 THEN
        RAISE EXCEPTION
            'S151 verify: expected >= 5000 vocabulary rows, got %. '
            'ts_stat seed likely failed.',
            vocab_count;
    END IF;

    -- Spot-check that load-bearing lexemes the search engine needs
    -- are actually present.
    SELECT EXISTS (SELECT 1 FROM search_vocabulary WHERE lexeme = 'synagogu')
      INTO has_synagogue;
    SELECT EXISTS (SELECT 1 FROM search_vocabulary WHERE lexeme = 'righteous')
      INTO has_righteous;
    SELECT EXISTS (SELECT 1 FROM search_vocabulary WHERE lexeme = 'yahuah')
      INTO has_yahuah;
    RAISE NOTICE
        'S151 verify spot-check: synagogu=% righteous=% yahuah=%',
        has_synagogue, has_righteous, has_yahuah;
    IF NOT has_synagogue THEN
        RAISE EXCEPTION 'S151 verify: synagogue not in vocabulary';
    END IF;
    IF NOT has_righteous THEN
        RAISE EXCEPTION 'S151 verify: righteous not in vocabulary';
    END IF;
    IF NOT has_yahuah THEN
        RAISE EXCEPTION 'S151 verify: yahuah not in vocabulary';
    END IF;

    -- Confirm the trgm index exists — without it, the API's % operator
    -- lookup would seq-scan and blow the perf budget.
    SELECT EXISTS (
        SELECT 1 FROM pg_indexes
         WHERE schemaname = 'public'
           AND indexname = 'idx_search_vocab_trgm'
    ) INTO index_exists;
    RAISE NOTICE 'S151 verify: idx_search_vocab_trgm exists = %', index_exists;
    IF NOT index_exists THEN
        RAISE EXCEPTION 'S151 verify: trgm index missing';
    END IF;
END
$verify$;


-- ---------------------------------------------------------------------
-- 6. Bump schema_version.
-- ---------------------------------------------------------------------
UPDATE schema_version
   SET version   = '1.0.0-phase4-session151',
       landed_at = now(),
       notes     = 'Search engine v2.1 — search_vocabulary materialized from ts_stat over verses.text_tsv + GIN trigram index. Powers token-level fuzzy expansion in api/main.py:_expand_fuzzy (per-query pg_trgm.similarity_threshold = 0.3). Closes the synagauge → synagogue gap from S150. Concept layer also seeded in the sibling session151_concept_groups.sql migration.'
 WHERE id = 1;

COMMIT;

\echo 'Session 151 search_vocabulary migration complete.'
