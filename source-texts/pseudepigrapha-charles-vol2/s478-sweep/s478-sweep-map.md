# S478 — general map: sweep of Charles adam-eve (784) + 4 Maccabees (789) on the merged live text (Oct 27, 2026)

Dump: `pseud-cards-live.json` re-dumped post-S477-deploy (Oct 26 20:47 CDT; live 141 + 247 verses). Regrade: the S463e chain
(`regrade.py`, `regrade_members.py`, every quotation graded; markers in the prose only) plus a new `stale_cites.py` for the old
numbering inside prose (the S477 merge renumbered verses; cards were re-pointed by content, prose was not).

Scope: 533 cards (adam-eve 241 — all canon-first glosses; 4 Macc 292, 280 source / 12 target), 533 member rows (520 identical to
the card note), 112 anchored threads (72 cite the book in their summary).

## A. Own-book quotations in italics
- 4 Maccabees: 13 graded → 10 STAND, 2 RE_ANCHOR (4450, 4875 sit at 17:13, quote 17:12), 1 false positive (63499 quotes Deuteronomy).
- The 5 cards the deploy read-back flagged as quoting a verse other than their anchor — 4450, 4859, 4860, 4875, 4876 — are all
  S154-era framework cards (section B) and get rebuilt Come-and-See on the verse their words sit in: 4450/4875 → 17:12;
  4859 (quotes 17:15, cites "13:13", sits 17:13) → 17:15; 4860 (quotes the ransom sentence, sits 17:17) → 17:19; 4876 (quotes
  17:17 + the ransom sentence, sits 17:17) → stays 17:17 with the second quotation cited 17:19.
- adam-eve: no italic own-book quotations (all 241 are canon-first glosses that mention the book's words in prose).

## B. Degraded prose — 25 cards (4 Macc 22, adam-eve 3), 24 member rows, 4 threads
- 12 S154-era framework cards, full rebuild Come-and-See: 4448, 4449, 4450, 4451, 4452 (Matthew 10:20–28 ↔ 4 Macc 10, 15, 17),
  4858, 4859, 4860 (Matthew 26:39–46 ↔ 4 Macc 9, 17), 4873, 4874, 4875, 4876 (Matthew 27:42–50 ↔ 4 Macc 7, 15, 17). All carry
  "wisdom-stream / the framework reads / substance / verbal-anchor / Red Line # / S154" and hyphen-chains; 4448 and 4876 cite the
  book as "edition chapter 8, verses 4-5" / "Charles edition seq #13, verse 18" (old numbering in words); 4858 has a Hebrew book name.
- 7 hyphen-chain-only cards, phrase patch (sentence rewritten, nothing else touched): 63517 "the standing-before-kings-as-a-testimony",
  63524 "walking-in-his-ways", 63552 "laying-down-of-life", 63655 "resurrection-of-the-just", 69383 "sun-black-as-sackcloth",
  69405 "all-in-Adam-die / all-in-Messiah-made-alive", 69411 "do-not-separate-us".
- 6 cards + 2 threads flagged only on the word "substance" used as *the substance of which X is the shadow*: 63464, 63469, 63470
  (4 Macc 6:6 ↔ Hebrews 9:14, Isaiah 53:5/10), 63619, 63622, 63625 (17:19 ↔ Isaiah 53:5/12, Hebrews 9:14); threads 15727, 15755.
  → QUESTION 1 (below). Thread 17343 "the three lusts that are the substance of the world" — plain English, stands.
- Thread 15752 hyphen-chain "resurrection-of-the-just" → phrase patch.

## C. Old-numbering citations in prose (the S477 renumbering)
- Cards, certainly stale (verse number no longer exists, or the card's own old address) — 15 + 3 ranges, mapped by `s477_map.json`:
  4858 "6:29"→6:6, 4860 "13:18"→17:19 (in rebuild); 69292 1:3→1:1, 69302 4:2→4:1, 69336 19:3→19:1, 69358 26:4→26:2,
  69433/69434/69435/69436 56:2→56:1, 69442 "57:3-58:3"→57:1–58:1, 69444/69445 58:3→58:1, 69446 57:3→57:1, 69451 64:3→64:1,
  69314 "9:1-2"→9:1, 69345 "22:2-3"→22:1–22:2. Member rows mirror these (same note).
- Cards whose note names a NEIGHBOUR verse (pre-existing, not the renumbering) — read by content, move where the note's whole point is
  the other verse (S463a rule: trace, read against both, then move): 69439, 69440, 69441 sit 58:1, name 59:1 (the devil's banishment);
  69452 sits 64:1, names 62:1 (Eve's pains); 69453/69454 sit 66:2/66:1, name 67:2/67:1 (Seth born; 800 years); 69317/69319/69320
  sit 12:1 but quote the words of 11:1/10:1 ("rule of the beasts", "fight with the image"). 9 cards → two cold address reads.
- Thread summaries: 56 threads, 89 citations (adam-eve 56, 4 Macc 33) re-cited to the verse the quoted words now sit in (quotation
  traced into the live text) or by the map where no words are quoted; 2 quotations no longer verbatim: thread 17332 *found Abel
  murdered by the hand of Cain* — live 3:1 reads "murdered. I by the hand" (OCR stray "I", text lane); thread 15734 *if compelled by
  necessity we yield to the king in fear... Ev* — the live 8:10/8:11 split; cite as a range.
- The remaining 29 card citations are the card's own current address (fine).

## D. Canon lead quotations vs canon.json — 3 re-quotes
- 69342 1 Thessalonians 4:16: card has *Yahuah (Lord) himself shall descend*; canon.json reads *Yahusha (Lord) himself shall descend* → re-quote.
- 63607 2 Timothy 4:8: *which Yahuah, the righteous judge* — missing the parenthetical / check against canon.json → re-quote verbatim.
- 69526 Revelation 14:13: quotation starts mid-verse ("Blessed are the dead…"); canon.json opens *And I heard a voice from heaven…* → re-quote the whole verse or mark the ellipsis.

## E. Prose phrase quotes (words in quotation marks read against the live verse)
- 63407 "refrain from gleaning his stubbles" (live: *refrains from gleaning*), 63397 "given to the mind" (live: *to the mind he gave the Law*),
  69365 (Genesis 3:24 cherubim — canon phrase, fine), 69444 "I will be like the Highest" (live: *will be like the Highest* — fine).
  → 2 phrase patches (63407, 63397). 69334 / 69362 quote the Genesis end — false positives.

## F. Text-lane finds (not this migration): 4 Macc 4:1 missing opening clause (needs Wesley/Charles); adam-eve 3:1 "murdered. I by";
   92:1 lost period; OCR-dropped question marks throughout adam-eve.

## Build plan once decided (one migration `session478_adam_eve_4macc_sweep.sql`, Rule 10)
12 rebuilt notes (Sonnet drafters, Fable voice reads, model in the file name) + 8 phrase patches + 6 "substance" (per Q1) + 18 card
cite fixes + up to 9 moves (two Sonnet cold reads) + 3 canon re-quotes + 56 summaries re-cited + member rows mirrored → gen SQL →
PGlite scratch ×2 (`seed478.mjs` from the post-deploy dump) → `_session478_sweep_deploy.sh` printing its own read-back → status table.

## Questions for Yoshi
1. "the substance of which Eleazar's blood is the shadow" (Colossians 2:17 / Hebrews 10:1 language) in 6 cards + 2 threads — scripture
   English that stands, or patch it to plain words?
2. Nothing else blocks; the 9 neighbour-verse cards are decided by the two cold reads and reported.
