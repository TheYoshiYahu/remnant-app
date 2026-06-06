# S203 — Session open prompt

Mount `~/Desktop`. Load yoshi-voice. Read `S202_LAYOUT_BUILD_NOTES.md` first
(it carries the S202 decisions including the Hebrew-divider abandonment),
then `APP_BUILDOUT_ROADMAP.md` (Session C section). This session's one job:
**nail down notes/bookmarks — the personal apparatus as a flagship feature
(Session C).** Don't refight what's settled.

## Settled — do NOT re-litigate

* **The botanical divider is THE divider.** Color-matched single asset
  (red pomegranates, full grapes) on a pure-#000 rounded plaque: invisible
  field on the dark reader, intentional dark band on parchment. Lives at the
  end-of-scripture seam of EVERY chapter of every book, both themes, always
  visible even with study aids hidden. Shipped in `c3e9c02`.
* **The Hebrew / aleph-bet divider idea is ABANDONED (Yoshi, S202).** Grok
  hallucinated the paleo-Hebrew; font renderings weren't the right forms;
  pictographic strips were cut clean from Yoshi's own chart and he still
  called it: "im abandoning the hebrew idea." Do NOT resurrect unless Yoshi
  raises it. Dead artifacts (unused `alephbet` variant in ReaderDivider.tsx,
  `divider-alephbet*.png` in `app/public/dividers/`) are cleanup-only.
* **One Commentary, all points.** The Basic/Deeper-Dive stack is REMOVED from
  the reader. Each chapter shows ONE comprehensive Commentary
  (`chapters.chapter_intro`), full white (no greyed text), sectioned (the
  renderer now handles `##` headings + `**bold**`). All 28 Matthew chapters
  consolidated (sources in `commentaries/merged/`), checker-verified against
  the Red Lines, and LIVE in prod via
  `restoration-pipeline/_session202_load_matthew_merged_commentary.py`
  (idempotent — edit a merged file + re-run to fix anything).
* **Standing voice rules from the S202 merge** (carry into ALL future
  commentary work): (1) the seed runs through the men — no foreign man ever
  converts into the seed; marriage-covenant absorption is the one door, for
  daughters; (2) the Formed came IN the flesh, not formed AT it — never
  "began at Bethlehem"; (3) Matthew = Joseph's legal-royal line (Mary's
  husband), Luke = Mary's line through Heli (Joseph as son-in-law);
  (4) the Trinity is approached as what the inherited view MISSES, in good
  faith — never argued down.
* **S127/S201 aesthetic locks**: techelet `#1A6FE5` divine-names-only;
  spectral blue `#0084FF` for apparatus/chrome; NO greyed-out text anywhere
  (border/box/tier-chip instead of opacity); serif substance / sans chrome.

## Open with (15-minute sweep, before the job)

1. Confirm `c3e9c02` + the canon.json sync commit reached `origin/main`.
2. Commit the stray `S202_LAYOUT_BUILD_NOTES.md` (holds the Hebrew-abandoned
   record) if Yoshi hasn't already.
3. Optional cleanup commit (from the Mac — the sandbox CANNOT delete files):
   remove `divider-alephbet*.png` + the unused `alephbet` variant +
   `_bot_*.png` scratch files from `app/public/dividers/`.
4. On-device check: divider in BOTH themes; Matthew commentary headers
   render sectioned (hard-refresh clears any cached pre-S202 chapter).
5. Optional content nit: restore the few secondary citations the merge
   pruned (e.g., Matthew 1 lost Acts 4:12 + 1 Corinthians 11:3 — their
   points survive via Philippians 2:9-11 + 1 Corinthians 15:28). Edit
   `commentaries/merged/matthew-1.md`, re-run the loader.

## The job — Session C: notes/bookmarks as the flagship

**Roadmap goal (locked S195):** "Notes, bookmarks, highlights, and saves
built into something genuinely better than the competition: organized,
searchable, taggable, exportable, synced across devices, survivable. This is
a conversion lever — treat it like a flagship feature, not a utility."

**What exists today (verified S202 close):** HighlightPicker (13-color
palette, 3 mark styles — live), BookmarkSheet + BookmarksIndex (basic),
NotesPanel (basic), all verse-anchored via the long-press VerseActionMenu.
What does NOT exist: tags, search, export, a unified home for the partner's
whole study apparatus.

**Build direction (confirm with Yoshi at open, then proof-first):**
1. **"My Study" home** — one surface holding ALL of a partner's notes,
   bookmarks, and highlights: grouped by book / date / color / tag, fast to
   scan, fast to jump back into the text from.
2. **Search** — across note text, bookmarked-verse text, and highlighted
   verses.
3. **Tags** (and/or folders — Yoshi's call) on notes + bookmarks.
4. **Export** — the partner's study notes as a clean document (markdown +
   PDF), verses quoted in full come-and-see style, sacred names intact.
5. **Survivability audit** — verify everything is server-persisted and
   survives sign-out / reinstall / new device; fix any local-only state.
6. **Proof before wiring** (earned discipline): mock the My Study surface +
   get Yoshi's sign-off BEFORE building it out.

**Questions for Yoshi at open:**
- Tags, folders, or both? Flat tags are cheapest and searchable.
- Export formats in priority order (PDF? markdown? both?). Share-card
  export of a single note (like the S171 xref share) — wanted now or later?
- Tier-gating: what's free vs Study Notes ($1.99) vs above? (The tier is
  literally NAMED for this apparatus — Session C is its value story.)
- Any limits on free tier (e.g., N notes / N bookmarks) as the conversion
  lever, or fully open and the flagship sells the paid tiers another way?

## Hard constraints (unchanged)

* Verify the frontend with `tsc -b` / `npm run build` — run them in
  `~/Desktop/App/app` (package.json lives in `app/`, NOT the repo root).
* Commit + push from the Mac only. NO index-touching git from the sandbox.
  `rm -f ~/Desktop/App/.git/index.lock` if a stale lock blocks it.
* The sandbox can WRITE/overwrite files but CANNOT DELETE them — all
  deletions happen from the Mac.
* Prod DB writes: loader scripts run from the Mac with the Render EXTERNAL
  Postgres URL (Yoshi's IP must be in Render's access allowlist), always
  `--dry-run` first.
* Sandbox egress is allowlisted: GitHub/raw reachable; most other hosts
  (wikimedia, ancient-hebrew.org, fonts.gstatic) are NOT. Files Yoshi drops
  in `~/Downloads` are the reliable hand-off for outside assets.

## Backlog (after Session C)

* **Maps rebuild** — full spec + doctrine guardrails in
  `NEXT_SESSION_MAPS_REBUILD_SPEC.md` (wilderness-and-sifting gathering, NOT
  a round-trip; proof render first). Then the regional atlas + the all-PD
  imagery library.
* **Timeline** — "most complete in existence," anchored to Yoshi's
  chronology. Open questions for Yoshi before building: own surface? exact
  span + spine?
* **Mark commentary consolidation** — the Matthew pattern is proven
  (merge minions → checker → idempotent loader). Next book when Yoshi calls
  it.
* **Cross-reference sweep** — still paused, not cancelled.
* **TSK** — late-integration as a standalone opt-in tool only; never back
  on the chapter-end surface.
