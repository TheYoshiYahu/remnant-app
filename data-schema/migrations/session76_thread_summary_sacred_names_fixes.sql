-- =====================================================================
-- Session 76 migration — 2026-05-18
-- =====================================================================
-- Sacred Names compliance fixes on two `cross_reference_threads.summary_md`
-- strings seeded at Session 74. Caught at the S76 audit-pass (framework-
-- lens review against the S65–S74 shipped artifacts under the loaded
-- voice skill — the audit the voice-skill-not-actually-loaded span of
-- prior sessions did not catch).
--
-- Two corrections:
--
--   1. `grace-from-names-sake` thread — Deuteronomy 9:6 quotation
--      The seeded string renders the KJV phrase "the LORD thy God" as
--      `Yahuah (the LORD) thy Elohim (God)`, splitting the compound
--      across two single-name restorations. The Sacred Names compound
--      rule (Session 54 construct expansion, pipeline-enforced) fires
--      on the intact English phrase and produces the Hebrew construct
--      chain: `Yahuah Elohayka (the LORD thy God)` — 2nd-person-singular
--      possessive form. Longer phrases win; the compound fires before
--      the singles. This update applies the compound rule to the
--      already-seeded text.
--
--   2. `false-inclusion-rebuttal` thread — Romans 11:23 quotation
--      The seeded string renders Romans 11:23 as `Yahuah (the LORD)
--      is able to graft them in again`. The KJV source for Romans
--      11:23 reads `God is able to graff them in again` (mixed-case
--      `God`, not small-caps `LORD`). The Sacred Names convention
--      requires the parenthetical to echo what the source actually
--      said — so the source signal `God` fires the single rule
--      `Elohim (God)`, not `Yahuah (the LORD)`. The voice skill is
--      explicit: "parenthetical echoes exactly what the source said."
--      This update corrects the restoration to match the source.
--
-- Both errors traced to drafting under the framework lens without the
-- voice skill loaded as a Skill-tool invocation — the audit S75 caught
-- and surfaced. The structural fix to prevent recurrence is the
-- handoff-template + session-open-prompt directive landed at S75 close.
-- These two strings are the residue.
--
-- Idempotent: `REPLACE(text, search, replacement)` on a string that no
-- longer contains the search pattern returns the string unchanged.
-- Re-running produces zero net change after the first apply.
--
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session76_thread_summary_sacred_names_fixes.sql
-- =====================================================================

\echo 'Session 76 migration starting...'

BEGIN;

-- ---------------------------------------------------------------------
-- 1. Fix Deuteronomy 9:6 compound name in grace-from-names-sake.
-- ---------------------------------------------------------------------
UPDATE cross_reference_threads
   SET summary_md = REPLACE(
       summary_md,
       'Yahuah (the LORD) thy Elohim (God)',
       'Yahuah Elohayka (the LORD thy God)'
   )
 WHERE slug = 'grace-from-names-sake';

-- ---------------------------------------------------------------------
-- 2. Fix Romans 11:23 source-echo in false-inclusion-rebuttal.
-- ---------------------------------------------------------------------
UPDATE cross_reference_threads
   SET summary_md = REPLACE(
       summary_md,
       'Yahuah (the LORD) is able to graft them in again',
       'Elohim (God) is able to graft them in again'
   )
 WHERE slug = 'false-inclusion-rebuttal';

-- ---------------------------------------------------------------------
-- 3. Bump schema_version.
-- ---------------------------------------------------------------------
UPDATE schema_version
   SET version   = '1.0.0-phase4-session76',
       landed_at = now(),
       notes     = 'Session 76 (2026-05-18) — Sacred Names compliance fixes on two cross_reference_threads.summary_md strings seeded at S74. (1) grace-from-names-sake: Deuteronomy 9:6 quotation — "Yahuah (the LORD) thy Elohim (God)" → "Yahuah Elohayka (the LORD thy God)" (compound rule fires on the intact "the LORD thy God" phrase). (2) false-inclusion-rebuttal: Romans 11:23 quotation — "Yahuah (the LORD) is able to graft them in again" → "Elohim (God) is able to graft them in again" (source-echo: KJV says "God", not "LORD"). Both caught at the S76 audit-pass under the loaded voice skill — residue from the no-skill-loaded span of prior sessions, structural fix already landed at S75 close (handoff-template + session-open-prompt directive). Prior version: 1.0.0-phase4-session74.'
 WHERE id = 1;

COMMIT;

\echo 'Session 76 migration committed. Verifying...'

-- =====================================================================
-- Verification queries (read-only)
-- =====================================================================

\echo ''
\echo '--- Verify 1: grace-from-names-sake summary_md contains the compound form ---'
SELECT
    slug,
    POSITION('Yahuah Elohayka (the LORD thy God)' IN summary_md) > 0 AS compound_present,
    POSITION('Yahuah (the LORD) thy Elohim (God)' IN summary_md) AS old_form_still_present_should_be_zero
  FROM cross_reference_threads
 WHERE slug = 'grace-from-names-sake';

\echo ''
\echo '--- Verify 2: false-inclusion-rebuttal summary_md uses source-echo Elohim (God) for Romans 11:23 ---'
SELECT
    slug,
    POSITION('Elohim (God) is able to graft them in again' IN summary_md) > 0 AS corrected_present,
    POSITION('Yahuah (the LORD) is able to graft them in again' IN summary_md) AS old_form_still_present_should_be_zero
  FROM cross_reference_threads
 WHERE slug = 'false-inclusion-rebuttal';

\echo ''
\echo '--- Verify 3: schema_version current ---'
SELECT * FROM schema_version;

\echo ''
\echo 'Session 76 migration complete.'
