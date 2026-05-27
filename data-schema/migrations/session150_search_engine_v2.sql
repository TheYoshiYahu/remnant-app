-- =====================================================================
-- Session 150 migration — Search Engine v2 (synonym + fuzzy layers)
-- 2026-05-27
-- =====================================================================
-- Part B of the S149/S150 wheel. Part A (canon modernization in-place
-- UPDATE) landed earlier this session as schema_version
-- '1.0.0-phase4-session149'. Part B builds the profound search engine
-- the S149 checkpoint laid out.
--
-- Three layers (search-only; the display layer is untouched):
--   1. Synonym layer (token-level). Search "Jehovah" or "Yahweh" lands
--      on Yahuah. Search "Yeshua" lands on Yahusha. Search "tzaddik"
--      lands on tsaddiq / righteous / just. The framework's posture
--      toward the deceived — they were handed this; the deception is
--      not their fault — applies to discovery: meet readers with the
--      vocabulary they were taught; the text on the page brings them
--      home in the restored Sacred Names form.
--   2. Fuzzy-spelling layer (pg_trgm word_similarity). Search
--      "synagauge" lands on "synagogue". No table needed — the
--      existing idx_verses_text_trgm index (gin_trgm_ops) backs the
--      <% operator at query time.
--   3. Concept layer (DEFERRED to S151+). The
--      search_expansion_groups table includes kind='concept' so
--      curated phrase-linking (synagogue of Satan ↔ sons of Belial,
--      etc.) can land without further migration. S150 ships
--      kind='synonym' rows only.
--
-- Design record for the synonym groups and the concept layer:
-- _scratch/_session150_search_synonyms.md.
--
-- This migration:
--   * Adds verses.text_tsv (tsvector GENERATED ALWAYS AS
--     to_tsvector('english', text) STORED). The GENERATED column
--     populates automatically for every existing verse on column
--     creation — no separate UPDATE pass needed.
--   * Creates a GIN index on verses.text_tsv.
--   * Creates search_expansion_groups + search_expansion_terms.
--   * Seeds 15 synonym groups (~65 variants total) covering the
--     restored sacred names, the covenant people-names, righteousness,
--     shalom, Torah, Sabbath, Melek Tsadiq, and Adam.
--   * Bumps schema_version to '1.0.0-phase4-session150'.
--
-- Run via:
--   cd ~/Desktop/App
--   python3 _scratch/_s150b_apply_and_verify.py
-- (Wrapper script with pre/post snapshot, retry on Render handshake
-- flap, IP-allowlist diagnostic — same harness as Part A.)
--
-- Single transaction; verification DO-block at the end raises if
-- text_tsv is null on any verse or if the expansion seed counts
-- don't match expected.
-- =====================================================================

\echo 'Session 150 migration starting — search engine v2 (synonym + fuzzy)...'

BEGIN;

-- ---------------------------------------------------------------------
-- 1. verses.text_tsv — the tsvector generated column.
-- ---------------------------------------------------------------------
-- GENERATED ALWAYS AS ... STORED populates immediately for every
-- existing row at ALTER TABLE time. No backfill pass required.
-- 'english' config: stemming maps falls/falling/fell -> fall, so the
-- post-Part-A modernized text now stems where pre-Part-A's "falleth"
-- did not. Sacred names and Hebrew forms pass through unchanged
-- (treated as non-English lexemes by the parser).
ALTER TABLE verses
    ADD COLUMN text_tsv tsvector
        GENERATED ALWAYS AS (to_tsvector('english', text)) STORED;

CREATE INDEX idx_verses_text_tsv ON verses USING gin (text_tsv);

COMMENT ON COLUMN verses.text_tsv IS
    'S150 — tsvector generated from text via to_tsvector(''english'', text). Powers the v2 search engine''s ts_rank ordering and synonym-expanded to_tsquery matching. STORED so the value persists on disk; index-backed by idx_verses_text_tsv (GIN). Stays in sync automatically on any verses.text UPDATE.';


-- ---------------------------------------------------------------------
-- 2. search_expansion_groups + search_expansion_terms — unified
-- storage for the synonym and concept layers.
-- ---------------------------------------------------------------------
-- The 'kind' discriminator separates token-level synonyms (single
-- words) from phrase-level concepts (multi-word). S150 ships
-- kind='synonym' rows only; kind='concept' is reserved for S151+
-- when Yoshi names the framework's curated phrase-linkings.
CREATE TABLE search_expansion_groups (
    id              SERIAL PRIMARY KEY,
    kind            TEXT NOT NULL
                        CHECK (kind IN ('synonym', 'concept')),
    label           TEXT NOT NULL,
    notes           TEXT,
    UNIQUE (kind, label)
);

COMMENT ON TABLE search_expansion_groups IS
    'S150 search engine v2 — expansion groups. kind=''synonym'' groups carry single-token variants (Yahuah, Yahweh, Jehovah, LORD, ...) the search engine OR-expands at query time. kind=''concept'' groups (deferred to S151+) carry multi-word phrases the framework reads as one theological reality (synagogue of Satan, sons of Belial, ...) the search engine surfaces together.';

CREATE TABLE search_expansion_terms (
    group_id        INT NOT NULL
                        REFERENCES search_expansion_groups(id)
                        ON DELETE CASCADE,
    term            TEXT NOT NULL,
    is_phrase       BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (group_id, term)
);

CREATE INDEX idx_expansion_term_lower
    ON search_expansion_terms (LOWER(term));

COMMENT ON TABLE search_expansion_terms IS
    'S150 search engine v2 — terms in each expansion group. is_phrase=false for single-token synonyms (S150 ships these); is_phrase=true for multi-word concept phrases (S151+).';


-- ---------------------------------------------------------------------
-- 3. Seed synonym groups + variants.
-- ---------------------------------------------------------------------
-- Each group is one theological / linguistic identity rendered in
-- multiple variants the user might type. Source of truth for the
-- groupings: _scratch/_session150_search_synonyms.md.

-- Group 1 — Yahuah (the Father's name) and its variants.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'yahuah',
            'Divine name of the Father. Restored body text uses Yahuah; '
            'search-layer accepts all common variants (false-name '
            'misvocalizations + alternate transliterations) so readers '
            'who learned different forms can still land on the right verses.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Yahuah'),
    ('Yah'),
    ('LORD'),
    ('Lord'),
    ('Yahweh'),
    ('Jehovah'),
    ('YHWH'),
    ('YHVH'),
    ('Jah'),
    ('Hashem'),
    ('Adonai')
  ) AS t(term);

-- Group 2 — Yahusha (the Messianic name) and its variants.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'yahusha',
            'Messianic name. Restored body text uses Yahusha; search-layer '
            'accepts common variants. Joshua deliberately excluded — too '
            'ambiguous with Joshua son of Nun (especially in Apocrypha).')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Yahusha'),
    ('Jesus'),
    ('Yahshua'),
    ('Yeshua'),
    ('Yehoshua'),
    ('Iesus'),
    ('Iesous')
  ) AS t(term);

-- Group 3 — Elohim (the title) and its variants.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'elohim',
            'Title for the Most High. "El" excluded — too short, '
            'false-positive risk against English/Spanish "el".')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Elohim'),
    ('God'),
    ('Eloah')
  ) AS t(term);

-- Group 4 — Messiah / Christ.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'messiah', 'Anointed one. The Messianic title.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Messiah'),
    ('Christ'),
    ('HaMashiach'),
    ('Mashiach'),
    ('Moshiach'),
    ('Anointed')
  ) AS t(term);

-- Group 5 — Ruach / Spirit (single-token only for v2.0; phrase
-- pair Holy Spirit ↔ Ruach HaKodesh deferred to v2.1).
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'ruach',
            'The Spirit. Phrase pair "Holy Spirit" ↔ "Ruach HaKodesh" '
            'deferred to v2.1 (phrase synonyms need different plumbing).')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Ruach'),
    ('Spirit'),
    ('Ghost')
  ) AS t(term);

-- Group 6 — Yashar'el / Israel and variants.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'yasharel', 'The covenant people-name.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Yashar''el'),
    ('Israel'),
    ('Yisrael'),
    ('Yisroel')
  ) AS t(term);

-- Group 7 — Yahudah / Judah and variants.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'yahudah', 'The southern house and personal name.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Yahudah'),
    ('Judah'),
    ('Yehudah'),
    ('Yuda')
  ) AS t(term);

-- Group 8 — Yahudim / Jews.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'yahudim',
            'Plural — the people of the house of Yahudah as a group. '
            '"Jewish" included because that''s the adjective form users '
            'will type even though it carries a slightly different surface.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Yahudim'),
    ('Jews'),
    ('Yehudim'),
    ('Jewish')
  ) AS t(term);

-- Group 9 — Yahudi / Jew (singular noun).
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'yahudi', 'Singular noun form.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Yahudi'),
    ('Jew')
  ) AS t(term);

-- Group 10 — tsaddiq / righteous / just (the S149 cornerstone).
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'tsaddiq',
            'The S149 cornerstone identity restored across Proverbs 24:16 '
            'and the four NT echoes. English-stemmer collapses "righteous" '
            'and "just" to overlapping forms; the Hebrew variants get '
            'caught here.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('righteous'),
    ('just'),
    ('tsaddiq'),
    ('tzaddik'),
    ('zaddik')
  ) AS t(term);

-- Group 11 — shalom / peace / shalum.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'shalom',
            'Peace. Shalum is a common phonetic variant.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('shalom'),
    ('peace'),
    ('shalum')
  ) AS t(term);

-- Group 12 — Torah.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'torah',
            'Torah / Law. Including "law" widens the result set but '
            'serves the reader who searches with English vocabulary '
            'hoping for the Torah context.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Torah'),
    ('Law'),
    ('Torot')
  ) AS t(term);

-- Group 13 — Sabbath.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'sabbath',
            'Sabbath / Shabbat. Yiddish "Shabbos" included.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Sabbath'),
    ('Shabbat'),
    ('Shabbos')
  ) AS t(term);

-- Group 14 — Melek Tsadiq / Melchizedek.
-- The compound phrase "Melek Tsadiq" deferred to v2.1; this group
-- catches the various spellings of Melchizedek and the Hebrew root
-- tsadiq (already in Group 10 — multi-group membership is fine).
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'melchizedek',
            'The priest-king of Salem. KJV variant spellings.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Melchizedek'),
    ('Melchisedec'),
    ('Melchisedech'),
    ('Melchizedec')
  ) AS t(term);

-- Group 15 — Adam.
-- The phrase pair son of Adam ↔ son of man deferred to v2.1.
-- This single-token group exists mostly as a placeholder so when
-- v2.1 lands, the phrase variants can attach to the same group.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('synonym', 'adam',
            'Placeholder — phrase pair "son of Adam" ↔ "son of man" '
            'deferred to v2.1 when phrase synonyms land.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, false
  FROM g, (VALUES
    ('Adam')
  ) AS t(term);


-- ---------------------------------------------------------------------
-- 4. Verify everything landed.
-- ---------------------------------------------------------------------
DO $verify$
DECLARE
    null_tsv_count    INT;
    total_verses      INT;
    syn_group_count   INT;
    syn_term_count    INT;
BEGIN
    -- text_tsv must be populated for every verse.
    SELECT count(*), count(*) FILTER (WHERE text_tsv IS NULL)
      INTO total_verses, null_tsv_count
      FROM verses;
    RAISE NOTICE 'S150 verify: verses=% null_tsv=%', total_verses, null_tsv_count;
    IF null_tsv_count > 0 THEN
        RAISE EXCEPTION 'S150 verify: % verses have NULL text_tsv', null_tsv_count;
    END IF;

    -- Synonym group + term counts must match seed expectations.
    SELECT count(*) INTO syn_group_count
      FROM search_expansion_groups WHERE kind = 'synonym';
    SELECT count(*) INTO syn_term_count
      FROM search_expansion_terms et
      JOIN search_expansion_groups g ON g.id = et.group_id
      WHERE g.kind = 'synonym';
    RAISE NOTICE 'S150 verify: synonym groups=% terms=%',
        syn_group_count, syn_term_count;
    IF syn_group_count <> 15 THEN
        RAISE EXCEPTION
            'S150 verify: expected 15 synonym groups, got %',
            syn_group_count;
    END IF;
    -- Total variant count across the 15 groups:
    -- 11+7+3+6+3+4+4+4+2+5+3+3+3+4+1 = 63
    IF syn_term_count <> 63 THEN
        RAISE EXCEPTION
            'S150 verify: expected 63 synonym terms, got %',
            syn_term_count;
    END IF;
END
$verify$;

-- ---------------------------------------------------------------------
-- 5. Bump schema_version.
-- ---------------------------------------------------------------------
UPDATE schema_version
   SET version   = '1.0.0-phase4-session150',
       landed_at = now(),
       notes     = 'Search engine v2 — verses.text_tsv generated column + GIN index + search_expansion_groups/search_expansion_terms (15 synonym groups, 63 variants). Concept layer (kind=''concept'' rows) deferred to S151+.'
 WHERE id = 1;

COMMIT;

\echo 'Session 150 migration complete.'
