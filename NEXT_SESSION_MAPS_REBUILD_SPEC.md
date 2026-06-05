# Next session — Maps rebuilt as a REAL map (+ a separate Timeline)

## Verdict (Yoshi, S201 close)
The S199 Maps surface is NOT a viable product. It is abstract arcs —
"lines leaving and lines returning" — floating on bare land geometry.
That is a diagram, not a map. The doctrine band underneath it is correct
(worldwide scattering & gathering, NOT a return to the old land; Red
Lines #1/#3/#7) and is KEPT. The VISUAL is what gets rebuilt.

Decision settled S201 (transcribed here per verbal-answers-transcribe):
**Rebuild Maps as a focused next session.** Not rushed at the end of the
app-fix session.

## What the real product is
1. **A real base map** — Azimuthal Equidistant / north-centered
   (flat-earth) layout, public domain. Two viable routes (pick at POC):
   - **(a) Our own vector map** — reproject Natural Earth (PD; already
     used in `app/src/components/worldGeometry.ts`) into AE/north-centered.
     Real coastlines + landmasses + lat/lon graticule + labels. Crisp,
     zoomable, fully controllable, easiest to layer data on. (Lead option.)
   - **(b) Gleason 1892 AE plate** — the actual PD "New Standard Map of
     the World" scan as a georeferenced backdrop. Most authentic flat-
     earth-map look; raster, fixed zoom detail. (Optional texture toggle.)
2. **Migration on the real map** — scattering (red, outward) and
   gathering (green, homeward) drawn between the TRUE coordinates of real
   places, reaching every inhabited part of the earth. Source: the
   `maps_places` table (1,335 ancient places w/ lon/lat, already live via
   `fetchMapsPlaces`). NOT abstract fans to arbitrary continent spots.
3. **Site images** — public-domain images of the actual sites pinned to
   their locations (marker → image popup). Source PD imagery (Wikimedia
   Commons PD, Library of Congress, etc.); verify license per image.
4. **Region polygons available** if territorial shading is wanted:
   `source-texts/maps-openbible/data/geometry.jsonl` (587 regions w/
   boundary polygons), noted in S199 checkpoint open items.

## THE BIG DIRECTION (Yoshi, S201) — the app is THE source, all public-domain
The maps are the first surface of a much larger goal: the app becomes the
self-contained SOURCE — scripture + geography + archaeology + lexicons +
timeline + IMAGERY — everything sourced from the public domain so it is
fully owned, freely distributable, and dependent on no one's rights. The
reader sees the evidence on the page beside the verse, not cited to go
find elsewhere (come-and-see in pictures: SHOW the thing, don't cite it).
This is also why PD matters strategically: the work BECOMES the source
others draw from, not a derivative renting someone's rights. (Aligns with
the voice-skill "proclaimer steps aside / the text speaks" posture.)

**Imagery wanted (examples Yoshi named):** clay pots / pottery, altars,
Mount Sinai (Jabal al-Lawz) in Arabia, artifacts, inscriptions, site
photos — pinned to the place / verse / section they ground.

**Public-domain sources (real, in volume):**
- Artifacts: Wikimedia Commons (PD), the Met Open Access (CC0), Library
  of Congress, Internet Archive, 19th-c. survey plates + museum catalogs.
- Sites & terrain: PD expedition photography; USGS / NASA imagery
  (US-government work = public domain).
- Maps: Natural Earth (PD) + PD historical plates (Gleason, surveys).

**Non-negotiable discipline:** every asset verified PUBLIC-DOMAIN with
provenance recorded (source, author, date, license). ONE copyrighted
image poisons the "it's all ours" claim. Structure = a provenance-tracked
PD media library / manifest, each image keyed to place / verse / section.
Same care as the keystore + the PD source-texts. Publish-then-edit: stand
up the library, wire the first sites + artifacts, ship, keep adding.

## CRITICAL doctrine correction (Yoshi, S201 — the round-trip is wrong)
The proof render (scatter from the land → regather straight back to the
land) is SCRIPTURALLY INACCURATE and must NOT be the model. Two errors:

1. **The gathering is not a direct return to the land — it is a second
   exodus through the WILDERNESS, and it SIFTS.** Ezekiel 20:34-38:
   gathered *out* of the nations *into the wilderness of the people*
   (v.35) → brought *under the rod* (v.37) → *the rebels purged out*
   (v.38) → only the purified remnant brought into the land / grafted to
   the fathers' root (Jer 31:31; Rom 11:24). A clean round-trip erases
   the wilderness, the rod, and the purge — it depicts a gathering with
   no sifting. NOT ALL WHO ARE GATHERED OUT ENTER IN.
2. **It is the SEED that gathers, not "all the earth."** The nations are
   not regathered to the land (that collapses Category 2 into Category 3
   — false inclusion in map form). The nations receive the priests in the
   reign; they do not migrate to the land.
3. **This-age gathering is largely an AWAKENING IN PLACE** — the
   scattered waking to covenant identity where they already are (the
   living remnant, the Americas included), not a present airlift to the
   Levant. Physical land-entry is the post-sifting, post-dreadful-day
   destination.

**Therefore the map must have STAGES, not a round-trip:**
scattered to all nations → gathered out into the wilderness of the
peoples → the sifting under the rod (some purged, not all pass) → the
purified remnant into the land / grafted to the fathers' root. The map
should TEACH the journey, not show a starburst out and back.

## SECTIONED regional maps — the second map layer (Yoshi, S201)
Beyond the worldwide AE scatter/gather map, the product needs a set of
ZOOMED-IN regional "section" maps — a real atlas of specific places and
movements, with route lines, key sites, and PD site photos. These zoom
down from the worldwide view OR stand as their own selectable set.

Section set (each = real PD regional base geography + route + sites + photos):
- **Egypt & Goshen** — where Israel dwelt before the exodus.
- **The Exodus & the Aqaba crossing** — out of Egypt, across the **Gulf
  of Aqaba** into **Midian / Arabia** (Nuweiba). NOT a crossing of the
  shallow Egyptian Sinai marshes.
- **Sinai in Arabia** — Jabal al-Lawz / Midian. FRAMEWORK-CRITICAL: the
  inherited atlas wrongly plants Sinai in the Egyptian Sinai Peninsula;
  scripture puts it in Arabia: *For this Hagar is mount Sinai in Arabia*
  (Galatians 4:25). The sectioned map CORRECTS the inherited cartography.
- **Assyria & the northern scattering** — the ten tribes carried off
  (the START of the worldwide dispersion, not its extent — keep
  consistent with the worldwide reading; do not imply the gathering is
  only a return from Assyria/Babylon).
- **Babylon & Judah's captivity** — Mesopotamia.
- **The land & the tribal allotments** — the twelve tribes.

Editorial rule: sectioned maps teach the RESTORED geography against the
inherited (wrong) atlas — the Aqaba/Arabia crossing and Sinai-in-Arabia
are the lead example. Same come-and-see posture: quote the verse on the
map (Galatians 4:25, Exodus route passages) rather than asserting.

## Doctrine guardrails (unchanged — keep the S199 band reading)
- Worldwide dispersion & gathering of the paternal blood remnant of ALL
  twelve tribes, from the four corners + the islands of the sea + the
  ends of the earth. The living remnant is everywhere (the Americas
  included). NOT an Assyrian/Babylonian-only exile, NOT a return to the
  old land only. Red Lines #1, #3, #7. Prophets quoted in full
  (come-and-see): Deut 28:64; Amos 9:9; Hosea 1:10; Isa 11:11-12;
  Jer 31:8-10; Ezek 37:21.
- Band copy already correct in
  `data-schema/migrations/session199_maps_overlay_rewrite.sql` (live in
  prod). Reuse it.

## How the build runs (earns trust after the S199 miss)
**Open with a PROOF render first.** A real AE base map + a handful of
real `maps_places` points + ONE scattering path + ONE gathering path +
ONE pinned site image → render to PNG, show Yoshi, get a yes/no BEFORE
building the full surface. No full build on faith.

## Separate deliverable — the Timeline
Yoshi: build a timeline, "the most complete one in existence," anchored
to HIS chronology (creation → scattering → gathering → the dreadful day
→ millennial reign), NOT a generic Ussher/Christian timeline. Source from
the LOCAL mirrors first (skill rule): his books (Desktop book-project
folders), the website mirror (`~/Desktop/Website/static-site/`), and the
teaching corpus (`~/Desktop/Teaching Corpus/youtube-transcripts/`).
Open question for next session: is the timeline its own app surface, and
what is its exact span + spine? Confirm with Yoshi before building.
(Note: the original S200 prompt had "chronological (Session D)" as out of
scope — Yoshi reprioritized it here. Owner's call.)

## Status of the thing that WAS the job (done this session)
- 66-book / TSK-gone bug FIXED. Root cause = bundled shell served frozen
  web code. Fixed: `capacitor.config.ts` now loads the live URL
  (`server.url = https://bible.remnantofpromise.org`); two more mount-time
  fetches (`loadInitialPosition`, `listNotes`) now await the native JWT.
  Committed `dbe96c1` (+ the config-2.xml stray-file deletion). New signed
  APK shipped to GitHub Releases. Verified working on Yoshi's phone.
- Going forward, web fixes reach the installed app via Render deploys —
  no rebuild. See `S201_REBUILD_STEPS.md`.
