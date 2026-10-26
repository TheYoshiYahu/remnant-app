"""
winback.py — the win-back email (S467). Run by hand from the remnant-app-api Shell.

    python -m jobs.winback --setup-coupons   # create the two Stripe coupons (safe to re-run)
    python -m jobs.winback --dry-run         # list who WOULD get it; sends nothing
    python -m jobs.winback                   # send the first email
    python -m jobs.winback --nudge --dry-run # list who WOULD get the second nudge
    python -m jobs.winback --nudge           # send the second nudge (once, later)

Who gets it (all must hold):
  - account at least 30 days old (--min-days to change; S475: was 90)
  - has an email, and has NOT turned off promotions
  - has NEVER had any subscription row — paid, gifted (lifetime-free promo
    codes), founder, or cancelled. So gift recipients never get it.
  - never sent this email before (the nudge: sent the first one at least 7 days
    ago, never tapped the link, never nudged)

At most --limit sends per run (default 90 — Resend free plan allows 100/day).
A row is stamped only after Resend accepts the send.
"""
from __future__ import annotations

import argparse
import asyncio
import logging
import os
import sys

from db import close_pool, get_pool, open_pool
from email_prefs import ensure_email_columns, list_unsubscribe_headers
from lib.email import send_email
from lib.email_links import unsubscribe_url, winback_url
from jobs.winback_template import NUDGE_SUBJECT, SUBJECT, render_html, render_text

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(name)s %(message)s")
logger = logging.getLogger("winback")

NUDGE_AFTER_DAYS = 7
REPEAT_DAYS = 90   # S475 (Yoshi): the same offer again every 90 days while they still have no subscription

_FIRST = """
    SELECT u.wordpress_user_id, u.email, u.display_name, (u.created_at + interval '7 days')::date AS trial_end
      FROM users u
     WHERE u.email IS NOT NULL
       AND u.email_promotions
       AND ((u.winback_sent_at IS NULL AND u.created_at <= now() - make_interval(days => $1))
            OR u.winback_sent_at <= now() - make_interval(days => $3))
       AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.user_id = u.id)
     ORDER BY COALESCE(u.winback_sent_at, u.created_at) ASC
     LIMIT $2
"""

_NUDGE = """
    SELECT u.wordpress_user_id, u.email, u.display_name, (u.created_at + interval '7 days')::date AS trial_end
      FROM users u
     WHERE u.email IS NOT NULL
       AND u.email_promotions
       AND u.winback_sent_at IS NOT NULL
       AND u.winback_sent_at <= now() - make_interval(days => $1)
       AND u.winback_nudge_sent_at IS NULL
       AND u.winback_reopen_until IS NULL
       AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.user_id = u.id)
     ORDER BY u.winback_sent_at ASC
     LIMIT $2
"""


def setup_coupons() -> int:
    """Create the two coupons in Stripe if they don't exist yet."""
    import stripe
    from subscriptions import WINBACK_COUPONS

    key = os.environ.get("STRIPE_SECRET_KEY")
    if not key:
        logger.error("STRIPE_SECRET_KEY is unset.")
        return 1
    stripe.api_key = key
    specs = {
        WINBACK_COUPONS["monthly"]: dict(
            percent_off=25, duration="repeating", duration_in_months=6,
            name="Welcome back — 25% off 6 months",
        ),
        WINBACK_COUPONS["annual"]: dict(
            percent_off=35, duration="once",
            name="Welcome back — 35% off first year",
        ),
    }
    for cid, spec in specs.items():
        try:
            stripe.Coupon.retrieve(cid)
            logger.info("coupon %s already exists — left as is.", cid)
        except stripe.InvalidRequestError:
            stripe.Coupon.create(id=cid, **spec)
            logger.info("coupon %s created.", cid)
    return 0


async def _run(nudge: bool, dry_run: bool, min_days: int, limit: int) -> int:
    await open_pool()
    try:
        await ensure_email_columns()
        pool = get_pool()
        async with pool.acquire() as conn:
            rows = await conn.fetch(_NUDGE, NUDGE_AFTER_DAYS, limit) if nudge else \
                   await conn.fetch(_FIRST, min_days, limit, REPEAT_DAYS)
        label = "nudge" if nudge else "first"
        logger.info("%d %s win-back candidate(s)%s.", len(rows), label, " (DRY RUN)" if dry_run else "")

        sent = failed = 0
        for r in rows:
            uid, email, name = r["wordpress_user_id"], r["email"], r["display_name"]
            open_url, unsub = winback_url(uid), unsubscribe_url(uid)
            if not open_url or not unsub:
                logger.error("No link secret set (EMAIL_LINK_SECRET / BOARD_MOD_SECRET). Stopping.")
                return 1
            if dry_run:
                logger.info("[dry-run] WOULD send %s to %s (wp_user_id=%s)", label, email, uid)
                sent += 1
                continue
            ok = await send_email(
                to=email,
                subject=NUDGE_SUBJECT if nudge else SUBJECT,
                html=render_html(name, open_url, unsub, nudge=nudge, since=r["trial_end"]),
                text=render_text(name, open_url, unsub, nudge=nudge, since=r["trial_end"]),
                headers=list_unsubscribe_headers(uid),
            )
            if not ok:
                failed += 1
                continue
            async with pool.acquire() as conn:
                if nudge:
                    await conn.execute("UPDATE users SET winback_nudge_sent_at = now() WHERE wordpress_user_id = $1", uid)
                else:
                    # S475: each (re)send starts the cycle over — the 7-day nudge can follow it again.
                    await conn.execute("UPDATE users SET winback_sent_at = now(), winback_nudge_sent_at = NULL, "
                                       "winback_reopen_until = NULL WHERE wordpress_user_id = $1", uid)
            sent += 1
            logger.info("sent %s + marked wp_user_id=%s", label, uid)

        logger.info("Done%s. sent=%d failed=%d", " (DRY RUN)" if dry_run else "", sent, failed)
        return 1 if (not dry_run and failed and not sent) else 0
    finally:
        await close_pool()


async def run_daily(limit: int = 90) -> None:
    """S475 — called by the API once a day: the 30-day / every-90-days offer, then the 7-day nudge.
    Uses the already-open pool. Budget: Resend free plan allows 100 sends/day."""
    pool = get_pool()
    sent_first = 0
    for nudge in (False, True):
        budget = max(0, limit - sent_first)
        if budget == 0:
            break
        async with pool.acquire() as conn:
            rows = await conn.fetch(_NUDGE, NUDGE_AFTER_DAYS, budget) if nudge else \
                   await conn.fetch(_FIRST, 30, budget, REPEAT_DAYS)
        for r in rows:
            uid, email, name = r["wordpress_user_id"], r["email"], r["display_name"]
            open_url, unsub = winback_url(uid), unsubscribe_url(uid)
            if not open_url or not unsub:
                logger.error("win-back daily: no link secret set; skipping.")
                return
            ok = await send_email(to=email, subject=NUDGE_SUBJECT if nudge else SUBJECT,
                                  html=render_html(name, open_url, unsub, nudge=nudge, since=r["trial_end"]),
                                  text=render_text(name, open_url, unsub, nudge=nudge, since=r["trial_end"]),
                                  headers=list_unsubscribe_headers(uid))
            if not ok:
                continue
            async with pool.acquire() as conn:
                if nudge:
                    await conn.execute("UPDATE users SET winback_nudge_sent_at = now() WHERE wordpress_user_id = $1", uid)
                else:
                    await conn.execute("UPDATE users SET winback_sent_at = now(), winback_nudge_sent_at = NULL, "
                                       "winback_reopen_until = NULL WHERE wordpress_user_id = $1", uid)
                    sent_first += 1
            logger.info("win-back daily: sent %s to wp_user_id=%s", "nudge" if nudge else "offer", uid)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="Win-back email.")
    ap.add_argument("--setup-coupons", action="store_true")
    ap.add_argument("--nudge", action="store_true")
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--min-days", type=int, default=30)  # S475 (Yoshi): 30 days, was 90
    ap.add_argument("--limit", type=int, default=90)
    a = ap.parse_args(argv)
    if a.setup_coupons:
        return setup_coupons()
    return asyncio.run(_run(a.nudge, a.dry_run, a.min_days, a.limit))


if __name__ == "__main__":
    sys.exit(main())
