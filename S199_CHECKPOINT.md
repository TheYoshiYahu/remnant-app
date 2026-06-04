# S199 Checkpoint — Maps rebuilt the right way (worldwide scattering & gathering)

Mounted `~/Desktop`, loaded yoshi-voice, read `S197_CHECKPOINT.md` + the S198/S199
open prompts to verify true state. Xref sweep stayed paused.

## State verified at open (the open-prompt was stale; the files are truth)
The prompt pasted to open the session was the **S198** prompt ("apply migrations
to prod… the prod DB load was not done in-session"). Reading the files showed
that load **was** done during S198 — the "DEPLOYED TO PRODUCTION / FULL CATCH-UP
COMPLETE (2026-06-04)" sections in `S197_CHECKPOINT.md` record the prod row
counts (vincents 4501, naves 5319, tsk 343869, maps 1335, nikkudot 19909,
lexicon 14196, xref threads 267 / members 1788) and `LEXICON_ENABLED=true` live.
Prod could not be re-probed from the sandbox (egress doesn't reach
`api.bible.remnantofpromise.org`); the checkpoint counts stand as the record.
The real S199 job: **rebuild the Maps surface**, which S198 had pulled.

## Why the S197 Maps surface was pulled (the theology error)
The S197 render boxed the map to the Ancient Near East and drew the scattering as
only the Assyrian/Babylonian exile (Samaria→Nineveh, Jerusalem→Babylon) and the
gathering as a return to the old land. That **erases the worldwide remnant** —
the scattered seed across all nations, the living remnant everywhere (the Americas
included). It is the exact lie the framework exists to dismantle.

## Landed this session (all verified)

### Doctrine on the page first — `maps/dispersion-overlay` framework band rewritten
`data-schema/migrations/session199_maps_overlay_rewrite.sql` — idempotent
`INSERT … ON CONFLICT (tool, entry_key) DO UPDATE` rewriting the overlay copy to
the worldwide reading, with the prophets **quoted in full** (come-and-see:
quote-don't-cite, Sacred Names restored, source-echo parentheticals):
- Scattering — to all nations, the four winds, the ends of the earth:
  Deuteronomy 28:64, Amos 9:9, Hosea 1:10.
- Gathering — from the four corners and the islands of the sea, the whole house
  of all twelve tribes: Isaiah 11:11-12, Jeremiah 31:8-10, Ezekiel 37:21.
- Closes on the second recovery — the paternal blood remnant of all twelve
  tribes gathered from the isles, the four corners, the ends of the earth.
- Red Lines cited: #1, #3, #7. Verse text pulled from the local KJV USFX
  (`source-texts/kjv/eng-kjv_usfx.xml`), not recited from memory.

### Real public-domain whole-earth base map
`app/src/components/worldGeometry.ts` — generated from the Natural Earth 1:110m
admin-0 dataset (public domain, via the geopandas-bundled shapefile read with
pure-Python pyshp — no GDAL, no URL fetch). Radial-distance simplified (0.6px),
284 polygons, equirectangular projection, ~119 KB. Land + sea, recognizable
continents incl. the Americas. Our own SVG; no copyrighted atlas plate.

### MapsSheet rebuilt
`app/src/components/MapsSheet.tsx` replaced. Whole-earth view (viewBox crops the
empty polar bands), `maps_places` (1,335 ancient places) plotted as the faint
homeland cluster over the Levant, "the land" marked at Jerusalem, and curved
scattering (red, outward) + gathering (green, homeward) arcs fanning to every
inhabited continent — North & South America, the western isles, the north
country, Africa, South/East Asia, Australia, the far isles. Independent
Scattering / Gathering toggles. The rewritten `ToolAnnotationBand` carries the
doctrine above the map.

### App wiring flipped back live
`app/src/App.tsx` — the Maps reference-tool item, reverted to a "coming soon"
stub when the surface was pulled, is back to a live Companion+ menu item calling
`onMaps` (the `MapsSheet` mount + `mapsOpen`/`onMaps` plumbing were never
removed). Below Companion it falls back to the tier-locked stub.

### Verification (all green)
- **Frontend:** `app/` `tsc --noEmit` clean (exit 0).
- **DB:** `restoration-pipeline/_session199_verify_overlay.py` boots a userland
  pgserver, applies prereq + S196 table + S196 seed + the S199 rewrite, asserts
  one live `maps/dispersion-overlay` row carrying all worldwide phrases + the
  nine quoted prophets, the old "back from them" framing gone, red lines intact
  → **PASS**.
- **Visual:** rendered the world path and the overlay arcs to PNG and eyeballed
  them — recognizable continents; arcs visibly reach the Americas (not a
  Mesopotamia round-trip).

## Decision settled this session (transcribed)
- **S199 open question — whole-earth standalone vs. tie-to-reader.** Settled:
  **whole-earth standalone for the rebuild** (the doctrinally load-bearing core —
  show the worldwide scattering and gathering on a real world map). Yoshi gave
  "no preference" / "your call" and asked me to verify state and drive.
  **Deferred (next V1.1):** tie-to-reader — tap a passage → highlight the
  places/movement that passage names (uses `maps_places` + the verse text).

## Production apply — REQUIRED before the rebuild is correct in prod
The frontend (world map + arcs) ships via git push and is correct on its own, but
the **framework band copy comes from the DB**. Until S199 is applied to prod, the
band shows the OLD (wrong, ANE-confined) copy. Per the proven S197 path (no psql
in the image; Render Web Shell paste fails in Safari → short typed command to an
in-image runner):

1. Commit + push from the Mac (sandbox can't write `.git`). Render auto-deploys
   API + PWA. The new SQL ships via `COPY data-schema/`; the applier ships via the
   added Dockerfile COPY + `.dockerignore` negate.
2. After deploy, in the Render **Web Shell** on the API service, one typed line:

       python3 /restoration-pipeline/_session199_apply_overlay.py

   Idempotent (`ON CONFLICT DO UPDATE`); self-verifies the worldwide language.

## Files this session
New: `S199_SESSION_OPEN_PROMPT.md` (untracked), `S199_CHECKPOINT.md`,
`app/src/components/worldGeometry.ts`,
`data-schema/migrations/session199_maps_overlay_rewrite.sql`,
`restoration-pipeline/_session199_apply_overlay.py` (ships in image),
`restoration-pipeline/_session199_verify_overlay.py` (local verify only).
Modified: `app/src/components/MapsSheet.tsx`, `app/src/App.tsx`,
`api/Dockerfile`, `.dockerignore`.

## Operational lessons (unchanged, re-confirmed)
1. Prod migrations = Python+asyncpg in the Web Shell, not psql (no psql in image).
2. Shipping a script in the image = FOUR artifacts: the file, the Dockerfile
   `COPY`, AND a `.dockerignore` negate line (`restoration-pipeline/*` excluded by
   default). The SQL itself ships free via the existing `COPY data-schema/`.
3. Render Web Shell paste fails in Safari → in-image runner + short typed command.
4. Sandbox can't write `.git` (object unlink "Operation not permitted") and has no
   push creds → commit + push from the Mac.

## Open for next session
1. **Maps V1.1 — tie-to-reader:** tap a passage → highlight the `maps_places`
   named in that verse + the movement it implies. (Deferred from S199.)
2. **Maps V1.1 — region polygons:** `source-texts/maps-openbible/data/geometry.jsonl`
   (587 regions w/ boundary polygons) is available if territorial shading is wanted.
3. **Nikkudot V1.1:** per-word TAHOT↔`verse_words` alignment for an in-interlinear
   pointed column, or keep the standalone verse sheet. (Carried, unstarted.)
4. **Session C — notes/bookmarks** (deferred through Sessions B). See
   `APP_BUILDOUT_ROADMAP.md`.
Out of scope (unchanged): chronological (Session D), the xref sweep.
