-- Migration: add users.trial_reminder_sent_at
--
-- Part of the compliance/trial-reminder build. Adds the idempotency column the
-- daily trial-ending email job (api/jobs/trial_reminders.py) uses to guarantee
-- each trial user is emailed at most once: the job selects users whose trial is
-- in its day-6→7 window WHERE trial_reminder_sent_at IS NULL, sends the email,
-- then stamps now(). NULL means "no reminder sent yet."
--
-- Safe and additive: nullable column, no default, no backfill. Existing rows get
-- NULL and become eligible for a reminder only if they fall in the trial window
-- (which, for accounts older than 7 days, they will not). IF NOT EXISTS makes the
-- migration idempotent — re-running is a no-op.
--
-- Apply (from the Render Web Shell on remnant-app-api, internal DB connection):
--   see DEPLOY_TEST_CHECKLIST_trial_email.md for the exact command.

ALTER TABLE users
    ADD COLUMN IF NOT EXISTS trial_reminder_sent_at TIMESTAMPTZ;

COMMENT ON COLUMN users.trial_reminder_sent_at IS
    'compliance/trial-reminder build: when the day-6/7 trial-ending email was sent. NULL = not yet sent. The daily job filters on IS NULL for idempotency and stamps now() after a successful Resend send.';
