# Jubilees sweep — S463b (2026-10-23) — verification table, read by content

One migration (`data-schema/migrations/session463b_jubilees_sweep.sql`), scratch-tested twice against a Postgres seeded from the Oct 23 read-back (`jubilees-cards-live.json`, 1,754 live cards touching Jubilees, 1,746 member notes, 922 threads). Run 1 = 207 notes rewritten/re-cited in place, 140 moved, 256 member notes, 5 summaries, 0 skipped, 0 absent; run 2 = 0 changed, 347 already landed. Post-run read-back by content: every card and member note as written, every Jubilees quotation in every card/member note/summary verbatim at its cited verse, 0 degraded markers, 0 duplicate pairs. Deploy is Yoshi's paste:

    bash ~/Desktop/App/_session463b_jubilees_sweep_deploy.sh

Verification before it was written: every gloss on a split verse was read by content (four readers, 312 glosses); every re-pointing was then read cold by two agents that never saw the build (both caught the same wrong move, 26777 → 23:22, and two stale addresses in prose; all fixed); the 126 rebuilt notes were read cold against the voice skill by a third (caught the woman of Canaan written as a mercy case on 4590–4593 — corrected to seed revealed).

## What the map found

- Quotes: 844 cards stood; 32 did not (21 reworded, 7 found at another verse, 2 both, 2 not found) — all rebuilt below.
- Degraded prose (wisdom-stream, the framework reads, substance, apparatus, hyphen-chains): 107 cards, plus 19 with hyphen-chain prose the markers missed — all 126 rebuilt Come-and-See.
- Glosses (no Jubilees quote) on a verse S453 split: 312 read — 179 stay, 131 move to the neighbor verse their words sit in, 2 questions.
- Pre-existing quotations running across a split boundary cited as one verse: 91 — citation widened to the verses spanned, card address unchanged.
- Member notes: 53 labelled quotes off the live text (14 real, 39 were gapped quotes that pass) + every member note of a rebuilt/moved card.
- Thread summaries: 264 anchored in Jubilees, 549 quotes; 5 fixed.

## Job 1 — 126 notes rebuilt (live Jubilees verse in italics, cited; the other verse the same; then prose)

| card | other end | Jubilees | moved from | note |
|---|---|---|---|---|
| 4268 | matthew 2:14 | 46:1 |  | Live 46:1 reads 'Jacob' and 'Yashar’el' and runs on past 'great nation'; re-quoted the opening clause verbatim. |
| 4279 | matthew 2:15 | 2:20 |  | Live 2:20 reads 'seed of Jacob' and continues with the Sabbath clause; re-quoted the firstborn clause verbatim. |
| 4284 | matthew 2:18 | 32:34 |  | Live 32:34 spells 'Bethlehem' and 'Jacob'; full verse re-quoted verbatim. |
| 4306 | matthew 3:7 | 10:1 |  |  |
| 4308 | matthew 4:1 | 10:8 |  | Live 10:8 reads 'Mastêmâ', 'Yahuah (God)', 'say to them' and runs on; re-quoted the same span verbatim. |
| 4309 | matthew 4:3 | 11:11 | 11:5 | The ravens-and-seed sentence the card is built on now sits at 11:11 (live 11:5 is Mastema sending spirits to shed blood, not the bread point |
| 4310 | matthew 4:5 | 17:16 |  | Live 17:16 uses 'Abraham', 'Isaac', 'You will see'; full verse re-quoted verbatim. |
| 4463 | matthew 11:5 | 23:27 |  |  |
| 4466 | matthew 11:11 | 1:23 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (1:23); it describes 1:23, so the anchor holds, but t |
| 4467 | matthew 11:11 | 1:24 |  |  |
| 4468 | matthew 11:11 | 1:25 |  |  |
| 4478 | matthew 11:23 | 16:5 |  |  |
| 4479 | matthew 11:23 | 16:6 |  |  |
| 4493 | matthew 12:8 | 2:21 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (2:21); it describes 2:21, so the anchor holds, but t |
| 4494 | matthew 12:12 | 50:12 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (50:12); it describes 50:12, so the anchor holds, but |
| 4510 | matthew 12:29 | 10:11 |  | verdict RE_ANCHOR_REWORDED (proposed 10:10): the old note quoted a reworded span of 10:10–11, beginning with the medicines taught to Noah (1 |
| 4511 | matthew 12:31 | 15:34 | 15:33 | verdict NOT_FOUND: the old note's quote (*great wrath from Yahuah ... because they have forsaken His covenant*) is not in the live 15:33; it |
| 4519 | matthew 12:40 | 23:30 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (23:30); it describes 23:30, so the anchor holds, but |
| 4521 | matthew 12:45 | 1:23 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (1:23); it describes 1:23, so the anchor holds, but t |
| 4525 | matthew 12:50 | 1:24 |  |  |
| 4530 | matthew 13:4 | 11:11 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (11:11); it describes 11:11, so the anchor holds, but |
| 4538 | matthew 13:25 | 5:1 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (5:1); it describes 5:1, so the anchor holds, but the |
| 4539 | matthew 13:38 | 7:21 |  |  |
| 4558 | matthew 13:38 | 4:2 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (4:2); it describes 4:2, so the anchor holds, but the |
| 4590 | matthew 15:22 | 15:30 |  | voice read: Canaanite woman is seed revealed, not a mercy case — corrected / voice read: Canaanite woman is seed revealed, not a mercy case  |
| 4591 | matthew 15:26 | 15:31 |  | voice read: Canaanite woman is seed revealed, not a mercy case — corrected |
| 4592 | matthew 15:26 | 15:32 |  | voice read: Canaanite woman is seed revealed, not a mercy case — corrected / voice read: Canaanite woman is seed revealed, not a mercy case  |
| 4593 | matthew 15:26 | 16:17 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (16:17); it describes 16:17, so the anchor holds, but |
| 4594 | matthew 15:37 | 50:1 |  |  |
| 4595 | matthew 15:37 | 50:2 |  |  |
| 4596 | matthew 15:37 | 50:4 |  |  |
| 4699 | matthew 19:4 | 3:4 |  |  |
| 4700 | matthew 19:5 | 3:6 |  |  |
| 4716 | matthew 19:28 | 1:15 |  |  |
| 4717 | matthew 19:28 | 31:15 |  |  |
| 4809 | matthew 24:37 | 5:2 |  |  |
| 4810 | matthew 24:38 | 5:19 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (5:19); it describes 5:19, so the anchor holds, but t |
| 4905 | matthew 28:19 | 1:15 |  |  |
| 4906 | matthew 28:20 | 1:23 |  | verdict REWORDED: the old note's Jubilees quote was a reworded form of this same verse (1:23); it describes 1:23, so the anchor holds, but t |
| 4907 | matthew 28:19 | 1:25 |  |  |
| 7916 | luke 11:22 | 10:11 |  |  |
| 7942 | luke 17:27 | 5:2 |  |  |
| 16266 | 1-enoch 10:16 | 5:12 | 5:11 | The 'new and righteous nature' verse is now 5:12 (5:11 is the destruction); the card's point is the new nature, so it moves; quote already v |
| 16776 | 1-enoch 25:3 | 4:26 | 4:25 | The four-places verse is now 4:26 (4:25 is the incense); the card's point is the four holy places, so it moves; quote already verbatim at 4: |
| 20284 | genesis 13:4 | 13:15 | 13:8 | Genesis 13:4 is the return to the first altar; that return and the 'for ever and ever' confession now sit at 13:15–16 (13:8 is the first alt |
| 20326 | genesis 15:6 | 14:6 |  | The card's anchor (14:6, 'he believed') is verbatim and matches Genesis 15:6, so it stays; the secondary covenant quote lives at 14:7 and is |
| 20338 | genesis 15:14 | 14:14 |  |  |
| 23895 | 1-enoch 89:3 | 5:24 | 5:23 | The seven flood-gates sentence now sits at 5:24 (5:23 is Noah entering the ark); moved there and quoted 5:24–25 verbatim, dropping the 5:26  |
| 25564 | psalms 139:16 | 1:26 | 1:25 | Old note described the divisions of days written in Jubilees 1:26-29, not 1:25; the Jubilees verse may be off. Rebuilt on 1:25 as given. |
| 25648 | 1-enoch 7:3 | 5:2 |  | The Jubilees quote 'They began to devour each other' is in live 5:2 with a lowercase 'they'; the checker's quote field held the 1 Enoch side |
| 25658 | psalms 139:16 | 5:13 |  |  |
| 27347 | jubilees 29:3 | 27:27 | 27:26 | The vow now sits at 27:27 (27:26 is the pillar and the naming of Bethel); the card's point is the vow, so it moves; re-quoted verbatim with  |
| 27374 | psalms 139:16 | 31:32 |  |  |
| 27398 | psalms 139:16 | 32:21 | 32:20 | Old note described the seven tablets showing Jacob all that would befall him and his sons, which is Jubilees 32:21, not 32:20; the Jubilees  |
| 27403 | deuteronomy 14:23 | 32:10 |  |  |
| 28021 | psalms 139:16 | 33:16 |  |  |
| 28126 | psalms 105:21 | 40:7 | 40:9 | Old note described Joseph being made ruler over all Egypt, which is Jubilees 40:7, not 40:9; the Jubilees verse may be off. Rebuilt on 40:9  |
| 28136 | genesis 41:30 | 40:3 |  |  |
| 28944 | genesis 15:14 | 44:6 |  |  |
| 29154 | jasher 5:8 | 5:8 |  |  |
| 29167 | jasher 5:33 | 5:22 |  |  |
| 29198 | jasher 7:1 | 8:10 |  |  |
| 29214 | jasher 7:19 | 8:8 |  |  |
| 29219 | jasher 7:42 | 10:19 |  |  |
| 29441 | jasher 10:32 | 9:3 |  |  |
| 29447 | jasher 10:19 | 9:1 |  |  |
| 29451 | jasher 10:7 | 9:8 |  |  |
| 29454 | jasher 10:2 | 10:25 |  |  |
| 29459 | jasher 10:1 | 8:8 |  |  |
| 29507 | jasher 13:1 | 12:28 |  |  |
| 29515 | jasher 13:7 | 13:3 |  |  |
| 29977 | jasher 20:1 | 16:10 |  |  |
| 29999 | jasher 22:45 | 17:17 |  |  |
| 30010 | jasher 22:9 | 16:11 |  |  |
| 30029 | jasher 23:1 | 18:2 |  |  |
| 30037 | jasher 24:14 | 19:2 |  |  |
| 30043 | jasher 24:1 | 19:8 |  |  |
| 30534 | jasher 26:31 | 22:1 |  |  |
| 30541 | jasher 26:15 | 19:13 |  |  |
| 30651 | jasher 32:73 | 29:13 |  |  |
| 31356 | jasher 36:1 | 32:1 |  |  |
| 31358 | jasher 36:6 | 32:30 |  |  |
| 31363 | jasher 36:8 | 32:17 |  |  |
| 31369 | jasher 36:14 | 33:2 |  |  |
| 31372 | jasher 36:16 | 33:22 |  |  |
| 32259 | jasher 43:13 | 34:11 |  | Card quotes 34:11–12 together; 34:12 (the kid and the dipped coat) is the verse that actually matches Jasher 43:13, and the old note quoted  |
| 32268 | jasher 44:76 | 39:11 |  | Card quotes 39:11–12 together, as the old note did; 39:12 carries the favour in prison that the old note's point rested on. |
| 32275 | jasher 44:78 | 39:6 |  | Card quotes 39:6–7 together, as the old note did; 39:7 is the refusal itself. |
| 32280 | jasher 44:11 | 39:3 |  |  |
| 32288 | jasher 45:31 | 41:19 |  |  |
| 32292 | jasher 45:26 | 41:5 |  |  |
| 32350 | jasher 48:55 | 40:3 |  |  |
| 32355 | jasher 48:52 | 40:5 |  |  |
| 32358 | jasher 48:33 | 40:2 |  |  |
| 32365 | jasher 48:2 | 40:1 |  |  |
| 33300 | jasher 49:21 | 40:10 |  | Old quote carried stray verse numbers ('2', '3 11.'); the thirty-years clause the note relies on is live 40:11, so quoted 40:10 and 40:11 ve |
| 33322 | jasher 50:7 | 40:8 |  |  |
| 33342 | jasher 51:1 | 42:4 |  |  |
| 33396 | jasher 54:69 | 43:14 |  |  |
| 33400 | jasher 54:57 | 43:13 |  |  |
| 34520 | jasher 57:42 | 38:16 |  | Jasher 57:42 as supplied does not name Bela/Balaq or his city; the name must sit in a nearby verse. The note treats 57:42 as the crowning sc |
| 34523 | jasher 57:35 | 38:10 |  | Different events: Jubilees 38:10 is Jacob's sons subduing Esau's sons; Jasher 57:35 is Esau's sons slaughtering and enslaving the Horites of |
| 34532 | jasher 57:2 | 38:8 |  | Different battles: Jubilees 38:8 is the war in Jacob's lifetime where Esau is slain (400 killed); Jasher 57:2 is the war after Jacob's death |
| 34588 | jasher 62:1 | 46:1 |  |  |
| 34595 | jasher 62:23 | 46:8 |  |  |
| 34627 | jasher 64:8 | 46:8 |  |  |
| 35824 | jasher 65:8 | 46:14 |  | Removed a stray verse number ('2') from inside the quote; otherwise the live 46:14 text. |
| 35854 | jasher 67:59 | 46:15 |  |  |
| 35863 | jasher 67:49 | 47:2 |  |  |
| 35877 | jasher 68:18 | 47:5 |  |  |
| 35889 | jasher 68:11 | 47:2 |  |  |
| 35915 | jasher 70:33 | 47:9 |  |  |
| 35953 | jasher 72:21 | 47:10 |  |  |
| 37310 | jasher 75:2 | 14:13 |  |  |
| 37325 | jasher 76:13 | 48:1 |  |  |
| 37347 | jasher 78:15 | 48:7 |  | Card quotes 48:7–8 together, as the old note did; 48:8 carries the covenant with Abraham that the old note's point rested on. |
| 37356 | jasher 78:7 | 48:1 |  |  |
| 38882 | jasher 81:4 | 48:19 |  |  |
| 39065 | jasher 90:38 | 46:9 |  | Jubilees 46:9 and Jasher 90:38 give different times and places for the burial (early, at the double cave in Hebron vs after the conquest, ea |
| 39088 | jasher 91:15 | 13:20 |  |  |
| 45959 | 1-adam-eve 48:1 | 3:22 |  | Old quote had 'He took' for 'he took' and a stray '32.'; the cursing of the serpent the note depends on is live 3:23, so quoted 3:22 and 3:2 |
| 46049 | 1-adam-eve 54:3 | 3:26 |  | Old note said a shut eastern gate; the supplied 1 Adam and Eve 54:3 text says the western gate. Note follows the text. |
| 49885 | genesis 21:33 | 16:20 |  | Pieces are verbatim from live 16:20 and 16:21; added the missing gap marker between 'Well of the Oath' (end of 16:20) and the 16:21 clause s |
| 52853 | genesis 35:12 | 32:19 |  | Live 32:19 opens with the misprint 'Ana I shall give'; quote now begins at 'I shall give' so it is an exact substring without reproducing or |
| 60478 | 2-peter 3:6 | 5:24 | 5:29 | The opening of the flood-gates and fountains, 'until the whole world was full of water', now sits at 5:24–25 (live 5:29 is their closing); t |
| 172794 | 2-chronicles 11:15 | 1:11 |  |  |

## Job 2 — 129 glosses re-pointed (ids kept; addresses in the prose patched)

| card | other end | from | to | why |
|---|---|---|---|---|
| 25565 | malachi 3:16 | 1:25 | 1:26 | Gloss 'charge to write the first and the last' is 1:26 'write down ... the first and the last'; 1:25 has no writing. |
| 25591 | genesis 2:3 | 2:16 | 2:17 | Gloss 'blessed, sanctified seventh day as the great sign' is 2:17 'a great sign, the Sabbath day'; 2:16 is finishing the work on the sixth day. |
| 25610 | matthew 19:5 | 3:6 | 3:7 | Gloss quotes 'man and wife be one' and the leave-and-cleave ordinance, which is 3:7 'Therefore shall man and wife be one ... cleave to his wife'; 3:6 is Adam's  |
| 25616 | genesis 2:8 | 3:11 | 3:12 | Gloss quotes 'holier than all the earth besides', which is 3:12 'Garden of Eden, for it is holier than all the earth besides'; 3:11 is the purification count. |
| 25617 | genesis 3:1 | 3:16 | 3:17 | Gloss 'quotes the serpent's opening question' is 3:17 'Has Elohim (God) commanded you ... not eat of every tree of the garden?'; 3:16 is Adam tilling the garden |
| 25626 | genesis 3:21 | 3:30 | 3:31 | Gloss 'prescribes on the heavenly tables ... not uncover themselves as the nations do' is 3:31 'prescribed on the heavenly tables ... not uncover themselves as  |
| 25631 | jude 1:14 | 4:17 | 4:18 | Gloss 'the first to write a testimony' is 4:18 'he was the first to write a testimony, and he testified'; 4:17 is writing the signs of heaven. |
| 25637 | genesis 4:15 | 4:4 | 4:5 | Gloss 'heavenly-tablet curse' is 4:5 'written on the heavenly tables, Cursed is he who smites his neighbour'; 4:4 is the reproof and fugitive sentence without t |
| 25665 | leviticus 16:29 | 5:16 | 5:17 | Gloss 'promises Israel forgiveness if they turn' is 5:17 'If they turn to Him in righteousness, He will forgive all their transgressions'; 5:16 is the impartial |
| 25667 | genesis 6:14 | 5:20 | 5:21 | Gloss 'ark Noah is commanded to make' is 5:21 'He commanded Noah to make him an ark'; 5:20 has no ark. |
| 25669 | genesis 7:12 | 5:23 | 5:25 | Gloss 'forty days and forty nights' is 5:25 'pour down water from the heaven forty days and forty nights'; 5:23 is the entry into the ark. |
| 25670 | genesis 7:24 | 5:23 | 5:27 | Gloss quotes 'five months-one hundred and fifty days', which is 5:27 verbatim; 5:23 is the entry date. |
| 25679 | genesis 9:4 | 6:6 | 6:7 | Gloss 'blood prohibition ... gives Noah' is 6:7 'flesh, with the life thereof, with the blood, you shall not eat'; 6:6 is the grant of all things for food. |
| 25681 | leviticus 17:10 | 6:11 | 6:12 | Gloss 'no-blood law ... with the same cutting-off' is 6:12 'not eat ... any blood ... he and his seed shall be rooted out of the land'; 6:11 is the covenant oat |
| 25682 | leviticus 17:11 | 6:6 | 6:7 | Gloss quotes 'the life of all flesh is in the blood', which is 6:7 'for the life of all flesh is in the blood'; 6:6 has no blood rationale. |
| 25683 | leviticus 17:14 | 6:6 | 6:7 | Gloss 'the rationale ... the life of all flesh is the blood' is 6:7 'the life of all flesh is in the blood'; 6:6 is the food grant. |
| 25699 | genesis 9:21 | 7:6 | 7:7 | Gloss 'drunken ... uncovered within his tent ... retells almost verbatim' is 7:7 'being drunken he lay down ... and was uncovered in his tent'; 7:6 is only drin |
| 25708 | genesis 6:4 | 7:21 | 7:22 | Gloss 'the giants ... the Nâphîdîm who devoured one another' is 7:22 'begat sons the Nâphîdîm ... they devoured one another'; 7:21 names no giants. |
| 25709 | 1-enoch 7:2 | 7:21 | 7:22 | Gloss 'the giants ... names from the Watchers' matches 7:22 'they begat sons the Nâphîdîm ... the Giants'; 7:21 is the Watchers' fornication without giants. |
| 25710 | 1-enoch 7:3 | 7:21 | 7:22 | Gloss 'mutual devouring ... among the Nâphîdîm' is 7:22 'they devoured one another'; 7:21 has no devouring. |
| 25721 | 1-enoch 26:1 | 8:18 | 8:19 | Gloss 'Zion ... the same centre ... navel of the world' is 8:19 'Mount Zion-the centre of the navel of the earth'; 8:18 is Noah's blessing of Shem. |
| 25722 | ezekiel 38:12 | 8:18 | 8:19 | Gloss 'the navel of the earth' is 8:19 'the centre of the navel of the earth'; 8:18 does not mention the centre. |
| 25723 | ezekiel 5:5 | 8:18 | 8:19 | Gloss 'Jubilees 8:18-19 calls Zion the navel' is 8:19 'Mount Zion-the centre of the navel of the earth'; 8:18 has no Zion. |
| 25919 | genesis 11:1 | 10:17 | 10:18 | Gloss 'in Peleg's days — one people, evil in purpose' is 10:18 'Peleg ... the children of men have become evil through the wicked purpose of building ... a city |
| 25932 | acts 7:3 | 11:14 | 11:16 | Gloss 'call out of the idolatrous house ... Abraham already straining toward as a child' is 11:16 'the child began to understand the errors ... separated himsel |
| 25934 | joshua 24:3 | 11:14 | 11:16 | Gloss 'the boy separating himself from his father's idols' is 11:16 'he separated himself from his father that he might not worship idols with him'; 11:14 is Te |
| 25941 | genesis 11:26 | 11:14 | 11:15 | Gloss 'Abram born to Terah' is 11:15 'she bare him a son, and he called his name Abram'; 11:14 is Terah's marriage to Edna. |
| 25943 | genesis 11:22 | 11:6 | 11:7 | Gloss 'Serug dwells in Ur and his wife bears him Nahor' is 11:7 'dwelt in Ur of the Chaldees ... took to himself a wife ... Mêlkâ'; 11:6 is only the naming of S |
| 25950 | genesis 12:3 | 12:22 | 12:23 | Gloss 'blessing-and-cursing and all-families promise' is 12:23 'in you will all families of the earth be blessed ... bless them that bless you, And curse them t |
| 25952 | 1-enoch 10:16 | 12:17 | 12:20 | Gloss 'Abram's plea to stablish him and his seed for ever' is 12:20 'stablish You me and my seed for ever'; 12:17 is the stars in Yahuah's hand. |
| 25955 | genesis 11:31 | 12:14 | 12:15 | Gloss 'family's departure from Ur toward Canaan' is 12:15 'Terah went forth from Ur of the Chaldees ... into the land of Canaan'; 12:14 is Haran's death in the  |
| 25959 | deuteronomy 4:28 | 12:2 | 12:5 | Gloss 'the work of men's hands with no spirit in them' is 12:5 'things that have no spirit in them? For they are the work of (men's) hands'; 12:2 only asks what |
| 25968 | genesis 14:1 | 13:20 | 13:22 | Gloss 'the same coalition of kings' is 13:22 'Chedorlaomer, king of Elam, and Amraphel, king of Shinar, and Arioch ... and Têrgâl, king of nations'; 13:20 is th |
| 25978 | genesis 12:8 | 13:7 | 13:8 | Gloss 'building the altar and calling on the Name' is 13:8 'built an altar on this mountain, and called on the name of Yahuah'; 13:7 only blesses for the leadin |
| 25979 | genesis 12:7 | 13:2 | 13:3 | Gloss 'land-and-seed promise' is 13:3 'To you and to your seed will I give this land'; 13:2 is only Abram seeing the pleasant land. |
| 25987 | genesis 15:17 | 14:16 | 14:17 | Gloss 'smoking furnace and flame passing between the pieces' is 14:17 'a furnace was smoking, and a flame of fire passed between the pieces'; 14:16 is the fourt |
| 25990 | genesis 17:7 | 14:6 | 14:7 | Gloss quotes 'to you and to your seed after you', which is 14:7 'Elohim to you and to your seed after you'; 14:6 is faith counted for righteousness. |
| 25993 | genesis 15:7 | 14:6 | 14:7 | Gloss 'self-naming by the deliverance out of Ur' is 14:7 'I am Yahuah that brought you out of Ur of the Chaldees'; 14:6 has no self-naming. |
| 26009 | genesis 17:19 | 15:18 | 15:19 | Gloss 'names Isaac and establishes the everlasting covenant in him' is 15:19 'call his name Isaac, and I shall establish My covenant with him, an everlasting co |
| 26012 | romans 4:17 | 15:5 | 15:7 | Gloss and Romans quote 'I have made thee a father of many nations', matching 15:7 'For the father of many nations have I made you' word for word; 15:6 'you will |
| 26014 | genesis 17:7 | 15:5 | 15:9 | Gloss 'everlasting covenant to Abraham and his seed throughout their generations' is 15:9 'establish My covenant between Me and you, and your seed after you, th |
| 26015 | genesis 17:5 | 15:5 | 15:7 | Gloss 'the renaming word for word — Abram becomes Abraham' is 15:7 'Neither will your name any more be called Abram... shall be Abraham'; 15:5 has no renaming. |
| 26027 | 1-peter 2:9 | 16:17 | 16:18 | Gloss 'the portion of the Most High, the kingdom and priests' is 16:18 'the portion of the El Elyon (Most High)... a kingdom and priests and a holy nation'; 16: |
| 26028 | exodus 19:6 | 16:17 | 16:18 | Gloss 'kingdom and priests and holy nation' is 16:18 'a kingdom and priests and a holy nation', matching Exodus 19:6; 16:17 only has 'holy seed'. |
| 26032 | genesis 21:2 | 16:12 | 16:13 | Gloss 'the set time of which Yahuah had spoken to Abraham... Isaac's birth' is 16:13 'at the time of which Yahuah had spoken to Abraham... Isaac was born'; 16:1 |
| 26035 | genesis 19:29 | 16:6 | 16:7 | Gloss 'Lot is saved because Elohim remembered Abraham' is 16:7 'Lot we saved; for Elohim remembered Abraham, and sent him out from the midst of the overthrow';  |
| 26670 | genesis 21:20 | 17:12 | 17:13 | Gloss 'growth into an archer' is 17:13 'the child grew and became an archer, and Elohim was with him'; 17:12 is Hagar at the well. |
| 26681 | hebrews 11:17 | 18:7 | 18:8 | Gloss 'the offered son... offered the heir' is 18:8 'bound Isaac his son, and placed him on the wood... to slay Isaac his son'; 18:7 is only 'Elohim will provid |
| 26683 | james 2:21 | 18:7 | 18:8 | Gloss 'the altar-offering' and James's 'offered Isaac his son upon the altar' is 18:8 'he built an altar... bound Isaac his son, and placed him on the wood whic |
| 26685 | genesis 22:17 | 18:14 | 18:15 | Gloss 'seed multiplied as the stars and the sand' is 18:15 'multiply your seed As the stars of heaven, And as the sand which is on the seashore'; 18:14 is only  |
| 26686 | genesis 22:16 | 18:14 | 18:15 | Gloss 'the self-sworn oath... because the son was not withheld' is 18:15 'By Myself have I sworn... have not withheld your son'; 18:14 is only the call by name. |
| 26687 | genesis 22:14 | 18:12 | 18:13 | Gloss 'names the same place — Yahuah has seen — and locates it as Mount Sion' is 18:13 'Abraham called that place Yahuah has seen... that is Mount Sion'; 18:12  |
| 26694 | genesis 22:2 | 18:1 | 18:2 | Gloss 'the beloved son offered on a mountain Elohim will point out' is 18:2 'Take your beloved son... offer him on one of the mountains which I will point out t |
| 26698 | genesis 13:16 | 19:19 | 19:22 | Gloss 'seed numberless as the sand' is 19:22 'If a man can number the sand of the earth, His seed also will be numbered', matching Genesis 13:16; 19:19 is Isaac |
| 26702 | genesis 25:28 | 19:14 | 19:15 | Gloss 'Abraham loved Jacob, Isaac loved Esau' is 19:15 'Abraham loved Jacob, but Isaac loved Esau' verbatim; 19:14 is Jacob learning to write and Esau hunting. |
| 26707 | genesis 24:67 | 19:9 | 19:10 | Gloss 'Abraham takes a wife for his son Isaac' is 19:10 'he took a wife for his son Isaac and her name was Rebecca'; 19:9 is the burial plot and friend of Elohi |
| 26708 | genesis 24:15 | 19:9 | 19:10 | Gloss 'Rebecca daughter of Bethuel, son of Nahor, brother of Abraham' is 19:10 'Rebecca the daughter of Bethuel, the son of Nahor, the brother of Abraham'; 19:9 |
| 26716 | genesis 23:1 | 19:6 | 19:7 | Gloss 'one hundred and twenty-seven years of Sarah's life' is 19:7 'the days of the life of Sarah were one hundred and twenty-seven years'; 19:6 is the purchase |
| 26717 | genesis 25:6 | 20:10 | 20:11 | Gloss 'sending of Ishmael and Keturah's sons away with gifts, the inheritance reserved to Isaac' is 20:11 'gave to Ishmael... and to the sons of Keturah, gifts, |
| 26736 | leviticus 17:13 | 21:16 | 21:17 | Gloss quotes 'cover it with dust', which is 21:17 'be on your guard, my son, against blood... cover it with dust'; 21:16 is washing before the altar. |
| 26741 | leviticus 1:9 | 21:6 | 21:7 | Gloss quotes 'sweet savour before Yahuah upon the altar', which is 21:7 'on the altar of burnt-offering; it is a sweet savour before Yahuah'; 21:6 is only the b |
| 26763 | genesis 28:4 | 22:9 | 22:10 | Gloss 'the blessing of Abraham passing to Jacob's seed' and Genesis 28:4's blessing over Jacob is 22:10 'My son Jacob, may the Elohim of all bless you... choose |
| 26768 | malachi 3:16 | 23:30 | 23:32 | Gloss quotes 'record on the heavenly tables for a testimony', which is 23:32 'they record (them) on the heavenly tables for a testimony for the generations for  |
| 26774 | deuteronomy 30:3 | 23:25 | 23:26 | Gloss 'follow exactly on the Torah's return — the regathering after the return-to-the-way' is 23:26 'the children will begin to study the laws... And to return  |
| 26775 | deuteronomy 30:2 | 23:25 | 23:26 | Gloss quotes 'seek the commandments, and return to the path of righteousness', which is 23:26 verbatim; 23:25 is the aged children. |
| 26777 | isaiah 65:12 | 23:17 | 23:22 | Gloss 'faithless generation' matches 23:18 'their works are altogether faithless, and they will all perish together'; neither verse has 'the sword' (that line i |
| 26780 | genesis 6:3 | 23:8 | 23:9 | Gloss quotes 'after the Flood they began to grow less', which is 23:9 'after the Flood they began to grow less than nineteen jubilees'; 23:8 is Abraham's own 17 |
| 26781 | genesis 25:10 | 23:6 | 23:7 | Gloss quotes 'near Sarah his wife', which is 23:7 'buried him in the double cave, near Sarah his wife'; 23:6 is the weeping in the house. |
| 26782 | genesis 25:9 | 23:6 | 23:7 | Gloss 'the same two sons, the same cave — double cave' is 23:7 'his sons Isaac and Ishmael buried him in the double cave'; 23:6 is Ishmael weeping. |
| 26785 | exodus 32:32 | 24:32 | 24:33 | Gloss 'the heavenly tables... engraved for the day of judgment' is 24:33 'written and engraved concerning him on the heavenly tables, to do to him on the day of |
| 26786 | malachi 3:16 | 24:32 | 24:33 | Gloss quotes 'written and engraved on the heavenly tables', which is 24:33 'thus is it written and engraved concerning him on the heavenly tables'; 24:32 has no |
| 26788 | genesis 26:24 | 24:21 | 24:22 | Gloss 'quotes the Beer-sheba theophany verbatim, adding only its new-moon dating' is 24:22 'Yahuah appeared to him that night, on the new moon of the first mont |
| 26798 | romans 9:12 | 24:6 | 24:7 | Gloss quotes 'Jacob became the elder', which is the text of 24:7, not 24:6 (the pottage trade). |
| 26799 | hebrews 12:17 | 24:6 | 24:7 | Gloss quotes 'brought down from his dignity', the words of 24:7; 24:6 has only the pottage and despised birthright. |
| 27279 | genesis 27:27 | 26:21 | 26:22 | Gloss 'smell-of-the-field that Yahuah has blessed' is 26:22 'the smell of my son is as the smell of a (full) field which Yahuah (God) has blessed'; 26:21 is onl |
| 27280 | genesis 27:28 | 26:21 | 26:23 | Gloss 'dew of heaven and plenty of corn' is 26:23 'give you of the dew of heaven... and plenty of corn and oil'. |
| 27281 | genesis 27:29 | 26:21 | 26:23 | Gloss 'nations-serve-you' formula is 26:23 'Let nations serve you, And peoples bow down to you'; 26:21 has no blessing words (the mother's-sons/cursed line is 2 |
| 27288 | genesis 27:36 | 26:29 | 26:30 | Gloss 'Esau name the two supplantings — birthright then blessing' is 26:30 'supplanted me these two times: he took away my birth-right, and now he has taken awa |
| 27293 | genesis 27:41 | 26:34 | 26:35 | Gloss 'murderous resolve in Esau's heart' is 26:35 'said in his heart: May the days of mourning for my father now come, so that I may slay my brother Jacob'. |
| 27295 | leviticus 27:30 | 27:26 | 27:27 | Gloss 'the very tithe Jacob vows to Yahuah at Bethel' is 27:27 'I shall give the tenth to you'; 27:26 is the pillar and oil. |
| 27296 | genesis 14:20 | 27:26 | 27:27 | Gloss 'the tenth Jacob vows' is 27:27 'Jacob vowed a vow... I shall give the tenth to you'. |
| 27307 | genesis 28:5 | 27:11 | 27:12 | Gloss 'the sending to Mesopotamia/Padan-aram' is 27:12 'Isaac sent Jacob away, and he went to Mesopotamia'; 27:11 is the El Shaddai blessing. |
| 27316 | hebrews 7:14 | 28:14 | 28:15 | Gloss 'the kingly tribe born... the tribe of the Messiah' is 28:15 'called his name Yahudah (Judah)'; 28:14 is Levi's birth. |
| 27317 | numbers 24:17 | 28:14 | 28:15 | Gloss 'Judah's line, first dated at his birth' is 28:15 'bare him a fourth son... Yahudah (Judah)', not 28:14 (Levi). |
| 27318 | genesis 49:10 | 28:14 | 28:15 | Gloss 'The Yahudah born in Jubilees' is 28:15 'called his name Yahudah (Judah)'. |
| 27336 | genesis 36:8 | 29:11 | 29:13 | Gloss 'Esau's settling in Seir... his departure' is 29:13 'departed from him to the land of Seir'; 29:11 is the Amorites. |
| 27337 | genesis 33:16 | 29:11 | 29:13 | Gloss 'Esau departed to the land of Seir' is the wording of 29:13. |
| 27338 | genesis 33:3 | 29:11 | 29:13 | Gloss 'the reconciliation Jubilees names in a phrase' is 29:13 'he was reconciled to him'. |
| 27339 | genesis 33:1 | 29:11 | 29:13 | Gloss 'Esau coming to Jacob' is 29:13 'Esau, his brother, came to him'. |
| 27343 | genesis 31:52 | 29:6 | 29:7 | Gloss 'the exact non-crossing oath' is 29:7 'neither should cross the mountain of Gilead to the other with evil purpose'; 29:6 only says 'Laban spake to Jacob'. |
| 27346 | genesis 31:44 | 29:6 | 29:7 | Gloss 'the covenant-oath... the two men swore' is 29:7 'Jacob sware to Laban that day, and Laban also to Jacob'. |
| 27351 | revelation 3:5 | 30:21 | 30:22 | Gloss 'the unfaithful are blotted from' the book of life is 30:22 'destroyed out of the book of life'; 30:21 has only 'recorded as friends'. |
| 27354 | exodus 32:33 | 30:21 | 30:22 | Gloss 'destruction out of the book of life' is 30:22 'they will be destroyed out of the book of life'. |
| 27356 | deuteronomy 33:9 | 30:16 | 30:17 | Gloss 'zeal reckoned for righteousness' is 30:17 'it was (reckoned) to them for righteousness'; 30:16 is about no respect of persons. |
| 27378 | hebrews 7:14 | 31:18 | 31:19 | Gloss 'The deliverer found in Judah' is 31:19 'in you be found the salvation of Yashar'el (Israel)'. |
| 27379 | numbers 24:17 | 31:18 | 31:19 | Gloss 'The salvation of Israel in Judah' is 31:19 'in you be found the salvation of Yashar'el (Israel)'. |
| 27383 | numbers 18:2 | 31:13 | 31:14 | Gloss 'drawing-near to serve' is 31:14 'cause you and your seed... to approach Him to serve in His sanctuary'; 31:13 is only the opening blessing. |
| 27384 | deuteronomy 10:8 | 31:13 | 31:14 | Gloss 'Levi's seed approaching to serve in the sanctuary' is 31:14 'to approach Him to serve in His sanctuary'. |
| 27386 | deuteronomy 33:8 | 31:13 | 31:14 | Gloss 'drawing Levi's seed near to serve in the sanctuary' is 31:14 'approach Him to serve in His sanctuary as the angels of the presence and as the holy ones'. |
| 28023 | deuteronomy 27:20 | 33:11 | 33:12 | Gloss 'the very second time curse... So be it; so be it' is 33:12 'written a second time: Cursed he be who lies with the wife of his father... So be it; so be i |
| 28030 | genesis 28:1 | 34:19 | 34:20 | Gloss 'the wife-roster' is 34:20 'the sons of Jacob took to themselves wives. The name of Reuben's wife...'; 34:19 is the day of atonement. |
| 28031 | genesis 24:3 | 34:19 | 34:20 | Gloss 'careful naming of which wives were Canaanite and which were of the line of Terah' is 34:20 'a Canaanite... of the seed of the sons of Terah'. |
| 28036 | genesis 37:35 | 34:16 | 34:17 | Gloss quotes 'Let me go down to the grave mourning for my son', which is in 34:17; 34:16 is Bilhah and Dinah's burial. |
| 28039 | genesis 37:31 | 34:11 | 34:12 | Gloss 'slaughtered kid and the dipped coat' is 34:12 'slaughtered a kid, and dipped the coat of Joseph in the blood'; 34:11 is the sale. |
| 28044 | genesis 48:21 | 34:6 | 34:7 | Gloss 'slew the Amorites in the pastures of Shechem' is 34:7 'he slew them in the pastures of Shechem'; 34:6 only has him going out with six thousand men. |
| 28046 | genesis 35:27 | 35:26 | 35:27 | Gloss 'double cave near Sarah where Esau and Jacob bury Rebekah' is 35:27 'buried her in the double cave near Sarah'; 35:26 is Jacob's vow of love. |
| 28075 | deuteronomy 6:5 | 36:6 | 36:7 | Gloss 'Isaac binds his sons to fear and worship Yahuah' is 36:7 'make you swear a great oath... that you will fear Him and worship Him'; 36:6 is Isaac's own wor |
| 28094 | genesis 36:31 | 38:14 | 38:15 | Gloss 'kings of Edom before Israel had a king... word for word' is 38:15 'these are the kings that reigned in Edom before there reigned any king'; 38:14 is the  |
| 28098 | malachi 1:3 | 38:11 | 38:12 | Gloss's 'hatred-of-Esau election' with Esau's heritage laid waste lands on 38:12 'placed the yoke of servitude upon them... paid tribute'; 38:11 is only the que |
| 28099 | numbers 24:18 | 38:11 | 38:12 | Gloss 'standing yoke of tribute laid on Esau's sons' is 38:12 'placed the yoke of servitude upon them, so that they paid tribute'; 38:11 is the inquiry to Jacob |
| 28110 | genesis 39:21 | 39:11 | 39:12 | Gloss 'favour-in-prison... before the chief of the prison guards' is 39:12 'gave Joseph favour in the sight of the chief of the prison guards'; 39:11 is the cas |
| 28128 | daniel 2:28 | 40:10 | 40:12 | Gloss 'Joseph the dream-revealer' is 40:12 'as Joseph had said in the interpretation of his two dreams'; 40:10 is the renaming and marriage. |
| 28133 | genesis 41:42 | 40:6 | 40:7 | Gloss 'ring, the byssus garments, and the gold chain' is 40:7 'clothed him with byssus garments... gold chain upon his neck... placed a ring on his hand'; 40:6  |
| 28134 | genesis 41:40 | 40:6 | 40:7 | Gloss quotes 'made him ruler over all his house... Only on the throne shall I be greater than you', which is 40:7 verbatim. |
| 28873 | ruth 4:17 | 41:26 | 41:27 | Gloss 'seed not rooted out' is 41:27 'his seed was established... and would not be rooted out'; 41:26 is the uncleanness law. |
| 28890 | genesis 50:20 | 42:21 | 42:22 | Gloss 'the feast Joseph spreads' is 42:22 'he made a feast for them'; 42:21 is the greeting of Benjamin. |
| 28898 | genesis 42:35 | 42:11 | 42:12 | Gloss 'returned money that makes Jacob fear to send Benjamin' is 42:12 'their money had been returned to every man in his sack, and for this reason he feared to |
| 28901 | genesis 42:25 | 42:6 | 42:7 | Gloss 'gold put back in the sacks unknown' is 42:7 'put their gold in their sacks, and they did not know'; 42:6 is Simeon detained. |
| 28927 | genesis 44:12 | 43:6 | 43:7 | Gloss 'same search order and discovery' is 43:7 'beginning with the eldest and ending with the youngest, it was found in Benjamin's sack'; 43:6 is Joseph's term |
| 28953 | genesis 49:1 | 45:13 | 45:14 | Gloss 'made known to his sons what would come upon them in the last days' is 45:14 'made known to them what would come upon them in the last days'; 45:13 is his |
| 28955 | genesis 47:26 | 45:11 | 45:12 | Gloss 'ordinance for Egypt until this day' is 45:12 'made it an ordinance for the land of Egypt until this day'; 45:11 is only a date. |
| 28956 | genesis 47:24 | 45:11 | 45:12 | Gloss 'fifth-for-the-king, four-parts-for-the-people split' is 45:12 'the fifth part for the king and left four parts for them'; 45:11 is only a date. |
| 28974 | exodus 1:8 | 46:6 | 46:7 | Gloss 'stronger new king' is 46:7 'a new king, had become king of Egypt, and he was stronger than he'; 46:6 is the oath over the bones. |
| 28981 | hebrews 11:27 | 47:11 | 47:12 | Gloss 'flight from Pharaoh's wrath' is 47:12 'you did fear and flee on account of these words'; 47:11 is Moses' rebuke of the striving brother. |
| 28982 | acts 7:25 | 47:11 | 47:12 | Gloss 'the brother who turns on Moses... deliverer rejected by his own' is 47:12 'Who made you a prince and a judge over us?'; 47:11 is Moses' question 'Why do  |
| 28983 | exodus 2:14 | 47:11 | 47:12 | Gloss 'the rebuke and the fearful flight... quote Exodus 2:14' is 47:12 'Who made you a prince and a judge over us?... you did fear and flee'; 47:11 lacks both. |
| 29006 | exodus 14:21 | 48:12 | 48:13 | Gloss quotes 'as if it were dry land', which is 48:13 'brought them through the midst of the sea as if it were dry land'; 48:12 is Mastema rousing the pursuit. |
| 29007 | exodus 14:19 | 48:12 | 48:13 | Gloss quotes 'I stood between the Egyptians and Yashar'el', which is 48:13 verbatim; 48:12 is Mastema's cry to pursue. |
| 29020 | exodus 12:15 | 49:21 | 49:22 | Gloss quotes 'unleavened bread seven days', which is 49:22 'eat unleavened bread seven days'; 49:21 is where Passover may be kept. |

## Job 3 — 92 citations widened to the verses the quotation spans (address unchanged)

| card | other end | Jubilees | note |
|---|---|---|---|
| 7853 | mark 5:13 | 10:8 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 7991 | john 3:3 | 1:20 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 9880 | acts 2:1 | 6:18 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 12765 | galatians 4:23 | 16:13 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 16046 | 1-enoch 7:2 | 7:21 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 16402 | genesis 2:22 | 3:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 17218 | 1-enoch 32:6 | 3:21 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 17358 | genesis 4:12 | 4:4 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 17376 | genesis 5:22 | 4:17 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 17397 | genesis 6:4 | 5:7 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 18199 | genesis 7:11 | 5:24 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 18251 | genesis 9:26 | 7:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 18282 | genesis 11:28 | 12:2 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 20236 | genesis 12:1 | 12:22 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 20247 | genesis 12:7 | 13:8 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 20330 | genesis 15:17 | 14:17 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 20331 | genesis 15:9 | 14:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 21302 | 1-enoch 10:20 | 5:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 21357 | 1-enoch 8:3 | 7:21 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 22530 | 1-enoch 18:15 | 6:32 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 22582 | 1-enoch 80:6 | 6:37 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 22602 | 1-enoch 82:5 | 6:38 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 25984 | jubilees 14:20 | 6:18 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 27387 | jubilees 31:3 | 27:26 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 28131 | jubilees 40:8 | 39:12 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 28950 | jubilees 45:15 | 31:13 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 29110 | jasher 3:8 | 4:17 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 29225 | jasher 8:28 | 12:4 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 29483 | jasher 12:68 | 12:2 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 29922 | jasher 17:18 | 15:28 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 29951 | jasher 19:57 | 16:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 30526 | jasher 25:6 | 20:10 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 30529 | jasher 25:2 | 19:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 30533 | jasher 26:28 | 19:17 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 30540 | jasher 26:17 | 19:14 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 30640 | jasher 31:31 | 28:29 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 31379 | jasher 37:50 | 34:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 31409 | jasher 38:6 | 34:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 32225 | jasher 41:3 | 36:21 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 32229 | jasher 42:19 | 34:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 32332 | jasher 47:19 | 36:12 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 33331 | jasher 51:37 | 42:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 33362 | jasher 52:4 | 42:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 33408 | jasher 55:30 | 45:12 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 33410 | jasher 55:26 | 45:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 34519 | jasher 57:40 | 38:14 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 35940 | jasher 71:8 | 47:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 37317 | jasher 76:34 | 48:7 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 37407 | jasher 80:51 | 48:7 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 38878 | jasher 81:24 | 48:12 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 39384 | the-wisdom-of-solomon 10:6 | 16:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 45819 | 1-adam-eve 37:2 | 3:21 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 45902 | 1-adam-eve 44:5 | 10:8 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 46157 | 1-adam-eve 62:3 | 10:8 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 46293 | 1-adam-eve 72:24 | 3:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 46424 | 2-adam-eve 2:7 | 4:13 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 46495 | 2-adam-eve 7:9 | 4:26 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 46499 | 2-adam-eve 7:7 | 4:13 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 46671 | 2-adam-eve 19:4 | 4:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 46708 | 2-adam-eve 21:7 | 4:26 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 46723 | 2-adam-eve 22:2 | 4:17 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 48520 | genesis 17:5 | 15:7 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 48567 | genesis 18:23 | 16:7 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 48602 | apocalypse-of-abraham 1:1 | 12:2 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 48623 | apocalypse-of-abraham 2:1 | 12:2 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 48691 | apocalypse-of-abraham 8:3 | 12:17 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 49297 | ascension-isaiah 7:9 | 10:8 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 49862 | genesis 21:2 | 16:12 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 49868 | genesis 21:12 | 17:6 | quote dropped the (them) of the live text |
| 49888 | genesis 22:2 | 18:2 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 49935 | genesis 24:60 | 19:21 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 50851 | genesis 27:28 | 26:23 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 50880 | genesis 28:13 | 27:22 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 51765 | genesis 29:31 | 28:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 51767 | genesis 29:34 | 28:15 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 51799 | genesis 30:43 | 28:29 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 51844 | genesis 33:4 | 29:13 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 52820 | genesis 34:14 | 30:12 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 52860 | genesis 35:23 | 31:18 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 52861 | genesis 35:23 | 31:14 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 52862 | genesis 36:31 | 38:15 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 52887 | genesis 37:27 | 34:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 53739 | genesis 38:18 | 41:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 53765 | genesis 39:20 | 39:12 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 53788 | genesis 41:42 | 40:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 54973 | genesis 42:24 | 42:6 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 55013 | genesis 44:30 | 43:11 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 69521 | adam-eve 93:1 | 4:17 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 104148 | exodus 2:14 | 47:12 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 104188 | exodus 6:6 | 48:8 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 119919 | matthew 1:1 | 31:19 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |
| 165948 | deuteronomy 32:21 | 1:20 | pre-existing quotation runs across a split boundary; citation widened to the verses it spans |

## Member notes — 256

| thread | card | kind |
|---|---|---|
| 5172 | 25565 | GLOSS_MOVE |
| 5176 | 25591 | GLOSS_MOVE |
| 5179 | 25610 | GLOSS_MOVE |
| 5181 | 25616 | GLOSS_MOVE |
| 5182 | 25617 | GLOSS_MOVE |
| 5184 | 25626 | GLOSS_MOVE |
| 5188 | 25631 | GLOSS_MOVE |
| 5186 | 25637 | GLOSS_MOVE |
| 5194 | 25665 | GLOSS_MOVE |
| 5195 | 25667 | GLOSS_MOVE |
| 5195 | 25669 | GLOSS_MOVE |
| 5195 | 25670 | GLOSS_MOVE |
| 5198 | 25679 | GLOSS_MOVE |
| 5198 | 25681 | GLOSS_MOVE |
| 5198 | 25682 | GLOSS_MOVE |
| 5198 | 25683 | GLOSS_MOVE |
| 5204 | 25699 | GLOSS_MOVE |
| 5206 | 25708 | GLOSS_MOVE |
| 5206 | 25709 | GLOSS_MOVE |
| 5206 | 25710 | GLOSS_MOVE |
| 5212 | 25721 | GLOSS_MOVE |
| 5212 | 25722 | GLOSS_MOVE |
| 5212 | 25723 | GLOSS_MOVE |
| 5267 | 25919 | GLOSS_MOVE |
| 5272 | 25932 | GLOSS_MOVE |
| 5272 | 25934 | GLOSS_MOVE |
| 5269 | 25941 | GLOSS_MOVE |
| 5269 | 25943 | GLOSS_MOVE |
| 5277 | 25950 | GLOSS_MOVE |
| 5276 | 25952 | GLOSS_MOVE |
| 5275 | 25955 | GLOSS_MOVE |
| 5282 | 25968 | GLOSS_MOVE |
| 5279 | 25978 | GLOSS_MOVE |
| 5279 | 25979 | GLOSS_MOVE |
| 5287 | 25987 | GLOSS_MOVE |
| 5286 | 25990 | GLOSS_MOVE |
| 5286 | 25993 | GLOSS_MOVE |
| 5290 | 26009 | GLOSS_MOVE |
| 5289 | 26012 | GLOSS_MOVE |
| 5289 | 26014 | GLOSS_MOVE |
| 5289 | 26015 | GLOSS_MOVE |
| 5296 | 26027 | GLOSS_MOVE |
| 5296 | 26028 | GLOSS_MOVE |
| 5295 | 26032 | GLOSS_MOVE |
| 5294 | 26035 | GLOSS_MOVE |
| 5470 | 26670 | GLOSS_MOVE |
| 5476 | 26681 | GLOSS_MOVE |
| 5476 | 26683 | GLOSS_MOVE |
| 5475 | 26685 | GLOSS_MOVE |
| 5475 | 26686 | GLOSS_MOVE |
| 5474 | 26687 | GLOSS_MOVE |
| 5472 | 26694 | GLOSS_MOVE |
| 5482 | 26698 | GLOSS_MOVE |
| 5481 | 26702 | GLOSS_MOVE |
| 5480 | 26707 | GLOSS_MOVE |
| 5480 | 26708 | GLOSS_MOVE |
| 5478 | 26716 | GLOSS_MOVE |
| 5489 | 26717 | GLOSS_MOVE |
| 5497 | 26763 | GLOSS_MOVE |
| 5512 | 26785 | GLOSS_MOVE |
| 5512 | 26786 | GLOSS_MOVE |
| 5511 | 26788 | GLOSS_MOVE |
| 5507 | 26798 | GLOSS_MOVE |
| 5507 | 26799 | GLOSS_MOVE |
| 5650 | 27279 | GLOSS_MOVE |
| 5650 | 27280 | GLOSS_MOVE |
| 5650 | 27281 | GLOSS_MOVE |
| 5652 | 27288 | GLOSS_MOVE |
| 5653 | 27293 | GLOSS_MOVE |
| 5659 | 27295 | GLOSS_MOVE |
| 5659 | 27296 | GLOSS_MOVE |
| 5655 | 27307 | GLOSS_MOVE |
| 5663 | 27316 | GLOSS_MOVE |
| 5663 | 27317 | GLOSS_MOVE |
| 5663 | 27318 | GLOSS_MOVE |
| 5668 | 27336 | GLOSS_MOVE |
| 5668 | 27337 | GLOSS_MOVE |
| 5668 | 27338 | GLOSS_MOVE |
| 5668 | 27339 | GLOSS_MOVE |
| 5666 | 27343 | GLOSS_MOVE |
| 5666 | 27346 | GLOSS_MOVE |
| 5674 | 27351 | GLOSS_MOVE |
| 5674 | 27354 | GLOSS_MOVE |
| 5673 | 27356 | GLOSS_MOVE |
| 5677 | 27378 | GLOSS_MOVE |
| 5677 | 27379 | GLOSS_MOVE |
| 5676 | 27383 | GLOSS_MOVE |
| 5676 | 27384 | GLOSS_MOVE |
| 5676 | 27386 | GLOSS_MOVE |
| 5860 | 28023 | GLOSS_MOVE |
| 5868 | 28030 | GLOSS_MOVE |
| 5868 | 28031 | GLOSS_MOVE |
| 5866 | 28036 | GLOSS_MOVE |
| 5866 | 28039 | GLOSS_MOVE |
| 5864 | 28044 | GLOSS_MOVE |
| 5875 | 28075 | GLOSS_MOVE |
| 5887 | 28094 | GLOSS_MOVE |
| 5885 | 28098 | GLOSS_MOVE |
| 5885 | 28099 | GLOSS_MOVE |
| 5892 | 28110 | GLOSS_MOVE |
| 5895 | 28133 | GLOSS_MOVE |
| 5895 | 28134 | GLOSS_MOVE |
| 6113 | 28873 | GLOSS_MOVE |
| 6120 | 28890 | GLOSS_MOVE |
| 6118 | 28898 | GLOSS_MOVE |
| 6117 | 28901 | GLOSS_MOVE |
| 6121 | 28927 | GLOSS_MOVE |
| 6134 | 28953 | GLOSS_MOVE |
| 6133 | 28955 | GLOSS_MOVE |
| 6133 | 28956 | GLOSS_MOVE |
| 6138 | 28974 | GLOSS_MOVE |
| 6145 | 28981 | GLOSS_MOVE |
| 6145 | 28982 | GLOSS_MOVE |
| 6145 | 28983 | GLOSS_MOVE |
| 6149 | 29006 | GLOSS_MOVE |
| 6149 | 29007 | GLOSS_MOVE |
| 42 | 4306 | PROSE |
| 118 | 4463 | PROSE |
| 120 | 4466 | PROSE |
| 120 | 4467 | PROSE |
| 120 | 4468 | PROSE |
| 124 | 4478 | PROSE |
| 124 | 4479 | PROSE |
| 183 | 4493 | PROSE |
| 183 | 4494 | PROSE |
| 188 | 4510 | PROSE |
| 189 | 4511 | PROSE_MOVE |
| 191 | 4519 | PROSE |
| 192 | 4521 | PROSE |
| 193 | 4525 | PROSE |
| 195 | 4530 | PROSE |
| 197 | 4538 | PROSE |
| 197 | 4539 | PROSE |
| 203 | 4558 | PROSE |
| 222 | 4590 | PROSE |
| 222 | 4591 | PROSE |
| 222 | 4592 | PROSE |
| 222 | 4593 | PROSE |
| 223 | 4594 | PROSE |
| 223 | 4595 | PROSE |
| 223 | 4596 | PROSE |
| 376 | 4699 | PROSE |
| 376 | 4700 | PROSE |
| 380 | 4716 | PROSE |
| 380 | 4717 | PROSE |
| 401 | 4809 | PROSE |
| 401 | 4810 | PROSE |
| 424 | 4905 | PROSE |
| 424 | 4906 | PROSE |
| 424 | 4907 | PROSE |
| 188 | 7916 | PROSE |
| 649 | 7942 | PROSE |
| 3781 | 20338 | PROSE |
| 5172 | 25564 | PROSE_MOVE |
| 5193 | 25658 | PROSE |
| 5679 | 27374 | PROSE |
| 5683 | 27398 | PROSE_MOVE |
| 5681 | 27403 | PROSE |
| 5861 | 28021 | PROSE |
| 5897 | 28126 | PROSE_MOVE |
| 5894 | 28136 | PROSE |
| 6126 | 28944 | PROSE |
| 6188 | 29154 | PROSE |
| 6191 | 29167 | PROSE |
| 6199 | 29198 | PROSE |
| 6203 | 29214 | PROSE |
| 6204 | 29219 | PROSE |
| 6269 | 29441 | PROSE |
| 6267 | 29447 | PROSE |
| 6266 | 29451 | PROSE |
| 6265 | 29454 | PROSE |
| 6264 | 29459 | PROSE |
| 6281 | 29507 | PROSE |
| 6283 | 29515 | PROSE |
| 6408 | 29977 | PROSE |
| 6422 | 29999 | PROSE |
| 6418 | 30010 | PROSE |
| 6423 | 30029 | PROSE |
| 6431 | 30037 | PROSE |
| 6429 | 30043 | PROSE |
| 6575 | 30534 | PROSE |
| 6573 | 30541 | PROSE |
| 6609 | 30651 | PROSE |
| 6803 | 31356 | PROSE |
| 6804 | 31358 | PROSE |
| 6805 | 31363 | PROSE |
| 6806 | 31369 | PROSE |
| 6807 | 31372 | PROSE |
| 7062 | 32259 | PROSE |
| 7071 | 32268 | PROSE |
| 7069 | 32275 | PROSE |
| 7067 | 32280 | PROSE |
| 7076 | 32288 | PROSE |
| 7075 | 32292 | PROSE |
| 7094 | 32350 | PROSE |
| 7093 | 32355 | PROSE |
| 7092 | 32358 | PROSE |
| 7090 | 32365 | PROSE |
| 7366 | 33322 | PROSE |
| 7371 | 33342 | PROSE |
| 7389 | 33396 | PROSE |
| 7388 | 33400 | PROSE |
| 7717 | 34520 | PROSE |
| 7716 | 34523 | PROSE |
| 7714 | 34532 | PROSE |
| 7734 | 34588 | PROSE |
| 7732 | 34595 | PROSE |
| 7740 | 34627 | PROSE |
| 8095 | 35854 | PROSE |
| 8092 | 35863 | PROSE |
| 8099 | 35877 | PROSE |
| 8096 | 35889 | PROSE |
| 8108 | 35915 | PROSE |
| 8116 | 35953 | PROSE |
| 8498 | 37310 | PROSE |
| 8503 | 37325 | PROSE |
| 8515 | 37347 | PROSE |
| 8512 | 37356 | PROSE |
| 8940 | 38882 | PROSE |
| 8997 | 39065 | PROSE |
| 9001 | 39088 | PROSE |
| 11049 | 46049 | PROSE |
| 42186 | 172794 | PROSE |
| 30 | 4268 | PROSE |
| 34 | 4279 | PROSE |
| 36 | 4284 | PROSE |
| 43 | 4308 | PROSE |
| 43 | 4309 | PROSE_MOVE |
| 43 | 4310 | PROSE |
| 2740 | 16266 | PROSE_MOVE |
| 2870 | 16776 | PROSE_MOVE |
| 3772 | 20284 | PROSE_MOVE |
| 3779 | 20326 | PROSE |
| 4731 | 23895 | PROSE_MOVE |
| 5190 | 25648 | PROSE |
| 5665 | 27347 | PROSE_MOVE |
| 7364 | 33300 | PROSE |
| 8082 | 35824 | PROSE |
| 11025 | 45959 | PROSE |
| 12089 | 49885 | PROSE |
| 12782 | 52853 | PROSE |
| 14883 | 60478 | PROSE_MOVE |
| 659 | 7988 | MEMBER_REQUOTE |
| 1902 | 12765 | MEMBER_REQUOTE |
| 5675 | 27387 | MEMBER_REQUOTE |
| 5896 | 28131 | MEMBER_REQUOTE |
| 6174 | 29083 | MEMBER_REQUOTE |
| 6176 | 29110 | MEMBER_REQUOTE |
| 6184 | 29137 | MEMBER_REQUOTE |
| 6210 | 29225 | MEMBER_REQUOTE |
| 8941 | 38878 | MEMBER_REQUOTE |
| 11081 | 46157 | MEMBER_REQUOTE |
| 11240 | 46723 | MEMBER_REQUOTE |
| 11771 | 48691 | MEMBER_REQUOTE |
| 17390 | 69521 | MEMBER_REQUOTE |
| 35119 | 141652 | MEMBER_REQUOTE |

## Thread summaries — 5

- thread 5504: Jubilees quotation re-cited/re-quoted from the live text.
- thread 5683: Jubilees quotation re-cited/re-quoted from the live text.
- thread 5859: Jubilees quotation re-cited/re-quoted from the live text.
- thread 5881: Jubilees quotation re-cited/re-quoted from the live text.
- thread 6125: Jubilees quotation re-cited/re-quoted from the live text.

## Questions for Yoshi (left unchanged)

- 28948 and 28949 (Genesis 47:28 / 47:29 → Jubilees 45:13): both glosses speak of the multiplying seed Jubilees 45 tracks; neither 45:13 (Israel's seventeen years and death) nor 45:14 (deathbed blessing) says it. Earlier in the chapter, or retire?
- Live Jubilees 32:19 opens with the misprint "Ana I shall give" and 32:21 carries "through- out" (line-break artefact): fix the text, then re-quote 52853 and thread 5683.
- Many extras-side cards (S251 batch) open their prose with "The restored witness carries…" — not on the marker list, but it is the same posture. Call it and the next pass can sweep it.
