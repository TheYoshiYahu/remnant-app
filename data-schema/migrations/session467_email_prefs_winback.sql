-- S467: email preferences (opt-out) + win-back offer columns on users.
-- Additive and idempotent. The API also runs these same statements at startup
-- (email_prefs.ensure_email_columns), so a manual apply is optional.
ALTER TABLE users ADD COLUMN IF NOT EXISTS email_promotions BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE users ADD COLUMN IF NOT EXISTS email_updates    BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE users ADD COLUMN IF NOT EXISTS winback_sent_at        TIMESTAMPTZ;
ALTER TABLE users ADD COLUMN IF NOT EXISTS winback_nudge_sent_at  TIMESTAMPTZ;
ALTER TABLE users ADD COLUMN IF NOT EXISTS winback_reopen_until   TIMESTAMPTZ;
