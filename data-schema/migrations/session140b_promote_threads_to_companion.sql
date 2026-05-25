-- =====================================================================
-- Session 140b — Promote extras-tier framework threads to Companion tier
-- =====================================================================
-- Tier split locked at S140: the two-layer chapter-end card architecture
-- gets two different tier_required values per layer. Layer 1 (per-verse
-- cross_references) stays at 'extras' (Library tier, $4.99) — the
-- Library reader who unlocked the extras-library editions sees the
-- verse-to-verse pairings pointing into those editions. Layer 2
-- (cross_reference_threads) moves to 'complete_study' (Companion tier,
-- $9.99) — the framework thread callouts with title + summary_md +
-- member_notes are Yoshi's reading of how canon and library answer
-- each other, which is the framework synthesis Companion is the
-- upgrade for.
--
-- The thread-member join rows (cross_reference_thread_members) carry
-- no tier_required column of their own — the join's effective tier is
-- the higher of (thread.tier_required, cross_reference.tier_required).
-- Since the contract's threads query filters by t.tier_required and
-- the baseline query filters by x.tier_required separately, the two
-- layers gate independently. A Library reader sees baseline rows; the
-- thread callout that GROUPS those same rows under a framework-bearing
-- title and walks the architecture is what they're paying Companion
-- for.
--
-- This migration retroactively applies the tier split to all S131-S139
-- extras-tier threads already applied to Render Postgres (Matt 1-10
-- cumulative: 71 threads). The new S140 file (Matt 11 — 11 threads)
-- ships with thread tier_required already set to 'complete_study' at
-- the INSERT level so this fix-up only needs to handle the prior
-- migrations' data. Idempotent: WHERE clause restricts to threads
-- still at 'extras'; re-running is a no-op.
--
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session140b_promote_threads_to_companion.sql
-- =====================================================================

\echo 'Session 140b — promoting extras-tier framework threads to Companion tier...'
BEGIN;

-- Promote every framework thread currently at 'extras' to 'complete_study'.
-- Scoped narrowly: only rows whose current tier_required is 'extras'. The
-- two free-tier threads (Kingdom Gospel + Grace That Can Be Lost), and
-- the S73-S74 'free'-tier seed threads, are untouched.
UPDATE cross_reference_threads
   SET tier_required = 'complete_study'::content_tier
 WHERE tier_required = 'extras'::content_tier;

-- Per-verse cross_references stay at 'extras' — Layer 1 visibility for
-- Library tier readers is preserved. Explicit no-op for clarity:
--   SELECT 1 FROM cross_references WHERE tier_required = 'extras';

-- Verification echo: how many threads ended up at Companion, how many
-- cross_references rows still at Library.
\echo 'Verification:'
SELECT 'threads at complete_study (Companion)' AS layer, COUNT(*)::TEXT AS count
  FROM cross_reference_threads
 WHERE tier_required = 'complete_study'::content_tier
UNION ALL
SELECT 'threads still at extras (Library)' AS layer, COUNT(*)::TEXT AS count
  FROM cross_reference_threads
 WHERE tier_required = 'extras'::content_tier
UNION ALL
SELECT 'cross_references at extras (Library)' AS layer, COUNT(*)::TEXT AS count
  FROM cross_references
 WHERE tier_required = 'extras'::content_tier;

COMMIT;

\echo 'Session 140b — complete.'
\echo '  Layer 1 (per-verse cross-references) stays at Library tier.'
\echo '  Layer 2 (framework thread callouts) now at Companion tier.'
