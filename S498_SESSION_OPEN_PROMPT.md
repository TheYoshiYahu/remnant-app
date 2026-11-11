# S498 — open prompt — PHASE 2 continued: the Matthew card REBUILD, batch 3 (Matthew 14–19)

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1 (judgment work; Sonnet only for first drafts and scripted steps, model named in every output file).

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/XREF_LIBRARY_COVERAGE_ROADMAP.md — the S496 and S497 entries at the end (what landed, what is left).
2. ~/Desktop/App/_s495/out/matthew_orphan_map.md — the grade of every orphan card, thread proposals, DOCREF list, anchors (chapters 14–19 this time).
3. ~/Desktop/App/_s496/ref/BRIEF496_REBUILD.md + api/CHAPTER_END_CARD_CONTRACT.md — the voice rules and the card shape (both whole verses, Come-and-See).
4. ~/Desktop/App/_s496/tools/ — the UPDATE chain, proven on batches 1–2. It needs only `'b3': ('matthew', range(14, 20))` added to BATCHES in common496.py (packet496 and precheck496 already take the batch).
   Bundle for the sandbox: _s496 (tools, ref with schema.sql + apply_migration.py), _s495/tools, _s495/live/canon__matthew.json, _s495/parsed/canon.json.

STATE: batches 1–2 (Matthew 1–13) DEPLOYED (Nov 10 22:21, Nov 11 00:28 CST), read-back PASS. Matthew orphans left 860 (14–28). Git: S496+S497 committed locally; push is Yoshi's.

THIS SESSION:
(a) RE-DUMP Matthew first (`python3 _s496/tools/dump496.py matthew _s495/live/canon__matthew.json` from ~/Desktop/App — one paste for Yoshi), then
    batch b3 = Matthew 14–19 (map counts 14:42, 15:41, 16:38, 17:51, 18:50, 19:72 = 294; consider splitting 14–16 / 17–19 if the read runs long). Per card: note rewritten Come-and-See; member note; thread =
    the map's join where "sure", read the "medium" picks by content; new threads where the map says so (summary in Yoshi's voice, "It ain't new"
    where true); anchor the unanchored threads these cards touch; the reversed-pair dups: retire the orphan only if the other card is threaded
    and sound, else keep. Sonnet packets → Fable read → assemble → scratch ×2 + five tampers → Yoshi's deploy paste → read-back → close.
    Chapter 15 (the woman of Canaan, the traditions of men, Isaiah 29) and 16 (the leaven, the keys, the Son of Adam coming) carry the framework's weight — Fable reads every card. Sonnet drafters in parallel, one per chapter, worked well in S497; the Mac-side sandbox cannot install asyncpg (its volume is full) so the dump and deploy are Yoshi's pastes.
(b) Close: XREF_LIBRARY_COVERAGE_ROADMAP.md, S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md, a dated line in S446_SESSION_HANDOFF.md, S499 open prompt.

Rules that bit in S495/S496, keep them: canon quotations come from parsed/canon.json (restored-names KJV), never the live modernised text — no guard
compares a canon quote to live; a thread with a summary but 0 members gets FILLED, not duplicated; "It ain't new" is Yoshi's opener, never smoothed;
"the legend" is not how the library speaks of its own books; the scratch proof lives in the sandbox and dies with it — re-run scratch in the session
that deploys; deploy logs never in a git add line; the git push is Yoshi's.
