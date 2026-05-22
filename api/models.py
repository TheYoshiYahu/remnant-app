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


# ----- Chapter-end cross-reference card (Session 73 schema, S74 endpoint) -


class ChapterEndCardBookRef(BaseModel):
    """Book identity surfaced in the chapter-end card response."""

    slug: str
    title: str
    edition_slug: str


class ChapterEndCardChapterRef(BaseModel):
    """Chapter identity surfaced in the chapter-end card response."""

    number: int
    title: Optional[str] = None


class CrossRefTarget(BaseModel):
    """One cross-reference target verse, fully resolved.

    Used inside both the per-verse cross-reference list (one per
    (source, target) pair) and the thread members list. Carries
    `source` so the PWA can label the row (``manual`` for the curated
    framework-bearing pairs that ship today; ``teaching_corpus``
    reserved for future entries authored against the Teaching Corpus
    concept work) and `tier_required` so it can grey out rows the
    caller can't unlock yet.
    """

    verse_id: int
    book_slug: str
    chapter_number: int
    verse_number: int
    preview: str
    source: str
    tier_required: ContentTier


class BaselineSourceVerse(BaseModel):
    """The source-side anchor for one baseline entry."""

    verse_number: int
    preview: str


class BaselineEntry(BaseModel):
    """One verse in the rendered chapter, with all of its cross-ref targets."""

    source_verse: BaselineSourceVerse
    targets: List[CrossRefTarget]


class ThreadAnchor(BaseModel):
    """Tanakh anchor passage for a framework-diagnostic thread."""

    book_slug: str
    chapter_number: int
    verse_start: int
    verse_end: int


class ThreadMemberTarget(BaseModel):
    """The target side of a thread-member cross-reference.

    Slimmer than `CrossRefTarget` — the thread member already lives
    inside a thread block (which has its own tier_required and source
    convention), so we don't repeat them per row.
    """

    book_slug: str
    chapter_number: int
    verse_number: int
    preview: str


class ThreadMember(BaseModel):
    """One thread member whose source verse falls in the rendered chapter."""

    sort_order: int
    source_verse_number: int
    target: ThreadMemberTarget
    member_note: Optional[str] = None


class ChapterEndThread(BaseModel):
    """One framework-diagnostic thread surfacing in this chapter."""

    slug: str
    title: str
    summary_md: str
    anchor: Optional[ThreadAnchor] = None
    tier_required: ContentTier
    members_in_chapter: List[ThreadMember]


class ChapterEndCardResponse(BaseModel):
    """GET /v1/books/{book_slug}/chapters/{chapter_number}/cross-references.

    Per `api/CHAPTER_END_CARD_CONTRACT.md`. Both `baseline` and
    `threads` may be empty; the PWA hides the card entirely when both
    are. The contract draft used path `/api/chapters/...`; the actual
    endpoint follows the running `/v1/books/{slug}/chapters/{n}/...`
    convention to align with the other reader routes.
    """

    book: ChapterEndCardBookRef
    chapter: ChapterEndCardChapterRef
    baseline: List[BaselineEntry]
    threads: List[ChapterEndThread]


# ----- Tiered commentary surface (Session 112) ----------------------------


class ChapterCommentaryEntry(BaseModel):
    """One commentary_entries row, with tier-gating applied.

    When `locked=True`, the row's `body` is stripped (None) — the PWA
    sees the entry exists, knows what `tier_required` would unlock it,
    and can render an upgrade affordance without ever receiving the
    locked content. The `title` is always returned (header is what the
    PWA uses for the upgrade CTA's framing).
    """

    model_config = ConfigDict(from_attributes=True)

    id: int
    title: Optional[str] = None
    body: Optional[str] = Field(
        default=None,
        description=(
            "The commentary body markdown. None when the caller's tier "
            "does not satisfy tier_required (the PWA renders the "
            "upgrade affordance instead of the body)."
        ),
    )
    surface_kind: Literal["inline", "featured", "deep_dive"]
    tier_required: ContentTier
    locked: bool = Field(
        ...,
        description=(
            "True when the caller's tier does not satisfy tier_required. "
            "The PWA uses this to render a locked-state header + upgrade "
            "CTA in place of the body."
        ),
    )


class ChapterCommentaryResponse(BaseModel):
    """GET /v1/books/{book_slug}/chapters/{chapter_number}/commentary.

    Returns all commentary_entries rows scoped to the chapter (verse-
    scoped entries deferred to the per-verse commentary surface that
    ships later). Free-tier chapter_intro is NOT included here — it
    rides on the existing /v1/books/{slug}/chapters/{n} response as
    `chapter_intro` and renders in the PWA above this surface.

    Entries are returned in a stable rendering order: inline (Basic)
    first, then deep_dive (Deeper Dive), then any featured entries.
    The PWA stacks them below the free chapter_intro and above the
    ChapterEndCard cross-reference apparatus.
    """

    book: ChapterEndCardBookRef
    chapter: ChapterEndCardChapterRef
    entries: List[ChapterCommentaryEntry]
