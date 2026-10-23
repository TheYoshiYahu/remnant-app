# Apocrypha + 3 Maccabees sweep — S463c (2026-10-23) — verification table, read by content

One migration (`data-schema/migrations/session463c_apocrypha_sweep.sql`), scratch-tested twice against a Postgres seeded from the Oct 23 read-back (`apocrypha-cards-live.json`: 5,720 live Apocrypha verses + 228 of 3 Maccabees, 4,969 live cards touching them, 4,943 member notes, 1,990 threads). Run 1 = 572 notes rewritten in place, 1 moved, 607 member notes, 55 summaries, 0 skipped, 0 absent; run 2 = 0 changed, 573 already landed. Post-run read-back by content: every card, member note and summary as written; 4,907 Apocrypha/3 Maccabees quotations in every anchored card / member note / summary verbatim at their cited verse; 0 degraded markers, 0 hyphen-chains, 0 slug citations, 0 duplicate pairs. Both guards tested on scratch (live text changed → RAISE + ROLLBACK; card moved since the read-back → skipped with NOTICE). Deploy is Yoshi's paste:

    bash ~/Desktop/App/_session463c_apocrypha_sweep_deploy.sh

Verification before it was written: the 13 glosses on the verses S454 changed were read by content (all stay); every re-pointing, range and re-quote was read cold by two agents that never saw the build (19/19 agree; both asked for 4507's citation to widen to 35:14–15 — done); every rebuilt note, rewritten member note and summary was read cold against the voice skill by six readers (27 findings — modalism at the boat on 4393, Christ-as-Sophia on 4473/4474, Matthew 15 read as food-law abolished on 4581–4583, the woman of Canaan left at 'the limit of his sending' on 4587, the Formless at the bush on 4572, misattributed speakers, a closing jab at the reader — all applied). Two inline canon callbacks were corrected to canon.json wording (4318, 4829, 44869).

## What the map found

- 4,969 cards dumped; 4,597 anchored in the Apocrypha or 3 Maccabees (Sirach 1,703, Wisdom 709, 2 Esdras 457, Tobit 332, 1 Macc 296, 2 Macc 292, Judith 229, Baruch 166, 1 Esdras 145, Rest of Esther 100, 3 Macc 77, the four short books 91); 372 only mention one of these books and are anchored elsewhere — not this session's.
- Quotes: 1,784 stood verbatim; 58 were off (21 register only — the live Apocrypha is half-modernized — 37 wording); 2 quoted a neighbor verse, 1 the verse before, 6 not found (lead italic was the canon verse). 2,746 cards quote only the canon side and describe the Apocrypha verse in prose (glosses; the text was never renumbered — S454: 5,710/5,720 1:1).
- Degraded prose: 411 marker notes + 139 hyphen-chain-only = 550; 485 anchored here (63 belong to the canon/pseudepigrapha sweeps). 4556, 4614, 4618 from the S463a read-back are in the set. All 485 rebuilt Come-and-See.
- Slug citations (the database slug printed as the citation — "the-wisdom-of-solomon 11:4"): 66 cards, 13 summaries. All fixed.
- Glosses on S454-changed verses: 13 (Rest of Esther 10:5–13, 13:7) — read by content, all stay.
- Member notes: 1,775 quotes stood, 70 reworded, 10 off; 426 anchored carried degraded prose/chains.
- Threads: 935 anchored in scope; 42 summary quotations off in 38 threads; 39 anchored summaries with degraded markers; 13 with slug citations.
- The scratch read-back found 8 more second-quotations in standing notes off the live text (the regrade grades the first quotation only) — re-quoted by hand (11561, 14230, 15208, 15943, 58818, 58822, 135977; member 58828).

## Job 1 — 485 notes rebuilt (live Apocrypha verse in italics, cited; the other verse the same; then prose)

| card | other end | Apocrypha | moved from | writer's flag |
|---|---|---|---|---|
| 4287 | matthew 3:1 | Ecclesiasticus 48:1 |  |  |
| 4288 | matthew 3:3 | Ecclesiasticus 48:10 |  |  |
| 4290 | matthew 3:13 | Ecclesiasticus 48:12 |  |  |
| 4318 | matthew 4:3 | Wisdom of Solomon 2:13 |  |  |
| 4319 | matthew 4:6 | Wisdom of Solomon 2:16 |  |  |
| 4320 | matthew 4:6 | Wisdom of Solomon 2:18 |  |  |
| 4321 | matthew 4:11 | Wisdom of Solomon 2:20 |  |  |
| 4326 | matthew 5:10 | Wisdom of Solomon 3:1 |  |  |
| 4327 | matthew 5:12 | Wisdom of Solomon 3:9 |  |  |
| 4336 | matthew 5:33 | Ecclesiasticus 23:9 |  |  |
| 4337 | matthew 5:34 | Ecclesiasticus 23:10 |  |  |
| 4338 | matthew 5:37 | Ecclesiasticus 23:11 |  |  |
| 4342 | matthew 5:44 | Wisdom of Solomon 12:19 |  |  |
| 4343 | matthew 5:45 | Wisdom of Solomon 12:20 |  |  |
| 4345 | matthew 6:4 | Ecclesiasticus 35:6 |  |  |
| 4346 | matthew 6:4 | Ecclesiasticus 35:7 |  | Live text misprint: Ecclesiasticus 35:7 reads 'acceptable. and the memorial' (period for comma); quoted as it stands. |
| 4347 | matthew 6:12 | Ecclesiasticus 28:2 |  |  |
| 4349 | matthew 6:15 | Ecclesiasticus 28:4 |  |  |
| 4351 | matthew 6:20 | Tobit 4:10 |  |  |
| 4352 | matthew 6:20 | Ecclesiasticus 29:11 |  |  |
| 4355 | matthew 6:22 | Ecclesiasticus 35:8 |  |  |
| 4356 | matthew 6:23 | Ecclesiasticus 14:8 |  |  |
| 4357 | matthew 6:23 | Ecclesiasticus 14:9 |  |  |
| 4358 | matthew 6:23 | Ecclesiasticus 14:10 |  |  |
| 4359 | matthew 6:24 | Ecclesiasticus 31:5 |  |  |
| 4360 | matthew 6:24 | Ecclesiasticus 31:6 |  |  |
| 4361 | matthew 6:24 | Ecclesiasticus 31:7 |  |  |
| 4362 | matthew 6:26 | Wisdom of Solomon 5:15 |  |  |
| 4363 | matthew 6:33 | Wisdom of Solomon 5:16 |  |  |
| 4364 | matthew 6:33 | Ecclesiasticus 11:14 |  |  |
| 4368 | matthew 7:12 | Tobit 4:15 |  | Corrected the old note: it attributed Tobit 4:15 to 'the angel Raphael's closing instruction to Tobias'. Tobit 4 is Tobit the father instructing his son; Raphae |
| 4369 | matthew 7:1 | Ecclesiasticus 27:30 |  |  |
| 4370 | matthew 7:2 | Ecclesiasticus 28:1 |  |  |
| 4371 | matthew 7:5 | Ecclesiasticus 28:5 |  |  |
| 4372 | matthew 7:6 | Ecclesiasticus 22:7 |  |  |
| 4373 | matthew 7:6 | Ecclesiasticus 22:8 |  |  |
| 4374 | matthew 7:7 | Wisdom of Solomon 6:12 |  |  |
| 4375 | matthew 7:7 | Wisdom of Solomon 6:13 |  |  |
| 4379 | matthew 7:16 | Ecclesiasticus 27:6 |  |  |
| 4380 | matthew 7:20 | Ecclesiasticus 27:7 |  |  |
| 4381 | matthew 7:24 | Ecclesiasticus 22:16 |  |  |
| 4382 | matthew 7:24 | Ecclesiasticus 22:17 |  |  |
| 4383 | matthew 7:25 | Ecclesiasticus 22:18 |  |  |
| 4384 | matthew 8:11 | Ecclesiasticus 36:11 |  |  |
| 4385 | matthew 8:11 | Ecclesiasticus 36:12 |  |  |
| 4387 | matthew 8:17 | Wisdom of Solomon 2:12 |  |  |
| 4388 | matthew 8:17 | Wisdom of Solomon 2:18 |  | Connection is thin (Wisdom's test of sonship against Matthew's Isaiah quotation); kept the old note's point that the bearing ran through the whole ministry and  |
| 4393 | matthew 8:26 | Wisdom of Solomon 14:3 |  |  |
| 4394 | matthew 8:26 | Wisdom of Solomon 14:4 |  |  |
| 4399 | matthew 9:13 | Ecclesiasticus 35:1 |  |  |
| 4400 | matthew 9:13 | Ecclesiasticus 35:2 |  |  |
| 4401 | matthew 9:13 | Ecclesiasticus 35:3 |  |  |
| 4402 | matthew 9:13 | Tobit 4:7 |  |  |
| 4403 | matthew 9:13 | Tobit 4:9 |  |  |
| 4404 | matthew 9:13 | Tobit 4:10 |  |  |
| 4405 | matthew 9:13 | Tobit 12:9 |  |  |
| 4406 | matthew 9:10 | Ecclesiasticus 12:4 |  | Theology correction: the old note said Sirach 12 taught a wrong, categorical exclusion that the King reversed and superseded — pitting a scripture-level book ag |
| 4407 | matthew 9:11 | Ecclesiasticus 12:5 |  | Theology correction: the old note said Sirach 12 taught a wrong, categorical exclusion that the King reversed and superseded — pitting a scripture-level book ag |
| 4408 | matthew 9:13 | Ecclesiasticus 12:7 |  | Theology correction: the old note said Sirach 12 taught a wrong, categorical exclusion that the King reversed and superseded — pitting a scripture-level book ag |
| 4412 | matthew 9:14 | Tobit 12:8 |  |  |
| 4413 | matthew 9:15 | Ecclesiasticus 34:26 |  |  |
| 4414 | matthew 9:17 | Ecclesiasticus 9:10 |  | Theology correction: the old note read Sirach's old-friend loyalty as itself the Pharisaic old wineskin that bursts — pitting the wisdom book against the gospel |
| 4415 | matthew 9:20 | Ecclesiasticus 38:9 |  | Theology correction: the old note called the woman's touch an 'inversion' or 'bypass' of Sirach's pray-first counsel. Rewritten: Yahusha (Jesus) is the Formed o |
| 4416 | matthew 9:22 | Ecclesiasticus 38:12 |  |  |
| 4417 | matthew 9:25 | Ecclesiasticus 38:14 |  |  |
| 4418 | matthew 9:24 | Wisdom of Solomon 16:13 |  |  |
| 4419 | matthew 9:25 | Wisdom of Solomon 16:14 |  |  |
| 4420 | matthew 9:27 | 2 Esdras 12:31 |  |  |
| 4421 | matthew 9:27 | 2 Esdras 12:32 |  |  |
| 4422 | matthew 9:27 | 2 Esdras 12:34 |  |  |
| 4423 | matthew 9:27 | 2 Esdras 7:28 |  | The old note carried a textual remark that the seeded text's 'Yahusha (Jesus)' at this verse was corrected to 'the Messiah'. The live text already reads 'my son |
| 4429 | matthew 9:37 | 2 Esdras 4:35 |  | Old note said the harvest the souls asked about 'is now plenteous' at the King's arrival. The floor of reward in 2 Esdras is the threshing at the end, not Galil |
| 4430 | matthew 9:38 | 2 Esdras 4:36 |  |  |
| 4433 | matthew 10:6 | 2 Esdras 13:40 |  |  |
| 4434 | matthew 10:6 | 2 Esdras 13:41 |  | Old note quoted 13:41-42 together and its point (keeping the statutes) sits in v.42, so both verses are quoted and cited as 13:41-42. |
| 4435 | matthew 10:23 | 2 Esdras 13:47 |  |  |
| 4436 | matthew 10:6 | Tobit 13:5 |  | Dropped the old note's side reference to Hosea 6:6 / Matthew 9:13; its text was not given and the point stands without it. |
| 4437 | matthew 10:32 | Tobit 13:3 |  | Quoted Tobit 13:3–4 together, as the old note did; the point runs across both verses (confess before the Gentiles, declare his greatness there). |
| 4438 | matthew 10:23 | Tobit 14:5 |  |  |
| 4442 | matthew 10:22 | Ecclesiasticus 2:1 |  |  |
| 4443 | matthew 10:22 | Ecclesiasticus 2:5 |  |  |
| 4444 | matthew 10:28 | Ecclesiasticus 2:18 |  |  |
| 4445 | matthew 10:28 | Wisdom of Solomon 3:1 |  |  |
| 4446 | matthew 10:22 | Wisdom of Solomon 3:5 |  |  |
| 4447 | matthew 10:32 | Wisdom of Solomon 5:1 |  |  |
| 4458 | matthew 11:3 | 2 Esdras 4:33 |  |  |
| 4459 | matthew 11:6 | 2 Esdras 4:34 |  |  |
| 4460 | matthew 11:6 | 2 Esdras 4:35 |  |  |
| 4464 | matthew 11:14 | Ecclesiasticus 48:10 |  |  |
| 4465 | matthew 11:14 | 1 Maccabees 2:58 |  |  |
| 4469 | matthew 11:19 | Wisdom of Solomon 2:12 |  |  |
| 4470 | matthew 11:19 | Wisdom of Solomon 2:15 |  |  |
| 4471 | matthew 11:19 | Wisdom of Solomon 2:20 |  |  |
| 4472 | matthew 11:19 | Ecclesiasticus 24:19 |  |  |
| 4473 | matthew 11:19 | Baruch 3:36 |  |  |
| 4474 | matthew 11:19 | Baruch 4:1 |  |  |
| 4475 | matthew 11:21 | Wisdom of Solomon 6:5 |  |  |
| 4476 | matthew 11:22 | Wisdom of Solomon 6:6 |  |  |
| 4477 | matthew 11:23 | Wisdom of Solomon 6:8 |  |  |
| 4480 | matthew 11:24 | Wisdom of Solomon 10:7 |  |  |
| 4485 | matthew 11:25 | Ecclesiasticus 3:18 |  |  |
| 4486 | matthew 11:25 | Ecclesiasticus 3:19 |  |  |
| 4487 | matthew 11:25 | Wisdom of Solomon 7:7 |  |  |
| 4488 | matthew 11:28 | Ecclesiasticus 51:23 |  |  |
| 4489 | matthew 11:29 | Ecclesiasticus 51:26 |  |  |
| 4490 | matthew 11:30 | Ecclesiasticus 51:27 |  |  |
| 4491 | matthew 11:29 | Ecclesiasticus 6:28 |  |  |
| 4492 | matthew 11:28 | Ecclesiasticus 24:19 |  |  |
| 4495 | matthew 12:12 | 1 Maccabees 2:41 |  |  |
| 4496 | matthew 12:7 | Ecclesiasticus 35:1 |  |  |
| 4497 | matthew 12:7 | Ecclesiasticus 34:18 |  |  |
| 4498 | matthew 12:7 | Tobit 4:10 |  |  |
| 4499 | matthew 12:14 | Wisdom of Solomon 5:1 |  |  |
| 4500 | matthew 12:14 | Wisdom of Solomon 5:4 |  |  |
| 4505 | matthew 12:20 | Ecclesiasticus 4:1 |  |  |
| 4506 | matthew 12:20 | Ecclesiasticus 4:4 |  |  |
| 4507 | matthew 12:20 | Ecclesiasticus 35:14 | Ecclesiasticus 35:13 | Moved from 35:13 to 35:14: the old note quoted the fatherless-and-widow verse, which in the live text is 35:14, not 35:13 ('He will not accept any person agains |
| 4513 | matthew 12:32 | Wisdom of Solomon 12:10 |  |  |
| 4514 | matthew 12:34 | Ecclesiasticus 27:6 |  |  |
| 4515 | matthew 12:36 | Ecclesiasticus 27:7 |  |  |
| 4516 | matthew 12:36 | Wisdom of Solomon 1:11 |  |  |
| 4517 | matthew 12:40 | Wisdom of Solomon 16:13 |  |  |
| 4520 | matthew 12:45 | 2 Esdras 7:48 |  |  |
| 4522 | matthew 12:50 | Wisdom of Solomon 2:13 |  |  |
| 4523 | matthew 12:50 | Wisdom of Solomon 2:18 |  |  |
| 4524 | matthew 12:50 | Ecclesiasticus 4:10 |  | Theology adjustment: the old note read the doing as what 'makes' the doer a son of the Most High; rewritten so the doing reveals the family rather than creates  |
| 4527 | matthew 13:11 | 2 Esdras 5:9 |  |  |
| 4528 | matthew 13:13 | Wisdom of Solomon 1:4 |  |  |
| 4529 | matthew 13:16 | Ecclesiasticus 39:6 |  |  |
| 4532 | matthew 13:24 | 2 Esdras 4:30 |  |  |
| 4533 | matthew 13:25 | 2 Esdras 3:21 |  | Kept the old note's line between the wicked heart inherited by Adam's sons (the wheat) and the tares the enemy sowed (a different seed); wrote it plainly so the |
| 4534 | matthew 13:24 | 2 Esdras 8:6 |  |  |
| 4543 | matthew 13:43 | Wisdom of Solomon 3:7 |  |  |
| 4546 | matthew 13:35 | Wisdom of Solomon 6:22 |  |  |
| 4547 | matthew 13:35 | 2 Esdras 6:26 |  | The old note quoted 2 Esdras 6:26–28 and leaned on v.28 ('the truth, which hath been so long without fruit, shall be declared'), which is not in this packet. I  |
| 4548 | matthew 13:44 | Ecclesiasticus 20:30 |  | Kept the old note's reading of the man who buys the field as the Father through the Son paying the whole price for the scattered seed hidden in the field of the |
| 4549 | matthew 13:45 | Ecclesiasticus 6:14 |  | Left out the old note's identification of the merchant as the Father/Son buying the elect; that reading is not in the voice skill spine I was given, so the card |
| 4550 | matthew 13:45 | Wisdom of Solomon 7:8 |  | Old note identified the buyer of the pearl as the Father or Son who pays all to obtain, citing an internal file (short.md). I could not verify that reading in t |
| 4551 | matthew 13:44 | Wisdom of Solomon 7:14 |  | Old note's buyer reading (Father or Son as the one who finds and pays all) rested on an internal reference I could not confirm in the skill; the rebuilt note le |
| 4553 | matthew 13:49 | 2 Esdras 8:3 |  |  |
| 4555 | matthew 13:49 | Wisdom of Solomon 3:8 |  |  |
| 4556 | matthew 13:39 | Wisdom of Solomon 2:24 |  |  |
| 4559 | matthew 14:3 | Ecclesiasticus 48:1 |  |  |
| 4560 | matthew 14:3 | Ecclesiasticus 48:2 |  |  |
| 4561 | matthew 14:5 | Ecclesiasticus 48:10 |  |  |
| 4562 | matthew 14:12 | Ecclesiasticus 48:11 |  |  |
| 4563 | matthew 14:13 | 2 Esdras 1:19 |  |  |
| 4564 | matthew 14:19 | Wisdom of Solomon 16:20 |  |  |
| 4565 | matthew 14:19 | Wisdom of Solomon 16:26 |  |  |
| 4566 | matthew 14:20 | Ecclesiasticus 24:19 |  |  |
| 4567 | matthew 14:25 | Ecclesiasticus 43:23 |  |  |
| 4568 | matthew 14:25 | Ecclesiasticus 43:25 |  |  |
| 4569 | matthew 14:25 | Wisdom of Solomon 14:3 |  |  |
| 4570 | matthew 14:27 | Wisdom of Solomon 18:15 |  |  |
| 4571 | matthew 14:27 | Ecclesiasticus 24:3 |  | Kept the old note's reading of Matthew 14:27's *it is I* as the Formed Wisdom of Ecclesiasticus 24 naming himself, with John 8:58 alongside. Live text reads *Mo |
| 4572 | matthew 14:27 | Wisdom of Solomon 9:1 |  |  |
| 4573 | matthew 14:3 | Wisdom of Solomon 2:12 |  |  |
| 4574 | matthew 14:5 | Wisdom of Solomon 2:19 |  |  |
| 4575 | matthew 14:10 | Wisdom of Solomon 2:20 |  |  |
| 4576 | matthew 15:4 | Ecclesiasticus 3:1 |  |  |
| 4577 | matthew 15:4 | Ecclesiasticus 3:8 |  |  |
| 4578 | matthew 15:4 | Ecclesiasticus 7:27 |  |  |
| 4579 | matthew 15:6 | Ecclesiasticus 3:16 |  |  |
| 4580 | matthew 15:4 | Tobit 4:3 |  |  |
| 4581 | matthew 15:11 | Ecclesiasticus 15:11 |  |  |
| 4582 | matthew 15:18 | Ecclesiasticus 15:20 |  |  |
| 4583 | matthew 15:18 | Ecclesiasticus 27:6 |  |  |
| 4584 | matthew 15:19 | Wisdom of Solomon 1:11 |  |  |
| 4585 | matthew 15:24 | Ecclesiasticus 36:1 |  |  |
| 4586 | matthew 15:24 | Ecclesiasticus 36:11 |  |  |
| 4587 | matthew 15:24 | 2 Esdras 13:40 |  |  |
| 4588 | matthew 15:24 | 2 Esdras 13:48 |  |  |
| 4589 | matthew 15:24 | Tobit 13:5 |  | The Ezekiel 37:21 quotation is carried over from the old note; its live text was not in the packet, so please check it against the canon. Added one sentence on  |
| 4601 | matthew 16:16 | Wisdom of Solomon 2:18 |  | Old note reached into the nature-of-God question (Formed and Formless against Trinity and its denial); the card does not need it, so the rebuilt note keeps to t |
| 4606 | matthew 16:21 | Wisdom of Solomon 2:12 |  |  |
| 4607 | matthew 16:21 | Wisdom of Solomon 2:16 |  |  |
| 4608 | matthew 16:21 | Wisdom of Solomon 2:20 |  | Old note stacked Galatians 3:13 onto this card; I left it off rather than open the curse-of-the-law question in a four-sentence note. Deuteronomy 21:23 carries  |
| 4609 | matthew 16:21 | Wisdom of Solomon 3:1 |  |  |
| 4610 | matthew 16:21 | Wisdom of Solomon 5:1 |  |  |
| 4611 | matthew 16:18 | Wisdom of Solomon 1:13 |  |  |
| 4612 | matthew 16:18 | Wisdom of Solomon 16:13 |  |  |
| 4614 | matthew 16:18 | 2 Esdras 4:35 |  |  |
| 4615 | matthew 16:27 | Ecclesiasticus 16:12 |  |  |
| 4616 | matthew 16:27 | Ecclesiasticus 16:14 |  |  |
| 4617 | matthew 16:27 | Ecclesiasticus 35:19 |  |  |
| 4618 | matthew 16:27 | 2 Esdras 7:32 |  |  |
| 4619 | matthew 16:27 | 2 Esdras 7:35 |  |  |
| 4687 | matthew 18:15 | Ecclesiasticus 19:13 |  |  |
| 4688 | matthew 18:15 | Ecclesiasticus 19:17 |  |  |
| 4689 | matthew 18:16 | Ecclesiasticus 19:15 |  |  |
| 4690 | matthew 18:17 | Ecclesiasticus 20:2 |  |  |
| 4691 | matthew 18:21 | Ecclesiasticus 27:30 |  |  |
| 4692 | matthew 18:22 | Ecclesiasticus 28:2 |  |  |
| 4693 | matthew 18:33 | Ecclesiasticus 28:3 |  |  |
| 4694 | matthew 18:35 | Ecclesiasticus 28:7 |  |  |
| 4696 | matthew 18:3 | Ecclesiasticus 3:18 |  |  |
| 4697 | matthew 18:4 | Ecclesiasticus 10:14 |  |  |
| 4698 | matthew 18:1 | Ecclesiasticus 10:7 |  |  |
| 4701 | matthew 19:6 | Tobit 8:6 |  |  |
| 4702 | matthew 19:12 | Wisdom of Solomon 3:14 |  |  |
| 4703 | matthew 19:13 | Ecclesiasticus 7:23 |  |  |
| 4704 | matthew 19:14 | Ecclesiasticus 3:1 |  |  |
| 4705 | matthew 19:15 | Tobit 4:3 |  | Thin pairing. The old note was mostly padding (Genesis 48, Numbers 6) around a weak link between Tobit 4:3 and Matthew 19:15; I kept the only real thread, a fat |
| 4706 | matthew 19:17 | Ecclesiasticus 17:11 |  |  |
| 4707 | matthew 19:17 | Ecclesiasticus 29:1 |  |  |
| 4708 | matthew 19:21 | Ecclesiasticus 29:11 |  |  |
| 4709 | matthew 19:21 | Tobit 4:9 |  |  |
| 4718 | matthew 19:28 | Ecclesiasticus 36:11 |  |  |
| 4719 | matthew 19:28 | Wisdom of Solomon 3:8 |  |  |
| 4721 | matthew 20:1 | Ecclesiasticus 24:8 |  |  |
| 4722 | matthew 20:1 | Ecclesiasticus 24:12 |  |  |
| 4723 | matthew 20:15 | Ecclesiasticus 33:13 |  |  |
| 4724 | matthew 20:1 | 2 Esdras 5:23 |  |  |
| 4725 | matthew 20:16 | 2 Esdras 9:22 |  |  |
| 4728 | matthew 20:16 | 2 Esdras 8:1 |  |  |
| 4729 | matthew 20:16 | 2 Esdras 8:3 |  |  |
| 4730 | matthew 20:22 | Wisdom of Solomon 3:1 |  | Old note framed the King's cup as the Tanakh cup of wrath poured out at a substitutionary level; that is more than the card needs and more than the two verses s |
| 4731 | matthew 20:23 | Wisdom of Solomon 5:1 |  |  |
| 4732 | matthew 20:23 | Wisdom of Solomon 5:15 |  |  |
| 4733 | matthew 20:22 | 2 Maccabees 7:37 |  |  |
| 4738 | matthew 20:26 | Ecclesiasticus 3:18 |  | Kept 'Gentiles' from Matthew 20:25 as scripture has it. Dropped the old note's watcher-administration side-thread (Daniel 10, Ephesians 6) as beyond what the ca |
| 4744 | matthew 21:8 | 2 Maccabees 10:7 |  |  |
| 4745 | matthew 21:9 | Ecclesiasticus 36:14 |  |  |
| 4746 | matthew 21:12 | 1 Maccabees 4:43 |  |  |
| 4747 | matthew 21:12 | 2 Maccabees 10:3 |  |  |
| 4748 | matthew 21:13 | Ecclesiasticus 35:12 |  |  |
| 4749 | matthew 21:13 | 1 Maccabees 4:46 |  |  |
| 4750 | matthew 21:19 | Wisdom of Solomon 4:4 |  |  |
| 4751 | matthew 21:19 | Wisdom of Solomon 4:5 |  |  |
| 4752 | matthew 21:19 | Ecclesiasticus 23:25 |  | Sirach 23:25 is spoken of the adulterous woman's children; the tie to the cursed fig tree is the shared sentence of no root and no fruit on unfaithfulness. Kept |
| 4754 | matthew 21:29 | Ecclesiasticus 17:24 |  |  |
| 4755 | matthew 21:30 | Ecclesiasticus 1:28 |  |  |
| 4756 | matthew 21:30 | Ecclesiasticus 1:29 |  |  |
| 4757 | matthew 21:32 | Ecclesiasticus 21:1 |  | Old note quoted part of 21:2 (Flee from sin as from the face of a serpent) as if it were 21:1; the card's point sits in 21:1 alone, so only 21:1 is quoted. |
| 4758 | matthew 21:32 | 2 Esdras 9:11 |  |  |
| 4759 | matthew 21:35 | 2 Esdras 1:32 |  |  |
| 4760 | matthew 21:39 | 2 Esdras 1:33 |  |  |
| 4762 | matthew 21:43 | Ecclesiasticus 36:11 |  |  |
| 4763 | matthew 22:9 | 2 Esdras 2:38 |  |  |
| 4764 | matthew 22:10 | 2 Esdras 2:42 |  |  |
| 4765 | matthew 22:11 | 2 Esdras 2:43 |  |  |
| 4766 | matthew 22:12 | Wisdom of Solomon 5:16 |  |  |
| 4767 | matthew 22:20 | Ecclesiasticus 17:3 |  |  |
| 4768 | matthew 22:21 | Ecclesiasticus 17:11 |  |  |
| 4769 | matthew 22:20 | Wisdom of Solomon 2:23 |  |  |
| 4770 | matthew 22:21 | Wisdom of Solomon 9:1 |  |  |
| 4771 | matthew 22:29 | 2 Maccabees 7:9 |  |  |
| 4772 | matthew 22:32 | 2 Maccabees 7:23 |  |  |
| 4774 | matthew 22:32 | Wisdom of Solomon 3:1 |  |  |
| 4775 | matthew 22:37 | Ecclesiasticus 7:30 |  |  |
| 4776 | matthew 22:39 | Ecclesiasticus 17:14 |  |  |
| 4777 | matthew 22:39 | Ecclesiasticus 28:2 |  |  |
| 4778 | matthew 22:40 | Ecclesiasticus 28:7 |  |  |
| 4779 | matthew 22:40 | Wisdom of Solomon 6:18 |  |  |
| 4785 | matthew 23:12 | Ecclesiasticus 10:14 |  |  |
| 4786 | matthew 23:11 | Ecclesiasticus 3:18 |  |  |
| 4787 | matthew 23:6 | Ecclesiasticus 7:4 |  |  |
| 4788 | matthew 23:6 | Ecclesiasticus 32:1 |  |  |
| 4792 | matthew 23:13 | Wisdom of Solomon 6:4 |  |  |
| 4793 | matthew 23:16 | Ecclesiasticus 23:9 |  |  |
| 4794 | matthew 23:22 | Ecclesiasticus 23:11 |  |  |
| 4795 | matthew 23:18 | Ecclesiasticus 27:14 |  |  |
| 4796 | matthew 23:25 | Ecclesiasticus 1:28 |  |  |
| 4797 | matthew 23:28 | Ecclesiasticus 1:29 |  |  |
| 4800 | matthew 23:25 | Wisdom of Solomon 5:8 |  |  |
| 4803 | matthew 23:37 | 2 Esdras 1:30 |  |  |
| 4804 | matthew 23:34 | 2 Esdras 1:32 |  |  |
| 4805 | matthew 23:38 | 2 Esdras 1:33 |  |  |
| 4815 | matthew 24:10 | 2 Esdras 5:1 |  |  |
| 4816 | matthew 24:29 | 2 Esdras 5:4 |  |  |
| 4817 | matthew 24:10 | 2 Esdras 5:9 |  |  |
| 4818 | matthew 24:30 | 2 Esdras 13:32 |  |  |
| 4819 | matthew 24:31 | 2 Esdras 13:39 |  |  |
| 4820 | matthew 24:46 | Ecclesiasticus 11:26 |  |  |
| 4821 | matthew 24:47 | Ecclesiasticus 16:14 |  |  |
| 4822 | matthew 24:51 | Ecclesiasticus 27:4 |  |  |
| 4823 | matthew 24:46 | Wisdom of Solomon 3:7 |  |  |
| 4828 | matthew 25:31 | Wisdom of Solomon 3:7 |  | Old note tied the shining to 1 Thessalonians 4:13–17 as one gathered-and-caught-up event; the author's teaching keeps 4:16 and 4:17 as separate events, so I dro |
| 4829 | matthew 25:32 | Wisdom of Solomon 3:8 |  |  |
| 4830 | matthew 25:34 | Wisdom of Solomon 5:5 |  |  |
| 4831 | matthew 25:41 | Wisdom of Solomon 5:1 |  |  |
| 4832 | matthew 25:21 | Ecclesiasticus 11:21 |  |  |
| 4833 | matthew 25:26 | Ecclesiasticus 22:1 |  |  |
| 4834 | matthew 25:27 | Ecclesiasticus 33:28 |  |  |
| 4835 | matthew 25:23 | Ecclesiasticus 51:30 |  |  |
| 4836 | matthew 25:10 | 2 Esdras 8:1 |  |  |
| 4837 | matthew 25:12 | 2 Esdras 8:3 |  |  |
| 4838 | matthew 25:30 | 2 Esdras 7:35 |  |  |
| 4840 | matthew 25:35 | Tobit 4:16 |  |  |
| 4841 | matthew 25:36 | Ecclesiasticus 7:32 |  |  |
| 4842 | matthew 25:40 | Ecclesiasticus 29:9 |  |  |
| 4843 | matthew 25:35 | Ecclesiasticus 4:1 |  |  |
| 4844 | matthew 25:40 | Tobit 4:7 |  |  |
| 4855 | matthew 26:28 | 1 Maccabees 1:63 |  |  |
| 4856 | matthew 26:28 | 1 Maccabees 2:50 |  |  |
| 4857 | matthew 26:28 | 2 Maccabees 7:36 |  | Old note ran off into a Reformation/eternal-security digression (Romans 6:14-15, Deuteronomy 28) beyond what these two verses carry; kept only the covenant-of-e |
| 4864 | matthew 26:25 | Ecclesiasticus 6:1 |  |  |
| 4865 | matthew 26:49 | Ecclesiasticus 12:16 |  |  |
| 4866 | matthew 26:50 | Ecclesiasticus 37:2 |  |  |
| 4867 | matthew 26:41 | Ecclesiasticus 2:1 |  |  |
| 4868 | matthew 26:75 | Ecclesiasticus 2:5 |  | Kept the old note's rule-out of once-saved-always-saved, said plainly ('neither finished nor safe'); dropped its 2 Esdras 7:48 and Ezekiel 36 side-threads as no |
| 4881 | matthew 27:45 | 2 Esdras 7:30 |  |  |
| 4882 | matthew 27:51 | 2 Esdras 7:33 |  |  |
| 4883 | matthew 27:52 | 2 Esdras 7:32 |  |  |
| 4890 | matthew 28:6 | Wisdom of Solomon 3:7 |  | Live text of Matthew 28:6 reads *where Yahusha (Lord) lay* — the restoration put the name where the KJV has a bare title; quoted as it stands, but the author ma |
| 4891 | matthew 28:6 | Wisdom of Solomon 3:8 |  | Live text of Matthew 28:6 reads *where Yahusha (Lord) lay* — quoted as it stands; see the same flag on the other Matthew 28:6 card. |
| 4892 | matthew 28:9 | Wisdom of Solomon 5:15 |  |  |
| 4893 | matthew 28:9 | Wisdom of Solomon 5:16 |  |  |
| 4903 | matthew 28:19 | 2 Esdras 13:40 |  |  |
| 4904 | matthew 28:19 | 2 Esdras 13:47 |  |  |
| 7835 | mark 4:20 | 2 Esdras 9:31 |  |  |
| 7837 | mark 4:15 | 2 Esdras 4:30 |  |  |
| 7849 | mark 7:13 | Ecclesiasticus 3:9 |  | Regrade said NOT_FOUND only because the old note quoted the Mark verse first; the Sirach verse is 3:9 as labelled. Rebuilt in place, no move. |
| 7850 | mark 7:12 | Ecclesiasticus 3:8 |  |  |
| 7851 | mark 7:10 | Ecclesiasticus 3:7 |  | Regrade said NOT_FOUND only because the old note quoted the Mark verse first; the Sirach verse is 3:7 as labelled. Rebuilt in place, no move. |
| 7859 | mark 12:26 | Wisdom of Solomon 3:4 |  |  |
| 7860 | mark 12:27 | Wisdom of Solomon 3:1 |  |  |
| 7861 | mark 12:9 | 2 Esdras 5:29 |  | The old note identified Ezra's 'they which did gainsay your promises' with the wicked husbandmen. In 2 Esdras 5:28–29 the ones treading the people down are the  |
| 7862 | mark 12:9 | 2 Esdras 5:27 |  |  |
| 7863 | mark 12:1 | 2 Esdras 5:23 |  |  |
| 7864 | mark 10:25 | Ecclesiasticus 31:7 |  |  |
| 7865 | mark 10:24 | Ecclesiasticus 31:6 |  |  |
| 7866 | mark 10:23 | Ecclesiasticus 31:5 |  |  |
| 7867 | mark 10:21 | Ecclesiasticus 31:8 |  |  |
| 7871 | mark 14:24 | 2 Maccabees 7:36 |  |  |
| 7872 | mark 14:24 | 1 Maccabees 2:50 |  |  |
| 7880 | mark 13:27 | Ecclesiasticus 36:11 |  |  |
| 7881 | mark 13:27 | Baruch 5:5 |  |  |
| 7883 | mark 13:27 | 2 Esdras 13:47 |  |  |
| 7885 | mark 13:27 | 2 Esdras 13:39 |  |  |
| 7888 | luke 1:54 | Ecclesiasticus 36:11 |  |  |
| 7889 | luke 1:54 | Ecclesiasticus 36:12 |  |  |
| 7890 | luke 1:55 | Baruch 4:36 |  |  |
| 7891 | luke 1:55 | Baruch 4:37 |  |  |
| 7895 | luke 3:5 | Baruch 5:7 |  |  |
| 7896 | luke 3:6 | Baruch 5:9 |  |  |
| 7909 | luke 8:15 | 2 Esdras 9:33 |  |  |
| 7910 | luke 8:13 | 2 Esdras 8:41 |  |  |
| 7911 | luke 8:11 | 2 Esdras 9:31 |  |  |
| 7912 | luke 6:49 | Ecclesiasticus 22:18 |  |  |
| 7913 | luke 6:48 | Ecclesiasticus 22:16 |  |  |
| 7915 | luke 6:43 | Ecclesiasticus 27:6 |  |  |
| 7918 | luke 11:52 | Ecclesiasticus 21:15 |  |  |
| 7919 | luke 11:52 | Ecclesiasticus 21:14 |  |  |
| 7920 | luke 11:46 | Ecclesiasticus 10:12 |  |  |
| 7921 | luke 11:43 | Ecclesiasticus 10:13 |  |  |
| 7922 | luke 10:18 | Wisdom of Solomon 2:24 |  |  |
| 7925 | luke 15:24 | 2 Esdras 2:31 |  |  |
| 7926 | luke 15:6 | 2 Esdras 13:40 |  |  |
| 7927 | luke 15:5 | Ecclesiasticus 18:13 |  |  |
| 7928 | luke 13:29 | Ecclesiasticus 36:11 |  |  |
| 7929 | luke 13:29 | Baruch 5:5 |  | Old note leaned on 5:6 (children of the kingdom) for its point, so 5:5-6 are quoted together and cited as Baruch 5:5-6; no move, 5:5 is still the card's verse. |
| 7933 | luke 12:33 | Ecclesiasticus 29:11 |  |  |
| 7934 | luke 12:33 | Tobit 4:10 |  |  |
| 7935 | luke 12:33 | Tobit 4:9 |  |  |
| 7936 | luke 12:20 | Ecclesiasticus 11:18 |  |  |
| 7937 | luke 12:19 | Ecclesiasticus 11:19 |  |  |
| 7939 | luke 19:10 | Ecclesiasticus 36:12 |  |  |
| 7940 | luke 19:10 | Ecclesiasticus 36:11 |  |  |
| 7945 | luke 16:31 | 2 Esdras 7:32 |  |  |
| 7949 | luke 16:13 | Ecclesiasticus 31:7 |  |  |
| 7950 | luke 16:13 | Ecclesiasticus 31:6 |  |  |
| 7951 | luke 16:13 | Ecclesiasticus 31:5 |  |  |
| 7952 | luke 24:26 | Wisdom of Solomon 5:1 |  |  |
| 7953 | luke 24:26 | Wisdom of Solomon 2:20 |  |  |
| 7960 | luke 20:16 | 2 Esdras 5:24 |  |  |
| 7961 | luke 20:9 | 2 Esdras 5:27 |  |  |
| 7980 | john 2:16 | 1 Maccabees 4:36 |  |  |
| 7983 | john 4:14 | Ecclesiasticus 24:21 |  | Reworded the old note's point. It had Wisdom confessing a limit that Yahusha answers, which sets the Wisdom of Ecclesiasticus 24 below him; by the skill that Wi |
| 7985 | john 3:13 | Baruch 3:37 |  |  |
| 7986 | john 3:13 | Baruch 3:30 |  |  |
| 7987 | john 3:13 | Baruch 3:29 |  |  |
| 7994 | john 6:33 | 2 Esdras 1:19 |  |  |
| 7995 | john 6:32 | Wisdom of Solomon 16:26 |  |  |
| 7996 | john 6:31 | Wisdom of Solomon 16:20 |  |  |
| 8003 | john 11:52 | Ecclesiasticus 36:11 |  |  |
| 8004 | john 11:52 | Baruch 5:9 |  |  |
| 8005 | john 11:52 | Baruch 5:5 |  |  |
| 8006 | john 11:52 | Baruch 4:37 |  |  |
| 8009 | john 11:24 | 2 Esdras 7:32 |  |  |
| 8010 | john 10:27 | 2 Esdras 13:33 |  |  |
| 8020 | john 15:5 | Ecclesiasticus 24:23 |  |  |
| 8021 | john 15:1 | Ecclesiasticus 24:17 |  |  |
| 8028 | john 21:17 | Ecclesiasticus 18:14 |  |  |
| 8029 | john 21:15 | 2 Esdras 5:18 |  |  |
| 8030 | john 21:16 | Ecclesiasticus 18:13 |  |  |
| 8031 | john 19:30 | Wisdom of Solomon 2:18 |  |  |
| 8032 | john 19:6 | Wisdom of Solomon 2:20 |  |  |
| 8033 | john 19:5 | Wisdom of Solomon 2:19 |  |  |
| 8034 | john 18:38 | Wisdom of Solomon 2:16 |  |  |
| 8035 | john 19:7 | Wisdom of Solomon 2:13 |  |  |
| 8036 | john 18:3 | Wisdom of Solomon 2:12 |  |  |
| 12188 | romans 15:27 | Tobit 14:6 |  | The old note equated Paul's Gentiles with the nations themselves. Rewritten so Paul's Gentiles are the scattered seed living as Gentiles (the skill's reading),  |
| 12213 | hebrews 1:3 | Wisdom of Solomon 7:25 |  |  |
| 39109 | the-wisdom-of-solomon 1:10 | Ecclesiasticus 23:19 |  |  |
| 39472 | john 6:33 | Wisdom of Solomon 16:21 |  |  |
| 39501 | hebrews 4:12 | Wisdom of Solomon 18:16 |  |  |
| 39532 | matthew 23:28 | Ecclesiasticus 1:29 |  |  |
| 39536 | ecclesiastes 12:13 | Ecclesiasticus 1:26 |  |  |
| 39553 | 1-peter 1:7 | Ecclesiasticus 2:5 |  |  |
| 39555 | ecclesiasticus 2:5 | Wisdom of Solomon 3:6 |  |  |
| 39575 | ecclesiasticus 3:30 | Tobit 4:7 |  |  |
| 39593 | matthew 10:32 | Ecclesiasticus 4:28 |  |  |
| 39600 | proverbs 8:21 | Ecclesiasticus 4:13 |  | Proverbs 8:21 (canon text) contains the word 'substance' (*inherit substance*); it is scripture and left as it reads. |
| 39646 | proverbs 18:24 | Ecclesiasticus 6:6 |  |  |
| 39654 | ecclesiasticus 7:32 | Tobit 4:7 |  | Live-text misprint in Ecclesiasticus 7:32: 'stretch yours hand' (should be 'your hand'). Quoted as it stands. |
| 39657 | proverbs 3:9 | Ecclesiasticus 7:31 |  |  |
| 39850 | proverbs 13:20 | Ecclesiasticus 9:14 |  |  |
| 39851 | psalms 1:2 | Ecclesiasticus 9:15 |  |  |
| 39861 | matthew 5:28 | Ecclesiasticus 9:8 |  |  |
| 39949 | job 1:21 | Ecclesiasticus 14:11 |  |  |
| 39962 | proverbs 15:3 | Ecclesiasticus 15:18 |  |  |
| 39982 | ecclesiasticus 16:8 | Ecclesiasticus 10:13 |  |  |
| 40333 | ezekiel 18:30 | Ecclesiasticus 17:26 |  |  |
| 40334 | ezekiel 18:32 | Ecclesiasticus 17:24 |  |  |
| 40336 | james 4:8 | Ecclesiasticus 17:25 |  |  |
| 40341 | galatians 5:16 | Ecclesiasticus 18:30 |  |  |
| 40346 | james 1:19 | Ecclesiasticus 18:19 |  |  |
| 40348 | ecclesiastes 5:4 | Ecclesiasticus 18:22 |  |  |
| 40349 | ecclesiasticus 18:15 | Tobit 4:7 |  |  |
| 40357 | psalms 145:9 | Ecclesiasticus 18:13 |  |  |
| 40359 | psalms 103:15 | Ecclesiasticus 18:9 |  |  |
| 40364 | matthew 7:16 | Ecclesiasticus 19:29 |  |  |
| 40394 | proverbs 17:28 | Ecclesiasticus 20:5 |  |  |
| 40410 | proverbs 9:10 | Ecclesiasticus 21:11 |  |  |
| 40411 | proverbs 9:6 | Ecclesiasticus 21:1 |  |  |
| 40999 | matthew 18:21 | Ecclesiasticus 28:4 |  |  |
| 41021 | matthew 5:42 | Ecclesiasticus 29:2 |  |  |
| 41051 | proverbs 23:2 | Ecclesiasticus 31:12 |  |  |
| 41710 | proverbs 28:8 | Ecclesiasticus 34:20 |  |  |
| 41847 | job 14:1 | Ecclesiasticus 40:1 |  |  |
| 42674 | genesis 17:1 | Ecclesiasticus 44:20 |  |  |
| 42676 | hebrews 11:7 | Ecclesiasticus 44:17 |  |  |
| 42684 | hebrews 11:1 | Ecclesiasticus 44:7 |  | Live Hebrews 11:1 text contains the word 'substance' inside the quoted verse itself; left as scripture reads. |
| 43706 | hebrews 9:12 | Ecclesiasticus 50:15 |  |  |
| 43747 | tobit 1:8 | Tobit 4:7 |  |  |
| 43759 | tobit 2:14 | Tobit 4:7 |  |  |
| 43801 | luke 11:41 | Tobit 4:7 |  |  |
| 43847 | malachi 2:15 | Tobit 8:7 |  |  |
| 44008 | daniel 11:30 | Judith 4:7 |  |  |
| 44166 | psalms 148:5 | Judith 16:14 |  |  |
| 44173 | 1-corinthians 1:27 | Judith 16:6 |  |  |
| 44240 | leviticus 26:41 | The Rest of Esther 14:6 |  |  |
| 44243 | deuteronomy 7:6 | The Rest of Esther 14:5 |  |  |
| 44245 | the-rest-of-esther 14:14 | Judith 9:11 |  |  |
| 44297 | ezra 6:10 | Baruch 1:10 |  | Old note's point (prayer for Nebuchadnezzar) sits in v.11, so 1:10-11 are quoted together and cited as Baruch 1:10-11. |
| 44339 | isaiah 49:18 | Baruch 4:36 |  |  |
| 44345 | isaiah 66:13 | Baruch 4:22 |  |  |
| 44355 | deuteronomy 30:14 | Baruch 4:1 |  | Old note's point (take hold of it) sits in v.2, so 4:1-2 are quoted together and cited as Baruch 4:1-2. |
| 44383 | deuteronomy 4:28 | Baruch 6:51 |  |  |
| 44509 | 1-maccabees 2:37 | 1 Maccabees 1:63 |  |  |
| 44573 | exodus 23:11 | 1 Maccabees 6:54 |  |  |
| 44607 | isaiah 31:1 | 1 Maccabees 8:18 |  |  |
| 44698 | zechariah 3:10 | 1 Maccabees 14:12 |  |  |
| 44757 | joshua 5:13 | 2 Maccabees 3:25 |  |  |
| 44762 | 2-maccabees 3:10 | Tobit 4:7 |  |  |
| 44766 | exodus 22:22 | 2 Maccabees 3:10 |  |  |
| 44777 | malachi 2:8 | 2 Maccabees 4:14 |  |  |
| 44786 | micah 3:11 | 2 Maccabees 4:8 |  |  |
| 44866 | numbers 25:11 | 2 Maccabees 10:35 |  |  |
| 45038 | 1-corinthians 5:7 | 1 Esdras 7:14 |  |  |
| 45051 | ezra 9:15 | 1 Esdras 8:89 |  |  |
| 45054 | isaiah 6:13 | 1 Esdras 8:70 |  | The word 'substance' in this card is inside the verbatim KJV text of Isaiah 6:13, not in the note's prose; left as the source reads. |
| 45078 | ezra 10:8 | 1 Esdras 9:4 |  | The word 'substance' in this card is inside the verbatim KJV text of Ezra 10:8, not in the note's prose; left as the source reads. |
| 45181 | revelation 20:12 | 2 Esdras 6:20 |  |  |
| 45212 | luke 18:14 | 2 Esdras 8:49 |  |  |
| 45221 | matthew 7:13 | 2 Esdras 8:1 |  |  |
| 49190 | 2-corinthians 9:7 | Tobit 4:7 |  |  |
| 52030 | philippians 2:6 | Wisdom of Solomon 7:25 |  |  |
| 55059 | colossians 1:16 | Ecclesiasticus 24:9 |  |  |
| 56814 | 1-timothy 5:16 | Tobit 4:7 |  |  |
| 56890 | psalms 19:11 | Ecclesiasticus 24:23 |  |  |
| 57479 | titus 3:14 | Tobit 4:7 |  |  |
| 57480 | titus 3:8 | Tobit 4:9 |  |  |
| 58679 | psalms 147:19 | Ecclesiasticus 24:23 |  |  |
| 60259 | testaments-xii 100:7 | Ecclesiasticus 28:7 |  |  |
| 65423 | psalms 37:3 | Ecclesiasticus 2:6 |  |  |
| 71513 | proverbs 3:9 | Ecclesiasticus 35:8 |  |  |
| 71934 | isaiah 55:1 | Ecclesiasticus 24:19 |  |  |
| 90159 | psalms 105:21 | Wisdom of Solomon 10:14 |  |  |
| 108669 | exodus 22:21 | Tobit 4:7 |  |  |
| 119997 | matthew 6:1 | Tobit 4:7 |  | Corrected the old note: it called Tobit 4:7 'secret-handed giving', but the verse says nothing about secrecy. The real link is whose face the giver seeks (the F |
| 135262 | hosea 12:8 | Ecclesiasticus 27:1 |  |  |
| 147791 | 1-samuel 25:26 | Ecclesiasticus 28:1 |  |  |
| 177372 | numbers 18:7 | 3 Maccabees 1:11 |  |  |

## Job 2 — 22 quotations re-quoted from the live text and 3 citations widened to the verses spanned (address unchanged)

| card | other end | Apocrypha | kind | why |
|---|---|---|---|---|
| 11561 | romans 5:12 | Wisdom of Solomon 2:24 | REQUOTE | second quotation in a standing note was off the live text (restoration drift / old register / gapped quote cited to one verse) — re-quoted verbatim, prose kept; |
| 12154 | romans 14:2 | Tobit 1:10 | REQUOTE | Same verse, different register (brethren/brothers, commas). Replaced the quoted verse with the live text; prose kept. |
| 13139 | revelation 7:14 | 2 Esdras 2:45 | REQUOTE | Same verse; old quote had 'So he answered'. Replaced with the live opening. Member note already quotes verbatim. |
| 14230 | revelation 15:2 | Wisdom of Solomon 10:20 | REQUOTE | second quotation in a standing note was off the live text (restoration drift / old register / gapped quote cited to one verse) — re-quoted verbatim, prose kept; |
| 15208 | 1-corinthians 2:9 | Wisdom of Solomon 3:4 | REQUOTE | second quotation in a standing note was off the live text (restoration drift / old register / gapped quote cited to one verse) — re-quoted verbatim, prose kept; |
| 15943 | 1-corinthians 15:42 | Wisdom of Solomon 3:1 | REQUOTE | second quotation in a standing note was off the live text (restoration drift / old register / gapped quote cited to one verse) — re-quoted verbatim, prose kept; |
| 39194 | john 1:5 | Wisdom of Solomon 7:29 | CITE_RANGE | The quotation runs across 7:29 ('found before') and 7:30 ('vice shall not prevail'). Kept the card at 7:29, cited the range, and widened the 7:29 phrase so the  |
| 39384 | jubilees 16:6 | Wisdom of Solomon 10:6 | REQUOTE | The flagged quote was the Jubilees (other) side; the Apocrypha verse was only cited. Put Wisdom 10:6 on the page in full, quoted Jubilees 16:6 from the live tex |
| 39439 | the-wisdom-of-solomon 14:27 | Wisdom of Solomon 13:1 | REQUOTE | Same verse; live text has 'Yahuah (God)' for 'God'. Replaced; moved the 14:27 phrase from single quotes to italics. |
| 39960 | james 1:15 | Ecclesiasticus 15:20 | REQUOTE | Same verse; 'no man licence to sin' was a compression. Quoted the live verse whole and fixed the citation to Ecclesiasticus. |
| 42695 | hebrews 5:4 | Ecclesiasticus 45:7 | REQUOTE | The regrade proposed 45:24, but 'he made with him' and 'everlasting covenant' are both in the live 45:7. Kept the address, widened the phrase, fixed the citatio |
| 58818 | james 5:12 | Ecclesiasticus 23:9 | REQUOTE | second quotation in a standing note was off the live text (restoration drift / old register / gapped quote cited to one verse) — re-quoted verbatim, prose kept; |
| 58822 | james 5:14 | Ecclesiasticus 38:9 | REQUOTE | second quotation in a standing note was off the live text (restoration drift / old register / gapped quote cited to one verse) — re-quoted verbatim, prose kept; |
| 71554 | proverbs 8:27 | Wisdom of Solomon 9:9 | REQUOTE | Same verse, different register (thee/you). Replaced the verse and the callback phrase; member re-quoted and bare '(8:27)' given its book. |
| 103290 | psalms 122:6 | Tobit 13:14 | REQUOTE | Same verse, different register (thee/you). Replaced; member phrase made one contiguous live span instead of an ellipsis. |
| 122689 | matthew 10:29 | Wisdom of Solomon 16:26 | REQUOTE | Same verse, different register. Replaced; member phrase made contiguous. |
| 122693 | matthew 10:37 | Ecclesiasticus 7:27 | CITE_RANGE | The note quoted 7:27–28 in the old register; both verses are given live (7:28 is apoc.next), so both re-quoted, cited as a range at the 7:27 address. The paraph |
| 135977 | john 5:39 | Ecclesiasticus 24:23 | REQUOTE | second quotation in a standing note was off the live text (restoration drift / old register / gapped quote cited to one verse) — re-quoted verbatim, prose kept; |
| 137924 | amos 6:7 | Ecclesiasticus 5:8 | REQUOTE | Same verse; re-quoted verbatim including the live 'yours heart'. LIVE-TEXT MISPRINT: Ecclesiasticus 5:8 reads 'Set not yours heart' (also 'yours hands' at 38:10 |
| 139531 | micah 3:10 | Ecclesiasticus 34:22 | REQUOTE | Same verse, different register (taketh/takes). Replaced; citations fixed to Ecclesiasticus and Micah 3:11 given its book. The Micah 3:11 phrases are kept from t |
| 140754 | luke 11:31 | Ecclesiasticus 47:17 | REQUOTE | Same verse, different register (thee/you). Replaced; citation fixed to Ecclesiasticus. |
| 142047 | deuteronomy 1:33 | Wisdom of Solomon 18:3 | REQUOTE | Same verse, different register (thou/you). Replaced the verse and the callback; bare 'Yahuah' given its parenthetical. |
| 146283 | job 29:16 | Ecclesiasticus 4:10 | REQUOTE | Same verse, different register (shalt thou/shall you). Replaced; citation fixed to Ecclesiasticus; member phrase made contiguous. |
| 176192 | 2-chronicles 33:13 | Prayer of Manasseh 1:11 | CITE_RANGE | The flagged quote was the canon side (33:12–13). Put the Apocrypha verse first in italics (1:11 plus 1:12, which is apoc.next, both live), quoted 2 Chronicles 3 |
| 177475 | jeremiah 4:23 | 2 Esdras 7:30 | REQUOTE | The flagged quote was Jeremiah 4:23–26 (canon side) leading the note. Reordered so 2 Esdras 7:30 stands first in italics and Jeremiah 4:23 is quoted from text_c |

## Job 3 — 63 cards whose citation printed the database slug: English book name

44669, 44670, 44671, 44672, 44673, 44674, 44675, 44676, 44677, 44678, 44679, 44680, 44681, 44682, 44683, 44684, 44745, 44746, 44747, 44748, 44749, 44750, 44751, 44752, 44753, 44754, 44755, 44756, 44759, 44760, 44761, 44765, 44862, 44863, 44864, 44865, 44867, 44868, 44869, 44870, 44871, 44872, 44873, 44874, 44875, 44876, 44877, 44878, 44879, 44880, 44881, 44882, 44883, 44884, 44885, 44886, 44887, 44888, 44889, 44890, 44891, 177390, 177395

## Member notes — 607

| thread | card | kind |
|---|---|---|
| 10742 | 45038 | PROSE |
| 10747 | 45054 | PROSE |
| 10748 | 45051 | PROSE |
| 10750 | 45078 | PROSE |
| 412 | 4855 | PROSE |
| 10572 | 44509 | PROSE |
| 183 | 4495 | PROSE |
| 412 | 4856 | PROSE |
| 630 | 7872 | PROSE |
| 119 | 4465 | PROSE |
| 662 | 7980 | PROSE |
| 387 | 4746 | PROSE |
| 387 | 4749 | PROSE |
| 10594 | 44573 | PROSE |
| 10602 | 44607 | PROSE |
| 10626 | 44698 | PROSE |
| 205 | 4563 | PROSE |
| 664 | 7994 | PROSE |
| 400 | 4803 | PROSE |
| 390 | 4759 | PROSE |
| 400 | 4804 | PROSE |
| 390 | 4760 | PROSE |
| 400 | 4805 | PROSE |
| 646 | 7925 | PROSE |
| 391 | 4763 | PROSE |
| 391 | 4764 | PROSE |
| 391 | 4765 | PROSE |
| 196 | 4533 | PROSE |
| 196 | 4532 | PROSE |
| 620 | 7837 | PROSE |
| 117 | 4458 | PROSE |
| 117 | 4459 | PROSE |
| 104 | 4429 | PROSE |
| 117 | 4460 | PROSE |
| 227 | 4614 | PROSE |
| 104 | 4430 | PROSE |
| 403 | 4815 | PROSE |
| 403 | 4816 | PROSE |
| 194 | 4527 | PROSE |
| 403 | 4817 | PROSE |
| 676 | 8029 | PROSE |
| 381 | 4724 | PROSE |
| 626 | 7863 | PROSE |
| 651 | 7960 | PROSE |
| 626 | 7862 | PROSE |
| 651 | 7961 | PROSE |
| 626 | 7861 | PROSE |
| 10784 | 45181 | PROSE |
| 200 | 4547 | PROSE |
| 101 | 4423 | PROSE |
| 419 | 4881 | PROSE |
| 228 | 4618 | PROSE |
| 419 | 4883 | PROSE |
| 648 | 7945 | PROSE |
| 668 | 8009 | PROSE |
| 419 | 4882 | PROSE |
| 228 | 4619 | PROSE |
| 408 | 4838 | PROSE |
| 192 | 4520 | PROSE |
| 382 | 4728 | PROSE |
| 408 | 4836 | PROSE |
| 10795 | 45221 | PROSE |
| 202 | 4553 | PROSE |
| 382 | 4729 | PROSE |
| 408 | 4837 | PROSE |
| 196 | 4534 | PROSE |
| 637 | 7910 | PROSE |
| 10798 | 45212 | PROSE |
| 389 | 4758 | PROSE |
| 381 | 4725 | PROSE |
| 620 | 7835 | PROSE |
| 637 | 7911 | PROSE |
| 637 | 7909 | PROSE |
| 101 | 4420 | PROSE |
| 101 | 4421 | PROSE |
| 101 | 4422 | PROSE |
| 403 | 4818 | PROSE |
| 667 | 8010 | PROSE |
| 403 | 4819 | PROSE |
| 628 | 7885 | PROSE |
| 106 | 4433 | PROSE |
| 221 | 4587 | PROSE |
| 424 | 4903 | PROSE |
| 646 | 7926 | PROSE |
| 106 | 4434 | PROSE |
| 106 | 4435 | PROSE |
| 424 | 4904 | PROSE |
| 628 | 7883 | PROSE |
| 221 | 4588 | PROSE |
| 10648 | 44766 | PROSE |
| 10650 | 44757 | PROSE |
| 10653 | 44786 | PROSE |
| 10655 | 44777 | PROSE |
| 393 | 4771 | PROSE |
| 393 | 4772 | PROSE |
| 412 | 4857 | PROSE |
| 630 | 7871 | PROSE |
| 383 | 4733 | PROSE |
| 387 | 4747 | PROSE |
| 386 | 4744 | PROSE |
| 10686 | 44866 | PROSE |
| 43175 | 177372 | PROSE |
| 10507 | 44297 | PROSE |
| 660 | 7987 | PROSE |
| 660 | 7986 | PROSE |
| 122 | 4473 | PROSE |
| 660 | 7985 | PROSE |
| 122 | 4474 | PROSE |
| 10522 | 44355 | PROSE |
| 10525 | 44345 | PROSE |
| 632 | 7890 | PROSE |
| 10527 | 44339 | PROSE |
| 632 | 7891 | PROSE |
| 669 | 8006 | PROSE |
| 628 | 7881 | PROSE |
| 645 | 7929 | PROSE |
| 669 | 8005 | PROSE |
| 634 | 7895 | PROSE |
| 634 | 7896 | PROSE |
| 669 | 8004 | PROSE |
| 10536 | 44383 | PROSE |
| 9141 | 39536 | PROSE |
| 389 | 4755 | PROSE |
| 399 | 4796 | PROSE |
| 389 | 4756 | PROSE |
| 399 | 4797 | PROSE |
| 9142 | 39532 | PROSE |
| 109 | 4442 | PROSE |
| 415 | 4867 | PROSE |
| 109 | 4443 | PROSE |
| 415 | 4868 | PROSE |
| 9143 | 39553 | PROSE |
| 16263 | 65423 | PROSE |
| 109 | 4444 | PROSE |
| 219 | 4576 | PROSE |
| 377 | 4704 | PROSE |
| 622 | 7851 | PROSE |
| 219 | 4577 | PROSE |
| 30909 | 4577 | PROSE |
| 622 | 7850 | PROSE |
| 622 | 7849 | PROSE |
| 219 | 4579 | PROSE |
| 126 | 4485 | PROSE |
| 375 | 4696 | PROSE |
| 384 | 4738 | PROSE |
| 396 | 4786 | PROSE |
| 126 | 4486 | PROSE |
| 187 | 4505 | PROSE |
| 409 | 4843 | PROSE |
| 187 | 4506 | PROSE |
| 193 | 4524 | PROSE |
| 9157 | 39600 | PROSE |
| 9158 | 39593 | PROSE |
| 415 | 4864 | PROSE |
| 9166 | 39646 | PROSE |
| 201 | 4549 | PROSE |
| 127 | 4491 | PROSE |
| 396 | 4787 | PROSE |
| 377 | 4703 | PROSE |
| 219 | 4578 | PROSE |
| 394 | 4775 | PROSE |
| 9175 | 39657 | PROSE |
| 409 | 4841 | PROSE |
| 9232 | 39861 | PROSE |
| 98 | 4414 | PROSE |
| 9235 | 39850 | PROSE |
| 9235 | 39851 | PROSE |
| 375 | 4698 | PROSE |
| 642 | 7920 | PROSE |
| 642 | 7921 | PROSE |
| 9270 | 39982 | PROSE |
| 375 | 4697 | PROSE |
| 396 | 4785 | PROSE |
| 60 | 4364 | PROSE |
| 643 | 7936 | PROSE |
| 643 | 7937 | PROSE |
| 407 | 4832 | PROSE |
| 404 | 4820 | PROSE |
| 95 | 4406 | PROSE |
| 95 | 4407 | PROSE |
| 95 | 4408 | PROSE |
| 415 | 4865 | PROSE |
| 58 | 4356 | PROSE |
| 58 | 4357 | PROSE |
| 58 | 4358 | PROSE |
| 9257 | 39949 | PROSE |
| 220 | 4581 | PROSE |
| 9264 | 39962 | PROSE |
| 220 | 4582 | PROSE |
| 228 | 4615 | PROSE |
| 228 | 4616 | PROSE |
| 404 | 4821 | PROSE |
| 392 | 4767 | PROSE |
| 378 | 4706 | PROSE |
| 392 | 4768 | PROSE |
| 394 | 4776 | PROSE |
| 389 | 4754 | PROSE |
| 9363 | 40334 | PROSE |
| 9363 | 40336 | PROSE |
| 9363 | 40333 | PROSE |
| 9365 | 40359 | PROSE |
| 646 | 7927 | PROSE |
| 676 | 8030 | PROSE |
| 9366 | 40357 | PROSE |
| 676 | 8028 | PROSE |
| 9368 | 40346 | PROSE |
| 9368 | 40348 | PROSE |
| 9369 | 40341 | PROSE |
| 373 | 4687 | PROSE |
| 373 | 4689 | PROSE |
| 373 | 4688 | PROSE |
| 9374 | 40364 | PROSE |
| 373 | 4690 | PROSE |
| 9375 | 40394 | PROSE |
| 201 | 4548 | PROSE |
| 389 | 4757 | PROSE |
| 9380 | 40411 | PROSE |
| 9381 | 40410 | PROSE |
| 642 | 7919 | PROSE |
| 642 | 7918 | PROSE |
| 407 | 4833 | PROSE |
| 64 | 4372 | PROSE |
| 64 | 4373 | PROSE |
| 68 | 4381 | PROSE |
| 68 | 7913 | PROSE |
| 68 | 4382 | PROSE |
| 68 | 4383 | PROSE |
| 68 | 7912 | PROSE |
| 52 | 4336 | PROSE |
| 398 | 4793 | PROSE |
| 52 | 4337 | PROSE |
| 52 | 4338 | PROSE |
| 398 | 4794 | PROSE |
| 9006 | 39109 | PROSE |
| 388 | 4752 | PROSE |
| 207 | 4571 | PROSE |
| 381 | 4721 | PROSE |
| 13316 | 55059 | PROSE |
| 381 | 4722 | PROSE |
| 672 | 8021 | PROSE |
| 122 | 4472 | PROSE |
| 127 | 4492 | PROSE |
| 205 | 4566 | PROSE |
| 18046 | 71934 | PROSE |
| 661 | 7983 | PROSE |
| 672 | 8020 | PROSE |
| 13792 | 56890 | PROSE |
| 14356 | 58679 | PROSE |
| 33848 | 135262 | PROSE |
| 404 | 4822 | PROSE |
| 67 | 4379 | PROSE |
| 190 | 4514 | PROSE |
| 220 | 4583 | PROSE |
| 67 | 7915 | PROSE |
| 67 | 4380 | PROSE |
| 190 | 4515 | PROSE |
| 398 | 4795 | PROSE |
| 63 | 4369 | PROSE |
| 374 | 4691 | PROSE |
| 63 | 4370 | PROSE |
| 36511 | 147791 | PROSE |
| 56 | 4347 | PROSE |
| 374 | 4692 | PROSE |
| 394 | 4777 | PROSE |
| 374 | 4693 | PROSE |
| 56 | 4349 | PROSE |
| 9542 | 40999 | PROSE |
| 63 | 4371 | PROSE |
| 374 | 4694 | PROSE |
| 394 | 4778 | PROSE |
| 14820 | 60259 | PROSE |
| 378 | 4707 | PROSE |
| 9547 | 41021 | PROSE |
| 409 | 4842 | PROSE |
| 57 | 4352 | PROSE |
| 378 | 4708 | PROSE |
| 644 | 7933 | PROSE |
| 59 | 4359 | PROSE |
| 625 | 7866 | PROSE |
| 647 | 7951 | PROSE |
| 59 | 4360 | PROSE |
| 625 | 7865 | PROSE |
| 647 | 7950 | PROSE |
| 59 | 4361 | PROSE |
| 625 | 7864 | PROSE |
| 647 | 7949 | PROSE |
| 625 | 7867 | PROSE |
| 9559 | 41051 | PROSE |
| 396 | 4788 | PROSE |
| 381 | 4723 | PROSE |
| 407 | 4834 | PROSE |
| 184 | 4497 | PROSE |
| 9744 | 41710 | PROSE |
| 97 | 4413 | PROSE |
| 93 | 4399 | PROSE |
| 30589 | 4399 | PROSE |
| 184 | 4496 | PROSE |
| 30604 | 4496 | PROSE |
| 93 | 4400 | PROSE |
| 93 | 4401 | PROSE |
| 55 | 4345 | PROSE |
| 55 | 4346 | PROSE |
| 58 | 4355 | PROSE |
| 17935 | 71513 | PROSE |
| 387 | 4748 | PROSE |
| 187 | 4507 | PROSE |
| 228 | 4617 | PROSE |
| 221 | 4585 | PROSE |
| 69 | 4384 | PROSE |
| 221 | 4586 | PROSE |
| 380 | 4718 | PROSE |
| 390 | 4762 | PROSE |
| 628 | 7880 | PROSE |
| 632 | 7888 | PROSE |
| 645 | 7928 | PROSE |
| 650 | 7940 | PROSE |
| 669 | 8003 | PROSE |
| 69 | 4385 | PROSE |
| 632 | 7889 | PROSE |
| 650 | 7939 | PROSE |
| 386 | 4745 | PROSE |
| 415 | 4866 | PROSE |
| 99 | 4415 | PROSE |
| 99 | 4416 | PROSE |
| 99 | 4417 | PROSE |
| 194 | 4529 | PROSE |
| 9772 | 41847 | PROSE |
| 206 | 4567 | PROSE |
| 206 | 4568 | PROSE |
| 10004 | 42684 | PROSE |
| 10007 | 42676 | PROSE |
| 10008 | 42674 | PROSE |
| 38 | 4287 | PROSE |
| 204 | 4559 | PROSE |
| 204 | 4560 | PROSE |
| 38 | 4288 | PROSE |
| 30411 | 4288 | PROSE |
| 119 | 4464 | PROSE |
| 30600 | 4464 | PROSE |
| 204 | 4561 | PROSE |
| 204 | 4562 | PROSE |
| 38 | 4290 | PROSE |
| 10311 | 43706 | PROSE |
| 127 | 4488 | PROSE |
| 127 | 4489 | PROSE |
| 30603 | 4489 | PROSE |
| 127 | 4490 | PROSE |
| 407 | 4835 | PROSE |
| 10406 | 44008 | PROSE |
| 10491 | 44245 | PROSE |
| 10469 | 44173 | PROSE |
| 10471 | 44166 | PROSE |
| 10492 | 44243 | PROSE |
| 10493 | 44240 | PROSE |
| 194 | 4528 | PROSE |
| 190 | 4516 | PROSE |
| 220 | 4584 | PROSE |
| 227 | 4611 | PROSE |
| 70 | 4387 | PROSE |
| 121 | 4469 | PROSE |
| 208 | 4573 | PROSE |
| 226 | 4606 | PROSE |
| 675 | 8036 | PROSE |
| 46 | 4318 | PROSE |
| 193 | 4522 | PROSE |
| 675 | 8035 | PROSE |
| 121 | 4470 | PROSE |
| 46 | 4319 | PROSE |
| 226 | 4607 | PROSE |
| 675 | 8034 | PROSE |
| 46 | 4320 | PROSE |
| 70 | 4388 | PROSE |
| 193 | 4523 | PROSE |
| 224 | 4601 | PROSE |
| 675 | 8031 | PROSE |
| 208 | 4574 | PROSE |
| 675 | 8033 | PROSE |
| 46 | 4321 | PROSE |
| 121 | 4471 | PROSE |
| 208 | 4575 | PROSE |
| 226 | 4608 | PROSE |
| 654 | 7953 | PROSE |
| 675 | 8032 | PROSE |
| 392 | 4769 | PROSE |
| 203 | 4556 | PROSE |
| 641 | 7922 | PROSE |
| 48 | 4326 | PROSE |
| 110 | 4445 | PROSE |
| 226 | 4609 | PROSE |
| 383 | 4730 | PROSE |
| 393 | 4774 | PROSE |
| 627 | 7860 | PROSE |
| 627 | 7859 | PROSE |
| 110 | 4446 | PROSE |
| 9143 | 39555 | PROSE |
| 199 | 4543 | PROSE |
| 404 | 4823 | PROSE |
| 406 | 4828 | PROSE |
| 421 | 4890 | PROSE |
| 202 | 4555 | PROSE |
| 380 | 4719 | PROSE |
| 406 | 4829 | PROSE |
| 421 | 4891 | PROSE |
| 48 | 4327 | PROSE |
| 376 | 4702 | PROSE |
| 388 | 4750 | PROSE |
| 388 | 4751 | PROSE |
| 110 | 4447 | PROSE |
| 185 | 4499 | PROSE |
| 226 | 4610 | PROSE |
| 383 | 4731 | PROSE |
| 406 | 4831 | PROSE |
| 654 | 7952 | PROSE |
| 185 | 4500 | PROSE |
| 406 | 4830 | PROSE |
| 399 | 4800 | PROSE |
| 60 | 4362 | PROSE |
| 383 | 4732 | PROSE |
| 421 | 4892 | PROSE |
| 60 | 4363 | PROSE |
| 391 | 4766 | PROSE |
| 421 | 4893 | PROSE |
| 397 | 4792 | PROSE |
| 123 | 4475 | PROSE |
| 123 | 4476 | PROSE |
| 123 | 4477 | PROSE |
| 65 | 4374 | PROSE |
| 30025 | 4374 | PROSE |
| 65 | 4375 | PROSE |
| 394 | 4779 | PROSE |
| 200 | 4546 | PROSE |
| 126 | 4487 | PROSE |
| 201 | 4550 | PROSE |
| 201 | 4551 | PROSE |
| 1711 | 12213 | PROSE |
| 12597 | 52030 | PROSE |
| 207 | 4572 | PROSE |
| 392 | 4770 | PROSE |
| 124 | 4480 | PROSE |
| 22645 | 90159 | PROSE |
| 189 | 4513 | PROSE |
| 54 | 4342 | PROSE |
| 54 | 4343 | PROSE |
| 72 | 4393 | PROSE |
| 206 | 4569 | PROSE |
| 72 | 4394 | PROSE |
| 100 | 4418 | PROSE |
| 191 | 4517 | PROSE |
| 227 | 4612 | PROSE |
| 100 | 4419 | PROSE |
| 205 | 4564 | PROSE |
| 30906 | 4564 | PROSE |
| 664 | 7996 | PROSE |
| 9119 | 39472 | PROSE |
| 205 | 4565 | PROSE |
| 664 | 7995 | PROSE |
| 207 | 4570 | PROSE |
| 9128 | 39501 | PROSE |
| 219 | 4580 | PROSE |
| 377 | 4705 | PROSE |
| 94 | 4402 | PROSE |
| 409 | 4844 | PROSE |
| 9153 | 39575 | PROSE |
| 9176 | 39654 | PROSE |
| 9367 | 40349 | PROSE |
| 10322 | 43747 | PROSE |
| 10329 | 43759 | PROSE |
| 10336 | 43801 | PROSE |
| 10648 | 44762 | PROSE |
| 11926 | 49190 | PROSE |
| 13768 | 56814 | PROSE |
| 13966 | 57479 | PROSE |
| 27300 | 108669 | PROSE |
| 30016 | 119997 | PROSE |
| 94 | 4403 | PROSE |
| 378 | 4709 | PROSE |
| 644 | 7935 | PROSE |
| 13966 | 57480 | PROSE |
| 57 | 4351 | PROSE |
| 94 | 4404 | PROSE |
| 184 | 4498 | PROSE |
| 644 | 7934 | PROSE |
| 62 | 4368 | PROSE |
| 30026 | 4368 | PROSE |
| 409 | 4840 | PROSE |
| 376 | 4701 | PROSE |
| 10358 | 43847 | PROSE |
| 97 | 4412 | PROSE |
| 94 | 4405 | PROSE |
| 107 | 4437 | PROSE |
| 107 | 4436 | PROSE |
| 221 | 4589 | PROSE |
| 107 | 4438 | PROSE |
| 1707 | 12188 | PROSE |
| 1695 | 12154 | REQUOTE |
| 9037 | 39194 | REQUOTE |
| 9089 | 39384 | REQUOTE |
| 9110 | 39439 | REQUOTE |
| 9264 | 39960 | REQUOTE |
| 10014 | 42695 | REQUOTE |
| 17942 | 71554 | REQUOTE |
| 26059 | 103290 | REQUOTE |
| 30596 | 122689 | REQUOTE |
| 30597 | 122693 | REQUOTE |
| 34391 | 137924 | REQUOTE |
| 34702 | 139531 | REQUOTE |
| 34943 | 140754 | REQUOTE |
| 35198 | 142047 | REQUOTE |
| 36188 | 146283 | REQUOTE |
| 42953 | 176192 | REQUOTE |
| 393 | 4773 | MEMBER_REQUOTE |
| 665 | 7992 | MEMBER_REQUOTE |
| 1507 | 11562 | MEMBER_REQUOTE |
| 2442 | 15195 | MEMBER_REQUOTE |
| 2445 | 15208 | MEMBER_REQUOTE |
| 2652 | 15937 | MEMBER_REQUOTE |
| 2655 | 15943 | MEMBER_REQUOTE |
| 14385 | 58818 | MEMBER_REQUOTE |
| 14386 | 58822 | MEMBER_REQUOTE |
| 14388 | 58833 | MEMBER_REQUOTE |
| 17320 | 69244 | MEMBER_REQUOTE |
| 19383 | 77279 | MEMBER_REQUOTE |
| 19863 | 79231 | MEMBER_REQUOTE |
| 20129 | 80393 | MEMBER_REQUOTE |
| 20776 | 82784 | MEMBER_REQUOTE |
| 30189 | 120781 | MEMBER_REQUOTE |
| 30190 | 120788 | MEMBER_REQUOTE |
| 34722 | 139622 | MEMBER_REQUOTE |
| 34945 | 140767 | MEMBER_REQUOTE |
| 38196 | 155336 | MEMBER_REQUOTE |
| 42094 | 172334 | MEMBER_REQUOTE |
| 43064 | 176786 | MEMBER_REQUOTE |
| 43065 | 176796 | MEMBER_REQUOTE |
| 67 | 7914 | MEMBER_REWRITE |
| 628 | 7884 | MEMBER_REWRITE |
| 645 | 7931 | MEMBER_REWRITE |
| 645 | 7930 | MEMBER_REWRITE |
| 661 | 7982 | MEMBER_REWRITE |
| 666 | 8016 | MEMBER_REWRITE |
| 666 | 8014 | MEMBER_REWRITE |
| 10622 | 44684 | MEMBER_REWRITE |
| 10622 | 44683 | MEMBER_REWRITE |
| 10622 | 44682 | MEMBER_REWRITE |
| 10623 | 44681 | MEMBER_REWRITE |
| 10623 | 44680 | MEMBER_REWRITE |
| 10623 | 44679 | MEMBER_REWRITE |
| 10623 | 44678 | MEMBER_REWRITE |
| 10623 | 44677 | MEMBER_REWRITE |
| 10624 | 44676 | MEMBER_REWRITE |
| 10624 | 44675 | MEMBER_REWRITE |
| 10624 | 44674 | MEMBER_REWRITE |
| 10624 | 44673 | MEMBER_REWRITE |
| 10625 | 44672 | MEMBER_REWRITE |
| 10625 | 44671 | MEMBER_REWRITE |
| 10625 | 44670 | MEMBER_REWRITE |
| 10625 | 44669 | MEMBER_REWRITE |
| 10648 | 44765 | MEMBER_REWRITE |
| 10649 | 44761 | MEMBER_REWRITE |
| 10649 | 44760 | MEMBER_REWRITE |
| 10649 | 44759 | MEMBER_REWRITE |
| 10650 | 44756 | MEMBER_REWRITE |
| 10650 | 44755 | MEMBER_REWRITE |
| 10650 | 44754 | MEMBER_REWRITE |
| 10650 | 44753 | MEMBER_REWRITE |
| 10651 | 44752 | MEMBER_REWRITE |
| 10651 | 44751 | MEMBER_REWRITE |
| 10651 | 44750 | MEMBER_REWRITE |
| 10651 | 44749 | MEMBER_REWRITE |
| 10652 | 44748 | MEMBER_REWRITE |
| 10652 | 44747 | MEMBER_REWRITE |
| 10652 | 44746 | MEMBER_REWRITE |
| 10652 | 44745 | MEMBER_REWRITE |
| 10683 | 44877 | MEMBER_REWRITE |
| 10683 | 44876 | MEMBER_REWRITE |
| 10683 | 44875 | MEMBER_REWRITE |
| 10683 | 44874 | MEMBER_REWRITE |
| 10683 | 44873 | MEMBER_REWRITE |
| 10684 | 44872 | MEMBER_REWRITE |
| 10684 | 44871 | MEMBER_REWRITE |
| 10684 | 44870 | MEMBER_REWRITE |
| 10685 | 44869 | MEMBER_REWRITE |
| 10685 | 44868 | MEMBER_REWRITE |
| 10685 | 44867 | MEMBER_REWRITE |
| 10686 | 44865 | MEMBER_REWRITE |
| 10687 | 44864 | MEMBER_REWRITE |
| 10687 | 44863 | MEMBER_REWRITE |
| 10687 | 44862 | MEMBER_REWRITE |
| 10688 | 44891 | MEMBER_REWRITE |
| 10688 | 44890 | MEMBER_REWRITE |
| 10689 | 44889 | MEMBER_REWRITE |
| 10689 | 44888 | MEMBER_REWRITE |
| 10689 | 44887 | MEMBER_REWRITE |
| 10689 | 44886 | MEMBER_REWRITE |
| 10690 | 44885 | MEMBER_REWRITE |
| 10690 | 44884 | MEMBER_REWRITE |
| 10690 | 44883 | MEMBER_REWRITE |
| 10691 | 44882 | MEMBER_REWRITE |
| 10691 | 44881 | MEMBER_REWRITE |
| 10691 | 44880 | MEMBER_REWRITE |
| 10692 | 44879 | MEMBER_REWRITE |
| 10692 | 44878 | MEMBER_REWRITE |
| 13707 | 56573 | MEMBER_REWRITE |
| 15982 | 64446 | MEMBER_REWRITE |
| 15996 | 64489 | MEMBER_REWRITE |
| 43184 | 177395 | MEMBER_REWRITE |
| 43186 | 177390 | MEMBER_REWRITE |
| 14387 | 58828 | MEMBER_REQUOTE |

## Thread summaries — 55

- thread 9007: Dropped 'cited again and again in the live apparatus'; added parentheticals on bare Yahuah / Elohim in prose.
- thread 9093: Slug citation fixed; parenthetical added on Yashar'el.
- thread 9094: Three slug citations fixed; plain 'Israel' in prose restored to Yashar'el (Israel).
- thread 9095: Slug citation fixed.
- thread 9096: Slug citation fixed; 'the deuterocanon' reworded. Note: the thread anchors at 11:21 but the summary quotes only 11:22; the anchor verse itself is never quoted.
- thread 9097: Three slug citations fixed; 'Psalms 145:9' → 'Psalm 145:9'; parenthetical added on bare Yahuah.
- thread 9117: Both Wisdom quotes replaced with the live text (your/you/are). 'Son of man' → 'Son of Adam' in John 3:14. Canon quote carried unrestored 'the LORD'; restored to Yahuah (LORD). Parentheticals added on 
- thread 9118: Both Wisdom quotes replaced with the live text. Canon quote 1 Samuel 2:6 carried unrestored 'The LORD'; restored to Yahuah (LORD).
- thread 9119: Both Wisdom quotes replaced with the live text (live uses curly apostrophes). 'the substance' closing reworded. Canon quote Exodus 16:4 'the LORD' restored to Yahuah (LORD); parentheticals added.
- thread 9120: Wisdom quote replaced with the live text. Canon quotes carried unrestored 'the LORD' / 'God'; restored to Yahuah (LORD) / Elohim (God). Parentheticals added.
- thread 9121: Both Wisdom quotes replaced with the live text. Canon quotes carried unrestored 'the LORD' / 'Israel'; restored to Yahuah (LORD) / Yashar'el (Israel).
- thread 9149: 'the apparatus Ben Sira raises' → plain prose. Note: anchor is 3:1 but the summary quotes 3:2 onward; 3:1 itself is not quoted.
- thread 9153: Parenthetical added on Messiah; 'Tobit's gospel of mercy' → 'Tobit's counsel of mercy'. No jargon found otherwise.
- thread 9157: 'the live Wisdom of Solomon, Sirach's apocryphal sister' → 'the Wisdom of Solomon, Sirach's sister book'; parenthetical added on Yahuah.
- thread 9160: Ecclesiasticus 5:4 quote corrected to the live text ('Say not', not 'And say not'). Note: anchor is 5:3 but the summary quotes only 5:4.
- thread 9176: 'the restored Tobit, ben Sira's apocryphal sibling' and 'library to library' reworded.
- thread 9259: Hyphen chain 'the dwelling-under-her-branches of Sirach 14' rewritten as a sentence.
- thread 9260: Hyphen chain 'the same wisdom-out-of-Torah witness' rewritten; parenthetical added on bare Yahuah.
- thread 9262: Removed the internal '★ no-author-of-evil verse' marker and 'the other restored shelf'; 'anti-fatalism, the same clean Elohim' rewritten in plain prose; parenthetical added.
- thread 9367: Hebrew book name 'Mishle' → 'Proverbs'; parenthetical added on Yahusha; 'the restored library' → 'the whole library'.
- thread 9557: 'The wisdom-stream is one' → 'The witness is one'.
- thread 9744: No jargon found; 34:20 quote aligned to the live curly apostrophe in 'father’s'. 'substance' here is only inside the Proverbs 28:8 quotation.
- thread 9772: Hyphen chains 'womb-to-dust arc' and 'going-out-and-returning' rewritten; parenthetical added on bare Yahuah.
- thread 10006: 'whose own witness, the live apparatus, testifies' → 'whose own book still testifies'.
- thread 10302: Citations '(Sirach 49:6)' / '(Sirach 49:7)' → Ecclesiasticus; 'word for word in substance' and 'The deuterocanon' reworded.
- thread 10309: 'the substance' → 'the One it foreshadows'; parentheticals added. 50:7 half of the quote not checked against live (only 50:6 supplied); left as it stood.
- thread 10312: 'the substance toward which it all points' → 'the One toward whom it all points'.
- thread 10327: Tobit 2:10 quote trimmed to the live wording (dropped the leading 'and' that is not in the live verse). Note: anchor is 2:9 but the summary quotes only 2:10.
- thread 10329: 'The Master' named as Yahusha (Jesus); 'no empty works' → 'no empty gesture' so alms are not framed in works-vs-grace terms; parenthetical added. Note: anchor is 2:13 but the summary quotes 2:14 onwar
- thread 10335: Tobit 4:8 quote aligned to the live capital 'If'; parenthetical added on Yahusha; 'substance' appears only inside the Tobit quotation.
- thread 10336: Parenthetical added on Yahusha; 'substance' appears only inside the Tobit quotation.
- thread 10445: Hyphen chain 'weak-confound-the-mighty pattern' rewritten; parentheticals added on Yahuah, Messiah, and Miriam (Mary).
- thread 10447: Hyphen chains ('direct my way / direct my prayer', 'washing-and-coming-in-clean', 'sunset-to-sunset') rewritten as sentences.
- thread 10469: Hyphen chains 'hand-of-a-woman victory' and 'serpent-head' rewritten; parenthetical added on Messiah.
- thread 10471: Hyphen chain 'creation-by-the-word' rewritten. Prose on the judgment now follows Isaiah's own picture (carcases abhorred by all flesh) so the Judith 16:17 'weep for ever' is not read as conscious eter
- thread 10490: Slug citation fixed; parenthetical added on Messiah. Note: anchor is 14:1 but the summary quotes only 14:2.
- thread 10491: Two slug citations fixed.
- thread 10492: Slug citation fixed.
- thread 10493: Slug citation fixed.
- thread 10494: Slug citation fixed.
- thread 10495: Slug citation fixed.
- thread 10526: Hyphen chain 'The seek-him-and-return' rewritten.
- thread 10550: Susanna 1:35 quote aligned to live 'Yahuah (God)'; parentheticals added to bare 'Yahuah' in the 1:42, Psalm 37:33 and 2 Peter 2:9 quotations (name restoration only, wording untouched). Hyphen chain re
- thread 10602: 'we weave it honestly' and hyphen chain 'the new going-down-to-Egypt' rewritten.
- thread 10648: 'the substance of the helpless' → 'the living of the helpless'; 'the restored Tobit' → 'Tobit'; parenthetical added on Yahuah.
- thread 10713: 'word for word in substance' → 'in nearly the same words'.
- thread 10750: 'word for word in substance' → 'in nearly the same words'.
- thread 10756: 'reveals its substance' → 'reveals what it pointed to'; parentheticals added on Messiah, Yahusha, Sha'ul (Paul).
- thread 10761: 'the live Revelation apparatus' → 'John's Revelation'. 2 Esdras 2:10 aligned to live parentheticals. Theology guard added: 2 Esdras 2:10–11 is commonly read as the church replacing Israel; one sentenc
- thread 10766: 'the very self-link of the live Revelation apparatus' removed. 2 Esdras 2:42 aligned to live 'Yahuah (God)'; parentheticals added to bare Yahuah in 2:45 and 2:47 and to Elohim/Messiah/Yahusha in prose
- thread 10780: Hyphen chain 'people-that-shall-come' rewritten; parentheticals added on Sha'ul (Paul) and Yashar'el.
- thread 10781: Hyphen chain 'the why-not-all-at-once' rewritten.
- thread 10838: Hyphen chain 'mighty-hand-and-stretched-arm' rewritten. Note: anchor is 15:10 but the summary quotes only 15:11.
- thread 43184: Slug citation fixed. Note: anchor is 3:1 but the summary quotes 3:7 and 3:4, not 3:1.
- thread 43186: Slug citation fixed. Note: anchor is 3:24 but the summary quotes 3:25–26, not 3:24.

## Voice cold-read findings (all applied)

- 4287: VOICE — a side quotation of Matthew 3:11 is left unrestored in body text; the convention restores Holy Ghost to Ruach HaKodesh with the parenthetical in every scripture quotation inside the prose.
- 4288: VOICE — covenant people-name without its restored form; the house of Judah in prose is Yahudah (Judah) at every mention.
- 4351: VOICE — 'the library' is an internal reference the reader cannot see; the note should name the speaker or the book.
- 4393: THEOLOGY — the verse addresses the Father, and the note puts the one addressed as Father asleep in the boat, collapsing Father and Son into one (modalism). Yahusha (Jesus) is the Formed one through whom the Father's prov
- 4412: VOICE — 'the library' is an internal reference the reader cannot see.
- 4473: THEOLOGY — invented reading not carried by the old note or the skill: wisdom personified as the one who 'walked among them in flesh,' making Yahusha (Jesus) the feminine Wisdom figure of the wisdom books. The skill holds
- 4474: THEOLOGY — invented reading: Yahusha (Jesus) is named as 'Wisdom herself,' a Christ-as-Sophia identification the old note did not carry and the skill does not hold. The point stands without it: the one who gave the law h
- 4487: FIDELITY / THEOLOGY. Neither verse says the babes asked; Matthew 11:25 says the Father hid and revealed. Making the asking the cause of the receiving runs the cause-and-effect backward (the response creating the gift) an
- 4491: VOICE. The closing sentence jabs at the reader ("has not read either verse") instead of naming the system that taught him. The posture is patience toward the person and dismantling of the system.
- 4559: FIDELITY. The colon makes Ahab's house the one who laid hold on the prophet and bound him; Elijah was never caught. Jezebel sought his life, but the binding is Herod's alone.
- 4572: THEOLOGY and VOICE. The one who spoke from the bush was the Formed one, not the Formless Father; the framework holds that every spoken appearance of Elohim in the Torah and prophets is the Son. Also "the Elohim of his fa
- 4575: FIDELITY. Matthew 14 records a birthday, a dance and an oath; it does not say Herod was drunk. The word is an embellishment the two verses do not carry.
- 4581: THEOLOGY. "The food does not cause the defilement" stated flat is the pulpit's reading of Matthew 15 (all foods clean, Leviticus 11 abolished). The matter in the chapter is bread eaten with unwashed hands, a tradition of
- 4582: THEOLOGY. Same risk as 4581: "not the food" without the unwashed-hands context reads as the Torah's food laws set aside. The chapter is about the tradition of the elders, not Leviticus 11.
- 4583: THEOLOGY. "Nothing the Father made defiles the man" is a blanket principle that overturns Leviticus 11; the Father made the swine and the carrion too, and the Torah calls them unclean. Matthew 15 is about unwashed hands 
- 4587: THEOLOGY. Naming the woman of Canaan and then "the limit of his sending" leaves the reader to conclude she stood outside it and was helped as a mercy case. The framework reads her as seed revealed by hearing, one of the 
- 4730: Fidelity. Wisdom 3:1 speaks of the righteous after they have died (the chapter goes on: in the sight of the unwise they seemed to die), and the sister card 4774 reads it that way, as the dead kept and asleep in the Fathe
- 4819: Fidelity (speaker). In 2 Esdras 13 the one interpreting the vision speaks of 'my Son' (13:32, 13:37), so the speaker is the Most High, and the sister card 4818 treats him that way. This note hands the same speech to 'the
- 4831: Fidelity. Revelation 20:10 says the devil is cast into the lake 'where the beast and the false prophet are'; they were already there from 19:20, so the devil is not received 'first'. Neither quoted verse says anything ab
- 4881: FIDELITY. The quoted 2 Esdras 7:30 compares the old silence to 'the former judgments'; the prose glosses it as the silence 'before anything was made', which the quoted verse does not say.
- 7871: THEOLOGY / FIDELITY. The covenant the martyrs died under was already sealed in blood at Sinai (Exodus 24:8); saying it 'had not yet been sealed in blood' cuts against the card's own point that it is one covenant, and rea
- 7921: FIDELITY. Yahusha (Jesus) pronounces the woe on the Pharisees themselves ('Woe unto you, Pharisees!'); the closing line rewrites the verse so the woe falls on the seat and not the man, which neither verse says and which 
- 7983: FIDELITY / INVENTED READING. The two verses say opposite things about thirst (Sirach: 'shall yet be thirsty'; Yahusha: 'shall never thirst'), and the rewrite flattens the contrast into 'not a different drink'. The old no
- 12188: THEOLOGY/FIDELITY — the prose sets Paul's Gentiles as the scattered seed (correct) and Tobit's 'all nations' as the nations, then calls the collection 'that turning made tangible,' which collapses the scattered seed back
- 43759: FIDELITY — 'He does not take the words back' reads as though Tobit spoke the reproach, but the words quoted are Anna's; the sentence misattributes the speaker and leaves the reader unsure what Tobit is not retracting.
- 10761: FIDELITY/THEOLOGY (soft). The rewrite adds a sentence the old text did not carry and that none of the quoted verses carry: 2 Esdras 2:10-11 as quoted says 'Tell my people... the kingdom of Jerusalem, which I would have g
- 10684: FIDELITY (wording, inherited from old but now stated more flatly). The note says the recovered temple 'is the first fulfilment of the abomination of desolation' — the recovery is not the abomination; Antiochus' profanati

## For Yoshi (nothing blocked on these)

- Pearl / treasure cards 4548, 4549, 4550, 4551 (Ecclesiasticus 20:30, 6:14, Wisdom 7:8, 7:14 → Matthew 13:44–46): SETTLED Oct 23 (Yoshi: the seed of promise has always been the few, called treasure, likened to gold of the dust of the earth — that is us, and the land buyer is Yahuah). All four now carry it.
- 4705 (Tobit 4:3 / Matthew 19:15) is a thin pairing — a father's blessing and children brought for blessing; consider retiring.
- 4547 (2 Esdras 6:26 / Matthew 13:35): the old note leaned on 6:28 ("the truth, which hath been so long without fruit, shall be declared"); rebuilt on 6:26 with 6:28 in prose — the card may belong at 6:28.
- 12188 (Tobit 14:6 / Romans 15:27): rewritten so Paul's Gentiles are the scattered seed and Tobit's turning of the nations stays what Tobit saw; needs your eye.
- 10761 (2 Esdras 2:10 thread): a guard sentence against the replacement reading was added, with Romans 11:1 quoted beside it. Confirm.
- Live Apocrypha text misprints (quoted as they stand): a thee/thine→you/yours pass left "yours hand" (Ecclesiasticus 7:32, 38:10), "yours heart" (5:8), "yours holy angels" (Tobit 11:14), "faithfull friend" (Ecclesiasticus 6:14), "acceptable. and the memorial" (35:7). The live Apocrypha is a half-modernized register throughout ("brings", "you hatest") — S454's 0.85-ratio diff called it faithful; a word-level pass like S455b's canon diff would show how far it sits from the KJV 1611.
- canon.json Matthew 28:6 reads "where Yahusha (Lord) lay" — the S182 NT-Lord rule would keep "the Lord" there; for the canon lane.
- 2,746 Apocrypha cards (and the 13 Rest of Esther glosses) still carry the canon-first gloss shape — the canon verse quoted, the Apocrypha verse only described. Not broken, but not Come-and-See; a later pass if wanted.
- Nine anchored summaries never quote their anchor verse (9096, 9149, 9160, 10327, 10329, 10490, 10838, 43184, 43186) — left as they stood.
- Still open from S463b: Jubilees 28948/28949 on 45:13; Jubilees 32:19 "Ana I shall give" / 32:21 "through- out"; the S251 "The restored witness carries…" openers.
