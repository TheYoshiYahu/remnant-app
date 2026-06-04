# Next Session (B wrap / C open) — flip the switch, then notes/bookmarks

Mount `~/Desktop`. Load **yoshi-voice**. Read `S197_CHECKPOINT.md` first (landed
state + the three open decisions). Xref sweep stays paused.

**Foundation now in (S196 + S197):** the `tool_annotations` overlay, and all five
public-domain tool surfaces off "coming soon" — Vincent's (§26), Nikkudot (§20),
Nave's (§20), TSK standalone, and the own-tile Maps surface. Each: base table
loaded + Companion-gated endpoint + React sheet with the framework band, all
verified (Postgres load + py_compile + tsc).

**Settled S197:** `lexicon_enabled` is ON — `LEXICON_ENABLED: "true"` committed to
`hosting/render.yaml`. **First action this session:** apply the S163 + S196 +
five S197 migrations + the vincents rekey to the **production** Render Postgres
(apply order in `S197_CHECKPOINT.md`), then confirm the §26/§20 tools serve on
the live PWA. The flag is on but the prod DB load was not done in-session.

Decide first (carried open from S197):
1. Maps V1.1 scope — region polygons (`geometry.jsonl`) + verse-filtered place
   highlighting, or leave the point+overlay render as V1?
2. Nikkudot V1.1 — per-word TAHOT↔`verse_words` alignment for an in-interlinear
   pointed column, or keep the standalone verse sheet?

Then: **Session C — notes/bookmarks** (deferred through Sessions B). See
`APP_BUILDOUT_ROADMAP.md`.

Verify each change: load into local Postgres (`pgserver` pip wheel — no sudo;
the full `schema.sql` needs `pgcrypto` which the wheel lacks, so use the minimal
prereq stand-in in `restoration-pipeline/_session197_verify_load.py`) + frontend
`tsc`. Out of scope: chronological (Session D), xref sweep.
