-- Session 442 (2026-10-07) — Year Plan study features (YEAR_PLAN_STUDY_SPEC.md)
--
--   user_year_plans      — the reader's plan state (scope, start, position,
--                          pace) synced across devices. Partner feature.
--   plan_notes           — notes on a plan day and/or a chapter (+ optional
--                          verse range). Partner feature. Kept apart from
--                          study_notes: that table is the canon-verse-anchored
--                          free notepad (append-only + 10-note cap on Free);
--                          plan notes anchor to plan days and to any book in
--                          the woven order, extras included.
--   user_teachings       — the reader's own "My Teachings" (ordered blocks).
--                          Partner feature. Separate from Yoshi's published
--                          teaching_bodies.
--   teacher_assignments  — For Teachers assignments (ordered blocks, answer
--                          keys, print options). Top tier ("everything").
--
-- Tier gates live in api/year_plan_study.py (server-side, every endpoint).
-- Idempotent. No schema_version bump: no reading content changes, so apps
-- must not purge their caches for this.

BEGIN;

CREATE TABLE IF NOT EXISTS user_year_plans (
    user_id         UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    state           JSONB NOT NULL,
    updated_at_ms   BIGINT NOT NULL,
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS plan_notes (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    plan_day        INTEGER,
    day_date        DATE,
    book_slug       TEXT,
    book_title      TEXT,
    chapter         INTEGER,
    verse_start     INTEGER,
    verse_end       INTEGER,
    body            TEXT NOT NULL,
    is_archived     BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_plan_notes_user
    ON plan_notes (user_id, created_at) WHERE NOT is_archived;

CREATE TABLE IF NOT EXISTS user_teachings (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title           TEXT NOT NULL,
    blocks          JSONB NOT NULL DEFAULT '[]'::jsonb,
    is_archived     BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_user_teachings_user
    ON user_teachings (user_id, updated_at DESC) WHERE NOT is_archived;

CREATE TABLE IF NOT EXISTS teacher_assignments (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title           TEXT NOT NULL,
    instructions    TEXT NOT NULL DEFAULT '',
    due_date        DATE,
    include_text    BOOLEAN NOT NULL DEFAULT FALSE,
    blocks          JSONB NOT NULL DEFAULT '[]'::jsonb,
    is_archived     BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_teacher_assignments_user
    ON teacher_assignments (user_id, updated_at DESC) WHERE NOT is_archived;

COMMIT;
SELECT to_regclass('user_year_plans') AS t1, to_regclass('plan_notes') AS t2,
       to_regclass('user_teachings') AS t3, to_regclass('teacher_assignments') AS t4;
\echo 'session442 complete.'
