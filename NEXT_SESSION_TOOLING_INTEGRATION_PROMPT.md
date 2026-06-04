# Next Session (B) — Integrate the Tooling

Mount `~/Desktop`. Load **yoshi-voice**. Read `App/APP_BUILDOUT_ROADMAP.md` + `source-texts/SOURCE_TEXT_INVENTORY.md` §III. Xref sweep stays paused.

**All assets are on disk (S195 gather done).** This session wires them in. A tool leaves "coming soon" only when its data loads AND its surface renders.

1. **Annotation layer first** — build `tool_annotations(tool, entry_key, annotation_md, tier_required)`. Each tool stays an untouched base; our corrections live in the overlay. Seed it from the per-tool conflict points in §III.
2. **Word study** — BDB (Hebrew), LSJ + Vincent's (Greek/NT). Vincent's is raw OCR (`vincents-word-studies/`) — clean/structure it first.
3. **Interlinear + Nikkudot** — derive from on-disk STEPBible TAHOT/TAGNT.
4. **Nave's** — subordinate, labeled foil (`naves-topical/`).
5. **Maps** — render own tiles from openbible coords (`maps-openbible/`) + the dispersion/gathering overlay. Probe the JSON shape first.
6. **TSK** — standalone Reference-tools surface (already re-scoped). **Run the framework distortion sweep before it comes off stub.**
7. **Attribution screen** — openbible.info, OpenStreetMap, BradyStephenson, STEPBible.

**Out of scope:** notes/bookmarks (Session C), chronological (Session D), the xref sweep.
