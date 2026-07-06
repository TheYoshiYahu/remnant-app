"""
email.py — minimal transactional-email sender over the Resend HTTP API.

The backend has no mail provider today (no SMTP, no SendGrid/Mailgun — see the
infra map). This module adds one, deliberately tiny: a single async function
that POSTs to Resend's /emails endpoint using httpx (already a project
dependency). No SDK, no global state, no secrets in source.

Configuration (environment only):
  - RESEND_API_KEY   the Resend API key (re_...). REQUIRED to send.
  - RESEND_FROM      the From header, e.g. "Remnant of Promise <hello@remnantofpromise.org>".
                     Falls back to that exact default if unset. The sending
                     domain (remnantofpromise.org) must be verified in Resend
                     with SPF/DKIM DNS records or sends will be rejected — see
                     the DEPLOY/TEST checklist.

Design notes:
  - send_email() returns True on accepted (HTTP 2xx), False on any failure
    (missing key, network error, non-2xx). It never raises — callers (the
    trial-reminder job) branch on the bool to decide whether to mark a row as
    sent, so a failed send simply leaves the row eligible for the next run.
  - Both HTML and plaintext bodies are always sent (multipart/alternative on
    Resend's side) so text-only clients render cleanly.
"""

from __future__ import annotations

import logging
import os
from typing import Optional

import httpx

logger = logging.getLogger("trial_reminders.email")

RESEND_API_URL = "https://api.resend.com/emails"

# Used when RESEND_FROM is unset. Matches the address named in the build plan.
DEFAULT_FROM = "Remnant of Promise <hello@remnantofpromise.org>"


def _api_key() -> Optional[str]:
    key = os.environ.get("RESEND_API_KEY")
    return key if key else None


def _from_header() -> str:
    val = os.environ.get("RESEND_FROM")
    return val if val else DEFAULT_FROM


async def send_email(
    *,
    to: str,
    subject: str,
    html: str,
    text: str,
    timeout_seconds: float = 20.0,
) -> bool:
    """Send one transactional email via Resend. Returns True iff accepted.

    Never raises: every failure mode (no API key, network error, HTTP error
    from Resend) is logged and returned as False so the caller can keep the
    job idempotent (don't mark a user as reminded if the send didn't land).
    """
    key = _api_key()
    if key is None:
        logger.error(
            "RESEND_API_KEY is unset — cannot send to %s. Set it in the "
            "Render cron job's environment.",
            to,
        )
        return False

    payload = {
        "from": _from_header(),
        "to": [to],
        "subject": subject,
        "html": html,
        "text": text,
    }
    headers = {
        "Authorization": f"Bearer {key}",
        "Content-Type": "application/json",
    }

    try:
        async with httpx.AsyncClient(timeout=timeout_seconds) as client:
            resp = await client.post(RESEND_API_URL, headers=headers, json=payload)
    except httpx.HTTPError as exc:
        logger.error("Resend request failed for %s: %r", to, exc)
        return False

    if resp.status_code >= 400:
        # Truncate the body so an unexpected HTML error page can't flood logs.
        logger.error(
            "Resend rejected send to %s — HTTP %s: %s",
            to, resp.status_code, resp.text[:500],
        )
        return False

    logger.info("Resend accepted email to %s (HTTP %s)", to, resp.status_code)
    return True
