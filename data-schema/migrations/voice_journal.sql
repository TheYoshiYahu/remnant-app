-- Migration: Voice Journal
--
-- Private per-user journal (mirrors study_notes) + a small curated devotional
-- library used to surface a Scripture + reflection after an entry is saved.
-- Crisis-safety is ON-DEVICE ONLY — there is deliberately NO crisis flag,
-- score, or risk column anywhere in this schema. Nothing about a user's
-- emotional state is stored server-side.
--
-- Apply via the asyncpg Render-Shell pattern (image has no psql). Idempotent.
-- Do NOT run against live from the build environment.

-- Private journal entries. One row per saved entry. body is the entry text
-- (typed or dictated on-device → text). mood_label / section_label are the
-- user's own free labels (e.g. "Morning", "Gratitude") — NOT analysis.
CREATE TABLE IF NOT EXISTS journal_entries (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title           TEXT,
    body            TEXT NOT NULL,
    -- The user's own optional label for the entry (free text the user typed/
    -- picked for their own organization). NOT a server-side mood inference.
    section_label   TEXT,
    is_archived     BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_journal_entries_user
    ON journal_entries (user_id, created_at DESC);

COMMENT ON TABLE journal_entries IS
    'Private voice/text journal entries (mirror of study_notes). No crisis/mood inference is ever stored — crisis-safety is on-device only.';

-- Curated devotional library: short reflections keyed by a topic/emotion tag,
-- surfaced after an entry is saved (matched against the entry's chosen topic or
-- the curated topic index). Seed rows here are PLACEHOLDERS for Yoshi to
-- replace with voice-gated content. Public/read-only content (no user data).
CREATE TABLE IF NOT EXISTS devotional_library (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic           TEXT NOT NULL,            -- e.g. 'gratitude', 'fear', 'grief', 'hope'
    title           TEXT NOT NULL,
    passage_ref     TEXT,                     -- e.g. 'Tehillim (Psalm) 34:18'
    passage_text    TEXT,                     -- the verse quoted in full
    reflection      TEXT NOT NULL,            -- short reflection (Yoshi to replace placeholders)
    is_active       BOOLEAN NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_devotional_topic
    ON devotional_library (topic) WHERE is_active;

COMMENT ON TABLE devotional_library IS
    'Curated topic/emotion → Scripture + reflection library surfaced after a journal entry. Seed rows are placeholders for Yoshi to replace with voice-gated content.';

-- Seed a few PLACEHOLDER reflections (Yoshi will replace the copy). Insert only
-- if the library is empty so re-running the migration doesn't duplicate.
INSERT INTO devotional_library (topic, title, passage_ref, passage_text, reflection)
SELECT * FROM (VALUES
    ('gratitude', 'A thankful return',
     'Tehillim (Psalm) 100:4',
     'Enter into his gates with thanksgiving, and into his courts with praise: be thankful unto him, and bless his name.',
     'PLACEHOLDER — Yoshi to replace. A short reflection on gratitude as return to the Father.'),
    ('fear', 'He is near the broken',
     'Tehillim (Psalm) 34:18',
     'Yahuah (the LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.',
     'PLACEHOLDER — Yoshi to replace. A short reflection on nearness in fear.'),
    ('grief', 'Kept tears',
     'Tehillim (Psalm) 56:8',
     'Thou tellest my wanderings: put thou my tears into thy bottle: are they not in thy book?',
     'PLACEHOLDER — Yoshi to replace. A short reflection on grief held and counted.'),
    ('hope', 'Wait on him',
     'Yeshayahu (Isaiah) 40:31',
     'But they that wait upon Yahuah (the LORD) shall renew their strength; they shall mount up with wings as eagles.',
     'PLACEHOLDER — Yoshi to replace. A short reflection on hope renewed.')
) AS seed(topic, title, passage_ref, passage_text, reflection)
WHERE NOT EXISTS (SELECT 1 FROM devotional_library);
