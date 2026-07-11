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

S114 — DB-wins-over-JWT tier resolution. The JWT ``partner_tier``
claim is now treated as informational. After ``_decode_token``
returns a User, ``get_current_user_optional`` re-resolves the
partner's tier from the ``subscriptions`` table and overwrites the
JWT claim with the DB value. This eliminates the WP-side sync drift
that surfaced in S113 testing — where a partner whose WP
``rop_partner_tier`` user-meta had fallen out of sync with their
DB row saw the chrome treating them as paid (chrome reads
``/v1/subscriptions/me`` which is DB-backed) while API write
endpoints 403'd on paid-only features (those trusted the JWT). With
DB-wins active, the ``subscriptions`` table is the single source of
truth for API tier resolution; WP user-meta drift becomes a
chrome-only concern outside the API's correctness path.

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

import logging
import os
from typing import Literal, Optional

import jwt
from fastapi import Cookie, Depends, Header, HTTPException, status
from pydantic import BaseModel

from db import get_pool, upsert_user

logger = logging.getLogger(__name__)


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


# ---------------------------------------------------------------------------
# No-card free trial.
#
# Every newly created account gets full access for a window after signup —
# no payment method required. Implemented purely as a tier-resolution rule:
# a partner with NO active paid subscription whose local ``users`` row is
# younger than ``TRIAL_DAYS`` resolves to ``TRIAL_TIER`` instead of ``free``.
# A real paid subscription always wins over the trial.
#
# When the window closes the partner drops to ``free`` — their saved notes,
# highlights, bookmarks, and reading positions are untouched (data is never
# tier-gated), so nothing is lost; the premium TOOLS simply lock until they
# upgrade. The trial clock is ``users.created_at`` (seeded on the partner's
# first authenticated request — see ``get_current_user_optional``).
#
# Set ``TRIAL_DAYS = 0`` to switch the trial off without a schema change.
TRIAL_DAYS = 7
TRIAL_TIER: PartnerTier = "everything"


class User(BaseModel):
    """A decoded WordPress user, lifted out of the JWT payload."""

    id: str
    login: Optional[str] = None
    display_name: Optional[str] = None
    partner_tier: PartnerTier = "free"
    # Optional WordPress account email (added to the JWT by rop-sso-bridge).
    # Older tokens minted before that change won't carry it, so it defaults
    # to None and every consumer must tolerate its absence. Cached into
    # users.email by upsert_user so transactional mail (the trial-ending
    # reminder job) can reach the partner.
    email: Optional[str] = None


# Subscription statuses that count as terminated — no active access. This is
# the single named definition of "not a live subscription," mirrored from the
# inline list in _resolve_tier_from_db's SQL below. It is exported so the
# trial-reminder job (jobs/trial_reminders.py) and any other caller share one
# source of truth via has_active_paid_subscription() rather than re-deriving it.
TERMINAL_SUBSCRIPTION_STATUSES = ("canceled", "unpaid", "incomplete_expired")


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

    # Optional email claim (rop-sso-bridge adds it; older tokens omit it).
    # Coerce to a clean str or None — never let a malformed claim raise.
    raw_email = user.get("email")
    email = raw_email if isinstance(raw_email, str) and raw_email.strip() else None

    try:
        return User(
            id=str(raw_id),
            login=user.get("login"),
            display_name=user.get("display_name"),
            partner_tier=raw_tier,  # type: ignore[arg-type]
            email=email,
        )
    except Exception:
        return None


async def _resolve_tier_from_db(wp_user_id_str: str) -> Optional[PartnerTier]:
    """Resolve the partner's tier from the ``subscriptions`` table.

    The single source of truth for API tier resolution (S114). The
    JWT's ``partner_tier`` claim is informational — it's seeded by
    the WP-side ``rop_partner_tier`` user-meta, which can drift out
    of sync with our ``subscriptions`` table when a webhook fails,
    arrives before the WP companion plugin was installed, or simply
    never fired (the row predates the sync architecture). The DB
    always wins.

    Query semantics — newest non-terminal subscription row wins. The
    terminal-status list (``canceled``, ``unpaid``,
    ``incomplete_expired``) matches ``_handle_subscription_change``
    in ``subscriptions.py`` exactly, so the same statuses that
    downgrade WP to free here also resolve to free.
    ``cancel_at_period_end=True`` partners stay on their paid tier
    until ``status`` flips to ``canceled`` at period_end — they're
    still ``active`` in the row, so they fall through to the paid
    tier.

    Returns:
        - The partner's active tier ('study_notes' / 'extras' /
          'complete_study' / 'everything') if they have a
          non-terminal subscription row.
        - ``'free'`` if the partner has a users row but no
          non-terminal subscription.
        - ``None`` on transient DB failure — caller falls back to
          the JWT claim as graceful degradation, so a flaky DB
          doesn't kick every partner down to free mid-session.
    """
    try:
        wp_user_id = int(wp_user_id_str)
    except (TypeError, ValueError):
        return None

    try:
        pool = get_pool()
        async with pool.acquire() as conn:
            row = await conn.fetchrow(
                "SELECT "
                "    (u.created_at > now() - make_interval(days => $2)) AS in_trial, "
                "    ( "
                "      SELECT s.tier::text "
                "        FROM subscriptions s "
                "       WHERE s.user_id = u.id "
                # A row grants its tier while it is a LIVE subscription
                # (anything but the terminal statuses) OR — for a partner
                # who canceled auto-renew — while the period they already
                # PAID FOR has not yet ended. An annual partner who cancels
                # keeps access until current_period_end; only then do they
                # drop to free. 'unpaid'/'incomplete_expired' never get this
                # window (no paid period to honor).
                "         AND ( "
                "               s.status NOT IN ('canceled', 'unpaid', 'incomplete_expired') "
                "               OR ( "
                "                    s.status = 'canceled' "
                "                    AND s.current_period_end IS NOT NULL "
                "                    AND s.current_period_end > now() "
                "               ) "
                "             ) "
                "       ORDER BY s.started_at DESC "
                "       LIMIT 1 "
                "    ) AS tier "
                "  FROM users u "
                " WHERE u.wordpress_user_id = $1",
                wp_user_id,
                TRIAL_DAYS,
            )
    except Exception as exc:
        # Transient DB failure (pool exhausted, connection reset,
        # etc.) — degrade gracefully to the JWT claim rather than
        # silently downgrading every partner to free.
        logger.warning(
            "[auth] db-tier lookup failed wp_user_id=%s err=%s",
            wp_user_id_str, exc,
        )
        return None

    if row is None:
        # No local users row yet. The row is seeded on the partner's
        # first authenticated request (see get_current_user_optional),
        # so this is the brief pre-seed window or a token that never
        # reached an authed route. Treat as free.
        return "free"

    paid_tier = row["tier"]

    if paid_tier is not None:
        # An active (non-terminal) subscription always wins over the
        # trial. Validate defensively against the PartnerTier Literal.
        if paid_tier not in {
            "free",
            "study_notes",
            "extras",
            "complete_study",
            "everything",
        }:
            logger.warning(
                "[auth] db returned unknown tier=%r wp_user_id=%s — downgrading to free",
                paid_tier, wp_user_id_str,
            )
            return "free"
        return paid_tier  # type: ignore[return-value]

    # No active paid subscription. Grant the no-card trial while the
    # account is still inside its window; otherwise the partner is free.
    if TRIAL_DAYS > 0 and row["in_trial"]:
        return TRIAL_TIER

    return "free"


async def has_active_paid_subscription(wp_user_id: int) -> bool:
    """True if the WordPress user has a non-terminal (paid) subscription row.

    This is the PAID check, deliberately independent of the no-card trial:
    a partner inside their trial window has full access via TRIAL_TIER but
    holds NO subscription row, so this returns False for them. The
    trial-reminder job uses this to email only trial users who have NOT yet
    converted to a paid plan — _resolve_tier_from_db can't serve that need
    because it returns TRIAL_TIER ("everything") for in-trial users, which is
    indistinguishable from a paid "everything" tier by return value alone.

    Semantics match the newest-non-terminal-row logic in
    _resolve_tier_from_db, using the shared TERMINAL_SUBSCRIPTION_STATUSES
    constant so the two never drift. Existence is all that matters here, so
    no ORDER BY is needed. Raises on DB error (the caller logs + skips).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT 1 "
            "  FROM subscriptions s "
            "  JOIN users u ON u.id = s.user_id "
            " WHERE u.wordpress_user_id = $1 "
            "   AND s.status <> ALL($2::text[]) "
            " LIMIT 1",
            wp_user_id,
            list(TERMINAL_SUBSCRIPTION_STATUSES),
        )
    return row is not None


def _reconcile_membership_tier(
    jwt_tier: PartnerTier, db_tier: PartnerTier
) -> PartnerTier:
    """Fold the request-validated WP/JWT membership claim into the DB tier.

    Background — the S114 "DB-wins-over-JWT" rule was introduced to stop a
    *stale, over-claiming JWT* from beating the ``subscriptions`` table: a
    partner whose Stripe sub was canceled/downgraded still carried an old
    ``partner_tier`` in their week-long cookie, and we must serve the DB's
    canonical (lower) tier for them. That protection matters precisely when
    the DB *asserts* something about the partner — an active/trialing row.

    But there is a second population the original rule silently harmed:
    people who are **already members on the WordPress side** (many predate
    this app) and have **no ``subscriptions`` row at all** because they never
    ran the app's own Stripe checkout. For them ``_resolve_tier_from_db``
    finds no active row and, once their no-card trial window lapses, returns
    ``'free'`` — locking them out of the paid content their membership
    entitles them to, even though the trusted WP SSO source asserted their
    tier in the JWT this very request.

    The fix distinguishes "DB asserts a tier" from "DB is silent":

      * ``db_tier`` is a PAID tier (an active subscription OR the in-window
        no-card trial, which ``_resolve_tier_from_db`` returns as
        ``TRIAL_TIER``) → the DB/trial wins outright and the JWT is ignored.
        A stale over-claiming JWT can NEVER beat a live DB row — S114's
        anti-drift guarantee is preserved exactly.

      * ``db_tier`` is ``'free'`` → the DB is SILENT: no active row and not
        inside the trial window (also the brief pre-seed window). Here the
        request-time-validated JWT ``partner_tier`` is the best available
        truth for whether this WordPress user is a member and at what tier,
        so we honor it. Genuine free users carry ``partner_tier='free'`` in
        their token, so this grants them nothing — no over-grant.

    The one residual trade-off is bounded and acceptable: a member whose WP
    membership is revoked keeps access until their ``rop_jwt`` cookie
    refreshes with the lower tier (≤ the 7-day cookie lifetime, sooner on
    any WP login / admin visit — see rop-sso-bridge.php). This is the
    standard token-freshness window and only applies to WP-native
    memberships; Stripe cancellations still flip instantly because they
    write a DB row that takes the DB-wins branch above.
    """
    if db_tier == "free":
        return jwt_tier
    return db_tier


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

    Tier resolution (S114): after decoding the token, the dependency
    re-resolves ``partner_tier`` from the ``subscriptions`` table
    and overwrites the JWT claim with the DB value. DB wins. The
    JWT claim becomes graceful fallback for transient DB failures
    only — see ``_resolve_tier_from_db``.
    """
    user: Optional[User] = None

    # Cookie path first — the SSO default.
    if rop_jwt:
        user = _decode_token(rop_jwt)

    # Authorization-header fallback. Accept the literal "Bearer "
    # prefix (case-insensitive on the scheme) per RFC 6750.
    if user is None and authorization:
        parts = authorization.split(None, 1)
        if len(parts) == 2 and parts[0].lower() == "bearer":
            token = parts[1].strip()
            if token:
                user = _decode_token(token)

    if user is None:
        return None

    # Seed the local users row on the partner's FIRST authenticated
    # request (not just first write). This guarantees users.created_at
    # exists — the no-card trial clock reads it, so a partner browsing
    # premium content read-only still gets their trial window. Failure
    # here must never break auth, so it's swallowed: worst case the
    # trial simply doesn't start until the partner's first write.
    try:
        pool = get_pool()
        async with pool.acquire() as conn:
            await upsert_user(conn, user)
    except Exception as exc:
        logger.warning(
            "[auth] user-seed upsert failed id=%s err=%s", user.id, exc
        )

    # Tier resolution. On lookup success, reconcile the DB result with the
    # JWT membership claim via _reconcile_membership_tier: an active/trialing
    # DB tier wins outright (DB-wins / anti-stale preserved), but when the DB
    # is silent (no active row, not in trial → 'free') the request-validated
    # WP/JWT membership tier is honored so WordPress-side members who never
    # ran the app's Stripe checkout are recognized instead of dropped to
    # free. On transient DB failure (None return) the JWT claim stays —
    # partner keeps whatever access the cookie bought them rather than
    # getting kicked to free.
    db_tier = await _resolve_tier_from_db(user.id)
    if db_tier is not None:
        effective_tier = _reconcile_membership_tier(user.partner_tier, db_tier)
        if effective_tier != user.partner_tier:
            user = user.model_copy(update={"partner_tier": effective_tier})

    return user


async def get_current_user_required(
    user: Optional[User] = Depends(get_current_user_optional),
) -> User:
    """FastAPI dependency: return the WordPress user; 401 if none.

    The auth-required twin of ``get_current_user_optional``. Every
    per-user write endpoint (highlights, notes, reading-positions,
    subscriptions) depends on this. Anonymous callers get a 401 with a
    Bearer realm so the front-end can route them to the WP login surface.

    Added in S113 alongside the highlights wheel. Mirrors the same JWT-
    decode path as ``get_current_user_optional`` — there's no separate
    secret or claim to validate; only the None case is different.
    """
    if user is None:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Authentication required.",
            headers={"WWW-Authenticate": "Bearer"},
        )
    return user


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
    "get_current_user_required",
    "user_tier",
]
