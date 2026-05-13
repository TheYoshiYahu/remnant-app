"""
Subscriptions router — Phase 4 wheel #7 (Session 37) + #8 (Session 38) + #9 (Session 39).

Four endpoints, mounted on the main app at prefix /v1/subscriptions:

    POST /v1/subscriptions/checkout     (JWT-gated)
    POST /v1/subscriptions/webhook      (Stripe-signed, anonymous)
    POST /v1/subscriptions/cancel       (JWT-gated, Session 39)
    GET  /v1/subscriptions/me           (JWT-gated)

Session 37 wheel scope: everything-annual + the founder-pricing variant
of the everything-annual pair, end-to-end.

Session 38 wheel scope: extended to all eight tier × cadence rows
(study_notes / extras / complete_study × monthly + annual, plus
everything-monthly standard, plus the two everything-annual rows
Session 37 already landed) AND lightweight Stripe promotion-code
support — checkout sessions carry allow_promotion_codes=True, and a
checkout that redeems a code sets subscriptions.is_promo_subscriber=
TRUE and bypasses the founder-cap claim (friends-and-family / tester
comp doesn't consume founder slots, per Yoshi 2026-05-12).

Session 39 wheel scope: partner-initiated cancellation. POST /cancel
calls Stripe's subscription.modify(cancel_at_period_end=True) so the
partner keeps access through the end of their current period and the
locked_price_cents row is preserved (resubscribe before period-end via
the Stripe customer portal restores the same locked price). The local
row's cancel_at_period_end + current_period_end fields are updated
immediately for UX responsiveness; the customer.subscription.updated
webhook (already handled in _handle_subscription_change) syncs Stripe's
canonical state back when the dust settles.

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
            "TRUE to request founder pricing for this row. The founder "
            "variant exists only for the everything-annual pair "
            "(first-100-partners, ~half-off, forever-locked). Any other "
            "tier/cadence combo with is_founder=True returns 404."
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
    is_promo_subscriber: bool = False
    locked_price_cents: Optional[int] = None
    current_period_end: Optional[str] = None
    cancel_at_period_end: bool = False


class CancelResponse(BaseModel):
    """Response payload from POST /v1/subscriptions/cancel.

    Mirrors SubscriptionMeResponse so the Manage surface can swap its
    rendered state in place from the response without a follow-up /me
    fetch. tier/cadence/locked_price_cents are preserved so the partner
    can see exactly what their forever-locked price is during the wind-
    down period.
    """

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
    is_promo_subscriber: bool = False
    locked_price_cents: Optional[int] = None
    current_period_end: Optional[str] = None
    cancel_at_period_end: bool = True


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

    Session 38 expands coverage to all eight tier × cadence rows in
    ``subscription_tier_prices``. The lookup is parametric — anything
    that exists in the catalog (seeded via the operator file) is
    purchasable. Combinations not in the catalog return 404.

    Promotion codes: ``allow_promotion_codes=True`` is passed to Stripe
    on every checkout session. Stripe surfaces the "Add promotion code"
    field in its hosted checkout UI. Code minting + revocation lives in
    the Stripe dashboard (see _scratch/_session38_stripe_pricing_expansion.md).

    Founder-pricing precheck: if ``is_founder=True``, we verify the
    founder pool has slots remaining before creating the checkout. The
    actual atomic claim happens in the webhook on
    checkout.session.completed (see _claim_founder_slot). Promo-code
    redemptions skip the claim entirely (friends/family bypass cap).
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
                    f"is_founder={body.is_founder}. Operator step pending — "
                    f"see _scratch/_session38_stripe_pricing_expansion.md."
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
            # Session 38: surface the Stripe-hosted "Add promotion code"
            # field. Codes themselves are minted in the Stripe dashboard
            # (REMNANT_GIFT generic 100%-off + any per-recipient codes
            # Yoshi adds later) — the API doesn't need to know the code
            # strings. The webhook detects redemption via the
            # total_details.amount_discount / discounts fields on the
            # completed checkout session.
            allow_promotion_codes=True,
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

    Session 38: promotion-code detection. If the completed session has
    a non-zero discount applied (total_details.amount_discount > 0 OR
    the discounts array is non-empty), the row is recorded as a promo
    subscriber: is_promo_subscriber=TRUE, is_founder_pricing=FALSE, no
    founder-slot claim. locked_price_cents records the actual amount
    paid (amount_total from Stripe), which is what the partner is locked
    at going forward — $0 for the generic 100%-off code, partial-off for
    any percent-off codes Yoshi adds later.
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

    # ---- Promo-code detection (Session 38) --------------------------------
    #
    # Stripe surfaces a redeemed promotion code via TWO complementary
    # fields on the completed checkout session:
    #   total_details.amount_discount  — cents discounted on this checkout
    #   discounts                      — array of {coupon, promotion_code}
    # Either signal alone is sufficient; we treat the redemption as
    # detected if either is present.
    total_details = obj.get("total_details") or {}
    amount_discount = int(total_details.get("amount_discount") or 0)
    discounts = obj.get("discounts") or []
    is_promo = (amount_discount > 0) or bool(discounts)

    # Look up the catalog row to read price_cents for the standard path.
    price_row = await _lookup_tier_price_row(conn, tier, cadence, is_founder)
    if price_row is None:
        logger.warning(
            "[checkout-completed] no catalog row for tier=%s cadence=%s founder=%s",
            tier, cadence, is_founder,
        )
        return
    locked_price_cents = price_row["price_cents"]

    # When a promo code was applied, the partner's locked price is what
    # they actually paid (amount_total), not the catalog price. amount_total
    # is cents inclusive of any discount, so $0 for the 100%-off code, $X
    # for any percent-off code.
    if is_promo:
        amount_total = obj.get("amount_total")
        if amount_total is not None:
            locked_price_cents = int(amount_total)

    async with conn.transaction():
        # Atomic founder-slot claim BEFORE the subscription insert. If
        # the cap was exhausted between checkout creation and webhook
        # arrival, the user gets standard pricing on this subscription —
        # the locked_price_cents is taken from the founder catalog row,
        # but is_founder_pricing flips False. Better outcome than a hard
        # fail (the user already paid).
        #
        # Promo-code redemptions skip the claim entirely (friends/family
        # bypass the founder cap per Yoshi's Session 38 call). The catalog
        # row may still be the founder Price (a friend who redeems a code
        # on the founder pricing card), but is_founder_pricing is forced
        # FALSE and is_promo_subscriber is recorded TRUE.
        actual_is_founder = is_founder
        if is_promo:
            actual_is_founder = False
        elif is_founder:
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
            "  is_promo_subscriber, "
            "  current_period_start, current_period_end"
            ") VALUES ("
            "  $1::uuid, $2::content_tier, $3::billing_cadence, 'active', "
            "  $4, $5, $6, $2::content_tier, $7, $8, "
            "  now(), NULL"
            ") "
            "ON CONFLICT (stripe_subscription_id) DO UPDATE SET "
            "  status = 'active', "
            "  current_period_start = COALESCE(subscriptions.current_period_start, now())",
            user_uuid, tier, cadence,
            stripe_subscription_id, stripe_customer_id,
            locked_price_cents, actual_is_founder, is_promo,
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
            "       s.is_founder_pricing, s.is_promo_subscriber, "
            "       s.locked_price_cents, "
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
        is_promo_subscriber=row["is_promo_subscriber"],
        locked_price_cents=row["locked_price_cents"],
        current_period_end=(
            row["current_period_end"].isoformat()
            if row["current_period_end"] is not None else None
        ),
        cancel_at_period_end=row["cancel_at_period_end"],
    )


# ---- POST /cancel ---------------------------------------------------------


@router.post("/cancel", response_model=CancelResponse)
async def cancel_subscription(
    current_user: User = Depends(get_current_user_required),
) -> CancelResponse:
    """Set cancel_at_period_end=True on the partner's active subscription.

    The partner keeps access through the end of their current Stripe
    billing period. locked_price_cents stays on the local row so a
    resubscribe before the period-end via the Stripe customer portal
    restores the same forever-locked price.

    Behavior:
        - 404 when the partner has no row at all (`status='none'`).
        - 200 when the partner has a subscription that Stripe can modify.
          Calls stripe.Subscription.modify(cancel_at_period_end=True), and
          mirrors cancel_at_period_end + current_period_end onto the local
          row immediately for UX responsiveness (the
          customer.subscription.updated webhook will resync Stripe's
          canonical state when it lands a moment later).
        - 200 when the row already carries cancel_at_period_end=True
          (idempotent — partner clicked Cancel twice; we no-op the Stripe
          call and return the current row state).
        - 200 when the row's status is already 'canceled' or 'unpaid' or
          one of the terminal states — no Stripe call, just returns the
          row.
        - 502 when Stripe rejects the modify call (rate limit, bad ID,
          dashboard-side cancellation race, etc.). Local row is unchanged.

    Voice gate: this endpoint is the assembly's response to a partner
    choosing to leave. The framework reading: cancellation is the partner's
    free choice. The endpoint does not gate-keep, does not require a
    reason, does not implore the partner to stay. The Manage UI's confirm
    dialog should match — no "are you sure", no "we'll miss you", no
    spiritual-consequences framing. The honest message is: your access
    continues through the period end, your forever-locked price is
    preserved, and you can resubscribe anytime.
    """
    pool = get_pool()
    wp_user_id = int(current_user.id)

    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT s.id::text AS sub_uuid, s.stripe_subscription_id, "
            "       s.status::text AS status, s.tier::text AS tier, "
            "       s.cadence::text AS cadence, "
            "       s.is_founder_pricing, s.is_promo_subscriber, "
            "       s.locked_price_cents, "
            "       s.current_period_end, s.cancel_at_period_end "
            "  FROM subscriptions s "
            "  JOIN users u ON u.id = s.user_id "
            " WHERE u.wordpress_user_id = $1 "
            " ORDER BY s.started_at DESC "
            " LIMIT 1",
            wp_user_id,
        )

    if row is None:
        raise HTTPException(
            status_code=404,
            detail=(
                "No active partnership found on this account. "
                "Sign in with the WordPress account that holds the partnership."
            ),
        )

    # Terminal states — nothing to cancel; return the row as-is. This is
    # idempotent for the partner who clicks Cancel after their subscription
    # has already wound down.
    terminal_states = ("canceled", "unpaid", "incomplete_expired")
    if row["status"] in terminal_states:
        return CancelResponse(
            status=row["status"],
            tier=row["tier"],
            cadence=row["cadence"],
            is_founder_pricing=row["is_founder_pricing"],
            is_promo_subscriber=row["is_promo_subscriber"],
            locked_price_cents=row["locked_price_cents"],
            current_period_end=(
                row["current_period_end"].isoformat()
                if row["current_period_end"] is not None else None
            ),
            cancel_at_period_end=row["cancel_at_period_end"],
        )

    # Already-cancelled-at-period-end — no Stripe call needed, just echo
    # the current row. Idempotent for the partner clicking Cancel twice.
    if row["cancel_at_period_end"]:
        return CancelResponse(
            status=row["status"],
            tier=row["tier"],
            cadence=row["cadence"],
            is_founder_pricing=row["is_founder_pricing"],
            is_promo_subscriber=row["is_promo_subscriber"],
            locked_price_cents=row["locked_price_cents"],
            current_period_end=(
                row["current_period_end"].isoformat()
                if row["current_period_end"] is not None else None
            ),
            cancel_at_period_end=True,
        )

    stripe_subscription_id = row["stripe_subscription_id"]
    if not stripe_subscription_id:
        # The local row exists but has no Stripe linkage — shouldn't
        # happen in practice (checkout webhook always writes the ID), but
        # surface it cleanly rather than silently passing through.
        raise HTTPException(
            status_code=409,
            detail=(
                "Subscription is in an inconsistent state (no Stripe ID on "
                "file). Please contact the assembly."
            ),
        )

    # ---- Stripe-side flip --------------------------------------------------
    sdk = _stripe_client()
    try:
        stripe_sub = sdk.Subscription.modify(
            stripe_subscription_id,
            cancel_at_period_end=True,
        )
    except stripe.StripeError as e:
        logger.error(
            "[stripe] cancel failed user=%s sub=%s err=%r",
            current_user.id, stripe_subscription_id, e,
        )
        raise HTTPException(
            status_code=502,
            detail=(
                "Stripe could not process the cancellation: "
                f"{e.user_message or str(e)}"
            ),
        )

    # Stripe's response carries the authoritative current_period_end as an
    # epoch second; we mirror it back to the local row. Failure to read it
    # back is non-fatal — the webhook will reconcile.
    stripe_period_end = None
    try:
        stripe_period_end = int(getattr(stripe_sub, "current_period_end", None)
                                or stripe_sub["current_period_end"])
    except (KeyError, TypeError, ValueError):
        stripe_period_end = None

    # ---- Local mirror (UX responsiveness) ----------------------------------
    async with pool.acquire() as conn:
        if stripe_period_end is not None:
            await conn.execute(
                "UPDATE subscriptions SET "
                "  cancel_at_period_end = TRUE, "
                "  current_period_end = to_timestamp($1) "
                "WHERE stripe_subscription_id = $2",
                stripe_period_end, stripe_subscription_id,
            )
        else:
            await conn.execute(
                "UPDATE subscriptions SET cancel_at_period_end = TRUE "
                "WHERE stripe_subscription_id = $1",
                stripe_subscription_id,
            )

        # Re-read the row so the response reflects the post-update state
        # (current_period_end may have been updated above; the rest is
        # unchanged from the initial fetch).
        updated = await conn.fetchrow(
            "SELECT status::text AS status, tier::text AS tier, "
            "       cadence::text AS cadence, "
            "       is_founder_pricing, is_promo_subscriber, "
            "       locked_price_cents, current_period_end, "
            "       cancel_at_period_end "
            "  FROM subscriptions "
            " WHERE stripe_subscription_id = $1",
            stripe_subscription_id,
        )

    if updated is None:
        # The row vanished between the modify and the re-read — extremely
        # unlikely (would require an explicit DELETE), but fall through to
        # the initial row's values rather than 500.
        updated = row

    return CancelResponse(
        status=updated["status"],
        tier=updated["tier"],
        cadence=updated["cadence"],
        is_founder_pricing=updated["is_founder_pricing"],
        is_promo_subscriber=updated["is_promo_subscriber"],
        locked_price_cents=updated["locked_price_cents"],
        current_period_end=(
            updated["current_period_end"].isoformat()
            if updated["current_period_end"] is not None else None
        ),
        cancel_at_period_end=True,
    )


__all__ = ["router", "get_current_user_required"]
