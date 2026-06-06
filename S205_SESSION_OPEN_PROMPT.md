# S205 — The Kingdom (the two-stick pill)

Mount `~/Desktop`. Load yoshi-voice. Read `NEXT_SESSION_RED_PILL_SPEC.md`
FIRST (the "NEXT AFTER THIS — THE BLUE PILL: THE KINGDOM" section
carries everything settled), then `S204_BUILD_NOTES.md` for what the
Witness shipped. This session's one job: build the Kingdom.

## Settled — do NOT re-litigate
- The Witness is SHIPPED (S204/b/c): transfer-test engine, 33 cards /
  81 marked verses, four partner styles (red text default), default
  ON, chapter-end Witness card, citations in source-class register
  colors, show/hide pill label. Free forever.
- **Kingdom register: TWO-TONE — the existing metallic emerald +
  metallic gold joined in one pill** (the two sticks of Ezekiel
  37:15-22, one in his hand; emerald/gold = tanakh/nt source classes
  = "uniting the old and new testament" — Yoshi). Exact gradients in
  the spec; seam + border variant picked at proof.
- **No in-verse mark.** The Kingdom lives in the chrome toggle + card
  surfaces only (Yoshi, S204).
- The surface is already pill-generic: register prop on the card,
  --pill-*-variables in index.css, same schema/loader/checker
  pattern. The Kingdom needs only its variables, its curated set, and
  its own end-card explainer.

## Open questions for Yoshi at session open
1. The Kingdom's membership test (the Witness has the transfer test —
   what is the Kingdom's? Lean: every promise/prophecy/enactment of
   the gathering of the two houses — Ezekiel 37, Jeremiah 31, Hosea
   1-2, John 10:16, Romans 7, one-fold-one-shepherd).
2. Reader-facing name: "The Kingdom"? Pill label "Show the Kingdom"?
3. Surface shape with no in-verse mark: chapter-end card only, or
   also a standalone index/map of the gathering across the canon?
4. Tier: free as proclamation like the Witness? (Lean: free.)
5. V1 scope: full canon like the Witness, extras wave 2?
6. Seam + border pick (mock from S204 close: hard seam; border solid
   vs #2EFFA1→#FCECAF blend).

## The job — proof first (earned discipline)
1. Yoshi answers the six questions.
2. Proof render: the two-stick pill + ONE Kingdom card (lean: Ezekiel
   37:15-22 ↔ John 10:16, both quoted in full). Sign-off BEFORE
   schema or wiring.
3. Schema (`kingdom_verses` or shared overlay table — decide at
   build), --pill-kingdom-* CSS, toggle, end-card. Seed hand-curated
   starter set; checker gates EVERY entry (Red Line #11 is the heavy
   rail here: the gathering is the scattered house coming home —
   no false-inclusion leak, no spiritualized-Israel leak).
4. Loader from the Mac, dry-run first.

## Hard constraints (unchanged)
- `tsc -b` / `npm run build` in `~/Desktop/App/app` (package.json in
  app/, NOT repo root).
- Commit/push/delete from the Mac ONLY. Terminal blocks: COMMANDS
  ONLY — no comments, no parentheses.
- Prod DB: migrations/loaders from the Mac via api/apply_migration.py
  (--dry-run exists since S204), Yoshi's IP in Render allowlist.
- Stale `.git/index.lock` blocks commits: `rm -f .git/index.lock`.

## Backlog behind this
Witness wave 2 (`RED_PILL_SWEEP_WAVE2_CANDIDATES.md`, 149 candidates,
author + checker-gate) · Witness extras (1 Enoch 46-71) · Maps rebuild
(`NEXT_SESSION_MAPS_REBUILD_SPEC.md`) · Timeline · Mark commentary
consolidation · cross-reference sweep (paused — Yoshi noted John's
thin coverage S204; consider pulling forward).
