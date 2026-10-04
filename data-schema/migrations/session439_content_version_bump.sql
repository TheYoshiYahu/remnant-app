-- =====================================================================
-- Session 439 — bump schema_version so every app purges its cached content
-- and refetches. Sessions 435a, 435b, 436, 437 and 438 changed cards and
-- Enoch 91–93 but did not bump the version, so clients kept stale caches
-- (/v1/content-version is RENDER_GIT_COMMIT + schema_version).
-- Rule going forward: every content migration ends with a schema_version bump.
-- =====================================================================
\echo 'session439 — bumping schema_version...'
BEGIN;
UPDATE schema_version
   SET version   = '1.0.0-phase4-session439',
       landed_at = now(),
       notes     = 'Session 439 (2026-10-03) — content-version bump after S435a/S435b (order-of-the-end card corrections), S436 (new witness cards), S437 (removed 1 Thess 4:17 -> Matthew 24:31), S438 (Enoch 91-93 rebuilt to Charles). Prior version: 1.0.0-phase4-session423.'
 WHERE id = 1;
COMMIT;
SELECT * FROM schema_version;
