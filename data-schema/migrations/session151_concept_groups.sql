-- =====================================================================
-- Session 151 migration — Concept-layer seed (kind='concept' rows)
-- 2026-05-27
-- =====================================================================
-- Sibling migration to session151_search_vocabulary.sql. This file
-- seeds the first two concept groups Yoshi has named — the
-- search_expansion_groups schema was created at S150 with the
-- kind='concept' discriminator reserved for exactly this work.
--
-- Each concept group is a framework call — phrases the framework
-- reads as one theological reality. The search engine surfaces all
-- verses matching any phrase in the group when the user's query
-- contains any other phrase in the group. Curated by Yoshi; named
-- in S151.
--
-- Two groups landing at S151:
--
--   1. synagogue-of-Satan / sons-of-Belial
--      The "synagogue of Satan" of Revelation 2:9 and 3:9 and the
--      Tanakh's repeated "sons of Belial" name the same group — the
--      counterfeit-within-the-covenant, the tares woven in. Searching
--      for either phrase should surface all the witnesses to one
--      diagnostic.
--
--   2. the seed war
--      Genesis 6 + Matthew 13 + Revelation diagnostic. The watchers
--      seeded their lineage into the covenant; the tares grow alongside
--      the wheat until the harvest; the synagogue of Satan and the sons
--      of Belial are the same counterfeit lineage in different
--      costumes; the serpent's seed and the sons of the wicked one
--      name the same persistent lineage across the canon.
--
-- The phrases "synagogue of Satan" and "sons of Belial" deliberately
-- appear in both groups — the framework reads the diagnostics as
-- overlapping. A user searching either phrase gets the union of all
-- linked phrases across both groups. The PK (group_id, term) allows
-- the same term in multiple groups via distinct group_id.
--
-- No schema_version bump — the schema is unchanged from S150's
-- session150_search_engine_v2.sql; this file only seeds rows. The
-- bump in the sibling session151_search_vocabulary.sql migration
-- carries S151's version label for both.
--
-- API change consuming these rows: api/main.py _expand_concepts
-- helper wired into search_verses.
-- =====================================================================

\echo 'Session 151 migration starting — concept-layer seed...'

BEGIN;

-- ---------------------------------------------------------------------
-- Group 1 — synagogue-of-Satan / sons-of-Belial
-- ---------------------------------------------------------------------
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('concept', 'synagogue-of-satan-sons-of-belial',
            'Revelation 2:9 + 3:9''s "synagogue of Satan" and the Tanakh''s '
            'repeated "sons of Belial" name the same group in the framework''s '
            'reading — the counterfeit-within-the-covenant, the tares woven in. '
            'Searching either phrase surfaces all the witnesses to one diagnostic. '
            'Curated by Yoshi at S151. Add/remove phrases as the framework calls.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, true
  FROM g, (VALUES
    ('synagogue of Satan'),
    ('sons of Belial'),
    ('son of Belial'),
    ('children of Belial'),
    ('daughter of Belial'),
    ('man of Belial')
  ) AS t(term);


-- ---------------------------------------------------------------------
-- Group 2 — the seed war
-- ---------------------------------------------------------------------
-- Watchers and tares are single tokens (is_phrase=false); the rest
-- are multi-word phrases (is_phrase=true). The single-token entries
-- and the phrase entries get distinct matching paths in the API —
-- single tokens match via tsquery the same way synonyms do; phrases
-- match via literal case-insensitive substring against verses.text.
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('concept', 'seed-war',
            'Genesis 6 + Matthew 13 + Revelation diagnostic. The watchers '
            'seeded their lineage into the covenant; the tares grow alongside '
            'the wheat until the harvest; the synagogue of Satan and the sons '
            'of Belial are the same counterfeit lineage in different costumes; '
            'the serpent''s seed and the sons of the wicked one name the same '
            'persistent lineage across the canon. Curated by Yoshi at S151.')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, t.is_phrase
  FROM g, (VALUES
    ('watchers',                  false),
    ('tares',                     false),
    ('synagogue of Satan',         true),
    ('sons of Belial',             true),
    ('serpent''s seed',            true),
    ('sons of the wicked one',     true)
  ) AS t(term, is_phrase);


-- ---------------------------------------------------------------------
-- Verify.
-- ---------------------------------------------------------------------
DO $verify$
DECLARE
    concept_group_count   INT;
    concept_term_count    INT;
    belial_group_id       INT;
    seed_war_group_id     INT;
BEGIN
    SELECT count(*) INTO concept_group_count
      FROM search_expansion_groups WHERE kind = 'concept';
    SELECT count(*) INTO concept_term_count
      FROM search_expansion_terms et
      JOIN search_expansion_groups g ON g.id = et.group_id
      WHERE g.kind = 'concept';
    RAISE NOTICE 'S151 verify: concept groups=% terms=%',
        concept_group_count, concept_term_count;

    IF concept_group_count <> 2 THEN
        RAISE EXCEPTION
            'S151 verify: expected 2 concept groups, got %',
            concept_group_count;
    END IF;
    -- 6 phrases in group 1 + 6 entries in group 2 (2 single tokens
    -- + 4 phrases) = 12 total.
    IF concept_term_count <> 12 THEN
        RAISE EXCEPTION
            'S151 verify: expected 12 concept terms, got %',
            concept_term_count;
    END IF;

    -- Spot-check the load-bearing rows.
    SELECT id INTO belial_group_id
      FROM search_expansion_groups
      WHERE kind = 'concept' AND label = 'synagogue-of-satan-sons-of-belial';
    SELECT id INTO seed_war_group_id
      FROM search_expansion_groups
      WHERE kind = 'concept' AND label = 'seed-war';
    IF belial_group_id IS NULL THEN
        RAISE EXCEPTION 'S151 verify: synagogue-of-satan-sons-of-belial group missing';
    END IF;
    IF seed_war_group_id IS NULL THEN
        RAISE EXCEPTION 'S151 verify: seed-war group missing';
    END IF;
END
$verify$;

COMMIT;

\echo 'Session 151 concept-groups migration complete.'
