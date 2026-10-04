# S435–S438 handoff — Order of the End witnesses, card fixes, Enoch 91–93 (2026-10-03)

## Yoshi's decisions this session
- Approved: (1) push the card fixes live, (2) remove the 1 Thess 4:17 → Matthew 24:31 pairing, (3) rebuild Enoch 91–93 from Charles and republish the book.
- Daniel is studied only after the order of the end is settled, read fresh, not through Christian indoctrination. All Daniel cards that fuse the two events were flagged and left untouched.

## Ready but NOT yet live (database unreachable from Claude's sandbox)
Run in Terminal:  bash ~/Desktop/App/_session438_order_of_end_and_enoch_deploy.sh
- session435a — Tanakh cards into the settled order (Isaiah 25–27, Joel 2, Lev 23, Num 10/29, Micah 4, Zeph 1, Zech 13–14, Deut 30)
- session435b — NT/extras (1 Cor 15:52 "one last-trump event" split; 2 Thess 1–2; Matthew 13/24/25; John 5; Hebrews 11; Ascension of Isaiah 4)
- session436 — new witness cards: 1 Thess 4:16 → Isaiah 26:14, 26:20; 1 Thess 4:15 → 2 Esdras 13:24; 4:16 → 2 Esdras 13:49; Rev 20:7 → Isaiah 24:22; Rev 20:4 → Testament of Judah 25:1; Rev 11:18 and 20:12 → Testament of Benjamin 10:8; 2 Esdras 7:30 → Jeremiah 4:23; new thread "first resurrection of the righteous and the remnant kept" (Isaiah 26, 2 Esdras 13)
- session437 — deletes 1 Thess 4:17 → Matthew 24:31 (source session233 corrected in place)
- session438 — Enoch 91–93 rebuilt in place (verse ids kept; surplus rows deleted only if unreferenced)
Source migrations were corrected in place so a fresh rebuild matches.

## Witnesses for the 1 Thess 4:16–17 book (from the restored library)
- v16 (first resurrection of the righteous, remnant kept in the wrath): Isaiah 26:14, 19–21; Ezekiel 37:12–14; 2 Esdras 13:22–24, 48–50; 1 Enoch 51:1–5; Testament of Judah 25:1, 3–4; 2 Baruch 50:2
- The reign between (bound in the pit, visited after many days): Isaiah 24:21–23
- After the reign (all flesh dies, old silence, great resurrection, judgment): 2 Esdras 7:28–33; Jeremiah 4:23–26 (4:27 is the near setting — pattern only); Testament of Benjamin 10:6–9 (omit Charles's bracketed insertions); 2 Baruch 30:1–5; 1 Enoch 91:12–17 (weeks 8–10, now restored)
- v17: no OT/extra-canonical text names the catching-up after the reign; rests on 1 Thess 4:17 + Rev 11:12.

## Enoch Restored Names Edition — WIDER CORRUPTION FOUND
- Chs 91–93 contained invented/misplaced text (Charles 85 and 104 inside 91; 92 not Charles; 93 a made-up self-repeating "two ways" sermon; weeks 1–6 missing). Now rebuilt to Charles 1912 in: source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt (.pre-s438 backup), source-texts/parsed/enoch.json (.pre-s438), and ~/Desktop/docx claude finished/The-Book-of-Enoch-Restored-Names-Edition-REVISED.docx (master untouched). The KDP master and backup copy carry the defect.
- Chapter 94 also appears invented (23 verses ending in repeated "two ways" lines). The rest of the book is unaudited — a full chapter-by-chapter check against Charles 1912 is needed before republishing.
- 39 cross-reference cards (session250 on 92:1–14 and 93:2–9; session413 Testaments 89:1 → Enoch 91:1) were written against the invented text and no longer fit their verses — they need retiring or re-pointing. Old verse rows 92:6–8, 92:11–14 stay in the DB (referenced) and still show invented text until those cards are handled.
- Agent decisions to confirm: "the holy Lord" (91:7) rendered "the holy Yahuah (God)"; chapter 92/93 titles; Week 3/Week 7 identifications dropped from commentary; commentary blocks for 91–93 rewritten — need Yoshi's read.

## Open for Yoshi (one point each)
1. Isaiah 26:19 = first resurrection, John 5:28–29 = great resurrection (applied in cards — confirm)
2. ~~Matthew 25 sheep and goats — sifting of the gathered wheat, or judgment of the nations?~~ RESOLVED S440 (A)
3. ~~Jeremiah 30:7 — the great tribulation or the wrath?~~ RESOLVED S440 — the card stands: Jacob's trouble runs through the long tribulation and he is saved out of it at the coming
4. ~~Zechariah 14:5 "holy ones" — the seed or angels?~~ RESOLVED S440 (B)
5. ~~Ezekiel 37 — first resurrection or great resurrection (cards disagree)~~ RESOLVED S440 (C)
6. ~~Ascension of Isaiah 4:16 — saints descend with him (contradicts "none descend")~~ RESOLVED S440 (D)

## Housekeeping found
- 1 Thess 4:16–17 quotes in sessions 233/434 read "Yahuah (Lord)" but the restored canon now reads "Yahusha (Lord)" — needs a sweep.
- Sessions 143/155/156/222 notes say "the framework reads…"; session234 man-of-sin thread has a leaked "GUARD this with care" line.
- Stale draft SQL in scratch_xref_* folders still carry the old one-event reading — don't re-apply them.
- S439: the 435a–438 migrations were confirmed live in the database, but none bumped schema_version, so apps kept their cached content. session439_content_version_bump.sql fixes it (run _session439_refresh_apps.sh). Every future content migration must end with a schema_version bump.

## S440 — open questions settled; Ascension of Isaiah restored to the Ethiopic (2026-10-03)
Run in Terminal:  bash ~/Desktop/App/_session440_deploy.sh   (applies session440_order_of_end_open_questions_and_ascension_isaiah.sql; ends with schema_version bump to 1.0.0-phase4-session440)

### Yoshi's decisions of 2026-10-03
- A. Matthew 25:31-46 (sheep and goats) is the post-harvest sifting of the gathered wheat in the wilderness of the people (Ezekiel 20:35-38) — not a judgment of surviving nations for entry into the reign.
- B. The saints / holy ones who come with him (Zechariah 14:5; Jude 1:14; 1 Enoch 1:9) are the seed of promise, gathered and coming with him (rising up with him / out of the north into the land) — not angels, not souls coming down from heaven.
- C. Ezekiel 37 is the FIRST resurrection (graves opened, brought into the land; two houses one nation, David king — the reign). Revelation 11:11 borrows Ezekiel's words as a pattern for the great resurrection; not the same event. Revelation 11:12 is the first going-up to heaven (John 3:13).
- D. Ascension of Isaiah 4:16 "descend": keep the 1 Thess 4:16 pairing with a cautionary word — no other scripture has anyone coming down from the sky with him; the Ethiopic has yəwarrədu, so any insertion predates it (await an earlier Greek/Hebrew text). Read with the heights in the north (Isaiah 14:13; Psalm 48:2; 1 Enoch 77:3) it may be the gathered seed coming with him out of the north into the land (Jeremiah 3:18; 31:8) — possible, not settled. "Up" = going up to the land from any direction (Genesis 13:1; Luke 2:4), so Jeremiah 23:8 does not contradict.
- E. Ascension of Isaiah 4:17 and 9:9 are witnesses to 1 Thessalonians 4:17 (the catching-up after the reign).
- F. Ascension of Isaiah text: where Charles altered the Ethiopic, the Ethiopic goes in the text with a parenthetical naming Charles's reading (3:15 assembly / "the Christian Church"; 4:14 three hundred and thirty-two days / Charles's inserted "one thousand"; 4:15 "the sun will be ashamed" kept, note on Charles's bracket; 4:18 not marked in the edition, left as is).

### What changed
- 57 card notes, 37 thread member notes, 22 thread titles/summaries rewritten; thread slug `sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory` kept, retitled "The Sheep Divided From The Goats — The Gathered Sifted At The Throne Of His Glory"; the session156 Wisdom of Solomon thread retitled likewise.
- New cards: Revelation 11:12 -> John 3:13 (free); 1 Thessalonians 4:17 -> Ascension of Isaiah 4:17 and 9:9 (extras).
- Ascension of Isaiah 3:15, 4:14, 4:15 updated in source-texts/ascension-isaiah/ascension-isaiah-restored.txt, source-texts/parsed/ascension-isaiah.json and the DB (in place, ids kept).
- 24 source migrations corrected in place (backups *.pre-s440) so a fresh rebuild matches.

### Still open / found
- Ascension of Isaiah 9:8 and 9:9 carry identical text (also in _charles1900_raw.md) — 9:8 likely needs Charles's own 9:8 line; not changed.
- Ascension of Isaiah 9:9 (Enoch already "in the seventh heaven") and Revelation 11:12 -> 2 Kings 2:11 (Elijah "went up into heaven") sit uneasily beside John 3:13 / "Revelation 11:12 is the first going-up" — need Yoshi's word.
- Ascension of Isaiah 4:14 -> Revelation 19:14 card ("armies which were in heaven" = "armies of the holy ones from the seventh heaven") left as is; it pulls toward a descent from heaven.
- session110 has member rows for threads that were never created (dragnet..., take-up-the-cross..., millennial-reign-entry-criterion-for-the-surviving-nations...) — no DB effect; their old wording remains in the source file.
- No Ascension of Isaiah book (KDP docx) exists on the Desktop.

