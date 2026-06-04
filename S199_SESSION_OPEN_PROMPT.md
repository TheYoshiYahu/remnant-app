# Next session — rebuild Maps the right way

Mount `~/Desktop`. Load **yoshi-voice**. Read `S197_CHECKPOINT.md` first (landed
state + the deploy/migration lessons; don't refight them).

**The job: rebuild the Maps surface.** The S197 version was pulled — it was a bare
point-cloud AND its dispersion/gathering overlay was theologically wrong (it
confined the scattering to the Assyrian/Babylonian exiles and the gathering to a
return to the old land, erasing the worldwide remnant — Texas included).

Get the doctrine on the page BEFORE drawing:
- Scattering is to **all nations, the four winds, the ends of the earth** —
  including across the sea to the Americas (Deuteronomy 28:64; Amos 9:9; Hosea 1:10).
- Gathering is **from the four corners and the islands of the sea** — the whole
  scattered house of all twelve tribes, the living remnant, brought home
  (Isaiah 11:11–12; Jeremiah 31:8–10; Ezekiel 37:21).

Build it on a **real public-domain world map** (Natural Earth, PD — own SVG, land
+ sea, recognizable; no copyrighted atlas plate). A whole-earth view where the
gathering visibly reaches the Americas, not a Mesopotamia round-trip.

Already in place:
- `maps_places` table loaded in prod (1,335 ancient places w/ coords) — reuse it.
- Surface is currently a "coming soon" stub in `App.tsx` (reference tools).
- `MapsSheet.tsx` exists but is wrong — replace its render.
- `tool_annotations` row `maps/dispersion-overlay` exists; rewrite its copy to the
  worldwide-gathering reading.

Open question to settle first: whole-earth standalone map, or tie it to the reader
(tap a passage → highlight the places/movement it names)?

Verify + deploy per S197_CHECKPOINT lessons (frontend = git push only; DB if needed
= Python+asyncpg in the Render Web Shell, chunk big files, paste fails in Safari).
Also commit the two leftover doc edits (S197_CHECKPOINT.md, S198/S199 prompts).
