# S502 — open prompt — PHASE 2 continued: the Mark + Luke orphan REBUILD (Mark 169, Luke 61) — the Matthew chain, two books

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1 (judgment work; Sonnet only for first drafts and scripted steps, model named in every output file).

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/XREF_LIBRARY_COVERAGE_ROADMAP.md — the S501 entry at the end (the Matthew rebuild closed; totals; what differs for Mark/Luke).
2. ~/Desktop/App/_s495/out/mark_orphan_map.md and luke_orphan_map.md — the grade of every orphan card, the `thread:slug |` prefixes, DOCREF lists, dups.
3. ~/Desktop/App/_s496/ref/BRIEF496_REBUILD.md + api/CHAPTER_END_CARD_CONTRACT.md — the voice rules and the card shape (both whole verses, Come-and-See).
4. ~/Desktop/App/_s496/tools/ — the UPDATE chain, proven on Matthew b1–b5. Bundle for the sandbox: _s496 (tools, ref incl. schema.sql + apply_migration.py,
   the yoshi-voice skill copied to ref/yoshi-voice), _s495/tools (common495, dump495), _s495/live/canon__mark.json + canon__luke.json, source-texts/parsed/canon.json,
   _s495/out/mark_orphan_map.json + luke_orphan_map.json.

STATE: Matthew rebuild b1–b5 DEPLOYED (last: Nov 14 13:24 CST), Matthew orphans 0. Git: S496–S501 committed locally? — check `git status`; push is Yoshi's.
Render's IP allowlist bit in S501 (Yoshi's IP had changed; the deploy failed at connect, nothing sent, re-run landed) — if a deploy fails at connect, that first.

THIS SESSION:
(a) RE-DUMP Mark AND Luke first (one paste for Yoshi: `cd ~/Desktop/App && python3 _s496/tools/dump496.py mark _s495/live/canon__mark.json && python3 _s496/tools/dump496.py luke _s495/live/canon__luke.json`;
    expect orphan 169 and 61). The Nov 9 dumps are stale.
(b) Make the chain two-book: add `'m1': ('mark', range(1, 17))` and `'l1': ('luke', range(1, 25))` to BATCHES in common496.py; packet496.py hard-codes
    `live/canon__matthew.json` and `map/matthew_orphan_map.json` — take the book from BATCHES; check gen_sql496 / seed496 / check496 / gen_deploy496 really key
    on `{book}_{batch}` (they are written to, but verify by running the chain through scratch). Strip the `thread:slug |` prefix off every old note (none of
    the 40 Mark / Luke slugs resolves to a live thread) and pass it to the drafter as the author's own thread hint beside the map's.
(c) Brief: rewrite the "Batch notes" section for Mark and Luke (the Matthew notes stay in git history). Weight: Mark 7 (the traditions of men, the Syrophenician
    — Lo-Ammi, the divorced house, *let the children first be filled*; see S499 in the roadmap), Mark 13 (Daniel and Revelation separate; 13:27 the gathering,
    13:32 the Son submits), Mark 14–15 (the cup, the trial's Psalm 110 + Daniel 7 *like*, the veil); Luke 1–2 (the horn of salvation to the house of David, the
    covenant with Abraham remembered, *a light to lighten the Gentiles* = Isaiah 42/49's scattered), Luke 4 (Isaiah 61 in Nazareth — Naaman and the widow are seed
    revealed, not outsiders), Luke 15 (the lost sheep, the prodigal = the divorced house coming home), Luke 21–24. Same rules: no "the King", Daniel and
    Revelation separate, names in their Old Testament spellings, "It ain't new" is Yoshi's opener.
(d) Drafters by block: Mark 1–4 / 5–8 / 9–12 / 13–16; Luke 1–8 / 9–16 / 17–24 (seven Sonnet drafters in parallel). Fable reads every card. Reversed-pair dups
    (4 Mark, 4 Luke, each against a Matthew card now threaded and sound): retire the Mark/Luke orphan only if the Matthew twin says the same thing — else keep.
    Assemble → scratch ×2 + five tampers (Postgres 16 in the sandbox: initdb, role s496/s496, db s496) → Yoshi's deploy paste → read-back → close.
(e) Close: XREF_LIBRARY_COVERAGE_ROADMAP.md (Mark + Luke totals; what is left of the orphan block: 24 stragglers), S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md,
    a dated line in S446_SESSION_HANDOFF.md, S503 open prompt (the 24 stragglers + the re-point pass (3675, 3815, 3806, 3912, 3913, 4009, 4109) + the summaries
    sweep's next items: the centurion thread, then the 14 S1xx threads anchored in S501 whose summaries are still jargon).

Rules that bit in S495–S501, keep them: canon quotations come from parsed/canon.json (restored-names KJV), never the live modernised text — no guard compares a
canon quote to live; a thread with a summary but 0 members gets FILLED, not duplicated; one scene is ONE thread (the map's sub-slugs collapse); "It ain't new" is
Yoshi's opener, never smoothed; the brief's instructions to the drafter ("keep the *like*", "says what it says", "nothing here fixes a date") must not leak into
the reader's prose — read for that; "the legend" is not how the library speaks of its own books; the scratch proof lives in the sandbox and dies with it — re-run
scratch in the session that deploys; deploy logs never in a git add line; the git push is Yoshi's.
