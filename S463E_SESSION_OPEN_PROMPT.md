Load my voice skill and mount my Desktop.

Read ~/Desktop/App/S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md (phase 1) and the S463c/S463d entries at the end of
~/Desktop/App/S446_SESSION_HANDOFF.md. 1 Enoch, Jubilees, the Apocrypha + 3 Maccabees and Jasher are all closed (S463d deployed
Oct 23 18:59 CDT; the git commit/push of the S463d files may still be pending — the paste is in the S463d handoff entry; do it first
if `git status` shows them).

This session is S463e: the pseudepigrapha editions — 2 Enoch, Testaments of the Twelve Patriarchs, Apocalypse of Abraham, Adam-Eve
(1-adam-eve / 2-adam-eve / adam-eve), Ascension of Isaiah — by the same chain. S463d is the template (scripts in
~/Desktop/App/source-texts/jasher-noah-1840/s463d-sweep/; dump script _s463d_jasher_dump.py). FIRST: confirm which Testaments XII
parse is live (S214 vs S413) and which edition slugs / book slugs each of these books sits under (query editions + books before any
dump; check every column against data-schema/schema.sql). One dump covering all of them; one migration per edition so a read-back
failure is isolated. My shell can't reach Postgres; give me the pastes and wait for the counts.

MODEL RULE (settled Oct 23, 19:40): run the drafting agents (rebuild writers, summary fixers), the gloss/stale reads and the two cold
address reads on Sonnet; run the VOICE reads (every rebuilt note, member note and summary against the voice skill) on Fable. Name the
model in each agent's output file (e.g. out/rebuild_00.sonnet.json, out/voice_00.fable.json) so the handoff shows who wrote what.
The mechanical steps (dump, regrade, map, packets, assemble, gen_sql, seed, scratch ×2, read-back) are scripts and model-independent.

The chain, in order: 1. Dump. 2. Map — regrade EVERY quotation (not the first), markers judged in the PROSE only (outside italics),
hyphen-chains minus number compounds, slug citations, glosses on any verse an earlier text fix changed, member notes, thread
summaries; report in plain numbers, then build. 3. Build — Rule 10, Come-and-See, canon quotes from parsed/canon.json, English book
names, range citations not moves for quotations across a verse boundary. 4. Reads — every gloss on a changed verse by content; every
re-pointing/re-citation cold by two agents that never saw the build; every rebuilt note cold against the voice skill. 5. Scratch twice,
post-run read-back grading every quotation, report from the JSONs, deploy script that prints its own proof, handoff + both roadmap
tables + decision log. Then the deploy paste(s). git push is mine — say so before I step away.

Open questions still owed (don't block): S463c list (pearl buyer 4549–4551, 4705, 4547, 12188, 10761, Apocrypha misprints,
Matthew 28:6); Jubilees 28948/28949 on 45:13; Jubilees 32:19 / 32:21 misprints; S251 "The restored witness carries…" openers;
S463d: Jasher misprints 51:50 "end Jacob" / 90:23 "Elazer", Jubilees 6:5 stray quote mark, flags 29191 / 38883 / 28104 / 31317 /
30591 / 39005.

Keep it general-to-specific, verify by content with the numbers shown, one file saved over the original, wrap at the hard-stop signals
with everything transcribed into the handoff.
