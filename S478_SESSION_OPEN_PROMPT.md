# S478 — open prompt

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1, not Opus.

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md — phase 1 status table and the decision log (S477 lines at the end).
2. The S477 entry at the end of ~/Desktop/App/S446_SESSION_HANDOFF.md.

S477 state: the text lane for Charles adam-eve (784, 312 → 141 vv) and 4 Maccabees (789, 467 → 247 vv) is BUILT and scratch-clean
(PGlite ×2). Confirm first whether `_session477_text_lane_deploy.sh` has been run (the handoff says if it was; `_session477_text_lane_deploy.log`
is gitignored). If NOT deployed: give me the paste, wait for the read-back lines (141/141, 247/247, 533/533, 112/112, 0 dup pairs), then the
audio remap paste (`node _s477_audio_remap.mjs` → `node _s444_upload_audio.mjs`). Only then:

THIS SESSION, in order:
1. SWEEP of the two books by the S463e chain (template: source-texts/pseudepigrapha-charles-vol2/s463e-sweep/; dump `_s463e_pseud_dump.py`
   to a fresh pseud-cards-live.json — the live text is now the merged one): regrade every quotation and the degraded prose on the 533 cards
   (s477-text-lane/s477_cards_map.json has the old→new addresses; the 5 known RE_ANCHOR cards 4450, 4859, 4860, 4875, 4876 quote a verse other
   than their anchor; prose citations of the old numbering inside notes/summaries are now stale — fix by the map) → general map first → I decide
   → build (one migration for the pseudepigrapha edition) → scratch ×2 → deploy script that prints its own proof → read-back → status table.
   MODEL RULE: Sonnet drafters + cold reads, Fable voice reads, model named in each output file.
2. Then S463f: Cepher additions + Sonnini (confirm edition/book slugs with a query first).
3. Audio re-record of the two books is LAST (voices lane): `node _s477_audio_redo.mjs` → record_bible.sh per voice → upload.
Every session closes by updating the status table in XREF_LIBRARY_COVERAGE_ROADMAP.md and a dated line in S446_SESSION_HANDOFF.md.
My shell can't reach Postgres from Claude; give me the pastes and wait for the counts. git push is mine — say so before I step away.
Deploy logs (*.log) are gitignored — never put them in a git add line.

Open questions owed (don't block): 4 Macc 4:1 missing its opening clause (text lane; needs the Wesley/Charles text); adam-eve 92:1 lost
period + OCR-dropped question marks; S463e — 49262 (holy ones of Asc. Isaiah 4:14 / Jude 1:14), 4743/4825/4739 "Gentiles = scattered seed"
hedges, 4872 loose fit, 45529 Isaiah 14:12; live misprints Asc. Isaiah 4:2 / 4:9, 1 Adam-Eve 23:9 / 42:8 / 46:8, 2 Adam-Eve 14:3. Plus the
S463b/c/d list in the S463E open prompt.

QUEUED after the sweep (not this session unless I say): Olivia splice; Sky + George bracket redo; male voice liam50_echo50; my own voice
(FREE ONLY — Kaggle/Colab free GPU, Intel Mac); Berean step 1b/2–5; extra-book people pass 2; blurb batches → passage guide;
print-shop edition (3-hole, by shelf) as a phase-4 output.
