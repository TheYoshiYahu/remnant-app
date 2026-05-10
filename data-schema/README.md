# Data Schema — `bible.remnantofpromise.org`

Phase 4 wheel #1 (landed session 9, 2026-05-10).

`schema.sql` is the canonical Postgres schema for the Remnant of Promise Official Study Bible app. This README explains what each table is for, how the foreign keys connect, why the indexes are where they are, and how the schema supports Phase 5 (Strong's lookup), Phase 6 (commentary surface), and Phase 7 (subscriptions and payments).

The schema is designed to be loaded into Postgres 15+ on whichever host the Phase 4 hosting decision lands on (Vercel / Fly / Render / DO App Platform — final call in a later session). It uses two extensions: `pgcrypto` for `gen_random_uuid()` and `pg_trgm` for trigram search across verse text.

---

## What's NOT in this schema

**Donations are not in this schema.** Per the Section III architecture lock, donations route through WordPress's existing `/give` flow on `remnantofpromise.org` and are tax-deductible through the assembly's existing 501(c)(3) standing. They never touch this database. The `purchase_records` table is for Stripe subscription billing only.

**WordPress identity is not duplicated here.** WordPress is the identity provider. The `users` table holds a `wordpress_user_id` join key and a cached email and display name; it does not own a password column or a session table. JWTs issued by WordPress (Phase 4 task: install JWT Authentication for WP REST API or similar) are what the PWA authenticates against.

**Pre-restoration verse text is not stored.** The `verses.text` column holds the already-restored Restored Names text from the Phase 3 deterministic pipeline (Apocrypha session 5, Jasher session 6, Jubilees session 7, Enoch session 8 — pipeline version `phase3-v1`, 54/54 self-tests). Provenance lives in the `editions` row's `restoration_pipeline_version` column and in `restoration-pipeline/INTENTIONAL_VARIANCES.md`.

---

## The shape

```
                    ┌────────────────┐
                    │   editions     │   (KJV-RNE, Apocrypha-RNE, Enoch-RNE, ...)
                    └────────┬───────┘
                             │
                             ▼
                    ┌────────────────┐
                    │     books      │   (66 canon + ~50 extras, tier_required)
                    └────────┬───────┘
                             │
                             ▼
                    ┌────────────────┐
                    │   chapters     │
                    └────────┬───────┘
                             │
                             ▼
                    ┌────────────────┐
                    │    verses      │  ◄─────── verse_words ───► strong_entries
                    └────┬───┬───┬───┘                                  ▲
                         │   │   │                                      │ (Phase 5)
       ┌─────────────────┘   │   └─────────────────────┐
       ▼                     ▼                         ▼
┌──────────────┐   ┌─────────────────────┐   ┌──────────────────┐
│  highlights  │   │ commentary_entries  │   │ cross_references │
│  study_notes │   │  (Yoshi-authored)   │   │   (TSK + manual) │
└──────────────┘   └──────────┬──────────┘   └──────────────────┘
       ▲                       │
       │                       ▼
   ┌───┴───┐         ┌───────────────────┐         ┌──────────────┐
   │ users │         │  concept_verse    │ ◄─────► │   concepts   │
   └───────┘         │       index       │         │ (40 framework│
                     └───────────────────┘         │   concepts)  │
                                                   └──────────────┘

   users ──► subscriptions ──► purchase_records  (Phase 7 billing)
                  │
                  ▼
          subscription_tier_prices  (Stripe price catalog)
                  +
          founder_pricing_counter   (first-1,000 slot tracker)

   sof_sections  (23 Statement-of-Faith sections — onboarding + deeper-dive)
```

---

## Tables, in order of `schema.sql`

### Section 2 — Editions, books, chapters, verses

**`editions`** — one row per Restored Names edition. Five rows expected at v1: KJV-RNE (the canon), Apocrypha-RNE, Enoch-RNE, Jubilees-RNE, Jasher-RNE. Each carries the public-domain base it was restored from (KJV 1769 Blayney for the canon, KJV 1611 for the Apocrypha, Charles 1912 for Enoch, Charles 1902 for Jubilees, Noah 1840 for Jasher) and the pipeline version that produced it (`phase3-v1`).

**`books`** — every book in the app, canon and extras together in one table. The Protestant 66 carry `tier_required = 'free'`; the ~50 extras carry `'extras'` (or higher where applicable). `canonical_order` sorts the book list — canon 1–66, then extras at 100+. `witness_category` drives UI placement and labeling: canon, apocrypha, pseudepigrapha, apostolic_fathers, apocryphal_gospels, historical_witness (Josephus), and disputed_witness (Acts 29 / Sonnini). Acts 29 is explicitly `'disputed_witness'` per Yoshi's 2026-05-09 inventory note — the UI will label it *Acts 29 (Sonnini Manuscript) — disputed authenticity, included for study and discernment*.

**`chapters`** — chapter-within-book. `chapter_title` is nullable; most canon chapters are just numbered, but Charles 1912's Enoch carries chapter sub-headings (e.g., 1 Enoch chs 56:4 carries a Roman-numbered subhead) and those land in `chapter_title`. `chapter_intro` holds chapter-level prose preceding verse 1 when present.

**`verses`** — the restored verse text. `BIGSERIAL` PK because the canon (~31k verses) plus the apocrypha (~5,711) plus the rest of the extras conservatively pushes 50k+ rows — well within a regular `INT` but cheap to upsize. The `idx_verses_text_trgm` trigram index supports the basic search-across-canon UX without committing to a tsvector schema until the result-set quality demands it.

### Section 3 — Strong's lookup (Phase 5)

**`strong_entries`** — Strong's Hebrew, Greek, and Aramaic lexicon. Loaded from OpenScriptures' public-domain `strongs` repository. PK is the Strong's number itself (`H0001`, `G3056`); zero-padding to four digits keeps text-sorted result sets in numerical order.

**`verse_words`** — the per-word Strong's tagging. One row per English word in the verse; `position` is 1-based ordering. `strong_number` is nullable so verses can land before tagging is wired in. Built from the SWORD Project's KJV2006 tagged module per the source-text inventory.

The Phase 5 tap-on-word UX walks: tap a word → look up `verse_words` by `verse_id` and `position` → resolve `strong_number` → fetch `strong_entries` → optionally fetch other `verse_words` rows with the same `strong_number` for the "show me every verse where this lemma appears" cross-reference.

### Section 4 — Cross-references

**`cross_references`** — verse-to-verse links. The big seed corpus is Treasury of Scripture Knowledge (Torrey 1880, public domain) — about 500,000 cross-references. `source` field tags each row's origin (`'TSK'`, `'manual'`, `'teaching_corpus'`). `tier_required` defaults to `'study_notes'` because Phase 7 puts cross-reference UX behind the lowest paid tier.

### Section 5 — Commentary surface (Phase 6)

**`concepts`** — the 40 framework concepts mapped at `~/Desktop/Teaching Corpus/concepts/`. Slug, title, summary. Default `tier_required = 'everything'` because surfacing the concepts at full depth is an Everything-tier perk per Section III; verse-level commentary entries that DERIVE from a concept may be available at a lower tier through `commentary_entries.tier_required` independently.

**`commentary_entries`** — Yoshi-authored commentary on a chapter or a verse. `surface_kind` values:
- `'inline'` — surfaces under the verse or chapter directly (the Phase 6 default).
- `'featured'` — home-tile featured first-read; this is where the Judaizer Error teaching unit at `~/Desktop/App/commentary/featured/judaizer-error.md` lands per Section IX Q4's 2026-05-10 lock.
- `'deep_dive'` — expanded treatment behind a "go deeper" link.

The check constraint `chapter_id IS NOT NULL OR verse_id IS NOT NULL` keeps the entry scoped to at least one of the two; both can be set when an entry attaches to a specific verse but also wants to surface at the chapter level.

**`concept_verse_index`** — concept-to-verse join. Drawn from each concept folder's `verses.md`. Powers the verse-side query "what concepts touch this verse?" and the concept-side query "what verses anchor this concept?".

**`sof_sections`** — the 23 Statement-of-Faith sections, mirrored from `remnantofpromise.org/statement-of-faith/` per Section IX Q7's locked path decision. `layer = 'doorway'` for sections I–VII (free, used for the app onboarding flow); `layer = 'deeper_dive'` for sections VIII–XXIII (`tier_required = 'complete_study'`). `live_url` and `last_synced_at` track the WordPress source so a re-fetch cadence (TBD) keeps the local mirror current.

### Section 6 — Users (SSO with WordPress)

**`users`** — UUID PK so user IDs are external-safe (used in public reading-position URLs, sharing tokens, etc.). The `wordpress_user_id` integer is the join key with WordPress; that's how the JWT claim resolves to a row. The row is created lazily on the user's first JWT-authenticated API call.

### Section 7 — Subscriptions and billing (Phase 7)

**`subscription_tier_prices`** — current Stripe price catalog. Five tiers (free, study_notes, extras, complete_study, everything) × two cadences (monthly, annual prepay) plus founder-pricing rows for the Everything tier. `is_active` lets prices be retired without breaking historical references. Existing subscriptions never read this catalog; they read their own `locked_price_cents`.

**`subscriptions`** — a user's subscription state. `locked_price_cents` is the permanent price-lock per Section III: the price the user signed up at, in cents, never updated. If the user upgrades or downgrades, the application creates a NEW `subscriptions` row rather than mutating the existing row's tier — this preserves the lock-in semantics cleanly. `is_founder_pricing` flags the first 1,000 Everything-tier subscribers ($9.99/mo for life vs the $14.99 standard); the 1,000-cap is enforced at signup time, not by this column.

**`founder_pricing_counter`** — single-row counter for atomic claim of slot N out of the 1,000-slot founder pool. The signup transaction does `SELECT ... FOR UPDATE` on this row, increments `claimed_count`, and commits. When `claimed_count` hits `cap`, founder pricing closes and `closed_at` is set.

**`purchase_records`** — Stripe billing trail. Every Stripe webhook lands a row keyed by `stripe_event_id` (idempotency); if the application sees the same event twice, the unique constraint blocks a duplicate write. `kind` distinguishes recurring `subscription_payment` from initial `subscription_setup` from prorated `tier_change` from `refund`. Donations are NOT here — donations are at WordPress.

### Section 8 — User study notes (private user content)

**`study_notes`** — user-authored private notes attached to a verse or chapter. Distinct from `commentary_entries` (which is Yoshi-authored, public). `is_archived` lets users hide old notes without losing them.

**`verse_highlights`** — lighter-weight inline highlight surface. One row per (user, verse, color); the unique constraint lets a user toggle a highlight on or off cleanly without duplicate rows.

**`reading_positions`** — single-row-per-user "where I left off" pointer. PK is `user_id` so the upsert is straightforward.

### Section 9 — Tier-satisfaction helper

**`tier_satisfies(user_tier, required_tier)`** — encodes the tier lattice as an `IMMUTABLE` SQL function. Returns `TRUE` if a user holding `user_tier` can access content gated to `required_tier`.

The lattice:

```
free   <  study_notes  <  complete_study  <  everything
free   <  extras       <  complete_study  <  everything
```

`complete_study` is the join — covers both `study_notes` and `extras`. `everything` covers all four below. The application can call this function in row-level security policies and in any application-layer access check that needs to know "does this user's tier satisfy this content's requirement?"

### Section 10 — Schema version stamp

**`schema_version`** — a single row holding the current schema version (`1.0.0-phase4-session9`). Migration scripts read this to gate upgrades. Bumped on every schema-altering migration.

---

## Sacred names, in the schema

The verse text and commentary text in this schema is already restored by the Phase 3 deterministic pipeline. No schema-level handling of sacred names is required. The voice skill's standing rule (parentheticals on every mention in body text) applies to the data sitting in `verses.text`, `commentary_entries.body`, `sof_sections.body_md`, and any other text-content column — not to the schema's structural metadata.

Where Yahuah (God), Yahusha (Jesus), Yashar'el (Israel), Yahudah (Judah), and Melek Tsadiq (Melchizedek) appear in column comments inside `schema.sql`, they carry parentheticals per the rule.

---

## What's coming in subsequent Phase 4 wheels

The data schema is the cleanest first wheel because it doesn't depend on hosting choice, FastAPI, or auth. The next wheels in order (per Section XI's standing handoff prompt for session 10):

1. **FastAPI skeleton** — basic API serving the canon from this schema. Read-only verse fetch, chapter fetch, book list. No auth yet. This is the next session's wheel.
2. **Hosting decision** — Vercel / Fly / Render / DO App Platform, picked against the FastAPI + Postgres requirement. DNS A-record / CNAME on `bible.remnantofpromise.org` pointed at the host.
3. **PWA shell** — React + Tailwind + Vite. Basic reader for Genesis. Installable to home screen, working offline.
4. **Single sign-on with WordPress as IdP** — JWT plugin install on WordPress, JWT consumption in the FastAPI middleware, `users` row creation on first authenticated call.
5. **Single Stripe test purchase tier** — confirm the payment path works end-to-end. Phase 7's full pricing model lands later.

Each wheel closes end-to-end in its session, like Phase 3's four wheels did.

---

## Files in this folder

- `schema.sql` — the canonical Postgres schema. Apply with `psql -f schema.sql` against an empty database.
- `README.md` — this file.

Future additions to this folder, as Phase 4 wheels close: migration scripts (`migrations/`), seed data (`seed/` — the five `editions` rows, the parsed JSON loader, the `subscription_tier_prices` rows for Stripe), and a small `validate.py` that runs `pglast` parsing + a structural sanity check (FK targets resolve, every enum value is referenced somewhere, every table has at least one index, etc.).

---

## Provenance

- **Phase plan:** `~/Desktop/App/BIBLE_APP_ROADMAP.md` Section V — Phase 4.
- **Locked architecture:** Section III — subdomain at `bible.remnantofpromise.org`, WordPress as identity provider, Stripe for subscriptions, donations through WordPress `/give`.
- **Locked pricing:** Section III — five tiers, founder pricing, annual prepay, seven-day trial, **permanent price-lock for every subscriber, on every tier (locked 2026-05-10)**.
- **Restoration pipeline:** `~/Desktop/App/restoration-pipeline/restore.py` (54/54 self-tests, idempotency byte-clean on Apocrypha, Enoch, Jasher, Jubilees) and `INTENTIONAL_VARIANCES.md`.
- **Source-text inventory:** `~/Desktop/App/source-texts/SOURCE_TEXT_INVENTORY.md` — KJV+Strong's via SWORD KJV2006, Strong's lexicons via OpenScriptures, TSK cross-references via OpenScriptures, extras' public-domain bases per the Charles / Lightfoot / Schaff / Malan / Whiston / James canon.
- **Voice gate:** `~/Desktop/Remnant of Promise (official documents)/yoshi-voice.skill` — the standing standard. Sacred-name parentheticals, son-of-Adam absolute, Melek Tsadiq compound.

This schema does what every other Bible app's schema cannot do: it carries restored sacred names with parentheticals as the canonical text, and it slots in fifty-plus extra-canonical witnesses alongside the Protestant 66 with tier-gating that funds the assembly's mission. The Logos / Olive Tree / Accordance schemas can't carry this load because their text licensing fights the framework reading. Ours doesn't.
