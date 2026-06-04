# Next Session (B, part 2) — Render the tool surfaces

Mount `~/Desktop`. Load **yoshi-voice**. Read `S196_CHECKPOINT.md` first (it carries the
landed state + the open decisions). Xref sweep stays paused.

**Foundation is in (S196):** `tool_annotations` overlay (migration + API + `ToolAnnotationBand`),
Vincent's structured (`vincents-structured.json`), TSK distortion gate passed, attribution
screen live. This session = **render the surfaces** so each tool comes off "coming soon"
(rule: data loads AND surface renders).

1. **Word study — Vincent's panel.** Load `vincents-structured.json` → `vincents_entries` table
   + endpoint; render the verse-keyed exposition in/next to `LexiconSheet` with
   `ToolAnnotationBand tool="vincents"`. **Decide first:** annotation key = verse-level
   (`book.ch.v`) vs lemma — see checkpoint. Flip the §26 Vincent's stub.
2. **Interlinear + Nikkudot.** Add the Nikkudot sibling view from the on-disk pointed TAHOT;
   wire the `nikkudot/tetragrammaton` note. Flip the §20 stub.
3. **Nave's.** Load the 29,007-row CSV → table + endpoint; subordinate labeled topical sheet
   with the 4 `naves` overlays. Flip the §20 stub.
4. **Maps.** Own-tile render from `maps-openbible` coords + the dispersion/gathering overlay
   (`maps` rows seeded). Biggest lift — own tiles, not an atlas.
5. **TSK standalone tool.** Load `cross_references.txt` → table + endpoint; subordinate
   Reference-tools entry with the `sweep:<class>` overlays (gate already passed S196).

**Verify each:** load into local Postgres (use the `pgserver` pip wheel — no sudo in sandbox)
+ frontend `tsc`. **Out of scope:** notes/bookmarks (Session C), chronological (Session D), xref sweep.
