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


# ----- Highlights (Session 113) -------------------------------------------
#
# Locked design per DESIGN_LANGUAGE.md §6, §7, §8 (S77/S78):
#
#   - 12 tribe-palette colors at $1.99 (study_notes-and-above)
#     + 1 neon-yellow free-tier color, deliberately OUTSIDE the
#     tribe palette so every free mark hits the upgrade trigger
#     visually.
#   - 3 mark styles: fill (translucent tinted background), underline
#     (solid colored line below text), outline (4-direction text-
#     shadow, same CSS technique as the sacred-name treatment in
#     DESIGN_LANGUAGE.md §2). Free tier = fill only. $1.99+ = all 3.
#     3 × 12 = 36 mark configurations at $1.99-and-above.
#   - One mark per (user, verse) — re-marking replaces. The unique
#     constraint in the schema (Session 113 migration) is on
#     (user_id, verse_id), not on the triple.
#   - Free-form color-meaning dictionary at $1.99 — partner-assigned
#     labels per color (empty by default; no framework labels
#     preloaded in V1). Tribe + breastplate-gemstone symbolic
#     mapping is open as a V2 enrichment per §6.

# The 12 tribe-palette colors + 1 free-tier neon yellow, in the
# canonical picker render order around the wheel (red → orange →
# yellow → yellow-green → green → blue-green → blue → blue-violet
# → violet → pink-violet → pink → neutral), with neon yellow first
# as the free baseline.
HighlightColor = Literal[
    "neon_yellow",  # FREE (FFE600) — outside the tribe palette
    "crimson",      # D14555 — true red
    "tangerine",    # F0A050 — orange
    "honey",        # E8C04A — yellow
    "sage",         # 97C459 — yellow-green
    "emerald",      # 4DAE7F — green
    "teal",         # 5FB8B0 — blue-green
    "sky_blue",     # 87C5E8 — pale blue
    "periwinkle",   # 9F9FE0 — blue-violet
    "lilac",        # D4B0E0 — light violet
    "magenta",      # E060A5 — pink-violet
    "rose",         # D17BA4 — soft pink
    "parchment",    # C5B795 — warm neutral
]

# Three mark styles per DESIGN_LANGUAGE.md §8. Free locked to 'fill';
# $1.99+ unlocks all three. The 'outline' style shares its CSS
# technique with the sacred-name treatment in §2 (same family,
# different semantic register).
MarkStyle = Literal["fill", "underline", "outline"]


class Highlight(BaseModel):
    """A single verse_highlights row scoped to the requesting partner.

    One mark per (user, verse) per the design lock — POSTing a new
    (color, style) for a verse the partner already marked replaces
    the previous mark.
    """

    model_config = ConfigDict(from_attributes=True)

    id: str
    verse_id: int
    color: HighlightColor
    style: MarkStyle
    created_at: datetime


class ChapterHighlightsResponse(BaseModel):
    """GET /v1/highlights?book_slug=&chapter_number= — partner's highlights
    on every verse of one chapter. Returned in stable created-ascending
    order so the PWA can render them deterministically."""

    highlights: List[Highlight]


class CreateHighlightRequest(BaseModel):
    """POST /v1/highlights body.

    Tier-aware validation runs in the route handler:
      - free tier: must be (color='neon_yellow', style='fill').
      - $1.99-and-above: any (color in tribe palette + neon_yellow,
        style in all three).
    """

    verse_id: int
    color: HighlightColor
    style: MarkStyle = "fill"


class HighlightLabel(BaseModel):
    """One color's partner-assigned label.

    ``label`` is empty string when the partner has not assigned a
    meaning to this color yet. ``tier_required`` is the tier needed
    to APPLY this color to a verse — separate from the tier needed
    to label it ($1.99-and-above for label writes; reads work at
    every tier so the PWA can render the dictionary surface).
    """

    color: HighlightColor
    label: str
    tier_required: ContentTier


class HighlightLabelsResponse(BaseModel):
    """GET /v1/highlights/labels — partner's color-meaning dictionary.

    Returns one entry per palette color in the canonical render order
    (neon_yellow first, then crimson through parchment around the wheel).
    Labels are free-form text the partner has assigned; empty string
    where the partner has not yet defined a meaning.
    """

    labels: List[HighlightLabel]


class UpdateHighlightLabelEntry(BaseModel):
    """One (color, label) pair in the PUT /v1/highlights/labels body.

    Empty / whitespace ``label`` clears the partner's label for that
    color (deletes the row); non-empty ``label`` upserts.
    """

    color: HighlightColor
    label: str


class UpdateHighlightLabelsRequest(BaseModel):
    """PUT /v1/highlights/labels body — list of label entries to update.

    Atomic: all entries land in one transaction, or none do. Restricted
    to $1.99-and-above per the design spec (free-form color-meaning
    dictionary is a $1.99 feature; free callers get a 403).
    """

    labels: List[UpdateHighlightLabelEntry] = Field(..., min_length=1)


# ----- Reading position (Session 116) -------------------------------------
#
# Single-row-per-user "where I left off" pointer. Schema at
# data-schema/schema.sql lines 597-601 — user_id (PK) + verse_id +
# updated_at, designed at S77 and built at S110. The API surface stays
# in slug/chapter/verse_number register (PWA-readable); the opaque
# verse_id stays server-side as the pointer.
#
# Per DESIGN_LANGUAGE.md §9, reading history (last position, recently
# read) is a free-tier feature — every authenticated partner gets the
# resume regardless of tier. Anonymous partners use localStorage on the
# PWA side as a parallel fallback.


class ReadingPositionResponse(BaseModel):
    """GET /v1/reading-position — the partner's most-recently-saved
    reading position, resolved to the PWA-readable book + chapter +
    verse_number register.

    The API returns 404 when the partner has no row yet (first-ever
    visit, or row never written from the client). The PWA falls
    through to its localStorage value, then to Genesis 1.
    """

    model_config = ConfigDict(from_attributes=True)

    book_slug: str
    chapter_number: int
    verse_number: int
    updated_at: datetime


class UpsertReadingPositionRequest(BaseModel):
    """PUT /v1/reading-position body — the (book, chapter, verse) the
    partner is currently viewing.

    Server resolves to verse_id by (book_slug, chapter_number,
    verse_number) and upserts with ON CONFLICT (user_id) DO UPDATE.
    No tier gate — reading position is a free-tier feature per
    DESIGN_LANGUAGE.md §9, available to every authenticated partner.
    """

    book_slug: str
    chapter_number: int = Field(..., ge=1)
    verse_number: int = Field(..., ge=1)


# ----- Strong's tap-on-word (Session 120 — Wheel 1) -----------------------
#
# Free-tier feature per DESIGN_LANGUAGE.md §9. Every partner gets the
# Strong's number + brief lexicon entry on every word of every verse, no
# auth required, no tier gate. Two endpoints power the PWA tap-on-word UI:
#
#   GET /v1/verses/{verse_id}/words
#     Returns the position-ordered list of Strong's-tagged tokens for one
#     verse. The PWA uses this to overlay click handlers on the rendered
#     verse text (surface-matched, position-ordered).
#
#   GET /v1/strongs/{strong_number}
#     Returns one strong_entries row by primary key. The PWA calls this
#     when a tagged word is tapped, opens a modal with the lexicon entry.
#
# Both endpoints are public (no auth, no tier). Strong's data is public
# domain (1890); the lookup is a §9 free-tier promise.


StrongLanguage = Literal["hebrew", "greek", "aramaic"]


class StrongEntry(BaseModel):
    """One Strong's lexicon entry — Hebrew, Greek, or Aramaic.

    Surfaced via GET /v1/strongs/{strong_number}. The short_definition
    is the tooltip-friendly gloss; the (full) definition is the body the
    modal renders. Pronunciation + derivation are nullable extras.
    """

    model_config = ConfigDict(from_attributes=True)

    strong_number: str = Field(
        ...,
        description="4-digit zero-padded: 'H0001', 'G3056'. Schema PK.",
    )
    language: StrongLanguage
    lemma: str = Field(..., description="Original-script lemma (אָב, λόγος).")
    transliteration: str = Field(..., description="Romanized form: 'ʼâb', 'logos'.")
    pronunciation: Optional[str] = None
    short_definition: Optional[str] = Field(
        None,
        description="Single-phrase gloss for tooltip use.",
    )
    definition: str = Field(
        ...,
        description="Full Strong's meaning text — what the modal renders.",
    )
    derivation: Optional[str] = Field(
        None,
        description="Etymology / source root info if available.",
    )


class VerseWord(BaseModel):
    """One position-ordered Strong's-tagged token inside a verse.

    `strong_number` is nullable — verses can have un-tagged tokens
    (rare; punctuation and supplied italics are excluded from the
    loader entirely, so this field is in practice almost always set).
    When set, the PWA tap fires GET /v1/strongs/{strong_number} for
    the lexicon entry.
    """

    model_config = ConfigDict(from_attributes=True)

    position: int = Field(..., description="1-based source order within the verse.")
    surface: str = Field(..., description="English surface form ('God', 'made').")
    strong_number: Optional[str] = None


class VerseWordsResponse(BaseModel):
    """GET /v1/verses/{verse_id}/words — the tap-on-word alignment for
    one verse. Tokens returned in 1-based position order, every row
    a Strong's-tagged English word. The PWA overlays click handlers
    by surface-matching this list against the rendered verse text.
    """

    verse_id: int
    words: List[VerseWord]


class ChapterVerseWords(BaseModel):
    """One verse's worth of tagged tokens in the batched chapter-words
    response. Same shape as a row of VerseWordsResponse but verse-keyed
    so the PWA can map directly to verse_id without a second hop."""

    model_config = ConfigDict(from_attributes=True)

    verse_id: int
    verse_number: int
    words: List[VerseWord]


class ChapterWordsResponse(BaseModel):
    """GET /v1/books/{slug}/chapters/{n}/words (S121, Wheel 3 batched
    endpoint). Returns every verse's Strong's-tagged tokens for the
    entire chapter in one round trip.

    Why batched: Psalm 119 has 176 verses; firing 176 parallel
    /v1/verses/{id}/words requests from the PWA hits the browser's
    ~6-concurrent-connections-per-host cap and serializes into a
    visible lag. This endpoint folds the per-verse loop onto the
    server side where a single JOIN-and-fetch returns everything in
    one ~10-30KB JSON blob.

    Public — no auth, no tier gate (free-tier feature per §9). The
    per-verse endpoint stays alive for single-verse needs (search
    result preview, share-verse hover, etc.).
    """

    model_config = ConfigDict(from_attributes=True)

    chapter_id: int
    verses: List[ChapterVerseWords]
