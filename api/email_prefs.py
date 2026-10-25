"""
email_prefs.py — email opt-out page + win-back reopen link (S467).

  GET  /v1/email/unsubscribe?u=&sig=   page with two choices
  POST /v1/email/unsubscribe           apply the choice (form post)
  GET  /v1/email/winback?u=&sig=       opens full access for 24 hours (once),
                                       then sends the reader to the pricing page
                                       with the win-back offer on.

Account mail (trial ending, password, receipts) is never governed by these
flags — only promotions and updates are.
"""
from __future__ import annotations

import html
import logging
from datetime import datetime, timedelta, timezone

from urllib.parse import parse_qs

from fastapi import APIRouter, Query, Request
from fastapi.responses import HTMLResponse, RedirectResponse

from db import get_pool
from lib.email_links import unsubscribe_url, verify

logger = logging.getLogger("email_prefs")
router = APIRouter()

REOPEN_HOURS = 24
PRICING_OFFER_URL = "https://bible.remnantofpromise.org/pricing?offer=winback"

EMAIL_COLUMNS_SQL = [
    "ALTER TABLE users ADD COLUMN IF NOT EXISTS email_promotions BOOLEAN NOT NULL DEFAULT TRUE",
    "ALTER TABLE users ADD COLUMN IF NOT EXISTS email_updates BOOLEAN NOT NULL DEFAULT TRUE",
    "ALTER TABLE users ADD COLUMN IF NOT EXISTS winback_sent_at TIMESTAMPTZ",
    "ALTER TABLE users ADD COLUMN IF NOT EXISTS winback_nudge_sent_at TIMESTAMPTZ",
    "ALTER TABLE users ADD COLUMN IF NOT EXISTS winback_reopen_until TIMESTAMPTZ",
]


async def ensure_email_columns() -> None:
    """Run at API startup. Idempotent; logs and moves on if it can't."""
    try:
        pool = get_pool()
        async with pool.acquire() as conn:
            for stmt in EMAIL_COLUMNS_SQL:
                await conn.execute(stmt)
    except Exception as exc:  # never block startup over this
        logger.error("ensure_email_columns failed: %r", exc)


_SHELL = """<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1"><title>{title}</title>
<style>body{{font-family:Georgia,serif;background:#14100c;color:#f3ead8;max-width:32rem;margin:3rem auto;padding:0 1rem;line-height:1.5}}
a{{color:#e7c873}} button{{display:block;width:100%;margin:.75rem 0;padding:.9rem;font:inherit;font-size:1rem;
background:#2a2118;color:#f3ead8;border:1px solid #e7c873;border-radius:8px;cursor:pointer}}
.small{{font-size:.9rem;opacity:.8}}</style></head><body><h1>{title}</h1>{body}</body></html>"""


def _page(title: str, body: str, status: int = 200) -> HTMLResponse:
    return HTMLResponse(_SHELL.format(title=html.escape(title), body=body), status_code=status)


_BAD_LINK = ("Link not valid", "<p>This link is not valid. If you copied it, try opening it straight from the email.</p>")


@router.get("/v1/email/unsubscribe", response_class=HTMLResponse)
async def unsubscribe_page(u: int = Query(...), sig: str = Query(...)) -> HTMLResponse:
    if not verify(u, "unsubscribe", sig):
        return _page(*_BAD_LINK, status=403)
    s = html.escape(sig)
    body = f"""<p>Choose which emails you'd like to stop getting.</p>
<form method="post" action="/v1/email/unsubscribe">
<input type="hidden" name="u" value="{u}"><input type="hidden" name="sig" value="{s}">
<button name="choice" value="promotions">Promotions only</button>
<button name="choice" value="all">Promotions and updates</button>
</form>
<p class="small">Updates are news and new features. Emails about your own account — your trial,
your password, your receipts — still come either way.</p>"""
    return _page("Email choices", body)


@router.post("/v1/email/unsubscribe", response_class=HTMLResponse)
async def unsubscribe_apply(request: Request) -> HTMLResponse:
    # Plain urlencoded form read by hand (no python-multipart dependency).
    raw = (await request.body()).decode("utf-8", "replace")
    fields = {k: v[0] for k, v in parse_qs(raw).items() if v}
    try:
        u = int(fields.get("u", ""))
    except ValueError:
        return _page(*_BAD_LINK, status=403)
    sig = fields.get("sig", "")
    choice = fields.get("choice", "")
    if not verify(u, "unsubscribe", sig) or choice not in ("promotions", "all"):
        return _page(*_BAD_LINK, status=403)
    pool = get_pool()
    async with pool.acquire() as conn:
        if choice == "promotions":
            await conn.execute(
                "UPDATE users SET email_promotions = FALSE WHERE wordpress_user_id = $1", u
            )
            msg = "You won't get promotions from us anymore. You'll still hear about news and new features."
        else:
            await conn.execute(
                "UPDATE users SET email_promotions = FALSE, email_updates = FALSE "
                "WHERE wordpress_user_id = $1", u
            )
            msg = "You won't get promotions or updates from us anymore."
    logger.info("unsubscribe wp_user_id=%s choice=%s", u, choice)
    return _page("Done", f"<p>{msg}</p><p class='small'>Emails about your own account still come.</p>"
                         "<p><a href='https://bible.remnantofpromise.org/'>Open the Study Bible</a></p>")


@router.get("/v1/email/winback")
async def winback_open(u: int = Query(...), sig: str = Query(...)):
    """Open full access for 24 hours, the first time the link is tapped.

    Only for someone the offer was actually sent to. A second tap does not
    restart the clock; it just goes on to the pricing page.
    """
    if not verify(u, "winback", sig):
        return _page(*_BAD_LINK, status=403)
    pool = get_pool()
    async with pool.acquire() as conn:
        await conn.execute(
            "UPDATE users SET winback_reopen_until = now() + make_interval(hours => $2) "
            " WHERE wordpress_user_id = $1 "
            "   AND winback_sent_at IS NOT NULL "
            "   AND winback_reopen_until IS NULL",
            u, REOPEN_HOURS,
        )
    return RedirectResponse(PRICING_OFFER_URL, status_code=302)


def list_unsubscribe_headers(wp_user_id: int) -> dict:
    """Headers for promo/update mail so mail apps show their own unsubscribe button."""
    url = unsubscribe_url(wp_user_id)
    return {"List-Unsubscribe": f"<{url}>"} if url else {}
