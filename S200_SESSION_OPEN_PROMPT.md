# Next session — Session C: notes & bookmarks

Mount `~/Desktop`. Load **yoshi-voice**. Read `S199_CHECKPOINT.md` first (landed
state + the deploy/lock lessons; don't refight them). Xref sweep stays paused.

**Done and live (S199):** Maps rebuilt the right way — real public-domain world
map (Natural Earth) + worldwide scatter/gather arcs reaching the Americas + the
`maps/dispersion-overlay` framework band rewritten to the worldwide reading
(prophets quoted in full), applied to prod (`worldwide? : True`).

**The job: Session C — notes & bookmarks** (deferred through Sessions B). See
`APP_BUILDOUT_ROADMAP.md`. The `bookmarks` table + study-notes relaxation landed
back at S124 (`restoration-pipeline/_session124_apply_bookmarks_and_notes_v1.py`)
— check what's already in place before building. Scope the surfaces (add/open
note per verse, bookmark a verse/chapter, list view), tier-gating, and sync.

**Lessons locked (S199 — apply, don't relearn):**
- Frontend verify = `tsc -b` / `npm run build`, NOT `tsc --noEmit` (Render's build
  is stricter; the looser check missed an unused import and failed the deploy).
- Prod DB = Python+asyncpg via an in-image runner in the Render Web Shell (no psql;
  Safari paste fails). Shipping a runner = 4 artifacts (file + Dockerfile COPY +
  `.dockerignore` negate; SQL ships free via `COPY data-schema/`).
- Commit + push from the Mac only. Do NOT run index-touching git from the sandbox
  — it leaves an undeletable `.git/index.lock` that blocks the Mac.

**Carried backlog (V1.1, not this session unless asked):**
1. Maps tie-to-reader — tap a passage → highlight the `maps_places` it names.
2. Maps region polygons — `source-texts/maps-openbible/data/geometry.jsonl` (587).
3. Nikkudot — per-word TAHOT↔`verse_words` alignment vs. the standalone sheet.

Verify each change: frontend `tsc -b`; DB into local pgserver (`pgserver` wheel,
minimal prereq stand-in). Out of scope: chronological (Session D), xref sweep.

Also commit the pending doc edit: `S199_CHECKPOINT.md` (deploy record) +
`S200_SESSION_OPEN_PROMPT.md`.
