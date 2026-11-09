# S496 — open prompt — PHASE 2 continued: the Matthew / Mark / Luke card REBUILD (batch 1)

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1 (judgment work; Sonnet only for first drafts and scripted steps, model named in every output file).

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/XREF_LIBRARY_COVERAGE_ROADMAP.md — the two S495 entries at the end (what landed, what is mapped).
2. ~/Desktop/App/_s495/out/matthew_orphan_map.md (and mark_/luke_) — the grade of every orphan card, the thread proposals, the DOCREF list, the 144 anchors.
3. ~/Desktop/App/_s495/BRIEF495_GAPFILL.md + api/CHAPTER_END_CARD_CONTRACT.md — the voice rules and the card shape (both whole verses, Come-and-See).
4. ~/Desktop/App/_s495/tools/ — the chain (assemble495 / gen_sql495 / seed495 / check495 / dump495 / gen_deploy495). It INSERTS new cards; the rebuild
   needs an UPDATE path (note rewritten in place, id kept, card added to a thread, thread anchored) — extend the chain, same guards, same scratch ×2.

STATE: Phase 2 gap fill DEPLOYED S495 (every chapter has a card). Live state still from the Nov 8 16:12 read-back (source-texts/_s495/live/) — re-dump
Matthew/Mark/Luke before building (one paste: `python3 _s495/tools/dump495.py matthew ...`, or `_s495_dump.py` for all 16). Git: clean at 340228b (S495 + retirements pushed).

THIS SESSION:
(a) Batch 1 of the Matthew rebuild — Matthew 1–7 (the map counts 1:49, 2:29, 3:17, 4:20, 5:22, 6:49, 7:14 orphan cards = 200). Per card: note rewritten
    Come-and-See (target verse whole from parsed/canon.json, Matthew verse whole from the live text, plain prose, no jargon/doc-refs/hyphen-chains);
    member note; thread = the map's join where it is "sure", read the "medium" picks by content, new threads where the map says so (summary in Yoshi's
    voice, "It ain't new" where true); anchor the unanchored threads these cards touch. The 59 reversed-pair dups: retire the orphan if the other card
    is threaded and sound, else keep the orphan and retire nothing without a read. Sonnet drafts in chapter packets → Fable read → chain → scratch ×2 →
    deploy paste + read-back. Yoshi decides the batch order after chapter 1 lands if he wants a different cut.
(b) DONE Nov 9 (commit 340228b, pushed): the four never-applied files retired and the 12 " 2.*" copies deleted — nothing left here. (Was: `git rm` the four never-applied files (session181_{romans,galatians,revelation}_xref_threads.sql, session154_matt_17_extras_
    cross_references.sql — superseded live by S219/S223/S224; Matt 17 keeps its one S260 card) and the 12 byte-identical " 2.*" copies in
    data-schema/migrations. Pastes are ready to write; nothing deleted until he says.)
(c) Close: XREF_LIBRARY_COVERAGE_ROADMAP.md, S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md, a dated line in S446_SESSION_HANDOFF.md, S497 open prompt.

Rules that bit in S495, keep them: canon quotations come from parsed/canon.json (restored-names KJV), never the live modernised text — no guard
compares a canon quote to live; a thread with a summary but 0 members gets FILLED, not duplicated; "It ain't new" is Yoshi's opener, never smoothed;
"the legend" is not how the library speaks of its own books; deploy logs never in a git add line; the git push is Yoshi's.
