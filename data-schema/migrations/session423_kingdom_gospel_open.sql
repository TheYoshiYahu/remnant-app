-- =====================================================================
-- Session 423 — Kingdom Gospel: open the body to any signed-in account
-- =====================================================================
-- LAUNCH HOTFIX. The Kingdom Gospel teaching body is served by
--   GET /v1/teachings/{slug}/body   (api/main.py get_teaching_body)
-- which requires a valid JWT and then gates the row's tier_required through
-- tier_satisfies(user_tier, tier_required). Session 421 seeded the row at
-- tier_required = 'everything' (the strict-chain top), so ONLY an entitled
-- caller could open it. Member-tier recognition is currently broken, which
-- locked existing members out of a teaching we want live for a launch video.
--
-- This lowers the row to tier_required = 'free'. Because
-- tier_satisfies(anytier, 'free') = TRUE (free = rank 0, every tier ranks >= 0),
-- the endpoint now serves the body to ANY authenticated caller — but the JWT
-- requirement (get_current_user_required) is unchanged, so an anonymous /
-- not-signed-in caller still gets 401 and never receives the body. That is the
-- intent: "any signed-in ACCOUNT," not anonymous.
--
-- Pairs with the client change in app/src/lib/teachings/content.ts (the
-- kingdom-gospel entry's tier_required "everything" -> "free") so the client
-- reveal and the server gate agree. The body stays server-fetched — it is NOT
-- inlined into the client bundle by either change.
--
-- Idempotent + safe to re-run via the Render remnant-app-api Shell (cwd /app):
--   python3 apply_migration.py /data-schema/migrations/session423_kingdom_gospel_open.sql
-- A bare UPDATE is naturally idempotent (re-running sets the same value); the
-- schema_version stamp is an idempotent overwrite. Exactly one trailing COMMIT;
-- so apply_migration.py --dry-run works too.
-- =====================================================================

\echo 'session423 — opening kingdom-gospel body to any signed-in account...'
BEGIN;

-- Lower the gate. If the row is absent (session421 not yet applied) this is a
-- no-op zero-row UPDATE — the client change is harmless on its own and the row
-- will be seeded at 'free' by re-running session421 once it carries this value;
-- either way the endpoint never serves a body it does not have.
UPDATE teaching_bodies
   SET tier_required = 'free',
       updated_at    = now()
 WHERE slug = 'kingdom-gospel';

-- Schema version stamp. Idempotent overwrite.
UPDATE schema_version
   SET version   = '1.0.0-phase4-session423',
       notes     = 'Session 423 (2026-07-11) — kingdom-gospel teaching_bodies row lowered tier_required everything -> free (launch hotfix). GET /v1/teachings/kingdom-gospel/body still requires a JWT (get_current_user_required) but now satisfies any tier; anonymous callers still 401. Pairs with the client content.ts tier_required change.',
       landed_at = now()
 WHERE id = 1;

COMMIT;
\echo 'session423 — done.'
