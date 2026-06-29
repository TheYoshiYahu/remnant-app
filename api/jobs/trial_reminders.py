"""
trial_reminders.py — daily "your trial is ending" email job.

Runs once a day (Render Cron Job) and emails each no-card-trial user who is in
the day-6 -> day-7 window of their trial and has NOT converted to a paid plan,
exactly once.

Run:
    python -m jobs.trial_reminders            # live send
    python -m jobs.trial_reminders --dry-run  # select + log only, no send, no write

Inside the runtime image (Dockerfile: COPY api/ /app/, WORKDIR /app) the backend
modules are top-level, so the imports below are bare (`from db import ...`),
matching the rest of the codebase, and the runnable module path is
`jobs.trial_reminders`.

Trial model (see auth.py): the trial is a pure tier-resolution rule, not a
Stripe object. The clock is users.created_at; a user with no active paid
subscription and created_at younger than TRIAL_DAYS resolves to TRIAL_TIER.
So "in the reminder window" = created_at between (now - TRIAL_DAYS days) and
(now - (TRIAL_DAYS - 1) days), i.e. day 6 -> day 7 of a 7-day trial.

Selection (all must hold):
  1. created_at in the day (TRIAL_DAYS-1) -> TRIAL_DAYS window.
  2. email IS NOT NULL (cached from the JWT via upsert_user).
  3. trial_reminder_sent_at IS NULL (idempotency — never email twice).
  4. NOT has_active_paid_subscription(wp_user_id) (don't email converters).
     This is checked per-candidate, reusing auth.has_active_paid_subscription
     so the "active subscription" definition lives in one place.

Idempotency / safety:
  - trial_reminder_sent_at is stamped only AFTER a successful Resend send, and
    the UPDATE re-checks IS NULL, so concurrent or repeated runs can't double-send.
  - A failed send leaves the row eligible for the next daily run (still within
    the window for ~a day).
  - --dry-run performs the full selection and logs decisions but sends nothing
    and writes nothing.
"""

from __future__ import annotations

import argparse
import asyncio
import logging
import sys

# Bare imports — top-level modules inside the image (WORKDIR /app).
from auth import TRIAL_DAYS, has_active_paid_subscription
from db import close_pool, get_pool, open_pool
from lib.email import send_email
from jobs.trial_reminder_template import SUBJECT, render_html, render_text

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(name)s %(message)s",
)
logger = logging.getLogger("trial_reminders")


# Candidate selection. Window is [now - TRIAL_DAYS, now - (TRIAL_DAYS-1)) on
# created_at: accounts that have had the trial for at least (TRIAL_DAYS-1) days
# but less than TRIAL_DAYS — the final day of the trial.
_SELECT_CANDIDATES = """
    SELECT wordpress_user_id, email, display_name, created_at
      FROM users
     WHERE email IS NOT NULL
       AND trial_reminder_sent_at IS NULL
       AND created_at <= now() - make_interval(days => $1)
       AND created_at >  now() - make_interval(days => $2)
     ORDER BY created_at ASC
"""

# Stamp sent — re-checks IS NULL so a racing run can't double-send.
_MARK_SENT = """
    UPDATE users
       SET trial_reminder_sent_at = now()
     WHERE wordpress_user_id = $1
       AND trial_reminder_sent_at IS NULL
"""


async def _run(dry_run: bool) -> int:
    """Returns process exit code (0 ok). Sends reminders; logs a summary."""
    if TRIAL_DAYS <= 0:
        logger.info("TRIAL_DAYS=%s — trial disabled; nothing to do.", TRIAL_DAYS)
        return 0

    reminder_floor_days = TRIAL_DAYS - 1  # $1: at least this old (>= day 6)
    trial_len_days = TRIAL_DAYS           # $2: younger than this (< day 7)

    await open_pool()
    try:
        pool = get_pool()
        async with pool.acquire() as conn:
            candidates = await conn.fetch(
                _SELECT_CANDIDATES, reminder_floor_days, trial_len_days
            )

        logger.info(
            "Found %d trial user(s) in the day-%d->%d window%s.",
            len(candidates), reminder_floor_days, trial_len_days,
            " (DRY RUN)" if dry_run else "",
        )

        sent = skipped_paid = failed = 0

        for row in candidates:
            wp_user_id = row["wordpress_user_id"]
            email = row["email"]
            display_name = row["display_name"]

            # Don't email users who already converted to a paid plan.
            try:
                if await has_active_paid_subscription(wp_user_id):
                    skipped_paid += 1
                    logger.info(
                        "skip wp_user_id=%s — active paid subscription.", wp_user_id
                    )
                    continue
            except Exception as exc:  # DB hiccup on the check — skip this one.
                failed += 1
                logger.error(
                    "skip wp_user_id=%s — subscription check failed: %r",
                    wp_user_id, exc,
                )
                continue

            if dry_run:
                logger.info(
                    "[dry-run] WOULD send to %s (wp_user_id=%s).", email, wp_user_id
                )
                sent += 1
                continue

            ok = await send_email(
                to=email,
                subject=SUBJECT,
                html=render_html(display_name),
                text=render_text(display_name),
            )
            if not ok:
                failed += 1
                logger.error(
                    "send failed wp_user_id=%s — left eligible for next run.",
                    wp_user_id,
                )
                continue

            # Stamp only after a confirmed send.
            async with pool.acquire() as conn:
                await conn.execute(_MARK_SENT, wp_user_id)
            sent += 1
            logger.info("sent + marked wp_user_id=%s.", wp_user_id)

        logger.info(
            "Done%s. sent=%d skipped_paid=%d failed=%d total=%d",
            " (DRY RUN)" if dry_run else "",
            sent, skipped_paid, failed, len(candidates),
        )
        # Non-zero exit if every attempted send failed (and there was work),
        # so the Render cron surfaces the failure.
        if not dry_run and failed > 0 and sent == 0:
            return 1
        return 0
    finally:
        await close_pool()


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Send day-6/7 trial-ending reminder emails.")
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Select and log who would be emailed; send nothing, write nothing.",
    )
    args = parser.parse_args(argv)
    return asyncio.run(_run(args.dry_run))


if __name__ == "__main__":
    sys.exit(main())
