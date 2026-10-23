Load my voice skill and mount my Desktop.

Read ~/Desktop/App/S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md (phase 1) and the S463a/S463a2/S463b entries at the end of
~/Desktop/App/S446_SESSION_HANDOFF.md. 1 Enoch and Jubilees are closed and deployed. This session is S463c: the
Apocrypha + 3 Maccabees card sweep, by the same chain Jubilees used (S463b is the template — its scripts are in
~/Desktop/App/source-texts/jubilees-charles-1917/s463b-sweep/).

The chain, in order:
1. Dump — write `_s463c_apoc_dump.py` from `_s463b_jub_dump.py` (editions: apocrypha, apocrypha-charles-vol1, and
   3-maccabees-brenton-1851 — check the live edition slugs in the S457 dump pattern first). My shell can't reach
   Postgres; give me the paste and wait for the counts.
2. Map — regrade every card by content (adapt `s463b-sweep/regrade.py`); then the general map first: quotes
   stand/off, degraded-prose markers AND hyphen-chain prose (the markers missed 19 in Jubilees), glosses on verses
   S454 changed (S454 moved 12; the chapter-rule glyph cleanup is already live — check what else changed in
   source-texts/apocrypha-*/), member-note quotes, thread summaries. Report the map to me in plain numbers, then build.
3. Build — one migration, Rule 10 (ids kept, skip if edited since the read-back, RAISE if live text differs or a
   rebuilt note doesn't quote it verbatim, idempotent). Rebuilt notes in the Come-and-See shape (full live verse in
   italics, cited; the other verse the same; then prose). Canon quotes from parsed/canon.json. English book names.
   Pre-existing quotations that run across a verse boundary get a citation range, not a move.
4. Reads before anything is written to the Desktop — all three, every time: every gloss on a changed verse read by
   content; every re-pointing read cold by two agents that never saw the build; every rebuilt note read cold against
   the voice skill (S463b's voice read caught the woman of Canaan written as a mercy case — Red Line #7 — that no
   regex would catch). Fix what they catch, re-test.
5. Scratch twice (seed from the read-back with full live text and card ids, run 1 lands everything, run 2 changes
   nothing), post-run read-back by content, report regenerated from the JSONs, deploy script that runs its own
   read-back and prints the proof (apply_migration.py hides NOTICEs), handoff + roadmap table + decision log.
   Then give me the deploy paste. git push is mine — say so before I step away.

Also carried over from the S463a read-back (not Jubilees, not Enoch): cards 4556 (Wisdom 2:24), 4614 (2 Esdras
4:35), 4618 (2 Esdras 7:32) carry degraded prose — they are Apocrypha cards; include them. 4737 (Testaments XII) and
6985/7036/7053 (Luke→Matthew, canon-to-canon) are not this session's.

Open questions I still owe answers on (don't block on them): Jubilees 28948/28949 on 45:13 — earlier in ch. 45 or
retire; Jubilees 32:19 "Ana I shall give" and 32:21 "through- out" misprints — fix the text then re-quote 52853 and
thread 5683; the S251 extras-side cards that open "The restored witness carries…" — sweep or leave.

Keep it general-to-specific, verify by content with the numbers shown, one file saved over the original, and wrap at
the hard-stop signals with everything transcribed into the handoff.
