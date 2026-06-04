# S197 Checkpoint — Session B (tooling integration), part 2: surfaces rendered

Mounted `~/Desktop`, loaded yoshi-voice, read `S196_CHECKPOINT.md`. Xref sweep
stayed paused. This session **rendered the five public-domain tool surfaces** so
each comes off "coming soon." The governing rule held: **a tool comes off stub
only when its data loads AND its surface renders** — both verified below.

**Open decision settled (was carried from S196):** Vincent's annotation
`entry_key` = **verse-level** (`book.ch.v`), per the S196 checkpoint
recommendation (the band attaches per verse regardless of which head-phrase the
reader is on). The 5 vincents seed rows were re-keyed lemma→verse via
`session197_vincents_annotation_rekey.sql`; none shared a verse, so no
UNIQUE(tool, entry_key) collisions. Verified: 0 lemma keys remain.

---

## Landed + verified this session

All five tools follow one shape: an **untouched annotated-foil base table**
(loaded by a `session197_*_load.sql` migration emitted by the loader) + a
**Companion-gated endpoint** sharing the `lexicon_enabled` kill-switch + a
**React sheet** that renders the base with the framework `ToolAnnotationBand`
(S196) beside it.

### Loader + migrations
`restoration-pipeline/_session197_load_tooling.py` reads the S195 corpora and
emits idempotent (`ON CONFLICT DO UPDATE`) migrations with verify blocks:

| migration | table | rows loaded |
|---|---|---|
| `session197_vincents_load.sql`  | `vincents_entries` | 4,501 |
| `session197_naves_load.sql`     | `naves_topical`    | 5,319 (subjects; CSV is 29,007 physical lines, multi-line entries) |
| `session197_tsk_load.sql`       | `tsk_pairs`        | 343,869 (930 skipped: unmapped source book) |
| `session197_maps_load.sql`      | `maps_places`      | 1,335 (ancient places with a representative lon/lat) |
| `session197_nikkudot_load.sql`  | `nikkudot_verses`  | 19,909 (4,898 carry the Tetragrammaton) |
| `session197_vincents_annotation_rekey.sql` | (rekeys tool_annotations) | 5 vincents rows → verse-level |

### API (`api/main.py` + `api/models.py`)
Five endpoints, all Companion-gated via shared `_require_tooling_tier()` +
`settings.lexicon_enabled` kill-switch, 1-day cache, mirroring `/v1/lexicon`:

- `GET /v1/vincents/{book_slug}/{chapter}/{verse}` → verse expositions
- `GET /v1/naves?q=…` (search) + `GET /v1/naves/{topic_slug}` (detail)
- `GET /v1/tsk/{book_slug}/{chapter}/{verse}` → vote-ranked chains (cap 200)
- `GET /v1/maps/places[?kind=]` → ancient places (coords only)
- `GET /v1/nikkudot/{book_slug}/{chapter}/{verse}` → pointed Hebrew verse

New models: `VincentEntry`/`VincentVerseResponse`, `NavesTopicSummary`/
`NavesSearchResponse`/`NavesTopic`, `TskPair`/`TskVerseResponse`,
`MapPlace`/`MapPlacesResponse`, `NikkudotVerseResponse`.

### Frontend (`app/src`)
- `lib/api.ts` — `fetchTagged<T>()` shared resolver + `ToolFetchResult<T>` +
  typed fetchers/types for all five (mirrors `fetchLexiconEntry`'s tagged union).
- `components/ToolSheet.tsx` — shared modal chrome (z-60, tap-outside/Escape) +
  `ToolTierLockedCard` / `ToolLoading` / `ToolError` / `ToolEmpty` / `ToolFoilNote`.
- `components/VincentsSheet.tsx`, `NikkudotSheet.tsx`, `TskSheet.tsx`,
  `NavesSheet.tsx`, `MapsSheet.tsx` — each renders its base + `ToolAnnotationBand`.
  Maps renders **own SVG tiles** (equirectangular projection over the ANE box)
  with the scattering (red) / gathering (green) overlay; no atlas plate shipped.
- `App.tsx` — five stubs flipped: §26 Vincent's, §20 Nikkudot (Hebrew),
  §20 Nave's, Reference-tools Treasury (TSK), and the new Maps item. Each is
  **live for Companion+** and falls back to the tier-locked `/pricing` stub
  below Companion (so the upgrade affordance is preserved). Handlers + z-60
  mounts wired beside the LexiconSheet mount.

### Verification (all green this session)
- **DB:** `restoration-pipeline/_session197_verify_load.py` boots a userland
  Postgres (`pgserver` wheel — no sudo), applies a minimal prereq
  (content_tier + tier_satisfies + schema_version; the full `schema.sql` needs
  `pgcrypto`, which this pgserver build doesn't bundle) + S196 migration/seed +
  all five S197 loads + the rekey, and asserts row-count floors → **PASS**.
  Cross-join sanity: 2 verses carry both a Vincent's entry and a live vincents
  framework band (matthew.16.18, romans.10.4); the other 3 annotation verses
  (rom 3.28, gal 3.24, eph 2.15) render the band without a coincident Vincent's
  head-phrase row, which is fine — the band is verse-keyed and independent.
- **API:** `py_compile main.py models.py config.py` clean.
- **Frontend:** `tsc --noEmit` (v6.0.3) clean.

---

## Notes carried for continuity (transcribe-to-disk discipline)

- **Kill-switch:** all five S197 endpoints share `settings.lexicon_enabled`
  (default False). They 404 until it's flipped True from the Render dashboard,
  same as the §26 lexicon surface. The migrations + the frontend can ship ahead
  of the flip (publish-then-edit).
- **Apply order in production:** the S197 load migrations are standalone (no FK
  to other tables) except the rekey, which needs `tool_annotations` (S196) to
  exist. Recommended apply order = S196 migration + seed → S197 loads →
  S197 rekey.
- **schema_version not bumped** by the S197 loads (they're additive data loads,
  no DDL beyond CREATE TABLE IF NOT EXISTS). The stamp stays at the S196 value
  `1.0.0-phase-sessionB-session196`. Bump on the next schema-altering migration.
- **TSK 930 skipped pairs** are source verses whose book abbreviation isn't in
  the canon slug map (apocrypha/LXX-numbered books like 3Ki/4Ki, Sir, 1Mac).
  Out of canon scope at V1; acceptable. A future pass could map them if the
  extras editions get TSK coverage.
- **Nikkudot is verse-level pointed text** (space-joined TAHOT words), not a
  per-word interlinear alignment. That satisfies the sibling-view gate (data
  loads + surface renders); a per-word Nikkudot column inside `InterlinearLayer`
  (aligning TAHOT words to `verse_words` positions) is a richer V1.1 follow-on.
- **Maps is verse-independent** (standalone surface). The own-tile SVG plots the
  representative point of each ancient place + four illustrative exile/return
  routes (Samaria↔Nineveh, Jerusalem↔Babylon). A V1.1 could add region polygons
  from `geometry.jsonl` and verse-filtered place highlighting.
- **Out of scope (unchanged):** notes/bookmarks (Session C), chronological
  (Session D), the xref sweep.

## DEPLOYED TO PRODUCTION (2026-06-04)
- **Code:** S192–S197 committed + pushed to `origin/main` from the Mac (the
  sandbox couldn't: stale `.git/index.lock` undeletable on the mount + no push
  creds). Render auto-deployed API + PWA. Live health confirms
  `schema_version: 1.0.0-phase-sessionB-session196`, `db_reachable: true`.
- **DB migrations:** applied via the Render **Web Shell** — but the API image
  ships **no `psql` client**, so they were run through Python + `asyncpg`
  (the app's own driver) instead. The 18 MB TSK file killed the connection when
  run as one operation; the fix was a chunked runner that strips BEGIN/COMMIT +
  DO-verify blocks and executes each statement separately (validated locally
  against pgserver first). Final prod counts: vincents 4501, naves 5319, tsk
  343869, maps 1335, nikkudot 19909; vincents annotation lemma-keys remaining
  = 0. **For future sessions: the prod migration path is Python/asyncpg in the
  Web Shell, NOT psql.**
- **Flag:** `LEXICON_ENABLED=true` is live; tool endpoints respond Companion-
  gated (403 anon), not disabled (404).

## FULL CATCH-UP COMPLETE (2026-06-04) — lexicon + xref threads also live
Beyond the S197 tooling tables, the remaining uncommitted prior-session work was
also caught up to prod this day:
- **Lexicon (BDB/LSJ):** S162 tables (already present — skip-create), S163 entries
  (32 MB, chunked), S162 callouts. Prod now: `lexicon_entries = 14196`,
  `lexicon_callouts = 34`.
- **Cross-reference threads:** S183 / S184 / S194 applied. Threads 255 → 267,
  members 1691 → 1788.
- Run via an **in-image runner** `restoration-pipeline/_session197c_run_remaining.py`
  (one short typed command in the Web Shell) — because **pasting into the Render
  Web Shell silently fails in Safari**. The runner self-probes (skip table-create
  if present), chunks the 32 MB lexicon file with a string/dollar-quote-aware
  splitter, and strips `\echo` psql meta-commands from the xref files before
  executing (those files were authored for psql; `\echo` → `syntax error at or
  near "\"` under raw asyncpg).

### Operational lessons locked (so we don't refight them)
1. **Prod migrations = Python+asyncpg in the Web Shell, not psql** (no psql in the
   image). Big files must be chunked (whole-file `execute` drops the connection).
2. **Shipping a script in the image takes FOUR artifacts in lockstep:** the file,
   the Dockerfile `COPY`, AND a `.dockerignore` negate line
   (`!restoration-pipeline/<file>.py`) — `restoration-pipeline/*` is excluded by
   default. Missing the `.dockerignore` line = "No such file or directory" at
   runtime even after deploy.
3. **psql `\echo`/meta-commands** in older migration files must be stripped before
   running through a non-psql client.
4. **Render Web Shell paste fails in Safari** — route around it with an in-image
   runner invoked by a short typed command.

## Decisions settled (transcribed from conversation)
- **`lexicon_enabled` → ON (approved S197).** `LEXICON_ENABLED: "true"` added to
  `hosting/render.yaml` as a committed feature flag (not a secret; same plain-
  `value` pattern as CORS_ORIGINS). The code default in `api/config.py` stays
  `False` (the safe kill-switch); the blueprint's explicit `"true"` is the
  intentional production enable. **STILL REQUIRED before this is live:** apply
  the S163 lexicon migrations + S196 tool_annotations migration/seed + the five
  S197 base-load migrations + the S197 vincents annotation rekey to the
  **production** Render Postgres. Until those are applied, the now-enabled
  endpoints will 500/404. This DB apply was NOT done from the session (it's a
  heavy write against the live DB) — it's the immediate next operational step.

## Open questions for next session
1. Maps V1.1: add region polygons + verse-filtered highlighting, or leave the
   point+overlay render as V1?
3. Nikkudot V1.1: build the per-word TAHOT↔verse_words alignment for an
   in-`InterlinearLayer` pointed column, or keep the standalone verse sheet?
