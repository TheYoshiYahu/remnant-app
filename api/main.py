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

from fastapi import Depends, FastAPI, HTTPException, Query, Response
from fastapi.middleware.cors import CORSMiddleware

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
    CreateHighlightRequest,
    CreateNoteRequest,
    CreateOrReplaceBookmarkRequest,
    CrossRefTarget,
    HealthResponse,
    Highlight,
    HighlightColor,
    HighlightLabel,
    HighlightLabelsResponse,
    MarkStyle,
    NoteEntry,
    NotesResponse,
    ReadingPositionResponse,
    ChapterVerseWords,
    ChapterWordsResponse,
    StrongEntry,
    StrongOccurrence,
    StrongOccurrencesResponse,
    ThreadAnchor,
    ThreadMember,
    ThreadMemberTarget,
    UpdateHighlightLabelsRequest,
    UpsertReadingPositionRequest,
    Verse,
    VerseSearchHit,
    VerseSearchResponse,
    VerseWord,
    VerseWordsResponse,
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


# ----- Chapter-end cross-reference card (Session 74 wheel) ---------------


@app.get(
    "/v1/books/{book_slug}/chapters/{chapter_number}/cross-references",
    response_model=ChapterEndCardResponse,
)
async def get_chapter_cross_references(
    book_slug: str,
    chapter_number: int,
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
            "   AND e.slug = 'canon' "
            "   AND tier_satisfies($2::content_tier, b.tier_required)",
            book_slug,
            tier,
        )
        if book_row is None:
            raise HTTPException(
                status_code=404, detail=f"Book '{book_slug}' not found in canon."
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
    threads_by_id: dict[int, ChapterEndThread] = {}
    thread_order: list[int] = []  # preserve sort order from SQL
    for r in thread_member_rows:
        t_id = r["thread_id"]
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
            threads_by_id[t_id] = ChapterEndThread(
                slug=r["thread_slug"],
                title=r["thread_title"],
                summary_md=r["thread_summary_md"],
                anchor=anchor,
                tier_required=r["thread_tier"],
                members_in_chapter=[],
            )
            thread_order.append(t_id)
        threads_by_id[t_id].members_in_chapter.append(
            ThreadMember(
                sort_order=r["member_sort"],
                source_verse_number=r["member_source_verse_number"],
                target=ThreadMemberTarget(
                    book_slug=r["member_target_book_slug"],
                    chapter_number=r["member_target_chapter"],
                    verse_number=r["member_target_verse_number"],
                    preview=r["member_target_text"],
                ),
                member_note=r["member_note"],
            )
        )
    threads = [threads_by_id[t_id] for t_id in thread_order]

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


# ----- Tiered commentary surface (Session 112 wheel) ---------------------


@app.get(
    "/v1/books/{book_slug}/chapters/{chapter_number}/commentary",
    response_model=ChapterCommentaryResponse,
)
async def get_chapter_commentary(
    book_slug: str,
    chapter_number: int,
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
        # Resolve the canon book + chapter under the caller's tier.
        book_row = await conn.fetchrow(
            "SELECT b.id AS book_id, b.slug, b.title, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1 "
            "   AND e.slug = 'canon' "
            "   AND tier_satisfies($2::content_tier, b.tier_required)",
            book_slug,
            tier,
        )
        if book_row is None:
            raise HTTPException(
                status_code=404,
                detail=f"Book '{book_slug}' not found in canon.",
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
# V1 ships GET/POST only. Edit/delete per-entry is a W8 ($1.99 Notes
# tier) affordance — the single global notepad is append-only at Free.
# Per the §22 design: "Free partners who want to revisit an old entry
# tap the verse again → Add note → a new entry block commits with the
# same verse reference; the partner writes the addendum there."


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

    No tier gate (§9 Free-tier). title is left NULL for V1 (W8 will
    set title for named per-verse notes). chapter_id stays NULL for
    V1 — verse-anchor is sufficient ground for the Free notepad's
    chronological journal model.

    If verse_id is provided but doesn't resolve to a real verse, 404
    (catches client drift before silently writing an orphaned row).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid = await upsert_user(conn, current_user)

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
            "    INSERT INTO study_notes (user_id, verse_id, body) "
            "    VALUES ($1::uuid, $2, $3) "
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
        )

    return NoteEntry(**dict(row))


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

    Session 125 (W6 Search V1 UI — DESIGN_LANGUAGE.md §23) adds
    ``books.tier_required`` to the response so the PWA can render the
    gate-(c) tier-aware snippet card client-side without a second round
    trip. The endpoint stays public (no auth) — search itself does not
    tier-gate; the tier-aware rendering happens in the PWA via the new
    field plus the existing ``partnerAtOrAboveTier()`` helper, mirroring
    how §20 menu stubs resolve. See §23 *API surface* for the inline
    justification on client-side rendering vs server-side filtering.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            "SELECT v.id AS verse_id, "
            "       b.slug AS book_slug, b.title AS book_title, "
            "       c.chapter_number, v.verse_number, v.text, "
            "       b.tier_required AS tier_required, "
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
            tier_required=r["tier_required"],
        )
        for r in rows
    ]
    return VerseSearchResponse(query=q, total=len(hits), hits=hits)


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


@app.get(
    "/v1/verses/{verse_id}/words",
    response_model=VerseWordsResponse,
)
async def get_verse_words(verse_id: int) -> VerseWordsResponse:
    """
    Position-ordered list of Strong's-tagged English tokens for one
    verse. The PWA uses this to overlay tap handlers on the rendered
    verse text — for each word in the rendered prose, surface-match
    against this list to find the strong_number, attach a click
    handler that fires GET /v1/strongs/{strong_number}.

    No auth, no tier gate (free-tier feature). 404 when the verse_id
    doesn't exist; empty `words` list when the verse exists but has
    no tagged tokens yet (e.g., extras books outside the canon load).
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        verse_exists = await conn.fetchval(
            "SELECT EXISTS (SELECT 1 FROM verses WHERE id = $1)",
            verse_id,
        )
        if not verse_exists:
            raise HTTPException(status_code=404, detail="verse not found")
        rows = await conn.fetch(
            "SELECT position, surface, strong_number "
            "  FROM verse_words "
            " WHERE verse_id = $1 "
            " ORDER BY position ASC",
            verse_id,
        )
    return VerseWordsResponse(
        verse_id=verse_id,
        words=[
            VerseWord(
                position=r["position"],
                surface=r["surface"],
                strong_number=r["strong_number"],
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
) -> ChapterWordsResponse:
    """Batched Strong's-tagged-token alignment for an entire chapter
    in one round trip (S121, Wheel 3).

    The PWA fires this alongside the existing
    /v1/books/{slug}/chapters/{n} endpoint after a chapter loads, so
    tap-on-word becomes available without firing N parallel per-verse
    requests (which serializes badly on long chapters like Psalm 119
    against the browser's ~6-per-host concurrent-connection cap).

    No auth, no tier gate (free-tier feature per §9). Returns the
    chapter id + a per-verse list (each verse's words array may be
    empty for extras books outside the canon load). 404 when the
    book/chapter doesn't exist.
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        chapter_row = await conn.fetchrow(
            "SELECT c.id, c.chapter_number "
            "  FROM chapters c "
            "  JOIN books b ON b.id = c.book_id "
            " WHERE b.slug = $1 AND c.chapter_number = $2",
            book_slug,
            chapter_number,
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
        word_rows = await conn.fetch(
            "SELECT vw.verse_id, vw.position, vw.surface, vw.strong_number "
            "  FROM verse_words vw "
            "  JOIN verses v ON v.id = vw.verse_id "
            " WHERE v.chapter_id = $1 "
            " ORDER BY vw.verse_id, vw.position",
            chapter_row["id"],
        )

    # Bucket the words by verse_id so we can attach them to the
    # verse rows in one pass.
    words_by_verse: dict[int, list[VerseWord]] = {}
    for r in word_rows:
        words_by_verse.setdefault(r["verse_id"], []).append(
            VerseWord(
                position=r["position"],
                surface=r["surface"],
                strong_number=r["strong_number"],
            )
        )

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
