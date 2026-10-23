Load my voice skill and mount my Desktop.

Read ~/Desktop/App/S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md (phase 1) and the S463b/S463c entries at the end of
~/Desktop/App/S446_SESSION_HANDOFF.md. 1 Enoch, Jubilees and the Apocrypha + 3 Maccabees are closed (S463c deployed — check the
handoff line says so; if not, the deploy paste is `bash ~/Desktop/App/_session463c_apocrypha_sweep_deploy.sh` and comes first).
This session is S463d: the Jasher card sweep, by the same chain (S463c is the template — its scripts are in
~/Desktop/App/source-texts/apocrypha-kjv-ebible/s463c-sweep/; S450 moved 20 Jasher cards off blob rows, the text was faithful).

The chain, in order:
1. Dump — write `_s463d_jasher_dump.py` from `_s463c_apoc_dump.py` (edition slug `jasher`; check the live slug and every column against
   data-schema/schema.sql before the paste). My shell can't reach Postgres; give me the paste and wait for the counts.
2. Map — regrade every card by content (adapt `s463c-sweep/regrade.py` + `regrade_members.py`; grade EVERY quotation in a note, not the
   first only); then the general map: quotes stand/off, degraded-prose markers AND hyphen-chain prose, database-slug citations, glosses on
   verses S450 changed (the 20 blob-row moves — check source-texts/jasher-*/ for what else changed), member-note quotes, thread summaries.
   Report the map in plain numbers, then build.
3. Build — one migration, Rule 10 (ids kept, skip if edited since the read-back, RAISE if live text differs or a rebuilt note doesn't quote it
   verbatim, idempotent). Come-and-See shape. Canon quotes from parsed/canon.json. English book names. Quotations across a verse boundary get a
   citation range, not a move.
4. Reads before anything is written to the Desktop — all three, every time: every gloss on a changed verse by content; every re-pointing cold
   by two agents that never saw the build; every rebuilt note cold against the voice skill (S463c's voice read caught modalism at the boat,
   Christ-as-Sophia, Matthew 15 as food law abolished, the woman of Canaan at "the limit of his sending"). Fix, re-test.
5. Scratch twice, post-run read-back by content (every quotation), report regenerated from the JSONs, deploy script that prints its own proof,
   handoff + roadmap table + decision log. Then the deploy paste. git push is mine — say so before I step away.

Open questions I still owe answers on (don't block on them): S463c's list in the handoff (pearl buyer 4549–4551, 4705, 4547, 12188, 10761,
Apocrypha misprints, Matthew 28:6); Jubilees 28948/28949 on 45:13; Jubilees 32:19 / 32:21 misprints; the S251 "The restored witness
carries…" openers.

Keep it general-to-specific, verify by content with the numbers shown, one file saved over the original, and wrap at the hard-stop signals
with everything transcribed into the handoff.
