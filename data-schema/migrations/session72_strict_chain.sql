-- =====================================================================
-- Session 72 migration — 2026-05-17
-- =====================================================================
-- Tier lattice flipped from bifurcated (study_notes and extras as
-- siblings, complete_study as their join) to a strict chain
-- (free < study_notes < extras < complete_study < everything). Closes
-- the S54 sub-question on $1.99 tier wiring (standing since S43):
-- $1.99 plugs into the existing study_notes enum value, user-facing
-- label "Notes" per Q21. KJV-1611 Apocrypha (14 books, edition slug
-- 'apocrypha') re-tiered from 'extras' to 'study_notes' so the strict
-- chain inherits it into every paid tier.
--
-- Idempotent: re-running is safe. CREATE OR REPLACE on the function,
-- UPDATE-with-WHERE on the books and schema_version rows.
--
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session72_strict_chain.sql
-- =====================================================================

\echo 'Session 72 migration starting...'

BEGIN;

-- 1. Rewrite tier_satisfies() with the strict-chain rank comparison.
CREATE OR REPLACE FUNCTION tier_satisfies(user_tier content_tier, required_tier content_tier)
RETURNS BOOLEAN
LANGUAGE SQL
IMMUTABLE
AS $$
    SELECT (
        CASE user_tier
            WHEN 'free'           THEN 0
            WHEN 'study_notes'    THEN 1
            WHEN 'extras'         THEN 2
            WHEN 'complete_study' THEN 3
            WHEN 'everything'     THEN 4
        END
    ) >= (
        CASE required_tier
            WHEN 'free'           THEN 0
            WHEN 'study_notes'    THEN 1
            WHEN 'extras'         THEN 2
            WHEN 'complete_study' THEN 3
            WHEN 'everything'     THEN 4
        END
    );
$$;

COMMENT ON FUNCTION tier_satisfies(content_tier, content_tier) IS
    'Strict-chain tier lattice (locked Session 72, 2026-05-17). Returns TRUE if user_tier ranks at or above required_tier in the chain free < study_notes < extras < complete_study < everything.';

-- 2. Re-tier the 14 KJV-1611 Apocrypha books from 'extras' to 'study_notes'.
UPDATE books
   SET tier_required = 'study_notes'
 WHERE edition_id IN (SELECT id FROM editions WHERE slug = 'apocrypha');

-- 3. Bump schema_version. The table has id=1 as the only row per the CHECK constraint.
UPDATE schema_version
   SET version = '1.0.0-phase4-session72',
       landed_at = now(),
       notes = 'Session 72 (2026-05-17) — tier lattice flipped from bifurcated (study_notes and extras as siblings, complete_study as their join) to a strict chain (free < study_notes < extras < complete_study < everything). Closes the S54 sub-question on $1.99 tier wiring: $1.99 plugs into the existing study_notes enum value, user-facing label "Notes" per Q21. KJV-1611 Apocrypha (14 books) re-tiered from extras to study_notes. tier_satisfies() rewritten as a rank-comparison. No new enum values; no schema structural change beyond the function body.'
 WHERE id = 1;

COMMIT;

\echo 'Session 72 migration committed. Verifying...'

-- =====================================================================
-- Verification queries (read-only; run automatically after COMMIT)
-- =====================================================================

\echo ''
\echo '--- Verify 1: Apocrypha books at study_notes (expect 14 rows, all study_notes) ---'
SELECT b.title, b.tier_required
  FROM books b
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'apocrypha'
 ORDER BY b.canonical_order;

\echo ''
\echo '--- Verify 2: tier_satisfies strict-chain (TRUE iff user_rank >= required_rank) ---'
SELECT u.tier AS user_tier, r.tier AS required_tier,
       tier_satisfies(u.tier::content_tier, r.tier::content_tier) AS satisfies
  FROM (VALUES ('free'),('study_notes'),('extras'),('complete_study'),('everything')) AS u(tier)
 CROSS JOIN (VALUES ('free'),('study_notes'),('extras'),('complete_study'),('everything')) AS r(tier)
 ORDER BY u.tier, r.tier;

\echo ''
\echo '--- Verify 3: schema_version current ---'
SELECT * FROM schema_version;

\echo ''
\echo 'Session 72 migration complete.'
