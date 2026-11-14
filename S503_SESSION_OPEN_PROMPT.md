# S503 — open prompt — PHASE 2 tail: the 24 stragglers, the re-point pass, the summaries sweep (centurion thread first)

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1 (judgment work; Sonnet only for first drafts and scripted steps, model named in every output file).

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/XREF_LIBRARY_COVERAGE_ROADMAP.md — the S502 entry at the end (the gospel orphan block closed: Matthew/Mark/Luke 0 orphans; what is left;
   the summaries-sweep list; the re-point list).
2. ~/Desktop/App/_s496/ref/BRIEF496_REBUILD.md (voice rules + card shape) and api/CHAPTER_END_CARD_CONTRACT.md.
3. ~/Desktop/App/_s496/tools/ — the two-book UPDATE chain (b1–b5 Matthew, m1 Mark, l1 Luke all deployed). ~/Desktop/App/_s496/tools/{build,gen_sql,
   scratch,check}_s499c.py + _s496/c15/ — the thread title/summary + member-note chain (proven on the Canaanite-woman thread, S499c).
   Sandbox bundle: _s496 (tools, ref incl. schema.sql + apply_migration.py, the yoshi-voice skill copied to ref/yoshi-voice), _s495/tools (common495,
   dump495), source-texts/parsed/canon.json, and the live read-backs you need (re-dump the books you touch first; dump496.py takes any canon book).

STATE: Mark m1 + Luke l1 DEPLOYED Nov 14 14:15/14:16 CST; S502 committed? — `git status` (S502 files are modified/untracked until Yoshi commits); push is
Yoshi's. Render's IP allowlist: if a deploy fails at connect, that first.

THIS SESSION, in order:
(a) THE 24 STRAGGLERS — the last orphan cards outside the gospels: Joshua 12, Revelation 6, Romans 3, 1 Thessalonians 2, Genesis / Ezekiel / 2 Esdras /
    2 Baruch 1 each (per the S495 maps; re-dump those books first and recount). Differences: no gospel threads to lean on; some targets are NOT canon
    (the chain's assemble496 refuses `t_ed != 'canon'` and seed/gen_sql's _lookup view is canon-only) — either extend the chain for extras targets
    (parsed_text already knows the other editions; the lookup view needs `e.slug` from the card) or write those few by hand in one small migration
    through the same guards. Decide by count after the re-dump. One batch, one deploy paste, read-back, 0 orphans in the whole library.
(b) THE RE-POINT PASS — cards whose old note meant 1 John but whose target is the gospel of John: 3675 (Matthew 19:16→John 2:3), 3815 (21:28→John 2:3),
    3806 (21:21→John 5:14), 3912 (22:40→John 4:7), 3913 (22:40→John 5:2), 4009 (24:9→John 2:18), 4109 (25:41→John 3:16). Yoshi decides each: re-point
    the target to 1 John (a target_verse_id UPDATE — the chain does not do this; new guard: the card still reads as written to the John verse) or leave
    it honest to John as written. Plus the two shorthand Matthew twins on the reversed pairs: 3013 (Matthew 26:64→Mark 14:62, "The Markan-parallel.")
    and 120012 (Matthew 6:14→Mark 11:25, no prose) — rewrite Come-and-See with the rebuild's compose_note shape.
(c) THE SUMMARIES SWEEP — on the `_s499c` chain, one thread at a time, Yoshi reads each before deploy: (1) the centurion thread matthew-8-many-from-
    east-and-west… ("Gentile soldier", "the believing stranger" — the S502 cards 7006/7007 read him as seed revealed); (2) the 14 S1xx threads anchored
    in S501 ("substantial-substance", "the King", "grid", "FRAMEWORK-MAJOR", slug in bold code); (3) the S502 list: matthew-3-fruits-meet-for-
    repentance-stones-to-abraham… (stones as nations grafted in), matthew-13-the-mustard-seed-the-leaven… (leaven as growth), both Luke 4 Nazareth
    threads ("individual mercy"), mark-7-the-corban-tradition… ("the King", "diagnostic"), gathering-of-the-scattered-twelve-tribes-in-sirach…,
    rich-man-and-lazaros-the-framework-honest-sheol… (slug says "framework" — slug kept, summary rewritten). Each summary: It ain't new where the
    older scripture already held it; stand-alone italic quotes with citations from parsed/canon.json; no jargon; Daniel and Revelation separate.
(d) Close: XREF_LIBRARY_COVERAGE_ROADMAP.md, S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md, a dated line in S446_SESSION_HANDOFF.md, S504 open prompt.

Rules that bit in S495–S502, keep them: canon quotations come from parsed/canon.json (restored-names KJV), never the live modernised text; a thread with a
summary but 0 members gets FILLED, not duplicated; one scene is ONE thread; "It ain't new" is Yoshi's opener, never smoothed; the brief's instructions to
the drafter ("keep the *like*", "says what it says", "in its own words", "line on line", "nothing here fixes a date") must not leak into the reader's prose —
read for that (S502: 4 of 10 corrections were that); never "the King"; names in OT spellings (Peter, John, Elijah — not Kefa, Yochanan, Eliyahu);
"the legend" is not how the library speaks of its own books; the scratch proof lives in the sandbox and dies with it — re-run scratch in the session that
deploys; deploy logs never in a git add line; the git push is Yoshi's. Drafters: tell them to read SKILL.md and framework-deep.md IN FULL — three of eight
in S502 admitted they skimmed; the cards held because the brief's batch notes carried the readings, so keep the batch notes thick.
