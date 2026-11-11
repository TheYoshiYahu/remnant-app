# S497 — open prompt — PHASE 2 continued: the Matthew card REBUILD, batch 2 (Matthew 8–13)

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1 (judgment work; Sonnet only for first drafts and scripted steps, model named in every output file).

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/XREF_LIBRARY_COVERAGE_ROADMAP.md — the S495 and S496 entries at the end (what landed, what is left).
2. ~/Desktop/App/_s495/out/matthew_orphan_map.md — the grade of every orphan card, thread proposals, DOCREF list, anchors (chapters 8–13 this time).
3. ~/Desktop/App/_s496/ref/BRIEF496_REBUILD.md + api/CHAPTER_END_CARD_CONTRACT.md — the voice rules and the card shape (both whole verses, Come-and-See).
4. ~/Desktop/App/_s496/tools/ — the UPDATE chain, proven on batch 1. It needs only `'b2': ('matthew', range(8, 14))` added to BATCHES in common496.py.
   Bundle for the sandbox: _s496 (tools, ref with schema.sql + apply_migration.py), _s495/tools, _s495/live/canon__matthew.json, _s495/parsed/canon.json.

STATE: batch 1 (Matthew 1–7) DEPLOYED Nov 10 22:21 CST, read-back PASS. Matthew orphans left 1,108 (8–28). Git: S496 committed locally on Yoshi's word; push is his.

THIS SESSION:
(a) RE-DUMP Matthew first (`python3 _s496/tools/dump496.py matthew _s495/live/canon__matthew.json` from ~/Desktop/App — one paste for Yoshi), then
    batch b2 = Matthew 8–13 (map counts 8:27, 9:38, 10:54, 11:27, 12:37, 13:65 = 248). Per card: note rewritten Come-and-See; member note; thread =
    the map's join where "sure", read the "medium" picks by content; new threads where the map says so (summary in Yoshi's voice, "It ain't new"
    where true); anchor the unanchored threads these cards touch; the reversed-pair dups: retire the orphan only if the other card is threaded
    and sound, else keep. Sonnet packets → Fable read → assemble → scratch ×2 + five tampers → Yoshi's deploy paste → read-back → close.
    Chapter 10 (54, the sending to the lost sheep) and 13 (65, the parables and the tares) carry the framework's weight — Fable reads every card there.
(b) Close: XREF_LIBRARY_COVERAGE_ROADMAP.md, S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md, a dated line in S446_SESSION_HANDOFF.md, S498 open prompt.

Rules that bit in S495/S496, keep them: canon quotations come from parsed/canon.json (restored-names KJV), never the live modernised text — no guard
compares a canon quote to live; a thread with a summary but 0 members gets FILLED, not duplicated; "It ain't new" is Yoshi's opener, never smoothed;
"the legend" is not how the library speaks of its own books; the scratch proof lives in the sandbox and dies with it — re-run scratch in the session
that deploys; deploy logs never in a git add line; the git push is Yoshi's.
