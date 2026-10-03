-- S431 Hidden Words — additive. Counts of distinct Strong's originals behind each
-- KJV English word (canon only), + per-original gloss. Verse lists are NOT stored
-- here; they come from verse_words joined on strong_number. Populated by
-- restoration-pipeline/_session431_build_hidden_words.py (deterministic, re-runnable).
BEGIN;

CREATE TABLE IF NOT EXISTS hidden_words (
    english_key     TEXT PRIMARY KEY,                 -- folded English form, e.g. 'serpent'
    display         TEXT NOT NULL,                    -- reader surface base, e.g. 'serpent'
    original_count  INT  NOT NULL,                    -- the superscript (distinct Strong's across canon)
    marked          BOOLEAN NOT NULL DEFAULT TRUE,    -- FALSE = operator override (rare)
    surfaces        TEXT[] NOT NULL                   -- folded surface forms: {serpent,serpents,serpent's}
);

CREATE TABLE IF NOT EXISTS hidden_word_originals (
    english_key     TEXT REFERENCES hidden_words(english_key) ON DELETE CASCADE,
    strong_number   TEXT REFERENCES strong_entries(strong_number),
    occurrences     INT  NOT NULL,                    -- times this original stands behind the English word
    plain_meaning   TEXT NOT NULL,                    -- voice-gated short gloss, Yoshi-redlinable
    PRIMARY KEY (english_key, strong_number)
);

CREATE INDEX IF NOT EXISTS idx_hidden_word_originals_key ON hidden_word_originals(english_key);

COMMIT;
