"""
backfill_emails.py — copy missing account emails from WordPress (S467).

Older accounts were made before phone sign-ins carried an email, so users.email
is empty for them. WordPress has the email. This asks WordPress (admin REST,
the same app-password login the tier sync uses) for each missing one and fills
it in. Only fills empty emails; never overwrites one already there.

    python -m jobs.backfill_emails --dry-run   # show what it would fill
    python -m jobs.backfill_emails             # fill them
"""
from __future__ import annotations

import argparse
import asyncio
import logging
import sys

import httpx

from config import settings
from db import close_pool, get_pool, open_pool

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(name)s %(message)s")
logger = logging.getLogger("backfill_emails")


async def _run(dry_run: bool) -> int:
    base = (settings.wp_api_base or "").rstrip("/")
    auth = (settings.wp_api_user, settings.wp_api_app_password)
    if not base or not auth[0] or not auth[1]:
        logger.error("WordPress API login is not set on this service.")
        return 1
    await open_pool()
    try:
        pool = get_pool()
        async with pool.acquire() as conn:
            rows = await conn.fetch(
                "SELECT wordpress_user_id FROM users WHERE email IS NULL ORDER BY wordpress_user_id"
            )
        logger.info("%d account(s) missing an email.", len(rows))
        filled = missing = failed = 0
        async with httpx.AsyncClient(timeout=15.0) as client:
            for r in rows:
                uid = r["wordpress_user_id"]
                try:
                    resp = await client.get(f"{base}/wp/v2/users/{uid}",
                                            params={"context": "edit"}, auth=auth)
                except httpx.HTTPError as exc:
                    failed += 1
                    logger.error("wp_user_id=%s request failed: %r", uid, exc)
                    continue
                if resp.status_code == 404:
                    missing += 1
                    logger.info("wp_user_id=%s not found in WordPress.", uid)
                    continue
                if resp.status_code != 200:
                    failed += 1
                    logger.error("wp_user_id=%s HTTP %s: %s", uid, resp.status_code, resp.text[:200])
                    continue
                email = (resp.json().get("email") or "").strip()
                if not email:
                    missing += 1
                    continue
                if dry_run:
                    logger.info("[dry-run] wp_user_id=%s would get an email.", uid)
                    filled += 1
                    continue
                async with pool.acquire() as conn:
                    await conn.execute(
                        "UPDATE users SET email = $2 WHERE wordpress_user_id = $1 AND email IS NULL",
                        uid, email,
                    )
                filled += 1
        logger.info("Done%s. filled=%d not_in_wp=%d failed=%d",
                    " (DRY RUN)" if dry_run else "", filled, missing, failed)
        return 1 if failed and not filled else 0
    finally:
        await close_pool()


def main(argv=None) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    return asyncio.run(_run(ap.parse_args(argv).dry_run))


if __name__ == "__main__":
    sys.exit(main())
