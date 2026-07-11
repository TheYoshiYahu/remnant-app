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

import os
import json
import re
from contextlib import asynccontextmanager
from datetime import datetime, timezone
from typing import List, Optional

from fastapi import Depends, FastAPI, HTTPException, Query, Response
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse

from auth import (
    User,
    get_current_user_optional,
    get_current_user_required,
    user_tier,
)
from config import settings
from db import close_pool, get_pool, open_pool, upsert_user
from models import (
    BaselineEntry,
    BaselineSourceVerse,
    BookChaptersResponse,
    BookDetail,
    Bookmark,
    BookmarkIndexEntry,
    BookmarksIndexResponse,
    BookSummary,
    ChapterBookmarksResponse,
    ChapterCommentaryEntry,
    ChapterCommentaryResponse,
    ChapterDetail,
    ChapterEndCardBookRef,
    ChapterEndCardChapterRef,
    ChapterEndCardResponse,
    ChapterEndThread,
    ChapterHighlightsResponse,
    ChapterSummary,
    ContentVersionResponse,
    CreateHighlightRequest,
    CreateNoteRequest,
    CreateOrReplaceBookmarkRequest,
    CrossRefTarget,
    DisplayPrefs,
    HealthResponse,
    Highlight,
    HighlightColor,
    HighlightLabel,
    HighlightLabelsResponse,
    LexiconCallout,
    LexiconEntry,
    LexiconResponse,
    ToolAnnotation,
    ToolAnnotationsResponse,
    VincentEntry,
    VincentVerseResponse,
    NavesTopicSummary,
    NavesSearchResponse,
    NavesTopic,
    TskPair,
    TskVerseResponse,
    MapPlace,
    MapPlacesResponse,
    NikkudotVerseResponse,
    MarkStyle,
    NoteEntry,
    NotesResponse,
    ReadingPositionResponse,
    ChapterVerseWords,
    ChapterWordsResponse,
    StrongEntry,
    StrongOccurrence,
    StrongOccurrencesResponse,
    SkeletonEntry,
    SkeletonGroupResponse,
    SkeletonNearGroup,
    SkeletonNearResponse,
    JournalEntry,
    JournalEntriesResponse,
    CreateJournalRequest,
    UpdateJournalRequest,
    DevotionalReflection,
    DevotionalResponse,
    PlanPassage,
    PlanDay,
    ReadingPlanSummary,
    ReadingPlanDetail,
    ReadingPlansResponse,
    PlanProgress,
    PlanProgressResponse,
    UpdatePlanProgressRequest,
    ThreadAnchor,
    ThreadMember,
    ThreadMemberTarget,
    StudyHighlightEntry,
    StudyIndexResponse,
    StudyNoteEntry,
    WitnessEntry,
    ChapterWitnessResponse,
    KingdomEntry,
    ChapterKingdomResponse,
    CompareVersion,
    CompareVersionsResponse,
    CompareVerseRow,
    CompareChapterResponse,
    UpdateHighlightLabelsRequest,
    UpdateNoteRequest,
    UpsertReadingPositionRequest,
    Verse,
    VerseSearchHit,
    VerseSearchResponse,
    VerseWord,
    VerseWordsResponse,
    TeachingBodyResponse,
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
    version="0.8.0-phase4-session59",
    description=(
        "Phase 4 API: books, chapters, verses, trigram search, plus the "
        "Stripe subscription surface — checkout, webhook, me, partner-"
        "initiated cancellation (cancel_at_period_end + forever-locked "
        "price preserved). Session 40 patches the period_end extraction "
        "path to handle Stripe API 2024-09-30.acacia's move of "
        "current_period_end from the Subscription onto items.data[0]. "
        "Session 42 swaps the WP partner_tier sync from an admin "
        "Application Password (Session 37) to an HMAC-signed call to "
        "the bible-companion WP plugin's dedicated partner-tier "
        "endpoint."
    ),
    lifespan=lifespan,
)


app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origin_list,
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
    allow_headers=["*"],
)


# Subscriptions router — Session 37 wheel.
app.include_router(subscriptions_router, prefix="/v1/subscriptions")


# ----- Helpers ------------------------------------------------------------


def _book_summary_from_row(row) -> BookSummary:
    # `locked` is only present when /v1/books is called with include_locked=true
    # (the show-all-gate-access mode). asyncpg Record doesn't support .get(), so
    # probe the key membership before reading it.
    locked = row["locked"] if "locked" in row.keys() else None
    return BookSummary(
        id=row["id"],
        slug=row["slug"],
        title=row["title"],
        short_title=row["short_title"],
        canonical_order=row["canonical_order"],
        witness_category=row["witness_category"],
        tier_required=row["tier_required"],
        locked=locked,
        abstract=row["abstract"],
        edition_slug=row["edition_slug"],
    )


# ----- Reading-path HTTP caching -----------------------------------------
#
# The static reading content — verse text, the chapters list, the books
# list, and the four chapter apparatus layers (cross-references, witness,
# kingdom, words, commentary) — is served with `no-cache` so a browser
# ALWAYS revalidates with the origin before reuse. It MAY keep a copy on
# disk, but it must check freshness on every read.
#
# Why not a max-age window (this used to be "public, max-age=21600" / 6h):
# the apparatus is actively curated under the publish-then-edit posture
# AND the book list itself changes when books are published/suppressed.
# A multi-hour max-age meant a deploy (or a curated edit, or a newly
# visible book) could be invisible to a partner for hours — they were
# stuck on a stale cached menu until they manually cleared the browser
# cache. That is exactly the failure this session fixes. `no-cache` makes
# every reading payload self-heal on next open with no manual clear.
#
# Offline is unaffected: HTTP `no-cache` only governs the browser's own
# disk cache. The instant-paint + offline layer is the client's IndexedDB
# read-through cache (app/src/lib/contentCache.ts), which serves stored
# content with zero network and is refreshed by the content-version sweep
# (see /v1/content-version below), not by this header.
#
# `public` is dropped (it implied a shared cache could store the payload);
# tier gating stays enforced at the application layer on every request
# regardless. There is no shared CDN in front of the API (Render direct
# service), so the only cache was ever each browser's private store.
READING_CACHE_CONTROL = "no-cache"


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


# ----- Content version (client cache self-heal) ---------------------------
#
# A tiny, always-fresh token the PWA reads on every cold open to decide
# whether its local caches are stale. The client stores the last value it
# saw; when the token changes it purges its IndexedDB read-through cache +
# any service-worker caches and refetches, so a deploy reaches every user
# on next open with NO manual "clear cache" / reinstall (the failure mode
# that bit us when a newly published book list stayed invisible behind a
# stale cache). See app/src/lib/contentVersion.ts.
#
# Source of the token: Render injects RENDER_GIT_COMMIT into every service
# at build/deploy time, and this repo's PWA + API both autoDeploy on each
# push to main — so the commit SHA bumps on every deploy (a frontend
# change, a curated-content edit, a new migration), which is exactly the
# granularity we want. We fold in the DB schema_version as a secondary
# signal so an out-of-band data reseed (which need not redeploy the
# service) still invalidates. Falls back to the FastAPI app version when
# the env var is absent (local dev), so the endpoint is never empty.
#
# Cache-Control: no-store — the token must never itself be cached, or the
# whole self-heal mechanism would be defeated by a stale token.
CONTENT_VERSION_BASE = os.environ.get("RENDER_GIT_COMMIT") or app.version


@app.get("/v1/content-version", response_model=ContentVersionResponse)
async def content_version(response: Response) -> ContentVersionResponse:
    """Opaque token the client compares against its last-seen value to
    decide whether to purge + refetch its local content caches."""
    schema_version: Optional[str] = None
    try:
        pool = get_pool()
        async with pool.acquire() as conn:
            schema_version = await conn.fetchval(
                "SELECT version FROM schema_version WHERE id = 1"
            )
    except Exception:
        schema_version = None
    token = f"{CONTENT_VERSION_BASE}:{schema_version or 'na'}"
    response.headers["Cache-Control"] = "no-store"
    return ContentVersionResponse(version=token)


# ----- Books --------------------------------------------------------------


@app.get("/v1/books", response_model=List[BookSummary])
async def list_books(
    response: Response,
    witness_category: Optional[str] = Query(
        default=None,
        description=(
            "Filter to a single witness category — canon, apocrypha, "
            "pseudepigrapha, apostolic_fathers, apocryphal_gospels, "
            "historical_witness, disputed_witness."
        ),
    ),
    include_locked: bool = Query(
        default=False,
        description=(
            "show-all-gate-access mode. False (default, unchanged behavior): "
            "return only books the caller's tier can open. True: return EVERY "
            "built book and set `locked` per row (True = visible but not "
            "openable for this tier) so the client can render the full library "
            "with lock affordances instead of hiding paid books."
        ),
    ),
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> List[BookSummary]:
    """
    List books visible to the requester.

    Tier filter (Session 36): in the default mode the response is filtered by
    the caller's partner tier against each book's ``tier_required``, using the
    schema's ``tier_satisfies()`` lattice function. Anonymous callers and the
    'free' tier see the 66-book canon; 'extras' and above see the full corpus.

    show-all-gate-access mode (include_locked=true): the WHERE filter is dropped
    so EVERY built book is returned, and ``locked`` is computed per row as
    ``NOT tier_satisfies(tier, b.tier_required)``. Chapter/text access stays
    gated server-side elsewhere (get_chapter still 404s a locked book), so this
    is display-only: the client shows the whole library and renders a lock
    affordance on the books the tier can't open. Order is canonical_order.
    """
    pool = get_pool()
    tier = user_tier(current_user)

    if include_locked:
        sql = (
            "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
            "       b.witness_category::text AS witness_category, "
            "       b.tier_required::text   AS tier_required, "
            "       NOT tier_satisfies($1::content_tier, b.tier_required) AS locked, "
            "       b.abstract, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
        )
        params: list = [tier]
        if witness_category is not None:
            sql += " WHERE b.witness_category = $2::witness_category"
            params.append(witness_category)
        sql += " ORDER BY b.canonical_order ASC, b.id ASC"
        async with pool.acquire() as conn:
            rows = await conn.fetch(sql, *params)
        response.headers["Cache-Control"] = READING_CACHE_CONTROL
        return [_book_summary_from_row(r) for r in rows]

    sql = (
        "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
        "       b.witness_category::text AS witness_category, "
        "       b.tier_required::text   AS tier_required, "
        "       b.abstract, e.slug AS edition_slug "
        "  FROM books b "
        "  JOIN editions e ON e.id = b.edition_id "
        " WHERE tier_satisfies($1::content_tier, b.tier_required) "
    )
    params = [tier]
    if witness_category is not None:
        sql += "   AND b.witness_category = $2::witness_category"
        params.append(witness_category)
    sql += " ORDER BY b.canonical_order ASC, b.id ASC"

    async with pool.acquire() as conn:
        rows = await conn.fetch(sql, *params)
    response.headers["Cache-Control"] = READING_CACHE_CONTROL
    return [_book_summary_from_row(r) for r in rows]


@app.get("/v1/books/{book_slug}", response_model=BookDetail)
async def get_book(
    book_slug: str,
    response: Response,
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
            "   AND tier_satisfies($2::content_tier, b.tier_required) "
            # S232 — slugs are unique only per edition (composite UNIQUE on
            # books.(edition_id, slug)), so five apocrypha slugs collide across
            # the KJV `apocrypha` and `apocrypha-charles-vol1` editions. The
            # reader suppresses the Charles-vol1 duplicates, and this
            # deterministic ORDER BY guarantees the colliding slugs always
            # resolve to the kept KJV edition (lowest book id) instead of
            # whatever heap order fetchrow happened to return.
            " ORDER BY b.id ASC LIMIT 1",
            book_slug,
            tier,
        )
    if row is None:
        raise HTTPException(status_code=404, detail=f"Book '{book_slug}' not found.")
    summary = _book_summary_from_row(row)
    response.headers["Cache-Control"] = READING_CACHE_CONTROL
    return BookDetail(**summary.model_dump(), chapter_count=row["chapter_count"])


@app.get("/v1/books/{book_slug}/chapters", response_model=BookChaptersResponse)
async def list_chapters(
    book_slug: str,
    response: Response,
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
            "   AND tier_satisfies($2::content_tier, b.tier_required) "
            # S232 — slugs are unique only per edition (composite UNIQUE on
            # books.(edition_id, slug)), so five apocrypha slugs collide across
            # the KJV `apocrypha` and `apocrypha-charles-vol1` editions. The
            # reader suppresses the Charles-vol1 duplicates, and this
            # deterministic ORDER BY guarantees the colliding slugs always
            # resolve to the kept KJV edition (lowest book id) instead of
            # whatever heap order fetchrow happened to return.
            " ORDER BY b.id ASC LIMIT 1",
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
    response.headers["Cache-Control"] = READING_CACHE_CONTROL
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
    response: Response,
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
            "   AND tier_satisfies($2::content_tier, b.tier_required) "
            # S232 — slugs are unique only per edition (composite UNIQUE on
            # books.(edition_id, slug)), so five apocrypha slugs collide across
            # the KJV `apocrypha` and `apocrypha-charles-vol1` editions. The
            # reader suppresses the Charles-vol1 duplicates, and this
            # deterministic ORDER BY guarantees the colliding slugs always
            # resolve to the kept KJV edition (lowest book id) instead of
            # whatever heap order fetchrow happened to return.
            " ORDER BY b.id ASC LIMIT 1",
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
    response.headers["Cache-Control"] = READING_CACHE_CONTROL
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


# ----- Chapter-end cross-reference card (Session 74 wheel) ---------------


def _first_paragraph(md: str) -> str:
    """Return only the first paragraph of a markdown body.

    Matches the client's locked-thread teaser boundary exactly
    (ChapterEndCard.tsx ``LockedThreadCallout``: ``summary_md.split(
    /\\n{2,}/)[0]``), so the trimmed payload renders identically to
    what the locked callout would have shown — the rest of the
    framework reading is withheld server-side rather than shipped in
    the JSON and merely hidden by the component.
    """
    return re.split(r"\n{2,}", md)[0]


@app.get(
    "/v1/books/{book_slug}/chapters/{chapter_number}/cross-references",
    response_model=ChapterEndCardResponse,
)
async def get_chapter_cross_references(
    book_slug: str,
    chapter_number: int,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> ChapterEndCardResponse:
    """Chapter-end cross-reference card per ``api/CHAPTER_END_CARD_CONTRACT.md``.

    Returns the per-verse cross-reference list (every verse in the
    chapter that has at least one curated cross-reference target) plus
    the framework-diagnostic threads (each thread that has at least one
    member whose source verse falls in this chapter). Every row in
    ``cross_references`` is a curated framework-bearing call that
    passed the 12 Red Lines and the 12-point editorial checklist before
    it landed — there is no neutral baseline underneath. The Session 75
    rollback of the TSK comprehensive-baseline direction is recorded
    in the contract; the apparatus grows by curated threads on Yoshi's
    design call, not by mass corpus ingestion.

    The v1 threads cover the five framework readings the card needs to
    surface from launch: post-harvest-sifting (S73), grace-from-names-
    sake, new-heart, scattered-seed-gathering, and false-inclusion-
    rebuttal (S74). Most chapters return both lists empty until the
    curated apparatus reaches them; the PWA hides the card entirely on
    that state.

    Tier filter (S136): rows the caller can't unlock are returned with
    their full ``tier_required`` field so the PWA can render a lock
    affordance — greyed-out pill, "Unlock with [Tier]" tooltip, click
    routes to /pricing. This matches the contract at
    api/CHAPTER_END_CARD_CONTRACT.md §"Tier-locked rows" and the
    frontend implementation at app/src/components/ChapterEndCard.tsx
    (locked = !tierSatisfies → opacity-40 + /pricing redirect). The
    earlier S74 implementation applied tier_satisfies() at the row
    level and stripped extras-tier rows from the response entirely,
    which hid the pill from free-tier readers and broke the see-the-
    work / upgrade-to-unlock promise. S131-S135 added the Matt 1-6
    extras-tier corpus on the assumption the pills would surface;
    S136 restores the behavior. Auth is the same JWT pattern as the
    other reader routes — anonymous callers resolve to 'free' tier.
    Book-level tier filter stays in place (gates access to the chapter
    itself); only the per-row strip is removed.

    Edition resolution: canon-only at v1. The contract reserves
    ``?edition=<slug>`` for when apocrypha-anchored curated threads
    land. Returns 404 when the book + chapter don't resolve in the
    canon edition under the caller's tier.
    """
    pool = get_pool()
    tier = user_tier(current_user)

    async with pool.acquire() as conn:
        # Resolve the canon book + chapter. The book tier filter
        # mirrors the other reader routes — 404 hides existence when
        # the caller's tier doesn't satisfy.
        book_row = await conn.fetchrow(
            "SELECT b.id AS book_id, b.slug, b.title, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1 "
            "   AND tier_satisfies($2::content_tier, b.tier_required) "
            # S237+ — extra-canonical apparatus (Enoch / Jasher / Jubilees and
            # the Charles-vol2 books) is now live, so the chapter-end card must
            # resolve non-canon editions too, not just canon. Slugs are unique
            # only per edition (composite UNIQUE on books.(edition_id, slug));
            # mirror the chapter-detail route's deterministic resolution so any
            # colliding slugs land on the kept edition (lowest book id).
            " ORDER BY b.id ASC LIMIT 1",
            book_slug,
            tier,
        )
        if book_row is None:
            raise HTTPException(
                status_code=404, detail=f"Book '{book_slug}' not found."
            )

        chapter_row = await conn.fetchrow(
            "SELECT id, chapter_number, chapter_title "
            "  FROM chapters "
            " WHERE book_id = $1 AND chapter_number = $2",
            book_row["book_id"],
            chapter_number,
        )
        if chapter_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Chapter {chapter_number} not found in '{book_slug}'.",
            )

        # Baseline — every cross-ref row with source in this chapter.
        # S136: no per-row tier filter. The row's tier_required is
        # passed through so the PWA can render a locked pill (greyed,
        # click → /pricing) per ChapterEndCard.tsx. The book-level
        # tier check above gates access to the chapter itself.
        baseline_rows = await conn.fetch(
            "SELECT x.source AS xref_source, "
            "       x.tier_required::text AS xref_tier, "
            "       sv.verse_number AS source_verse_number, "
            "       sv.text AS source_text, "
            "       tv.id AS target_verse_id, "
            "       tb.slug AS target_book_slug, "
            "       tc.chapter_number AS target_chapter, "
            "       tv.verse_number AS target_verse_number, "
            "       tv.text AS target_text "
            "  FROM cross_references x "
            "  JOIN verses sv  ON sv.id = x.source_verse_id "
            "  JOIN verses tv  ON tv.id = x.target_verse_id "
            "  JOIN chapters tc ON tc.id = tv.chapter_id "
            "  JOIN books tb    ON tb.id = tc.book_id "
            " WHERE sv.chapter_id = $1 "
            " ORDER BY sv.verse_number, tb.canonical_order, tc.chapter_number, tv.verse_number",
            chapter_row["id"],
        )

        # Threads — denormalized join: one row per (thread, in-chapter
        # member). Threads with zero in-chapter members are excluded by
        # the join. We aggregate by thread on the Python side rather
        # than building a json_agg roll-up in SQL — the result set is
        # small (handful of threads × handful of members each) and the
        # Python grouping reads cleaner.
        # S136: no per-thread tier filter — the thread's tier_required
        # is passed through so the PWA can render a locked-callout
        # treatment (greyed article, "Unlock with [Tier]" tooltip) per
        # ChapterEndCard.tsx ThreadCallout. Same reason as the baseline
        # query above: locked threads must surface so the reader sees
        # the framework architecture exists, with the upgrade path on
        # click.
        thread_member_rows = await conn.fetch(
            "SELECT t.id AS thread_id, "
            "       t.slug AS thread_slug, "
            "       t.title AS thread_title, "
            "       t.summary_md AS thread_summary_md, "
            "       t.tier_required::text AS thread_tier, "
            "       t.sort_order AS thread_sort, "
            "       ab.slug AS anchor_book_slug, "
            "       ac.chapter_number AS anchor_chapter, "
            "       av.verse_number AS anchor_v_start, "
            "       ev.verse_number AS anchor_v_end, "
            "       m.sort_order AS member_sort, "
            "       m.member_note AS member_note, "
            "       sv.verse_number AS member_source_verse_number, "
            "       tv.verse_number AS member_target_verse_number, "
            "       tc.chapter_number AS member_target_chapter, "
            "       tb.slug AS member_target_book_slug, "
            "       tv.text AS member_target_text "
            "  FROM cross_reference_threads t "
            "  JOIN cross_reference_thread_members m "
            "    ON m.thread_id = t.id "
            "  JOIN cross_references x ON x.id = m.cross_reference_id "
            "  JOIN verses sv ON sv.id = x.source_verse_id "
            "  JOIN verses tv ON tv.id = x.target_verse_id "
            "  JOIN chapters tc ON tc.id = tv.chapter_id "
            "  JOIN books    tb ON tb.id = tc.book_id "
            "  LEFT JOIN verses av  ON av.id = t.anchor_verse_id_start "
            "  LEFT JOIN chapters ac ON ac.id = av.chapter_id "
            "  LEFT JOIN books    ab ON ab.id = ac.book_id "
            "  LEFT JOIN verses ev  ON ev.id = t.anchor_verse_id_end "
            " WHERE sv.chapter_id = $1 "
            " ORDER BY t.sort_order, t.title, m.sort_order",
            chapter_row["id"],
        )

    # --- Aggregate baseline rows by source verse ----------------------
    baseline_by_verse: dict[int, BaselineEntry] = {}
    for r in baseline_rows:
        v_num = r["source_verse_number"]
        if v_num not in baseline_by_verse:
            baseline_by_verse[v_num] = BaselineEntry(
                source_verse=BaselineSourceVerse(
                    verse_number=v_num,
                    preview=r["source_text"],
                ),
                targets=[],
            )
        baseline_by_verse[v_num].targets.append(
            CrossRefTarget(
                verse_id=r["target_verse_id"],
                book_slug=r["target_book_slug"],
                chapter_number=r["target_chapter"],
                verse_number=r["target_verse_number"],
                preview=r["target_text"],
                source=r["xref_source"],
                tier_required=r["xref_tier"],
            )
        )
    baseline = [baseline_by_verse[k] for k in sorted(baseline_by_verse.keys())]

    # --- Aggregate thread rows ---------------------------------------
    # PAYWALL ENFORCEMENT (server-side). The thread query above returns
    # every thread in the chapter with its FULL multi-paragraph
    # summary_md and EVERY member (full member_note + target verse
    # preview), with no tier filter — only the book is gated (404). But
    # the locked-thread render (ChapterEndCard.tsx LockedThreadCallout,
    # S201) shows ONLY the first paragraph of summary_md plus a member
    # COUNT — it never renders the rest of the summary or any member
    # row. Shipping the full body + members and trusting the component
    # to "decline to render" them is a client-side-only paywall: the
    # complete_study ($9.99 Companion) framework reading sat in the JSON
    # for any devtools/curl caller and was cached locally by the offline
    # download. We enforce the render boundary here, mirroring the way
    # get_chapter_commentary nulls `body` for locked rows.
    #
    # The tier_rank lattice mirrors get_chapter_commentary (the schema's
    # tier_satisfies() encoded in Python so we can shape the payload
    # rather than drop rows). `tier` is resolved server-side from the DB
    # via user_tier() (anonymous → 'free') and is unforgeable by the
    # client.
    #
    # Baseline (Layer 1) is intentionally NOT trimmed: the client
    # renders the locked baseline preview at full readability (S201,
    # TargetRow blockquote) — it does not "decline to render" it — so
    # the payload already matches that render boundary. The leak is the
    # thread (Layer 2) path only.
    tier_rank = {
        "free": 0, "study_notes": 1, "extras": 2,
        "complete_study": 3, "everything": 4,
    }
    user_rank = tier_rank.get(tier, 0)

    threads_by_id: dict[int, ChapterEndThread] = {}
    thread_order: list[int] = []  # preserve sort order from SQL
    for r in thread_member_rows:
        t_id = r["thread_id"]
        locked = user_rank < tier_rank.get(r["thread_tier"], 4)
        if t_id not in threads_by_id:
            anchor: Optional[ThreadAnchor] = None
            if (
                r["anchor_book_slug"]
                and r["anchor_chapter"] is not None
                and r["anchor_v_start"] is not None
                and r["anchor_v_end"] is not None
            ):
                anchor = ThreadAnchor(
                    book_slug=r["anchor_book_slug"],
                    chapter_number=r["anchor_chapter"],
                    verse_start=r["anchor_v_start"],
                    verse_end=r["anchor_v_end"],
                )
            # Locked threads ship only the first-paragraph teaser the
            # client actually renders; the rest of the framework reading
            # is withheld. Unlocked callers get the full body.
            summary_md = (
                _first_paragraph(r["thread_summary_md"])
                if locked
                else r["thread_summary_md"]
            )
            threads_by_id[t_id] = ChapterEndThread(
                slug=r["thread_slug"],
                title=r["thread_title"],
                summary_md=summary_md,
                anchor=anchor,
                tier_required=r["thread_tier"],
                members_in_chapter=[],
            )
            thread_order.append(t_id)
        # For locked threads the member rows are NOT rendered — the
        # callout shows only their count ("Full summary + N verse
        # pairings"). Keep the lightweight row so that count stays
        # accurate, but null the paid content: Yoshi's framework
        # member_note and the target verse-text preview. Unlocked
        # callers get the full member.
        threads_by_id[t_id].members_in_chapter.append(
            ThreadMember(
                sort_order=r["member_sort"],
                source_verse_number=r["member_source_verse_number"],
                target=ThreadMemberTarget(
                    book_slug=r["member_target_book_slug"],
                    chapter_number=r["member_target_chapter"],
                    verse_number=r["member_target_verse_number"],
                    preview="" if locked else r["member_target_text"],
                ),
                member_note=None if locked else r["member_note"],
            )
        )
    threads = [threads_by_id[t_id] for t_id in thread_order]

    response.headers["Cache-Control"] = READING_CACHE_CONTROL
    return ChapterEndCardResponse(
        book=ChapterEndCardBookRef(
            slug=book_row["slug"],
            title=book_row["title"],
            edition_slug=book_row["edition_slug"],
        ),
        chapter=ChapterEndCardChapterRef(
            number=chapter_row["chapter_number"],
            title=chapter_row["chapter_title"],
        ),
        baseline=baseline,
        threads=threads,
    )


# ----- The Witness (working title: Red Pill) — Session 204 ----------------


@app.get(
    "/v1/books/{book_slug}/chapters/{chapter_number}/witness",
    response_model=ChapterWitnessResponse,
)
async def get_chapter_witness(
    book_slug: str,
    chapter_number: int,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> ChapterWitnessResponse:
    """The Witness marks for one chapter — the inverted red-letter overlay.

    Every row is a curated red_pill_verses entry that passed the
    transfer test (the NT gives Yahusha (Jesus) a title, act, or
    argument the Tanakh gives to Yahuah alone, or that Yahuah said he
    himself would do) and the checker gates (Red Line #12, checklist
    10, quote-don't-cite, sacred names). Full-canon V1: Tanakh anchor
    verses carry the mark too. Free tier — the proclamation surface;
    no per-row tier strip, ever (Yoshi, S204). Book-level tier filter
    mirrors the other reader routes (gates access to the chapter
    itself, e.g. extras-tier books).

    Returns 404 when book + chapter don't resolve in the canon edition
    under the caller's tier; empty `entries` when the chapter carries
    no marks (the PWA renders nothing).
    """
    pool = get_pool()
    tier = user_tier(current_user)

    async with pool.acquire() as conn:
        book_row = await conn.fetchrow(
            "SELECT b.id AS book_id, b.slug, b.title, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1 "
            "   AND tier_satisfies($2::content_tier, b.tier_required) "
            # S237+ — extra-canonical apparatus (Enoch / Jasher / Jubilees and
            # the Charles-vol2 books) is now live, so the chapter-end card must
            # resolve non-canon editions too, not just canon. Slugs are unique
            # only per edition (composite UNIQUE on books.(edition_id, slug));
            # mirror the chapter-detail route's deterministic resolution so any
            # colliding slugs land on the kept edition (lowest book id).
            " ORDER BY b.id ASC LIMIT 1",
            book_slug,
            tier,
        )
        if book_row is None:
            raise HTTPException(
                status_code=404, detail=f"Book '{book_slug}' not found."
            )

        chapter_row = await conn.fetchrow(
            "SELECT id, chapter_number, chapter_title "
            "  FROM chapters "
            " WHERE book_id = $1 AND chapter_number = $2",
            book_row["book_id"],
            chapter_number,
        )
        if chapter_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Chapter {chapter_number} not found in '{book_slug}'.",
            )

        rows = await conn.fetch(
            "SELECT r.verse_id, v.verse_number, r.claim_class, "
            "       r.class_label, r.card_title, r.card_md, r.anchor_refs "
            "  FROM red_pill_verses r "
            "  JOIN verses v ON v.id = r.verse_id "
            " WHERE v.chapter_id = $1 "
            " ORDER BY v.verse_number",
            chapter_row["id"],
        )

    response.headers["Cache-Control"] = READING_CACHE_CONTROL
    return ChapterWitnessResponse(
        book=ChapterEndCardBookRef(
            slug=book_row["slug"],
            title=book_row["title"],
            edition_slug=book_row["edition_slug"],
        ),
        chapter=ChapterEndCardChapterRef(
            number=chapter_row["chapter_number"],
            title=chapter_row["chapter_title"],
        ),
        entries=[
            WitnessEntry(
                verse_id=r["verse_id"],
                verse_number=r["verse_number"],
                claim_class=r["claim_class"],
                class_label=r["class_label"],
                card_title=r["card_title"],
                card_md=r["card_md"],
                anchor_refs=list(r["anchor_refs"] or []),
            )
            for r in rows
        ],
    )


# ----- The Kingdom (working title: Blue Pill) — Session 205 ---------------


@app.get(
    "/v1/books/{book_slug}/chapters/{chapter_number}/kingdom",
    response_model=ChapterKingdomResponse,
)
async def get_chapter_kingdom(
    book_slug: str,
    chapter_number: int,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> ChapterKingdomResponse:
    """The Kingdom marks for one chapter — the nothing-new overlay.

    Every row is a curated kingdom_verses entry that passed the
    nothing-new test (a new-testament teaching, act, or promise paired
    with the scripture it was taught from — nothing in the new
    testament is new; every beginning declared the end) and the
    checker gates (Red Line #11 — the gathering is the scattered house
    coming home, no false-inclusion leak; Red Line #10 — grace as the
    means of return; Red Line #12; quote-don't-cite; sacred names).
    Full-canon sweep V1: Tanakh anchor verses carry the mark too. Free
    tier — the proclamation surface; no per-row tier strip, ever
    (Yoshi, S205). Book-level tier filter mirrors the other reader
    routes.

    Returns 404 when book + chapter don't resolve in the canon edition
    under the caller's tier; empty `entries` when the chapter carries
    no marks (the PWA renders nothing).
    """
    pool = get_pool()
    tier = user_tier(current_user)

    async with pool.acquire() as conn:
        book_row = await conn.fetchrow(
            "SELECT b.id AS book_id, b.slug, b.title, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1 "
            "   AND tier_satisfies($2::content_tier, b.tier_required) "
            # S237+ — extra-canonical apparatus (Enoch / Jasher / Jubilees and
            # the Charles-vol2 books) is now live, so the chapter-end card must
            # resolve non-canon editions too, not just canon. Slugs are unique
            # only per edition (composite UNIQUE on books.(edition_id, slug));
            # mirror the chapter-detail route's deterministic resolution so any
            # colliding slugs land on the kept edition (lowest book id).
            " ORDER BY b.id ASC LIMIT 1",
            book_slug,
            tier,
        )
        if book_row is None:
            raise HTTPException(
                status_code=404, detail=f"Book '{book_slug}' not found."
            )

        chapter_row = await conn.fetchrow(
            "SELECT id, chapter_number, chapter_title "
            "  FROM chapters "
            " WHERE book_id = $1 AND chapter_number = $2",
            book_row["book_id"],
            chapter_number,
        )
        if chapter_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Chapter {chapter_number} not found in '{book_slug}'.",
            )

        rows = await conn.fetch(
            "SELECT k.verse_id, v.verse_number, k.strand, "
            "       k.strand_label, k.card_title, k.card_md, k.anchor_refs "
            "  FROM kingdom_verses k "
            "  JOIN verses v ON v.id = k.verse_id "
            " WHERE v.chapter_id = $1 "
            " ORDER BY v.verse_number",
            chapter_row["id"],
        )

    response.headers["Cache-Control"] = READING_CACHE_CONTROL
    return ChapterKingdomResponse(
        book=ChapterEndCardBookRef(
            slug=book_row["slug"],
            title=book_row["title"],
            edition_slug=book_row["edition_slug"],
        ),
        chapter=ChapterEndCardChapterRef(
            number=chapter_row["chapter_number"],
            title=chapter_row["chapter_title"],
        ),
        entries=[
            KingdomEntry(
                verse_id=r["verse_id"],
                verse_number=r["verse_number"],
                strand=r["strand"],
                strand_label=r["strand_label"],
                card_title=r["card_title"],
                card_md=r["card_md"],
                anchor_refs=list(r["anchor_refs"] or []),
            )
            for r in rows
        ],
    )


# ----- Tiered commentary surface (Session 112 wheel) ---------------------


@app.get(
    "/v1/books/{book_slug}/chapters/{chapter_number}/commentary",
    response_model=ChapterCommentaryResponse,
)
async def get_chapter_commentary(
    book_slug: str,
    chapter_number: int,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> ChapterCommentaryResponse:
    """Tiered commentary entries for a chapter.

    Returns every ``commentary_entries`` row scoped to the chapter
    (``chapter_id`` matches, ``verse_id`` IS NULL) with tier-gating
    applied per row. Rows the caller's tier satisfies are returned
    with their ``body`` populated; rows the caller cannot unlock are
    returned with ``body=None`` and ``locked=true``, plus their
    ``tier_required`` so the PWA can render the upgrade affordance.

    Free-tier chapter_intro is NOT included here — it rides on the
    existing ``/v1/books/{slug}/chapters/{n}`` response under the
    ``chapter_intro`` field. The PWA stacks the three layers:

        1. Free chapter intro (from chapter detail)
        2. Basic + Deeper Dive (from this endpoint)
        3. Cross-references (from the chapter-end card endpoint)

    Edition resolution: canon-only at v1 (mirrors the cross-references
    endpoint). The extras-tier framework reading lives entirely on
    canon books for now; commentary on the extras-canon books (Enoch,
    Jubilees, Jasher, etc.) is queued for later wheels.

    Returns 404 when the book + chapter don't resolve in the canon
    edition under the caller's tier (hides existence rather than 401-
    revealing — same pattern as the other reader routes).
    """
    pool = get_pool()
    tier = user_tier(current_user)

    async with pool.acquire() as conn:
        # Resolve the book + chapter under the caller's tier. S237+ — the
        # chapter-end apparatus now covers extra-canonical editions, so this
        # no longer hard-filters to canon; it mirrors the chapter-detail
        # route's deterministic per-edition resolution (slugs are unique only
        # per edition, so ORDER BY b.id keeps the canonical/kept edition).
        book_row = await conn.fetchrow(
            "SELECT b.id AS book_id, b.slug, b.title, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1 "
            "   AND tier_satisfies($2::content_tier, b.tier_required) "
            " ORDER BY b.id ASC LIMIT 1",
            book_slug,
            tier,
        )
        if book_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Book '{book_slug}' not found.",
            )

        chapter_row = await conn.fetchrow(
            "SELECT id, chapter_number, chapter_title "
            "  FROM chapters "
            " WHERE book_id = $1 AND chapter_number = $2",
            book_row["book_id"],
            chapter_number,
        )
        if chapter_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Chapter {chapter_number} not found in '{book_slug}'.",
            )

        # Fetch every commentary_entries row for the chapter — both rows
        # the caller can unlock AND rows they can't (the locked rows are
        # returned with body stripped + locked=true so the PWA renders
        # the upgrade affordance). The locked-row visibility is what makes
        # the tier ladder visible to free / Notes-tier partners.
        entry_rows = await conn.fetch(
            "SELECT id, title, body, surface_kind, "
            "       tier_required::text AS tier_required "
            "  FROM commentary_entries "
            " WHERE chapter_id = $1 "
            "   AND verse_id IS NULL "
            " ORDER BY "
            "   CASE surface_kind "
            "     WHEN 'featured'  THEN 0 "
            "     WHEN 'inline'    THEN 1 "
            "     WHEN 'deep_dive' THEN 2 "
            "     ELSE 3 "
            "   END, "
            "   id ASC",
            chapter_row["id"],
        )

        # Per-row tier gate. Use the same lattice the schema's
        # tier_satisfies() function encodes; we apply it in Python here
        # so we can shape the response (body=None + locked=true) rather
        # than just filtering rows out of the query.
        tier_rank = {
            "free": 0, "study_notes": 1, "extras": 2,
            "complete_study": 3, "everything": 4,
        }
        user_rank = tier_rank.get(tier, 0)

    entries: list[ChapterCommentaryEntry] = []
    for r in entry_rows:
        row_tier = r["tier_required"]
        locked = user_rank < tier_rank.get(row_tier, 4)
        entries.append(
            ChapterCommentaryEntry(
                id=r["id"],
                title=r["title"],
                body=None if locked else r["body"],
                surface_kind=r["surface_kind"],
                tier_required=row_tier,
                locked=locked,
            )
        )

    response.headers["Cache-Control"] = READING_CACHE_CONTROL
    return ChapterCommentaryResponse(
        book=ChapterEndCardBookRef(
            slug=book_row["slug"],
            title=book_row["title"],
            edition_slug=book_row["edition_slug"],
        ),
        chapter=ChapterEndCardChapterRef(
            number=chapter_row["chapter_number"],
            title=chapter_row["chapter_title"],
        ),
        entries=entries,
    )


# ----- Highlights (Session 113 wheel) ------------------------------------
#
# Locked design per DESIGN_LANGUAGE.md §6, §7, §8 (S77/S78):
#
#   - Free tier: 1 color (neon_yellow, deliberately outside the tribe
#     palette) + 1 style (fill). Every free mark hits the upgrade trigger
#     visually — "highlighter on Bible" rather than "curated mark in a
#     designed system."
#   - $1.99-and-above: 12 tribe-palette colors + 3 mark styles = 36
#     mark configurations. Plus the free-form color-meaning dictionary
#     (this file's PUT /v1/highlights/labels endpoint).
#
# Endpoints:
#   GET    /v1/highlights                   — list highlights on a chapter
#   POST   /v1/highlights                   — create or replace (tier-validated)
#   DELETE /v1/highlights/{highlight_id}    — remove one
#   GET    /v1/highlights/labels            — partner's color-meaning dictionary
#   PUT    /v1/highlights/labels            — update labels ($1.99+)

# The free-tier color. Sits outside the tribe palette by design.
_FREE_COLOR: str = "neon_yellow"

# The 12 tribe-palette colors unlocked at $1.99-and-above, in the
# canonical render order around the wheel per DESIGN_LANGUAGE.md §6.
_TRIBE_COLORS: tuple[str, ...] = (
    "crimson", "tangerine", "honey", "sage", "emerald", "teal",
    "sky_blue", "periwinkle", "lilac", "magenta", "rose", "parchment",
)

# Full picker render order: free baseline first, then the 12 tribe
# colors. The /v1/highlights/labels response returns one entry per
# color in this sequence.
PALETTE_ORDER: tuple[str, ...] = (_FREE_COLOR, *_TRIBE_COLORS)

# Tier-required to APPLY each color to a verse. Free for neon_yellow,
# study_notes (i.e. $1.99-and-above) for each of the 12 tribe colors.
_PALETTE_TIER_REQUIRED: dict[str, str] = {
    _FREE_COLOR: "free",
    **{c: "study_notes" for c in _TRIBE_COLORS},
}

# Three mark styles per §8. Free locked to fill; $1.99+ unlocks all three.
_FREE_STYLES: frozenset[str] = frozenset({"fill"})
_PAID_STYLES: frozenset[str] = frozenset({"fill", "underline", "outline"})


def _allowed_colors_for_tier(tier: str) -> frozenset[str]:
    """Return the colors a caller at ``tier`` may apply to a verse.

    Free callers can only apply neon_yellow; every paid tier (lattice:
    study_notes / extras / complete_study / everything) gets the full
    palette including neon_yellow (so a partner who downgrades doesn't
    lose access to a color they were using).
    """
    if tier == "free":
        return frozenset({_FREE_COLOR})
    return frozenset({_FREE_COLOR, *_TRIBE_COLORS})


def _allowed_styles_for_tier(tier: str) -> frozenset[str]:
    """Return the mark styles a caller at ``tier`` may apply.

    Free callers locked to 'fill'; every paid tier gets fill + underline
    + outline.
    """
    return _FREE_STYLES if tier == "free" else _PAID_STYLES


async def _build_labels_response(
    conn, user_uuid: str
) -> HighlightLabelsResponse:
    """Build the labels response — one entry per palette color, with the
    partner's assigned label (empty string when unset, per the V1 design:
    no framework defaults are preloaded; tribe + gemstone symbolic mapping
    is open as a V2 enrichment per DESIGN_LANGUAGE.md §6)."""
    rows = await conn.fetch(
        "SELECT color, label "
        "  FROM user_highlight_labels "
        " WHERE user_id = $1::uuid",
        user_uuid,
    )
    custom = {r["color"]: r["label"] for r in rows}
    labels: list[HighlightLabel] = []
    for color in PALETTE_ORDER:
        labels.append(
            HighlightLabel(
                color=color,  # type: ignore[arg-type]
                label=custom.get(color, ""),
                tier_required=_PALETTE_TIER_REQUIRED[color],  # type: ignore[arg-type]
            )
        )
    return HighlightLabelsResponse(labels=labels)


@app.get("/v1/highlights", response_model=ChapterHighlightsResponse)
async def list_chapter_highlights(
    book_slug: str = Query(...),
    chapter_number: int = Query(..., ge=1),
    current_user: User = Depends(get_current_user_required),
) -> ChapterHighlightsResponse:
    """Return the requesting partner's highlights for one chapter.

    Scoped to the canon edition (mirrors the commentary endpoint's
    edition-resolution discipline). Returns 404 when the book or
    chapter doesn't resolve. The endpoint does NOT tier-filter rows —
    partners always see their own existing highlights even if they
    later downgrade tiers (no silent data deletion on downgrade).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)

        chapter_row = await conn.fetchrow(
            "SELECT c.id "
            "  FROM chapters c "
            "  JOIN books    b ON c.book_id    = b.id "
            "  JOIN editions e ON b.edition_id = e.id "
            " WHERE b.slug = $1 AND e.slug = 'canon' "
            "   AND c.chapter_number = $2",
            book_slug,
            chapter_number,
        )
        if chapter_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Chapter {chapter_number} of '{book_slug}' not found in canon.",
            )

        rows = await conn.fetch(
            "SELECT vh.id::text AS id, vh.verse_id, vh.color, vh.style, "
            "       vh.created_at "
            "  FROM verse_highlights vh "
            "  JOIN verses v ON vh.verse_id = v.id "
            " WHERE vh.user_id = $1::uuid "
            "   AND v.chapter_id = $2 "
            " ORDER BY vh.created_at ASC, vh.id ASC",
            user_uuid,
            chapter_row["id"],
        )

    return ChapterHighlightsResponse(
        highlights=[Highlight(**dict(r)) for r in rows]
    )


@app.post("/v1/highlights", response_model=Highlight, status_code=201)
async def create_or_replace_highlight(
    body: CreateHighlightRequest,
    current_user: User = Depends(get_current_user_required),
) -> Highlight:
    """Create-or-no-op a mark on one verse. Tier-validated.

    S117 multi-mark: the unique constraint is (user_id, verse_id,
    color, style). Re-applying an exact (color, style) duplicate on
    the same verse is a no-op (ON CONFLICT DO UPDATE matches the
    existing row and the EXCLUDED values are identical — RETURNING
    gives back the existing row). Applying a different (color, style)
    on the same verse INSERTs a new row alongside the existing marks
    — multiple marks can coexist on one verse (different colors and
    styles compose visually via nested PWA spans).

    Cap of 3 marks per verse enforced at the PWA picker layer.
    Free callers can only apply (color='neon_yellow', style='fill');
    $1.99-and-above can apply any of the 12 tribe palette colors plus
    neon_yellow, in any of the 3 styles (fill, underline, outline).
    """
    tier = user_tier(current_user)
    allowed_colors = _allowed_colors_for_tier(tier)
    allowed_styles = _allowed_styles_for_tier(tier)

    if body.color not in allowed_colors:
        raise HTTPException(
            status_code=403,
            detail=(
                f"Color '{body.color}' requires a higher tier than '{tier}'. "
                f"Allowed at your tier: {sorted(allowed_colors)}."
            ),
        )
    if body.style not in allowed_styles:
        raise HTTPException(
            status_code=403,
            detail=(
                f"Mark style '{body.style}' requires a higher tier than '{tier}'. "
                f"Allowed at your tier: {sorted(allowed_styles)}."
            ),
        )

    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)

        verse_row = await conn.fetchrow(
            "SELECT id FROM verses WHERE id = $1",
            body.verse_id,
        )
        if verse_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Verse id={body.verse_id} not found.",
            )

        # S117 multi-mark: insert on the (user_id, verse_id, color,
        # style) unique tuple. DO UPDATE is effectively a no-op
        # (EXCLUDED.color = existing.color and EXCLUDED.style =
        # existing.style on conflict, so the row is unchanged) — but
        # RETURNING gives us the existing row back, which keeps the
        # response shape consistent whether the insert created a new
        # mark or matched an existing duplicate-tuple call. Different
        # (color, style) tuples on the same verse INSERT new rows
        # alongside existing marks — coexistence is the whole point.
        row = await conn.fetchrow(
            "INSERT INTO verse_highlights (user_id, verse_id, color, style) "
            "VALUES ($1::uuid, $2, $3, $4) "
            "ON CONFLICT ON CONSTRAINT verse_highlights_user_verse_color_style_unique "
            "DO UPDATE SET color = EXCLUDED.color, style = EXCLUDED.style "
            "RETURNING id::text, verse_id, color, style, created_at",
            user_uuid,
            body.verse_id,
            body.color,
            body.style,
        )

    return Highlight(**dict(row))


@app.get("/v1/highlights/labels", response_model=HighlightLabelsResponse)
async def get_highlight_labels(
    current_user: User = Depends(get_current_user_required),
) -> HighlightLabelsResponse:
    """Return the partner's effective labels for the six palette colors.

    Order matches ``PALETTE_ORDER``. Every color appears exactly once
    in the response; ``is_custom=False`` means the label is the
    framework default, ``is_custom=True`` means the partner has
    overridden it.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        return await _build_labels_response(conn, user_uuid)


@app.put("/v1/highlights/labels", response_model=HighlightLabelsResponse)
async def update_highlight_labels(
    body: UpdateHighlightLabelsRequest,
    current_user: User = Depends(get_current_user_required),
) -> HighlightLabelsResponse:
    """Update one or more palette labels for the partner.

    Tier-gated: the free-form color-meaning dictionary is a $1.99
    feature per DESIGN_LANGUAGE.md §9 / COMPETITIVE_LANDSCAPE.md
    line 267. Free callers get a 403 (they only have the neon yellow
    color and the upgrade trigger needs to fire on every interaction
    that hints at the paid feature). Reads are still free at every
    tier so the PWA can render the dictionary surface alongside the
    upgrade affordance.

    Atomic across all entries (single transaction). Empty / whitespace
    ``label`` clears the partner's label for that color (deletes the
    row); non-empty trimmed ``label`` upserts. Returns the merged
    labels response so the PWA can re-render the picker without a
    follow-up GET.
    """
    tier = user_tier(current_user)
    if tier == "free":
        raise HTTPException(
            status_code=403,
            detail=(
                "The free-form color-meaning dictionary is a $1.99 "
                "feature. Upgrade to Notes ($1.99/mo) to label your "
                "highlight colors."
            ),
        )

    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        async with conn.transaction():
            for entry in body.labels:
                trimmed = (entry.label or "").strip()
                if not trimmed:
                    await conn.execute(
                        "DELETE FROM user_highlight_labels "
                        " WHERE user_id = $1::uuid AND color = $2",
                        user_uuid,
                        entry.color,
                    )
                else:
                    await conn.execute(
                        "INSERT INTO user_highlight_labels (user_id, color, label) "
                        "VALUES ($1::uuid, $2, $3) "
                        "ON CONFLICT (user_id, color) DO UPDATE "
                        "  SET label = EXCLUDED.label, updated_at = now()",
                        user_uuid,
                        entry.color,
                        trimmed,
                    )
        return await _build_labels_response(conn, user_uuid)


@app.delete("/v1/highlights/{highlight_id}", status_code=204)
async def delete_highlight(
    highlight_id: str,
    current_user: User = Depends(get_current_user_required),
) -> Response:
    """Remove one highlight. Idempotent — deleting a missing or
    already-deleted row returns 204 (not 404). The partner's PWA may
    have raced; the user-facing result is the same either way.

    Scoped to the requesting user — passing another user's highlight_id
    silently no-ops (the WHERE user_id = ... clause never matches).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        await conn.execute(
            "DELETE FROM verse_highlights "
            " WHERE id = $1::uuid AND user_id = $2::uuid",
            highlight_id,
            user_uuid,
        )
    return Response(status_code=204)


# ----- Reading position (Session 116) -------------------------------------
#
# Per DESIGN_LANGUAGE.md §9: "reading history (last position, recently
# read)" is a free-tier feature. Schema is the reading_positions table
# (data-schema/schema.sql lines 597-601), one row per user with the
# verse_id pointer + updated_at timestamp.
#
# The API exposes the position in PWA-readable slug/chapter/verse_number
# register. The opaque verse_id stays server-side — the PWA never sees
# it (and shouldn't, since it ties to the canon edition's verse rows
# which are an implementation detail).
#
# Endpoints:
#   GET  /v1/reading-position  — return the partner's saved position
#                                 (404 when none saved yet)
#   PUT  /v1/reading-position  — upsert the partner's saved position
#
# No tier gate. Every authenticated partner has reading-position resume.
# Anonymous callers use localStorage on the PWA side as a parallel
# fallback (they get a 401 here, which the PWA treats the same as "no
# saved row" and falls through to localStorage / Genesis 1).


@app.get("/v1/reading-position", response_model=ReadingPositionResponse)
async def get_reading_position(
    current_user: User = Depends(get_current_user_required),
) -> ReadingPositionResponse:
    """Return the partner's saved reading position, resolved to the
    PWA-readable slug/chapter/verse_number register.

    Scoped to the canon edition (mirrors the highlights endpoint's
    edition-resolution discipline). Returns 404 when the partner has
    no row yet — first-ever visit, or row never written from the
    client. The PWA falls through to its localStorage value, then to
    Genesis 1.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "SELECT b.slug AS book_slug, "
            "       c.chapter_number, "
            "       v.verse_number, "
            "       rp.updated_at "
            "  FROM reading_positions rp "
            "  JOIN verses   v ON rp.verse_id   = v.id "
            "  JOIN chapters c ON v.chapter_id  = c.id "
            "  JOIN books    b ON c.book_id     = b.id "
            "  JOIN editions e ON b.edition_id  = e.id "
            " WHERE rp.user_id = $1::uuid "
            "   AND e.slug = 'canon'",
            user_uuid,
        )
    if row is None:
        raise HTTPException(
            status_code=404,
            detail="No reading position saved yet for this partner.",
        )
    return ReadingPositionResponse(**dict(row))


@app.put("/v1/reading-position", response_model=ReadingPositionResponse)
async def upsert_reading_position(
    body: UpsertReadingPositionRequest,
    current_user: User = Depends(get_current_user_required),
) -> ReadingPositionResponse:
    """Save the partner's current reading position.

    Upserts on (user_id) — one row per partner, last-write-wins.
    Resolves the (book_slug, chapter_number, verse_number) triple to
    verse_id by joining books → chapters → verses, scoped to the canon
    edition. Returns 404 if the triple doesn't resolve to a real verse
    (catches typos / stale chapter numbers / book-slug drift). No tier
    gate — free-tier feature per DESIGN_LANGUAGE.md §9.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)

        verse_row = await conn.fetchrow(
            "SELECT v.id AS verse_id "
            "  FROM books    b "
            "  JOIN chapters c ON c.book_id    = b.id "
            "  JOIN verses   v ON v.chapter_id = c.id "
            "  JOIN editions e ON b.edition_id = e.id "
            " WHERE b.slug            = $1 "
            "   AND c.chapter_number  = $2 "
            "   AND v.verse_number    = $3 "
            "   AND e.slug            = 'canon' "
            " LIMIT 1",
            body.book_slug,
            body.chapter_number,
            body.verse_number,
        )
        if verse_row is None:
            raise HTTPException(
                status_code=404,
                detail=(
                    f"Verse not found in canon: book_slug='{body.book_slug}', "
                    f"chapter={body.chapter_number}, verse={body.verse_number}."
                ),
            )

        # Upsert on the PK (user_id). RETURNING updated_at gives the
        # canonical timestamp; the request body already carries the
        # resolved (slug, chapter, verse) triple, so we echo it back
        # with the timestamp the DB set.
        upserted = await conn.fetchrow(
            "INSERT INTO reading_positions (user_id, verse_id) "
            "VALUES ($1::uuid, $2) "
            "ON CONFLICT (user_id) DO UPDATE "
            "  SET verse_id   = EXCLUDED.verse_id, "
            "      updated_at = now() "
            "RETURNING updated_at",
            user_uuid,
            verse_row["verse_id"],
        )

    return ReadingPositionResponse(
        book_slug=body.book_slug,
        chapter_number=body.chapter_number,
        verse_number=body.verse_number,
        updated_at=upserted["updated_at"],
    )


# ----- Display preferences cross-device sync (Session 173) ----------------
#
# Per S172_SACRED_NAME_MASK_SPEC the partner's reader-display preferences
# (sacred_name_mask, hide_parentheticals, theme, font_size,
# interlinear_default, tts_voice) sync server-side so a partner who
# changes their pref on phone A sees it carry to phone B at sign-in.
#
# Storage: users.display_prefs JSONB (S173 migration). Sparse — only keys
# the partner has explicitly set are present.
#
# Reconciliation rule (client-side): on sign-in the client GETs the
# stored prefs and the server wins on any divergence with localStorage
# (the spec's "Synced on sign-in: server preference wins over
# localStorage if the two diverge"). On every subsequent local change,
# the client PUTs the full intended state so the JSONB on the row
# always reflects the partner's current intent. Free-tier endpoint —
# display prefs are §9 free-tier per DESIGN_LANGUAGE.md (same posture
# as reading position).
#
# Endpoints:
#   GET /v1/me/display-prefs   → DisplayPrefs (all-None when row absent)
#   PUT /v1/me/display-prefs   → DisplayPrefs (echo of stored state)


@app.get("/v1/me/display-prefs", response_model=DisplayPrefs)
async def get_display_prefs(
    current_user: User = Depends(get_current_user_required),
) -> DisplayPrefs:
    """Return the partner's stored display preferences.

    Returns an all-None DisplayPrefs object when no preferences have
    ever been written (NULL column, or row absent — though
    upsert_user guarantees the row exists by the time this returns).
    The client treats all-None as "nothing to reconcile, localStorage
    is authoritative." Once any preference is PUT the corresponding
    key starts coming back populated and the client honors server-wins
    on divergence.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "SELECT display_prefs FROM users WHERE id = $1::uuid",
            user_uuid,
        )
    if row is None or row["display_prefs"] is None:
        return DisplayPrefs()
    # asyncpg returns JSONB as a Python dict (after the json codec is
    # registered in db.py; if not, as a JSON string). Handle both
    # shapes defensively — Pydantic v2 model_validate accepts a dict
    # but not a raw JSON string.
    raw = row["display_prefs"]
    if isinstance(raw, str):
        import json as _json
        raw = _json.loads(raw)
    return DisplayPrefs.model_validate(raw)


@app.put("/v1/me/display-prefs", response_model=DisplayPrefs)
async def upsert_display_prefs(
    body: DisplayPrefs,
    current_user: User = Depends(get_current_user_required),
) -> DisplayPrefs:
    """Replace the partner's stored display preferences with the body.

    Whole-object replacement, not partial merge. Rationale: the client
    always knows its current full intended state (every preference
    lives in localStorage); sending the whole state on every change
    keeps the server canonical and avoids stale-merge bugs across
    multi-device usage.

    `exclude_none=True` on the dump means client-side defaults that
    were never explicitly set don't get written — the JSONB stays
    sparse. To unset a preference back to client default, the client
    omits the key in the PUT body.
    """
    import json as _json

    payload = body.model_dump(exclude_none=True)

    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        # `to_jsonb($2::text)` parses the JSON string into a JSONB
        # value server-side, sidestepping any asyncpg codec
        # surprises. The body is small (≤6 keys) so the text round-
        # trip is fine.
        updated = await conn.fetchrow(
            "UPDATE users SET display_prefs = $2::jsonb "
            " WHERE id = $1::uuid "
            "RETURNING display_prefs",
            user_uuid,
            _json.dumps(payload),
        )
    raw = updated["display_prefs"] if updated else None
    if raw is None:
        return DisplayPrefs()
    if isinstance(raw, str):
        raw = _json.loads(raw)
    return DisplayPrefs.model_validate(raw)


# ----- Bookmarks (Session 124 — Wheel 5) ----------------------------------
#
# Per DESIGN_LANGUAGE.md §22 (locked S124): single-verse flag with richer
# metadata. Yoshi's S124 gate chose "richer card" over a simple
# short_description-only sheet. All endpoints auth-required, all Free-tier
# (no tier gate per §9). All 13 color_tint values valid for every tier
# (color on a bookmark is personal organization, NOT the marking
# vocabulary that creates the upgrade gate per §7).
#
# Distinct surface from highlights and notes — a verse can carry a
# bookmark AND notes AND up to 3 highlights simultaneously.
#
# Endpoints:
#   GET    /v1/bookmarks?book_slug=&chapter_number=
#   POST   /v1/bookmarks                          (create-or-replace)
#   DELETE /v1/bookmarks/{bookmark_id}


@app.get("/v1/bookmarks", response_model=ChapterBookmarksResponse)
async def list_chapter_bookmarks(
    book_slug: str = Query(...),
    chapter_number: int = Query(..., ge=1),
    current_user: User = Depends(get_current_user_required),
) -> ChapterBookmarksResponse:
    """Return the requesting partner's bookmarks for one chapter.

    Scoped to the canon edition (mirrors the highlights + reading-position
    endpoints' edition-resolution discipline). Returns 404 when the book
    or chapter doesn't resolve. The endpoint does NOT tier-filter — every
    Free partner sees their full bookmark set unchanged.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)

        chapter_row = await conn.fetchrow(
            "SELECT c.id "
            "  FROM chapters c "
            "  JOIN books    b ON c.book_id    = b.id "
            "  JOIN editions e ON b.edition_id = e.id "
            " WHERE b.slug = $1 AND e.slug = 'canon' "
            "   AND c.chapter_number = $2",
            book_slug,
            chapter_number,
        )
        if chapter_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Chapter {chapter_number} of '{book_slug}' not found in canon.",
            )

        rows = await conn.fetch(
            "SELECT bm.id::text AS id, bm.verse_id, bm.short_description, "
            "       bm.tags, bm.color_tint, bm.created_at, bm.updated_at "
            "  FROM bookmarks bm "
            "  JOIN verses    v  ON bm.verse_id = v.id "
            " WHERE bm.user_id = $1::uuid "
            "   AND v.chapter_id = $2 "
            " ORDER BY bm.created_at ASC, bm.id ASC",
            user_uuid,
            chapter_row["id"],
        )

    return ChapterBookmarksResponse(
        bookmarks=[Bookmark(**dict(r)) for r in rows]
    )


@app.post("/v1/bookmarks", response_model=Bookmark, status_code=201)
async def create_or_replace_bookmark(
    body: CreateOrReplaceBookmarkRequest,
    current_user: User = Depends(get_current_user_required),
) -> Bookmark:
    """Create-or-replace the partner's bookmark on one verse.

    UNIQUE (user_id, verse_id) means re-POST on a verse the partner
    already bookmarked is an EDIT (ON CONFLICT (user_id, verse_id) DO
    UPDATE) — the new short_description / tags / color_tint replace
    the prior values; updated_at refreshes to now(). This matches the
    §22 partner mental model: tapping Bookmark on an already-
    bookmarked verse opens the edit sheet with all fields pre-filled.

    All metadata fields optional — partner can commit a bare flag or
    fully labeled. No tier gate; all 13 color_tint values valid for
    every tier per §22's inversion-of-§7 (bookmark color is personal
    organization, not the marking vocabulary).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)

        # Resolve the verse_id so we 404 cleanly on stale / drift
        # references rather than letting Postgres raise an FK violation.
        verse_row = await conn.fetchrow(
            "SELECT id FROM verses WHERE id = $1",
            body.verse_id,
        )
        if verse_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Verse id={body.verse_id} not found.",
            )

        # Create-or-edit on (user_id, verse_id). EXCLUDED.* references
        # the values from the attempted INSERT; the DO UPDATE applies
        # them to the existing row when the unique constraint matches.
        # updated_at = now() refreshes even if the metadata is unchanged
        # so the partner sees a "last edited" timestamp that reflects
        # the most recent save action.
        row = await conn.fetchrow(
            "INSERT INTO bookmarks "
            "    (user_id, verse_id, short_description, tags, color_tint) "
            "VALUES ($1::uuid, $2, $3, $4, $5) "
            "ON CONFLICT ON CONSTRAINT bookmarks_user_verse_unique "
            "DO UPDATE SET "
            "    short_description = EXCLUDED.short_description, "
            "    tags              = EXCLUDED.tags, "
            "    color_tint        = EXCLUDED.color_tint, "
            "    updated_at        = now() "
            "RETURNING id::text, verse_id, short_description, tags, "
            "          color_tint, created_at, updated_at",
            user_uuid,
            body.verse_id,
            body.short_description,
            body.tags,
            body.color_tint,
        )

    return Bookmark(**dict(row))


@app.delete("/v1/bookmarks/{bookmark_id}", status_code=204)
async def delete_bookmark(
    bookmark_id: str,
    current_user: User = Depends(get_current_user_required),
) -> Response:
    """Remove one bookmark. Idempotent — deleting a missing or
    already-deleted row returns 204 (not 404). The partner's PWA may
    have raced; the user-facing result is the same either way.

    Scoped to the requesting user — passing another user's bookmark_id
    silently no-ops (the WHERE user_id = ... clause never matches).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        await conn.execute(
            "DELETE FROM bookmarks "
            " WHERE id = $1::uuid AND user_id = $2::uuid",
            bookmark_id,
            user_uuid,
        )
    return Response(status_code=204)


# ----- Bookmarks Index (Session 166 — DESIGN_LANGUAGE.md §29) -------------
#
# Per DESIGN_LANGUAGE.md §29 (locked S166): partner's global bookmarks list
# surface. The existing per-chapter GET /v1/bookmarks is the inline-glyph
# hot path; this new endpoint serves the BookmarksIndex sheet that opens
# from the chrome-header `Bookmarks` button and shows every bookmark
# across the canon, joined with verse + book metadata, sorted newest-first.
#
# Auth-required, Free-tier (no tier gate per §29 Gate #1; matches §22).
#
# Schema impact: none. The bookmarks table covers all needed columns;
# this endpoint adds the verses + chapters + books join + canon edition
# filter on the read side only.


@app.get("/v1/bookmarks/index", response_model=BookmarksIndexResponse)
async def list_bookmarks_index(
    current_user: User = Depends(get_current_user_required),
) -> BookmarksIndexResponse:
    """Return every bookmark the requesting partner has across the canon,
    joined with book + chapter + verse metadata, sorted by created_at
    DESC (newest-first per §29 Gate #3).

    No query params. The PWA fetches the full set on Index-sheet open;
    pagination, filtering, and grouping are v1.1+ candidates per §29's
    deliberate non-prescription block.

    Edition scope = canon only (mirrors GET /v1/bookmarks?…). The bookmarks
    table has no edition column itself but verses.chapter_id → chapters →
    books → editions chain carries it. Extras-tier books that share the
    bookmarks table architecturally don't have bookmarks at V1 (the §22
    inline-glyph + create surface scopes to canon only).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)

        rows = await conn.fetch(
            "SELECT bm.id::text AS id, "
            "       bm.verse_id, "
            "       b.slug         AS book_slug, "
            "       b.title        AS book_title, "
            "       c.chapter_number, "
            "       v.verse_number, "
            "       v.text         AS verse_text, "
            "       bm.short_description, "
            "       bm.tags, "
            "       bm.color_tint, "
            "       bm.created_at, "
            "       bm.updated_at "
            "  FROM bookmarks bm "
            "  JOIN verses    v  ON bm.verse_id    = v.id "
            "  JOIN chapters  c  ON v.chapter_id   = c.id "
            "  JOIN books     b  ON c.book_id      = b.id "
            "  JOIN editions  e  ON b.edition_id   = e.id "
            " WHERE bm.user_id = $1::uuid "
            "   AND e.slug = 'canon' "
            " ORDER BY bm.created_at DESC, bm.id DESC",
            user_uuid,
        )

    return BookmarksIndexResponse(
        bookmarks=[BookmarkIndexEntry(**dict(r)) for r in rows]
    )


# ----- Notes V1 (Session 124 — Wheel 5) -----------------------------------
#
# Per DESIGN_LANGUAGE.md §22 (locked S124): single global notepad for the
# Free tier with verse-anchor injection. Schema is the existing
# study_notes table (S9) with the legacy CHECK relaxed at S124 so rows
# with both chapter_id and verse_id NULL are valid (the chrome-button
# free-form path).
#
# All endpoints auth-required, all Free-tier (no tier gate per §9).
#
# Endpoints:
#   GET  /v1/notes      — list all partner's entries, created_at ASC
#   POST /v1/notes      — append a new entry (verse_id optional)
#
# V1 shipped GET/POST only. S203 (Session C) adds PATCH/DELETE for
# the Study Notes tier and the free-tier note cap — the Free notepad
# stays append-only per §22; Free partners who want to revisit an old
# entry tap the verse again → Add note → addendum entry.

# S203 — the free-tier conversion lever (Yoshi's Session C call:
# "tight caps"). Free partners hold up to this many non-archived
# notes; Study Notes ($1.99+) is uncapped.
_FREE_NOTE_CAP = 10


@app.get("/v1/notes", response_model=NotesResponse)
async def list_notes(
    current_user: User = Depends(get_current_user_required),
) -> NotesResponse:
    """Return the partner's notes, ordered chronologically (oldest
    first). The PWA panel renders this as the single-global-notepad
    chronological journal — most-recent entry at the bottom, panel
    scrolls to bottom on open.

    Returns all non-archived rows. W8 ($1.99 Notes tier) will add
    filtering query params over this same row set; V1 returns the full
    set every call (the Free notepad is one stream, not per-verse).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        # LEFT JOIN against verses/chapters/books/editions to compute
        # the human-readable verse_ref string for each entry. Scoped to
        # the canon edition (same edition discipline as the highlights /
        # reading-position endpoints). Free-form entries (verse_id NULL)
        # get verse_ref NULL; out-of-canon-edition resolves get NULL too
        # (defensive — shouldn't happen for V1 since Add-note only fires
        # on canon verses, but kept honest).
        rows = await conn.fetch(
            "SELECT n.id::text AS id, n.verse_id, n.chapter_id, n.title, "
            "       n.body, n.created_at, n.updated_at, "
            "       CASE WHEN n.verse_id IS NULL THEN NULL "
            "            ELSE b.title || ' ' || c.chapter_number::text || "
            "                 ':' || v.verse_number::text "
            "       END AS verse_ref "
            "  FROM study_notes n "
            "  LEFT JOIN verses   v ON n.verse_id = v.id "
            "  LEFT JOIN chapters c ON v.chapter_id = c.id "
            "  LEFT JOIN books    b ON c.book_id = b.id "
            "  LEFT JOIN editions e ON b.edition_id = e.id AND e.slug = 'canon' "
            " WHERE n.user_id = $1::uuid "
            "   AND n.is_archived = FALSE "
            " ORDER BY n.created_at ASC, n.id ASC",
            user_uuid,
        )
    return NotesResponse(notes=[NoteEntry(**dict(r)) for r in rows])


@app.post("/v1/notes", response_model=NoteEntry, status_code=201)
async def append_note(
    body: CreateNoteRequest,
    current_user: User = Depends(get_current_user_required),
) -> NoteEntry:
    """Append a new entry to the partner's notepad.

    Two V1 paths per §22:
      (a) Add-note-from-verse — body carries verse_id; entry renders
          with the bold verse-reference header in the panel.
      (b) Chrome-Notes-button free-form — body has verse_id=None; the
          entry renders without a header.

    Tier shape (S203, Yoshi's Session C call): note creation is free
    up to the 10-note cap; the cap is the conversion lever ("7 of 10
    free notes used" on the My Study surface). Study Notes ($1.99+)
    is uncapped. `tags` (collections) is a Study Notes field — free
    callers sending tags get 403 so the upgrade trigger fires at the
    point of intent. title is left NULL (W8 named notes). chapter_id
    stays NULL — verse-anchor is sufficient ground for the notepad's
    chronological journal model.

    If verse_id is provided but doesn't resolve to a real verse, 404
    (catches client drift before silently writing an orphaned row).
    """
    tier = user_tier(current_user)
    if tier == "free" and body.tags:
        raise HTTPException(
            status_code=403,
            detail=(
                "Collections are a Study Notes ($1.99/mo) feature. "
                "Upgrade to organize your notes into collections."
            ),
        )

    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)

        if tier == "free":
            count_row = await conn.fetchrow(
                "SELECT COUNT(*) AS n FROM study_notes "
                " WHERE user_id = $1::uuid AND is_archived = FALSE",
                user_uuid,
            )
            if count_row["n"] >= _FREE_NOTE_CAP:
                raise HTTPException(
                    status_code=403,
                    detail=(
                        f"The free notepad holds {_FREE_NOTE_CAP} notes. "
                        "Upgrade to Study Notes ($1.99/mo) for unlimited "
                        "notes, collections, search, and export."
                    ),
                )

        if body.verse_id is not None:
            verse_row = await conn.fetchrow(
                "SELECT id FROM verses WHERE id = $1",
                body.verse_id,
            )
            if verse_row is None:
                raise HTTPException(
                    status_code=404,
                    detail=f"Verse id={body.verse_id} not found.",
                )

        # INSERT + immediately resolve verse_ref via a single CTE so
        # the response carries the same shape GET /v1/notes returns.
        # The LEFT JOINs scope to the canon edition mirroring the GET
        # path; free-form inserts (verse_id NULL) get verse_ref NULL.
        row = await conn.fetchrow(
            "WITH inserted AS ( "
            "    INSERT INTO study_notes (user_id, verse_id, body, tags) "
            "    VALUES ($1::uuid, $2, $3, $4) "
            "    RETURNING id, verse_id, chapter_id, title, body, "
            "              created_at, updated_at "
            ") "
            "SELECT n.id::text AS id, n.verse_id, n.chapter_id, n.title, "
            "       n.body, n.created_at, n.updated_at, "
            "       CASE WHEN n.verse_id IS NULL THEN NULL "
            "            ELSE b.title || ' ' || c.chapter_number::text || "
            "                 ':' || v.verse_number::text "
            "       END AS verse_ref "
            "  FROM inserted n "
            "  LEFT JOIN verses   v ON n.verse_id = v.id "
            "  LEFT JOIN chapters c ON v.chapter_id = c.id "
            "  LEFT JOIN books    b ON c.book_id = b.id "
            "  LEFT JOIN editions e ON b.edition_id = e.id AND e.slug = 'canon'",
            user_uuid,
            body.verse_id,
            body.body,
            body.tags,
        )

    return NoteEntry(**dict(row))


@app.patch("/v1/notes/{note_id}", response_model=NoteEntry)
async def update_note(
    note_id: str,
    body: UpdateNoteRequest,
    current_user: User = Depends(get_current_user_required),
) -> NoteEntry:
    """Edit a note's body and/or tags (collections) — Study Notes
    tier ($1.99+). The Free notepad stays append-only per §22; free
    callers get 403 with the upgrade trigger.

    Omitted fields are left untouched; `tags` replaces the whole
    array when present (empty list clears all collections). 404 when
    the note doesn't exist or belongs to another partner (same
    response either way — no existence oracle).
    """
    tier = user_tier(current_user)
    if tier == "free":
        raise HTTPException(
            status_code=403,
            detail=(
                "Editing notes is a Study Notes ($1.99/mo) feature. "
                "The free notepad is append-only — add a new entry, "
                "or upgrade to edit and organize."
            ),
        )
    if body.body is None and body.tags is None:
        raise HTTPException(
            status_code=422,
            detail="Provide body and/or tags to update.",
        )

    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "WITH updated AS ( "
            "    UPDATE study_notes "
            "       SET body = COALESCE($3, body), "
            "           tags = CASE WHEN $4::boolean THEN $5 ELSE tags END, "
            "           updated_at = now() "
            "     WHERE id = $1::uuid AND user_id = $2::uuid "
            "       AND is_archived = FALSE "
            "    RETURNING id, verse_id, chapter_id, title, body, "
            "              created_at, updated_at "
            ") "
            "SELECT n.id::text AS id, n.verse_id, n.chapter_id, n.title, "
            "       n.body, n.created_at, n.updated_at, "
            "       CASE WHEN n.verse_id IS NULL THEN NULL "
            "            ELSE b.title || ' ' || c.chapter_number::text || "
            "                 ':' || v.verse_number::text "
            "       END AS verse_ref "
            "  FROM updated n "
            "  LEFT JOIN verses   v ON n.verse_id = v.id "
            "  LEFT JOIN chapters c ON v.chapter_id = c.id "
            "  LEFT JOIN books    b ON c.book_id = b.id "
            "  LEFT JOIN editions e ON b.edition_id = e.id AND e.slug = 'canon'",
            note_id,
            user_uuid,
            body.body,
            body.tags is not None,
            body.tags,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="Note not found.")
    return NoteEntry(**dict(row))


@app.delete("/v1/notes/{note_id}", status_code=204)
async def delete_note(
    note_id: str,
    current_user: User = Depends(get_current_user_required),
) -> None:
    """Delete a note — Study Notes tier ($1.99+). Soft-delete via
    is_archived so a mis-tap is recoverable server-side (no partner
    data is ever hard-dropped by a single tap). Free callers get 403
    (the §22 append-only notepad).
    """
    tier = user_tier(current_user)
    if tier == "free":
        raise HTTPException(
            status_code=403,
            detail=(
                "Deleting notes is a Study Notes ($1.99/mo) feature. "
                "Upgrade to edit and organize your notepad."
            ),
        )
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        result = await conn.execute(
            "UPDATE study_notes SET is_archived = TRUE, updated_at = now() "
            " WHERE id = $1::uuid AND user_id = $2::uuid "
            "   AND is_archived = FALSE",
            note_id,
            user_uuid,
        )
    if result == "UPDATE 0":
        raise HTTPException(status_code=404, detail="Note not found.")


# ----- My Study (Session 203 — Session C) ----------------------------------
#
# The unified personal-apparatus home per the S203 signed-off proof:
# one payload carrying everything the partner has marked — notes,
# bookmarks, highlights — joined with verse + book metadata, plus the
# color-label dictionary and the free-tier note-cap meter.
#
# Search + the color filter + grouping all run CLIENT-side over this
# payload: a partner's apparatus is hundreds of rows at most, already
# in hand, and instant-as-you-type beats a network round trip. Export
# (Markdown + PDF, Study Notes tier) renders client-side from the
# same payload. No new search endpoint; no N+1.
#
# Auth-required, every tier — the free partner sees the same home
# with their capped content; Search/Collections/Export chrome carries
# the Study Notes chip client-side (full opacity + tier chip per the
# no-greyed-text lock).


@app.get("/v1/study/index", response_model=StudyIndexResponse)
async def study_index(
    current_user: User = Depends(get_current_user_required),
) -> StudyIndexResponse:
    """Return the partner's whole study apparatus in one payload.

    Three arrays (notes / bookmarks / highlights), each joined with
    verse + book metadata so every card renders without follow-up
    fetches; the color-label dictionary for the Highlights tab's
    color sections; and note_count + note_cap for the lever card.
    Edition scope = canon (mirrors the per-surface endpoints).
    """
    tier = user_tier(current_user)
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)

        note_rows = await conn.fetch(
            "SELECT n.id::text AS id, n.verse_id, n.title, n.body, n.tags, "
            "       n.created_at, n.updated_at, "
            "       CASE WHEN n.verse_id IS NULL THEN NULL "
            "            ELSE b.title || ' ' || c.chapter_number::text || "
            "                 ':' || v.verse_number::text "
            "       END AS verse_ref, "
            "       v.text          AS verse_text, "
            "       b.slug          AS book_slug, "
            "       c.chapter_number, "
            "       v.verse_number "
            "  FROM study_notes n "
            "  LEFT JOIN verses   v ON n.verse_id = v.id "
            "  LEFT JOIN chapters c ON v.chapter_id = c.id "
            "  LEFT JOIN books    b ON c.book_id = b.id "
            "  LEFT JOIN editions e ON b.edition_id = e.id AND e.slug = 'canon' "
            " WHERE n.user_id = $1::uuid AND n.is_archived = FALSE "
            " ORDER BY n.created_at DESC, n.id DESC",
            user_uuid,
        )

        bookmark_rows = await conn.fetch(
            "SELECT bm.id::text AS id, bm.verse_id, "
            "       b.slug AS book_slug, b.title AS book_title, "
            "       c.chapter_number, v.verse_number, "
            "       v.text AS verse_text, "
            "       bm.short_description, bm.tags, bm.color_tint, "
            "       bm.created_at, bm.updated_at "
            "  FROM bookmarks bm "
            "  JOIN verses    v ON bm.verse_id  = v.id "
            "  JOIN chapters  c ON v.chapter_id = c.id "
            "  JOIN books     b ON c.book_id    = b.id "
            "  JOIN editions  e ON b.edition_id = e.id "
            " WHERE bm.user_id = $1::uuid AND e.slug = 'canon' "
            " ORDER BY bm.created_at DESC, bm.id DESC",
            user_uuid,
        )

        highlight_rows = await conn.fetch(
            "SELECT h.id::text AS id, h.verse_id, h.color, h.style, "
            "       b.slug AS book_slug, b.title AS book_title, "
            "       c.chapter_number, v.verse_number, "
            "       v.text AS verse_text, h.created_at "
            "  FROM verse_highlights h "
            "  JOIN verses    v ON h.verse_id   = v.id "
            "  JOIN chapters  c ON v.chapter_id = c.id "
            "  JOIN books     b ON c.book_id    = b.id "
            "  JOIN editions  e ON b.edition_id = e.id "
            " WHERE h.user_id = $1::uuid AND e.slug = 'canon' "
            " ORDER BY h.created_at DESC, h.id DESC",
            user_uuid,
        )

        labels = (await _build_labels_response(conn, user_uuid)).labels

    return StudyIndexResponse(
        notes=[StudyNoteEntry(**dict(r)) for r in note_rows],
        bookmarks=[BookmarkIndexEntry(**dict(r)) for r in bookmark_rows],
        highlights=[StudyHighlightEntry(**dict(r)) for r in highlight_rows],
        labels=labels,
        note_count=len(note_rows),
        note_cap=_FREE_NOTE_CAP if tier == "free" else None,
    )


# ----- Search -------------------------------------------------------------


# Tokenizer for search query expansion. Letters + apostrophes only —
# punctuation and numbers stripped. Lowercased for the synonym lookup.
_SEARCH_TOKEN_RE = re.compile(r"[A-Za-z][A-Za-z']*")

# S151 v2.1 — per-query pg_trgm similarity threshold for the fuzzy
# vocabulary lookup. The default of 0.6 is too strict for real typos
# (synagauge → synagogue is ~0.45). 0.3 catches the meaningful misses
# without flooding the result set with weakly-related lexemes.
_FUZZY_SIMILARITY_THRESHOLD = 0.3


async def _expand_synonyms(conn, tokens: list[str]) -> dict[str, list[str]]:
    """Look up synonym variants for each user token. Returns
    {user_token_lower: [variant_lower, ...]}; missing tokens have no entry.
    Single roundtrip via ANY($1) for all tokens. Synonym groups are stored
    in search_expansion_groups (kind='synonym') + search_expansion_terms;
    populated by data-schema/migrations/session150_search_engine_v2.sql.
    """
    if not tokens:
        return {}
    rows = await conn.fetch(
        """
        SELECT LOWER(et1.term) AS user_term, et2.term AS variant
          FROM search_expansion_terms et1
          JOIN search_expansion_groups g ON g.id = et1.group_id
          JOIN search_expansion_terms et2 ON et2.group_id = g.id
         WHERE g.kind = 'synonym'
           AND LOWER(et1.term) = ANY($1::text[])
        """,
        tokens,
    )
    out: dict[str, set[str]] = {}
    for r in rows:
        out.setdefault(r["user_term"], set()).add(r["variant"].lower())
    return {k: sorted(v) for k, v in out.items()}


async def _expand_fuzzy(conn, tokens: list[str]) -> dict[str, list[str]]:
    """S151 v2.1 — for tokens that match no synonym group, return the
    nearest real lexemes from the materialized search_vocabulary table
    via trigram similarity. Returns {user_token_lower: [nearest_lexeme, ...]}
    with up to 3 lexemes per token, ranked by an occurrence-weighted
    similarity score (more common biblical lexemes outrank near-equal-
    similarity rare ones).

    The trgm GIN index supports the ``%`` operator at the session's
    current ``pg_trgm.similarity_threshold``. The default 0.6 is too
    strict for real typos (synagauge → synagogue is ~0.45); ``SET LOCAL
    pg_trgm.similarity_threshold = 0.3`` widens the index seek to catch
    the meaningful misses without flooding the result set with weakly-
    related lexemes. The SET LOCAL only persists within the explicit
    transaction wrapping the lookup.

    Single roundtrip via LATERAL JOIN against unnest($1::text[]) — one
    set of fuzzy expansions across all unexpanded user tokens.

    S152 tiebreak tuning (Wheel #2a). The S151 ranking was
    ``similarity DESC, occurrences DESC`` — similarity won first, with
    occurrences only firing on exact-similarity ties. The smoke test at
    S151 close exposed the failure mode: ``synagauge`` ranked ``syna``
    (sim 0.3636, occ 1) above ``synagogu`` (sim 0.3571, occ 81) by
    0.0065 on similarity, even though ``synagogu`` is clearly the
    intended typo target. ``synagogu`` still made the LIMIT 3 expansion
    so user-facing search behavior worked, but the WARN signaled the
    ranking was sub-optimal.

    The new primary key is
    ``similarity(lexeme, tok) * SQRT(LEAST(occurrences, 1000))`` — a
    diminishing-returns boost for high-occurrence lexemes. The
    ``LEAST(..., 1000)`` cap prevents stopword-frequency words from
    dominating the ranking once their occurrence count crosses the
    typo-correction signal threshold (at occ=1000 the SQRT factor is
    31.6, which is the most boost the ranking allows). Within
    threshold (sim ≥ 0.3 is the pg_trgm cutoff), boost grows roughly
    linearly with √occurrences:

        syna     (0.3636, occ 1)  → 0.3636 × √1  = 0.3636
        synagogu (0.3571, occ 81) → 0.3571 × √81 = 3.21

    9x margin — synagogu now ranks first and the LIMIT 3 expansion
    prefers the meaningful biblical word over the proper-noun fragment.
    Secondary tiebreaks (occurrences DESC, similarity DESC) make the
    ordering deterministic when the weighted score ties exactly.

    Source: data-schema/migrations/session151_search_vocabulary.sql.
    Design record: S150_CHECKPOINT.md → Wheel #2.
    S152 tiebreak record: S151_CHECKPOINT.md → ``syna`` WARN block;
    S152_SESSION_OPEN_PROMPT.md → Wheel #2a.
    """
    if not tokens:
        return {}
    async with conn.transaction():
        await conn.execute(
            f"SET LOCAL pg_trgm.similarity_threshold = {_FUZZY_SIMILARITY_THRESHOLD}"
        )
        rows = await conn.fetch(
            """
            SELECT u.tok, sv.lexeme
              FROM unnest($1::text[]) AS u(tok)
              CROSS JOIN LATERAL (
                SELECT lexeme
                  FROM search_vocabulary
                 WHERE lexeme % u.tok
                 ORDER BY similarity(lexeme, u.tok)
                            * SQRT(LEAST(occurrences, 1000)) DESC,
                          occurrences DESC,
                          similarity(lexeme, u.tok) DESC
                 LIMIT 3
              ) sv
            """,
            tokens,
        )
    out: dict[str, list[str]] = {}
    for r in rows:
        out.setdefault(r["tok"], []).append(r["lexeme"])
    return out


async def _expand_concepts(conn, q: str) -> list[str]:
    """S151 — concept layer. Return a list of ILIKE patterns ('%phrase%')
    for any concept-group phrase linked to a phrase that case-insensitively
    appears in the user query. Empty list when no concept group fires.

    Concept groups are stored in search_expansion_groups (kind='concept')
    + search_expansion_terms; populated by
    data-schema/migrations/session151_concept_groups.sql.

    Logic: pull every concept-group term, find which groups have any term
    substring-matching the query (case-insensitive), collect all OTHER
    terms in those groups (excluding the matched term itself so we don't
    re-match what tsquery already covers). Single roundtrip against the
    small (~12 rows at S151) concept table; the Python-side substring
    check is cheap and avoids LIKE-pattern injection complexity in SQL.

    Returns ILIKE patterns ready to drop into the search_verses query's
    ``v.text ILIKE ANY($4::text[])`` clause.
    """
    q_lower = q.lower()
    rows = await conn.fetch(
        """
        SELECT g.id AS group_id, et.term
          FROM search_expansion_groups g
          JOIN search_expansion_terms et ON et.group_id = g.id
         WHERE g.kind = 'concept'
        """
    )
    if not rows:
        return []
    groups: dict[int, list[str]] = {}
    for r in rows:
        groups.setdefault(r["group_id"], []).append(r["term"])
    # For each group: if any term substring-matches q, surface all OTHER
    # terms in that group (so the tsquery covers what the user typed; the
    # concept layer covers the linked phrases the framework reads as
    # one diagnostic).
    linked: set[str] = set()
    for terms in groups.values():
        matched = [t for t in terms if t.lower() in q_lower]
        if matched:
            for t in terms:
                if t not in matched:
                    linked.add(t)
    return [f"%{t}%" for t in linked]


def _build_tsquery(
    tokens: list[str],
    synonym_map: dict[str, list[str]],
    fuzzy_map: dict[str, list[str]] | None = None,
) -> str:
    """Build a tsquery string with each user token OR-expanded to its
    synonym group's variants (if any) AND the nearest fuzzy lexemes
    (if any), AND-joined across tokens. Apostrophes stripped in variants
    so they collapse to the same lexemes the english parser produces
    from to_tsvector on the verse text. Returns empty string when no
    tokens are search-usable.

    S151 — fuzzy_map adds nearest real lexemes from the
    search_vocabulary table for tokens that match no synonym group.
    Synonym and fuzzy are mutually exclusive per-token by construction
    (fuzzy is only computed for tokens not in synonym_map).
    """
    fuzzy_map = fuzzy_map or {}
    parts: list[str] = []
    for tok in tokens:
        clean = tok.replace("'", "")
        if not clean:
            continue
        variants = synonym_map.get(tok)
        if variants:
            sanitized = sorted({v.replace("'", "") for v in variants if v})
            if len(sanitized) > 1:
                parts.append("(" + " | ".join(sanitized) + ")")
            else:
                parts.append(sanitized[0])
            continue
        fuzzy_alts = fuzzy_map.get(tok)
        if fuzzy_alts:
            # Include the original token alongside the fuzzy alternatives —
            # if the user typed an exact lexeme that happens to be in the
            # vocabulary, the tsquery should still match on the literal.
            alts = sorted({clean, *(v.replace("'", "") for v in fuzzy_alts if v)})
            if len(alts) > 1:
                parts.append("(" + " | ".join(alts) + ")")
            else:
                parts.append(alts[0])
        else:
            parts.append(clean)
    return " & ".join(parts)


@app.get("/v1/verses/search", response_model=VerseSearchResponse)
async def search_verses(
    q: str = Query(..., min_length=2, description="Phrase to search for."),
    limit: int = Query(default=50, ge=1, le=200),
    offset: int = Query(
        default=0,
        ge=0,
        description="S352 — pagination offset. Combined with the "
        "count(*) OVER() window total the UI shows 'N of M'.",
    ),
    mode: str = Query(
        default="related",
        pattern="^(exact|related)$",
        description="S352 — 'exact' = phrase / exact-token FTS only; "
        "'related' = full expansion (synonym + fuzzy + concept). "
        "Search itself is free for all in either mode.",
    ),
    book: Optional[str] = Query(
        default=None,
        description="S352 — restrict the search to a single book slug "
        "(convenience alias for books=<slug>).",
    ),
    books: Optional[List[str]] = Query(
        default=None,
        description="S352 — restrict the search to these book slugs "
        "(repeatable: books=genesis&books=exodus). Empty = whole canon "
        "+ extras.",
    ),
) -> VerseSearchResponse:
    """
    Verse search v3 (S352) — relevance-ranked, phrase/boolean-aware,
    paginated, book-scoped, mode-toggled. Built on the S150 search
    engine + S151 vocabulary fuzzy + concept layer.

    S352 rebuild, five changes over the S151 v2.1 shape:

      1. **Relevance ranking.** The v2.1 endpoint ordered every hit by
         ``canonical_order, chapter, verse`` then truncated at LIMIT 25,
         so a strong later-book match fell off the bottom and read as
         "missing". v3 ranks with a tiered ``match_tier`` (1 exact
         phrase → 2 exact token(s) → 3 synonym → 4 trigram/fuzzy →
         5 concept), then ``ts_rank`` DESC, then ``similarity`` DESC,
         with canonical order only as the final tiebreak.

      2. **Phrase + boolean.** ``websearch_to_tsquery('english', q)``
         parses quotes (adjacency), ``-word`` exclusion, and ``OR`` the
         way a reader expects from a search box. A raw contiguous
         ``ILIKE '%q%'`` sits above it as the exact-phrase tier so a
         literal phrase always outranks a scattered-token match even
         when the english stemmer would have split them.

      3. **No 25-cap.** ``limit``/``offset`` paginate; ``count(*)
         OVER()`` returns the true pre-limit total so the PWA can show
         "N of M" and page through the rest.

      4. **Book scope.** ``book`` / ``books[]`` → ``b.slug = ANY(...)``
         so a reader can search within one book (or a chosen set).

      5. **Mode toggle.** ``exact`` restricts matching to the phrase /
         exact-token FTS tiers (tiers 1–2); ``related`` adds the full
         expansion (synonym tier 3, trigram/fuzzy tier 4, concept
         tier 5). Search is FREE FOR ALL in both modes — no tier gate
         on searching or on seeing results. Result-row click-gating
         (extra-canonical rows) is a PWA concern, rendered client-side
         from ``tier_required``; the endpoint stays public and returns
         every hit.

    Legacy engine detail (unchanged from v2.1) —

    Verse search v2.1 — S150 search engine + S151 vocabulary fuzzy +
    concept layer.

    Three layers of query widening before the match lands on
    ``verses.text_tsv`` (tsvector GENERATED ALWAYS from
    ``to_tsvector('english', text)``, GIN-indexed at
    ``idx_verses_text_tsv``):

      1. **Synonym expansion (token-level).** Each user token is looked
         up in ``search_expansion_terms`` / ``search_expansion_groups``
         (kind='synonym'). When a token belongs to a group, the
         ``to_tsquery`` substitutes an OR-expansion of all variants in
         that group. Searching "Jehovah" or "Yahweh" lands on Yahuah;
         searching "tzaddik" lands on tsaddiq / righteous / just. The
         framework's posture toward the deceived — they were handed
         this; the deception is not their fault — applies to discovery:
         meet readers with the vocabulary they were taught; the text on
         the page brings them home in the restored Sacred Names form.

      2. **Vocabulary fuzzy (token-level, S151).** For tokens that match
         no synonym group, ``_expand_fuzzy`` looks up the nearest real
         lexemes in the materialized ``search_vocabulary`` table via
         trigram similarity. ``SET LOCAL pg_trgm.similarity_threshold =
         0.3`` widens the GIN-backed ``%`` operator's index seek to
         catch real typos: ``synagauge → synagogue``,
         ``yehowah → yahuah``, ``messias → messiah``. Up to 3 nearest
         lexemes per token, ranked by similarity DESC + occurrences DESC.

      3. **Concept layer (S151).** ``_expand_concepts`` walks the
         ``search_expansion_groups`` table for ``kind='concept'`` rows.
         When any phrase in a concept group case-insensitively appears
         in the user query, every OTHER phrase in that group surfaces
         too via an ILIKE-ANY OR clause. Searching ``synagogue of Satan``
         also surfaces the ``sons of Belial`` verses (framework reads
         them as one diagnostic, S151 seed). Searching ``tares`` or
         ``watchers`` surfaces the seed-war cluster.

    Result ordering: canonical book / chapter / verse ASC across both
    the tsquery hits and the concept-layer ILIKE hits. The Round-3
    perf shape from S150 is preserved — single SELECT, no CTEs, no
    GROUP BY, GIN-backed both sides of the OR (idx_verses_text_tsv for
    tsquery; idx_verses_text_trgm for ILIKE). The ``similarity`` field
    in the response is computed against the original query so the
    response shape stays stable for the PWA.

    Predecessor history: S148/S148b switched v1 from trigram-only ``%``
    to ILIKE substring (2,000x speedup); S150 added the tsvector +
    synonym path on top; S151 adds vocabulary fuzzy + concept layer.

    Session 125 (W6 Search V1 UI — DESIGN_LANGUAGE.md §23) keeps
    ``books.tier_required`` in the response so the PWA can render the
    gate-(c) tier-aware snippet card client-side without a second round
    trip. The endpoint stays public (no auth) — search itself does not
    tier-gate; tier-aware rendering happens in the PWA.
    """
    related = mode == "related"

    # S352 — merge the single-book convenience alias into the books[] set.
    book_slugs: list[str] = []
    if books:
        book_slugs.extend(s for s in books if s)
    if book:
        book_slugs.append(book)
    # De-dupe, preserve nothing about order (only membership matters).
    book_slugs = sorted(set(book_slugs))

    pool = get_pool()
    async with pool.acquire() as conn:
        raw_tokens = [t.lower() for t in _SEARCH_TOKEN_RE.findall(q)]

        # S352 — expansion runs only in 'related' mode. 'exact' restricts
        # matching to the phrase / exact-token FTS tiers so a reader who
        # wants precision isn't handed synonym / fuzzy / concept widening.
        if related and raw_tokens:
            synonym_map = await _expand_synonyms(conn, raw_tokens)
            unexpanded = [t for t in raw_tokens if t not in synonym_map]
            fuzzy_map = await _expand_fuzzy(conn, unexpanded) if unexpanded else {}
            concept_patterns = await _expand_concepts(conn, q)
        else:
            synonym_map = {}
            fuzzy_map = {}
            concept_patterns = []

        # S352 — tiers 3 and 4 use SEPARATE tsqueries so match_tier can
        # tell a synonym hit (Jehovah→Yahuah) apart from a fuzzy/typo hit
        # (synagauge→synagogue). Each includes the original tokens, but
        # the CASE ranks the literal-token tier (2, websearch) above both,
        # so these tiers only capture rows the literal query missed.
        synonym_tsquery = (
            _build_tsquery(raw_tokens, synonym_map, None)
            if (related and synonym_map)
            else ""
        )
        fuzzy_tsquery = (
            _build_tsquery(raw_tokens, {}, fuzzy_map)
            if (related and fuzzy_map)
            else ""
        )

        # Single SELECT. websearch_to_tsquery on the raw string handles
        # quotes (phrase adjacency), -exclusion, and OR. The exact-phrase
        # ILIKE sits above it as tier 1. count(*) OVER() is the true
        # pre-LIMIT total for the PWA "N of M" pager. GIN-backed:
        # idx_verses_text_tsv for the tsquery tiers, idx_verses_text_trgm
        # for the ILIKE / similarity tiers.
        rows = await conn.fetch(
            """
            SELECT v.id AS verse_id,
                   b.slug AS book_slug, b.title AS book_title,
                   c.chapter_number, v.verse_number, v.text,
                   b.tier_required AS tier_required,
                   similarity(v.text, $1) AS sim,
                   CASE
                     WHEN v.text ILIKE '%' || $1 || '%' THEN 1
                     WHEN v.text_tsv @@ websearch_to_tsquery('english', $1)
                          THEN 2
                     WHEN $7 AND length($2) > 0
                          AND v.text_tsv @@ to_tsquery('english', $2) THEN 3
                     WHEN $7 AND length($8) > 0
                          AND v.text_tsv @@ to_tsquery('english', $8) THEN 4
                     ELSE 5
                   END AS match_tier,
                   count(*) OVER() AS total_count
              FROM verses v
              JOIN chapters c ON c.id = v.chapter_id
              JOIN books    b ON b.id = c.book_id
             WHERE (cardinality($6::text[]) = 0 OR b.slug = ANY($6::text[]))
               AND (
                    v.text ILIKE '%' || $1 || '%'
                 OR v.text_tsv @@ websearch_to_tsquery('english', $1)
                 OR ($7 AND length($2) > 0
                     AND v.text_tsv @@ to_tsquery('english', $2))
                 OR ($7 AND length($8) > 0
                     AND v.text_tsv @@ to_tsquery('english', $8))
                 OR ($7 AND cardinality($3::text[]) > 0
                     AND v.text ILIKE ANY($3::text[]))
               )
             ORDER BY match_tier ASC,
                      ts_rank(v.text_tsv,
                              websearch_to_tsquery('english', $1)) DESC,
                      similarity(v.text, $1) DESC,
                      b.canonical_order ASC,
                      c.chapter_number ASC,
                      v.verse_number ASC
             LIMIT $4 OFFSET $5
            """,
            q,
            synonym_tsquery,
            concept_patterns,
            limit,
            offset,
            book_slugs,
            related,
            fuzzy_tsquery,
        )

    total = int(rows[0]["total_count"]) if rows else 0
    hits = [
        VerseSearchHit(
            verse_id=r["verse_id"],
            book_slug=r["book_slug"],
            book_title=r["book_title"],
            chapter_number=r["chapter_number"],
            verse_number=r["verse_number"],
            text=r["text"],
            similarity=float(r["sim"] or 0.0),
            tier_required=r["tier_required"],
            match_tier=int(r["match_tier"]),
        )
        for r in rows
    ]
    return VerseSearchResponse(
        query=q,
        total=total,
        hits=hits,
        limit=limit,
        offset=offset,
        mode=mode,
    )


# ----- Strong's tap-on-word (Session 120 — Wheel 1) -----------------------
#
# Free-tier feature per DESIGN_LANGUAGE.md §9 — every partner gets
# Strong's number + brief lexicon entry on every word of every verse,
# no auth required, no tier gate. Two endpoints power the PWA UI:
# verse-words alignment for click-handler overlay, plus per-Strong's
# lexicon entry lookup. Data loaded by
# restoration-pipeline/_session120_load_strong_entries.py +
# _session120_load_verse_words.py from OpenScriptures public-domain XML
# and the existing source-texts/kjv/eng-kjv_usfx.xml respectively.


def _is_at_companion_tier(user: Optional[User]) -> bool:
    """S168 — §28 Companion-gate predicate.

    Companion = ``complete_study`` (Bible+Companion bundle) or
    ``everything`` (full everything-annual). Below-Companion = anonymous,
    free, study_notes, or extras. Mirrors the PWA-side
    ``isAtCompanionTier`` helper in
    ``app/src/lib/useInterlinearToggle.ts`` so both sides resolve the
    gate against the same two literals.
    """
    if user is None:
        return False
    return user.partner_tier in ("complete_study", "everything")


@app.get(
    "/v1/verses/{verse_id}/words",
    response_model=VerseWordsResponse,
)
async def get_verse_words(
    verse_id: int,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> VerseWordsResponse:
    """
    Position-ordered list of Strong's-tagged English tokens for one
    verse. The PWA uses this to overlay tap handlers on the rendered
    verse text — for each word in the rendered prose, surface-match
    against this list to find the strong_number, attach a click
    handler that fires GET /v1/strongs/{strong_number}.

    Base tri-tuple (position, surface, strong_number) is free-tier per
    §9. S168 extends each row with the four §28 interlinear fields
    (morphology, lemma, transliteration, short_definition, language)
    populated only for Companion+ callers; below-Companion callers
    receive ``None`` for those fields. Mirrors the chapter-words
    tier-gate so a partner who hits either endpoint sees the same
    payload shape. 404 when the verse_id doesn't exist; empty
    `words` list when the verse exists but has no tagged tokens yet
    (e.g., extras books outside the canon load).
    """
    pool = get_pool()
    is_companion = _is_at_companion_tier(current_user)
    tier = user_tier(current_user)
    async with pool.acquire() as conn:
        # Book-level tier gate, mirroring every other reading route
        # (404 hides existence when the caller's tier can't reach the
        # book). The tagged-token corpus is canon-only/free today, so no
        # content that was being served stops being served; the gate
        # simply brings these two routes in line with the rest of the
        # API (gated books now 404 for unentitled callers) so a future
        # gated-book interlinear load can't leak tagged tokens.
        verse_exists = await conn.fetchval(
            "SELECT EXISTS ("
            "  SELECT 1 FROM verses v "
            "    JOIN chapters c ON c.id = v.chapter_id "
            "    JOIN books b    ON b.id = c.book_id "
            "   WHERE v.id = $1 "
            "     AND tier_satisfies($2::content_tier, b.tier_required)"
            ")",
            verse_id,
            tier,
        )
        if not verse_exists:
            raise HTTPException(status_code=404, detail="verse not found")
        rows = await conn.fetch(
            "SELECT vw.position, vw.surface, vw.strong_number, vw.morphology, "
            "       se.lemma             AS lemma, "
            "       se.transliteration   AS transliteration, "
            "       se.short_definition  AS short_definition, "
            "       se.language::text    AS language "
            "  FROM verse_words vw "
            "  LEFT JOIN strong_entries se ON se.strong_number = vw.strong_number "
            " WHERE vw.verse_id = $1 "
            " ORDER BY vw.position ASC",
            verse_id,
        )
    return VerseWordsResponse(
        verse_id=verse_id,
        words=[
            VerseWord(
                position=r["position"],
                surface=r["surface"],
                strong_number=r["strong_number"],
                morphology=r["morphology"] if is_companion else None,
                lemma=r["lemma"] if is_companion else None,
                transliteration=r["transliteration"] if is_companion else None,
                short_definition=r["short_definition"] if is_companion else None,
                language=r["language"] if is_companion else None,
            )
            for r in rows
        ],
    )


@app.get(
    "/v1/books/{book_slug}/chapters/{chapter_number}/words",
    response_model=ChapterWordsResponse,
)
async def get_chapter_words(
    book_slug: str,
    chapter_number: int,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> ChapterWordsResponse:
    """Batched Strong's-tagged-token alignment for an entire chapter
    in one round trip (S121, Wheel 3; S168 §28 interlinear extension).

    The PWA fires this alongside the existing
    /v1/books/{slug}/chapters/{n} endpoint after a chapter loads, so
    tap-on-word becomes available without firing N parallel per-verse
    requests (which serializes badly on long chapters like Psalm 119
    against the browser's ~6-per-host concurrent-connection cap).

    The base response (position, surface, strong_number) is free-tier
    per §9 — every partner gets tap-on-word and the existing §20
    Strong's modal path. S168 extends each ``VerseWord`` with four
    optional interlinear fields (morphology, lemma, transliteration,
    short_definition, language) which are populated for Companion+
    callers and ``None`` for below-Companion / anonymous callers. The
    server-side gate makes the data-shipping decision: the §28
    InterlinearLayer is Companion-gated at the surface AND at the
    payload, so the data simply doesn't travel to clients that aren't
    entitled. The §20 tap-modal surface is unaffected (it fires its
    own free /v1/strongs/{strong_number} request and renders short
    + full definition for every tier).

    JWT pulled via ``get_current_user_optional`` (same cookie / Authorization
    decode path as the /v1/books routes); anonymous callers (no JWT,
    invalid JWT, expired JWT) resolve to ``None`` and receive the
    below-Companion payload. 404 when the book/chapter doesn't exist.
    """
    pool = get_pool()
    is_companion = _is_at_companion_tier(current_user)
    tier = user_tier(current_user)
    async with pool.acquire() as conn:
        # Book-level tier gate, mirroring every other reading route
        # (404 hides existence when the caller's tier can't reach the
        # book). The tagged-token corpus is canon-only/free today, so no
        # content that was being served stops being served; the gate
        # simply brings these two routes in line with the rest of the
        # API (gated books now 404 for unentitled callers) so a future
        # gated-book interlinear load can't leak tagged tokens.
        chapter_row = await conn.fetchrow(
            "SELECT c.id, c.chapter_number "
            "  FROM chapters c "
            "  JOIN books b ON b.id = c.book_id "
            " WHERE b.slug = $1 AND c.chapter_number = $2 "
            "   AND tier_satisfies($3::content_tier, b.tier_required)",
            book_slug,
            chapter_number,
            tier,
        )
        if chapter_row is None:
            raise HTTPException(
                status_code=404,
                detail=(
                    f"Chapter {chapter_number} not found in book "
                    f"'{book_slug}'."
                ),
            )
        verse_rows = await conn.fetch(
            "SELECT id, verse_number "
            "  FROM verses "
            " WHERE chapter_id = $1 "
            " ORDER BY verse_number ASC",
            chapter_row["id"],
        )
        # One query for all words across all verses in this chapter.
        # JOIN against verses to enforce the chapter scoping.
        #
        # S168 — LEFT JOIN to strong_entries on the verse_word's
        # strong_number. LEFT (not INNER) because:
        #   - un-tagged tokens (rare; verse_words.strong_number IS NULL)
        #     must still surface so the PWA can render the surface word
        #     without an interlinear column above it,
        #   - extras-book or apocrypha-book Strong's numbers that aren't
        #     in the lexicon load yet must still pass through with a
        #     plain surface column.
        # Sub-select selects only the fields we ship; the lexicon's
        # full ``definition`` body stays in the /v1/strongs/{n} modal
        # path, not in this chapter-mass payload (size discipline).
        word_rows = await conn.fetch(
            "SELECT vw.verse_id, vw.position, vw.surface, "
            "       vw.strong_number, vw.morphology, "
            "       se.lemma             AS lemma, "
            "       se.transliteration   AS transliteration, "
            "       se.short_definition  AS short_definition, "
            "       se.language::text    AS language "
            "  FROM verse_words vw "
            "  JOIN verses v ON v.id = vw.verse_id "
            "  LEFT JOIN strong_entries se ON se.strong_number = vw.strong_number "
            " WHERE v.chapter_id = $1 "
            " ORDER BY vw.verse_id, vw.position",
            chapter_row["id"],
        )

    # Bucket the words by verse_id so we can attach them to the
    # verse rows in one pass. Tier-gate per row: Companion+ callers
    # receive the populated interlinear fields, below-Companion callers
    # receive ``None`` for the four §28 fields + language. The base
    # tri-tuple (position, surface, strong_number) ships for every
    # caller per the §9 free-tier promise.
    words_by_verse: dict[int, list[VerseWord]] = {}
    for r in word_rows:
        words_by_verse.setdefault(r["verse_id"], []).append(
            VerseWord(
                position=r["position"],
                surface=r["surface"],
                strong_number=r["strong_number"],
                morphology=r["morphology"] if is_companion else None,
                lemma=r["lemma"] if is_companion else None,
                transliteration=r["transliteration"] if is_companion else None,
                short_definition=r["short_definition"] if is_companion else None,
                language=r["language"] if is_companion else None,
            )
        )

    response.headers["Cache-Control"] = READING_CACHE_CONTROL
    return ChapterWordsResponse(
        chapter_id=chapter_row["id"],
        verses=[
            ChapterVerseWords(
                verse_id=vr["id"],
                verse_number=vr["verse_number"],
                words=words_by_verse.get(vr["id"], []),
            )
            for vr in verse_rows
        ],
    )


@app.get("/v1/strongs/{strong_number}", response_model=StrongEntry)
async def get_strong_entry(strong_number: str) -> StrongEntry:
    """
    One Strong's lexicon entry by primary key. 4-digit zero-padded
    form: H#### for Hebrew, G#### for Greek. The PWA modal renders
    `lemma` + `transliteration` + `short_definition` + `definition`
    (and optionally pronunciation + derivation if present).

    No auth, no tier gate (free-tier feature). 404 when the
    strong_number doesn't exist in the loaded lexicon. Path-param
    casing is normalized — both 'h1' and 'H0001' resolve to 'H0001'.
    """
    # Normalize to canonical 4-digit zero-padded form.
    raw = strong_number.strip()
    if not raw or raw[0].lower() not in ("h", "g"):
        raise HTTPException(
            status_code=400,
            detail="strong_number must start with 'H' (Hebrew) or 'G' (Greek)",
        )
    prefix = raw[0].upper()
    digits = "".join(c for c in raw[1:] if c.isdigit())
    if not digits:
        raise HTTPException(
            status_code=400,
            detail="strong_number must contain numeric digits after the prefix",
        )
    canonical = f"{prefix}{int(digits):04d}"

    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT strong_number, language, lemma, transliteration, "
            "       pronunciation, short_definition, definition, derivation "
            "  FROM strong_entries "
            " WHERE strong_number = $1",
            canonical,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="strong_number not found")
    return StrongEntry(
        strong_number=row["strong_number"],
        language=row["language"],
        lemma=row["lemma"],
        transliteration=row["transliteration"],
        pronunciation=row["pronunciation"],
        short_definition=row["short_definition"],
        definition=row["definition"],
        derivation=row["derivation"],
    )


# ─────────────────────────────────────────────────────────────────────
# Consonantal-skeleton lens ("Without the vowels")
#
# Data: strong_entries.consonantal_skeleton + strong_skeleton_near, populated by
# restoration-pipeline/_build_consonantal_skeleton.py after the
# migrations/consonantal_skeleton.sql migration. Usage counts come from
# verse_words (Strong's-tagged tokens). Public data; the UI gates live use to
# partners and shows a curated free sample.
# ─────────────────────────────────────────────────────────────────────

# Hebrew points/accents — strip to a consonant skeleton (mirror of the build
# script so a caller can pass either a pointed lemma or a bare skeleton).
_HEBREW_POINTS_RE = re.compile(r"[֑-ׇ]")


def _to_skeleton(s: str) -> str:
    return _HEBREW_POINTS_RE.sub("", (s or "")).strip()


async def _skeleton_entries(conn, skeleton: str) -> List[SkeletonEntry]:
    """All Strong's entries whose consonantal_skeleton == skeleton, with usage."""
    rows = await conn.fetch(
        "SELECT se.strong_number, se.lemma, se.transliteration, "
        "       se.short_definition, se.definition, "
        "       (SELECT count(*) FROM verse_words vw "
        "          WHERE vw.strong_number = se.strong_number) AS usage_count "
        "  FROM strong_entries se "
        " WHERE se.consonantal_skeleton = $1 "
        " ORDER BY se.strong_number ASC",
        skeleton,
    )
    return [
        SkeletonEntry(
            strong_number=r["strong_number"],
            lemma=r["lemma"],
            transliteration=r["transliteration"],
            short_definition=r["short_definition"],
            definition=r["definition"],
            usage_count=int(r["usage_count"] or 0),
        )
        for r in rows
    ]


@app.get("/v1/skeleton/{skeleton}", response_model=SkeletonGroupResponse)
async def get_skeleton_group(skeleton: str) -> SkeletonGroupResponse:
    """Every Hebrew/Aramaic Strong's entry sharing this consonant skeleton.

    The path param may be a bare skeleton (נצר) or a pointed lemma — points are
    stripped server-side so the tapped word's lemma can be passed straight in.
    Public data (no auth); the client gates live use to partners.
    """
    skel = _to_skeleton(skeleton)
    if not skel:
        raise HTTPException(status_code=400, detail="empty skeleton")
    pool = get_pool()
    async with pool.acquire() as conn:
        entries = await _skeleton_entries(conn, skel)
    return SkeletonGroupResponse(skeleton=skel, entries=entries)


@app.get("/v1/skeleton/{skeleton}/near", response_model=SkeletonNearResponse)
async def get_skeleton_near(skeleton: str) -> SkeletonNearResponse:
    """Single-consonant-swap near matches (the netzer↔nazir deep dive).

    Reads the precomputed strong_skeleton_near map and returns, for each
    near-by skeleton (one consonant away), the entries under it. Public data.
    """
    skel = _to_skeleton(skeleton)
    if not skel:
        raise HTTPException(status_code=400, detail="empty skeleton")
    pool = get_pool()
    async with pool.acquire() as conn:
        near_rows = await conn.fetch(
            "SELECT near_skeleton, edit_kind FROM strong_skeleton_near "
            " WHERE skeleton = $1 ORDER BY near_skeleton ASC",
            skel,
        )
        groups: List[SkeletonNearGroup] = []
        for nr in near_rows:
            entries = await _skeleton_entries(conn, nr["near_skeleton"])
            if entries:
                groups.append(
                    SkeletonNearGroup(
                        near_skeleton=nr["near_skeleton"],
                        edit_kind=nr["edit_kind"],
                        entries=entries,
                    )
                )
    return SkeletonNearResponse(skeleton=skel, near=groups)


# ─────────────────────────────────────────────────────────────────────
# Voice Journal — private per-user journal (mirror of notes).
#
# Crisis-safety is ON-DEVICE ONLY. These endpoints never receive, compute, or
# store any crisis/mood/risk signal — body text + the user's own free labels.
# ─────────────────────────────────────────────────────────────────────


def _journal_entry_from_row(row) -> JournalEntry:
    return JournalEntry(
        id=row["id"],
        title=row["title"],
        body=row["body"],
        section_label=row["section_label"],
        created_at=row["created_at"],
        updated_at=row["updated_at"],
    )


@app.get("/v1/journal", response_model=JournalEntriesResponse)
async def list_journal(
    current_user: User = Depends(get_current_user_required),
) -> JournalEntriesResponse:
    """The partner's journal entries, newest first. Private to the caller."""
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        rows = await conn.fetch(
            "SELECT id::text AS id, title, body, section_label, "
            "       created_at, updated_at "
            "  FROM journal_entries "
            " WHERE user_id = $1::uuid AND is_archived = FALSE "
            " ORDER BY created_at DESC, id ASC",
            user_uuid,
        )
    return JournalEntriesResponse(entries=[_journal_entry_from_row(r) for r in rows])


@app.post("/v1/journal", response_model=JournalEntry, status_code=201)
async def create_journal(
    body: CreateJournalRequest,
    current_user: User = Depends(get_current_user_required),
) -> JournalEntry:
    """Save a journal entry (typed or on-device-dictated text)."""
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "INSERT INTO journal_entries (user_id, title, body, section_label) "
            "VALUES ($1::uuid, $2, $3, $4) "
            "RETURNING id::text AS id, title, body, section_label, "
            "          created_at, updated_at",
            user_uuid, body.title, body.body, body.section_label,
        )
    return _journal_entry_from_row(row)


@app.patch("/v1/journal/{entry_id}", response_model=JournalEntry)
async def update_journal(
    entry_id: str,
    body: UpdateJournalRequest,
    current_user: User = Depends(get_current_user_required),
) -> JournalEntry:
    """Edit a journal entry. Only the owner's row is touched."""
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "UPDATE journal_entries SET "
            "  body = COALESCE($3, body), "
            "  title = COALESCE($4, title), "
            "  section_label = COALESCE($5, section_label), "
            "  updated_at = now() "
            " WHERE id = $1::uuid AND user_id = $2::uuid AND is_archived = FALSE "
            "RETURNING id::text AS id, title, body, section_label, "
            "          created_at, updated_at",
            entry_id, user_uuid, body.body, body.title, body.section_label,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="Journal entry not found.")
    return _journal_entry_from_row(row)


@app.delete("/v1/journal/{entry_id}", status_code=204)
async def delete_journal(
    entry_id: str,
    current_user: User = Depends(get_current_user_required),
) -> Response:
    """Delete (soft-archive) a journal entry the caller owns."""
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        result = await conn.execute(
            "UPDATE journal_entries SET is_archived = TRUE, updated_at = now() "
            " WHERE id = $1::uuid AND user_id = $2::uuid",
            entry_id, user_uuid,
        )
    if result.endswith(" 0"):
        raise HTTPException(status_code=404, detail="Journal entry not found.")
    return Response(status_code=204)


@app.get("/v1/devotional", response_model=DevotionalResponse)
async def get_devotional(
    topic: Optional[str] = Query(default=None, description="Topic/emotion tag."),
) -> DevotionalResponse:
    """Curated Scripture + reflection(s) surfaced after a journal entry.

    Public read-only library. Filter by ?topic= (gratitude/fear/grief/hope/…);
    omit to get the active set. Seed rows are placeholders for Yoshi.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        if topic:
            rows = await conn.fetch(
                "SELECT id::text AS id, topic, title, passage_ref, passage_text, "
                "       reflection FROM devotional_library "
                " WHERE is_active AND topic = $1 ORDER BY created_at ASC",
                topic,
            )
        else:
            rows = await conn.fetch(
                "SELECT id::text AS id, topic, title, passage_ref, passage_text, "
                "       reflection FROM devotional_library "
                " WHERE is_active ORDER BY topic ASC, created_at ASC"
            )
    return DevotionalResponse(
        reflections=[DevotionalReflection(**dict(r)) for r in rows]
    )


# ─────────────────────────────────────────────────────────────────────
# Reading Plans — curated multi-day plans + account-synced progress.
# ─────────────────────────────────────────────────────────────────────


def _plan_days_from_rows(rows) -> List[PlanDay]:
    days: List[PlanDay] = []
    for r in rows:
        raw = r["passages"]
        items = json.loads(raw) if isinstance(raw, str) else (raw or [])
        days.append(
            PlanDay(
                day_number=r["day_number"],
                passages=[PlanPassage(**p) for p in items],
            )
        )
    return days


@app.get("/v1/plans", response_model=ReadingPlansResponse)
async def list_plans() -> ReadingPlansResponse:
    """Curated reading plans. Public read-only."""
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            "SELECT id::text AS id, slug, title, description, day_count "
            "  FROM reading_plans WHERE is_active "
            " ORDER BY sort_order ASC, title ASC"
        )
    return ReadingPlansResponse(plans=[ReadingPlanSummary(**dict(r)) for r in rows])


@app.get("/v1/plans/{slug}", response_model=ReadingPlanDetail)
async def get_plan(slug: str) -> ReadingPlanDetail:
    """One plan with its day-by-day passages. Public read-only."""
    pool = get_pool()
    async with pool.acquire() as conn:
        plan = await conn.fetchrow(
            "SELECT id::text AS id, slug, title, description, day_count "
            "  FROM reading_plans WHERE slug = $1 AND is_active",
            slug,
        )
        if plan is None:
            raise HTTPException(status_code=404, detail="Plan not found.")
        day_rows = await conn.fetch(
            "SELECT day_number, passages FROM reading_plan_days "
            " WHERE plan_id = $1::uuid ORDER BY day_number ASC",
            plan["id"],
        )
    return ReadingPlanDetail(**dict(plan), days=_plan_days_from_rows(day_rows))


@app.get("/v1/plans/progress", response_model=PlanProgressResponse)
async def get_plan_progress(
    current_user: User = Depends(get_current_user_required),
) -> PlanProgressResponse:
    """The caller's progress across all plans they've started."""
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        rows = await conn.fetch(
            "SELECT p.plan_id::text AS plan_id, rp.slug AS plan_slug, "
            "       p.current_day, p.completed_days "
            "  FROM reading_plan_progress p "
            "  JOIN reading_plans rp ON rp.id = p.plan_id "
            " WHERE p.user_id = $1::uuid",
            user_uuid,
        )
    return PlanProgressResponse(
        progress=[
            PlanProgress(
                plan_id=r["plan_id"],
                plan_slug=r["plan_slug"],
                current_day=r["current_day"],
                completed_days=list(r["completed_days"]),
            )
            for r in rows
        ]
    )


@app.put("/v1/plans/{slug}/progress", response_model=PlanProgress)
async def update_plan_progress(
    slug: str,
    body: UpdatePlanProgressRequest,
    current_user: User = Depends(get_current_user_required),
) -> PlanProgress:
    """Start a plan and/or mark a day complete / move current_day. Synced."""
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)
        plan = await conn.fetchrow(
            "SELECT id::text AS id FROM reading_plans WHERE slug = $1 AND is_active",
            slug,
        )
        if plan is None:
            raise HTTPException(status_code=404, detail="Plan not found.")
        plan_id = plan["id"]

        if body.start:
            row = await conn.fetchrow(
                "INSERT INTO reading_plan_progress (user_id, plan_id, current_day, completed_days) "
                "VALUES ($1::uuid, $2::uuid, 1, '{}') "
                "ON CONFLICT (user_id, plan_id) DO UPDATE SET "
                "  current_day = 1, completed_days = '{}', updated_at = now() "
                "RETURNING current_day, completed_days",
                user_uuid, plan_id,
            )
        else:
            # Ensure a row exists, then apply the day-complete / current_day update.
            await conn.execute(
                "INSERT INTO reading_plan_progress (user_id, plan_id) "
                "VALUES ($1::uuid, $2::uuid) ON CONFLICT DO NOTHING",
                user_uuid, plan_id,
            )
            row = await conn.fetchrow(
                "UPDATE reading_plan_progress SET "
                "  completed_days = CASE WHEN $3::int IS NULL THEN completed_days "
                "    WHEN $3 = ANY(completed_days) THEN completed_days "
                "    ELSE array_append(completed_days, $3) END, "
                "  current_day = COALESCE($4, current_day), "
                "  updated_at = now() "
                " WHERE user_id = $1::uuid AND plan_id = $2::uuid "
                "RETURNING current_day, completed_days",
                user_uuid, plan_id, body.completed_day, body.current_day,
            )
    return PlanProgress(
        plan_id=plan_id,
        plan_slug=slug,
        current_day=row["current_day"],
        completed_days=list(row["completed_days"]),
    )


# ─────────────────────────────────────────────────────────────────────
# S171 Track 3 — server-rendered Strong's deep-link page (§30 V1.1).
#
# Locked at DESIGN_LANGUAGE.md §30 *Deep-link routes (V1.1 web-side
# add)*. The watermark footer on every §30 share-card carries the URL
# `bible.remnantofpromise.org/strongs/{N}` — a paste-and-go discovery
# vector. This route is the partner-facing destination when that URL
# is opened or pasted into a messaging app: a minimal server-rendered
# HTML page carrying the Strong's entry content + full Open Graph
# metadata so link-preview crawlers (iMessage / WhatsApp / Slack /
# Telegram / Discord) render the page automatically without executing
# JavaScript.
#
# HOSTING NOTE (carried as S171 Yoshi-question): the spec'd public
# URL `bible.remnantofpromise.org/strongs/{N}` resolves to the PWA
# Static Site, not the API. This route is the SOURCE OF TRUTH and
# lives on `api.bible.remnantofpromise.org/strongs/{N}`. The bare-
# domain → api-subdomain bridging is a hosting wheel — three options
# (302 redirect, Render Static Site rewrite-to-cross-origin, or a
# new tiny web service that proxies `/strongs/*`). Decided at S171
# close per Yoshi-question 3.
#
# OG image: points at the §30 V1 share-card auto-generated for this
# Strong's number. Until a server-side share-card generator ships
# (V1.2+), the og:image references the v4 brand-mark asset on the
# PWA's static path so messaging-app previews carry the brand
# regardless. Once a server-side card endpoint exists, swap the
# og:image to `/strongs/{N}/og-image.png` which renders the canonical
# 1080×1920 card for that entry.
# ─────────────────────────────────────────────────────────────────────


def _strongs_html_page(entry: StrongEntry) -> str:
    """Build the deep-link HTML page for a Strong's entry. Pure helper
    — node-testable equivalent (Python-side; sanity covers the OG
    field assembly + the canonical URL). All content escaped via
    str.replace for the small attack surface (no template engine
    dependency; this page is content-only and renders no user input
    beyond the path param which is already validated upstream).
    """
    n = entry.strong_number
    lemma = (entry.lemma or "").replace("<", "&lt;").replace(">", "&gt;")
    translit = (entry.transliteration or "").replace("<", "&lt;").replace(">", "&gt;")
    gloss = (entry.short_definition or "").replace("<", "&lt;").replace(">", "&gt;")
    definition = (entry.definition or "").replace("<", "&lt;").replace(">", "&gt;")
    derivation = (entry.derivation or "").replace("<", "&lt;").replace(">", "&gt;")
    language_label = {"hebrew": "Hebrew", "greek": "Greek", "aramaic": "Aramaic"}.get(
        entry.language or "", "Strong's"
    )
    # Canonical public URL — the watermark-footer CTA target. Matches
    # DESIGN_LANGUAGE.md §30 *URL format*.
    canonical = f"https://bible.remnantofpromise.org/strongs/{n}"
    # OG title — "{lemma} ({transliteration}) — Strong's {N}".
    og_title_parts = []
    if lemma:
        og_title_parts.append(lemma)
    if translit:
        og_title_parts.append(f"({translit})")
    og_title_parts.append(f"— Strong's {n}")
    og_title = " ".join(og_title_parts)
    og_description = gloss or definition[:200] if definition else f"Strong's {n}"
    # Brand-mark fallback OG image — content-hashed bundle path on the
    # PWA. Once a per-entry server-side share-card generator ships,
    # swap this to `/strongs/{n}/og-image.png`.
    og_image = "https://bible.remnantofpromise.org/brand-mark-share.png"
    return (
        "<!doctype html>\n"
        '<html lang="en">\n'
        "<head>\n"
        '<meta charset="utf-8">\n'
        '<meta name="viewport" content="width=device-width, initial-scale=1">\n'
        f"<title>{og_title} | Remnant of Promise</title>\n"
        f'<link rel="canonical" href="{canonical}">\n'
        # Open Graph
        '<meta property="og:type" content="article">\n'
        '<meta property="og:site_name" content="Remnant of Promise Official Study Bible">\n'
        f'<meta property="og:url" content="{canonical}">\n'
        f'<meta property="og:title" content="{og_title}">\n'
        f'<meta property="og:description" content="{og_description}">\n'
        f'<meta property="og:image" content="{og_image}">\n'
        '<meta property="og:image:width" content="1080">\n'
        '<meta property="og:image:height" content="1920">\n'
        # Twitter Card — same content, separate meta lookups.
        '<meta name="twitter:card" content="summary_large_image">\n'
        f'<meta name="twitter:title" content="{og_title}">\n'
        f'<meta name="twitter:description" content="{og_description}">\n'
        f'<meta name="twitter:image" content="{og_image}">\n'
        "<style>\n"
        "body{font-family:'Lora','Iowan Old Style','Palatino Linotype',Palatino,Georgia,serif;background:#0a0a0a;color:#e6e6e6;max-width:720px;margin:0 auto;padding:2rem 1.5rem;line-height:1.55;}\n"
        "header{border-bottom:1px solid rgba(255,255,255,0.1);padding-bottom:1rem;margin-bottom:1.5rem;}\n"
        ".badge{display:inline-block;border:1px solid rgba(255,255,255,0.2);padding:0.2rem 0.6rem;border-radius:4px;font-size:0.85rem;color:#1A6FE5;font-weight:600;}\n"
        ".lang{margin-left:0.6rem;font-size:0.75rem;text-transform:uppercase;letter-spacing:0.05em;color:rgba(255,255,255,0.6);}\n"
        ".lemma{font-size:2rem;font-weight:600;margin:1rem 0 0;}\n"
        ".translit{font-style:italic;color:rgba(255,255,255,0.6);margin-left:0.75rem;}\n"
        ".gloss{margin-top:0.75rem;}\n"
        ".gloss-label{font-weight:600;}\n"
        ".derivation{font-size:0.9rem;color:rgba(255,255,255,0.65);margin-top:1rem;}\n"
        ".cta{display:block;text-align:center;margin-top:2rem;padding:0.75rem;border:1px solid #1A6FE5;border-radius:4px;color:#1A6FE5;text-decoration:none;font-weight:500;}\n"
        "footer{margin-top:2rem;padding-top:1rem;border-top:1px solid rgba(255,255,255,0.1);font-size:0.8rem;color:rgba(255,255,255,0.5);text-align:center;}\n"
        "</style>\n"
        "</head>\n"
        "<body>\n"
        "<header>\n"
        f'<span class="badge">{n}</span><span class="lang">{language_label}</span>\n'
        f'<h1 class="lemma">{lemma}<span class="translit">{translit}</span></h1>\n'
        "</header>\n"
        "<main>\n"
        + (f'<p class="gloss"><span class="gloss-label">Gloss:</span> {gloss}</p>\n' if gloss else "")
        + (f"<p>{definition}</p>\n" if definition else "")
        + (f'<p class="derivation"><span class="gloss-label">Derivation:</span> {derivation}</p>\n' if derivation else "")
        + f'<a class="cta" href="https://bible.remnantofpromise.org/?strong={n}">Open in The Remnant of Promise Official Study Bible →</a>\n'
        "</main>\n"
        '<footer>Remnant of Promise · Official Study Bible · <a style="color:#1A6FE5;text-decoration:none;" href="https://bible.remnantofpromise.org">bible.remnantofpromise.org</a></footer>\n'
        "</body>\n"
        "</html>\n"
    )


def _normalize_strong_number(raw: str) -> str:
    """Mirror /v1/strongs/{n} normalization. Raises HTTPException on
    invalid input — same error shape, callable from both the JSON and
    HTML routes."""
    raw = raw.strip()
    if not raw or raw[0].lower() not in ("h", "g"):
        raise HTTPException(
            status_code=400,
            detail="strong_number must start with 'H' (Hebrew) or 'G' (Greek)",
        )
    prefix = raw[0].upper()
    digits = "".join(c for c in raw[1:] if c.isdigit())
    if not digits:
        raise HTTPException(
            status_code=400,
            detail="strong_number must contain numeric digits after the prefix",
        )
    return f"{prefix}{int(digits):04d}"


@app.get("/strongs/{strong_number}", response_class=HTMLResponse)
async def get_strong_entry_html(strong_number: str) -> HTMLResponse:
    """S171 §30 V1.1 — server-rendered deep-link page for a Strong's
    entry. Built so messaging-app link-preview crawlers (iMessage /
    WhatsApp / Slack / Telegram / Discord) render the OG metadata
    without executing JavaScript when a partner pastes the URL from
    a share-card watermark footer.

    Renders a minimal content-only HTML page; the heavier in-app
    experience (concordance rail, lexicon-sheet, etc.) opens via
    the "Open in The Remnant of Promise Official Study Bible →"
    CTA which jumps the partner into the PWA.

    Tier: public (matches §9's free-tier Strong's lookup contract).
    404 on unknown number, 400 on malformed.
    """
    canonical = _normalize_strong_number(strong_number)
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT strong_number, language, lemma, transliteration, "
            "       pronunciation, short_definition, definition, derivation "
            "  FROM strong_entries "
            " WHERE strong_number = $1",
            canonical,
        )
    if row is None:
        # 404 with a minimal HTML page so the link-preview crawler
        # still gets a clean response (no raw JSON or stack trace
        # surfacing in a partner's messaging app preview).
        return HTMLResponse(
            content=(
                "<!doctype html><html><head><title>Strong's entry not found</title>"
                '<meta property="og:title" content="Strong\'s entry not found">'
                '<meta property="og:description" content="The requested Strong\'s number does not exist in the lexicon.">'
                "</head><body><h1>Strong's entry not found</h1>"
                f"<p>No lexicon entry for <code>{canonical}</code>.</p></body></html>"
            ),
            status_code=404,
        )
    entry = StrongEntry(
        strong_number=row["strong_number"],
        language=row["language"],
        lemma=row["lemma"],
        transliteration=row["transliteration"],
        pronunciation=row["pronunciation"],
        short_definition=row["short_definition"],
        definition=row["definition"],
        derivation=row["derivation"],
    )
    return HTMLResponse(
        content=_strongs_html_page(entry),
        # Cache for an hour at the edge — Strong's entries are
        # effectively immutable; one-hour TTL is cheap insurance
        # against a hot-cached crawler hammering the DB.
        headers={"Cache-Control": "public, max-age=3600"},
    )


@app.get(
    "/v1/strongs/{strong_number}/occurrences",
    response_model=StrongOccurrencesResponse,
)
async def get_strong_occurrences(
    strong_number: str,
    limit: int = 25,
    offset: int = 0,
) -> StrongOccurrencesResponse:
    """Concordance — every verse where a given Strong's number appears
    (S121 Wheel 3 concordance addition).

    Paginates because common words have thousands of occurrences
    (H0430 Elohim ~2600; H3068 Yahuah ~6800). PWA renders the first
    page in the StrongsLookup modal under an "Other verses using this
    word" section with a "Show more" affordance.

    The position field comes back so the PWA can highlight the
    matched word in the rendered snippet — partner sees in context
    where the word lands, not just a flat verse list.

    Tap-to-navigate is wired client-side: tapping a row sets the
    book/chapter/verse and the S116 reading-position save fires
    automatically.

    No auth, no tier gate (free-tier feature per §9). limit capped at
    100 server-side to keep payloads sane.
    """
    # Normalize the strong_number same way the entry endpoint does.
    raw = strong_number.strip()
    if not raw or raw[0].lower() not in ("h", "g"):
        raise HTTPException(
            status_code=400,
            detail="strong_number must start with 'H' (Hebrew) or 'G' (Greek)",
        )
    prefix = raw[0].upper()
    digits = "".join(c for c in raw[1:] if c.isdigit())
    if not digits:
        raise HTTPException(
            status_code=400,
            detail="strong_number must contain numeric digits after the prefix",
        )
    canonical = f"{prefix}{int(digits):04d}"

    if limit < 1:
        limit = 25
    if limit > 100:
        limit = 100
    if offset < 0:
        offset = 0

    pool = get_pool()
    async with pool.acquire() as conn:
        total = await conn.fetchval(
            "SELECT count(*)::int FROM verse_words WHERE strong_number = $1",
            canonical,
        )
        rows = await conn.fetch(
            "SELECT vw.verse_id, vw.position, "
            "       v.verse_number, v.text AS verse_text, "
            "       c.chapter_number, "
            "       b.slug AS book_slug, b.title AS book_title, "
            "       b.canonical_order "
            "  FROM verse_words vw "
            "  JOIN verses v ON v.id = vw.verse_id "
            "  JOIN chapters c ON c.id = v.chapter_id "
            "  JOIN books b ON b.id = c.book_id "
            " WHERE vw.strong_number = $1 "
            " ORDER BY b.canonical_order ASC, c.chapter_number ASC, "
            "          v.verse_number ASC, vw.position ASC "
            " LIMIT $2 OFFSET $3",
            canonical,
            limit,
            offset,
        )
    return StrongOccurrencesResponse(
        strong_number=canonical,
        total_count=total or 0,
        occurrences=[
            StrongOccurrence(
                verse_id=r["verse_id"],
                book_slug=r["book_slug"],
                book_title=r["book_title"],
                chapter_number=r["chapter_number"],
                verse_number=r["verse_number"],
                verse_text=r["verse_text"],
                position=r["position"],
            )
            for r in rows
        ],
    )


# ----- Phase 9.3 lexicon (S163) -------------------------------------------
#
# §26-spec'd combined endpoint: per S163 Q3 decision (locked at session open),
# a single GET /v1/lexicon/{strong_number} returns { entries, callout,
# available_sources }. The two-endpoint pattern named in the S158 skeleton
# (separate body + callout routes) is superseded by this combined shape;
# single round-trip from the PWA per word-tap, cleaner client code in
# LexiconSheet.
#
# Tier gate: Companion+ (content_tier 'complete_study' or higher). Server-
# side check per S163 Q4 decision — direct API calls can't bypass the
# gate. PWA still gates render for UX.
#
# Kill-switch: settings.lexicon_enabled. False → 404. Flipped to True
# from Render dashboard after the staging-walk verification.
#
# Cache-Control: public, max-age=86400 (1 day). Lexicons are public-domain
# reference data; framework callouts are author-reviewed and change
# rarely. Aggressive caching reduces DB load.

LEXICON_DISCLAIMERS: dict[str, str] = {
    "bdb": (
        "The lexicon below is BDB (Brown-Driver-Briggs, 1906) — a 19th-"
        "century Christian-era Hebrew scholarship work, preserved as data "
        "so you can see how the inherited tradition handled the word. The "
        "framework's reading lives in the verse commentary and in the "
        "framework callouts below; where the lexicon and the framework "
        "diverge, the framework is the standard."
    ),
    "lsj": (
        "The lexicon below is LSJ (Liddell-Scott-Jones, 1940 — Tyndale-"
        "edited from the 9th edition), with Abbott-Smith's Manual Greek "
        "Lexicon of the New Testament (1922) filling in NT-only "
        "vocabulary where LSJ has no entry. Preserved as data so you can "
        "see how the inherited 19th–20th-century classical-philological "
        "and NT-Greek scholarship handled the word. The framework's "
        "reading lives in the verse commentary and in the framework "
        "callouts below; where the lexicon and the framework diverge, "
        "the framework is the standard."
    ),
    "gesenius": (
        "The lexicon below is Gesenius (Tregelles 1846 English), a 19th-"
        "century Christian-era Hebrew scholarship work, preserved as "
        "data so you can see how the inherited tradition handled the "
        "word. The framework's reading lives in the verse commentary "
        "and in the framework callouts below; where the lexicon and "
        "the framework diverge, the framework is the standard."
    ),
}


# Companion tier per §26 = content_tier 'complete_study' or higher. The
# tier_satisfies() lattice in the schema does the rank check; we just
# pass 'complete_study' as the required tier and let SQL resolve.
LEXICON_REQUIRED_TIER = "complete_study"


def _normalize_strong_number(raw: str) -> str:
    """Same normalization the §20 Strong's endpoint uses. Returns the
    canonical 4-digit zero-padded form (H#### or G####)."""
    raw = raw.strip()
    if not raw or raw[0].lower() not in ("h", "g"):
        raise HTTPException(
            status_code=400,
            detail="strong_number must start with 'H' (Hebrew) or 'G' (Greek)",
        )
    prefix = raw[0].upper()
    digits = "".join(c for c in raw[1:] if c.isdigit())
    if not digits:
        raise HTTPException(
            status_code=400,
            detail="strong_number must contain numeric digits after the prefix",
        )
    return f"{prefix}{int(digits):04d}"


@app.get(
    "/v1/lexicon/{strong_number}",
    response_model=LexiconResponse,
)
async def get_lexicon_entry(
    strong_number: str,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> LexiconResponse:
    """Combined lexicon endpoint per §26 + S163 Q3 decision.

    Returns every `lexicon_entries` row for the strong_number (BDB for
    Hebrew/Aramaic, LSJ for Greek; Gesenius reserved for v1.1+) plus
    the framework callout (if one exists) and the available_sources
    list (for the §26 default-source-flip behavior).

    Behavior matrix:
      - settings.lexicon_enabled = False → 404 (kill-switch; route hides
        existence rather than 503-revealing that the feature exists but
        is disabled).
      - non-Companion tier → 403 with { tier_required: 'complete_study',
        feature: 'lexicon' }. PWA renders the tier-locked card per the
        existing §20 stub pattern.
      - no entries AND no callout for the strong_number → 404.
      - some entries / some callout → 200 with the combined payload.

    Cache-Control: 1 day. The data is curated public-domain (BDB 1906,
    LSJ 1940, Abbott-Smith 1922) and framework callouts are author-
    reviewed; aggressive caching is safe.
    """
    # 1. Kill-switch
    if not settings.lexicon_enabled:
        raise HTTPException(status_code=404, detail="lexicon endpoint not enabled")

    # 2. Strong's-number normalization
    canonical = _normalize_strong_number(strong_number)

    # 3. Tier gate (server-side per S163 Q4)
    tier = user_tier(current_user)
    pool = get_pool()
    async with pool.acquire() as conn:
        tier_ok = await conn.fetchval(
            "SELECT tier_satisfies($1::content_tier, $2::content_tier)",
            tier,
            LEXICON_REQUIRED_TIER,
        )
        if not tier_ok:
            raise HTTPException(
                status_code=403,
                detail={
                    "tier_required": LEXICON_REQUIRED_TIER,
                    "feature": "lexicon",
                },
            )

        # 4. Fetch entries
        entry_rows = await conn.fetch(
            "SELECT source, strong_number, lemma, transliteration, "
            "       pronunciation, part_of_speech, short_definition, "
            "       body_html, derivation, citations_count "
            "  FROM lexicon_entries "
            " WHERE strong_number = $1 "
            " ORDER BY CASE source "
            "            WHEN 'bdb'      THEN 0 "
            "            WHEN 'lsj'      THEN 1 "
            "            WHEN 'gesenius' THEN 2 "
            "          END",
            canonical,
        )

        # 5. Fetch callout (single row by FK; null when absent)
        callout_row = await conn.fetchrow(
            "SELECT strong_number, term_display, gloss_error_summary, "
            "       body_md, red_lines_cited, last_reviewed_at "
            "  FROM lexicon_callouts "
            " WHERE strong_number = $1",
            canonical,
        )

    # 6. Both empty → 404 (hide existence per the standing reader-route pattern)
    if not entry_rows and callout_row is None:
        raise HTTPException(status_code=404, detail="lexicon entry not found")

    # 7. Compose response
    entries = [
        LexiconEntry(
            source=row["source"],
            strong_number=row["strong_number"],
            lemma=row["lemma"],
            transliteration=row["transliteration"],
            pronunciation=row["pronunciation"],
            part_of_speech=row["part_of_speech"],
            short_definition=row["short_definition"],
            body_html=row["body_html"],
            derivation=row["derivation"],
            citations_count=row["citations_count"],
            disclaimer=LEXICON_DISCLAIMERS.get(row["source"], LEXICON_DISCLAIMERS["bdb"]),
        )
        for row in entry_rows
    ]

    callout = None
    if callout_row is not None:
        callout = LexiconCallout(
            strong_number=callout_row["strong_number"],
            term_display=callout_row["term_display"],
            gloss_error_summary=callout_row["gloss_error_summary"],
            body_md=callout_row["body_md"],
            red_lines_cited=list(callout_row["red_lines_cited"] or []),
            last_reviewed_at=callout_row["last_reviewed_at"],
        )

    response.headers["Cache-Control"] = "public, max-age=86400"

    return LexiconResponse(
        strong_number=canonical,
        entries=entries,
        callout=callout,
        available_sources=[row["source"] for row in entry_rows],
    )


# ----- Tool annotations (Session 196 — framework annotation-layer overlay) ----
#
# GET /v1/tool-annotations/{tool}/{entry_key} returns the single LIVE framework
# correction for a public-domain tool entry, plus a sibling-count badge. This is
# the generalized overlay (APP_BUILDOUT_ROADMAP "annotation layer", locked S194):
# every PD tool ships as an untouched base and the correction is rendered beside
# it at point of use. BDB/LSJ word-callouts are served by /v1/lexicon (they live
# in lexicon_callouts); this endpoint serves Vincent's, Nave's, Maps, TSK,
# Nikkudot, and the interlinear gloss-cell notes.
#
# Tier gate: Companion+ (content_tier 'complete_study' or higher), same as the
# lexicon surface — the annotation layer is a Companion-tier study feature. Kill-
# switch shares settings.lexicon_enabled (the whole §26 study-tooling surface
# flips together). Cache-Control: 1 day (author-reviewed, changes rarely).

TOOL_ANNOTATION_REQUIRED_TIER = "complete_study"
VALID_ANNOTATION_TOOLS = {
    "bdb", "lsj", "strongs", "vincents", "interlinear",
    "nikkudot", "naves", "maps", "tsk",
}


@app.get(
    "/v1/tool-annotations/{tool}/{entry_key:path}",
    response_model=ToolAnnotationsResponse,
)
async def get_tool_annotation(
    tool: str,
    entry_key: str,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> ToolAnnotationsResponse:
    """Combined annotation-layer endpoint per the S194 annotation-layer lock.

    Behavior matrix mirrors /v1/lexicon:
      - settings.lexicon_enabled = False → 404 (shared kill-switch).
      - unknown tool → 404.
      - non-Companion tier → 403 with { tier_required, feature: 'tool_annotation' }.
      - no LIVE annotation for (tool, entry_key) → 200 with annotation=null
        (the surface simply renders the untouched PD base with no overlay band).
        404 is reserved for kill-switch / unknown-tool; a missing overlay is a
        normal 200/null so the client doesn't error-branch on the common case.

    entry_key is a {path} param so verse+lemma keys and verse-pair keys that
    contain characters like ':' and '.' pass through intact.
    """
    if not settings.lexicon_enabled:
        raise HTTPException(status_code=404, detail="tool-annotations endpoint not enabled")

    tool_norm = tool.strip().lower()
    if tool_norm not in VALID_ANNOTATION_TOOLS:
        raise HTTPException(status_code=404, detail="unknown tool")

    tier = user_tier(current_user)
    pool = get_pool()
    async with pool.acquire() as conn:
        tier_ok = await conn.fetchval(
            "SELECT tier_satisfies($1::content_tier, $2::content_tier)",
            tier,
            TOOL_ANNOTATION_REQUIRED_TIER,
        )
        if not tier_ok:
            raise HTTPException(
                status_code=403,
                detail={
                    "tier_required": TOOL_ANNOTATION_REQUIRED_TIER,
                    "feature": "tool_annotation",
                },
            )

        row = await conn.fetchrow(
            "SELECT tool, entry_key, term_display, conflict_summary, "
            "       annotation_md, tier_required::text AS tier_required, "
            "       red_lines_cited, is_punch_list_only, last_reviewed_at "
            "  FROM tool_annotations "
            " WHERE tool = $1 AND entry_key = $2 "
            "   AND is_punch_list_only = FALSE",
            tool_norm,
            entry_key,
        )

        live_count = await conn.fetchval(
            "SELECT COUNT(*) FROM tool_annotations "
            " WHERE tool = $1 AND is_punch_list_only = FALSE",
            tool_norm,
        )

    annotation = None
    if row is not None:
        annotation = ToolAnnotation(
            tool=row["tool"],
            entry_key=row["entry_key"],
            term_display=row["term_display"],
            conflict_summary=row["conflict_summary"],
            annotation_md=row["annotation_md"],
            tier_required=row["tier_required"],
            red_lines_cited=list(row["red_lines_cited"] or []),
            is_punch_list_only=row["is_punch_list_only"],
            last_reviewed_at=row["last_reviewed_at"],
        )

    response.headers["Cache-Control"] = "public, max-age=86400"
    return ToolAnnotationsResponse(
        tool=tool_norm,
        entry_key=entry_key,
        annotation=annotation,
        tool_live_count=int(live_count or 0),
    )


# ----- Session 197 — public-domain tool surfaces --------------------------
#
# Five PD reference tools come off "coming soon" this session. Each ships as an
# untouched annotated-foil base table (loaded by the session197_*_load.sql
# migrations); the framework correction rides in tool_annotations (S196). All
# five are Companion-gated (complete_study+) and share the lexicon_enabled
# kill-switch — the whole §26 study-tooling surface flips together. The gate +
# kill-switch pattern mirrors /v1/lexicon exactly.

TOOLING_REQUIRED_TIER = "complete_study"


async def _require_tooling_tier(conn, current_user: Optional[User]) -> None:
    """Shared Companion-tier gate for the S197 tool surfaces. Raises 403 with the
    {tier_required, feature} shape the PWA tier-locked cards already parse."""
    tier = user_tier(current_user)
    tier_ok = await conn.fetchval(
        "SELECT tier_satisfies($1::content_tier, $2::content_tier)",
        tier,
        TOOLING_REQUIRED_TIER,
    )
    if not tier_ok:
        raise HTTPException(
            status_code=403,
            detail={"tier_required": TOOLING_REQUIRED_TIER, "feature": "study_tooling"},
        )


@app.get(
    "/v1/vincents/{book_slug}/{chapter}/{verse}",
    response_model=VincentVerseResponse,
)
async def get_vincents_verse(
    book_slug: str,
    chapter: int,
    verse: int,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> VincentVerseResponse:
    """Vincent's Word Studies expositions for one verse (§26 word-study panel).

    Companion-gated, kill-switch shared with /v1/lexicon. Returns every head-
    phrase exposition Vincent's carries for the verse, in source order; empty
    list for verses Vincent's doesn't cover (OT, or NT verses without an entry).
    The PWA pairs this with the verse-level framework band fetched from
    /v1/tool-annotations/vincents/<book>.<ch>.<v>.
    """
    if not settings.lexicon_enabled:
        raise HTTPException(status_code=404, detail="study-tooling endpoint not enabled")
    pool = get_pool()
    async with pool.acquire() as conn:
        await _require_tooling_tier(conn, current_user)
        rows = await conn.fetch(
            "SELECT entry_key, book_slug, chapter, verse, verse_key, headword, "
            "       body, source_vol "
            "  FROM vincents_entries "
            " WHERE book_slug = $1 AND chapter = $2 AND verse = $3 "
            " ORDER BY id ASC",
            book_slug,
            chapter,
            verse,
        )
    response.headers["Cache-Control"] = "public, max-age=86400"
    return VincentVerseResponse(
        book_slug=book_slug,
        chapter=chapter,
        verse=verse,
        verse_key=f"{book_slug}.{chapter}.{verse}",
        entries=[
            VincentEntry(
                entry_key=r["entry_key"],
                book_slug=r["book_slug"],
                chapter=r["chapter"],
                verse=r["verse"],
                verse_key=r["verse_key"],
                headword=r["headword"],
                body=r["body"],
                source_vol=r["source_vol"],
            )
            for r in rows
        ],
    )


@app.get("/v1/naves", response_model=NavesSearchResponse)
async def search_naves(
    response: Response,
    q: str = Query(..., min_length=2, description="Topic-heading search term."),
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> NavesSearchResponse:
    """Search Nave's topical headings (§20 subordinate topical foil).

    Companion-gated, kill-switch shared. Case-insensitive substring match on the
    published subject heading, subject order, capped at 50. The taxonomy itself
    is the inherited reading; the framework corrections on the gentiles/church/
    law/israel headings ride via /v1/tool-annotations/naves/{slug}.
    """
    if not settings.lexicon_enabled:
        raise HTTPException(status_code=404, detail="study-tooling endpoint not enabled")
    pool = get_pool()
    async with pool.acquire() as conn:
        await _require_tooling_tier(conn, current_user)
        rows = await conn.fetch(
            "SELECT topic_slug, section, subject "
            "  FROM naves_topical "
            " WHERE subject ILIKE '%' || $1 || '%' "
            " ORDER BY lower(subject) ASC "
            " LIMIT 50",
            q,
        )
    response.headers["Cache-Control"] = "public, max-age=86400"
    return NavesSearchResponse(
        query=q,
        topics=[
            NavesTopicSummary(
                topic_slug=r["topic_slug"], section=r["section"], subject=r["subject"]
            )
            for r in rows
        ],
    )


@app.get("/v1/naves/{topic_slug}", response_model=NavesTopic)
async def get_naves_topic(
    topic_slug: str,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> NavesTopic:
    """One Nave's topical heading with its full entry body. 404 when not found."""
    if not settings.lexicon_enabled:
        raise HTTPException(status_code=404, detail="study-tooling endpoint not enabled")
    pool = get_pool()
    async with pool.acquire() as conn:
        await _require_tooling_tier(conn, current_user)
        row = await conn.fetchrow(
            "SELECT topic_slug, section, subject, entry "
            "  FROM naves_topical WHERE topic_slug = $1",
            topic_slug,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="naves topic not found")
    response.headers["Cache-Control"] = "public, max-age=86400"
    return NavesTopic(
        topic_slug=row["topic_slug"],
        section=row["section"],
        subject=row["subject"],
        entry=row["entry"],
    )


@app.get(
    "/v1/tsk/{book_slug}/{chapter}/{verse}",
    response_model=TskVerseResponse,
)
async def get_tsk_verse(
    book_slug: str,
    chapter: int,
    verse: int,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> TskVerseResponse:
    """TSK cross-reference chains anchored on a source verse (standalone foil).

    Companion-gated, kill-switch shared. Vote-ranked, capped at 200. Subordinate,
    opt-in by design (the curated threads are the page; this is the inherited
    grammar shown as a labeled foil). The four distortion-class notes ride via
    /v1/tool-annotations/tsk/sweep:<class> — gate passed S196.
    """
    if not settings.lexicon_enabled:
        raise HTTPException(status_code=404, detail="study-tooling endpoint not enabled")
    pool = get_pool()
    async with pool.acquire() as conn:
        await _require_tooling_tier(conn, current_user)
        rows = await conn.fetch(
            "SELECT from_ref, to_ref, votes "
            "  FROM tsk_pairs "
            " WHERE from_book_slug = $1 AND from_chapter = $2 AND from_verse = $3 "
            " ORDER BY votes DESC, to_ref ASC "
            " LIMIT 200",
            book_slug,
            chapter,
            verse,
        )
    from_ref = rows[0]["from_ref"] if rows else f"{book_slug}.{chapter}.{verse}"
    response.headers["Cache-Control"] = "public, max-age=86400"
    return TskVerseResponse(
        book_slug=book_slug,
        chapter=chapter,
        verse=verse,
        from_ref=from_ref,
        pairs=[TskPair(to_ref=r["to_ref"], votes=r["votes"]) for r in rows],
    )


@app.get("/v1/maps/places", response_model=MapPlacesResponse)
async def get_maps_places(
    response: Response,
    kind: Optional[str] = Query(
        default=None, description="Filter by place class (settlement / natural / region / …)."
    ),
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> MapPlacesResponse:
    """Ancient places for the own-tile map render (§ Maps, new surface).

    Companion-gated, kill-switch shared. Coordinates only — the PWA renders on
    its own SVG/canvas (no copyrighted atlas plate; the attribution screen
    credits openbible.info + OpenStreetMap). The dispersion/gathering overlay
    rides via /v1/tool-annotations/maps/dispersion-overlay.
    """
    if not settings.lexicon_enabled:
        raise HTTPException(status_code=404, detail="study-tooling endpoint not enabled")
    pool = get_pool()
    async with pool.acquire() as conn:
        await _require_tooling_tier(conn, current_user)
        if kind is not None:
            rows = await conn.fetch(
                "SELECT place_id, name, lon, lat, kind, osis_refs "
                "  FROM maps_places WHERE kind = $1 ORDER BY name ASC",
                kind,
            )
        else:
            rows = await conn.fetch(
                "SELECT place_id, name, lon, lat, kind, osis_refs "
                "  FROM maps_places ORDER BY name ASC"
            )
    response.headers["Cache-Control"] = "public, max-age=86400"
    places = [
        MapPlace(
            place_id=r["place_id"],
            name=r["name"],
            lon=r["lon"],
            lat=r["lat"],
            kind=r["kind"],
            osis_refs=list(r["osis_refs"] or []),
        )
        for r in rows
    ]
    return MapPlacesResponse(places=places, count=len(places))


@app.get(
    "/v1/nikkudot/{book_slug}/{chapter}/{verse}",
    response_model=NikkudotVerseResponse,
)
async def get_nikkudot_verse(
    book_slug: str,
    chapter: int,
    verse: int,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> NikkudotVerseResponse:
    """Pointed Hebrew (TAHOT) for one OT verse — the interlinear Nikkudot sibling.

    Companion-gated, kill-switch shared. 404 for verses outside the OT load. The
    pointing is trustworthy except the deliberate masking of the Name; that one
    conflict rides via /v1/tool-annotations/nikkudot/tetragrammaton, which the
    surface attaches whenever has_tetragrammaton is true.
    """
    if not settings.lexicon_enabled:
        raise HTTPException(status_code=404, detail="study-tooling endpoint not enabled")
    pool = get_pool()
    async with pool.acquire() as conn:
        await _require_tooling_tier(conn, current_user)
        row = await conn.fetchrow(
            "SELECT verse_key, book_slug, chapter, verse, pointed_text, "
            "       has_tetragrammaton "
            "  FROM nikkudot_verses "
            " WHERE book_slug = $1 AND chapter = $2 AND verse = $3",
            book_slug,
            chapter,
            verse,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="nikkudot verse not found")
    response.headers["Cache-Control"] = "public, max-age=86400"
    return NikkudotVerseResponse(
        book_slug=row["book_slug"],
        chapter=row["chapter"],
        verse=row["verse"],
        verse_key=row["verse_key"],
        pointed_text=row["pointed_text"],
        has_tetragrammaton=row["has_tetragrammaton"],
    )


# ----- Compare-only versions (S221 data, S224 UI) -------------------------
#
# A comparison LENS over the reader's primary text — never a readable full
# Bible. Two hard guarantees enforced here, not just in the UI:
#
#   1. compare_only is CHECK-pinned TRUE in the schema; these rows can never
#      be served by the canon reader endpoints above (different tables).
#   2. The chapter endpoint returns AT MOST ONE CHAPTER per call and exposes
#      no paging primitive — there is deliberately no "next chapter" affordance
#      to build a full-Bible reader on top of. The caller addresses exactly
#      one (version, book, chapter[, verse]); that is the ceiling.
#
# Companion-gated, same gate + 403 shape as the other S197 study tools so the
# PWA's tier-locked card renders identically.

# Identity bridge: the reader addresses books by slug ('matthew'); the compare
# tables key on USFM-ish book_code ('MAT'). compare_books.book_number for the
# protocanon version 1 (KJV) is identical to books.canonical_order (1-66), so
# version 1 is the universal lookup table from slug → stable book_code, which
# is then shared across every comparison version (book_code is consistent
# cross-version; a version simply lacks rows for books it doesn't carry, e.g.
# the LXX has no NT codes).
COMPARE_REFERENCE_VERSION_ID = 1


def _compare_version_from_row(row) -> CompareVersion:
    return CompareVersion(
        id=row["id"],
        slug=row["slug"],
        title=row["title"],
        abbreviation=row["abbreviation"],
        year=row["year"],
        has_old_testament=row["has_old_testament"],
        has_new_testament=row["has_new_testament"],
        is_septuagint=(row["slug"] == "brenton-lxx"),
        notes=row["notes"],
    )


@app.get("/v1/compare/versions", response_model=CompareVersionsResponse)
async def list_compare_versions(
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> CompareVersionsResponse:
    """Every comparison-only public-domain version, in display order.

    Drives the compare-panel version picker. Companion-gated like the rest of
    the study-tool library; Brenton's LXX is flagged ``is_septuagint`` so the
    picker can badge it as the Septuagint (Old Testament only).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        await _require_tooling_tier(conn, current_user)
        rows = await conn.fetch(
            "SELECT id, slug, title, abbreviation, year, "
            "       has_old_testament, has_new_testament, notes "
            "  FROM compare_versions "
            " WHERE compare_only IS TRUE "
            " ORDER BY id ASC"
        )
    response.headers["Cache-Control"] = "public, max-age=86400"
    return CompareVersionsResponse(
        versions=[_compare_version_from_row(r) for r in rows]
    )


@app.get(
    "/v1/compare/{version_id}/{book_slug}/{chapter}",
    response_model=CompareChapterResponse,
)
async def get_compare_chapter(
    version_id: int,
    book_slug: str,
    chapter: int,
    response: Response,
    verse: Optional[int] = None,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> CompareChapterResponse:
    """One verse (``?verse=N``) or one whole chapter of a comparison version.

    HARD CAP: never more than a single chapter. There is no paging — the
    caller names exactly one (version, book, chapter); ``verse`` narrows that
    to a single verse (plus any LXX lettered sub-verses sharing the number).

    Resolves the reader's ``book_slug`` to a stable USFM ``book_code`` via the
    protocanon reference version, then reads that code from the requested
    comparison version. 404 if the version doesn't carry the book (e.g. a NT
    book requested against the Septuagint), if the chapter is out of range, or
    if the slug is outside the shared protocanon.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        await _require_tooling_tier(conn, current_user)

        version_row = await conn.fetchrow(
            "SELECT id, slug, title, abbreviation, year, "
            "       has_old_testament, has_new_testament, notes "
            "  FROM compare_versions "
            " WHERE id = $1 AND compare_only IS TRUE",
            version_id,
        )
        if version_row is None:
            raise HTTPException(
                status_code=404, detail=f"Comparison version {version_id} not found."
            )

        # slug → book_code via the protocanon reference version (book_number
        # there == books.canonical_order).
        code_row = await conn.fetchrow(
            "SELECT cb.book_code "
            "  FROM books b "
            "  JOIN compare_books cb "
            "    ON cb.book_number = b.canonical_order "
            "   AND cb.version_id = $2 "
            " WHERE b.slug = $1",
            book_slug,
            COMPARE_REFERENCE_VERSION_ID,
        )
        if code_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"'{book_slug}' is outside the comparison protocanon.",
            )
        book_code = code_row["book_code"]

        # The requested version's own inventory for this book — gives the
        # display name + the chapter_count that bounds the one-chapter cap.
        book_row = await conn.fetchrow(
            "SELECT book_name, chapter_count "
            "  FROM compare_books "
            " WHERE version_id = $1 AND book_code = $2",
            version_id,
            book_code,
        )
        if book_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"{version_row['abbreviation']} does not carry this book.",
            )
        chapter_count = book_row["chapter_count"]
        if chapter < 1 or chapter > chapter_count:
            raise HTTPException(
                status_code=404,
                detail=(
                    f"Chapter {chapter} out of range "
                    f"(1–{chapter_count}) for {version_row['abbreviation']}."
                ),
            )

        if verse is not None:
            verse_rows = await conn.fetch(
                "SELECT chapter, verse, verse_suffix, text "
                "  FROM compare_verses "
                " WHERE version_id = $1 AND book_code = $2 "
                "   AND chapter = $3 AND verse = $4 "
                " ORDER BY verse_suffix ASC",
                version_id,
                book_code,
                chapter,
                verse,
            )
            scope = "verse"
        else:
            verse_rows = await conn.fetch(
                "SELECT chapter, verse, verse_suffix, text "
                "  FROM compare_verses "
                " WHERE version_id = $1 AND book_code = $2 AND chapter = $3 "
                " ORDER BY verse ASC, verse_suffix ASC",
                version_id,
                book_code,
                chapter,
            )
            scope = "chapter"

    response.headers["Cache-Control"] = "public, max-age=86400"
    return CompareChapterResponse(
        version=_compare_version_from_row(version_row),
        book_code=book_code,
        book_name=book_row["book_name"],
        book_slug=book_slug,
        chapter=chapter,
        chapter_count=chapter_count,
        scope=scope,
        verses=[
            CompareVerseRow(
                chapter=r["chapter"],
                verse=r["verse"],
                verse_suffix=r["verse_suffix"],
                text=r["text"],
            )
            for r in verse_rows
        ],
    )


# ----- Teachings — server-gated bodies (Session 421) ---------------------
#
# GET /v1/teachings/{slug}/body — JWT-required. A teaching's title + synopsis
# stay client-side and free; the BODY of a PAID teaching is never shipped in
# the client bundle. It lives in the `teaching_bodies` table and is served
# ONLY to an entitled caller here. Entitlement is enforced SERVER-SIDE with the
# exact machinery every paid route uses: user_tier(current_user) — which the
# auth layer has already resolved DB-wins from the subscriptions table
# (active/trialing only) — checked against the row's tier_required through the
# schema's tier_satisfies() ladder (same as _require_tooling_tier / the label
# PUT). 401 anonymous, 404 unknown slug, 403 authed-but-not-entitled (body
# withheld), 200 with the body only when the tier is satisfied.


@app.get("/v1/teachings/{slug}/body", response_model=TeachingBodyResponse)
async def get_teaching_body(
    slug: str,
    current_user: User = Depends(get_current_user_required),
) -> TeachingBodyResponse:
    """Return a server-gated teaching body to an entitled, authenticated caller.

    The body of a paid teaching never ships in the client bundle; this is the
    only path that serves it, and it withholds the body from any caller whose
    effective tier does not satisfy the teaching's ``tier_required``.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT slug, tier_required::text AS tier_required, body, "
            "       closing, promos "
            "  FROM teaching_bodies "
            " WHERE slug = $1",
            slug,
        )
        if row is None:
            raise HTTPException(status_code=404, detail="Teaching not found.")

        tier = user_tier(current_user)
        tier_ok = await conn.fetchval(
            "SELECT tier_satisfies($1::content_tier, $2::content_tier)",
            tier,
            row["tier_required"],
        )
        if not tier_ok:
            # Authenticated but not entitled — the body is NEVER returned.
            # Detail shape mirrors the other paid gates the PWA already parses.
            raise HTTPException(
                status_code=403,
                detail={
                    "tier_required": row["tier_required"],
                    "feature": "teaching",
                },
            )

    # closing / promos are JSONB. No jsonb codec is registered on the pool, so
    # asyncpg returns them as JSON text — parse when present; null stays null.
    closing_raw = row["closing"]
    promos_raw = row["promos"]
    closing = (
        json.loads(closing_raw) if isinstance(closing_raw, str) else closing_raw
    )
    promos = (
        json.loads(promos_raw) if isinstance(promos_raw, str) else promos_raw
    )

    return TeachingBodyResponse(
        slug=row["slug"],
        tier_required=row["tier_required"],
        body=row["body"],
        closing=closing,
        promos=promos,
    )


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
