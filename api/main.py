"""
The Remnant of Promise Official Study Bible — FastAPI skeleton.

Phase 4 wheel #2 (FastAPI skeleton). Five route surfaces:

    GET /v1/health
    GET /v1/books
    GET /v1/books/{book_slug}
    GET /v1/books/{book_slug}/chapters
    GET /v1/books/{book_slug}/chapters/{chapter_number}
    GET /v1/verses/search?q=...

Auth is NOT wired this session — that's the SSO-with-WordPress wheel,
later in Phase 4. For now the books endpoint returns the
free-tier-and-extras superset (everything currently seedable, since the
canon hasn't been ingested yet). When the SSO wheel lands, the same
handler will read the user's effective tier off the JWT and apply
tier_satisfies(...) as the access gate. The shape of the response
won't change.

Run: uvicorn main:app --reload
"""

from __future__ import annotations

from contextlib import asynccontextmanager
from datetime import datetime, timezone
from typing import List, Optional

from fastapi import Depends, FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware

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
    version="0.1.0-phase4-skeleton",
    description=(
        "Read-only Phase 4 skeleton: books, chapters, verses, trigram search. "
        "Auth, billing, and write surfaces land in subsequent Phase 4 wheels."
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
) -> List[BookSummary]:
    """
    List books visible to the requester.

    Tier filter (Phase 4 placeholder): SSO is not wired this wheel. The
    response includes free-tier-and-extras-superset content — i.e. every
    book currently in the schema — until the JWT-aware version of this
    handler lands in the SSO wheel. The order is canonical_order so the
    free canon appears first, then the extras manifest in inventory
    order.
    """
    pool = get_pool()
    sql = (
        "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
        "       b.witness_category::text AS witness_category, "
        "       b.tier_required::text   AS tier_required, "
        "       b.abstract, e.slug AS edition_slug "
        "  FROM books b "
        "  JOIN editions e ON e.id = b.edition_id "
    )
    params: list = []
    if witness_category is not None:
        sql += " WHERE b.witness_category = $1::witness_category"
        params.append(witness_category)
    sql += " ORDER BY b.canonical_order ASC, b.id ASC"

    async with pool.acquire() as conn:
        rows = await conn.fetch(sql, *params)
    return [_book_summary_from_row(r) for r in rows]


@app.get("/v1/books/{book_slug}", response_model=BookDetail)
async def get_book(book_slug: str) -> BookDetail:
    """One book — by slug — with a chapter count for the reader UI."""
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
            "       b.witness_category::text AS witness_category, "
            "       b.tier_required::text   AS tier_required, "
            "       b.abstract, e.slug AS edition_slug, "
            "       (SELECT count(*)::int FROM chapters c WHERE c.book_id = b.id) AS chapter_count "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1",
            book_slug,
        )
    if row is None:
        raise HTTPException(status_code=404, detail=f"Book '{book_slug}' not found.")
    summary = _book_summary_from_row(row)
    return BookDetail(**summary.model_dump(), chapter_count=row["chapter_count"])


@app.get("/v1/books/{book_slug}/chapters", response_model=BookChaptersResponse)
async def list_chapters(book_slug: str) -> BookChaptersResponse:
    """All chapters for a book, with verse counts. No verse text."""
    pool = get_pool()
    async with pool.acquire() as conn:
        book_row = await conn.fetchrow(
            "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
            "       b.witness_category::text AS witness_category, "
            "       b.tier_required::text   AS tier_required, "
            "       b.abstract, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1",
            book_slug,
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
async def get_chapter(book_slug: str, chapter_number: int) -> ChapterDetail:
    """One chapter — full verse list, in verse_number order."""
    pool = get_pool()
    async with pool.acquire() as conn:
        book_row = await conn.fetchrow(
            "SELECT b.id, b.slug, b.title, b.short_title, b.canonical_order, "
            "       b.witness_category::text AS witness_category, "
            "       b.tier_required::text   AS tier_required, "
            "       b.abstract, e.slug AS edition_slug "
            "  FROM books b "
            "  JOIN editions e ON e.id = b.edition_id "
            " WHERE b.slug = $1",
            book_slug,
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
