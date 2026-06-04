# S196 Checkpoint — Session B (tooling integration), part 1

Mounted `~/Desktop`, loaded yoshi-voice, read `APP_BUILDOUT_ROADMAP.md` +
`SOURCE_TEXT_INVENTORY.md` §III. Xref sweep stayed paused. This session built the
**annotation layer first** (the foundation every tool hooks into), structured Vincent's
OCR, ran the TSK distortion-class gate, and shipped the attribution screen — all with
on-disk verification. The heavier render-surfaces (word-study sheet, interlinear/Nikkudot,
Nave's, Maps tiles, the TSK standalone tool) are specified below for the next pass.

The governing rule held throughout: **a tool comes off "coming soon" only when its data
loads AND its surface renders.** Nothing below claims a tool is off-stub unless both are true.

---

## Landed + verified this session

### 1. Annotation layer — `tool_annotations` (the S194-locked overlay) ✅ DATA + API + RENDER HOOK
The generalized framework-correction overlay beside every PD tool base (the generalization
of `lexicon_callouts`, which stays the home for BDB/LSJ Strong's-number word callouts).

- **Migration** `data-schema/migrations/session196_tool_annotations.sql` (DDL) +
  `session196_tool_annotations_seed_v1.sql` (seed). Additive, idempotent (ON CONFLICT),
  verify blocks, schema_version → `1.0.0-phase-sessionB-session196`.
- **Schema:** `tool_annotations(tool, entry_key, term_display, conflict_summary,
  annotation_md, tier_required content_tier, red_lines_cited[], is_punch_list_only, …)`,
  UNIQUE(tool, entry_key). `is_punch_list_only=TRUE` = conflict logged but no live
  annotation yet (the surface renders only FALSE rows).
- **Seed:** 29 rows from §III conflict points — 18 live corrections (vincents ×5, naves ×4,
  tsk ×4, maps ×2, interlinear ×2, nikkudot ×1) + 11 punch-list index rows (bdb ×6, lsj ×5)
  pointing at their `lexicon_callouts` home.
- **API:** `GET /v1/tool-annotations/{tool}/{entry_key:path}` in `api/main.py` (+ `ToolAnnotation`
  / `ToolAnnotationsResponse` in `api/models.py`). Companion-tier gate, shared `lexicon_enabled`
  kill-switch, 1-day cache. Missing overlay = 200/null (fail-open; base renders alone).
- **Render hook:** `app/src/components/ToolAnnotationBand.tsx` (reusable "Framework reading"
  band, same purple-rule styling as the §26 lexicon callout) + `fetchToolAnnotation` +
  types in `app/src/lib/api.ts`.
- **VERIFIED:** loaded base `schema.sql` + both migrations into a real userland Postgres
  (`pgserver`) — table + verify blocks pass, 29 rows confirmed by `GROUP BY tool`,
  schema_version bumped. `api/main.py` + `api/models.py` `py_compile` clean. Frontend
  `tsc --noEmit` clean.

### 2. Vincent's Word Studies — structured ✅ DATA (prerequisite for word-study wiring)
- **Parser** `restoration-pipeline/_session196_structure_vincents.py` → 
  `source-texts/vincents-word-studies/vincents-structured.json` +
  `vincents-structured.stats.txt`.
- **4,501 verse-keyed entries, 0 key collisions, 21 books**, including every framework-
  load-bearing book (Matthew, Romans, 1 Corinthians [12:3 present], Galatians, Ephesians,
  Hebrews, 1 John, Revelation). entry_key = `book.chapter.verse:headword-slug`.
- Verse numbers ascend-validated per chapter; Romans correctly bounded to 16 chapters
  (an early pass bled Corinthians into "Romans ch.48" — fixed via base-name+ordinal header
  matching; the ascending-verse guard removed ~1,100 bare-number false positives).
- Greek is lossy OCR (e.g. Rom 10:4 `τέλος νόμου` → `riXo^ voixou`); the load-bearing field
  is the verse-keyed English exposition (the annotated-foil base). Provenance updated.
- **KNOWN GAPS (documented):** 2 Thessalonians, Titus, Philemon, 2/3 John, Jude (tiny
  single-chapter books whose OCR headers didn't resolve); Galatians (101) is light. A
  header-pattern refinement pass picks these up — does not block major-book wiring.

### 3. TSK distortion-class sweep — the pre-launch GATE ✅ (gate done; surface pending)
- **Sweep** `restoration-pipeline/_session196_tsk_distortion_sweep.py` over all **344,799
  pairs** → `outputs/S196_TSK_DISTORTION_SWEEP.md`.
- **Result confirms the roadmap empirically:** only **1.07% (3,688 pairs)** anchor on the
  four distortion classes — grace-vs-law (801), Jew/Gentile (1,148), church-as-Israel (1,102),
  Torah-as-curse (847). "The distortion is concentrated and knowable." Top chains by vote
  weight are the real distortion sites (e.g. `Gal.3.10→Deut.27.26`, `Eph.2.8→Rom.3.22-26`).
- Each class maps onto a seeded `tool_annotations` `sweep:<class>` row. **Gate satisfied:**
  stub already off the chapter-end surface (S195), distortion swept, overlay seeded. The
  standalone Reference-tools **surface render is the remaining step** before TSK is off-stub.

### 4. Attribution screen ✅ DATA + RENDER
- `app/src/routes/Attributions.tsx` at `/attributions`, registered in App.tsx pathname switch.
- Credits openbible.info (CC-BY), OpenStreetMap (ODbL), BradyStephenson (CC-BY), STEPBible
  (CC-BY), plus OpenScriptures/Vincent's (PD) and the TSK compilation. No tier gate.
- **VERIFIED:** frontend `tsc --noEmit` clean with the route wired.

---

## Remaining for the next Session-B pass (each: surface render = the off-stub gate)

The data for all of these is on disk (S195 gather) and, for the annotation overlay, seeded.
What remains is the **render surface** for each — the React component + API endpoint +
§20/§26 menu wiring that moves the stub to live.

- **Word study (BDB + LSJ already live; Vincent's)** — load `vincents-structured.json` into a
  `vincents_entries` table + a `/v1/vincents/{book}/{ch}/{v}` endpoint; add a Vincent's panel
  to `LexiconSheet` (or a sibling sheet) that renders the verse-keyed exposition with the
  `ToolAnnotationBand tool="vincents"` overlay. Reconcile the annotation entry_key convention
  with the structured corpus (annotations currently keyed `…:telos`/`:paidagogos` by lemma;
  the corpus keys by headword-slug — settle on verse-level `book.ch.v` lookup or re-key the
  5 vincents seed rows). Flip the §26 "Vincent's Word Studies" stub to live.
- **Interlinear + Nikkudot** — interlinear layer already exists (`InterlinearLayer`, `verse_words`,
  §28). Add the Nikkudot sibling view from the on-disk pointed TAHOT; wire the
  `ToolAnnotationBand tool="nikkudot" entry_key="tetragrammaton"` note. Flip the §20 Nikkudot stub.
- **Nave's** — load `naves-topical/NavesTopicalDictionary.csv` (29,007 rows) into a `naves_topical`
  table + endpoint; a subordinate, clearly-labeled topical sheet with the four `naves` annotation
  overlays. Flip the §20 Nave's stub.
- **Maps** — own-tile render from `maps-openbible/data/{ancient,modern}.jsonl` coords (probe done
  in §III: 1,341 ancient verse-indexed, 1,595 modern w/ lonlat) + the dispersion/gathering overlay
  (`maps` annotation rows seeded). New surface (no prior stub). Largest lift — own tile/canvas
  rendering, not a copyrighted atlas. Attribution screen already credits the sources.
- **TSK standalone tool** — load `tsk-cross-references/cross_references.txt` into a `tsk_pairs`
  table + endpoint; a standalone, visibly-subordinate Reference-tools entry rendering the chains
  with the `sweep:<class>` overlays. Gate already passed (see §3).

---

## Notes carried for continuity (transcribe-to-disk discipline)

- **entry_key reconciliation (open):** the `vincents` seed rows use lemma keys (`romans.10.4:telos`)
  while `vincents-structured.json` uses headword-slug keys (`romans.10.4:the-end-of-the-law…`).
  Decide at wire-time: simplest is a **verse-level** annotation lookup (`tool="vincents"`,
  `entry_key="romans.10.4"`) so the band attaches per verse regardless of which head-phrase the
  reader is on. If kept lemma-level, re-key the 5 vincents seed rows to match the corpus.
- **No sudo in the sandbox** — Postgres came from the `pgserver` pip wheel (userland binary). Use
  the same for any future load-verification; `pglast` is also installed for pure SQL-syntax checks.
- **lexicon_callouts vs tool_annotations:** kept separate by design. BDB/LSJ word callouts stay in
  `lexicon_callouts` (served by `/v1/lexicon`); `tool_annotations` is every other tool. The bdb/lsj
  rows in `tool_annotations` are punch-list INDEX rows only (is_punch_list_only=TRUE), so the program
  has one view without duplicating the 34 authored word callouts.
- **Out of scope (unchanged):** notes/bookmarks (Session C), chronological (Session D), the xref sweep.
