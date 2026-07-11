-- =====================================================================
-- Session 423 — Kingdom Gospel: gate at 'extras' (mirror the apocrypha)
-- =====================================================================
-- LAUNCH HOTFIX. The Kingdom Gospel teaching body is served by
--   GET /v1/teachings/{slug}/body   (api/main.py get_teaching_body)
-- which requires a valid JWT and then gates the row's tier_required through
-- tier_satisfies(user_tier, tier_required). Session 421 seeded the row at
-- tier_required = 'everything' (the strict-chain top), so — with member-tier
-- recognition currently unreliable — it was stricter than the extra-canonical
-- (apocrypha) books and blocked members it should admit.
--
-- This lowers the row to tier_required = 'extras', the SAME tier the
-- extra-canonical books (Enoch, Jubilees, Jasher, the pseudepigrapha, Josephus,
-- the wider Cepher catalog) carry. Result via tier_satisfies:
--   * free (rank 0)            -> BLOCKED (extras is rank 2)
--   * 7-day everything-trial   -> PASSES (trialing resolves to 'everything')
--   * paid 'extras' and above  -> RECOGNIZED
-- The JWT requirement (get_current_user_required) is unchanged, so an anonymous
-- / not-signed-in caller still gets 401. This makes the teaching recognize
-- members / trials / paid EXACTLY like the apocrypha books do.
--
-- Pairs with the client change in app/src/lib/teachings/content.ts (the
-- kingdom-gospel entry's tier_required "everything" -> "extras") so the client
-- reveal and the server gate agree. The body stays server-fetched — it is NOT
-- inlined into the client bundle by either change.
--
-- Idempotent + safe to re-run via the Render remnant-app-api Shell (cwd /app):
--   python3 apply_migration.py /data-schema/migrations/session423_kingdom_gospel_open.sql
-- A bare UPDATE is naturally idempotent (re-running sets the same value); the
-- schema_version stamp is an idempotent overwrite. Exactly one trailing COMMIT;
-- so apply_migration.py --dry-run works too.
-- =====================================================================

\echo 'session423 — gating kingdom-gospel at extras (mirror the apocrypha)...'
BEGIN;

-- Lower the gate to 'extras'. If the row is absent (session421 not yet applied)
-- this is a no-op zero-row UPDATE — the client change is harmless on its own and
-- the endpoint never serves a body it does not have.
UPDATE teaching_bodies
   SET tier_required = 'extras',
       updated_at    = now()
 WHERE slug = 'kingdom-gospel';

-- Schema version stamp. Idempotent overwrite.
UPDATE schema_version
   SET version   = '1.0.0-phase4-session423',
       notes     = 'Session 423 (2026-07-11) — kingdom-gospel teaching_bodies row lowered tier_required everything -> extras (launch hotfix), matching the extra-canonical/apocrypha books. GET /v1/teachings/kingdom-gospel/body still requires a JWT (get_current_user_required); tier_satisfies gates it so free is blocked, the everything-trial passes, and paid extras-and-above are recognized; anonymous callers still 401. Pairs with the client content.ts tier_required change.',
       landed_at = now()
 WHERE id = 1;

COMMIT;
\echo 'session423 — done.'
