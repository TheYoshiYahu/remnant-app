-- =====================================================================
-- The Remnant of Promise Official Study Bible — Postgres Data Schema
-- =====================================================================
-- Phase 4, wheel #1 — landed session 9 (2026-05-10).
--
-- Scope: every persistent piece of data the app reads or writes EXCEPT
-- donations. Donations route to WordPress (remnantofpromise.org/give)
-- via the existing 501(c)(3) flow and are NOT in this schema. Per the
-- Phase 4 definition in BIBLE_APP_ROADMAP.md Section V.
--
-- Identity: WordPress is the identity provider (SSO from day one). The
-- PWA consumes a JWT signed by WordPress; users.wordpress_user_id is
-- the join key. The PWA never owns passwords.
--
-- Tier model: five subscription tiers per the locked pricing in
-- Section III — free / study_notes ($1.99, user-facing "Notes") /
-- extras ($4.99) / complete_study ($9.99) / everything ($14.99). Each
-- content row carries a tier_required value; the application checks
-- the user's effective tier against tier_required on every fetch.
-- Tier hierarchy is a STRICT CHAIN (locked Session 72, 2026-05-17,
-- closes the S54 sub-question on $1.99 tier wiring):
--   free < study_notes < extras < complete_study < everything
-- Every higher tier inherits every content row gated to a lower tier
-- AND every feature gated to a lower tier. Stepping up a tier never
-- loses content or features. The tier_satisfies(user_tier,
-- required_tier) function at the end of this file encodes the chain.
--
-- The bifurcated lattice (study_notes and extras as siblings; complete_
-- study as their join) was the original Session 9 implementation. It
-- contradicted the locked Section III pricing text, which puts the
-- Apocrypha (14 books) inside the $1.99 ship tier AND inside the $4.99
-- extras tier. The strict chain resolves this: Apocrypha books carry
-- tier_required = 'study_notes' and every paid tier inherits them.
--
-- Permanent price-lock: every subscription carries the price the user
-- signed up at in subscriptions.locked_price_cents. The price field on
-- subscription_tier_prices is a CURRENT-CATALOG record only; existing
-- subscriptions never read it. New subscribers read it at signup; the
-- read result is copied into subscriptions.locked_price_cents and
-- never updated. Yoshi's commitment: the price you signed up at is
-- the price you pay forever. (Section III lock 2026-05-10.)
--
-- Sacred names: the canon and extras text in this schema is already
-- restored by the Phase 3 deterministic pipeline. No schema-level
-- handling of sacred names is needed. Where Yahuah (God), Yahusha
-- (Jesus), Yashar'el (Israel), and similar appear in column comments,
-- they carry parentheticals per the voice skill's standing rule.
-- =====================================================================


-- =====================================================================
-- Section 0 — Extensions and helpers
-- =====================================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;   -- gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS pg_trgm;    -- trigram search on verse text


-- =====================================================================
-- Section 1 — Enum types
-- =====================================================================

-- Content tier required to access a row. Encoded as the SUBSCRIPTION TIER
-- the user must hold (or higher per the lattice in tier_satisfies).
CREATE TYPE content_tier AS ENUM (
    'free',
    'study_notes',
    'extras',
    'complete_study',
    'everything'
);

-- Subscription state from Stripe's lifecycle. Mirrors Stripe's status
-- values so reconciliation is trivial.
CREATE TYPE subscription_status AS ENUM (
    'trialing',          -- inside the seven-day free trial
    'active',            -- paying, current
    'past_due',          -- payment failed, in dunning
    'canceled',          -- explicitly canceled, period over
    'unpaid',            -- final dunning failure
    'incomplete',        -- signup never completed
    'incomplete_expired' -- signup abandoned past Stripe's window
);

-- Subscription billing cadence. Annual prepay = 2 months free
-- (e.g., $14.99/mo or $149/year for the everything tier).
CREATE TYPE billing_cadence AS ENUM ('monthly', 'annual');

-- Purchase event kind. Donations are NOT here — they route to
-- WordPress and are never recorded in this schema.
CREATE TYPE purchase_kind AS ENUM (
    'subscription_payment',  -- recurring billing event from Stripe
    'subscription_setup',    -- initial signup charge
    'tier_change',           -- proration when changing tier
    'refund'                 -- partial or full refund
);

-- Reading provenance for a Restored Names text — which public-domain
-- base it was restored FROM, when the pipeline ran, and which
-- pipeline version produced it.
CREATE TYPE restoration_pipeline_version AS ENUM (
    'phase3-v1',  -- restore.py self-test 50/50 + Enoch defensive 4 → 54/54 (2026-05-10)
    'phase4-v1', -- + Melchisedec NT-spelling variant (KJV NT Heb 5-7) → 56/56 (2026-05-11, session 13)
    'phase4-v2'  -- + general possessive-handling patch (session 19) → 83/83 self-test; drives the corpus-expansion editions (josephus, pseudepigrapha, apocrypha-charles-vol1, mrjames-apocryphal-nt, lightfoot-apostolic-fathers, ascension-isaiah). Landed in seed.py session 34; matching ALTER TYPE on live DB session 35.
);

-- Witness category for a book's stance in the canon vs. the extras vs.
-- the disputed-witness category. Drives UI placement and labeling.
CREATE TYPE witness_category AS ENUM (
    'canon',                  -- Protestant 66 (Genesis through Revelation)
    'apocrypha',              -- the KJV 1611 Apocrypha set
    'pseudepigrapha',         -- Enoch, Jubilees, Adam & Eve, Twelve Patriarchs, etc.
    'apostolic_fathers',      -- Didache, Ignatius, Clement, Polycarp, Hermas, Barnabas
    'apocryphal_gospels',     -- Mary, James (Protoevangelium), Nicodemus, Peter
    'historical_witness',     -- Josephus (Whiston 1737)
    'disputed_witness'        -- Acts 29 / Sonnini Manuscript — explicitly labeled as disputed
);

-- Statement of Faith section layer. Doorway = sections I-VII (free,
-- onboarding flow); deeper-dive = sections VIII-XXIII (tier-gated to
-- complete_study).
CREATE TYPE sof_layer AS ENUM ('doorway', 'deeper_dive');


-- =====================================================================
-- Section 2 — Editions, books, chapters, verses (the canon + extras)
-- =====================================================================

-- An edition is the source-Restored-Names work the text comes from.
-- Examples: KJV Restored Names (the canon), Apocrypha Restored Names
-- Edition, Book of Enoch Restored Names Edition. The pipeline run
-- that produced the text is recorded for provenance.
CREATE TABLE editions (
    id              SERIAL PRIMARY KEY,
    slug            TEXT NOT NULL UNIQUE,            -- 'kjv-rne', 'apocrypha-rne', 'enoch-rne', 'jubilees-rne', 'jasher-rne'
    title           TEXT NOT NULL,                   -- 'The Apocrypha — Restored Names Edition'
    public_domain_base TEXT NOT NULL,                -- 'KJV 1611', 'Charles 1912', 'Noah 1840', 'Charles 1902'
    restoration_pipeline_version restoration_pipeline_version NOT NULL,
    front_matter    TEXT,                            -- About-This-Edition, preface, etc. (already-restored)
    notes           TEXT,                            -- inventory notes, license posture, etc.
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

COMMENT ON TABLE editions IS
    'Source-edition metadata. One row per Restored Names edition (canon + each extras edition).';

COMMENT ON COLUMN editions.public_domain_base IS
    'The public-domain English base the pipeline ran on. KJV 1769 Blayney for the canon; KJV 1611 Apocrypha; Charles 1912 for Enoch; Noah 1840 for Jasher; Charles 1902 for Jubilees.';


-- A book in the canon or in the extras. The 66 canon books plus the
-- ~50 extras books all live in this single table; tier_required
-- distinguishes free-canon from extras-tier content.
CREATE TABLE books (
    id              SERIAL PRIMARY KEY,
    edition_id      INT NOT NULL REFERENCES editions(id) ON DELETE RESTRICT,
    -- Slug is unique PER EDITION, not globally — the same canonical book
    -- (e.g., 1 Esdras, Tobit, Judith) appears in multiple editions
    -- (KJV-1611 apocrypha + Charles 1913 vol 1 apocrypha) with the same
    -- simple slug. Session 35 widened from a global UNIQUE constraint to
    -- this composite to clear the seed.py --apply on the session-32
    -- corpus expansion (11 editions / 153 books / 50,535 verses).
    slug            TEXT NOT NULL,                   -- 'genesis', 'matthew', '1-enoch', 'jasher', 'jubilees', 'wisdom-of-solomon', '1-esdras', ...
    title           TEXT NOT NULL,                   -- 'Genesis', 'The Book of Enoch', 'Wisdom of Solomon'
    short_title     TEXT,                            -- 'Gen', 'Enoch', 'Wis'
    canonical_order INT NOT NULL,                    -- ordering for display: canon 1-66, then extras starting at 100, etc.
    witness_category witness_category NOT NULL,
    tier_required   content_tier NOT NULL,           -- 'free' for canon; 'extras' for extras tier
    abstract        TEXT,                            -- short paragraph for the book-list UI
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (edition_id, slug)
);

CREATE INDEX idx_books_canonical_order ON books(canonical_order);
CREATE INDEX idx_books_tier_required   ON books(tier_required);
CREATE INDEX idx_books_witness         ON books(witness_category);
CREATE INDEX idx_books_slug            ON books(slug);  -- index alone (composite unique uses (edition_id, slug); plain slug index keeps lookups fast where the API filters by slug + an edition join)

COMMENT ON TABLE books IS
    'A book in the canon or extras manifest. Canon = 66 (free tier). Extras = ~50 (extras tier and up).';
COMMENT ON COLUMN books.tier_required IS
    'Lowest tier that grants read access. Canon books are free; extras are gated to the extras tier or higher.';


-- A chapter within a book. Chapter number is the canonical-edition
-- number (e.g., Genesis 1, Genesis 2, ..., 1 Enoch 1, ..., 1 Enoch 108).
-- Some books have a chapter title beyond the number (e.g., 1 Enoch
-- chapters carry sub-headings from Charles 1912's edition).
CREATE TABLE chapters (
    id              SERIAL PRIMARY KEY,
    book_id         INT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    chapter_number  INT NOT NULL,
    chapter_title   TEXT,                            -- nullable: most chapters are just numbered
    chapter_intro   TEXT,                            -- chapter-level prose preceding verse 1, when present
    UNIQUE (book_id, chapter_number)
);

CREATE INDEX idx_chapters_book ON chapters(book_id);


-- A verse within a chapter. The text is the already-restored Restored
-- Names content from the Phase 3 pipeline (or, for canon, from the
-- canon pipeline run when Phase 4 schema is populated). The original
-- pre-restoration text is NOT stored here — provenance is in editions
-- and the pipeline's INTENTIONAL_VARIANCES.md.
CREATE TABLE verses (
    id              BIGSERIAL PRIMARY KEY,
    chapter_id      INT NOT NULL REFERENCES chapters(id) ON DELETE CASCADE,
    verse_number    INT NOT NULL,
    text            TEXT NOT NULL,
    UNIQUE (chapter_id, verse_number)
);

CREATE INDEX idx_verses_chapter ON verses(chapter_id);

-- Trigram index for full-text "find verses containing this phrase" UX.
-- Postgres pg_trgm is sufficient up to ~50k canon + extras verses; if
-- the result-set quality demands it, swap in tsvector later.
CREATE INDEX idx_verses_text_trgm ON verses USING gin (text gin_trgm_ops);

COMMENT ON COLUMN verses.text IS
    'Already-restored verse text from the deterministic pipeline. Sacred names parentheticalized per the voice skill (Yahuah (God), Yahusha (Jesus), Yashar''el (Israel), Yahudah (Judah), Yahudim (Jews), Yahudi (Jew), son of Adam, Melek Tsadiq (Melchizedek), etc.). Pipeline version recorded in editions.restoration_pipeline_version.';


-- =====================================================================
-- Section 3 — Strong's lookup (Phase 5 deliverable; schema landed now)
-- =====================================================================

-- Strong's lexicon entry. Hebrew + Greek populated from OpenScriptures'
-- public-domain Strong's data (per source-texts/SOURCE_TEXT_INVENTORY.md).
CREATE TABLE strong_entries (
    strong_number       TEXT PRIMARY KEY,            -- 'H0001', 'G3056'
    language            TEXT NOT NULL CHECK (language IN ('hebrew','greek','aramaic')),
    lemma               TEXT NOT NULL,               -- the Hebrew/Greek/Aramaic lemma in original script
    transliteration     TEXT NOT NULL,
    pronunciation       TEXT,
    short_definition    TEXT,                        -- single-phrase gloss for tooltip use
    definition          TEXT NOT NULL,               -- full Strong's entry text
    derivation          TEXT,
    consonantal_skeleton TEXT                        -- "Without the vowels" lens: lemma with Hebrew points/accents (U+0591–U+05C7) stripped. NULL for Greek. Populated by _build_consonantal_skeleton.py. See migrations/consonantal_skeleton.sql.
);

CREATE INDEX idx_strong_lemma ON strong_entries(lemma);
CREATE INDEX idx_strong_skeleton ON strong_entries(consonantal_skeleton);

-- Single-consonant-swap near-match map between distinct Hebrew consonantal
-- skeletons (edit distance 1). Precomputed by _build_consonantal_skeleton.py;
-- powers the netzer↔nazir-style near-match deep dive (GET /v1/skeleton/{s}/near).
CREATE TABLE strong_skeleton_near (
    skeleton        TEXT NOT NULL,
    near_skeleton   TEXT NOT NULL,
    edit_kind       TEXT NOT NULL CHECK (edit_kind IN ('substitution','insertion','deletion')),
    PRIMARY KEY (skeleton, near_skeleton)
);

CREATE INDEX idx_skeleton_near_skeleton ON strong_skeleton_near(skeleton);


-- A token (word) inside a verse, with its Strong's tag attached. Built
-- from the SWORD KJV2006 module's tagged text. One row per English
-- word in the verse; position is 1-based ordering. This is how
-- tap-on-word in Phase 5 finds the underlying Strong's entry.
CREATE TABLE verse_words (
    id              BIGSERIAL PRIMARY KEY,
    verse_id        BIGINT NOT NULL REFERENCES verses(id) ON DELETE CASCADE,
    position        INT NOT NULL,                    -- 1-based word position in the verse
    surface         TEXT NOT NULL,                   -- the English surface form as it appears in verses.text
    strong_number   TEXT REFERENCES strong_entries(strong_number),
    morphology      TEXT,                            -- Robinson's morph code for Greek; analogous tag for Hebrew
    UNIQUE (verse_id, position)
);

CREATE INDEX idx_verse_words_strong ON verse_words(strong_number);
CREATE INDEX idx_verse_words_verse  ON verse_words(verse_id);

COMMENT ON TABLE verse_words IS
    'Strong''s-tagged tokens for tap-on-word UX. Phase 5 deliverable. strong_number is nullable so verses can be loaded before tagging is available.';


-- =====================================================================
-- Section 4 — Cross-references (curated framework-bearing pairs)
-- =====================================================================
-- Every row is a curated cross-reference that passed the 12 Red Lines
-- and the 12-point editorial checklist before it landed. The Session 75
-- rollback closed the TSK comprehensive-baseline direction (see
-- api/CHAPTER_END_CARD_CONTRACT.md "ROLLED BACK at Session 75" for the
-- framework grounds — cross-references are interpretive artifacts, not
-- neutral data). The apparatus grows by curated threads on Yoshi's
-- design call, not by mass corpus ingestion.

CREATE TABLE cross_references (
    id              BIGSERIAL PRIMARY KEY,
    -- Session 154: FKs flipped from ON DELETE CASCADE to ON DELETE RESTRICT.
    -- A canon edition reload via seed.py (DELETE FROM books WHERE
    -- edition_id = canon) would cascade through chapters → verses and wipe
    -- every curated cross-reference attached to canon verses; that bit
    -- production at S153. Failing-loud at the FK is the right behavior —
    -- if framework-bearing data exists, a canon reload should abort
    -- rather than silently take the apparatus down with it. Migration:
    -- data-schema/migrations/session154_restrict_fks_against_canon_reload.sql.
    source_verse_id BIGINT NOT NULL REFERENCES verses(id) ON DELETE RESTRICT,
    target_verse_id BIGINT NOT NULL REFERENCES verses(id) ON DELETE RESTRICT,
    source          TEXT NOT NULL,                   -- 'manual' (curated framework-bearing pairs that ship today); 'teaching_corpus' reserved for future entries authored against the Teaching Corpus concept work.
    relevance_score INT,                             -- 0-100 if available; null if unranked
    note            TEXT,                            -- optional one-liner; the curated pairs carry a 'thread:<slug> | <note>' prefix that surfaces alongside the thread membership
    tier_required   content_tier NOT NULL DEFAULT 'free',   -- Session 73: flipped from 'study_notes' to 'free' (chapter-end apparatus is a free-tier feature; every paid tier inherits via the strict chain).
    CHECK (source_verse_id <> target_verse_id),
    -- Dedupe guard (added Session 73). A single pair may exist once per
    -- source — 'manual' and 'teaching_corpus' can each carry the same
    -- pair, but no duplicate rows within a single source.
    CONSTRAINT cross_references_source_target_source_uniq
        UNIQUE (source_verse_id, target_verse_id, source)
);

CREATE INDEX idx_xref_source ON cross_references(source_verse_id);
CREATE INDEX idx_xref_target ON cross_references(target_verse_id);

COMMENT ON TABLE cross_references IS
    'Verse-to-verse links. Default tier_required flipped from study_notes to free in Session 73 — the chapter-end cross-reference apparatus is a free-tier feature; every paid tier inherits via the strict chain. Every row is a curated framework-bearing call that passed the 12 Red Lines and the 12-point editorial checklist before it landed; the Session 75 rollback closed the TSK comprehensive-baseline direction (cross-references are interpretive artifacts, not neutral data — Red Line #2). The framework-diagnostic threads in cross_reference_thread_members are the named grouping of the same curated rows around a thematic anchor.';


-- =====================================================================
-- Section 4b — Cross-reference threads (Session 73)
-- =====================================================================
-- The framework-diagnostic curated grouping. Each thread is anchored on
-- a Tanakh passage and groups a set of cross-reference pairs under a
-- named theme. The chapter-end card renders the per-verse cross-
-- references first (every cross_references row whose source falls in
-- the chapter) and surfaces thread callouts whenever a thread has
-- members in the rendered chapter — same curated rows, two surfaces.

CREATE TABLE cross_reference_threads (
    id                      SERIAL PRIMARY KEY,
    slug                    TEXT NOT NULL UNIQUE,
    title                   TEXT NOT NULL,
    summary_md              TEXT NOT NULL,
    anchor_verse_id_start   BIGINT REFERENCES verses(id) ON DELETE SET NULL,
    anchor_verse_id_end     BIGINT REFERENCES verses(id) ON DELETE SET NULL,
    tier_required           content_tier NOT NULL DEFAULT 'free',
    sort_order              INT NOT NULL DEFAULT 0,
    created_at              TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_xref_threads_slug ON cross_reference_threads(slug);

COMMENT ON TABLE cross_reference_threads IS
    'Curated framework-diagnostic threads grouping cross-reference pairs under a named theme (e.g., post-harvest sifting, grace-from-name''s-sake, new-heart). Each thread has a Tanakh anchor passage (verse_id range) and surfaces in the chapter-end card whenever any member cross-reference falls in the rendered chapter.';


CREATE TABLE cross_reference_thread_members (
    thread_id           INT NOT NULL REFERENCES cross_reference_threads(id) ON DELETE CASCADE,
    -- Session 154: cross_reference_id FK flipped from ON DELETE CASCADE
    -- to ON DELETE RESTRICT. Same rationale as cross_references — a
    -- canon reload that cascade-deletes verses must not silently drop
    -- the curated thread memberships; the apparatus is framework-bearing
    -- and a reload should fail loud at the FK. thread_id stays CASCADE
    -- because deleting a thread should delete its membership rows (the
    -- join row IS the membership).
    cross_reference_id  BIGINT NOT NULL REFERENCES cross_references(id) ON DELETE RESTRICT,
    sort_order          INT NOT NULL DEFAULT 0,
    member_note         TEXT,
    PRIMARY KEY (thread_id, cross_reference_id)
);

CREATE INDEX idx_xref_thread_members_thread ON cross_reference_thread_members(thread_id);
CREATE INDEX idx_xref_thread_members_xref   ON cross_reference_thread_members(cross_reference_id);

COMMENT ON TABLE cross_reference_thread_members IS
    'Join from a thread to its constituent cross-reference pairs. A single cross-reference may belong to multiple threads (the same Tanakh→NT pair often serves more than one framework thread). sort_order controls render order under the thread callout.';


-- =====================================================================
-- Section 5 — Commentary surface (Phase 6 deliverable)
-- =====================================================================

-- The 40 Teaching Corpus framework concepts (~/Desktop/Teaching Corpus/
-- concepts/<concept-slug>/). Each concept has its own folder with
-- summary.md, from-books.md, from-videos.md, verses.md, and
-- yoshi-clarifications.md. The verses.md file is the join key into
-- concept_verse_index.
CREATE TABLE concepts (
    id              SERIAL PRIMARY KEY,
    slug            TEXT NOT NULL UNIQUE,            -- e.g., 'foundational-lie', 'three-categories', 'judaizer-error'
    title           TEXT NOT NULL,                   -- 'The Foundational Lie', 'The Three Categories'
    summary         TEXT NOT NULL,                   -- the concept's summary.md content (already through voice gate)
    tier_required   content_tier NOT NULL DEFAULT 'everything',
    sort_order      INT NOT NULL DEFAULT 0
);

COMMENT ON TABLE concepts IS
    'The 40 framework concepts mapped in ~/Desktop/Teaching Corpus/. Surface depth is everything-tier; verse-level commentary that draws on a concept may be available at lower tiers via commentary_entries.';


-- A commentary entry on a verse or chapter. Yoshi-authored. Sourced
-- from the Teaching Corpus and the Statement of Faith. The same
-- entry may attach to a concept (if it derives from one); the
-- chapter / verse fields are mutually exclusive scoping (NULL
-- means "no entry at that scope").
CREATE TABLE commentary_entries (
    id              BIGSERIAL PRIMARY KEY,
    -- Session 154: chapter_id and verse_id FKs flipped from ON DELETE
    -- CASCADE to ON DELETE RESTRICT. A canon edition reload via
    -- seed.py would cascade through chapters → verses and wipe every
    -- Yoshi-authored commentary entry; that bit production at S153.
    -- Failing-loud at the FK is the right behavior — if commentary
    -- attaches to a canon verse, a canon reload should abort, not
    -- silently delete the framework-bearing authoring. Migration:
    -- data-schema/migrations/session154_restrict_fks_against_canon_reload.sql.
    chapter_id      INT REFERENCES chapters(id) ON DELETE RESTRICT,
    verse_id        BIGINT REFERENCES verses(id) ON DELETE RESTRICT,
    concept_id      INT REFERENCES concepts(id) ON DELETE SET NULL,
    title           TEXT,
    body            TEXT NOT NULL,
    surface_kind    TEXT NOT NULL CHECK (surface_kind IN ('inline','featured','deep_dive')),
    tier_required   content_tier NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    CHECK (chapter_id IS NOT NULL OR verse_id IS NOT NULL)
);

CREATE INDEX idx_commentary_chapter ON commentary_entries(chapter_id);
CREATE INDEX idx_commentary_verse   ON commentary_entries(verse_id);
CREATE INDEX idx_commentary_concept ON commentary_entries(concept_id);

COMMENT ON COLUMN commentary_entries.surface_kind IS
    '"inline" = surfaces under the verse/chapter directly. "featured" = home-tile featured first-read (e.g., the Judaizer Error teaching unit). "deep_dive" = expanded treatment behind a "go deeper" link.';


-- Concept-to-verse index. Drawn from each concept's verses.md file.
-- Powers "Yoshi's framework reading on this passage" — given a verse,
-- find every concept that touches it; given a concept, find every
-- verse that anchors it.
CREATE TABLE concept_verse_index (
    concept_id      INT NOT NULL REFERENCES concepts(id) ON DELETE CASCADE,
    verse_id        BIGINT NOT NULL REFERENCES verses(id) ON DELETE CASCADE,
    relevance_note  TEXT,
    PRIMARY KEY (concept_id, verse_id)
);

CREATE INDEX idx_cvi_verse   ON concept_verse_index(verse_id);
CREATE INDEX idx_cvi_concept ON concept_verse_index(concept_id);


-- The 23 Statement of Faith sections, mirrored from
-- remnantofpromise.org/statement-of-faith/ per Section IX Q7's
-- locked path decision. Sections I-VII = doorway (free, onboarding);
-- VIII-XXIII = deeper-dive (complete_study tier).
CREATE TABLE sof_sections (
    id              SERIAL PRIMARY KEY,
    section_roman   TEXT NOT NULL UNIQUE,            -- 'I', 'II', ..., 'XXIII'
    section_number  INT NOT NULL UNIQUE,             -- 1..23 for ordering
    slug            TEXT NOT NULL UNIQUE,            -- '01-the-name', '11-the-judaizer-error-across-the-ages', etc.
    title           TEXT NOT NULL,
    layer           sof_layer NOT NULL,
    tier_required   content_tier NOT NULL,           -- 'free' for doorway; 'complete_study' for deeper-dive
    body_md         TEXT NOT NULL,                   -- full markdown body
    live_url        TEXT NOT NULL,                   -- 'https://remnantofpromise.org/statement-of-faith/...'
    last_synced_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

COMMENT ON TABLE sof_sections IS
    'The Statement of Faith — twenty-three sections from remnantofpromise.org. Doorway (I-VII) is free and used for the app onboarding flow. Deeper-dive (VIII-XXIII) is gated to complete_study and surfaces behind any commentary entry that touches its themes. Re-synced on a defined cadence (TBD per Section IX Q7).';


-- =====================================================================
-- Section 6 — Users, sessions, and SSO (WordPress as identity provider)
-- =====================================================================

-- A user account. WordPress is the identity provider per the SSO
-- architecture lock in Section III: WordPress issues a JWT, the PWA
-- consumes it. The PWA never owns a password.
CREATE TABLE users (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wordpress_user_id   INT UNIQUE,                  -- the user_id from the WordPress users table
    email               TEXT UNIQUE,                 -- mirrored from WordPress; cached for non-auth lookups
    display_name        TEXT,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    last_seen_at        TIMESTAMPTZ,
    trial_reminder_sent_at TIMESTAMPTZ,              -- compliance/trial-reminder build: timestamp the day-6/7 trial-ending email was sent to this user. NULL = not yet sent; the daily job (jobs/trial_reminders.py) filters on IS NULL for idempotency and stamps now() after a successful send. See migrations/trial_reminders_add_sent_at.sql.
    display_prefs       JSONB                        -- Session 173: cross-device sync for the partner's reader-display preferences (sacred_name_mask, hide_parentheticals, theme, font_size, interlinear_default, tts_voice). Nullable — NULL means "partner has never synced; client-side localStorage is authoritative." Once any preference is PUT, the column holds a JSON object with only the keys the partner has explicitly set. Server is canonical on sign-in (reconciliation: server wins over localStorage when the two diverge). Adding more preferences over time is a JSON-shape change, not a migration.
);

COMMENT ON COLUMN users.wordpress_user_id IS
    'Join key with WordPress. WordPress is the identity provider; this row is created lazily on the user''s first JWT-authenticated request to the PWA API.';

COMMENT ON COLUMN users.display_prefs IS
    'Session 173: JSONB bag of the partner''s reader-display preferences for cross-device sync. Sparse — only keys the partner has explicitly set are present. Recognized keys at S173: sacred_name_mask ("yahuah" | "yhwh"), hide_parentheticals (bool), theme ("light" | "dark"), font_size ("small" | "medium" | "large"), interlinear_default (bool), tts_voice (string voice id). On sign-in the client fetches /v1/me/display-prefs; server wins on divergence per S172_SACRED_NAME_MASK_SPEC. NULL = partner has never synced (localStorage authoritative). Adding new prefs is JSON-shape evolution, no migration.';


-- =====================================================================
-- Section 7 — Subscription tiers, prices, and subscriptions
-- =====================================================================

-- The subscription tier catalog. Static-ish — five rows per the
-- locked pricing in Section III. Existing subscriptions never read
-- this catalog; they read their own locked_price_cents.
CREATE TABLE subscription_tier_prices (
    id                  SERIAL PRIMARY KEY,
    tier                content_tier NOT NULL,
    cadence             billing_cadence NOT NULL,
    price_cents         INT NOT NULL CHECK (price_cents >= 0),
    stripe_price_id     TEXT NOT NULL UNIQUE,        -- the Stripe Price ID used for this row
    is_founder_pricing  BOOLEAN NOT NULL DEFAULT FALSE,
    is_active           BOOLEAN NOT NULL DEFAULT TRUE,
    notes               TEXT,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (tier, cadence, is_founder_pricing)
);

COMMENT ON TABLE subscription_tier_prices IS
    'Current Stripe price catalog. Five tiers x two cadences (monthly + annual prepay). Founder-pricing rows for the everything tier locked at $9.99/mo (vs the $14.99 standard) for the first 1,000 partners. The free tier has a single monthly $0 row for completeness; no Stripe charge fires for it.';


-- A user's active or historical subscription. The price the user
-- pays is locked at signup in locked_price_cents and never updated
-- (permanent price-lock per Section III). Every billing event the
-- user generates appears in purchase_records with this row's id.
CREATE TABLE subscriptions (
    id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id                 UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    tier                    content_tier NOT NULL,
    cadence                 billing_cadence NOT NULL,
    status                  subscription_status NOT NULL,
    stripe_subscription_id  TEXT UNIQUE,             -- nullable for free-tier rows that don't ride Stripe
    stripe_customer_id      TEXT,
    locked_price_cents      INT NOT NULL CHECK (locked_price_cents >= 0),
    locked_at_tier          content_tier NOT NULL,   -- the tier at signup; if user upgrades, a new subscription row is created
    is_founder_pricing      BOOLEAN NOT NULL DEFAULT FALSE,
    trial_start             TIMESTAMPTZ,
    trial_end               TIMESTAMPTZ,
    current_period_start    TIMESTAMPTZ,
    current_period_end      TIMESTAMPTZ,
    cancel_at_period_end    BOOLEAN NOT NULL DEFAULT FALSE,
    canceled_at             TIMESTAMPTZ,
    started_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
    ended_at                TIMESTAMPTZ,
    is_promo_subscriber     BOOLEAN NOT NULL DEFAULT FALSE   -- Session 38: TRUE when checkout redeemed a Stripe promotion code (friends/family/tester comp). Bypasses founder-cap claim; still counted as a partner in dashboard metrics per Yoshi's Session 38 call.
);

CREATE INDEX idx_subs_user      ON subscriptions(user_id);
CREATE INDEX idx_subs_status    ON subscriptions(status);
CREATE INDEX idx_subs_active    ON subscriptions(user_id) WHERE status IN ('trialing','active','past_due');
CREATE INDEX idx_subs_promo     ON subscriptions(is_promo_subscriber) WHERE is_promo_subscriber = TRUE;

COMMENT ON COLUMN subscriptions.locked_price_cents IS
    'Permanent price-lock per Section III. The price the user signed up at, in cents. Never updated, even if subscription_tier_prices changes. The commitment Yoshi locked 2026-05-10.';

COMMENT ON COLUMN subscriptions.is_founder_pricing IS
    'TRUE if this row is one of the first 1,000 everything-tier subscriptions, locked at $9.99/mo for life vs the $14.99 standard. The 1,000-cap is enforced at signup time by the application server, not by this column.';

COMMENT ON COLUMN subscriptions.is_promo_subscriber IS
    'Session 38: TRUE when this subscription was created via a Stripe promotion code (friends-and-family / tester comp). is_founder_pricing stays FALSE for these rows (they did not consume a founder slot); is_promo_subscriber is the distinguishing flag. Still counted as a partner in dashboard partner-count metrics per Yoshi 2026-05-12.';


-- Founder-pricing counter. A single-row table the application uses to
-- atomically claim slot N out of the 1,000-slot founder pool. When
-- claimed_count reaches 1000, founder pricing is closed.
CREATE TABLE founder_pricing_counter (
    id              INT PRIMARY KEY DEFAULT 1 CHECK (id = 1),
    cap             INT NOT NULL DEFAULT 1000,
    claimed_count   INT NOT NULL DEFAULT 0 CHECK (claimed_count >= 0),
    closed_at       TIMESTAMPTZ                       -- set when claimed_count first reaches cap
);

INSERT INTO founder_pricing_counter (id, cap, claimed_count) VALUES (1, 1000, 0);

COMMENT ON TABLE founder_pricing_counter IS
    'Single-row counter for the first-1,000-everything-tier-partners founder pricing. Claim via SELECT ... FOR UPDATE inside the signup transaction.';


-- A purchase event — the per-charge billing trail. Subscription
-- payments, setup charges, prorations, refunds. Every Stripe
-- billing webhook lands here. NOT donations — donations are at
-- WordPress, not in this schema.
CREATE TABLE purchase_records (
    id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id                 UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    subscription_id         UUID REFERENCES subscriptions(id) ON DELETE SET NULL,
    kind                    purchase_kind NOT NULL,
    amount_cents            INT NOT NULL,            -- can be negative for refunds
    currency                TEXT NOT NULL DEFAULT 'USD',
    stripe_event_id         TEXT UNIQUE,             -- idempotency key from the Stripe webhook
    stripe_charge_id        TEXT,
    stripe_invoice_id       TEXT,
    occurred_at             TIMESTAMPTZ NOT NULL,    -- the time Stripe reported the event
    recorded_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
    notes                   TEXT
);

CREATE INDEX idx_purchases_user           ON purchase_records(user_id);
CREATE INDEX idx_purchases_subscription   ON purchase_records(subscription_id);
CREATE INDEX idx_purchases_occurred       ON purchase_records(occurred_at);

COMMENT ON TABLE purchase_records IS
    'Stripe billing trail. Donations route to WordPress and are NOT recorded here. Every row has a stripe_event_id that the application uses for at-most-once webhook handling.';


-- =====================================================================
-- Section 8 — User study notes (private user content)
-- =====================================================================

-- A user-authored private note attached to a verse, chapter, or
-- neither (the Free V1 single-global-notepad free-form path).
-- Distinct from commentary_entries (which is Yoshi-authored, public).
-- Notes are user-private; no row leaves the requesting user's scope.
--
-- S124 (Wheel 5 of the pre-launch sweep, DESIGN_LANGUAGE.md §22):
-- relaxed the original S9 CHECK that required (chapter_id OR verse_id)
-- NOT NULL. Free V1 single-global-notepad supports three insert paths:
--   (a) Add-note from a verse → row carries verse_id (header-per-entry).
--   (b) Chrome Notes button → row carries no anchor (chapter_id NULL,
--       verse_id NULL); the free-form path locked at §22.
--   (c) W8 Notes-tier per-verse-or-chapter notes → row carries one or
--       both anchors with title (named scope).
-- The API layer enforces validity per path; the schema accepts all
-- three. The original CHECK was defensive against client bugs from
-- the S9 $1.99-per-verse design; the API layer has covered that
-- responsibility since S37.
CREATE TABLE study_notes (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    chapter_id      INT REFERENCES chapters(id) ON DELETE CASCADE,
    verse_id        BIGINT REFERENCES verses(id) ON DELETE CASCADE,
    title           TEXT,
    body            TEXT NOT NULL,
    is_archived     BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_notes_user_verse    ON study_notes(user_id, verse_id);
CREATE INDEX idx_notes_user_chapter  ON study_notes(user_id, chapter_id);
-- S124 — chronological ordering for the Free V1 single-global-notepad
-- (GET /v1/notes returns rows in created_at ASC; partner's notepad
-- renders as a chronological study journal per §22).
CREATE INDEX idx_notes_user_created  ON study_notes(user_id, created_at);


-- Voice Journal — private per-user journal (mirror of study_notes). Crisis
-- safety is ON-DEVICE ONLY: there is intentionally NO crisis/mood/risk column
-- anywhere. See migrations/voice_journal.sql.
CREATE TABLE journal_entries (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title           TEXT,
    body            TEXT NOT NULL,
    section_label   TEXT,                    -- the user's own free label; not inference
    is_archived     BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_journal_entries_user ON journal_entries(user_id, created_at DESC);

-- Curated topic/emotion → Scripture + reflection library surfaced after an
-- entry is saved. Seed rows (in the migration) are placeholders for Yoshi.
CREATE TABLE devotional_library (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic           TEXT NOT NULL,
    title           TEXT NOT NULL,
    passage_ref     TEXT,
    passage_text    TEXT,
    reflection      TEXT NOT NULL,
    is_active       BOOLEAN NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_devotional_topic ON devotional_library(topic) WHERE is_active;


-- Reading Plans — curated multi-day plans + account-synced per-user progress.
-- Distinct from the client-only year-plan pacing layer (lib/reading-plan/*).
-- See migrations/reading_plans.sql (which also seeds starter plans).
CREATE TABLE reading_plans (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug          TEXT UNIQUE NOT NULL,
    title         TEXT NOT NULL,
    description   TEXT,
    day_count     INT NOT NULL DEFAULT 0,
    is_active     BOOLEAN NOT NULL DEFAULT TRUE,
    sort_order    INT NOT NULL DEFAULT 0,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE reading_plan_days (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plan_id       UUID NOT NULL REFERENCES reading_plans(id) ON DELETE CASCADE,
    day_number    INT NOT NULL,
    passages      JSONB NOT NULL DEFAULT '[]'::jsonb,   -- [{label, book_slug, chapter}]
    UNIQUE (plan_id, day_number)
);

CREATE INDEX idx_plan_days_plan ON reading_plan_days(plan_id, day_number);

CREATE TABLE reading_plan_progress (
    user_id        UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    plan_id        UUID NOT NULL REFERENCES reading_plans(id) ON DELETE CASCADE,
    current_day    INT NOT NULL DEFAULT 1,
    completed_days INT[] NOT NULL DEFAULT '{}',
    started_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id, plan_id)
);


-- A user-authored bookmark on a single verse. Distinct surface from
-- both highlights (color-only marking, no descriptive text) and notes
-- (study content). DESIGN_LANGUAGE.md §22 (locked S124, Wheel 5):
-- bookmark = "find this again, here's why"; note = study content.
-- A verse can carry BOTH a bookmark and one-or-more notes plus up to
-- three highlight marks simultaneously — three independent surfaces.
--
-- S124 spec (Yoshi's S124 gate: "richer card with metadata" chosen
-- over a simple short_description-only sheet):
--   short_description : multi-line "why I saved this" text, nullable.
--   tags              : partner-defined free-text array, nullable;
--                       GIN-indexed for the W8 cross-bookmark hub.
--   color_tint        : §6 13-color palette reused — partners learn
--                       one color vocabulary across highlights and
--                       bookmarks. Free-tier has access to all 13
--                       (color on a bookmark is personal organization,
--                       NOT marking vocabulary that creates the
--                       upgrade gate per §7's locked free-tier
--                       neon_yellow-only marking rule). Nullable
--                       (default = no tint; partner opts in).
--   UNIQUE (user_id, verse_id) : one bookmark per verse per partner;
--                       re-bookmarking edits the existing row via
--                       ON CONFLICT DO UPDATE in the POST handler.
CREATE TABLE bookmarks (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id             UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    verse_id            BIGINT NOT NULL REFERENCES verses(id) ON DELETE CASCADE,
    short_description   TEXT,
    tags                TEXT[],
    color_tint          TEXT
                            CHECK (color_tint IS NULL OR color_tint IN (
                                'neon_yellow', 'crimson', 'tangerine', 'honey',
                                'sage', 'emerald', 'teal', 'sky_blue',
                                'periwinkle', 'lilac', 'magenta', 'rose',
                                'parchment'
                            )),
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT bookmarks_user_verse_unique UNIQUE (user_id, verse_id)
);

CREATE INDEX idx_bookmarks_user_verse ON bookmarks(user_id, verse_id);
CREATE INDEX idx_bookmarks_tags_gin   ON bookmarks USING GIN (tags);


-- A user-authored highlight on a verse range. The reader UX wants
-- inline highlighting more than verse-level full notes for many
-- readers; this is the lighter-weight surface.
--
-- S113 added the `style` column (fill / underline / outline) per
-- DESIGN_LANGUAGE.md §8 and tightened the unique constraint to
-- (user_id, verse_id) — one mark per verse per user, re-marking
-- replaces.
--
-- S117 relaxed the unique constraint to (user_id, verse_id, color,
-- style) per Yoshi's S114 ask: same exact (color, style) tuple is
-- unique on a verse, but different combos coexist — crimson fill +
-- emerald underline + sky_blue outline all live on the same verse
-- simultaneously; multiple underlines in different colors stack via
-- nested PWA spans with text-underline-offset increments. Cap of 3
-- marks per verse enforced at the PWA picker layer.
CREATE TABLE verse_highlights (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    verse_id        BIGINT NOT NULL REFERENCES verses(id) ON DELETE CASCADE,
    color           TEXT NOT NULL DEFAULT 'yellow',
    style           TEXT NOT NULL DEFAULT 'fill'
                        CHECK (style IN ('fill', 'underline', 'outline')),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT verse_highlights_user_verse_color_style_unique
        UNIQUE (user_id, verse_id, color, style)
);

CREATE INDEX idx_highlights_user ON verse_highlights(user_id);


-- A user's reading position bookmark. One per user (the "where I left
-- off" pointer); the unique constraint enforces it.
CREATE TABLE reading_positions (
    user_id         UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    verse_id        BIGINT NOT NULL REFERENCES verses(id) ON DELETE CASCADE,
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- =====================================================================
-- Section 9 — Tier-satisfaction helper function
-- =====================================================================
-- Encodes the tier lattice. Returns TRUE if a user holding user_tier
-- can access content gated to required_tier. Used in row-level
-- security policies and in application-level access checks.
--
-- Lattice (STRICT CHAIN — locked Session 72, 2026-05-17):
--   free < study_notes < extras < complete_study < everything
-- Every higher tier inherits every lower tier's content and features.
-- Apocrypha (KJV 1611, 14 books) sits at tier_required = 'study_notes'
-- and surfaces to every paid tier. The rest of the extras (Enoch,
-- Jubilees, Jasher, Charles 1913 vol 1 + vol 2 pseudepigrapha, Josephus,
-- and the wider Cepher catalog) sit at tier_required = 'extras' and
-- surface to extras and above. The framework commentary and the
-- Statement-of-Faith deeper-dive sections sit at 'complete_study'.
-- The Yoshi concepts and concept-derived everything-tier perks sit at
-- 'everything'.

CREATE OR REPLACE FUNCTION tier_satisfies(user_tier content_tier, required_tier content_tier)
RETURNS BOOLEAN
LANGUAGE SQL
IMMUTABLE
AS $$
    -- Strict-chain rank. Higher rank = higher tier. user must rank >= required.
    SELECT (
        CASE user_tier
            WHEN 'free'           THEN 0
            WHEN 'study_notes'    THEN 1
            WHEN 'extras'         THEN 2
            WHEN 'complete_study' THEN 3
            WHEN 'everything'     THEN 4
        END
    ) >= (
        CASE required_tier
            WHEN 'free'           THEN 0
            WHEN 'study_notes'    THEN 1
            WHEN 'extras'         THEN 2
            WHEN 'complete_study' THEN 3
            WHEN 'everything'     THEN 4
        END
    );
$$;

COMMENT ON FUNCTION tier_satisfies(content_tier, content_tier) IS
    'Tier lattice check. Returns TRUE if a user holding user_tier can read content gated at required_tier.';


-- =====================================================================
-- Section 10 — Schema version stamp
-- =====================================================================
-- Records the schema's version. Phase-4 migration scripts read this
-- to gate upgrades. Bumped on every schema-altering migration.

CREATE TABLE schema_version (
    id              INT PRIMARY KEY DEFAULT 1 CHECK (id = 1),
    version         TEXT NOT NULL,
    landed_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    notes           TEXT
);

INSERT INTO schema_version (version, notes) VALUES (
    '1.0.0-phase4-session173',
    'Session 173 (2026-05-30) — users.display_prefs JSONB column added for cross-device sync of the partner reader-display preferences set introduced in S172 (sacred_name_mask, hide_parentheticals, theme, font_size, interlinear_default, tts_voice). Nullable; sparse JSON shape (only keys the partner has explicitly set are present). Server canonical on sign-in per S172_SACRED_NAME_MASK_SPEC reconciliation rule (server wins over localStorage). Wired by new GET/PUT /v1/me/display-prefs endpoints in api/main.py. Prior version stamp was 1.0.0-phase4-session154.'
);


-- =====================================================================
-- End of schema.
-- =====================================================================
