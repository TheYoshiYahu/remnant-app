"""
Subscriptions router — Phase 4 wheel #7 (Session 37).

Three endpoints, mounted on the main app at prefix /v1/subscriptions:

    POST /v1/subscriptions/checkout     (JWT-gated)
    POST /v1/subscriptions/webhook      (Stripe-signed, anonymous)
    GET  /v1/subscriptions/me           (JWT-gated)

Wheel scope: everything-annual + the founder-pricing variant of the
everything-annual pair, end-to-end. Other tiers / cadences / cancellation
flow / paywall UX land in subsequent wheels (Session 38+).

Architecture notes:

- Stripe SDK calls are sync (the SDK is sync). They run inside route
  handlers under FastAPI's threadpool offload — fine for our throughput.
  asyncpg + httpx are async; we use them for DB and the WP-side sync.

- Idempotency for webhook events relies on
  ``purchase_records.stripe_event_id UNIQUE`` (schema-side) — duplicate
  webhook deliveries (Stripe will retry on transient failure) cannot
  double-write a billing row.

- Founder-slot allocation: the ``founder_pricing_counter`` row is the
  single point of truth. The checkout endpoint reads claimed_count and
  rejects with 409 if cap is reached. The webhook (checkout.session.completed)
  performs the actual atomic increment via SELECT FOR UPDATE inside
  the same transaction that inserts the subscription row. Brief race
  window (multiple users clicking founder-checkout in the same second
  while claimed_count < cap) accepts mild over-allocation; for the
  current 100-cap pool with realistic sign-up pace, the over-allocation
  risk is sub-1 partner. Documented and tracked, not a Session 37 fix.

- WP-side partner_tier sync: when a subscription becomes active or
  changes tier, we POST to the WordPress REST API to update the user's
  ``rop_partner_tier`` user-meta. The next JWT issuance picks up the
  new tier (per the WP-side ``jwt_auth_token_before_dispatch`` filter
  Yoshi installed at Session 36 close). The sync is best-effort:
  failure logs but does not raise — the webhook still returns 200 to
  Stripe so Stripe doesn't retry indefinitely.

- User upsert: the ``users`` table is the API-side mirror of WordPress's
  user table. On the first JWT-authenticated subscription action, we
  upsert (wordpress_user_id, email, display_name) -> UUID and use that
  UUID everywhere downstream. The schema's comment names this lazy-
  creation pattern explicitly.
"""

from __future__ import annotations

import json
import logging
import os
from typing import Literal, Optional

import asyncpg
import httpx
import stripe
from fastapi import APIRouter, Depends, Header, HTTPException, Request
from pydantic import BaseModel, Field

from auth import PartnerTier, User, get_current_user_optional
from config import settings
from db import get_pool


logger = logging.getLogger(__name__)


# ---- Required-auth dependency wrapper -------------------------------------
#
# get_current_user_optional returns None for anonymous; the checkout + me
# endpoints need a hard 401 when no user is present. Wrap the optional
# dependency rather than redeclaring the JWT decode chain.

async def get_current_user_required(
    user: Optional[User] = Depends(get_current_user_optional),
) -> User:
    if user is None:
        raise HTTPException(
            status_code=401,
            detail="Authentication required. Sign in at remnantofpromise.org first.",
        )
    return user


# ---- Pydantic request/response models -------------------------------------


class CheckoutCreateRequest(BaseModel):
    tier: PartnerTier = Field(
        ..., description="The partner tier the user is signing up for."
    )
    cadence: Literal["monthly", "annual"] = Field(
        ..., description="Billing cadence."
    )
    is_founder: bool = Field(
        default=False,
        description=(
            "TRUE to request founder pricing for this row. Only the "
            "everything-annual pair has a founder variant in Session 37; "
            "subsequent wheels add the others."
        ),
    )
    success_url: str = Field(
        ...,
        description=(
            "Where Stripe sends the browser after a completed checkout. "
            "Should be a path on bible.remnantofpromise.org."
        ),
    )
    cancel_url: str = Field(
        ...,
        description="Where Stripe sends the browser if the user clicks Cancel.",
    )


class CheckoutCreateResponse(BaseModel):
    checkout_url: str
    stripe_session_id: str


class SubscriptionMeResponse(BaseModel):
    status: Literal[
        "none",
        "trialing",
        "active",
        "past_due",
        "canceled",
        "unpaid",
        "incomplete",
        "incomplete_expired",
    ]
    tier: Optional[PartnerTier] = None
    cadence: Optional[Literal["monthly", "annual"]] = None
    is_founder_pricing: bool = False
    locked_price_cents: Optional[int] = None
    current_period_end: Optional[str] = None
    cancel_at_period_end: bool = False


# ---- Stripe SDK initialisation --------------------------------------------


def _stripe_client() -> stripe:
    """Lazy-init the Stripe SDK with the current API key from settings.

    Returns the ``stripe`` module itself (the SDK uses module-global state).
    Raises 503 if the secret key isn't set — surfaces clearly in the
    operator log when the env var hasn't been populated on Render yet.
    """
    if not settings.stripe_secret_key:
        raise HTTPException(
            status_code=503,
            detail=(
                "Stripe not configured (STRIPE_SECRET_KEY env var unset). "
                "Operator step pending — see _scratch/_session37_stripe_setup.md."
            ),
        )
    stripe.api_key = settings.stripe_secret_key
    return stripe


# ---- DB helpers -----------------------------------------------------------


async def _upsert_user(
    conn: asyncpg.Connection, current_user: User
) -> str:
    """Lazy-upsert the WP user into our ``users`` table; return UUID.

    The schema declares ``users.wordpress_user_id`` UNIQUE; we conflict
    on it. Email and display_name are mirrored from the JWT payload (or
    NULL if the WP-side filter hasn't shipped them yet). Returns the
    users.id UUID as a str.
    """
    wp_user_id = int(current_user.id)
    user_uuid = await conn.fetchval(
        "INSERT INTO users (wordpress_user_id, display_name, last_seen_at) "
        "VALUES ($1, $2, now()) "
        "ON CONFLICT (wordpress_user_id) DO UPDATE SET "
        "  display_name = COALESCE(EXCLUDED.display_name, users.display_name), "
        "  last_seen_at = now() "
        "RETURNING id::text",
        wp_user_id,
        current_user.display_name,
    )
    return user_uuid


async def _lookup_tier_price_row(
    conn: asyncpg.Connection,
    tier: str,
    cadence: str,
    is_founder: bool,
) -> Optional[asyncpg.Record]:
    """Look up the (tier, cadence, is_founder_pricing) row from the catalog."""
    return await conn.fetchrow(
        "SELECT id, price_cents, stripe_price_id, is_active "
        "  FROM subscription_tier_prices "
        " WHERE tier = $1::content_tier "
        "   AND cadence = $2::billing_cadence "
        "   AND is_founder_pricing = $3",
        tier, cadence, is_founder,
    )


async def _founder_slots_remaining(conn: asyncpg.Connection) -> int:
    """Read the founder-pricing counter without locking. Returns slots
    remaining (>=0). Used at checkout time as a fast precheck; the
    authoritative claim happens in the webhook under SELECT FOR UPDATE.
    """
    row = await conn.fetchrow(
        "SELECT cap, claimed_count, closed_at FROM founder_pricing_counter WHERE id = 1"
    )
    if row is None or row["closed_at"] is not None:
        return 0
    return max(0, row["cap"] - row["claimed_count"])


async def _claim_founder_slot(conn: asyncpg.Connection) -> bool:
    """Atomic founder-slot claim. Must be called inside an open transaction.

    Returns True if a slot was claimed (caller may proceed with founder
    subscription), False if the cap is exhausted. Closes the pool when
    claimed_count first reaches cap.
    """
    row = await conn.fetchrow(
        "SELECT cap, claimed_count FROM founder_pricing_counter "
        "WHERE id = 1 FOR UPDATE"
    )
    if row is None:
        # Counter row missing — schema older than session-13. Treat as
        # closed; operator should run the seed script.
        return False
    if row["claimed_count"] >= row["cap"]:
        return False
    new_count = row["claimed_count"] + 1
    await conn.execute(
        "UPDATE founder_pricing_counter SET claimed_count = $1, "
        "  closed_at = CASE WHEN $1 >= cap THEN now() ELSE closed_at END "
        "WHERE id = 1",
        new_count,
    )
    return True


# ---- WordPress sync helper ------------------------------------------------


async def _sync_partner_tier_to_wp(
    wp_user_id: int, tier: str
) -> bool:
    """Best-effort push of the partner_tier value back to WordPress.

    Posts to WP REST API with the configured Application Password. The
    next JWT issuance from the WP plugin picks up the updated user-meta
    via the ``jwt_auth_token_before_dispatch`` filter Yoshi installed
    at Session 36 close.

    Returns True on success, False on any failure. NEVER raises — the
    webhook caller treats failure as a logged-and-skip, so Stripe still
    sees 200 and doesn't retry the whole event over a WP-side blip.
    """
    if not all([
        settings.wp_api_base,
        settings.wp_api_user,
        settings.wp_api_app_password,
    ]):
        logger.warning(
            "[wp-sync] skipped wp_user_id=%s tier=%s — WP_API_* env vars unset",
            wp_user_id, tier,
        )
        return False

    url = f"{settings.wp_api_base.rstrip('/')}/wp/v2/users/{wp_user_id}"
    auth = (settings.wp_api_user, settings.wp_api_app_password)
    body = {"meta": {"rop_partner_tier": tier}}

    try:
        async with httpx.AsyncClient(timeout=10.0) as client:
            resp = await client.post(url, json=body, auth=auth)
        if resp.status_code in (200, 201):
            return True
        logger.warning(
            "[wp-sync] failed wp_user_id=%s tier=%s status=%s body=%s",
            wp_user_id, tier, resp.status_code, resp.text[:300],
        )
        return False
    except Exception as e:  # noqa: BLE001 — best-effort, log everything
        logger.warning(
            "[wp-sync] exception wp_user_id=%s tier=%s err=%r",
            wp_user_id, tier, e,
        )
        return False


# ---- Router ---------------------------------------------------------------


router = APIRouter(tags=["subscriptions"])


# ---- POST /checkout -------------------------------------------------------


@router.post("/checkout", response_model=CheckoutCreateResponse)
async def create_checkout_session(
    body: CheckoutCreateRequest,
    current_user: User = Depends(get_current_user_required),
) -> CheckoutCreateResponse:
    """Create a Stripe Checkout Session for the requested tier × cadence.

    Session 37 wheel scope: only the ``everything`` tier × ``annual``
    cadence (with or without founder pricing) is wired against a Stripe
    Price. Other combinations 404 — they land in subsequent wheels.

    Founder-pricing precheck: if ``is_founder=True``, we verify the
    founder pool has slots remaining before creating the checkout. The
    actual atomic claim happens in the webhook on
    checkout.session.completed (see _claim_founder_slot).
    """
    pool = get_pool()
    sdk = _stripe_client()

    async with pool.acquire() as conn:
        # 1. Confirm the price row exists for the requested tuple.
        price_row = await _lookup_tier_price_row(
            conn, body.tier, body.cadence, body.is_founder,
        )
        if price_row is None or not price_row["is_active"]:
            raise HTTPException(
                status_code=404,
                detail=(
                    f"No active price for tier={body.tier} cadence={body.cadence} "
                    f"is_founder={body.is_founder}. Wheel coverage in Session 37 is "
                    f"the everything-annual pair only; other combinations land in "
                    f"subsequent wheels."
                ),
            )

        # 2. Founder-slot precheck (NOT a claim — claim happens in webhook).
        if body.is_founder:
            remaining = await _founder_slots_remaining(conn)
            if remaining <= 0:
                raise HTTPException(
                    status_code=409,
                    detail=(
                        "Founder pricing is closed. The first 100 partner slots "
                        "have been claimed. Standard pricing is still available."
                    ),
                )

        # 3. Upsert user — get the local UUID for client_reference_id.
        user_uuid = await _upsert_user(conn, current_user)

    # 4. Stripe Checkout Session creation.
    #
    # client_reference_id carries our user UUID across the checkout so
    # the webhook can join Stripe's session back to our user without
    # any other lookup. Mode=subscription tells Stripe to attach a
    # recurring Subscription to the customer.
    try:
        session = sdk.checkout.Session.create(
            mode="subscription",
            line_items=[{"price": price_row["stripe_price_id"], "quantity": 1}],
            success_url=body.success_url,
            cancel_url=body.cancel_url,
            client_reference_id=user_uuid,
            metadata={
                "tier": body.tier,
                "cadence": body.cadence,
                "is_founder_pricing": "true" if body.is_founder else "false",
                "wp_user_id": str(current_user.id),
            },
            subscription_data={
                "metadata": {
                    "tier": body.tier,
                    "cadence": body.cadence,
                    "is_founder_pricing": "true" if body.is_founder else "false",
                    "wp_user_id": str(current_user.id),
                    "user_uuid": user_uuid,
                },
            },
        )
    except stripe.StripeError as e:
        logger.error("[stripe] checkout.create failed user=%s err=%r", current_user.id, e)
        raise HTTPException(
            status_code=502,
            detail=f"Stripe rejected the checkout request: {e.user_message or str(e)}",
        )

    return CheckoutCreateResponse(
        checkout_url=session.url, stripe_session_id=session.id,
    )


# ---- POST /webhook --------------------------------------------------------


@router.post("/webhook")
async def stripe_webhook(
    request: Request,
    stripe_signature: Optional[str] = Header(default=None, alias="Stripe-Signature"),
) -> dict:
    """Stripe webhook receiver.

    Anonymous endpoint — auth is the Stripe-Signature header verified
    against ``STRIPE_WEBHOOK_SECRET``. Handles five event types:

        checkout.session.completed       — write subscription, claim founder slot
        customer.subscription.updated    — sync status / tier changes
        customer.subscription.deleted    — mark canceled
        invoice.paid                     — append purchase_record (idempotent)
        invoice.payment_failed           — append purchase_record (idempotent)

    Always returns 200 once signature is verified — failures inside the
    handler are logged but don't escalate to non-200 (Stripe retries
    non-2xx responses, which would risk duplicate WP-sync calls and
    log spam).
    """
    if not settings.stripe_webhook_secret:
        raise HTTPException(
            status_code=503,
            detail="Webhook not configured (STRIPE_WEBHOOK_SECRET unset).",
        )
    if stripe_signature is None:
        raise HTTPException(status_code=400, detail="Missing Stripe-Signature header.")

    payload_bytes = await request.body()
    try:
        # Verify the signature; we discard the StripeObject return value
        # and re-parse the verified bytes as a plain dict — StripeObject's
        # .get() and item-access surface differs between SDK majors and
        # we want predictable dict semantics in the handlers.
        stripe.Webhook.construct_event(
            payload=payload_bytes,
            sig_header=stripe_signature,
            secret=settings.stripe_webhook_secret,
        )
    except (ValueError, stripe.SignatureVerificationError) as e:
        logger.warning("[stripe-webhook] signature/parse failure: %r", e)
        raise HTTPException(status_code=400, detail="Invalid signature or payload.")

    event = json.loads(payload_bytes)
    event_type = event.get("type")
    event_id = event.get("id")
    obj = (event.get("data") or {}).get("object") or {}

    pool = get_pool()
    try:
        async with pool.acquire() as conn:
            if event_type == "checkout.session.completed":
                await _handle_checkout_completed(conn, event_id, obj)
            elif event_type in ("customer.subscription.updated",
                                "customer.subscription.deleted"):
                await _handle_subscription_change(conn, event_type, obj)
            elif event_type in ("invoice.paid", "invoice.payment_failed"):
                await _handle_invoice_event(conn, event_id, event_type, obj)
            else:
                logger.info("[stripe-webhook] unhandled event_type=%s id=%s",
                            event_type, event_id)
    except Exception as e:  # noqa: BLE001 — log + 200 so Stripe doesn't retry
        logger.exception(
            "[stripe-webhook] handler exception event_type=%s id=%s err=%r",
            event_type, event_id, e,
        )

    return {"received": True, "event_type": event_type, "event_id": event_id}


# ---- Webhook event handlers -----------------------------------------------


async def _handle_checkout_completed(
    conn: asyncpg.Connection, event_id: str, obj: dict,
) -> None:
    """Insert the subscription row + claim founder slot atomically.

    obj is a stripe.checkout.Session dict. metadata carries our tier /
    cadence / founder / wp_user_id; client_reference_id carries our
    users.id UUID. The Stripe Subscription ID lives on obj['subscription'].
    """
    user_uuid = obj.get("client_reference_id")
    metadata = obj.get("metadata") or {}
    tier = metadata.get("tier")
    cadence = metadata.get("cadence")
    is_founder = metadata.get("is_founder_pricing") == "true"
    wp_user_id_str = metadata.get("wp_user_id")
    stripe_subscription_id = obj.get("subscription")
    stripe_customer_id = obj.get("customer")

    if not all([user_uuid, tier, cadence, stripe_subscription_id]):
        logger.warning(
            "[checkout-completed] missing required fields obj_id=%s "
            "user=%s tier=%s cadence=%s subscription=%s",
            obj.get("id"), user_uuid, tier, cadence, stripe_subscription_id,
        )
        return

    # Look up the catalog row to lock the price at signup time.
    price_row = await _lookup_tier_price_row(conn, tier, cadence, is_founder)
    if price_row is None:
        logger.warning(
            "[checkout-completed] no catalog row for tier=%s cadence=%s founder=%s",
            tier, cadence, is_founder,
        )
        return
    locked_price_cents = price_row["price_cents"]

    async with conn.transaction():
        # Atomic founder-slot claim BEFORE the subscription insert. If
        # the cap was exhausted between checkout creation and webhook
        # arrival, the user gets standard pricing on this subscription —
        # the locked_price_cents is taken from the founder catalog row,
        # but is_founder_pricing flips False. Better outcome than a hard
        # fail (the user already paid).
        actual_is_founder = is_founder
        if is_founder:
            claimed = await _claim_founder_slot(conn)
            if not claimed:
                logger.warning(
                    "[checkout-completed] founder slot exhausted at webhook for "
                    "user_uuid=%s — recording as standard pricing",
                    user_uuid,
                )
                actual_is_founder = False
                # Re-look-up the standard price for the locked amount.
                std_row = await _lookup_tier_price_row(
                    conn, tier, cadence, False,
                )
                if std_row is not None:
                    locked_price_cents = std_row["price_cents"]

        # Upsert the subscription row. ON CONFLICT on stripe_subscription_id
        # makes this idempotent across webhook retries.
        await conn.execute(
            "INSERT INTO subscriptions ("
            "  user_id, tier, cadence, status, "
            "  stripe_subscription_id, stripe_customer_id, "
            "  locked_price_cents, locked_at_tier, is_founder_pricing, "
            "  current_period_start, current_period_end"
            ") VALUES ("
            "  $1::uuid, $2::content_tier, $3::billing_cadence, 'active', "
            "  $4, $5, $6, $2::content_tier, $7, "
            "  now(), NULL"
            ") "
            "ON CONFLICT (stripe_subscription_id) DO UPDATE SET "
            "  status = 'active', "
            "  current_period_start = COALESCE(subscriptions.current_period_start, now())",
            user_uuid, tier, cadence,
            stripe_subscription_id, stripe_customer_id,
            locked_price_cents, actual_is_founder,
        )

    # WP-side sync (outside the transaction — best-effort, doesn't roll back the DB).
    if wp_user_id_str:
        try:
            await _sync_partner_tier_to_wp(int(wp_user_id_str), tier)
        except ValueError:
            logger.warning("[checkout-completed] non-int wp_user_id=%r", wp_user_id_str)


async def _handle_subscription_change(
    conn: asyncpg.Connection, event_type: str, obj: dict,
) -> None:
    """Update subscription.status / cancel_at_period_end on lifecycle events."""
    stripe_subscription_id = obj.get("id")
    status = obj.get("status")
    cancel_at_period_end = obj.get("cancel_at_period_end", False)
    current_period_end = obj.get("current_period_end")  # epoch seconds

    if not stripe_subscription_id or not status:
        logger.warning(
            "[subscription-change] missing fields event=%s id=%s status=%s",
            event_type, stripe_subscription_id, status,
        )
        return

    # Map Stripe statuses to our enum (1:1 except deleted -> canceled).
    if event_type == "customer.subscription.deleted":
        status = "canceled"

    await conn.execute(
        "UPDATE subscriptions SET "
        "  status = $1::subscription_status, "
        "  cancel_at_period_end = $2, "
        "  current_period_end = COALESCE(to_timestamp($3), current_period_end), "
        "  canceled_at = CASE WHEN $1 = 'canceled' THEN now() ELSE canceled_at END, "
        "  ended_at = CASE WHEN $1 = 'canceled' THEN now() ELSE ended_at END "
        "WHERE stripe_subscription_id = $4",
        status, cancel_at_period_end, current_period_end, stripe_subscription_id,
    )

    # Sync tier change back to WP. If status is now 'canceled' or 'unpaid',
    # downgrade tier to 'free'. Otherwise re-assert the active tier.
    sub_row = await conn.fetchrow(
        "SELECT s.tier::text, s.status::text, u.wordpress_user_id "
        "  FROM subscriptions s JOIN users u ON u.id = s.user_id "
        " WHERE s.stripe_subscription_id = $1",
        stripe_subscription_id,
    )
    if sub_row is None or sub_row["wordpress_user_id"] is None:
        return
    new_wp_tier = (
        "free"
        if sub_row["status"] in ("canceled", "unpaid", "incomplete_expired")
        else sub_row["tier"]
    )
    await _sync_partner_tier_to_wp(sub_row["wordpress_user_id"], new_wp_tier)


async def _handle_invoice_event(
    conn: asyncpg.Connection, event_id: str, event_type: str, obj: dict,
) -> None:
    """Append a purchase_records row. Idempotent via stripe_event_id UNIQUE."""
    stripe_subscription_id = obj.get("subscription")
    stripe_invoice_id = obj.get("id")
    amount_cents = obj.get("amount_paid", 0) if event_type == "invoice.paid" else 0
    currency = (obj.get("currency") or "USD").upper()
    occurred_epoch = obj.get("status_transitions", {}).get("paid_at") or obj.get("created")

    # Look up our subscription + user via Stripe subscription id.
    sub = await conn.fetchrow(
        "SELECT id::text AS sub_uuid, user_id::text AS user_uuid "
        "  FROM subscriptions WHERE stripe_subscription_id = $1",
        stripe_subscription_id,
    )
    if sub is None:
        # Webhook arrived before checkout.session.completed (race), or
        # for a subscription we don't track. Log and skip — when the
        # checkout event lands, the next invoice will write fresh.
        logger.info(
            "[invoice-event] no subscription found for stripe_subscription_id=%s "
            "(event_id=%s) — skipping record",
            stripe_subscription_id, event_id,
        )
        return

    kind = "subscription_payment" if event_type == "invoice.paid" else "refund"
    # invoice.payment_failed isn't a refund; we use 'subscription_payment'
    # with amount=0 + notes documenting the failure. Schema's purchase_kind
    # enum doesn't carry a 'failure' value; the pattern is "log it as a
    # zero-cents subscription_payment with notes='payment_failed'".
    if event_type == "invoice.payment_failed":
        kind = "subscription_payment"
        notes = "payment_failed"
    else:
        notes = None

    await conn.execute(
        "INSERT INTO purchase_records ("
        "  user_id, subscription_id, kind, amount_cents, currency, "
        "  stripe_event_id, stripe_invoice_id, occurred_at, notes"
        ") VALUES ("
        "  $1::uuid, $2::uuid, $3::purchase_kind, $4, $5, $6, $7, "
        "  COALESCE(to_timestamp($8), now()), $9"
        ") "
        "ON CONFLICT (stripe_event_id) DO NOTHING",
        sub["user_uuid"], sub["sub_uuid"], kind, amount_cents, currency,
        event_id, stripe_invoice_id, occurred_epoch, notes,
    )


# ---- GET /me --------------------------------------------------------------


@router.get("/me", response_model=SubscriptionMeResponse)
async def get_my_subscription(
    current_user: User = Depends(get_current_user_required),
) -> SubscriptionMeResponse:
    """Return the requester's most-recent subscription row.

    Returns ``status='none'`` when no subscription row exists yet (the
    front-end paywall surface uses this to decide whether to show
    "Subscribe" vs "Manage subscription"). The "most-recent" rule
    matters when the user has upgraded/downgraded — each tier change
    creates a new row per the schema's locked_price architecture.
    """
    pool = get_pool()
    wp_user_id = int(current_user.id)
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT s.status::text, s.tier::text, s.cadence::text, "
            "       s.is_founder_pricing, s.locked_price_cents, "
            "       s.current_period_end, s.cancel_at_period_end "
            "  FROM subscriptions s "
            "  JOIN users u ON u.id = s.user_id "
            " WHERE u.wordpress_user_id = $1 "
            " ORDER BY s.started_at DESC "
            " LIMIT 1",
            wp_user_id,
        )

    if row is None:
        return SubscriptionMeResponse(status="none")

    return SubscriptionMeResponse(
        status=row["status"],
        tier=row["tier"],
        cadence=row["cadence"],
        is_founder_pricing=row["is_founder_pricing"],
        locked_price_cents=row["locked_price_cents"],
        current_period_end=(
            row["current_period_end"].isoformat()
            if row["current_period_end"] is not None else None
        ),
        cancel_at_period_end=row["cancel_at_period_end"],
    )


__all__ = ["router", "get_current_user_required"]
