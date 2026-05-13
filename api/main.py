"""
The Remnant of Promise Official Study Bible — FastAPI app.

Route surfaces:

    GET  /v1/health
    GET  /v1/books
    GET  /v1/books/{book_slug}
    GET  /v1/books/{book_slug}/chapters
    GET  /v1/books/{book_slug}/chapters/{chapter_number}
    GET  /v1/verses/search?q=...
    POST /v1/subscriptions/checkout         (Session 37, JWT-gated)
    POST /v1/subscriptions/webhook          (Session 37, Stripe-signed)
    POST /v1/subscriptions/cancel           (Session 39, JWT-gated)
    GET  /v1/subscriptions/me               (Session 37, JWT-gated)

Auth: Phase 4 wheel #6 (Session 36) wires the JWT-aware tier filter on
the four /v1/books routes. The dependency at ``auth.get_current_user_optional``
decodes a WordPress-issued JWT from either the ``rop_jwt`` cross-subdomain
cookie or an ``Authorization: Bearer`` header, surfaces a typed
``User | None``, and the route handlers use the PG ``tier_satisfies()``
function to filter the response by the caller's partner tier. Anonymous
callers resolve to the 'free' tier — 66-book canon only. Single-book
endpoints return 404 when the caller's tier doesn't satisfy the book's
``tier_required`` (hides existence rather than 401-revealing).

``/v1/verses/search`` is NOT yet tier-filtered — search hits could surface
verses from books the caller can't normally read. Tracked as a follow-up;
not part of the Session 36 wheel scope.

Subscriptions (Session 37, Phase 4 wheel #7): Stripe Checkout + webhook +
me-endpoint for the everything-annual tier and its founder-pricing variant
(first 100 partners at 50% off forever-locked). The webhook syncs
partner_tier back to WordPress via the WP REST API on subscription
activation so the next JWT issuance picks up the new tier. See
``subscriptions.py`` for the wheel scope and the ``_scratch/_session37_*``
files for the operator-onboarding paths.

Subscriptions expansion (Session 38, Phase 4 wheel #8): all eight tier ×
cadence rows now purchasable (study_notes / extras / complete_study ×
monthly + annual, plus everything-monthly standard + founder), and
``allow_promotion_codes=True`` is passed on every Stripe Checkout
session. Promo-code redemptions (FRIENDS_FAMILY 100% off + FOUNDER50
50% off) are detected webhook-side via Stripe's discount fields, get
``subscriptions.is_promo_subscriber=TRUE``, and bypass the founder-cap
claim — friends/family and honorary-founder partners don't consume one
of the 100 founder slots. ``subscription_tier_prices`` catalog is fully
seeded; ``schema_version`` lifts to ``1.0.0-phase4-session38``. See
``_scratch/_session38_stripe_pricing_expansion.md`` for the operator
walkthrough and the new ``app/src/routes/Pricing.tsx`` for the partner-
facing surface.

Cancellation flow (Session 39, Phase 4 wheel #9): partner-initiated
cancellation lands as POST /v1/subscriptions/cancel (JWT-gated) plus a
new partner-facing Manage surface at /manage. The endpoint calls
Stripe's Subscription.modify(cancel_at_period_end=True), so access
continues through the end of the current billing period and the
forever-locked price is preserved on the local row (resubscribe before
period-end via the Stripe customer portal restores the same price).
The Manage UI's confirm dialog runs through the voice gate — no
"are you sure", no "we'll miss you", no spiritual-consequences framing;
the honest message is *your access continues through the period end,
you can resubscribe anytime, and your forever-locked price is preserved*.
The customer.subscription.updated webhook (Session 37) already syncs
cancel_at_period_end back from Stripe, so the local row converges to
canonical state without further wiring.

Pre-PWA-deploy polish (Session 40, Phase 4 wheel #10): two source-level
bugs surfaced during Session 39's live-verification dance and land
ahead of the PWA static-site deploy. (i) Stripe deprecated the
top-level Subscription.current_period_end in API version
2024-09-30.acacia and moved it to subscription.items.data[0].
current_period_end; both cancel_subscription and the
customer.subscription.updated handler were reading the deprecated
path and quietly populating None into the local row's period_end.
Shared _extract_period_end helper walks both paths so live and
fixture payloads resolve. (ii) The Reader's book-picker option keys
move from b.slug to b.id — Session 35's composite UNIQUE on
books.(edition_id, slug) means slugs aren't unique across editions
anymore (judith / 1-esdras / tobit / 1-maccabees / 2-maccabees each
appear in both apocrypha and apocrypha-charles-vol1), and React was
flooding the console with duplicate-key warnings on every Reader
render. The picker fix is a one-line front-end change. The third
piece of the Session 40 wheel — the PWA static-site deploy itself —
lives in hosting/render.yaml + DNS, not in this module.

Run: uvicorn main:app --reload
"""

from __future__ import annotations

from contextlib import asynccontextmanager
from datetime import datetime, timezone
from typing import List, Optional

from fastapi import Depends, FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware

from auth import User, get_current_user_optional, user_tier
from config import settings
from db import close_pool, get_pool, open_pool
from models import (
    BookChaptersResponse,
    BookDetail,
    BookSummary,
    ChapterDetail,
    ChapterSummary,
    HealthResponse,
    Verse,
    VerseSearchHit,
    VerseSearchResponse,
)
from subscriptions import router as subscriptions_router


# ----- App lifespan -------------------------------------------------------


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Open the asyncpg pool at startup, close it at shutdown."""
    await open_pool()
    try:
        yield
    finally:
        await close_pool()


app = FastAPI(
    title="Remnant of Promise Official Study Bible — API",
    version="0.6.0-phase4-session40",
    description=(
        "Phase 4 API: books, chapters, verses, trigram search, plus the "
        "Stripe subscription surface — checkout, webhook, me, partner-"
        "initiated cancellation (cancel_at_period_end + forever-locked "
        "price preserved). Session 40 patches the period_end extraction "
        "path to handle Stripe API 2024-09-30.acacia's move of "
        "current_period_end from the Subscription onto items.data[0]."
    ),
    lifespan=lifespan,
)


app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origin_list,
    allow_credentials=True,
    allow_methods=["GET", "POST", "PATCH", "DELETE", "OPTIONS"],
    allow_headers=["*"],
)


# Subscriptions router — Session 37 wheel.
app.include_router(subscriptions_router, prefix="/v1/subscriptions")


# ----- Helpers ------------------------------------------------------------


def _book_summary_from_row(row) -> BookSummary:
    return BookSummary(
        id=row["id"],
        slug=row["slug"],
        title=row["title"],
        short_title=row["short_title"],
        canonical_order=row["canonical_order"],
        witness_category=row["witness_category"],
        tier_required=row["tier_required"],
        abstract=row["abstract"],
        edition_slug=row["edition_slug"],
    )


# ----- Health -------------------------------------------------------------


@app.get("/v1/health", response_model=HealthResponse)
async def health() -> HealthResponse:
    """
    Liveness + DB-reachability probe.

    Returns the schema_version row when the DB is up; "degraded" when it
    isn't. Hosting health-checks point here.
    """
    pool = get_pool()
    db_reachable = False
    schema_version: Optional[str] = None
    try:
        async with pool.acquire() as conn:
            schema_version = await conn.fetchval(
                "SELECT version FROM schema_version WHERE id = 1"
            )
            db_reachable = True
    except Exception:
        db_reachable = False
    return HealthResponse(
        status="ok" if db_reachable else "degraded",
        schema_version=schema_version,
        db_reachable=db_reachable,
        checked_at=datetime.now(timezone.utc),
    )


# ----- Books --------------------------------------------------------------


@app.get("/v1/books", response_model=List[BookSummary])
async def list_books(
    witness_category: Optional[str] = Query(
        default=None,
        description=(
            "Filter to a single witness category — canon, apocrypha, "
            "pseudepigrapha, apostolic_fathers, apocryphal_gospels, "
            "historical_witness, disputed_witness."
        ),
    ),
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> List[BookSummary]:
    """
    List books visible to the requester.

    Tier filter (Session 36): the response is filtered by the caller's
    partner tier against each book's ``tier_required``, using the
    schema's ``tier_satisfies()`` lattice function. Anonymous callers
    and the 'free' tier see the 66-book canon; 'extras' and above see
    the full 153-book corpus. The order is canonical_order so the free
    canon appears first, then the extras manifest in inventory order.
    """
    pool = get_pool()
    tier = user_tier(current_user)

    sql = (
        "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
        "       b.witness_category::text AS witness_category, "
        "       b.tier_required::text   AS tier_required, "
        "       b.abstract, e.slug AS edition_slug "
        "  FROM books b "
        "  JOIN editions e ON e.id = b.edition_id "
        " WHERE tier_satisfies($1::content_tier, b.tier_required) "
    )
    params: list = [tier]
    if witness_category is not None:
        sql += "   AND b.witness_category = $2::witness_category"
        params.append(witness_category)
    sql += " ORDER BY b.canonical_order ASC, b.id ASC"

    async with pool.acquire() as conn:
        rows = await conn.fetch(sql, *params)
    return [_book_summary_from_row(r) for r in rows]


@app.get("/v1/books/{book_slug}", response_model=BookDetail)
async def get_book(
    book_slug: str,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> BookDetail:
    """One book — by slug — with a chapter count for the reader UI.

    Returns 404 when the caller's tier doesn't satisfy the book's
    ``tier_required`` (hides existence rather than 401-revealing).
    """
    pool = get_pool()
    tier = user_tier(current_user)
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
            "       b.witness_category::text AS witness_category, "
            "       b.tier_required::text   AS tier_required, "
            "       b.abstract, e.slug AS edition_slug, "
            "       (SELECT count(*)::int FROM chapters c WHERE c.book_id = b.id) AS chapter_count "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1 "
            "   AND tier_satisfies($2::content_tier, b.tier_required)",
            book_slug,
            tier,
        )
    if row is None:
        raise HTTPException(status_code=404, detail=f"Book '{book_slug}' not found.")
    summary = _book_summary_from_row(row)
    return BookDetail(**summary.model_dump(), chapter_count=row["chapter_count"])


@app.get("/v1/books/{book_slug}/chapters", response_model=BookChaptersResponse)
async def list_chapters(
    book_slug: str,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> BookChaptersResponse:
    """All chapters for a book, with verse counts. No verse text.

    Returns 404 when the caller's tier doesn't satisfy the book's
    ``tier_required``.
    """
    pool = get_pool()
    tier = user_tier(current_user)
    async with pool.acquire() as conn:
        book_row = await conn.fetchrow(
            "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
            "       b.witness_category::text AS witness_category, "
            "       b.tier_required::text   AS tier_required, "
            "       b.abstract, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1 "
            "   AND tier_satisfies($2::content_tier, b.tier_required)",
            book_slug,
            tier,
        )
        if book_row is None:
            raise HTTPException(status_code=404, detail=f"Book '{book_slug}' not found.")
        chapter_rows = await conn.fetch(
            "SELECT c.id, c.chapter_number, c.chapter_title, "
            "       (SELECT count(*)::int FROM verses v WHERE v.chapter_id = c.id) AS verse_count "
            "  FROM chapters c "
            " WHERE c.book_id = $1 "
            " ORDER BY c.chapter_number ASC",
            book_row["id"],
        )

    chapters = [
        ChapterSummary(
            id=r["id"],
            chapter_number=r["chapter_number"],
            chapter_title=r["chapter_title"],
            verse_count=r["verse_count"],
        )
        for r in chapter_rows
    ]
    return BookChaptersResponse(
        book=_book_summary_from_row(book_row),
        chapters=chapters,
    )


@app.get(
    "/v1/books/{book_slug}/chapters/{chapter_number}",
    response_model=ChapterDetail,
)
async def get_chapter(
    book_slug: str,
    chapter_number: int,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> ChapterDetail:
    """One chapter — full verse list, in verse_number order.

    Returns 404 when the caller's tier doesn't satisfy the book's
    ``tier_required``.
    """
    pool = get_pool()
    tier = user_tier(current_user)
    async with pool.acquire() as conn:
        book_row = await conn.fetchrow(
            "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
            "       b.witness_category::text AS witness_category, "
            "       b.tier_required::text   AS tier_required, "
            "       b.abstract, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1 "
            "   AND tier_satisfies($2::content_tier, b.tier_required)",
            book_slug,
            tier,
        )
        if book_row is None:
            raise HTTPException(status_code=404, detail=f"Book '{book_slug}' not found.")
        chapter_row = await conn.fetchrow(
            "SELECT c.id, c.chapter_number, c.chapter_title, c.chapter_intro, "
            "       (SELECT count(*)::int FROM verses v WHERE v.chapter_id = c.id) AS verse_count "
            "  FROM chapters c "
            " WHERE c.book_id = $1 AND c.chapter_number = $2",
            book_row["id"],
            chapter_number,
        )
        if chapter_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Chapter {chapter_number} not found in '{book_slug}'.",
            )
        verse_rows = await conn.fetch(
            "SELECT id, verse_number, text "
            "  FROM verses "
            " WHERE chapter_id = $1 "
            " ORDER BY verse_number ASC",
            chapter_row["id"],
        )

    verses = [
        Verse(id=r["id"], verse_number=r["verse_number"], text=r["text"])
        for r in verse_rows
    ]
    return ChapterDetail(
        book=_book_summary_from_row(book_row),
        chapter=ChapterSummary(
            id=chapter_row["id"],
            chapter_number=chapter_row["chapter_number"],
            chapter_title=chapter_row["chapter_title"],
            verse_count=chapter_row["verse_count"],
        ),
        chapter_intro=chapter_row["chapter_intro"],
        verses=verses,
    )


# ----- Search -------------------------------------------------------------


@app.get("/v1/verses/search", response_model=VerseSearchResponse)
async def search_verses(
    q: str = Query(..., min_length=2, description="Phrase to search for."),
    limit: int = Query(default=25, ge=1, le=200),
) -> VerseSearchResponse:
    """
    Trigram search across every verse in the schema.

    Uses pg_trgm's ``similarity()`` against the gin index on verses.text
    (idx_verses_text_trgm in schema.sql). For a Phase-4 skeleton the
    threshold and ranking are kept simple; richer ranking lands when the
    Strong's-aware concordance and the Teaching-Corpus-aware concept
    search land in Phase 5/6.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            "SELECT v.id AS verse_id, "
            "       b.slug AS book_slug, b.title AS book_title, "
            "       c.chapter_number, v.verse_number, v.text, "
            "       similarity(v.text, $1) AS sim "
            "  FROM verses v "
            "  JOIN chapters c ON c.id = v.chapter_id "
            "  JOIN books    b ON b.id = c.book_id "
            " WHERE v.text % $1 OR v.text ILIKE '%' || $1 || '%' "
            " ORDER BY sim DESC NULLS LAST, b.canonical_order ASC, "
            "          c.chapter_number ASC, v.verse_number ASC "
            " LIMIT $2",
            q,
            limit,
        )

    hits = [
        VerseSearchHit(
            verse_id=r["verse_id"],
            book_slug=r["book_slug"],
            book_title=r["book_title"],
            chapter_number=r["chapter_number"],
            verse_number=r["verse_number"],
            text=r["text"],
            similarity=float(r["sim"] or 0.0),
        )
        for r in rows
    ]
    return VerseSearchResponse(query=q, total=len(hits), hits=hits)


# ----- Root ---------------------------------------------------------------


@app.get("/", include_in_schema=False)
async def root() -> dict:
    """Tiny root payload — points devs at /docs and /v1/health."""
    return {
        "service": "Remnant of Promise Official Study Bible — API",
        "version": app.version,
        "openapi": "/docs",
        "health": "/v1/health",
    }
