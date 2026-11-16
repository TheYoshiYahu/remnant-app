# S506 — open prompt — FIRST the deploy state of S505; then the S502 sweep (7) and the abbreviations (264) if not yet deployed; then Phase 3 batch 1

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1 (judgment work; Sonnet only for first drafts and scripted steps, model named in every output file).

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/XREF_LIBRARY_COVERAGE_ROADMAP.md — the S505 entry at the end (what was built, what was and was not deployed, the git-add lesson).
2. ~/Desktop/App/_s503/out/sweep7_s505_read.md — the seven rewritten summaries (Yoshi reads these, three or four at a time, before each paste).
3. ~/Desktop/App/_s503/tools/ — the chain (build503c / gen_sql503c / check503c / gen_deploy503bc now re-dumps every anchor book; gen_sql505_abbrev +
   check505_abbrev; visits_report504; shorthand_census) and _s503/out/shorthand_census_2026-11-16.json (the Phase 3 worklist).
4. api/visits.py, api/db.py (upsert_user), app/src/lib/visit.ts, walk/build.mjs (WALK_JS) — only if the counter is not reporting.

STATE AT S505 CLOSE (Nov 16 ~00:30 CST): the counter code is pushed (last push 3 of 3 added the WALK 1 files the API needed to start). UNKNOWN at
close — ask Yoshi, one line each: (1) did Render's API come up green after the third push? (2) is ANON_SALT set in the api service's Environment?
(3) did `session504_visit_events.sql` apply? (4) did `session504_housekeeping.sql` run (after its --dry-run showed the six rows)? (5) did the
sweep7a / sweep7b / abbrev pastes run, and did every check line end PASS? If a deploy log exists, read it instead of asking:
`_session503_sweep7a_deploy.log`, `_session503_sweep7b_deploy.log`, `_session505_abbrev_deploy.log` in ~/Desktop/App.
FIRST CHECK the Mac-side shell: `df -h $HOME` — the volume was 100% full in S504 and S505 (not our folder); if still full, every DB step is a paste.
Once the API is up and the migration is in: `python3 ~/Desktop/App/_s503/tools/visits_report504.py` (paste) — the first rows prove the counter.

THIS SESSION, in order:
(a) DEPLOY STATE — the five questions above; fix whatever is red before anything else. If a sweep guard RAISED on Luke/Mark (built on Nov 14 dumps),
    re-dump (`python3 _s503/tools/dump503.py canon luke` / `canon mark`), rebuild with build503c <slug>, gen_sql503c, copy to data-schema/migrations,
    regenerate the paste, scratch in the sandbox (`service postgresql start`; the thread-only fixture pattern is in the S505 roadmap entry), re-paste.
    Open flag: the MUSTARD-SEED reading in 30901 (herb grown past its kind; Daniel 4 / Ezekiel 31 trees; Ezekiel 17 cedar still to come) — Yoshi
    only ruled leaven = corruption; if he wants the mustard seed neutral, rewrite that summary before sweep7a runs.
(b) PHASE 3 BATCH 1 — the member cards of the 13 S1xx threads whose summaries S503 rewrote (~230 cards; list + counts in the census .json):
    add a packet step to build503c (packet503 shape: card + both verses + the thread's NEW summary → Sonnet first draft → Fable reads every one),
    guard on "member of thread X with member note Y", UPDATE in place, one migration per thread (gen_sql503c already takes cards), Yoshi reads
    samples, three or four threads per paste. Then Luke's 340 `thread:` prefixes thread by thread (effort-over-accomplishment 40 first — 8 books).
(c) Close: XREF_LIBRARY_COVERAGE_ROADMAP.md, S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md, a dated line in S446_SESSION_HANDOFF.md, S507 open prompt.

Rules that bit in S495–S505, keep them: a `git add` list must carry every untracked file the listed files import (S505 took the API down for ~10
minutes); run the app's own build command (`tsc -b`) not `tsc --noEmit` before handing over a PWA push; canon quotations come from parsed/canon.json,
never the live modernised text (extras targets: the live text — Sirach 48:12 reads "Elias… Eliseus", not "Elisha"); a thread with a summary but 0
members gets FILLED, not duplicated; one scene is ONE thread; "It ain't new" is Yoshi's opener, never smoothed; the brief's instructions to the
drafter must not leak into the reader's prose; never "the King"; names in OT spellings; no Trinity words and no collapse — the one name is Yah
(HalleluYah); Daniel and Revelation separate, Daniel's *like* kept; the scratch proof lives in the sandbox and dies with it; deploy logs never in a
git add line; the git push is Yoshi's, and so is every Render dashboard click; Yoshi reads every thread summary before it deploys; batch summaries
three or four at a time; the widow of Zarephath, Naaman, the woman of Canaan and the centurion are seed REVEALED, never "individual mercy"; no
reading content is ever logged by the counter (S467's rule), no cookie, no IP. Pipeline flags still open: John 20:25 parsed vs live, Psalm 68:4
JAH, Isaiah 12:2 / 26:4 JEHOVAH, Luke 22:61 / 1 Cor 11:23, Isaiah 2:2 LORD'S.
