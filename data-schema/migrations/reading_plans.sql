-- Migration: Reading Plans
--
-- Curated multi-day reading plans (definition) + per-user progress synced under
-- the account (mirror of the notes/journal pattern). Distinct from the existing
-- client-only "Read the Scriptures in a Year" pacing layer (lib/reading-plan/*,
-- localStorage) — this is the account-synced, multi-plan system.
--
-- Apply via the asyncpg Render-Shell pattern (image has no psql). Idempotent.
-- Do NOT run against live from the build environment. Seed plans below are
-- STARTER content for Yoshi to expand/correct (book slugs especially).

CREATE TABLE IF NOT EXISTS reading_plans (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug          TEXT UNIQUE NOT NULL,
    title         TEXT NOT NULL,
    description   TEXT,
    day_count     INT NOT NULL DEFAULT 0,
    is_active     BOOLEAN NOT NULL DEFAULT TRUE,
    sort_order    INT NOT NULL DEFAULT 0,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- One row per day of a plan. `passages` is a JSONB array of
-- {label, book_slug, chapter} so the daily view can show labels and (later)
-- deep-link into the reader.
CREATE TABLE IF NOT EXISTS reading_plan_days (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plan_id       UUID NOT NULL REFERENCES reading_plans(id) ON DELETE CASCADE,
    day_number    INT NOT NULL,
    passages      JSONB NOT NULL DEFAULT '[]'::jsonb,
    UNIQUE (plan_id, day_number)
);

CREATE INDEX IF NOT EXISTS idx_plan_days_plan ON reading_plan_days(plan_id, day_number);

-- Per-user progress, synced under the account. completed_days holds the day
-- numbers the user has marked done; current_day is where they are.
CREATE TABLE IF NOT EXISTS reading_plan_progress (
    user_id        UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    plan_id        UUID NOT NULL REFERENCES reading_plans(id) ON DELETE CASCADE,
    current_day    INT NOT NULL DEFAULT 1,
    completed_days INT[] NOT NULL DEFAULT '{}',
    started_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id, plan_id)
);

COMMENT ON TABLE reading_plans IS
    'Curated multi-day reading plans (account-synced progress). Seed rows are starter content for Yoshi to expand.';

-- ── Seed: 3 starter plans (modest; Yoshi expands). Insert only if empty. ──
DO $$
DECLARE
    gospels UUID;
    library UUID;
    feasts  UUID;
BEGIN
    IF EXISTS (SELECT 1 FROM reading_plans) THEN
        RETURN;
    END IF;

    INSERT INTO reading_plans (slug, title, description, day_count, sort_order)
    VALUES ('through-the-gospels',
            'Through the Gospels',
            'STARTER PLAN (Yoshi to expand) — walk the four gospels a few chapters a day.',
            4, 1)
    RETURNING id INTO gospels;
    INSERT INTO reading_plan_days (plan_id, day_number, passages) VALUES
      (gospels, 1, '[{"label":"Mattithyahu (Matthew) 1-3","book_slug":"matthew","chapter":1}]'::jsonb),
      (gospels, 2, '[{"label":"Marqus (Mark) 1-3","book_slug":"mark","chapter":1}]'::jsonb),
      (gospels, 3, '[{"label":"Luqas (Luke) 1-3","book_slug":"luke","chapter":1}]'::jsonb),
      (gospels, 4, '[{"label":"Yochanan (John) 1-3","book_slug":"john","chapter":1}]'::jsonb);

    INSERT INTO reading_plans (slug, title, description, day_count, sort_order)
    VALUES ('through-the-restored-library',
            'Through the Restored Library',
            'STARTER PLAN (Yoshi to expand) — the canon and the restored library in a reading order (Genesis alongside 1 Enoch, Jubilees, Jasher).',
            3, 2)
    RETURNING id INTO library;
    INSERT INTO reading_plan_days (plan_id, day_number, passages) VALUES
      (library, 1, '[{"label":"Bereshith (Genesis) 1-3","book_slug":"genesis","chapter":1}]'::jsonb),
      (library, 2, '[{"label":"1 Chanok (Enoch) 1-5","book_slug":"enoch","chapter":1}]'::jsonb),
      (library, 3, '[{"label":"Yovheliym (Jubilees) 1-2","book_slug":"jubilees","chapter":1}]'::jsonb);

    INSERT INTO reading_plans (slug, title, description, day_count, sort_order)
    VALUES ('feasts-and-appointed-times',
            'Feasts & Appointed Times',
            'STARTER PLAN (Yoshi to expand) — the appointed times of Wayyiqra (Leviticus) 23 and the feast passages.',
            3, 3)
    RETURNING id INTO feasts;
    INSERT INTO reading_plan_days (plan_id, day_number, passages) VALUES
      (feasts, 1, '[{"label":"Wayyiqra (Leviticus) 23","book_slug":"leviticus","chapter":23}]'::jsonb),
      (feasts, 2, '[{"label":"Shemoth (Exodus) 12","book_slug":"exodus","chapter":12}]'::jsonb),
      (feasts, 3, '[{"label":"Devariym (Deuteronomy) 16","book_slug":"deuteronomy","chapter":16}]'::jsonb);
END $$;
