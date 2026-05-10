"""
Pydantic v2 response models for the API.

Names mirror the schema columns (data-schema/schema.sql) so a Postgres
row dict maps cleanly into a model via model_validate(dict). The
content_tier and witness_category enums are kept here as Python Literals
because they are stable ENUMs in the schema — if either grows, this file
grows with it.

Sacred-name parentheticals: any free-text field that surfaces to a human
(verse text, chapter title, book title, commentary body) is already
restored upstream by the Phase 3 deterministic pipeline. The API does
not re-restore on the way out.
"""

from __future__ import annotations

from datetime import datetime
from typing import List, Literal, Optional

from pydantic import BaseModel, ConfigDict, Field


# ----- Enum literals (mirror schema.sql) ----------------------------------

ContentTier = Literal[
    "free",
    "study_notes",
    "extras",
    "complete_study",
    "everything",
]

WitnessCategory = Literal[
    "canon",
    "apocrypha",
    "pseudepigrapha",
    "apostolic_fathers",
    "apocryphal_gospels",
    "historical_witness",
    "disputed_witness",
]


# ----- Edition ------------------------------------------------------------


class EditionSummary(BaseModel):
    """Short edition card — used inside book responses."""

    model_config = ConfigDict(from_attributes=True)

    id: int
    slug: str
    title: str
    public_domain_base: str


# ----- Books --------------------------------------------------------------


class BookSummary(BaseModel):
    """Book list item — what GET /v1/books returns."""

    model_config = ConfigDict(from_attributes=True)

    id: int
    slug: str
    title: str
    short_title: Optional[str] = None
    canonical_order: int
    witness_category: WitnessCategory
    tier_required: ContentTier
    abstract: Optional[str] = None
    edition_slug: str = Field(
        ..., description="Slug of the source Restored Names edition the book lives in."
    )


class BookDetail(BookSummary):
    """Single-book detail — adds chapter count."""

    chapter_count: int


# ----- Chapters -----------------------------------------------------------


class ChapterSummary(BaseModel):
    """Chapter list item — used inside the book chapters response."""

    model_config = ConfigDict(from_attributes=True)

    id: int
    chapter_number: int
    chapter_title: Optional[str] = None
    verse_count: int


class BookChaptersResponse(BaseModel):
    """GET /v1/books/{slug}/chapters"""

    book: BookSummary
    chapters: List[ChapterSummary]


# ----- Verses -------------------------------------------------------------


class Verse(BaseModel):
    """A single verse within a chapter."""

    model_config = ConfigDict(from_attributes=True)

    id: int
    verse_number: int
    text: str


class ChapterDetail(BaseModel):
    """GET /v1/books/{slug}/chapters/{n} — chapter with full verse list."""

    book: BookSummary
    chapter: ChapterSummary
    chapter_intro: Optional[str] = None
    verses: List[Verse]


class VerseSearchHit(BaseModel):
    """One row in the trigram-search response."""

    model_config = ConfigDict(from_attributes=True)

    verse_id: int
    book_slug: str
    book_title: str
    chapter_number: int
    verse_number: int
    text: str
    similarity: float = Field(
        ..., description="pg_trgm similarity score (0.0–1.0); higher = closer match."
    )


class VerseSearchResponse(BaseModel):
    """GET /v1/verses/search?q=..."""

    query: str
    total: int
    hits: List[VerseSearchHit]


# ----- Health -------------------------------------------------------------


class HealthResponse(BaseModel):
    status: Literal["ok", "degraded"]
    schema_version: Optional[str] = None
    db_reachable: bool
    checked_at: datetime
