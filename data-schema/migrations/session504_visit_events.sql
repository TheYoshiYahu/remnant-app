-- =====================================================================
-- Session 504 (coded S505) migration — THE VISIT COUNTER: raw log of visits + the daily view.
-- Design: S504_VISIT_COUNTER_DESIGN.md. S467's user_activity_days (one row per signed-in person per
-- Central day) already counts signed-in visits; this adds the anonymous reader, the surface (app | walk),
-- a raw log one row per VISIT (not per request), and the view visit_days that puts both side by side.
-- Privacy (S467's rule kept): no IP, no user agent, no cookie, nothing about notes/highlights/search.
-- anon_id is sha256(ANON_SALT + browser UUID) — never the id itself. Reader page only: edition/book/chapter.
-- Idempotent: CREATE TABLE/INDEX IF NOT EXISTS, CREATE OR REPLACE VIEW. Nothing deleted, nothing rewritten.
-- Written on Claude Fable 5.1.
-- Run (paste, from ~/Desktop/App): python3 api/apply_migration.py data-schema/migrations/session504_visit_events.sql
-- =====================================================================
\echo 'session504 — visit_events + visit_days starting...'
BEGIN;

CREATE TABLE IF NOT EXISTS visit_events (
    id        BIGSERIAL PRIMARY KEY,
    ts        TIMESTAMPTZ NOT NULL DEFAULT now(),
    user_id   UUID NULL REFERENCES users(id) ON DELETE SET NULL,   -- signed-in reader (then anon_id is NULL)
    anon_id   TEXT NULL,                                            -- sha256(ANON_SALT + browser UUID); never the raw id
    surface   TEXT NOT NULL CHECK (surface IN ('app','walk')),
    path      TEXT NULL,                                            -- pathname only, never the query string
    edition   TEXT NULL,
    book      TEXT NULL,
    chapter   INT  NULL,
    CHECK (user_id IS NOT NULL OR anon_id IS NOT NULL)
);
CREATE INDEX IF NOT EXISTS idx_visit_events_ts      ON visit_events (ts);
CREATE INDEX IF NOT EXISTS idx_visit_events_user_ts ON visit_events (user_id, ts) WHERE user_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_visit_events_anon_ts ON visit_events (anon_id, ts) WHERE anon_id IS NOT NULL;

COMMENT ON TABLE visit_events IS
  'S504 visit counter. One row per visit (a new visit begins after 30 quiet minutes), signed-in (user_id) or anonymous (anon_id = salted hash, no cookie, no IP). Raw rows kept 400 days (pruned by jobs/trial_reminders.py). Signed-in app visits are ALSO counted in user_activity_days (S467); visit_days reads them from there.';

-- Per Central day and surface. Signed-in APP visits come from user_activity_days (authoritative back to
-- S467b, and the beacon rows for them are deduplicated against it); everything else from visit_events.
CREATE OR REPLACE VIEW visit_days AS
SELECT day, surface,
       count(DISTINCT user_id) FILTER (WHERE user_id IS NOT NULL) AS people,
       count(DISTINCT anon_id) FILTER (WHERE anon_id IS NOT NULL) AS anons,
       sum(visits)::bigint                                          AS visits
  FROM (
        SELECT day, 'app'::text AS surface, user_id, NULL::text AS anon_id, visits
          FROM user_activity_days
        UNION ALL
        SELECT (ts AT TIME ZONE 'America/Chicago')::date, surface, user_id, anon_id, 1
          FROM visit_events
         WHERE NOT (surface = 'app' AND user_id IS NOT NULL)
       ) t
 GROUP BY day, surface;

COMMENT ON VIEW visit_days IS
  'S504: per Central day and surface (app | walk): people = distinct signed-in, anons = distinct anonymous browsers, visits = separate stretches of use.';

COMMIT;
\echo 'session504 — done.'
