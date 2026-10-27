# S463e — pseudepigrapha editions card sweep (built S476, Oct 26 2026)

Eight clean books in one map, one migration per edition: 2 Enoch, Testaments of the Twelve Patriarchs, 2 Baruch, 3 Baruch
(edition `pseudepigrapha`); 1 Adam and Eve, 2 Adam and Eve (`adam-eve-conflict`); Apocalypse of Abraham; Ascension of Isaiah.
HELD for the text lane (line-end verse breaks in ~half the verses — fix text first, then sweep in one pass): Charles's
*Books of Adam and Eve* (`pseudepigrapha/adam-eve`, 241 cards) and 4 Maccabees (`pseudepigrapha/4-maccabees`, 292 cards).
3 Maccabees was closed in S463c.

## Which parse is live (the question the open prompt asked first)
The dump compared every live verse to the Desktop parsed JSON: 4,962 / 4,962 identical across the four editions. The live
Testaments XII is NOT the June pypdf parse S214 measured (515 verses, ~24 % missing); it is the Track B repair
(S410–S415, June 15): 142 chapters / 997 verses, chapter counts matching Charles's twelve testaments exactly
(7/9/19/26/7/10/7/9/8/8/20/12), 0 mid-sentence verse starts, 0 apparatus sigla. S413's cards were written against this text.
Nothing to re-parse. (Yoshi's 15:40 "fix the text first" was given before this was known; superseded at 15:50 — decision log.)

## Dump (Yoshi's paste, `_s463e_pseud_dump.py`, 15:40 CDT)
4,962 live verses; 4,120 cards touching the four editions (4,116 anchored; 4 mention-only); 4,115 member notes; 1,280 threads.
Anchored per book: 1 Adam-Eve 1,053 · Testaments XII 567 · 2 Baruch 470 · Apoc. Abraham 413 · 2 Enoch 334 (337 incl. 2 Enoch↔2 Enoch
other ends) · 2 Adam-Eve 324 · Asc. Isaiah 219 · 3 Baruch 117 · [held] 4 Macc 292, Charles Adam-Eve 241 · [closed] 3 Macc 86.

## Map (`regrade.py`, `regrade_members.py` — every quotation graded: italic extra-book quotes, prose phrase quotes, canon lead
quotes against canon.json; markers judged in the prose only; a new Testaments-numbering check)
| book | cards | rebuild | extra italic off | canon lead off | slug cites | stale T.XII cite | phrases to read | members flagged / off | threads flagged / off |
|---|---|---|---|---|---|---|---|---|---|
| 2 Enoch | 334 | 0 | 0 | 1 | 0 | – | 6 | 0 / 0 | 1 / 2 |
| Testaments XII | 567 | 32 | 17 | 11 | 0 | 8 | 51 | 33 / 20 | 2 / 0 |
| 2 Baruch | 470 | 8 | 2 | 10 | 0 | – | 2 | 7 / 4 | 1 / 1 |
| 3 Baruch | 117 | 0 | 0 | 2 | 0 | – | 0 | 0 / 0 | 0 / 2 |
| 1 Adam-Eve | 1,053 | 14 | 0 | 41 | 212 | – | 17 | 14 / 12 | 5 / 4 (+57 slug) |
| 2 Adam-Eve | 324 | 2 | 0 | 9 | 0 | – | 3 | 2 / 0 | 2 / 6 |
| Apoc. Abraham | 413 | 3 | 0 | 0 | 32 | – | 11 | 2 / 0 | 4 / 0 (+32 slug) |
| Asc. Isaiah | 219 | 15 | 4 | 10 | 0 | – | 5 | 16 / 4 | 2 / 0 |
| total | 3,497 | 74 | 23 | 84 | 244 | 8 | 97 | 74 / 40 | 17 / 15 |
Plus, found on the second pass: 78 thread summaries whose CANON quotations were off canon.json (45 of them 1 John 3:8 in the
KJV form where canon.json carries Yoshi's own rendering; the rest the S182 NT-Lord rule and ellipsis/bracket edits).
3,388 canon-first glosses (no extra-book italic) stand, as the Apocrypha's and Jasher's did.

## Build (Rule 10; Sonnet drafters, output files named `*.sonnet.json`; Fable voice readers, `*.fable.json`)
- 74 notes rebuilt Come-and-See (full live extra verse in italics, cited by the live numbering; the other verse from canon.json or
  the live extra; prose) — 5 of them re-pointed to the verse the old note described (4739 → T.XII 59:1 the star out of Jacob;
  4870 → 21:1 the gates of heaven; 4317 → Asc. Isaiah 3:13 Beliar's wrath; 4863 → T.XII 133:8; 4826 → 109:3).
- 84 canon lead quotations re-quoted from canon.json, prose kept (42 × 1 John 3:8 → Yoshi's rendering; NT-Lord rule on the rest).
- 76 phrase patches (quoted words in the prose corrected to the live wording), 8 re-pointed to the verse the words sit in.
- 7 address fixes: 4 stale Testaments citations → live numbering (177476/177477 "Benjamin 10:6" → 140:6–9; 177478 "Judah 25:1" →
  60:1; 4291 "Levi 2:6" → 18:6), 2 re-quoted, 1 moved (8025 → 100:1).
- 227 cards + 225 member notes + 48 summaries: "1-adam-eve 5:11" / "apocalypse-of-abraham 9:6" slugs → English book names.
- 467 member rows (74 on rebuilt cards; the identical ride-alongs; 5 rewritten; 2 address; 1 by hand), 154 summaries (32 rewritten
  for jargon/chains/off quotes, 78 canon re-quotes, 48 slug-only; 11212's "not race" line → paternal-seed wording).
- Testaments of the Twelve Patriarchs citations use the LIVE continuous numbering (1–142) with the patriarch named in the prose —
  "Gad tells his sons… (Testaments of the Twelve Patriarchs 100:2)". Old "Testament of Gad 2:2" cites were pre-Track-B numbering.

## Reads
- 22 address decisions (14 moves + 6 cite/re-quote fixes + the 2 phrase patches that changed what the quoted words said) read cold
  by two Sonnet agents that never saw the build: 22/22 AGREE, both. Caveats noted: 60205 blends 87:2's clause; 4872 loose fit.
- 77 rebuilt/hand-written notes + member notes voice-read by two Fable readers: 10 findings applied (4909 "until" read as law ending
  → length of the waiting; 4863 "the Gentiles" as the nations inside the covenant blood → scattered seed; 4826 "the Formed one" unfolded;
  4862 bare Leviticus cite dropped; 45631 "put in his mouth"; 46606 veneration gloss trimmed; 49262 reworded without ruling;
  60235 "God shall appear" → "Elohim (God)"; 4789 bare Matthew 27:51 cite; 49380 stray period). 32 summaries + 7 member notes
  voice-read by a third Fable reader: 11 findings applied (bare "the LORD"/"God" titles in prose; 14119 "gospel of the end" → kingdom;
  14811 / 14854 had no scripture quoted → quoted; 8018 / 50079 / 4340 member notes).

## Scratch (Postgres 16 in the container, seeded from the 15:40 read-back with full live text and ids)
Run 1: pseudepigrapha 113 in place / 8 moved / 118 member notes / 19 summaries; adam-eve-conflict 271 / 2 / 273 / 119;
apocalypse-of-abraham 41 / 2 / 42 / 5; ascension-isaiah 29 / 2 / 34 / 11 — 0 skipped, 0 absent. Run 2: 0 changed, 468 already landed.
Post-run read-back (`_s463e_check.py` on the scratch dump): cards 468/468, member notes 467/467, summaries 154/154; 134 extra-book
italic quotations all verbatim at their cited verse; canon lead quotations STAND 3,102 / off 0; 74/74 rebuilt notes carry the whole
live verse; 0 degraded markers, 0 hyphen-chains, 0 slug citations, 0 Hebrew book names, 0 stale Testaments cites, 0 duplicate pairs.
Guards tested: live text changed → RAISE + ROLLBACK (nothing lands); card moved since the read-back → skipped with NOTICE.

## For Yoshi (not blocking)
- 49262 (Asc. Isaiah 4:14 ↔ Jude 1:14): the old prose said the saints who come with him are the seed of promise, "not angels, and not
  souls come down from heaven"; the live verse says he comes "with His angels and with the armies of the holy ones from the seventh
  heaven". Rewritten to set the two witnesses side by side without ruling. Your reading of who the holy ones are?
- 4743 / 4825 / 4739 hedge "the Gentiles here are best read as the scattered seed" where the Testaments verse does not say so itself.
- 4872 (Levi 24:17 ↔ Matthew 27:52): loose fit, kept hedged — retire?  4862: Leviticus 21:10 named but not quoted.
- 45529 keeps Isaiah 14:12 as the fallen bright angel (chapter also addresses the king of Babylon) — confirm you hold it.
- Live-text misprints (text lane): Asc. Isaiah 4:2 "he will descent", 4:9 "And they greater number"; 1 Adam and Eve 23:9 editor's caps
  note + stray asterisk + "OUR Yahuah (God)"; 1 Adam and Eve 42:8 stray `***`; 46:8 "form them"; 2 Adam and Eve 14:3 "0 my son".
- Text lane next: Charles Adam-Eve (784) and 4 Maccabees (789) line-end verse breaks (52 % / 47 % of verses), then their sweep.
- 18 prose phrase quotes the grader still can't place (the readers judged them the canon side's words or spanning) stand.
- Older summaries use bare "Yahuah" in their own prose throughout (house style in this set; not changed).
