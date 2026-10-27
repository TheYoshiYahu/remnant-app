# S477 — open prompt

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1, not Opus.

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md — phase 1 status table and the decision log (S476 lines at the end).
2. The S476/S463e entry at the end of ~/Desktop/App/S446_SESSION_HANDOFF.md.

S476 CLOSED (Oct 26, deployed 19:05 CDT, pushed): the eight clean pseudepigrapha books swept — 2 Enoch, Testaments XII, 2–3 Baruch,
1–2 Adam-Eve, Apocalypse of Abraham, Ascension of Isaiah (468 cards, 467 member notes, 154 summaries, read-back 0 flagged).
Live Testaments XII is the Track B repair — clean, no re-parse needed.

THIS SESSION, in order:
1. TEXT LANE: Charles's Books of Adam and Eve (pseudepigrapha/adam-eve, book 784, 94 ch / 312 vv) and 4 Maccabees (789, 18 ch / 467 vv) —
   about half their verses break mid-sentence at line ends (Track B kept line breaks as verse breaks). Measure first, then merge the
   broken verses back into whole sentences against Charles 1913 vol. 2 (source .md files in source-texts/pseudepigrapha-charles-vol2/),
   keep the chapter numbering, renumber verses, save over parsed/pseudepigrapha-charles-vol2.json (backup .pre-s477), Rule 10 migration
   that re-points the 241 + 292 cards and their thread anchors by content (old text traced into the new verse — S463a rule: two cold reads
   of every move), scratch ×2, deploy script that prints its own proof. Audio for those two books is re-recorded LAST, if any exists.
2. Then their card sweep by the S463e chain (source-texts/pseudepigrapha-charles-vol2/s463e-sweep/ is the template; dump
   _s463e_pseud_dump.py; MODEL RULE: Sonnet drafters + cold reads, Fable voice reads, model named in each output file).
3. Then S463f: Cepher additions + Sonnini (confirm edition/book slugs with a query first).
Every session closes by updating the status table in XREF_LIBRARY_COVERAGE_ROADMAP.md and a dated line in S446_SESSION_HANDOFF.md.
My shell can't reach Postgres from Claude; give me the pastes and wait for the counts. git push is mine — say so before I step away.
Deploy logs (*.log) are gitignored — never put them in a git add line.

Open questions owed (don't block): S463e — 49262 (who are the holy ones of Asc. Isaiah 4:14 / Jude 1:14), 4743/4825/4739 "Gentiles =
scattered seed" hedges, 4872 loose fit, 45529 Isaiah 14:12; live misprints Asc. Isaiah 4:2 / 4:9, 1 Adam-Eve 23:9 / 42:8 / 46:8,
2 Adam-Eve 14:3. Plus the S463b/c/d list in the S463E open prompt.

QUEUED after the sweep (not this session unless I say): Olivia splice; Sky + George bracket redo; male voice liam50_echo50; my own voice
(FREE ONLY — Kaggle/Colab free GPU, Intel Mac); Berean step 1b/2–5; extra-book people pass 2; blurb batches → passage guide;
print-shop edition (3-hole, by shelf) as a phase-4 output.
