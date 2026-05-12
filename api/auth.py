"""
JWT authentication dependency for the API.

Phase 4 wheel #6 (SSO with WordPress). Decodes the WordPress-issued JWT
on every request and surfaces an optional User object to route handlers.

Source of the token: the WordPress plugin *JWT Authentication for WP
REST API* (Enrique Chavez, mature, widely-used) issues a signed JWT
when a user logs in. The Session-37 WordPress-side login handler will
set that token as a cross-subdomain cookie at Domain=.remnantofpromise.org
so the bible.remnantofpromise.org front-end picks it up automatically.

Wire shape: ``get_current_user_optional`` reads the token from EITHER:
    (a) the ``rop_jwt`` cookie (the SSO path — default once Session 37
        wires the WordPress login redirect), or
    (b) the ``Authorization: Bearer <token>`` header (the explicit-attach
        path the front-end uses today, the path direct-API testing uses,
        and the path future mobile clients will use).

Cookie wins when both are present (the SSO source-of-truth). Either
path resolves to the same User object.

Anonymous endpoints (the public canon at /v1/books, /v1/books/{slug},
/v1/books/{slug}/chapters, /v1/books/{slug}/chapters/{n}) must still
work without a token, so the dependency returns ``None`` rather than
raising 401 when no token is present. The endpoint then treats the
caller as the 'free' tier — sees the 66-book canon, not the 153-book
full corpus.

Tier defaulting: if the JWT is valid but carries no ``partner_tier``
claim (the WordPress-side custom-meta filter isn't installed yet, or
the user has no subscription), the User object's ``partner_tier`` is
``'free'`` — same effective access as anonymous. This lets the wheel
land before the WordPress-side custom-meta filter is wired; once the
filter is in place, the same code lights up the paid tiers.

Token payload contract (the WP plugin's stock shape):

    {
        "iss": "https://remnantofpromise.org",
        "iat": 1730000000,
        "nbf": 1730000000,
        "exp": 1730086400,
        "data": {
            "user": {
                "id": "1",
                "login": "yoshi",         # added by WP-side filter (Session 37)
                "display_name": "Yoshi",  # added by WP-side filter (Session 37)
                "partner_tier": "everything"  # added by WP-side filter (Session 37)
            }
        }
    }

The stock plugin emits only ``data.user.id`` by default; ``login``,
``display_name``, and ``partner_tier`` arrive via the
``jwt_auth_token_before_dispatch`` WP filter named in the Session-37
install file at ``_scratch/_session36_wp_install.md``.
"""

from __future__ import annotations

import os
from typing import Literal, Optional

import jwt
from fastapi import Cookie, Depends, Header
from pydantic import BaseModel


# Cookie name the SSO bridge sets. Lowercase + snake_case so it
# travels well through every WP plugin / redirect handler that has to
# touch it. The bible-app front-end reads this same name out of
# document.cookie when it wants to attach a Bearer header.
SSO_COOKIE_NAME = "rop_jwt"

# JWT signing algorithm. The WordPress plugin signs with HS256 (HMAC
# + SHA-256) using the shared secret in wp-config.php's
# JWT_AUTH_SECRET_KEY. We verify with the same secret + algorithm.
JWT_ALGORITHM = "HS256"


PartnerTier = Literal[
    "free",
    "study_notes",
    "extras",
    "complete_study",
    "everything",
]


class User(BaseModel):
    """A decoded WordPress user, lifted out of the JWT payload."""

    id: str
    login: Optional[str] = None
    display_name: Optional[str] = None
    partner_tier: PartnerTier = "free"


def _jwt_secret() -> Optional[str]:
    """Read the shared secret from the JWT_SECRET env var.

    Render dashboard sets this on the remnant-app-api service (see
    ``_scratch/_session36_wp_install.md``). When the env var is unset
    we return None and the dependency treats every token as invalid —
    effectively forcing the anonymous path. This is the right local
    default so a clean checkout doesn't accidentally accept unsigned
    tokens.
    """
    secret = os.environ.get("JWT_SECRET")
    return secret if secret else None


def _decode_token(token: str) -> Optional[User]:
    """Verify the token's signature and extract the User.

    Returns None for any failure mode — invalid signature, expired
    token, missing payload structure, malformed claims. Anonymous-
    friendly endpoints route the None case through the same
    'caller is free tier' branch they use for missing-token requests,
    so a broken token never escalates to 401.
    """
    secret = _jwt_secret()
    if not secret:
        return None

    try:
        payload = jwt.decode(
            token,
            secret,
            algorithms=[JWT_ALGORITHM],
            # require exp + iat — both are stock in the WP plugin's
            # payload. Lifetime is enforced by pyjwt's exp check.
            options={"require": ["exp", "iat"]},
        )
    except jwt.PyJWTError:
        return None

    data = payload.get("data") or {}
    user = data.get("user") or {}
    raw_id = user.get("id")
    if raw_id is None:
        return None

    raw_tier = user.get("partner_tier", "free")
    if raw_tier not in {
        "free",
        "study_notes",
        "extras",
        "complete_study",
        "everything",
    }:
        # An unknown tier name (typo, future tier not yet in this
        # schema, etc.) downgrades to 'free' rather than tripping a
        # 500. Belt-and-suspenders next to the Literal type.
        raw_tier = "free"

    try:
        return User(
            id=str(raw_id),
            login=user.get("login"),
            display_name=user.get("display_name"),
            partner_tier=raw_tier,  # type: ignore[arg-type]
        )
    except Exception:
        return None


async def get_current_user_optional(
    rop_jwt: Optional[str] = Cookie(default=None, alias=SSO_COOKIE_NAME),
    authorization: Optional[str] = Header(default=None),
) -> Optional[User]:
    """FastAPI dependency: return the WordPress user if a valid token
    is present, ``None`` otherwise.

    Cookie wins if both cookie and Authorization header are present —
    the cookie is the SSO source-of-truth once Session 37's login
    redirect lands. The Authorization-header branch stays for direct
    API testing, the front-end's belt-and-suspenders attach, and
    future mobile clients.
    """
    # Cookie path first — the SSO default.
    if rop_jwt:
        user = _decode_token(rop_jwt)
        if user is not None:
            return user

    # Authorization-header fallback. Accept the literal "Bearer "
    # prefix (case-insensitive on the scheme) per RFC 6750.
    if authorization:
        parts = authorization.split(None, 1)
        if len(parts) == 2 and parts[0].lower() == "bearer":
            token = parts[1].strip()
            if token:
                return _decode_token(token)

    return None


def user_tier(user: Optional[User]) -> PartnerTier:
    """Effective tier for filter queries.

    Anonymous callers and authenticated-but-no-tier callers both
    resolve to ``'free'``. This is the single helper the route
    handlers call to get the value they hand to the SQL's
    ``tier_satisfies()`` function.
    """
    if user is None:
        return "free"
    return user.partner_tier


__all__ = [
    "User",
    "PartnerTier",
    "SSO_COOKIE_NAME",
    "get_current_user_optional",
    "user_tier",
]
