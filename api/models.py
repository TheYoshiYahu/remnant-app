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
    # show-all-gate-access (compliance/tier build): when GET /v1/books is called
    # with include_locked=true, the response includes EVERY built book and this
    # flag says whether the caller's tier can actually open it (True = visible
    # but locked → the client renders a lock affordance, no chapter access).
    # None in the default tier-filtered mode (only openable books are returned).
    locked: Optional[bool] = None
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
    tier_required: str = Field(
        ...,
        description=(
            "books.tier_required for the source book. Added Session 125 (W6 Search "
            "V1 UI) so the PWA can render the §23 tier-aware snippet card client-"
            "side without a second round trip. Values match the content_tier enum: "
            "'free', 'study_notes', 'extras', 'complete_study', 'everything'."
        ),
    )
    match_tier: int = Field(
        default=0,
        description=(
            "S352 relevance tier for this hit: 1 exact phrase, 2 exact "
            "token(s), 3 synonym, 4 trigram/fuzzy, 5 concept. Lower = "
            "stronger match. The server already returns hits in tier "
            "order; the field lets the PWA badge or group by match "
            "quality without re-deriving it."
        ),
    )


class VerseSearchResponse(BaseModel):
    """GET /v1/verses/search?q=..."""

    query: str
    total: int = Field(
        ...,
        description=(
            "S352 — TRUE total number of matching verses across the whole "
            "result set (count(*) OVER()), NOT the count of the returned "
            "page. Combined with limit/offset the PWA shows 'N of M' and "
            "pages through the remainder."
        ),
    )
    hits: List[VerseSearchHit]
    limit: int = Field(
        default=50, description="S352 — page size echoed back for the pager."
    )
    offset: int = Field(
        default=0, description="S352 — page offset echoed back for the pager."
    )
    mode: str = Field(
        default="related",
        description="S352 — 'exact' or 'related', echoed back so the UI "
        "can keep the toggle in sync with the served results.",
    )


# ----- Health -------------------------------------------------------------


class HealthResponse(BaseModel):
    status: Literal["ok", "degraded"]
    schema_version: Optional[str] = None
    db_reachable: bool
    checked_at: datetime


class ContentVersionResponse(BaseModel):
    """Opaque cache-busting token (see /v1/content-version). The client
    treats `version` as opaque — it only checks whether it CHANGED, never
    parses it — so the server is free to compose it however it likes."""

    version: str


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


# ----- Display preferences cross-device sync (Session 173) ---------------
#
# Mirror of the localStorage-backed reader preferences introduced in S172
# (sacred name mask, parens hide, theme, font size, interlinear default,
# TTS voice). Lives in users.display_prefs (JSONB). Sparse — only keys
# the partner has explicitly set are serialized. Server is canonical on
# sign-in per S172_SACRED_NAME_MASK_SPEC; client reconciles localStorage
# against the GET response (server wins on divergence).


SacredNameMask = Literal["yahuah", "yhwh"]
ReaderTheme = Literal["light", "dark"]
ReaderFontSize = Literal["small", "medium", "large", "xlarge"]  # S356 — XL step added (backward-compatible)


class DisplayPrefs(BaseModel):
    """The partner's reader-display preferences for cross-device sync.

    All fields Optional — the JSONB column is sparse, only keys the
    partner has explicitly set get serialized to the server. On GET the
    fields that aren't present in the stored JSON come back as None and
    the client falls through to its localStorage value, then to the
    in-code default. On PUT the request body uses the same shape:
    missing keys are not written (so a partial-state PUT doesn't wipe
    other prefs already on the row).

    The TTS voice is a free-text string because the curated voice list
    is partner-system-dependent (browser voice ids on web, native voice
    ids on the Capacitor shells). Validation lives client-side at the
    voice-picker surface.
    """

    model_config = ConfigDict(from_attributes=True)

    sacred_name_mask: Optional[SacredNameMask] = None
    hide_parentheticals: Optional[bool] = None
    theme: Optional[ReaderTheme] = None
    font_size: Optional[ReaderFontSize] = None
    interlinear_default: Optional[bool] = None
    tts_voice: Optional[str] = None


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

    S168 — §28 Hebrew & Greek interlinear extension. Four optional
    fields layer original-language depth above the English surface
    word: ``morphology`` (raw STEPBible morph tag — Robinson for Greek,
    Westminster for Hebrew; the PWA decodes via
    ``app/src/lib/interlinear-helpers.ts``), ``lemma`` (original-script
    headword from ``strong_entries.lemma``), ``transliteration``
    (romanized form from ``strong_entries.transliteration``),
    ``short_definition`` (single-phrase gloss from
    ``strong_entries.short_definition``), and ``language``
    (``strong_entries.language`` — Hebrew/Aramaic/Greek; drives
    font-stack selection at render time). All four are tier-gated at
    the chapter-words endpoint: Companion+ partners receive populated
    values, below-Companion partners receive ``None`` for all four
    (the §28 surface is Companion-gated; below-Companion partners
    keep the existing §20 tap-modal depth via the separate, free,
    /v1/strongs/{strong_number} endpoint).
    """

    model_config = ConfigDict(from_attributes=True)

    position: int = Field(..., description="1-based source order within the verse.")
    surface: str = Field(..., description="English surface form ('God', 'made').")
    strong_number: Optional[str] = None
    morphology: Optional[str] = Field(
        None,
        description=(
            "Raw STEPBible morph code (e.g., 'V-AAI-3S', 'HR/Ncfsa'). "
            "Companion-tier only; null for below-tier callers."
        ),
    )
    lemma: Optional[str] = Field(
        None,
        description="Original-script lemma from strong_entries. Companion-tier only.",
    )
    transliteration: Optional[str] = Field(
        None,
        description="Romanized form from strong_entries. Companion-tier only.",
    )
    short_definition: Optional[str] = Field(
        None,
        description="Single-phrase gloss from strong_entries. Companion-tier only.",
    )
    language: Optional[StrongLanguage] = Field(
        None,
        description=(
            "Original-language family from strong_entries.language "
            "(hebrew/aramaic/greek). Drives PWA font-stack selection. "
            "Companion-tier only."
        ),
    )


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


class StrongOccurrence(BaseModel):
    """One verse where a given Strong's number appears — concordance
    row. Surfaced inside the StrongsLookup modal so a partner can see
    every place the word appears across the canon and tap to navigate.
    """

    model_config = ConfigDict(from_attributes=True)

    verse_id: int
    book_slug: str
    book_title: str
    chapter_number: int
    verse_number: int
    verse_text: str
    position: int = Field(
        ...,
        description=(
            "1-based position within the verse — UI can use to highlight "
            "the matched word in the rendered snippet."
        ),
    )


class StrongOccurrencesResponse(BaseModel):
    """GET /v1/strongs/{strong_number}/occurrences (S121 Wheel 3
    concordance endpoint). Returns paginated verse references where
    the Strong's number appears.

    Common Hebrew/Greek words have thousands of occurrences (H0430
    Elohim alone has ~2600), so the endpoint paginates: caller passes
    ?limit= and ?offset= and gets back the slice plus the total_count
    so the PWA can render "showing N of M, load more" affordance.

    Public — no auth, no tier gate (free-tier feature per §9).
    """

    model_config = ConfigDict(from_attributes=True)

    strong_number: str
    total_count: int
    occurrences: List[StrongOccurrence]


# ----- Consonantal-skeleton lens ("Without the vowels") --------------------
#
# GET /v1/skeleton/{skeleton}        — every Strong's entry sharing the bare
#                                       consonant skeleton, with gloss + usage.
# GET /v1/skeleton/{skeleton}/near   — single-consonant-swap near matches
#                                       (the netzer↔nazir deep dive).
# Hebrew/Aramaic only. Partner-gated at the UI layer; the data is public.


class SkeletonEntry(BaseModel):
    """One Strong's entry sharing a consonantal skeleton, with usage count."""

    model_config = ConfigDict(from_attributes=True)

    strong_number: str
    lemma: str = Field(..., description="Pointed original-script lemma (נֵצֶר).")
    transliteration: str
    short_definition: Optional[str] = None
    definition: str
    usage_count: int = Field(
        0, description="How many Strong's-tagged tokens carry this number."
    )


class SkeletonGroupResponse(BaseModel):
    """GET /v1/skeleton/{skeleton} — the exact same-skeleton group."""

    skeleton: str
    entries: List[SkeletonEntry]


class SkeletonNearGroup(BaseModel):
    """One near-by skeleton (one consonant away) and the entries under it."""

    near_skeleton: str
    edit_kind: str  # 'substitution' | 'insertion' | 'deletion'
    entries: List[SkeletonEntry]


class SkeletonNearResponse(BaseModel):
    """GET /v1/skeleton/{skeleton}/near — single-consonant-swap near matches."""

    skeleton: str
    near: List[SkeletonNearGroup]


# ----- Voice Journal -------------------------------------------------------
#
# Private per-user journal (mirror of notes). Crisis-safety is ON-DEVICE only —
# no crisis/mood/risk field is ever sent to or stored on the server.


class JournalEntry(BaseModel):
    """One private journal entry."""

    model_config = ConfigDict(from_attributes=True)

    id: str
    title: Optional[str] = None
    body: str
    section_label: Optional[str] = None
    created_at: datetime
    updated_at: datetime


class JournalEntriesResponse(BaseModel):
    entries: List[JournalEntry]


class CreateJournalRequest(BaseModel):
    body: str = Field(..., min_length=1, description="Entry text (typed or dictated on-device).")
    title: Optional[str] = None
    section_label: Optional[str] = None


class UpdateJournalRequest(BaseModel):
    body: Optional[str] = Field(default=None, min_length=1)
    title: Optional[str] = None
    section_label: Optional[str] = None


class DevotionalReflection(BaseModel):
    """A curated topic → Scripture + reflection surfaced after an entry."""

    model_config = ConfigDict(from_attributes=True)

    id: str
    topic: str
    title: str
    passage_ref: Optional[str] = None
    passage_text: Optional[str] = None
    reflection: str


class DevotionalResponse(BaseModel):
    reflections: List[DevotionalReflection]


# ----- Reading Plans -------------------------------------------------------


class PlanPassage(BaseModel):
    label: str
    book_slug: Optional[str] = None
    chapter: Optional[int] = None


class PlanDay(BaseModel):
    day_number: int
    passages: List[PlanPassage]


class ReadingPlanSummary(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: str
    slug: str
    title: str
    description: Optional[str] = None
    day_count: int


class ReadingPlanDetail(ReadingPlanSummary):
    days: List[PlanDay]


class ReadingPlansResponse(BaseModel):
    plans: List[ReadingPlanSummary]


class PlanProgress(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    plan_id: str
    plan_slug: str
    current_day: int
    completed_days: List[int]


class PlanProgressResponse(BaseModel):
    progress: List[PlanProgress]


class UpdatePlanProgressRequest(BaseModel):
    # Mark a day complete and/or move current_day. Both optional.
    completed_day: Optional[int] = None
    current_day: Optional[int] = None
    # If true, (re)start the plan (resets to day 1, clears completions).
    start: bool = False


# ----- Bookmarks (Session 124 — Wheel 5) ---------------------------------
#
# Per DESIGN_LANGUAGE.md §22 (locked S124): single-verse flag with richer
# metadata (Yoshi's S124 gate chose "richer card" over a simple sheet).
# All endpoints auth-required, all Free-tier (no tier gate per §9).
# Distinct surface from highlights (color-only marking) and notes (study
# content) — a verse can carry a bookmark AND notes AND up to 3 highlights
# simultaneously.
#
# Endpoints:
#   GET    /v1/bookmarks?book_slug=&chapter_number=
#   POST   /v1/bookmarks
#   DELETE /v1/bookmarks/{bookmark_id}
#
# The color_tint enum reuses the §6 13-color HighlightColor literal
# exactly so partners learn one color vocabulary across both surfaces.
# Free tier gets all 13 colors here because color on a bookmark is a
# personal-organization affordance, NOT the marking vocabulary that
# creates the upgrade gate per §7. The $1.99 W8 upgrade is the cross-
# bookmark hub (filter / group by color), not the colors themselves.


# Alias for clarity at call sites. Same Literal under the hood.
BookmarkColorTint = HighlightColor


class Bookmark(BaseModel):
    """A single bookmarks row scoped to the requesting partner.

    One bookmark per (user, verse) per the §22 lock — POSTing on a
    verse the partner already bookmarked edits the existing row via
    ON CONFLICT (user_id, verse_id) DO UPDATE in the handler. All
    three metadata fields are nullable: a partner can save a verse
    with no metadata (just the flag), or with any subset.
    """

    model_config = ConfigDict(from_attributes=True)

    id: str
    verse_id: int
    short_description: Optional[str] = None
    tags: Optional[List[str]] = None
    color_tint: Optional[BookmarkColorTint] = None
    created_at: datetime
    updated_at: datetime


class ChapterBookmarksResponse(BaseModel):
    """GET /v1/bookmarks?book_slug=&chapter_number= — partner's
    bookmarks on every verse of one chapter. Returned in stable
    created-ascending order so the PWA can render the glyphs
    deterministically."""

    bookmarks: List[Bookmark]


class CreateOrReplaceBookmarkRequest(BaseModel):
    """POST /v1/bookmarks body.

    All metadata fields optional — partner can commit a bare flag
    (just verse_id) or a fully labeled bookmark. Re-POSTing on a verse
    the partner already bookmarked replaces the metadata (ON CONFLICT
    (user_id, verse_id) DO UPDATE) — semantically a save.

    No tier gate at the handler level (§9 Free-tier feature). All 13
    color_tint values valid for every tier.
    """

    verse_id: int
    short_description: Optional[str] = None
    tags: Optional[List[str]] = None
    color_tint: Optional[BookmarkColorTint] = None


class BookmarkIndexEntry(BaseModel):
    """GET /v1/bookmarks/index row — bookmark joined with verse + book
    metadata for the global Bookmarks Index surface per DESIGN_LANGUAGE.md
    §29 (locked S166). Includes everything the BookmarksIndex sheet needs
    to render a navigable row without a second fetch: verse reference
    (book + chapter + verse), verse text preview, the bookmark's own
    metadata (short_description, tags, color_tint), and the timestamps.

    Sorted newest-first by created_at per §29 Gate #3.
    """

    model_config = ConfigDict(from_attributes=True)

    id: str
    verse_id: int
    book_slug: str
    book_title: str
    chapter_number: int
    verse_number: int
    verse_text: str
    short_description: Optional[str] = None
    tags: Optional[List[str]] = None
    color_tint: Optional[BookmarkColorTint] = None
    created_at: datetime
    updated_at: datetime


class BookmarksIndexResponse(BaseModel):
    """GET /v1/bookmarks/index — flat array of all the partner's bookmarks
    across the canon, joined with verse + book metadata, sorted
    chronologically newest-first.

    Auth-required, Free-tier (no paywall) per §29 Gate #1.
    """

    bookmarks: List[BookmarkIndexEntry]


# ----- Notes V1 (Session 124 — Wheel 5) ----------------------------------
#
# Per DESIGN_LANGUAGE.md §22 (locked S124): single global notepad for the
# Free tier with verse-anchor injection (Add note from a verse appends
# a new entry with the verse reference as a bold header; chrome Notes
# button opens the notepad without an anchor for free-form writing).
#
# Schema: existing study_notes table (S9), with the legacy CHECK on
# (chapter_id OR verse_id) NOT NULL relaxed at S124 to support the
# chrome-button free-form path (rows with both anchor fields NULL).
#
# Endpoints:
#   GET  /v1/notes      — list partner's entries, created_at ASC
#   POST /v1/notes      — append a new entry (verse_id optional)
#
# W8 ($1.99 Notes tier) adds per-verse-named-notes + the central hub
# surface; the same table carries both modes via nullable scope columns.
# V1 ships GET/POST only — edit/delete per-entry is a W8 affordance.


class NoteEntry(BaseModel):
    """A single study_notes row scoped to the requesting partner.

    Free V1 entries carry one of two shapes:
      (a) verse_id set, title NULL — Add-note-from-verse path; the
          panel renders the bold verse-reference header above the body.
      (b) verse_id NULL, title NULL — chrome-Notes-button free-form
          path; the panel renders the body without a header.

    W8 entries carry verse_id-or-chapter_id-or-both with title set
    (named per-verse / per-chapter notes); those return through the
    same shape with title populated.

    `verse_ref` is server-resolved from the verse_id at fetch / insert
    time (e.g., "Hosea 1:10") so the PWA can render entry headers
    consistently across all chapters without N+1 client round trips.
    Null when verse_id is null (free-form path) or when the verse
    can't resolve in the canon edition.
    """

    model_config = ConfigDict(from_attributes=True)

    id: str
    verse_id: Optional[int] = None
    chapter_id: Optional[int] = None
    title: Optional[str] = None
    body: str
    verse_ref: Optional[str] = None
    created_at: datetime
    updated_at: datetime


class NotesResponse(BaseModel):
    """GET /v1/notes — partner's notes ordered chronologically.

    Returns ALL of the partner's non-archived study_notes rows in
    created_at ASC. Free V1 renders the array as a chronological
    journal in the bottom-slide-up panel; W8 ($1.99 Notes tier) adds
    filtering / per-verse hub views over the same row set.
    """

    notes: List[NoteEntry]


class CreateNoteRequest(BaseModel):
    """POST /v1/notes body.

    `verse_id` is optional — Add-note-from-verse provides it; the
    chrome-Notes-button free-form path posts without it. `body` is
    required and non-empty (the textarea Save commits whatever the
    partner typed). The handler stamps user_id from the JWT and
    leaves title NULL for V1 (W8 will set title for named per-verse
    notes).

    Tier shape (S203): creating notes is free up to the 10-note cap
    (enforced in the handler); `tags` (collections) is a Study Notes
    ($1.99+) field — free callers sending tags get 403 so the upgrade
    trigger fires at the point of intent.
    """

    verse_id: Optional[int] = None
    body: str = Field(..., min_length=1)
    tags: Optional[List[str]] = None


# ----- Phase 9.3 — lexicon (S163) ---------------------------------------


class LexiconEntry(BaseModel):
    """One row from `lexicon_entries`. The PWA's LexiconSheet renders
    body_html with React's dangerouslySetInnerHTML — content is curated
    public-domain (BDB 1906, LSJ 1940, Abbott-Smith 1922) so the XSS
    surface is zero.

    `disclaimer` is pre-baked per source so the PWA doesn't need a
    fallback constant in lexicon-helpers (though it still ships one
    for offline-cache resilience).
    """

    source: str = Field(..., description="One of 'bdb' / 'lsj' / 'gesenius'.")
    strong_number: str
    lemma: str
    transliteration: Optional[str] = None
    pronunciation: Optional[str] = None
    part_of_speech: Optional[str] = None
    short_definition: Optional[str] = None
    body_html: str
    derivation: Optional[str] = None
    citations_count: int
    disclaimer: str = Field(
        ...,
        description=(
            "Standing disclaimer per §26 Gate #1, source-substituted. "
            "Renders muted-italic at the top of the LexiconSheet body."
        ),
    )


class LexiconCallout(BaseModel):
    """The framework-callout band rendered above the lexicon body when
    a Strong's number is on the V1 list of 34 curated terms."""

    strong_number: str
    term_display: str
    gloss_error_summary: str
    body_md: str
    red_lines_cited: List[str]
    last_reviewed_at: Optional[datetime] = None


class LexiconResponse(BaseModel):
    """GET /v1/lexicon/{strong_number} response shape.

    Per S163 Q3 decision (locked at session open): single combined
    endpoint returning all lexicon entries for the strong_number
    (BDB for Hebrew/Aramaic, LSJ for Greek) plus the framework
    callout if one is on the V1 curated list.

    `available_sources` enables the §26 default-source-flip behavior:
    if the partner requests a Hebrew word and BDB has no entry but
    Gesenius does (v1.1+), the PWA can flip the breadcrumb to
    Gesenius as the default. At V1 this list always contains 0 or 1
    sources (one row per word).

    `callout` is null when this strong_number isn't on the V1 list.
    The PWA renders the LexiconSheet without the callout band.
    """

    strong_number: str
    entries: List[LexiconEntry]
    callout: Optional[LexiconCallout] = None
    available_sources: List[str]


# ----- Tool annotations (Session 196 — the framework annotation-layer overlay) -----
# The generalized overlay (APP_BUILDOUT_ROADMAP "annotation layer", locked S194).
# One keyed row per public-domain tool entry that needs a framework correction.
# BDB/LSJ word-callouts stay in lexicon_callouts; this covers Vincent's, Nave's,
# Maps, TSK, Nikkudot, and the interlinear gloss-cell notes. Only is_punch_list_only
# = FALSE rows render as live corrections; punch-list rows are the authoring queue.


class ToolAnnotation(BaseModel):
    """One framework annotation-layer correction beside a public-domain tool entry.

    Rendered at point of use: the reader taps the trusted tool, sees what it says,
    and sees the restored reading correct it. `is_punch_list_only` TRUE rows are
    conflict points logged for the authoring wheel but not yet given a full
    author-reviewed annotation — the surface renders only FALSE rows as live.
    """

    tool: str
    entry_key: str
    term_display: Optional[str] = None
    conflict_summary: str
    annotation_md: str
    tier_required: str
    red_lines_cited: List[str]
    is_punch_list_only: bool
    last_reviewed_at: Optional[datetime] = None


class ToolAnnotationsResponse(BaseModel):
    """GET /v1/tool-annotations/{tool}/{entry_key} response shape.

    Returns the single live annotation for a (tool, entry_key) when one exists,
    plus the count of any sibling annotations on the same tool (for surfaces that
    want to badge "N framework notes on this tool"). `annotation` is null when no
    live (non-punch-list) correction is on file for the key.
    """

    tool: str
    entry_key: str
    annotation: Optional[ToolAnnotation] = None
    tool_live_count: int = 0


# ----- Session 197 — public-domain tool surfaces -------------------------------
# Five PD reference tools come off "coming soon" this session, each shipping as
# an untouched annotated-foil base with the framework correction riding in
# tool_annotations (S196). All five are Companion-gated and share the
# settings.lexicon_enabled kill-switch (the §26 study-tooling surface flips
# together). Verse-keyed lookups use the '<book>.<ch>.<v>' convention so the
# ToolAnnotationBand attaches per verse.


class VincentEntry(BaseModel):
    """One verse-keyed Vincent's *Word Studies in the New Testament* exposition.

    PD base (Marvin R. Vincent, 1886–1900, d.1922). `headword` is the head-
    phrase Vincent exposited; `body` is the verse-keyed English exposition (the
    Greek is lossy OCR and intentionally not surfaced). The framework correction
    rides separately via GET /v1/tool-annotations/vincents/<book>.<ch>.<v>.
    """

    entry_key: str
    book_slug: str
    chapter: int
    verse: int
    verse_key: str
    headword: Optional[str] = None
    body: str
    source_vol: Optional[str] = None


class VincentVerseResponse(BaseModel):
    """GET /v1/vincents/{book_slug}/{chapter}/{verse} response.

    All Vincent's head-phrase expositions for one verse, in source order.
    Empty list when Vincent's has no entry for the verse (NT-scoped corpus;
    OT verses always return []). The PWA pairs this with the verse-level
    framework band fetched from /v1/tool-annotations/vincents/{verse_key}.
    """

    book_slug: str
    chapter: int
    verse: int
    verse_key: str
    entries: List[VincentEntry]


class NavesTopicSummary(BaseModel):
    """One Nave's topical heading in a search/browse result (entry body omitted)."""

    topic_slug: str
    section: Optional[str] = None
    subject: str


class NavesSearchResponse(BaseModel):
    """GET /v1/naves?q=... response — matching topical headings, subject order."""

    query: str
    topics: List[NavesTopicSummary]


class NavesTopic(BaseModel):
    """GET /v1/naves/{topic_slug} response — one heading with its full entry body."""

    topic_slug: str
    section: Optional[str] = None
    subject: str
    entry: str


class TskPair(BaseModel):
    """One TSK cross-reference chain link from a source verse."""

    to_ref: str
    votes: int


class TskVerseResponse(BaseModel):
    """GET /v1/tsk/{book_slug}/{chapter}/{verse} response.

    The inherited TSK chains anchored on the source verse, vote-ranked. A
    subordinate, opt-in foil: the four distortion-class notes ride via
    GET /v1/tool-annotations/tsk/sweep:<class> (gate passed S196).
    """

    book_slug: str
    chapter: int
    verse: int
    from_ref: str
    pairs: List[TskPair]


class MapPlace(BaseModel):
    """One ancient place plotted on the own-tile map (coordinates only)."""

    place_id: str
    name: Optional[str] = None
    lon: float
    lat: float
    kind: Optional[str] = None
    osis_refs: List[str] = []


class MapPlacesResponse(BaseModel):
    """GET /v1/maps/places response — ancient places for own-tile rendering.

    Coordinates only; the PWA renders on its own SVG/canvas (no copyrighted
    atlas plate). The dispersion/gathering overlay rides via
    GET /v1/tool-annotations/maps/dispersion-overlay.
    """

    places: List[MapPlace]
    count: int


class NikkudotVerseResponse(BaseModel):
    """GET /v1/nikkudot/{book_slug}/{chapter}/{verse} response.

    The pointed Hebrew (STEPBible TAHOT) for one OT verse — the interlinear
    sibling view. `has_tetragrammaton` flags verses containing יהוה (H3068) so
    the surface attaches the Name-pointing note via
    GET /v1/tool-annotations/nikkudot/tetragrammaton. Null `pointed_text`
    (404) for verses outside the OT load.
    """

    book_slug: str
    chapter: int
    verse: int
    verse_key: str
    pointed_text: str
    has_tetragrammaton: bool


# ----- My Study (Session 203 — Session C) ---------------------------------
#
# The unified personal-apparatus home per the S203 signed-off proof:
# one surface holding ALL of a partner's notes, bookmarks, and
# highlights — grouped, searchable (client-side over this payload),
# collected, exportable. One endpoint feeds it:
#
#   GET /v1/study/index — everything the partner has marked, joined
#       with verse + book metadata, plus the color-label dictionary
#       and the free-tier note-cap meter.
#
# Search and the color filter run client-side: a partner's apparatus
# is hundreds of rows at most, the payload is already in hand, and
# instant-as-you-type beats a network round trip. Export (Markdown +
# PDF, Study Notes tier) renders client-side from this same payload.
#
# Collections = flat tags presented folder-style. study_notes.tags
# landed in session203_my_study_collections.sql (bookmarks.tags is
# S124-era). Highlights carry no tags — color + style + the partner's
# color labels are their organizational vocabulary.


class StudyNoteEntry(BaseModel):
    """One study_notes row joined with verse metadata for My Study.

    Extends the NotesPanel shape with `tags` (collections) and the
    full `verse_text` so the card can quote the anchored verse in
    come-and-see style without a second fetch. verse_* fields are
    null for free-form (unanchored) entries.
    """

    model_config = ConfigDict(from_attributes=True)

    id: str
    verse_id: Optional[int] = None
    title: Optional[str] = None
    body: str
    tags: Optional[List[str]] = None
    verse_ref: Optional[str] = None
    verse_text: Optional[str] = None
    book_slug: Optional[str] = None
    chapter_number: Optional[int] = None
    verse_number: Optional[int] = None
    created_at: datetime
    updated_at: datetime


class StudyHighlightEntry(BaseModel):
    """One verse_highlights row joined with verse + book metadata.

    The Highlights tab groups these into color sections (with the
    partner's label from user_highlight_labels) and fill/underline/
    outline sub-groups — the marking vocabulary as the table of
    contents.
    """

    model_config = ConfigDict(from_attributes=True)

    id: str
    verse_id: int
    color: HighlightColor
    style: MarkStyle
    book_slug: str
    book_title: str
    chapter_number: int
    verse_number: int
    verse_text: str
    created_at: datetime


class StudyIndexResponse(BaseModel):
    """GET /v1/study/index — the partner's whole apparatus in one
    payload, plus the dictionary + cap meter the surface needs.

    `note_cap` is the free-tier ceiling (10) or null for paid tiers;
    `note_count` is the partner's current non-archived note count —
    the lever card renders "N of 10 free notes used" from the pair.
    """

    notes: List[StudyNoteEntry]
    bookmarks: List[BookmarkIndexEntry]
    highlights: List[StudyHighlightEntry]
    labels: List[HighlightLabel]
    note_count: int
    note_cap: Optional[int] = None


class UpdateNoteRequest(BaseModel):
    """PATCH /v1/notes/{note_id} body — Study Notes tier ($1.99+).

    Both fields optional; omitted fields are left untouched. `tags`
    replaces the whole array when present (empty list clears). Free
    tier receives 403 — the Free notepad stays append-only per §22.
    """

    body: Optional[str] = Field(None, min_length=1)
    tags: Optional[List[str]] = None


# ----- The Witness (working title: Red Pill) — Session 204 -----------------


class WitnessEntry(BaseModel):
    """One red_pill_verses row for a verse in the requested chapter.

    The Witness is the inverted red-letter overlay: red-letter editions
    mark where the Messiah speaks; the Witness marks where he — or
    anyone speaking of him — claims to be Yahuah, plus every verse only
    possible if he is the one who spoke to Moses and the prophets
    (the transfer test, four claim classes). `card_md` is the full
    come-and-see tap-card: both sides quoted in full, stand-alone
    italics, sacred names intact. Free tier — the proclamation surface.
    """

    verse_id: int
    verse_number: int
    claim_class: str  # 'direct' | 'title' | 'act' | 'structural'
    class_label: str  # reader-facing tag, e.g. 'His own mouth'
    card_title: str
    card_md: str
    anchor_refs: List[str]


class ChapterWitnessResponse(BaseModel):
    """GET /v1/books/{book_slug}/chapters/{chapter_number}/witness.

    Every marked verse in the chapter, ordered by verse_number. Empty
    list when the chapter carries no marks (the PWA renders nothing).
    The surface is pill-generic by design — the Kingdom (blue pill)
    rides the same shape next.
    """

    book: ChapterEndCardBookRef
    chapter: ChapterEndCardChapterRef
    entries: List[WitnessEntry]


class KingdomEntry(BaseModel):
    """One kingdom_verses row for a verse in the requested chapter.

    The Kingdom (working title: Blue Pill) is the nothing-new overlay:
    every new-testament mention of what the Messiah did, what the good
    news is, what the kingdom is, what grace is — paired with the
    scripture it was taught from. Nothing in the new testament is new;
    every beginning declared the end. Five concept strands. `card_md`
    is the full come-and-see tap-card: both sides quoted in full,
    stand-alone italics, sacred names intact. Free tier — the
    proclamation surface.
    """

    verse_id: int
    verse_number: int
    strand: str  # 'gathering' | 'good_news' | 'kingdom' | 'grace' | 'teaching'
    strand_label: str
    card_title: str
    card_md: str
    anchor_refs: List[str]


class ChapterKingdomResponse(BaseModel):
    """GET /v1/books/{book_slug}/chapters/{chapter_number}/kingdom.

    Every Kingdom-marked verse in the chapter, ordered by verse_number.
    Empty list when the chapter carries no marks (the PWA renders
    nothing). Rides the pill-generic rails the Witness shipped (S204);
    register: the two sticks of Ezekiel 37:15-22 — metallic emerald +
    metallic gold joined in one pill.
    """

    book: ChapterEndCardBookRef
    chapter: ChapterEndCardChapterRef
    entries: List[KingdomEntry]


# ----- Compare-only versions (S221 data, S224 UI) -------------------------


class CompareVersion(BaseModel):
    """One comparison-only public-domain translation — a picker card.

    Mirrors compare_versions. ``compare_only`` is CHECK-pinned TRUE in the
    schema and never surfaced; the UI treats every row here as a comparison
    lens, never a readable full Bible. ``is_septuagint`` is a derived flag
    (slug == 'brenton-lxx') so the picker can badge Brenton as the LXX.
    """

    model_config = ConfigDict(from_attributes=True)

    id: int
    slug: str
    title: str
    abbreviation: str
    year: Optional[str] = None
    has_old_testament: bool
    has_new_testament: bool
    is_septuagint: bool = False
    notes: Optional[str] = None


class CompareVersionsResponse(BaseModel):
    """GET /v1/compare/versions — every comparison version, display order."""

    versions: List[CompareVersion]


class CompareVerseRow(BaseModel):
    """One comparison verse (or LXX lettered sub-verse). Mirrors compare_verses."""

    chapter: int
    verse: int
    verse_suffix: str = ""
    text: str


class CompareChapterResponse(BaseModel):
    """GET /v1/compare/{version_id}/{book_slug}/{chapter}[?verse=N].

    A single verse or a single chapter of one comparison version, beside the
    reader's primary text. ``chapter_count`` is the version/book's verified
    chapter total — the PWA uses it only to confirm the bounds; the HARD CAP
    is that this endpoint never returns more than ONE chapter per call and
    exposes no paging. ``scope`` echoes which mode was served.
    """

    version: CompareVersion
    book_code: str
    book_name: str
    book_slug: str
    chapter: int
    chapter_count: int
    scope: Literal["verse", "chapter"]
    verses: List[CompareVerseRow]


# ----- Teachings — server-gated bodies (Session 421) ---------------------
#
# The Teachings tab lists every teaching's title + synopsis client-side. A FREE
# teaching ships its body inline; a PAID teaching's body is NEVER in the client
# bundle — it lives in the `teaching_bodies` table and is served only to an
# entitled, authenticated caller by GET /v1/teachings/{slug}/body. These models
# mirror the client TeachingClosing / TeachingPromo shapes (content.ts).


class TeachingClosingModel(BaseModel):
    """An emphatic closing flourish appended after a teaching body."""

    lead: str
    finish: str


class TeachingPromoModel(BaseModel):
    """A book-cover promo linking out to a physical-goods product page."""

    image: str
    alt: str
    href: str
    caption: Optional[str] = None


class TeachingBodyResponse(BaseModel):
    """GET /v1/teachings/{slug}/body — the server-gated full teaching.

    Returned only after the API confirms the caller's effective tier satisfies
    the teaching's ``tier_required`` (same tier ladder every paid route uses).
    A non-entitled caller receives 403 and never sees ``body``.
    """

    slug: str
    tier_required: ContentTier
    body: str
    closing: Optional[TeachingClosingModel] = None
    promos: Optional[List[TeachingPromoModel]] = None
