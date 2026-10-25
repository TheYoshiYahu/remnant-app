"""
email_links.py — signed links that go inside emails (S467).

Every link carries the WordPress user id plus an HMAC signature, so a link only
works for the person it was sent to and can't be edited to point at someone
else. Key: EMAIL_LINK_SECRET, falling back to BOARD_MOD_SECRET (already set on
Render) so nothing new has to be configured.
"""
from __future__ import annotations

import hashlib
import hmac
import os
from typing import Optional

API_PUBLIC_BASE = os.environ.get("API_PUBLIC_BASE", "https://api.bible.remnantofpromise.org")


def _key() -> bytes:
    s = (
        os.environ.get("EMAIL_LINK_SECRET")
        or os.environ.get("BOARD_MOD_SECRET")
        or os.environ.get("WP_COMPANION_SECRET")
        or ""
    )
    return s.encode()


def sign(wp_user_id: int, purpose: str) -> str:
    key = _key()
    if not key:
        return ""
    msg = f"{int(wp_user_id)}:{purpose}".encode()
    return hmac.new(key, msg, hashlib.sha256).hexdigest()[:32]


def verify(wp_user_id: int, purpose: str, sig: str) -> bool:
    expected = sign(wp_user_id, purpose)
    return bool(expected) and hmac.compare_digest(expected, sig or "")


def unsubscribe_url(wp_user_id: int) -> Optional[str]:
    sig = sign(wp_user_id, "unsubscribe")
    if not sig:
        return None
    return f"{API_PUBLIC_BASE}/v1/email/unsubscribe?u={int(wp_user_id)}&sig={sig}"


def winback_url(wp_user_id: int) -> Optional[str]:
    sig = sign(wp_user_id, "winback")
    if not sig:
        return None
    return f"{API_PUBLIC_BASE}/v1/email/winback?u={int(wp_user_id)}&sig={sig}"
