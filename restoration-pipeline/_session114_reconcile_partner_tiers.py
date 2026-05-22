#!/usr/bin/env python3
"""
Session 114 — Reconcile WP ``rop_partner_tier`` user-meta from our
``subscriptions`` table.

The one-time historical-drift cleanup that pairs with the S114 auth.py
DB-wins-over-JWT fix. The auth fix makes API tier resolution correct
going forward (the API stops trusting the JWT claim and reads from DB
on every authenticated request). This script makes the WP side correct
for the historic drift Yoshi caught at S113 — where a partner's
``subscriptions`` row sits at a paid tier but their WP
``rop_partner_tier`` user-meta says ``free`` because some webhook never
fired, fired before the WP companion plugin was installed, or failed
silently.

What this script does
----------------------

Walks every ``subscriptions`` row where ``status NOT IN
('canceled', 'unpaid', 'incomplete_expired')`` — the same terminal-list
the cancel-webhook handler uses (per ``_handle_subscription_change`` in
``api/subscriptions.py``). For each, calls
``api.subscriptions._sync_partner_tier_to_wp`` with the partner's
``wordpress_user_id`` and current tier. The sync function is the SAME
HTTP POST path the live webhooks use, so any future improvement to the
sync transport (HMAC + companion-plugin path, App Password fallback)
automatically applies to reconciliation too.

The script also handles the inverse case for clean closure: any
``subscriptions`` row at a TERMINAL status whose partner still has a
WP ``rop_partner_tier`` other than ``free`` should be downgraded.
Without this, a partner who cancelled before the sync was reliable
might still carry a paid tier in WP user-meta — harmless to API
correctness post-S114 but visible in WP admin / website chrome. The
script downgrades them to ``free``.

Idempotent. Re-running is safe — every partner gets re-synced to their
current canonical state.

Modes
-----

  --dry-run    Print the plan; touch nothing in WP.
  --no-confirm Skip the final apply-confirmation prompt.
  (default)    Apply with a confirmation prompt.

Run from Render Shell (the S112 pattern — sidesteps the external-Postgres
SSL/IP rejection that hit the laptop path):

  # Dry-run first to see what would change:
  python3 /restoration-pipeline/_session114_reconcile_partner_tiers.py --dry-run

  # Apply against prod:
  python3 /restoration-pipeline/_session114_reconcile_partner_tiers.py --no-confirm

The script reads ``DATABASE_URL`` from the environment (Render Shell has
this set on the API service). The WP sync env vars
(``WP_COMPANION_SECRET`` + ``WP_API_BASE``, or the legacy
``WP_API_USER`` + ``WP_API_APP_PASSWORD`` fallback) must also be present;
they are on the API service by default.
"""

from __future__ import annotations

import argparse
import asyncio
import os
import sys
from pathlib import Path

# Make the API source importable from both environments:
#   - Render Shell (inside the API Docker container): the api code lives
#     flat at /app/ (Dockerfile COPY api/ /app/), so /app needs to be on
#     sys.path and we'll import `subscriptions` directly.
#   - Laptop dev (running against external Postgres for debugging): the
#     api code lives under APP_ROOT/api/ as flat modules, so APP_ROOT/api
#     goes on sys.path and we again import `subscriptions` directly.
_CONTAINER_API = Path("/app")
_LAPTOP_API = Path(
    os.environ.get("APP_ROOT") or Path(__file__).resolve().parent.parent
) / "api"
for candidate in (_CONTAINER_API, _LAPTOP_API):
    if candidate.exists() and str(candidate) not in sys.path:
        sys.path.insert(0, str(candidate))
        break


TERMINAL_STATUSES = ("canceled", "unpaid", "incomplete_expired")


async def reconcile(database_url: str, *, dry_run: bool) -> dict[str, int]:
    """Walk the ``subscriptions`` table; re-sync WP tier for every row.

    Returns a counter dict: ``synced_paid``, ``synced_free``, ``skipped``,
    ``failed``. ``synced_*`` count rows where the WP POST succeeded;
    ``failed`` counts rows where the POST returned False or raised;
    ``skipped`` counts rows with no ``wordpress_user_id`` (subscription
    exists but never got an SSO-linked user — should be rare).
    """
    import asyncpg
    import ssl as ssl_lib
    from urllib.parse import urlparse, unquote

    # Defensive SSL config — matches the S112 loader pattern so this
    # script also works from a laptop if Render Shell is unavailable.
    ssl_ctx = ssl_lib.create_default_context()
    ssl_ctx.check_hostname = False
    ssl_ctx.verify_mode = ssl_lib.CERT_NONE

    parsed = urlparse(database_url)
    conn = await asyncpg.connect(
        host=parsed.hostname,
        port=parsed.port or 5432,
        user=unquote(parsed.username) if parsed.username else None,
        password=unquote(parsed.password) if parsed.password else None,
        database=parsed.path.lstrip("/") if parsed.path else None,
        ssl=ssl_ctx,
        timeout=30,
    )

    counters = {
        "synced_paid": 0,
        "synced_free": 0,
        "skipped": 0,
        "failed": 0,
    }

    try:
        # Pull every subscription row joined to its user. We resolve
        # the target tier for each row here (matching the live webhook
        # handler's logic) and act on it below.
        rows = await conn.fetch(
            "SELECT s.id::text AS sub_id, "
            "       s.status::text AS status, "
            "       s.tier::text AS tier, "
            "       u.wordpress_user_id AS wp_user_id "
            "  FROM subscriptions s "
            "  JOIN users u ON u.id = s.user_id "
            " ORDER BY u.wordpress_user_id, s.started_at DESC"
        )
    finally:
        await conn.close()

    print(f"[reconcile] found {len(rows)} subscription row(s) to evaluate")

    # The DB query returns multiple rows per partner if they have a
    # cancel+resubscribe history. The canonical tier for a partner is
    # the newest non-terminal row's tier; if no non-terminal row
    # exists, the partner is at 'free'. Group by wp_user_id, pick the
    # right row, and act.
    by_partner: dict[int, list[dict]] = {}
    for row in rows:
        wp_user_id = row["wp_user_id"]
        if wp_user_id is None:
            counters["skipped"] += 1
            continue
        by_partner.setdefault(int(wp_user_id), []).append(dict(row))

    # Late import so the SSL ssl_ctx work above completes before any
    # FastAPI / pydantic-settings init is triggered by importing
    # subscriptions. The sys.path insert at the top of this module
    # made `subscriptions` reachable from both the Render container
    # and the laptop layout.
    from subscriptions import _sync_partner_tier_to_wp

    for wp_user_id, partner_rows in sorted(by_partner.items()):
        # Newest first per the ORDER BY above. Pick the newest
        # non-terminal row to determine the partner's canonical tier;
        # fall back to 'free' if every row is terminal.
        canonical_tier = "free"
        for row in partner_rows:
            if row["status"] not in TERMINAL_STATUSES:
                canonical_tier = row["tier"]
                break

        action_label = (
            f"[reconcile] wp_user_id={wp_user_id} → {canonical_tier}"
            f" (rows: {','.join(r['status'] for r in partner_rows)})"
        )
        if dry_run:
            print(f"DRY-RUN {action_label}")
            if canonical_tier == "free":
                counters["synced_free"] += 1
            else:
                counters["synced_paid"] += 1
            continue

        try:
            ok = await _sync_partner_tier_to_wp(wp_user_id, canonical_tier)
        except Exception as exc:
            print(f"FAILED  {action_label} — exc={exc}")
            counters["failed"] += 1
            continue

        if ok:
            print(f"OK      {action_label}")
            if canonical_tier == "free":
                counters["synced_free"] += 1
            else:
                counters["synced_paid"] += 1
        else:
            print(f"FAILED  {action_label} — sync returned False")
            counters["failed"] += 1

    return counters


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print the plan; do not POST to WP.",
    )
    parser.add_argument(
        "--no-confirm",
        action="store_true",
        help="Skip the apply-confirmation prompt (use in scripted runs).",
    )
    args = parser.parse_args()

    database_url = os.environ.get("DATABASE_URL")
    if not database_url:
        print("ERROR: DATABASE_URL env var not set.", file=sys.stderr)
        return 2

    if not args.dry_run and not args.no_confirm:
        print(
            "About to reconcile WP rop_partner_tier user-meta against "
            "the subscriptions table. This POSTs to the WordPress "
            "companion plugin (or the App Password fallback) for every "
            "partner. Idempotent — re-running is safe."
        )
        ans = input("Proceed? [y/N] ").strip().lower()
        if ans not in {"y", "yes"}:
            print("Aborted.")
            return 1

    counters = asyncio.run(reconcile(database_url, dry_run=args.dry_run))

    print("\n[reconcile] summary:")
    for key, value in counters.items():
        print(f"  {key:<14} {value}")

    return 0 if counters["failed"] == 0 else 3


if __name__ == "__main__":
    sys.exit(main())
