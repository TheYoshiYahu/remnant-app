# Matthew orphan-card map (S495 Phase 2)

- Model: **claude-sonnet-5-5 (Sonnet 5.5)**
- Session: S495 (Phase 2), generated 2026-11-08
- Source: `/home/claude/s495/live/canon__matthew.json` (read-only; nothing in `live/` was modified)
- Method: every orphan card graded by script against its own `t_text` (word-level verbatim check), `grade.py` rules below; no prose was rewritten.

## Grade rules
- **DOCREF**: the note names Red Line / voice skill / the framework / S-number / Yoshi / SUMMATION / FRAMEWORK-MAJOR / teaching corpus / Q-flag / backticked thread slug / "1234 of Truth" (token listed). Wins over every other grade.
- **BARE**: note carries a `thread:slug |` prefix, OR has no quotation of the target verse (label-like, no quotation, italics from another verse, or quotes only the source verse).
- **PARTIAL**: quotes the target as a phrase, with an ellipsis, or not verbatim to the live text; OR quotes the whole verse verbatim but carries jargon (substance, architecture, register, wisdom-stream, motif, prototype, marker, locked, grid, ...) or a 3+ segment hyphen-chain.
- **FULL**: quotes the whole target verse verbatim in italics (word-for-word against `t_text`, punctuation/case ignored) and the prose has no jargon token or hyphen-chain. `shape_gaps` notes if it lacks a citation or any prose.
- `grade_ignoring_prefix` = the grade the note body would earn without the `thread:slug |` prefix. Bare-sacred-name flags (Yahuah/Yahusha/Elohim/... without a parenthetical in the prose) are informational and do not change the grade.

## Headline counts

- Orphan cards: **1308** — FULL **24**, PARTIAL **454**, BARE **776**, DOCREF **54**
- Quote kinds: {'near-not-verbatim': 182, 'whole-not-verbatim': 26, 'none': 811, 'phrase': 256, 'whole': 29, 'whole-elided': 4}
- BARE reasons: {'italics not from target': 121, 'no quotation': 59, 'label-like': 591, 'quotes source verse only': 4, 'prefix': 1}
- Jargon tokens (cards): {'substance': 309, 'architecture': 22, 'wisdom-stream': 6, 'pre-figur': 5, 'grid': 2, 'locked': 1, 'motif': 1, 'apparatus': 1, 'marker': 1}; cards with a 3+ hyphen-chain: 451
- DOCREF tokens: {'the framework': 23, 'Red Line': 13, 'framework (other use)': 9, '1234 of Truth': 3, 'backticked thread slug': 3, 'SUMMATION': 2, 'voice skill': 2, 'S-number': 1, 'FRAMEWORK-MAJOR': 1} — 45 cards carry a house-document reference (Red Line / voice skill / 'the framework' / S-number / SUMMATION / FRAMEWORK-MAJOR / Q-flag / slug); 9 more use the bare word 'framework' only (still jargon, but arguably ordinary English)
- `thread:` prefix notes: 1 (slug exists: 0)
- Cards flagged dup: **59** (0 on the same pair, 44 on the reversed Matthew-to-Matthew pair, 15 with a reversed card in the Mark/Luke file; the dup card's id, book and any thread it already sits in are in the JSON `dup_with`); distinct dup pairs involving an orphan: 40
- Proposed groups: **177 existing threads joined** (921 cards; confidence {'high': 326, 'medium': 595}) and **91 new threads** (387 cards; 28 of them under 3 cards)
- Unanchored threads: 144 total; 140 with Matthew members (anchor proposed), 1 with 0 members, 3 with members only outside Matthew

## Per chapter

| ch | orphans | FULL | PARTIAL | BARE | DOCREF | cards joined | cards in new | groups joined | groups new | dup cards | dup pairs |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 49 | 0 | 22 | 23 | 4 | 42 | 7 | 9 | 2 | 1 | 1 |
| 2 | 29 | 1 | 12 | 16 | 0 | 23 | 6 | 11 | 3 | 0 | 0 |
| 3 | 17 | 1 | 5 | 9 | 2 | 7 | 10 | 5 | 2 | 1 | 1 |
| 4 | 20 | 1 | 10 | 9 | 0 | 18 | 2 | 4 | 1 | 0 | 0 |
| 5 | 22 | 0 | 13 | 6 | 3 | 19 | 3 | 8 | 2 | 2 | 2 |
| 6 | 49 | 2 | 28 | 16 | 3 | 44 | 5 | 8 | 2 | 0 | 0 |
| 7 | 14 | 0 | 10 | 4 | 0 | 14 | 0 | 7 | 0 | 1 | 1 |
| 8 | 27 | 0 | 8 | 18 | 1 | 23 | 4 | 7 | 2 | 1 | 1 |
| 9 | 38 | 0 | 20 | 18 | 0 | 31 | 7 | 10 | 2 | 2 | 2 |
| 10 | 54 | 0 | 13 | 36 | 5 | 25 | 29 | 7 | 4 | 8 | 8 |
| 11 | 27 | 1 | 9 | 15 | 2 | 27 | 0 | 7 | 0 | 1 | 1 |
| 12 | 37 | 0 | 8 | 27 | 2 | 34 | 3 | 11 | 2 | 3 | 3 |
| 13 | 65 | 2 | 16 | 42 | 5 | 58 | 7 | 13 | 3 | 0 | 0 |
| 14 | 42 | 0 | 9 | 33 | 0 | 34 | 8 | 6 | 3 | 1 | 1 |
| 15 | 41 | 0 | 10 | 26 | 5 | 31 | 10 | 6 | 2 | 1 | 1 |
| 16 | 38 | 1 | 8 | 26 | 3 | 35 | 3 | 9 | 2 | 7 | 7 |
| 17 | 51 | 0 | 10 | 40 | 1 | 38 | 13 | 4 | 4 | 5 | 5 |
| 18 | 50 | 1 | 19 | 30 | 0 | 38 | 12 | 6 | 2 | 2 | 2 |
| 19 | 72 | 1 | 38 | 31 | 2 | 55 | 17 | 5 | 4 | 2 | 2 |
| 20 | 56 | 0 | 17 | 38 | 1 | 37 | 19 | 5 | 4 | 4 | 4 |
| 21 | 88 | 0 | 25 | 60 | 3 | 64 | 24 | 5 | 6 | 1 | 1 |
| 22 | 62 | 0 | 20 | 40 | 2 | 45 | 17 | 5 | 4 | 3 | 3 |
| 23 | 70 | 0 | 27 | 42 | 1 | 52 | 18 | 5 | 6 | 6 | 6 |
| 24 | 92 | 3 | 35 | 47 | 7 | 35 | 57 | 5 | 9 | 5 | 5 |
| 25 | 69 | 10 | 33 | 26 | 0 | 52 | 17 | 4 | 4 | 2 | 1 |
| 26 | 67 | 0 | 17 | 49 | 1 | 15 | 52 | 3 | 9 | 0 | 0 |
| 27 | 37 | 0 | 8 | 29 | 0 | 6 | 31 | 3 | 5 | 0 | 0 |
| 28 | 25 | 0 | 4 | 20 | 1 | 19 | 6 | 6 | 2 | 0 | 0 |

(groups joined/new are counted per chapter, so a thread spanning chapters is counted once in each; the global group counts are above.)

## DOCREF list (54 Matthew cards)

| id | ref | tokens | context |
|---|---|---|---|
| 2543 | 6:14 -> matthew 18:32 | the framework | …servant — the king reverses the forgiveness; the framework's NT illustration of the principle. |
| 2594 | 1:23 -> 1-corinthians 15:28 | the framework | …t account for the eschatological submission; the framework's Formless-and-Formed reading carries it nat… |
| 2641 | 3:7 -> john 3:1 | the framework | …y night — the individual Pharisee who turns, the framework's victim-not-enemy posture applied. |
| 2644 | 3:13 -> 2-kings 2:6 | the framework | …prophetic-mantle-transfer at the same river; the framework reads the gospel's choice of Yarden (Jordan)… |
| 2670 | 5:31 -> genesis 2:24 | the framework | … will explicitly cite this at Matt 19:4-9 as the framework against the Pharisees' Devarim (Deuteronomy)… |
| 2761 | 11:27 -> 1-corinthians 8:6 | framework (other use) | … by whom are all things* — Paul's Father-Son framework statement. |
| 2762 | 11:27 -> hebrews 1:1 | framework (other use) | …son* — the Hebrews-Christology in Father-Son framework. |
| 2776 | 12:1 -> daniel 7:25 | the framework | …e antichrist-system's Daniel 7:25 substance; the framework rules out the institutional-Christian-claim … |
| 2796 | 12:46 -> mark 7:9 | the framework | …indictment defending the fifth-commandment — the framework rules out the anti-family reading of Matt 12… |
| 2802 | 13:30 -> ezekiel 20:33 | the framework | …er the rod in the wilderness of the people — the framework's eschatological architecture. |
| 2803 | 13:41 -> ezekiel 20:33 | the framework | …er the rod in the wilderness of the people — the framework's eschatological architecture. |
| 2807 | 13:30 -> zechariah 13:8 | SUMMATION | …fier of lineage-claim-alone per `_COMMENTARY_SUMMATION.md` §V. |
| 2810 | 13:36 -> revelation 14:14 | the framework | …f the earth and the winepress of the wrath — the framework's Revelation-reading carries the harvest-arc… |
| 2831 | 13:33 -> genesis 18:6 | the framework | …venant-meal at Yahuah's (the LORD's) visit — the framework reads the leaven-hidden-in-the-covenant-meal… |
| 2866 | 15:9 -> 1-john 2:3 | voice skill, 1234 of Truth | …-to-Torah test as the master-filter (per the voice skill's 1234 of Truth) — the same diagnostic appli… ‖ … as the master-filter (per the voice skill's 1234 of Truth) — the same diagnostic applied to all five J… |
| 2875 | 15:21 -> luke 4:25 | the framework | …cedents at his Natsareth (Nazareth)-sermon — the framework-precedent the King articulates. |
| 2876 | 15:24 -> matthew 28:19 | Red Line | …extension to Three-Categories-#3 nations per Red Line #7. |
| 2882 | 15:18 -> ezekiel 36:26 | the framework | The new-heart promise that is the framework's-answer to the heart's-substance. |
| 2903 | 16:21 -> zechariah 12:10 | SUMMATION | …oming-recognition-substance per `_COMMENTARY_SUMMATION.md` §V. |
| 2907 | 16:21 -> galatians 3:13 | the framework | …rse of the law, being made a curse for us* — the framework's curse-of-the-law-as-Deuteronomy-28-exile-j… |
| 2908 | 16:21 -> romans 6:14 | the framework | … and the consequence-system-still-operative; the framework's-grace-architecture. |
| 3238 | 1:11 -> jeremiah 22:24 | framework (other use) | …ing upon the throne of David* — addressed in framework reading through Yoseph's (Joseph's) legal ad… |
| 3241 | 1:19 -> deuteronomy 24:1 | framework (other use) | …orah-righteous response operates within this framework. |
| 3247 | 1:24 -> exodus 13:2 | the framework | …n* — the Torah's firstborn-consecration sets the framework for Yahusha (Jesus) as firstborn. |
| 3276 | 5:4 -> ezekiel 9:4 | the framework | …igh and that cry for all the abominations* — the framework reading: mourning is the prophetic-cry again… |
| 3284 | 5:17 -> luke 16:17 | the framework | … the Lukan parallel of Matt 5:18, confirming the framework reading. |
| 3292 | 6:1 -> matthew 5:16 | the framework | …fy your Father* — the apparent-tension verse the framework resolves by motive-distinction. |
| 3311 | 6:16 -> matthew 4:2 | framework (other use) | …wn forty-day wilderness fast — the immediate framework-prefigure. |
| 3355 | 8:22 -> exodus 20:12 | the framework | The fifth commandment; the Torah-substance the framework preserves; Yahusha (Jesus) is not abolishing… |
| 3392 | 10:5 -> romans 1:16 | framework (other use) | …Jew) first, and also to the Greek* — read in framework continuity as the scattered-seed-in-the-nati… |
| 3393 | 10:5 -> romans 15:8 | framework (other use) | …the promises made unto the fathers* — Paul's framework-statement of the King's mission-scope. |
| 3406 | 10:22 -> hebrews 10:36 | framework (other use) | The patience-and-perseverance framework with the draw-back-warning. |
| 3414 | 10:28 -> proverbs 9:10 | the framework | …uah (the LORD) is the beginning of wisdom* — the framework's fear-disposition Tanakh-substance. |
| 3426 | 10:39 -> matthew 6:19 | framework (other use) | The treasures-in-heaven framework — the kingdom-citizens' economic-orientation… |
| 3514 | 15:11 -> acts 10:9 | the framework | Kefa's (Peter's) vision; the framework reads against the abolition-of-the-dietary-c… |
| 3553 | 17:3 -> hebrews 11:39 | Red Line | …efathers awaiting the first-resurrection per Red Line #11. |
| 3675 | 19:16 -> john 2:3 | 1234 of Truth | The 1234 of Truth. |
| 3696 | 19:28 -> daniel 7:13 | Red Line | …Son of Adam* (kaph-comparative preserved per Red Line #12) coming-with-the-clouds + everlasting-ki… |
| 3727 | 20:16 -> isaiah 6:9 | Red Line | …e-and-effect-of-hearing Tanakh-substance per Red Line #11. |
| 3796 | 21:16 -> psalms 8:4 | Red Line | …art mindful of him? and the son of Adam* per Red Line #12. |
| 3809 | 21:23 -> matthew 17:5 | backticked thread slug | …ther's-voice combined-citation substance per `fathers-voice-combined-citation-davidic-servant-prophet` thread. |
| 3815 | 21:28 -> john 2:3 | 1234 of Truth | The 1234 of Truth. |
| 3879 | 22:14 -> isaiah 6:9 | Red Line | The cause-and-effect-of-hearing per Red Line #11. |
| 3921 | 22:41 -> daniel 7:13 | Red Line | The *one like the Son of Adam* substance per Red Line #12. |
| 3947 | 23:15 -> galatians 3:1 | voice skill, the framework | The full Galatians-substance per voice skill's-framework-deep. ‖ …e full Galatians-substance per voice skill's-framework-deep. |
| 4008 | 24:9 -> matthew 7:23 | backticked thread slug | …-direct-anchor of the *anomia* substance per `lord-lord-and-torahlessness` thread. |
| 4040 | 24:30 -> daniel 7:13 | Red Line | **Primary Tanakh-citation per Red Line #12.** *Like the Son of Adam came with the c… |
| 4043 | 24:30 -> revelation 14:14 | Red Line | …th + *one sat like unto the Son of Adam* per Red Line #12. |
| 4069 | 24:36 -> psalms 110:1 | backticked thread slug | …n's-at-the-Father's-right-hand substance per `tehillim-110-davids-lord-and-the-formless-formed-grid-at-the-highest-substance` thread. |
| 4070 | 24:37 -> genesis 6:1 | Red Line | …stance + the Watcher-Rebellion-substance per Red Line #11. |
| 4076 | 24:40 -> matthew 13:30 | Red Line | …and-tares post-harvest-sifting substance per Red Line #11. |
| 4077 | 24:40 -> matthew 13:41 | Red Line | …and-tares post-harvest-sifting substance per Red Line #11. |
| 4147 | 26:57 -> daniel 7:13 | Red Line | …of-Adam-coming-with-the-clouds substance per Red Line #12. |
| 4199 | 28:1 -> matthew 25:40 | S-number, FRAMEWORK-MAJOR | …l-`my-brethren` thread (FRAMEWORK-MAJOR from S87 Matt 25). ‖ …ren* — the substantial-`my-brethren` thread (FRAMEWORK-MAJOR from S87 Matt 25). |

## Proposed groups

### Joining existing threads (177)

- **matthean-yoseph-and-the-patriarch-yoseph** (thread 30, anchor none, now 3 members) ← 2 cards [2615, 3243] — Joined by 1 high-confidence, 1 medium-confidence (score 0.26–0.38); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18** (thread 30006, anchor matthew 1:22, now 4 members) ← 7 cards [2589, 2590, 2591, 2592, 2593, 2594, 2595] — Joined by 7 high-confidence (score 0.35–0.46); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-1-conceived-of-the-ruach-hakodesh-genesis-1-isaiah-11-luke-1** (thread 30003, anchor matthew 1:18, now 4 members) ← 2 cards [3239, 3242] — Joined by 1 high-confidence, 1 medium-confidence (score 0.21–0.59); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4** (thread 30002, anchor matthew 1:3, now 4 members) ← 9 cards [2571, 2572, 2574, 2575, 2576, 2577, 2579, 3235, 3236] — Joined by 9 high-confidence (score 0.36–0.68); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-1-he-shall-save-his-people-from-their-sins-psalm-130-isaiah-53-acts-4** (thread 30004, anchor matthew 1:21, now 4 members) ← 3 cards [2566, 2567, 2599] — Joined by 3 medium-confidence (score 0.20–0.23); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13** (thread 30005, anchor matthew 1:21, now 4 members) ← 4 cards [2526, 2596, 2598, 2600] — Joined by 4 medium-confidence (score 0.26–0.28); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1** (thread 30007, anchor matthew 1:19, now 3 members) ← 7 cards [3240, 3241, 3245, 3246, 3247, 3248, 3249] — Joined by 1 high-confidence, 6 medium-confidence (score 0.24–0.35); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31** (thread 30001, anchor matthew 1:1, now 8 members) ← 5 cards [2578, 2583, 2585, 2586, 3238] — Joined by 1 high-confidence, 4 medium-confidence (score 0.21–0.37); existing thread covers these Matthew verses and shares subject/target with its members.
- **scattered-seed-gathering** (thread 4, anchor none, now 36 members) ← 10 cards [2525, 2568, 2569, 2570, 2803, 2849, 3349, 3407, 3457, 3459] — Joined by 7 high-confidence, 3 medium-confidence (score 0.23–0.69); existing thread covers these Matthew verses and shares subject/target with its members.
- **fulfill-as-prophecy-bringing-to-pass** (thread 26, anchor none, now 13 members) ← 2 cards [3258, 3264] — Joined by 2 medium-confidence (score 0.25–0.30); existing thread covers these Matthew verses and shares subject/target with its members.
- **magi-astronomical-tradition** (thread 32, anchor none, now 3 members) ← 1 cards [2601] — Joined by 1 medium-confidence (score 0.31–0.31); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24** (thread 30406, anchor matthew 2:1, now 4 members) ← 6 cards [2603, 2607, 3250, 3251, 3252, 3253] — Joined by 5 medium-confidence, 1 high-confidence (score 0.23–1.09); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-2-flight-to-egypt-out-of-egypt-have-i-called-my-son-hosea-11-exodus-4** (thread 30408, anchor matthew 2:13, now 4 members) ← 2 cards [2613, 2616] — Joined by 1 medium-confidence, 1 high-confidence (score 0.34–0.41); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-2-he-shall-be-called-a-nazarene-the-netzer-branch-isaiah-11-judges-13-isaiah-53** (thread 30410, anchor matthew 2:19, now 4 members) ← 3 cards [2626, 2627, 2628] — Joined by 3 high-confidence (score 0.41–0.45); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-2-rachel-weeping-for-her-children-lament-that-opens-onto-restoration-jeremiah-31** (thread 30409, anchor matthew 2:16, now 4 members) ← 3 cards [2620, 2622, 2623] — Joined by 2 high-confidence, 1 medium-confidence (score 0.29–0.64); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-2-wise-men-from-the-east-gold-frankincense-myrrh-nations-to-the-king-isaiah-60-psalm-72** (thread 30407, anchor matthew 2:1, now 4 members) ← 3 cards [2604, 3255, 3256] — Joined by 2 medium-confidence, 1 high-confidence (score 0.21–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **pharaoh-mosheh-herod-yahusha-infant-slaughter** (thread 35, anchor none, now 3 members) ← 1 cards [2614] — Joined by 1 medium-confidence (score 0.28–0.28); existing thread covers these Matthew verses and shares subject/target with its members.
- **plant-of-righteousness-and-the-branch** (thread 37, anchor none, now 2 members) ← 1 cards [2625] — Joined by 1 high-confidence (score 0.43–0.43); existing thread covers these Matthew verses and shares subject/target with its members.
- **rachel-buried-at-bethlehem** (thread 36, anchor none, now 2 members) ← 1 cards [2621] — Joined by 1 high-confidence (score 0.51–0.51); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3** (thread 30414, anchor matthew 3:11, now 9 members) ← 1 cards [3262] — Joined by 1 high-confidence (score 0.54–0.54); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11** (thread 30413, anchor matthew 3:7, now 8 members) ← 1 cards [2633] — Joined by 1 high-confidence (score 0.92–0.92); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4** (thread 30411, anchor matthew 3:1, now 6 members) ← 3 cards [2630, 2631, 2634] — Joined by 2 high-confidence, 1 medium-confidence (score 0.28–0.95); existing thread covers these Matthew verses and shares subject/target with its members.
- **praise-of-elijah-and-the-yochanan-pattern** (thread 38, anchor none, now 4 members) ← 1 cards [2644] — Joined by 1 medium-confidence (score 0.35–0.35); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-4-fishers-of-men-repent-they-left-their-nets-jeremiah-16-ezekiel-18** (thread 30420, anchor matthew 4:17, now 3 members) ← 3 cards [3269, 3270, 3271] — Joined by 1 high-confidence, 2 medium-confidence (score 0.28–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-4-healing-all-manner-of-sickness-the-sun-of-righteousness-isaiah-53-malachi-4** (thread 30421, anchor matthew 4:23, now 3 members) ← 2 cards [3272, 3273] — Joined by 2 medium-confidence (score 0.28–0.33); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34** (thread 30418, anchor matthew 4:8, now 2 members) ← 7 cards [2651, 2652, 2653, 2654, 2655, 2656, 2657] — Joined by 6 medium-confidence, 1 high-confidence (score 0.25–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91** (thread 30417, anchor matthew 4:5, now 3 members) ← 6 cards [2646, 2647, 2648, 2649, 2650, 3266] — Joined by 3 high-confidence, 3 medium-confidence (score 0.24–0.97); existing thread covers these Matthew verses and shares subject/target with its members.
- **heart-torah-not-abolition** (thread 9, anchor none, now 10 members) ← 1 cards [3285] — Joined by 1 high-confidence (score 0.47–0.47); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50** (thread 30014, anchor matthew 5:38, now 6 members) ← 1 cards [2674] — Joined by 1 medium-confidence (score 0.23–0.23); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37** (thread 30008, anchor matthew 5:3, now 6 members) ← 5 cards [3274, 3276, 3280, 3281, 3282] — Joined by 3 medium-confidence, 2 high-confidence (score 0.26–0.65); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12** (thread 30015, anchor matthew 5:43, now 7 members) ← 5 cards [2676, 2677, 2678, 2679, 3286] — Joined by 3 high-confidence, 2 medium-confidence (score 0.33–1.14); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5** (thread 30013, anchor matthew 5:33, now 5 members) ← 1 cards [2673] — Joined by 1 medium-confidence (score 0.30–0.30); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4** (thread 30010, anchor matthew 5:17, now 11 members) ← 2 cards [3283, 3284] — Joined by 1 medium-confidence, 1 high-confidence (score 0.29–0.97); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4** (thread 30011, anchor matthew 5:21, now 5 members) ← 1 cards [2668] — Joined by 1 high-confidence (score 0.99–0.99); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2** (thread 30012, anchor matthew 5:27, now 4 members) ← 3 cards [2669, 2670, 119975] — Joined by 2 high-confidence, 1 medium-confidence (score 0.28–0.60); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4** (thread 30016, anchor matthew 6:1, now 6 members) ← 5 cards [3287, 3288, 3289, 3290, 3292] — Joined by 3 high-confidence, 2 medium-confidence (score 0.30–0.67); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2** (thread 30020, anchor matthew 6:16, now 3 members) ← 3 cards [3308, 3309, 3311] — Joined by 2 high-confidence, 1 medium-confidence (score 0.35–0.50); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11** (thread 30019, anchor matthew 6:14, now 3 members) ← 10 cards [2542, 2543, 2681, 2682, 2683, 2684, 2685, 2686, 2687, 2688] — Joined by 10 high-confidence (score 0.35–0.54); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5** (thread 30017, anchor matthew 6:5, now 2 members) ← 3 cards [3294, 3296, 3297] — Joined by 3 medium-confidence (score 0.21–0.26); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12** (thread 30022, anchor matthew 6:25, now 5 members) ← 6 cards [3323, 3324, 3325, 3326, 3327, 3328] — Joined by 4 high-confidence, 2 medium-confidence (score 0.25–0.69); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36** (thread 30018, anchor matthew 6:9, now 8 members) ← 6 cards [2541, 3301, 3302, 3303, 3304, 3307] — Joined by 3 high-confidence, 3 medium-confidence (score 0.22–0.99); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29** (thread 30021, anchor matthew 6:19, now 4 members) ← 7 cards [3312, 3313, 3314, 3315, 3320, 3321, 3322] — Joined by 4 high-confidence, 3 medium-confidence (score 0.27–1.07); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-single-eye-of-issachar-and-the-evil-eye-of-sirach** (thread 58, anchor none, now 5 members) ← 4 cards [3316, 3317, 3318, 3319] — Joined by 4 high-confidence (score 0.40–0.47); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6** (thread 30025, anchor matthew 7:7, now 7 members) ← 3 cards [3333, 3334, 3335] — Joined by 3 medium-confidence (score 0.30–0.33); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5** (thread 30028, anchor matthew 7:15, now 7 members) ← 1 cards [3341] — Joined by 1 high-confidence (score 0.36–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23** (thread 30024, anchor matthew 7:6, now 3 members) ← 1 cards [3332] — Joined by 1 high-confidence (score 0.43–0.43); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24** (thread 30023, anchor matthew 7:1, now 6 members) ← 1 cards [3330] — Joined by 1 medium-confidence (score 0.25–0.25); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1** (thread 30027, anchor matthew 7:13, now 6 members) ← 4 cards [3336, 3337, 3338, 3339] — Joined by 4 high-confidence (score 0.36–0.48); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13** (thread 30030, anchor matthew 7:24, now 5 members) ← 3 cards [3342, 3343, 3344] — Joined by 1 medium-confidence, 2 high-confidence (score 0.29–0.40); existing thread covers these Matthew verses and shares subject/target with its members.
- **wise-and-foolish-builders-and-the-heart-stablished-in-sirach** (thread 68, anchor none, now 3 members) ← 1 cards [3345] — Joined by 1 medium-confidence (score 0.30–0.30); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38** (thread 30426, anchor matthew 8:23, now 6 members) ← 5 cards [3358, 3359, 3360, 3361, 3362] — Joined by 4 high-confidence, 1 medium-confidence (score 0.34–0.78); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-8-himself-took-our-infirmities-isaiah-53-4-psalm-103** (thread 30424, anchor matthew 8:14, now 3 members) ← 2 cards [3351, 3352] — Joined by 2 high-confidence (score 0.44–0.47); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1** (thread 30423, anchor matthew 8:5, now 7 members) ← 1 cards [177461] — Joined by 1 high-confidence (score 0.72–0.72); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15** (thread 30427, anchor matthew 8:28, now 6 members) ← 5 cards [3363, 3364, 3365, 3366, 3367] — Joined by 5 medium-confidence (score 0.25–0.27); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5** (thread 30422, anchor matthew 8:1, now 4 members) ← 7 cards [2705, 2706, 2707, 2708, 2709, 3346, 3347] — Joined by 6 high-confidence, 1 medium-confidence (score 0.24–0.90); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-8-the-son-of-man-nowhere-to-lay-his-head-daniel-7-enoch-46** (thread 30425, anchor matthew 8:18, now 4 members) ← 2 cards [3353, 3354] — Joined by 2 high-confidence (score 0.55–0.55); existing thread covers these Matthew verses and shares subject/target with its members.
- **harvest-of-the-age-in-2-baruch** (thread 103, anchor none, now 2 members) ← 1 cards [3386] — Joined by 1 medium-confidence (score 0.32–0.32); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick** (thread 30589, anchor matthew 9:9, now 6 members) ← 8 cards [2711, 2713, 2714, 2715, 2716, 2717, 2718, 3372] — Joined by 6 high-confidence, 2 medium-confidence (score 0.31–0.76); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant** (thread 30590, anchor matthew 9:14, now 5 members) ← 7 cards [2720, 2721, 2722, 2723, 2724, 2725, 2726] — Joined by 4 high-confidence, 3 medium-confidence (score 0.32–0.38); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5** (thread 30593, anchor matthew 9:32, now 6 members) ← 2 cards [3385, 3387] — Joined by 1 high-confidence, 1 medium-confidence (score 0.26–0.39); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-9-the-hem-of-his-garment-the-fringe-healing-in-his-wings-numbers-15-malachi-4** (thread 30591, anchor matthew 9:18, now 5 members) ← 1 cards [3376] — Joined by 1 high-confidence (score 0.85–0.85); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34** (thread 30588, anchor matthew 9:2, now 7 members) ← 1 cards [3370] — Joined by 1 medium-confidence (score 0.33–0.33); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7** (thread 30592, anchor matthew 9:27, now 4 members) ← 7 cards [2728, 2729, 2730, 2731, 2732, 2733, 2734] — Joined by 4 medium-confidence, 3 high-confidence (score 0.29–0.42); existing thread covers these Matthew verses and shares subject/target with its members.
- **new-wine-and-the-old-friend-inverse-in-sirach** (thread 98, anchor none, now 1 members) ← 2 cards [3374, 3375] — Joined by 2 high-confidence (score 0.42–0.48); existing thread covers these Matthew verses and shares subject/target with its members.
- **physician-prayer-architecture-in-sirach-bypassed** (thread 99, anchor none, now 3 members) ← 1 cards [3377] — Joined by 1 medium-confidence (score 0.20–0.20); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-named-son-of-adam-in-enoch-similitudes** (thread 96, anchor none, now 3 members) ← 1 cards [3371] — Joined by 1 medium-confidence (score 0.35–0.35); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56** (thread 30596, anchor matthew 10:26, now 5 members) ← 5 cards [3410, 3411, 3412, 3413, 3414] — Joined by 5 high-confidence (score 0.37–0.46); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17** (thread 30598, anchor matthew 10:40, now 4 members) ← 4 cards [3428, 3429, 3430, 3431] — Joined by 2 medium-confidence, 2 high-confidence (score 0.21–0.41); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33** (thread 30597, anchor matthew 10:34, now 5 members) ← 8 cards [3418, 3419, 3420, 3421, 3422, 3423, 3424, 3425] — Joined by 4 high-confidence, 4 medium-confidence (score 0.21–1.04); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-10-sheep-among-wolves-spirit-of-your-father-speaketh-genesis-3-exodus-4** (thread 30595, anchor matthew 10:16, now 4 members) ← 2 cards [3401, 3402] — Joined by 2 high-confidence (score 0.39–0.39); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-10-the-lost-sheep-of-the-house-of-israel-ezekiel-34-jeremiah-50** (thread 30594, anchor matthew 10:5, now 5 members) ← 2 cards [3391, 3392] — Joined by 2 medium-confidence (score 0.20–0.26); existing thread covers these Matthew verses and shares subject/target with its members.
- **names-in-the-books-of-life-not-blotted-out-in-1-enoch-103** (thread 114, anchor none, now 2 members) ← 3 cards [3415, 3416, 3417] — Joined by 3 medium-confidence (score 0.24–0.34); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-11-art-thou-he-the-works-prove-messiah-isaiah-35-isaiah-61** (thread 30599, anchor matthew 11:2, now 6 members) ← 1 cards [3436] — Joined by 1 high-confidence (score 0.48–0.48); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51** (thread 30603, anchor matthew 11:28, now 6 members) ← 9 cards [2746, 2747, 2748, 2749, 2750, 2751, 2752, 2753, 2754] — Joined by 6 high-confidence, 3 medium-confidence (score 0.23–1.06); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2** (thread 30602, anchor matthew 11:25, now 6 members) ← 13 cards [2755, 2756, 2757, 2758, 2759, 2760, 2761, 2762, 2763, 3447, 3448, 3449, 3450] — Joined by 10 high-confidence, 3 medium-confidence (score 0.33–0.50); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-11-john-the-messenger-elijah-restore-the-tribes-malachi-3-malachi-4-sirach-48** (thread 30600, anchor matthew 11:7, now 6 members) ← 1 cards [3440] — Joined by 1 medium-confidence (score 0.24–0.24); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-11-woe-unto-the-cities-greater-light-greater-judgment-isaiah-14-ezekiel-16** (thread 30601, anchor matthew 11:16, now 5 members) ← 1 cards [3443] — Joined by 1 medium-confidence (score 0.24–0.24); existing thread covers these Matthew verses and shares subject/target with its members.
- **mighty-men-mightily-tormented-in-wisdom-of-solomon-6** (thread 123, anchor none, now 3 members) ← 1 cards [3442] — Joined by 1 medium-confidence (score 0.28–0.28); existing thread covers these Matthew verses and shares subject/target with its members.
- **sodom-as-judgment-archetype-in-jubilees-16-and-wisdom-10** (thread 124, anchor none, now 3 members) ← 1 cards [3445] — Joined by 1 high-confidence (score 0.37–0.37); existing thread covers these Matthew verses and shares subject/target with its members.
- **children-of-elohim-by-doing-the-fathers-will-in-wisdom-and-sirach-and-jubilees** (thread 193, anchor none, now 4 members) ← 1 cards [2791] — Joined by 1 high-confidence (score 0.35–0.35); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-12-behold-my-servant-whom-i-have-chosen-isaiah-42-isaiah-49-isaiah-11** (thread 30606, anchor matthew 12:15, now 5 members) ← 1 cards [3453] — Joined by 1 high-confidence (score 0.55–0.55); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-12-binding-the-strong-man-blasphemy-against-the-spirit-isaiah-49-1-enoch-15** (thread 30607, anchor matthew 12:22, now 5 members) ← 2 cards [2777, 3456] — Joined by 2 medium-confidence (score 0.22–0.27); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-12-lawful-to-do-well-on-the-sabbath-the-withered-hand-deuteronomy-22-leviticus-19** (thread 30605, anchor matthew 12:9, now 4 members) ← 1 cards [2773] — Joined by 1 medium-confidence (score 0.31–0.31); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10** (thread 30608, anchor matthew 12:38, now 3 members) ← 6 cards [2785, 2786, 2787, 2790, 3461, 3462] — Joined by 6 high-confidence (score 0.36–1.14); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6** (thread 30604, anchor matthew 12:1, now 7 members) ← 4 cards [2765, 2767, 2774, 2775] — Joined by 2 high-confidence, 2 medium-confidence (score 0.25–0.92); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22** (thread 30609, anchor matthew 12:43, now 3 members) ← 5 cards [2792, 2793, 2794, 2795, 2796] — Joined by 5 medium-confidence (score 0.25–0.31); existing thread covers these Matthew verses and shares subject/target with its members.
- **no-forgiveness-for-the-hardened-disposition-in-jubilees-and-1-enoch-and-wisdom** (thread 189, anchor none, now 3 members) ← 7 cards [2778, 2779, 2780, 2781, 2782, 2783, 2784] — Joined by 6 medium-confidence, 1 high-confidence (score 0.25–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **shabbat-as-covenant-sign-protected-day-and-life-saving-defense** (thread 183, anchor none, now 3 members) ← 4 cards [2769, 2770, 2772, 3452] — Joined by 4 medium-confidence (score 0.24–0.33); existing thread covers these Matthew verses and shares subject/target with its members.
- **spirit-anointed-elect-one-the-spirit-of-wisdom-on-the-son-in-1-enoch** (thread 186, anchor none, now 3 members) ← 1 cards [3454] — Joined by 1 high-confidence (score 0.35–0.35); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-13-i-will-open-my-mouth-in-parables-kept-secret-psalm-78-psalm-49** (thread 30902, anchor matthew 13:34, now 2 members) ← 2 cards [3476, 3477] — Joined by 1 high-confidence, 1 medium-confidence (score 0.33–1.16); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4** (thread 30901, anchor matthew 13:31, now 4 members) ← 11 cards [2824, 2825, 2826, 2827, 2828, 2829, 2830, 2831, 3473, 3474, 3475] — Joined by 8 medium-confidence, 3 high-confidence (score 0.28–1.02); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-13-the-scribe-brings-things-new-and-old-a-prophet-without-honour-jeremiah-6** (thread 30904, anchor matthew 13:51, now 1 members) ← 4 cards [3487, 3488, 3489, 3493] — Joined by 3 high-confidence, 1 medium-confidence (score 0.22–0.47); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55** (thread 30899, anchor matthew 13:3, now 8 members) ← 10 cards [2811, 2814, 2815, 2816, 2817, 3463, 3464, 3467, 3468, 3469] — Joined by 5 high-confidence, 5 medium-confidence (score 0.21–0.95); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4** (thread 30900, anchor matthew 13:24, now 6 members) ← 6 cards [2802, 2804, 2805, 2807, 2808, 3480] — Joined by 5 medium-confidence, 1 high-confidence (score 0.20–0.85); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51** (thread 30903, anchor matthew 13:44, now 5 members) ← 7 cards [2819, 2820, 2821, 3482, 3483, 3484, 3486] — Joined by 7 medium-confidence (score 0.25–0.35); existing thread covers these Matthew verses and shares subject/target with its members.
- **righteous-shall-shine-as-the-sun-in-1-enoch-and-2-esdras-and-wisdom** (thread 199, anchor none, now 2 members) ← 1 cards [2806] — Joined by 1 medium-confidence (score 0.24–0.24); existing thread covers these Matthew verses and shares subject/target with its members.
- **seed-of-good-and-evil-sown-in-the-heart-of-adam-in-2-esdras** (thread 196, anchor none, now 3 members) ← 2 cards [2798, 3470] — Joined by 2 medium-confidence (score 0.24–0.29); existing thread covers these Matthew verses and shares subject/target with its members.
- **seed-war-from-genesis-3-and-the-devil-as-source-of-death-in-wisdom-and-jubilees-and-1-enoch** (thread 203, anchor none, now 3 members) ← 3 cards [2799, 2800, 3479] — Joined by 3 medium-confidence (score 0.22–0.27); existing thread covers these Matthew verses and shares subject/target with its members.
- **watchers-corruption-as-tares-sown-in-the-wheat-in-1-enoch-and-jubilees** (thread 197, anchor none, now 5 members) ← 3 cards [2797, 2801, 3471] — Joined by 1 high-confidence, 2 medium-confidence (score 0.23–0.38); existing thread covers these Matthew verses and shares subject/target with its members.
- **wheat-from-chaff-and-righteous-from-wicked-at-the-day-of-separation-in-2-esdras-and-1-enoch-and-wisdom** (thread 202, anchor none, now 4 members) ← 3 cards [2822, 2823, 3485] — Joined by 3 medium-confidence (score 0.23–0.35); existing thread covers these Matthew verses and shares subject/target with its members.
- **wisdom-hidden-from-the-wicked-revealed-to-the-elect-in-1-enoch-and-2-esdras-and-wisdom** (thread 194, anchor none, now 4 members) ← 5 cards [2812, 2813, 2818, 3465, 3466] — Joined by 5 medium-confidence (score 0.21–0.27); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18** (thread 30905, anchor matthew 14:1, now 5 members) ← 12 cards [2832, 2833, 2834, 2835, 2836, 2837, 2840, 3494, 3495, 3496, 3497, 3498] — Joined by 6 high-confidence, 6 medium-confidence (score 0.20–0.99); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16** (thread 30906, anchor matthew 14:13, now 6 members) ← 11 cards [2841, 2842, 2843, 2845, 2846, 2847, 2848, 2850, 3500, 3501, 3502] — Joined by 4 high-confidence, 7 medium-confidence (score 0.20–0.68); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-14-the-hem-of-his-garment-the-tzitzit-wings-of-torah-numbers-15-malachi-4** (thread 30908, anchor matthew 14:34, now 3 members) ← 1 cards [3510] — Joined by 1 high-confidence (score 0.46–0.46); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3** (thread 30907, anchor matthew 14:22, now 5 members) ← 8 cards [2855, 2856, 2857, 2858, 3507, 3508, 3509, 5521] — Joined by 7 medium-confidence, 1 high-confidence (score 0.24–0.52); existing thread covers these Matthew verses and shares subject/target with its members.
- **wonders-of-the-sea-and-the-creators-mastery-in-sirach-and-wisdom-of-solomon** (thread 206, anchor none, now 3 members) ← 1 cards [2853] — Joined by 1 high-confidence (score 0.42–0.42); existing thread covers these Matthew verses and shares subject/target with its members.
- **gathering-of-the-scattered-twelve-tribes-in-sirach-and-2-esdras-and-tobit** (thread 221, anchor none, now 5 members) ← 2 cards [2869, 2870] — Joined by 2 medium-confidence (score 0.24–0.28); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51** (thread 30910, anchor matthew 15:10, now 5 members) ← 5 cards [2879, 2880, 2881, 2882, 2884] — Joined by 3 high-confidence, 2 medium-confidence (score 0.22–1.05); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17** (thread 30911, anchor matthew 15:21, now 4 members) ← 13 cards [2871, 2872, 2873, 2874, 2875, 2876, 2877, 2878, 3518, 3519, 3520, 3521, 177460] — Joined by 12 medium-confidence, 1 high-confidence (score 0.21–0.58); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-15-the-dumb-speak-the-lame-walk-feeding-the-four-thousand-isaiah-35-psalm-107-exodus-16** (thread 30912, anchor matthew 15:29, now 4 members) ← 3 cards [3522, 3524, 3525] — Joined by 1 high-confidence, 2 medium-confidence (score 0.21–0.48); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3** (thread 30909, anchor matthew 15:1, now 7 members) ← 7 cards [2859, 2860, 2862, 2863, 2864, 2868, 3513] — Joined by 5 high-confidence, 2 medium-confidence (score 0.24–1.07); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-heart-the-source-of-evil-not-the-father-in-sirach-and-wisdom-of-solomon** (thread 220, anchor none, now 4 members) ← 1 cards [2883] — Joined by 1 medium-confidence (score 0.25–0.25); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53** (thread 30916, anchor matthew 16:21, now 3 members) ← 5 cards [2901, 2902, 2903, 2908, 3534] — Joined by 1 high-confidence, 4 medium-confidence (score 0.27–0.56); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-16-no-sign-but-the-prophet-jonah-the-signs-of-the-times-jonah-1** (thread 30913, anchor matthew 16:1, now 3 members) ← 2 cards [3526, 3527] — Joined by 2 high-confidence (score 0.35–0.57); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7** (thread 30917, anchor matthew 16:24, now 7 members) ← 9 cards [2909, 2910, 2911, 2912, 2913, 3535, 3536, 3538, 124247] — Joined by 5 medium-confidence, 4 high-confidence (score 0.25–0.39); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28** (thread 30915, anchor matthew 16:13, now 9 members) ← 8 cards [2890, 2891, 2892, 2893, 2895, 3528, 3531, 3532] — Joined by 7 medium-confidence, 1 high-confidence (score 0.22–0.44); existing thread covers these Matthew verses and shares subject/target with its members.
- **reward-according-to-works-the-post-harvest-sifting-in-sirach-and-2-esdras** (thread 228, anchor none, now 5 members) ← 2 cards [3539, 3540] — Joined by 2 high-confidence (score 0.38–0.40); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-elect-one-on-the-throne-and-the-davidic-stewardship-keys-in-1-enoch** (thread 225, anchor none, now 4 members) ← 1 cards [2900] — Joined by 1 medium-confidence (score 0.34–0.34); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-gates-of-sheol-and-the-resurrection-substance-in-wisdom-of-solomon-and-1-enoch** (thread 227, anchor none, now 4 members) ← 4 cards [2889, 2896, 2897, 3533] — Joined by 3 medium-confidence, 1 high-confidence (score 0.25–0.41); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-righteous-one-condemned-with-a-shameful-death-in-wisdom-of-solomon** (thread 226, anchor none, now 5 members) ← 3 cards [2904, 2905, 2907] — Joined by 2 medium-confidence, 1 high-confidence (score 0.25–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-son-of-the-living-elohim-named-before-the-foundation-in-1-enoch-and-wisdom-of-solomon** (thread 224, anchor none, now 5 members) ← 1 cards [2888] — Joined by 1 medium-confidence (score 0.27–0.27); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48** (thread 30919, anchor matthew 17:9, now 3 members) ← 5 cards [3575, 3576, 3577, 3578, 3579] — Joined by 2 high-confidence, 3 medium-confidence (score 0.28–0.48); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40** (thread 30920, anchor matthew 17:14, now 4 members) ← 6 cards [3584, 3585, 3586, 3587, 3589, 3590] — Joined by 3 high-confidence, 3 medium-confidence (score 0.23–0.50); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4** (thread 30918, anchor matthew 17:1, now 9 members) ← 23 cards [3542, 3543, 3546, 3547, 3548, 3549, 3550, 3552, 3553, 3554, 3556, 3557, 3561, 3562, 3563, 3564, 3565, 3566, 3567, 3568, 3569, 3570, 3571] — Joined by 18 medium-confidence, 5 high-confidence (score 0.21–0.41); existing thread covers these Matthew verses and shares subject/target with its members.
- **matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24** (thread 30921, anchor matthew 17:22, now 4 members) ← 4 cards [3595, 3596, 3597, 3598] — Joined by 3 high-confidence, 1 medium-confidence (score 0.33–0.69); existing thread covers these Matthew verses and shares subject/target with its members.
- **forgive-and-be-forgiven-the-mercy-met-with-mercy-architecture** (thread 374, anchor matthew 18:21, now 5 members) ← 6 cards [3636, 3637, 3638, 3639, 3640, 3643] — Joined by 3 high-confidence, 3 medium-confidence (score 0.20–0.38); existing thread covers these Matthew verses and shares subject/target with its members.
- **resurrection-keeps-the-form** (thread 33546, anchor 2-baruch 50:2, now 1 members) ← 6 cards [3608, 3609, 3610, 3611, 133759, 133760] — Joined by 3 medium-confidence, 3 high-confidence (score 0.29–0.51); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-greatness-as-humility-and-the-proud-cast-down-in-the-wisdom-stream** (thread 375, anchor matthew 18:1, now 3 members) ← 6 cards [3599, 3600, 3601, 3602, 3603, 3604] — Joined by 3 medium-confidence, 3 high-confidence (score 0.23–0.46); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse** (thread 372, anchor matthew 18:10, now 5 members) ← 12 cards [3612, 3613, 3614, 3615, 3616, 3617, 3618, 3619, 3620, 3621, 3622, 3623] — Joined by 10 medium-confidence, 2 high-confidence (score 0.28–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-reproof-and-restoration-procedure-in-sirach** (thread 373, anchor matthew 18:15, now 4 members) ← 5 cards [3624, 3625, 3626, 3627, 3628] — Joined by 4 high-confidence, 1 medium-confidence (score 0.28–0.43); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-watcher-rebellion-as-the-stumbling-block-architecture-in-1-enoch** (thread 371, anchor matthew 18:6, now 5 members) ← 3 cards [3605, 3606, 3607] — Joined by 3 high-confidence (score 0.38–0.45); existing thread covers these Matthew verses and shares subject/target with its members.
- **creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon** (thread 376, anchor matthew 19:3, now 4 members) ← 12 cards [3650, 3651, 3652, 3653, 3654, 3655, 3657, 3658, 3660, 3661, 3662, 3663] — Joined by 12 medium-confidence (score 0.20–0.32); existing thread covers these Matthew verses and shares subject/target with its members.
- **keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi** (thread 378, anchor matthew 19:16, now 5 members) ← 13 cards [3670, 3671, 3672, 3673, 3674, 3675, 3676, 3678, 3680, 3681, 3682, 3683, 3684] — Joined by 13 medium-confidence (score 0.20–0.33); existing thread covers these Matthew verses and shares subject/target with its members.
- **receiving-the-children-and-parental-instruction-in-sirach-and-tobit** (thread 377, anchor matthew 19:13, now 3 members) ← 5 cards [3665, 3666, 3667, 3668, 3669] — Joined by 5 medium-confidence (score 0.21–0.32); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii** (thread 380, anchor matthew 19:27, now 5 members) ← 18 cards [3696, 3697, 3698, 3699, 3700, 3702, 3703, 3704, 3705, 3706, 3707, 3708, 3709, 3710, 3711, 3712, 3713, 3714] — Joined by 18 medium-confidence (score 0.20–0.34); existing thread covers these Matthew verses and shares subject/target with its members.
- **woes-on-the-rich-and-riches-cannot-save-in-1-enoch** (thread 379, anchor matthew 19:23, now 5 members) ← 7 cards [3685, 3686, 3687, 3688, 3689, 3694, 3695] — Joined by 4 medium-confidence, 3 high-confidence (score 0.21–0.43); existing thread covers these Matthew verses and shares subject/target with its members.
- **many-be-called-but-few-chosen-in-1-enoch-and-2-esdras** (thread 382, anchor matthew 20:16, now 4 members) ← 4 cards [3725, 3726, 3727, 3728] — Joined by 3 high-confidence, 1 medium-confidence (score 0.33–0.41); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees** (thread 383, anchor matthew 20:22, now 4 members) ← 7 cards [3739, 3740, 3741, 3742, 3743, 3744, 3745] — Joined by 7 high-confidence (score 0.40–0.44); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve** (thread 385, anchor matthew 20:29, now 3 members) ← 13 cards [3761, 3762, 3763, 3764, 3765, 3766, 3767, 3768, 3769, 3770, 3771, 3773, 3774] — Joined by 3 high-confidence, 10 medium-confidence (score 0.20–0.41); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach** (thread 384, anchor matthew 20:25, now 5 members) ← 11 cards [3748, 3751, 3752, 3753, 3754, 3755, 3756, 3757, 3758, 3759, 3760] — Joined by 6 medium-confidence, 5 high-confidence (score 0.21–0.39); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-vineyard-of-yashar-el-and-the-sovereign-grace-of-the-master-in-sirach-and-2-esdras** (thread 381, anchor matthew 20:1, now 5 members) ← 2 cards [3719, 3720] — Joined by 2 medium-confidence (score 0.30–0.33); existing thread covers these Matthew verses and shares subject/target with its members.
- **davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees** (thread 386, anchor matthew 21:1, now 4 members) ← 9 cards [3778, 3779, 3780, 3781, 3782, 3783, 3784, 3785, 3786] — Joined by 9 medium-confidence (score 0.20–0.30); existing thread covers these Matthew verses and shares subject/target with its members.
- **leaves-without-fruit-judged-in-wisdom-of-solomon-sirach-and-1-enoch** (thread 388, anchor matthew 21:18, now 4 members) ← 4 cards [3797, 3798, 3800, 3803] — Joined by 4 medium-confidence (score 0.21–0.25); existing thread covers these Matthew verses and shares subject/target with its members.
- **parable-of-the-two-sons-and-the-wisdom-streams-repentance-and-hypocrisy-architecture** (thread 389, anchor matthew 21:28, now 5 members) ← 4 cards [3811, 3812, 3813, 3814] — Joined by 4 medium-confidence (score 0.22–0.26); existing thread covers these Matthew verses and shares subject/target with its members.
- **temple-cleansing-and-the-maccabean-rededication-architecture** (thread 387, anchor matthew 21:12, now 4 members) ← 6 cards [3788, 3789, 3790, 3791, 3793, 3794] — Joined by 5 medium-confidence, 1 high-confidence (score 0.21–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning** (thread 390, anchor matthew 21:33, now 4 members) ← 41 cards [3816, 3817, 3818, 3819, 3820, 3821, 3822, 3823, 3824, 3825, 3826, 3827, 3828, 3829, 3830, 3831, 3832, 3833, 3834, 3835, 3836, 3837, 3838, 3839, 3841, 3842, 3843, 3844, 3845, 3846, 3847, 3848, 3849, 3850, 3851, 3852, 3853, 3854, 3855, 3856, 3857] — Joined by 38 medium-confidence, 3 high-confidence (score 0.20–0.37); existing thread covers these Matthew verses and shares subject/target with its members.
- **love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon** (thread 394, anchor matthew 22:34, now 5 members) ← 12 cards [3901, 3902, 3903, 3904, 3905, 3906, 3908, 3909, 3910, 3911, 3912, 3913] — Joined by 7 medium-confidence, 5 high-confidence (score 0.26–0.40); existing thread covers these Matthew verses and shares subject/target with its members.
- **render-unto-caesar-and-the-image-of-elohim-stamped-on-man-in-sirach-and-wisdom-of-solomon** (thread 392, anchor matthew 22:15, now 4 members) ← 4 cards [3881, 3882, 3883, 3884] — Joined by 1 high-confidence, 3 medium-confidence (score 0.28–0.38); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables** (thread 395, anchor matthew 22:41, now 5 members) ← 9 cards [3914, 3916, 3918, 3920, 3921, 3922, 3923, 3924, 3925] — Joined by 1 high-confidence, 8 medium-confidence (score 0.22–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream** (thread 393, anchor matthew 22:23, now 4 members) ← 13 cards [3885, 3886, 3888, 3889, 3890, 3891, 3892, 3893, 3894, 3895, 3896, 3898, 3900] — Joined by 12 medium-confidence, 1 high-confidence (score 0.20–0.41); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-wedding-feast-and-the-garments-of-the-righteous-in-2-esdras-and-wisdom-of-solomon** (thread 391, anchor matthew 22:1, now 4 members) ← 7 cards [3864, 3872, 3873, 3874, 3875, 3876, 3877] — Joined by 7 medium-confidence (score 0.24–0.35); existing thread covers these Matthew verses and shares subject/target with its members.
- **swearing-and-the-faithful-yes-and-nay-in-sirach** (thread 398, anchor matthew 23:16, now 3 members) ← 5 cards [3951, 3952, 3953, 3954, 3955] — Joined by 5 high-confidence (score 0.35–0.48); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras** (thread 400, anchor matthew 23:29, now 5 members) ← 24 cards [3967, 3968, 3969, 3970, 3971, 3972, 3973, 3974, 3975, 3976, 3977, 3978, 3979, 3980, 3981, 3983, 3984, 3985, 3986, 3987, 3988, 3989, 3992, 3993] — Joined by 23 medium-confidence, 1 high-confidence (score 0.20–0.42); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-corrupted-priesthood-and-false-credentialing-in-testaments-of-levi-and-wisdom-stream** (thread 397, anchor matthew 23:13, now 4 members) ← 6 cards [3945, 3946, 3947, 3948, 3949, 3950] — Joined by 6 medium-confidence (score 0.26–0.34); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon** (thread 399, anchor matthew 23:23, now 5 members) ← 11 cards [3956, 3957, 3958, 3959, 3960, 3961, 3962, 3963, 3964, 3965, 3966] — Joined by 11 medium-confidence (score 0.25–0.32); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-pride-and-religious-status-architecture-in-sirach** (thread 396, anchor matthew 23:1, now 4 members) ← 6 cards [3933, 3940, 3941, 3942, 3943, 3944] — Joined by 6 medium-confidence (score 0.23–0.32); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-days-of-noach-and-the-watcher-rebellion-judgment-pattern-in-1-enoch-and-jubilees** (thread 401, anchor matthew 24:37, now 5 members) ← 4 cards [4070, 4071, 4072, 4074] — Joined by 2 medium-confidence, 2 high-confidence (score 0.23–0.38); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-faithful-and-wise-servant-and-the-day-of-visitation-in-sirach-and-wisdom-of-solomon** (thread 404, anchor matthew 24:45, now 4 members) ← 5 cards [4083, 4084, 4085, 4086, 4087] — Joined by 4 medium-confidence, 1 high-confidence (score 0.24–0.36); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables** (thread 402, anchor matthew 24:27, now 7 members) ← 19 cards [4041, 4042, 4043, 4044, 4046, 4047, 4048, 4049, 4050, 4051, 4052, 4053, 4054, 4055, 4056, 4057, 4058, 4059, 4060] — Joined by 6 medium-confidence, 13 high-confidence (score 0.21–1.08); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-mount-of-olives-vision-and-the-gathering-of-the-tribes-in-testaments-of-naphtali-and-asher** (thread 405, anchor matthew 24:3, now 4 members) ← 1 cards [4002] — Joined by 1 medium-confidence (score 0.23–0.23); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras** (thread 403, anchor matthew 24:10, now 5 members) ← 6 cards [4031, 4035, 4037, 4039, 4040, 4045] — Joined by 6 medium-confidence (score 0.21–0.28); existing thread covers these Matthew verses and shares subject/target with its members.
- **sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory** (thread 18, anchor none, now 23 members) ← 13 cards [2991, 2992, 2994, 2996, 2998, 3002, 3004, 4089, 4093, 4094, 4095, 4101, 4102] — Joined by 12 high-confidence, 1 medium-confidence (score 0.23–0.53); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon** (thread 406, anchor matthew 25:31, now 4 members) ← 7 cards [2990, 2993, 2995, 2997, 2999, 3005, 4112] — Joined by 7 medium-confidence (score 0.20–0.27); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables** (thread 410, anchor matthew 25:31, now 5 members) ← 10 cards [4090, 4091, 4092, 4103, 4104, 4105, 4106, 4107, 4108, 4109] — Joined by 8 medium-confidence, 2 high-confidence (score 0.24–0.39); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit** (thread 409, anchor matthew 25:34, now 5 members) ← 22 cards [2939, 2940, 2941, 2942, 2943, 2944, 2945, 2946, 2947, 2948, 2950, 2951, 2952, 2953, 2954, 2955, 2956, 2958, 2959, 2960, 4098, 4099] — Joined by 22 medium-confidence (score 0.21–0.34); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees** (thread 412, anchor matthew 26:17, now 3 members) ← 10 cards [3066, 3068, 3070, 3072, 3074, 3078, 3080, 3086, 4130, 4131] — Joined by 10 medium-confidence (score 0.20–0.29); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-elect-one-vindicated-on-the-throne-and-the-kings-condemned-in-1-enoch-46-48-62-63** (thread 411, anchor matthew 26:57, now 4 members) ← 3 cards [4145, 4146, 4147] — Joined by 2 medium-confidence, 1 high-confidence (score 0.21–0.39); existing thread covers these Matthew verses and shares subject/target with its members.
- **thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment** (thread 22, anchor none, now 8 members) ← 2 cards [4125, 4126] — Joined by 1 medium-confidence, 1 high-confidence (score 0.35–0.38); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-beloved-crucified-on-a-tree-descended-and-risen-and-many-of-the-righteous-ascending-with-him-in-ascension-of-isaiah** (thread 420, anchor matthew 27:32, now 5 members) ← 1 cards [4194] — Joined by 1 medium-confidence (score 0.20–0.20); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-kings-and-the-mighty-condemning-the-elect-one-and-the-elect-one-vindicated-on-the-throne-of-his-glory-in-1-enoch-parables** (thread 418, anchor matthew 27:1, now 4 members) ← 4 cards [4160, 4161, 4162, 4164] — Joined by 4 medium-confidence (score 0.22–0.29); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-temple-veil-rent-and-the-way-back-into-the-most-holy-place-opened-in-2-baruch-and-testaments-xii** (thread 416, anchor matthew 27:51, now 4 members) ← 1 cards [4190] — Joined by 1 medium-confidence (score 0.31–0.31); existing thread covers these Matthew verses and shares subject/target with its members.
- **all-power-given-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables** (thread 423, anchor matthew 28:18, now 5 members) ← 6 cards [4211, 4212, 4213, 4214, 4215, 4219] — Joined by 3 medium-confidence, 3 high-confidence (score 0.26–0.39); existing thread covers these Matthew verses and shares subject/target with its members.
- **teaching-them-to-observe-all-things-i-have-commanded-you-heart-torah-closing-the-anti-antinomian-bookend** (thread 20, anchor none, now 13 members) ← 2 cards [4218, 4220] — Joined by 2 high-confidence (score 0.40–0.44); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-king-ascending-and-the-tribes-rising-each-over-his-tribe-in-testaments-of-the-twelve** (thread 425, anchor matthew 28:10, now 4 members) ← 5 cards [4203, 4205, 4208, 4209, 4210] — Joined by 5 medium-confidence (score 0.21–0.31); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-king-resurrected-and-ascended-sending-out-the-twelve-witnessed-in-ascension-of-isaiah-11** (thread 422, anchor matthew 28:6, now 4 members) ← 2 cards [4202, 4204] — Joined by 2 medium-confidence (score 0.20–0.27); existing thread covers these Matthew verses and shares subject/target with its members.
- **the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance** (thread 21, anchor none, now 11 members) ← 1 cards [4198] — Joined by 1 medium-confidence (score 0.30–0.30); existing thread covers these Matthew verses and shares subject/target with its members.
- **trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid** (thread 23, anchor none, now 17 members) ← 3 cards [4206, 4216, 4217] — Joined by 2 medium-confidence, 1 high-confidence (score 0.30–0.39); existing thread covers these Matthew verses and shares subject/target with its members.

### New threads (91)

- **matthew-1-conceived-of-the-ruach-and-yosephs-dream** — Matthew 1:18-25 — The conception by the Ruach HaKodesh (Holy Spirit) and Yoseph's (Joseph's) dream — 1 cards [3244] (SMALL)
- **matthew-1-the-generation-of-yahusha** — Matthew 1:1-17 — The generation of Yahusha HaMashiach (Jesus Christ), son of David, son of Abraham — 6 cards [2580, 2581, 2582, 2584, 2587, 3237]
- **matthew-2-herod-and-the-slain-infants** — Matthew 2:16-18 — Herod's slaughter of the infants and Rachel weeping — 1 cards [2611] (SMALL)
- **matthew-2-the-return-and-the-nazarene** — Matthew 2:19-23 — The return from Egypt and the Nazarene — 1 cards [2617] (SMALL)
- **matthew-2-the-wise-men-and-the-star** — Matthew 2:1-12 — The wise men from the east and the star — 4 cards [2606, 2608, 2609, 2610]
- **matthew-3-the-axe-the-fan-and-the-fire** — Matthew 3:7-12 — The brood of vipers, the axe at the root, the fan and the fire — 7 cards [2635, 2636, 2637, 2638, 2639, 2640, 2641]
- **matthew-3-the-baptism-of-yahusha** — Matthew 3:13-17 — The baptism of Yahusha (Jesus) and the voice from heaven — 3 cards [2642, 2643, 2645]
- **matthew-4-the-temptation-in-the-wilderness** — Matthew 4:1-11 — The temptation in the wilderness — 2 cards [3267, 3268] (SMALL)
- **matthew-5-adultery-and-divorce** — Matthew 5:27-32 — Adultery, the lustful look and divorce — 1 cards [2671] (SMALL)
- **matthew-5-the-beatitudes** — Matthew 5:1-12 — The Beatitudes — 2 cards [3278, 3279] (SMALL)
- **matthew-6-prayer-in-secret** — Matthew 6:5-8 — Prayer in secret — 3 cards [3293, 3295, 3298]
- **matthew-6-the-prayer-and-forgiveness** — Matthew 6:9-15 — The Lord's Prayer and forgiving trespasses — 2 cards [3305, 3306] (SMALL)
- **matthew-8-the-centurions-servant** — Matthew 8:5-13 — The centurion's servant and the many from east and west — 1 cards [3348] (SMALL)
- **matthew-8-the-cost-of-following** — Matthew 8:18-22 — The cost of following — 3 cards [3355, 3356, 3357]
- **matthew-9-jairus-daughter-and-the-hem-of-the-garment** — Matthew 9:18-26 — The ruler's daughter and the woman who touched the hem — 4 cards [3378, 3379, 3380, 3381]
- **matthew-9-the-harvest-and-the-shepherdless-sheep** — Matthew 9:32-38 — The dumb demoniac, the shepherdless sheep and the harvest — 3 cards [3382, 3383, 3384]
- **matthew-10-not-peace-but-a-sword** — Matthew 10:34-39 — Not peace but a sword, and losing the life to find it — 2 cards [3426, 3427] (SMALL)
- **matthew-10-sheep-among-wolves** — Matthew 10:16-25 — Sheep among wolves and the disciple as his master — 6 cards [3403, 3404, 3405, 3406, 3408, 3409]
- **matthew-10-the-lost-sheep-mission** — Matthew 10:5-15 — The mission to the lost sheep of the house of Yashar'el (Israel) — 12 cards [2741, 2742, 2743, 2744, 2745, 3393, 3394, 3395, 3396, 3397, 3398, 3399]
- **matthew-10-the-twelve-named** — Matthew 10:1-4 — The Twelve named and sent — 9 cards [2735, 2736, 2737, 2738, 2739, 2740, 3388, 3389, 3390]
- **matthew-12-beelzebub-and-the-blasphemy** — Matthew 12:22-37 — Beelzebub, the strong man, the blasphemy and the fruit of the tree — 2 cards [3455, 3458] (SMALL)
- **matthew-12-lord-of-the-sabbath** — Matthew 12:1-8 — The grainfield and the Lord of the Sabbath — 1 cards [2776] (SMALL)
- **matthew-13-rejected-at-nazareth** — Matthew 13:53-58 — A prophet without honor in his own country — 3 cards [3490, 3491, 3492]
- **matthew-13-the-tares-explained** — Matthew 13:36-43 — The tares explained: the harvest and the end of the age — 3 cards [2810, 3478, 3481]
- **matthew-13-the-wheat-and-the-tares** — Matthew 13:24-30 — The wheat and the tares — 1 cards [3472] (SMALL)
- **matthew-14-feeding-the-five-thousand** — Matthew 14:13-21 — Feeding the five thousand — 2 cards [2844, 3499] (SMALL)
- **matthew-14-herod-and-the-death-of-yochanan** — Matthew 14:1-12 — Herod and the death of Yochanan (John) — 2 cards [2838, 2839] (SMALL)
- **matthew-14-walking-on-the-sea** — Matthew 14:22-33 — Walking on the sea — 4 cards [3503, 3504, 3505, 3506]
- **matthew-15-the-tradition-of-the-elders** — Matthew 15:1-9 — The tradition of the elders and the commandment of Elohim (God) — 3 cards [2865, 2866, 2867]
- **matthew-15-what-defiles-a-man** — Matthew 15:10-20 — What defiles a man — 7 cards [2885, 2886, 2887, 3514, 3515, 3516, 3517]
- **matthew-16-take-up-your-cross** — Matthew 16:24-28 — Take up the cross and the Son of Adam coming in his kingdom — 2 cards [2914, 2915] (SMALL)
- **matthew-16-the-passion-foretold** — Matthew 16:21-23 — The first foretelling of the passion — 1 cards [2906] (SMALL)
- **matthew-17-elijah-has-come** — Matthew 17:9-13 — Elijah has already come — 2 cards [3572, 3573] (SMALL)
- **matthew-17-faith-like-a-mustard-seed** — Matthew 17:14-21 — The boy healed and faith like a mustard seed — 5 cards [3580, 3581, 3582, 3583, 3588]
- **matthew-17-the-second-passion-foretelling** — Matthew 17:22-23 — The passion foretold again — 4 cards [3591, 3592, 3593, 3594]
- **matthew-17-the-transfiguration** — Matthew 17:1-8 — The transfiguration — 2 cards [3541, 3555] (SMALL)
- **matthew-18-forgiveness-and-the-unforgiving-servant** — Matthew 18:21-35 — Seventy times seven and the unforgiving servant — 5 cards [3641, 3642, 3644, 3645, 3646]
- **matthew-18-reproof-and-binding** — Matthew 18:15-20 — Reproving a brother, binding and loosing, two or three gathered — 7 cards [3629, 3630, 3631, 3632, 3633, 3634, 3635]
- **matthew-19-marriage-divorce-and-eunuchs** — Matthew 19:1-12 — Marriage, divorce and the eunuchs for the kingdom — 6 cards [3647, 3648, 3649, 3656, 3659, 3664]
- **matthew-19-the-camel-and-the-needle** — Matthew 19:23-26 — The camel and the needle's eye — 4 cards [3690, 3691, 3692, 3693]
- **matthew-19-the-rich-young-ruler** — Matthew 19:16-22 — The rich young ruler and the commandments — 2 cards [3677, 3679] (SMALL)
- **matthew-19-the-twelve-thrones** — Matthew 19:27-30 — The twelve thrones and the first made last — 5 cards [3701, 3715, 3716, 3717, 3718]
- **matthew-20-the-cup-and-the-ransom** — Matthew 20:20-28 — The sons of Zebedee, the cup, and the ransom for many — 7 cards [3736, 3737, 3738, 3746, 3747, 3749, 3750]
- **matthew-20-the-laborers-in-the-vineyard** — Matthew 20:1-16 — The laborers in the vineyard — 4 cards [3721, 3722, 3723, 3724]
- **matthew-20-the-third-passion-foretelling** — Matthew 20:17-19 — The third foretelling of the passion — 7 cards [3729, 3730, 3731, 3732, 3733, 3734, 3735]
- **matthew-20-the-two-blind-men-of-jericho** — Matthew 20:29-34 — The two blind men at Jericho — 1 cards [3772] (SMALL)
- **matthew-21-by-what-authority** — Matthew 21:23-27 — By what authority — 4 cards [3807, 3808, 3809, 3810]
- **matthew-21-cleansing-the-temple** — Matthew 21:12-17 — Cleansing the temple — 4 cards [3787, 3792, 3795, 3796]
- **matthew-21-the-entry-on-the-colt** — Matthew 21:1-11 — The entry on the colt and the Hosanna — 2 cards [3775, 3776] (SMALL)
- **matthew-21-the-fig-tree-withered** — Matthew 21:18-22 — The fig tree withered and faith that moves mountains — 6 cards [3799, 3801, 3802, 3804, 3805, 3806]
- **matthew-21-the-two-sons** — Matthew 21:28-32 — The parable of the two sons — 1 cards [3815] (SMALL)
- **matthew-21-the-wicked-husbandmen-and-the-stone** — Matthew 21:33-46 — The wicked husbandmen and the rejected stone — 7 cards [3840, 3858, 3859, 3860, 3861, 3862, 3863]
- **matthew-22-davids-lord** — Matthew 22:41-46 — David's Lord at the right hand — 3 cards [3915, 3917, 3919]
- **matthew-22-the-great-commandment** — Matthew 22:34-40 — The great commandment — 1 cards [3907] (SMALL)
- **matthew-22-the-resurrection-and-the-sadducees** — Matthew 22:23-33 — The Sadducees and the resurrection — 3 cards [3887, 3897, 3899]
- **matthew-22-the-wedding-feast** — Matthew 22:1-14 — The wedding feast and the guest without a garment — 10 cards [3865, 3866, 3867, 3868, 3869, 3870, 3871, 3878, 3879, 3880]
- **matthew-23-jerusalem-and-the-gathering-hen** — Matthew 23:37-39 — Jerusalem, the gathering hen and the house left desolate — 4 cards [3990, 3991, 3994, 3995]
- **matthew-23-the-blood-of-the-prophets** — Matthew 23:29-36 — Building the tombs of the prophets and the blood from Hevel (Abel) to Zekharyah — 1 cards [3982] (SMALL)
- **matthew-23-the-seat-of-moses-gospel-parallels** — Matthew 23:1-12 — The seat of Moses and the humbled exalted: gospel parallels — 3 cards [3928, 3934, 3935]
- **matthew-23-the-seat-of-moses-other-witnesses** — Matthew 23:1-12 — The seat of Moses and the humbled exalted: other witnesses — 2 cards [3929, 3939] (SMALL)
- **matthew-23-the-seat-of-moses-prophets-and-histories** — Matthew 23:1-12 — The seat of Moses and the humbled exalted: prophets and histories — 3 cards [3927, 3936, 3937]
- **matthew-23-the-seat-of-moses-torah-witnesses** — Matthew 23:1-12 — The seat of Moses and the humbled exalted: torah witnesses — 5 cards [3926, 3930, 3931, 3932, 3938]
- **matthew-24-false-christs-and-the-lightning** — Matthew 24:23-28 — False christs and the coming like lightning — 6 cards [4021, 4022, 4023, 4024, 4025, 4026]
- **matthew-24-the-abomination-of-desolation** — Matthew 24:15-22 — The abomination of desolation and the great tribulation — 6 cards [4015, 4016, 4017, 4018, 4019, 4020]
- **matthew-24-the-beginning-of-sorrows** — Matthew 24:4-14 — The beginning of sorrows and the gospel of the kingdom witnessed — 10 cards [4005, 4006, 4007, 4008, 4009, 4010, 4011, 4012, 4013, 4014]
- **matthew-24-the-coming-and-the-gathering** — Matthew 24:29-31 — The sign of the Son of Adam, the trumpet and the gathering of the elect — 9 cards [4027, 4028, 4029, 4030, 4032, 4033, 4034, 4036, 4038]
- **matthew-24-the-day-and-hour-and-the-days-of-noach-apostolic-writings** — Matthew 24:36-44 — The day and hour unknown and the days of Noach (Noah): apostolic writings — 4 cards [4068, 4073, 4079, 4082]
- **matthew-24-the-day-and-hour-and-the-days-of-noach-gospel-parallels** — Matthew 24:36-44 — The day and hour unknown and the days of Noach (Noah): gospel parallels — 6 cards [4066, 4067, 4075, 4076, 4077, 4078]
- **matthew-24-the-day-and-hour-and-the-days-of-noach-other-witnesses** — Matthew 24:36-44 — The day and hour unknown and the days of Noach (Noah): other witnesses — 3 cards [4069, 4080, 4081]
- **matthew-24-the-fig-tree-parable** — Matthew 24:32-35 — The fig tree and this generation — 5 cards [4061, 4062, 4063, 4064, 4065]
- **matthew-24-the-temple-torn-down-and-the-question** — Matthew 24:1-3 — The temple thrown down and the disciples' question — 8 cards [3996, 3997, 3998, 3999, 4000, 4001, 4003, 4004]
- **matthew-25-the-sheep-and-the-goats-other-witnesses** — Matthew 25:31-46 — The sheep and the goats at the throne of his glory: other witnesses — 4 cards [2949, 2961, 2957, 4100]
- **matthew-25-the-sheep-and-the-goats-prophets-and-histories** — Matthew 25:31-46 — The sheep and the goats at the throne of his glory: prophets and histories — 8 cards [3006, 3007, 3008, 3009, 4096, 4097, 4110, 4111]
- **matthew-25-the-sheep-and-the-goats-revelation** — Matthew 25:31-46 — The sheep and the goats at the throne of his glory: revelation — 4 cards [3000, 3001, 3003, 4113]
- **matthew-25-the-ten-virgins** — Matthew 25:1-13 — The ten virgins — 1 cards [4088] (SMALL)
- **matthew-26-before-the-sanhedrin** — Matthew 26:57-68 — Before the high priest and the council — 7 cards [4141, 4142, 4143, 4144, 4148, 4149, 4150]
- **matthew-26-kefas-denial** — Matthew 26:69-75 — Kefa's (Peter's) denial — 8 cards [4151, 4152, 4153, 4154, 4155, 4156, 4157, 4158]
- **matthew-26-the-anointing-at-bethany** — Matthew 26:6-13 — The anointing at Bethany — 6 cards [4119, 4120, 4121, 4122, 4123, 4124]
- **matthew-26-the-arrest** — Matthew 26:47-56 — The kiss, the arrest and the scriptures fulfilled — 8 cards [4133, 4134, 4135, 4136, 4137, 4138, 4139, 4140]
- **matthew-26-the-passover-and-the-betrayer** — Matthew 26:17-25 — The Passover meal and the betrayer — 7 cards [3076, 3082, 3084, 4127, 4128, 4129, 4132]
- **matthew-26-the-plot-against-yahusha-gospel-parallels** — Matthew 26:1-5 — The plot of the chief priests and elders: gospel parallels — 5 cards [3067, 3069, 4114, 4115, 4117]
- **matthew-26-the-plot-against-yahusha-other-witnesses** — Matthew 26:1-5 — The plot of the chief priests and elders: other witnesses — 4 cards [3071, 3073, 3081, 4116]
- **matthew-26-the-plot-against-yahusha-revelation** — Matthew 26:1-5 — The plot of the chief priests and elders: revelation — 4 cards [3075, 3077, 3079, 3085]
- **matthew-26-the-plot-against-yahusha-torah-witnesses** — Matthew 26:1-5 — The plot of the chief priests and elders: torah witnesses — 3 cards [3065, 3083, 4118]
- **matthew-27-judas-and-the-potters-field** — Matthew 27:1-10 — Judas, the silver and the potter's field — 2 cards [4159, 4163] (SMALL)
- **matthew-27-pilate-and-barabbas** — Matthew 27:11-26 — Before Pilate, Barabbas and the blood on us — 7 cards [4165, 4166, 4167, 4168, 4169, 4170, 4171]
- **matthew-27-the-burial** — Matthew 27:57-61 — The burial in the new tomb — 4 cards [4191, 4192, 4193, 4195]
- **matthew-27-the-crucifixion** — Matthew 27:32-44 — The crucifixion between two thieves — 8 cards [4182, 4183, 4184, 4185, 4186, 4187, 4188, 4189]
- **matthew-27-the-mocking-and-the-crown-of-thorns** — Matthew 27:27-31 — The mocking and the crown of thorns — 10 cards [4172, 4173, 4174, 4175, 4176, 4177, 4178, 4179, 4180, 4181]
- **matthew-28-the-empty-tomb** — Matthew 28:1-8 — The empty tomb and the angel — 5 cards [4196, 4197, 4199, 4200, 4201]
- **matthew-28-the-great-commission** — Matthew 28:16-20 — The great commission — 1 cards [4207] (SMALL)

## Unanchored threads: proposed anchors (Matthew)

| id | slug | proposed | basis | Matthew members / all | other source books |
|---|---|---|---|---|---|
| 1 | post-harvest-sifting | 3:10 | no verse shared by two members; first member verse of the chapter holding most members (ch 3: 2 of 2) | 2/13 | canon/luke, canon/mark, canon/matthew |
| 4 | scattered-seed-gathering | 8:11 | 6 of 36 Matthew members sit on 8:11 | 36/54 | canon/luke, canon/mark, canon/matthew |
| 6 | eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-te | 27:46 | 14 of 14 Matthew members sit on 27:46 | 14/18 | canon/mark, canon/matthew |
| 7 | gethsemane-cup-of-suffering-and-the-sons-substantial-submiss | 26:36 | 17 of 17 Matthew members sit on 26:36 | 17/27 | canon/luke, canon/mark, canon/matthew |
| 8 | great-commission-all-nations-as-territories-of-the-scattered | 28:18 | 20 of 20 Matthew members sit on 28:18 | 20/34 | canon/luke, canon/mark, canon/matthew |
| 9 | heart-torah-not-abolition | 5:17 | 4 of 10 Matthew members sit on 5:17 (tie with 5:19; earliest taken) | 10/23 | canon/luke, canon/mark, canon/matthew |
| 10 | his-blood-be-on-us-and-on-our-children-system-not-people-and | 27:25 | 13 of 13 Matthew members sit on 27:25 | 13/15 | canon/mark, canon/matthew |
| 11 | last-supper-this-is-my-body-this-is-my-blood-of-the-new-test | 26:26 | 18 of 18 Matthew members sit on 26:26 | 18/22 | canon/luke, canon/mark, canon/matthew |
| 12 | lord-lord-and-torahlessness | 7:23 | 4 of 10 Matthew members sit on 7:23 | 10/11 | canon/luke, canon/matthew |
| 13 | parable-of-the-talents-stewardship-and-the-unprofitable-serv | 25:14 | 15 of 15 Matthew members sit on 25:14 | 15/20 | canon/luke, canon/mark, canon/matthew |
| 14 | parable-of-the-ten-virgins-oil-substance-as-heart-torah-walk | 25:1 | 13 of 13 Matthew members sit on 25:1 | 13/13 | canon/matthew |
| 16 | saints-arising-from-the-graves-as-firstfruits-pre-figured-re | 27:51 | 8 of 8 Matthew members sit on 27:51 | 8/8 | canon/matthew |
| 17 | sanhedrin-trial-tehillim-110-and-daniel-7-self-identificatio | 26:64 | 20 of 20 Matthew members sit on 26:64 | 20/30 | canon/luke, canon/mark, canon/matthew |
| 18 | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his | 25:31 | 23 of 23 Matthew members sit on 25:31 | 23/25 | canon/mark, canon/matthew |
| 19 | substantial-crucifixion-tanakh-substances-tehillim-22-and-ye | 27:33 | 26 of 26 Matthew members sit on 27:33 | 26/34 | canon/mark, canon/matthew |
| 20 | teaching-them-to-observe-all-things-i-have-commanded-you-hea | 28:20 | 13 of 13 Matthew members sit on 28:20 | 13/13 | canon/matthew |
| 21 | the-resurrection-substance-tehillim-16-and-tehillim-22-vindi | 28:1 | 11 of 11 Matthew members sit on 28:1 | 11/15 | canon/mark, canon/matthew |
| 22 | thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic- | 26:14 | 8 of 8 Matthew members sit on 26:14 | 8/11 | canon/mark, canon/matthew |
| 23 | trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-f | 28:19 | 17 of 17 Matthew members sit on 28:19 | 17/21 | canon/mark, canon/matthew |
| 24 | veil-of-the-temple-rent-and-the-substantial-access-to-the-fa | 27:51 | 10 of 10 Matthew members sit on 27:51 | 10/13 | canon/luke, canon/mark, canon/matthew |
| 25 | women-as-the-first-witnesses-of-the-resurrection-and-the-fai | 28:1 | 8 of 8 Matthew members sit on 28:1 | 8/18 | canon/luke, canon/mark, canon/matthew |
| 26 | fulfill-as-prophecy-bringing-to-pass | 2:15 | no verse shared by two members; first member verse of the chapter holding most members (ch 2: 3 of 13) | 13/40 | canon/acts, canon/james, canon/john, canon/luke, canon/mark, canon/matthew, canon/revelation |
| 27 | son-of-adam-named-before-creation | 1:21 | 3 of 5 Matthew members sit on 1:21 | 5/5 | canon/matthew |
| 28 | genealogy-as-adamic-toledot | 1:1 | 5 of 5 Matthew members sit on 1:1 | 5/6 | canon/luke, canon/matthew |
| 29 | tamar-in-yahudahs-own-voice | 1:3 | 3 of 3 Matthew members sit on 1:3 | 3/3 | canon/matthew |
| 30 | matthean-yoseph-and-the-patriarch-yoseph | 2:14 | 2 of 3 Matthew members sit on 2:14 | 3/3 | canon/matthew |
| 31 | levi-yahudah-benjamin-messianic-prophecies | 1:1 | 2 of 3 Matthew members sit on 1:1 | 3/3 | canon/matthew |
| 32 | magi-astronomical-tradition | 2:2 | 2 of 3 Matthew members sit on 2:2 | 3/3 | canon/matthew |
| 33 | incarnation-of-the-beloved | 1:23 | 3 of 3 Matthew members sit on 1:23 | 3/3 | canon/matthew |
| 34 | firstborn-son-out-of-egypt-extras | 2:15 | no verse shared by two members; first member verse of the chapter holding most members (ch 2: 1 of 1) | 1/1 | canon/matthew |
| 35 | pharaoh-mosheh-herod-yahusha-infant-slaughter | 2:16 | 2 of 3 Matthew members sit on 2:16 | 3/4 | canon/luke, canon/matthew |
| 36 | rachel-buried-at-bethlehem | 2:18 | 2 of 2 Matthew members sit on 2:18 | 2/2 | canon/matthew |
| 37 | plant-of-righteousness-and-the-branch | 2:23 | no verse shared by two members; first member verse of the chapter holding most members (ch 2: 1 of 2) | 2/2 | canon/matthew |
| 38 | praise-of-elijah-and-the-yochanan-pattern | 3:1 | no verse shared by two members; first member verse of the chapter holding most members (ch 3: 4 of 4) | 4/4 | canon/matthew |
| 39 | heavens-opened-at-the-priestly-investiture | 3:16 | 3 of 3 Matthew members sit on 3:16 | 3/4 | canon/luke, canon/matthew |
| 40 | spirit-of-wisdom-on-the-elect-one | 3:16 | 4 of 4 Matthew members sit on 3:16 | 4/4 | canon/matthew |
| 41 | father-voice-naming-the-son-of-adam-at-the-investiture | 3:17 | 4 of 4 Matthew members sit on 3:17 | 4/11 | canon/luke, canon/mark, canon/matthew |
| 42 | watcher-rebellion-as-source-of-the-vipers | 3:7 | 5 of 5 Matthew members sit on 3:7 | 5/6 | canon/luke, canon/matthew |
| 43 | temptation-as-mastema-architecture | 4:1 | no verse shared by two members; first member verse of the chapter holding most members (ch 4: 3 of 3) | 3/4 | canon/luke, canon/matthew |
| 44 | azazel-bound-in-the-wilderness-as-the-temptation-ground | 4:1 | 4 of 4 Matthew members sit on 4:1 | 4/5 | canon/luke, canon/matthew |
| 45 | beliar-as-king-of-this-world | 4:8 | no verse shared by two members; first member verse of the chapter holding most members (ch 4: 3 of 3) | 3/3 | canon/matthew |
| 46 | ungodly-plot-against-the-righteous-son | 4:6 | 2 of 4 Matthew members sit on 4:6 | 4/4 | canon/matthew |
| 47 | animal-apocalypse-gathering-of-the-dispersed-sheep | 4:19 | no verse shared by two members; first member verse of the chapter holding most members (ch 4: 1 of 1) | 1/2 | canon/luke, canon/matthew |
| 48 | beatitudes-as-righteous-elect-blessing-register | 5:10 | 2 of 5 Matthew members sit on 5:10 | 5/6 | canon/luke, canon/matthew |
| 49 | light-of-the-elect-and-the-throne-of-glory | 5:14 | 2 of 3 Matthew members sit on 5:14 | 3/3 | canon/matthew |
| 50 | heavenly-tablets-and-torah-permanence | 5:18 | 2 of 2 Matthew members sit on 5:18 | 2/2 | canon/matthew |
| 51 | woe-against-those-who-alter-and-teach-men-so | 5:19 | 3 of 3 Matthew members sit on 5:19 | 3/3 | canon/matthew |
| 52 | oath-restraint-register | 5:33 | no verse shared by two members; first member verse of the chapter holding most members (ch 5: 3 of 3) | 3/3 | canon/matthew |
| 53 | love-replacing-hatred-and-fornication-in-the-testaments | 5:22 | no verse shared by two members; first member verse of the chapter holding most members (ch 5: 3 of 3) | 3/3 | canon/matthew |
| 54 | mercy-on-enemies-as-the-father-pattern | 5:44 | no verse shared by two members; first member verse of the chapter holding most members (ch 5: 2 of 2) | 2/3 | canon/luke, canon/matthew |
| 55 | alms-prayer-fasting-as-triad-in-tobit-and-sirach | 6:4 | 2 of 3 Matthew members sit on 6:4 | 3/3 | canon/matthew |
| 56 | forgive-thy-neighbour-as-sirach-and-the-lords-prayer | 6:12 | no verse shared by two members; first member verse of the chapter holding most members (ch 6: 3 of 3) | 3/4 | canon/luke, canon/matthew |
| 57 | treasures-laid-up-by-the-open-hand-in-tobit-and-sirach | 6:20 | 4 of 4 Matthew members sit on 6:20 | 4/5 | canon/luke, canon/matthew |
| 58 | the-single-eye-of-issachar-and-the-evil-eye-of-sirach | 6:23 | 3 of 5 Matthew members sit on 6:23 | 5/6 | canon/luke, canon/matthew |
| 59 | riches-as-snare-and-stumblingblock-in-sirach | 6:24 | 3 of 3 Matthew members sit on 6:24 | 3/3 | canon/matthew |
| 60 | the-righteous-in-the-fathers-hand-in-wisdom | 6:33 | 2 of 3 Matthew members sit on 6:33 | 3/4 | canon/luke, canon/matthew |
| 61 | thy-name-and-thy-throne-in-the-enochic-prayers | 6:9 | 2 of 3 Matthew members sit on 6:9 | 3/3 | canon/matthew |
| 62 | the-golden-rule-as-restoration-in-tobit | 7:12 | no verse shared by two members; first member verse of the chapter holding most members (ch 7: 1 of 1) | 1/1 | canon/matthew |
| 63 | judge-not-and-let-go-anger-in-sirach | 7:1 | no verse shared by two members; first member verse of the chapter holding most members (ch 7: 3 of 3) | 3/4 | canon/luke, canon/matthew |
| 64 | pearls-before-swine-and-wisdom-not-for-fools-in-sirach | 7:6 | 2 of 2 Matthew members sit on 7:6 | 2/2 | canon/matthew |
| 65 | ask-seek-knock-and-wisdom-found-by-seekers-in-wisdom | 7:7 | 2 of 3 Matthew members sit on 7:7 | 3/3 | canon/matthew |
| 66 | the-two-ways-of-enoch-and-the-narrow-gate | 7:13 | no verse shared by two members; first member verse of the chapter holding most members (ch 7: 2 of 2) | 2/2 | canon/matthew |
| 67 | by-their-fruits-and-the-utterance-of-the-heart-in-sirach | 7:16 | no verse shared by two members; first member verse of the chapter holding most members (ch 7: 2 of 2) | 2/5 | canon/luke, canon/matthew |
| 68 | wise-and-foolish-builders-and-the-heart-stablished-in-sirach | 7:24 | 2 of 3 Matthew members sit on 7:24 | 3/6 | canon/luke, canon/matthew |
| 69 | gather-all-the-tribes-of-jacob-in-sirach-and-enoch | 8:11 | 4 of 4 Matthew members sit on 8:11 | 4/4 | canon/matthew |
| 70 | the-righteous-one-suffering-in-wisdom-and-the-servant-creden | 8:17 | 3 of 3 Matthew members sit on 8:17 | 3/3 | canon/matthew |
| 71 | the-named-son-of-adam-in-enoch | 8:20 | 3 of 3 Matthew members sit on 8:20 | 3/3 | canon/matthew |
| 72 | the-fathers-providence-over-the-sea-in-wisdom | 8:26 | 2 of 2 Matthew members sit on 8:26 | 2/2 | canon/matthew |
| 73 | spirits-from-the-giants-and-demons-partially-restrained | 8:28 | 2 of 3 Matthew members sit on 8:28 | 3/3 | canon/matthew |
| 93 | mercy-not-sacrifice-in-sirach | 9:13 | 3 of 3 Matthew members sit on 9:13 | 3/3 | canon/matthew |
| 94 | alms-as-laid-up-treasure-in-tobit | 9:13 | 4 of 4 Matthew members sit on 9:13 | 4/4 | canon/matthew |
| 95 | publicans-and-sinners-and-sirach-12-inverse | 9:10 | no verse shared by two members; first member verse of the chapter holding most members (ch 9: 3 of 3) | 3/4 | canon/luke, canon/matthew |
| 96 | the-named-son-of-adam-in-enoch-similitudes | 9:6 | 3 of 3 Matthew members sit on 9:6 | 3/3 | canon/matthew |
| 97 | fasting-with-mercy-not-without-in-tobit-and-sirach | 9:14 | no verse shared by two members; first member verse of the chapter holding most members (ch 9: 2 of 2) | 2/2 | canon/matthew |
| 98 | new-wine-and-the-old-friend-inverse-in-sirach | 9:17 | no verse shared by two members; first member verse of the chapter holding most members (ch 9: 1 of 1) | 1/1 | canon/matthew |
| 99 | physician-prayer-architecture-in-sirach-bypassed | 9:20 | no verse shared by two members; first member verse of the chapter holding most members (ch 9: 3 of 3) | 3/3 | canon/matthew |
| 100 | power-over-life-and-death-in-wisdom | 9:24 | no verse shared by two members; first member verse of the chapter holding most members (ch 9: 2 of 2) | 2/2 | canon/matthew |
| 101 | the-davidic-messiah-in-4-ezra | 9:27 | 4 of 4 Matthew members sit on 9:27 | 4/4 | canon/matthew |
| 102 | the-animal-apocalypse-shepherds-judged-and-new-house | 9:36 | 3 of 3 Matthew members sit on 9:36 | 3/3 | canon/matthew |
| 103 | harvest-of-the-age-in-2-baruch | 9:37 | no verse shared by two members; first member verse of the chapter holding most members (ch 9: 2 of 2) | 2/2 | canon/matthew |
| 104 | harvest-when-the-number-is-fulfilled-in-4-ezra | 9:37 | no verse shared by two members; first member verse of the chapter holding most members (ch 9: 2 of 2) | 2/2 | canon/matthew |
| 105 | gathering-the-dispersed-with-much-mercy-in-2-baruch | 9:36 | 2 of 2 Matthew members sit on 9:36 | 2/3 | canon/mark, canon/matthew |
| 106 | the-ten-tribes-beyond-the-river-in-4-ezra-13 | 10:6 | 2 of 3 Matthew members sit on 10:6 | 3/3 | canon/matthew |
| 107 | confess-among-the-gentiles-and-gathering-in-tobit-13-14 | 10:6 | no verse shared by two members; first member verse of the chapter holding most members (ch 10: 3 of 3) | 3/3 | canon/matthew |
| 108 | the-gospel-to-the-lost-sheep-far-hence-in-sonnini-acts-29 | 10:6 | 2 of 3 Matthew members sit on 10:6 | 3/3 | canon/matthew |
| 109 | prepare-the-soul-for-temptation-in-sirach-2 | 10:22 | 2 of 3 Matthew members sit on 10:22 | 3/3 | canon/matthew |
| 110 | souls-of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5 | 10:22 | no verse shared by two members; first member verse of the chapter holding most members (ch 10: 3 of 3) | 3/3 | canon/matthew |
| 111 | the-mother-and-seven-sons-soul-unreachable-in-4-maccabees | 10:28 | 2 of 2 Matthew members sit on 10:28 | 2/2 | canon/matthew |
| 112 | prize-of-endurance-in-everlasting-life-in-4-maccabees-13 | 10:22 | 2 of 2 Matthew members sit on 10:22 | 2/2 | canon/matthew |
| 113 | elohim-hears-the-speechless-eleazar-in-4-maccabees | 10:20 | no verse shared by two members; first member verse of the chapter holding most members (ch 10: 1 of 1) | 1/1 | canon/matthew |
| 114 | names-in-the-books-of-life-not-blotted-out-in-1-enoch-103 | 10:32 | no verse shared by two members; first member verse of the chapter holding most members (ch 10: 2 of 2) | 2/3 | canon/luke, canon/matthew |
| 115 | family-division-in-the-day-of-destruction-in-1-enoch | 10:35 | no verse shared by two members; first member verse of the chapter holding most members (ch 10: 2 of 2) | 2/3 | canon/luke, canon/matthew |
| 116 | the-twelve-apostles-and-the-one-delivered-in-ascension-isaia | 10:4 | no verse shared by two members; first member verse of the chapter holding most members (ch 10: 1 of 1) | 1/1 | canon/matthew |
| 117 | prophets-question-in-the-inaugurated-tension-in-4-ezra-4 | 11:6 | 2 of 3 Matthew members sit on 11:6 | 3/3 | canon/matthew |
| 118 | messianic-age-restoration-in-1-enoch-and-jubilees-23 | 11:5 | 3 of 3 Matthew members sit on 11:5 | 3/3 | canon/matthew |
| 119 | eliyahu-to-restore-the-tribes-in-sirach-48-and-1-maccabees-2 | 11:14 | 2 of 2 Matthew members sit on 11:14 | 2/2 | canon/matthew |
| 120 | new-heart-cleansing-spirit-children-of-the-living-in-jubilee | 11:11 | 3 of 3 Matthew members sit on 11:11 | 3/3 | canon/matthew |
| 121 | wise-laying-in-wait-for-the-righteous-in-wisdom-of-solomon-2 | 11:19 | 3 of 3 Matthew members sit on 11:19 | 3/3 | canon/matthew |
| 122 | wisdom-come-unto-me-fill-yourselves-in-sirach-24-and-baruch- | 11:19 | 3 of 3 Matthew members sit on 11:19 | 3/3 | canon/matthew |
| 123 | mighty-men-mightily-tormented-in-wisdom-of-solomon-6 | 11:21 | no verse shared by two members; first member verse of the chapter holding most members (ch 11: 3 of 3) | 3/3 | canon/matthew |
| 124 | sodom-as-judgment-archetype-in-jubilees-16-and-wisdom-10 | 11:23 | 2 of 3 Matthew members sit on 11:23 | 3/3 | canon/matthew |
| 125 | the-son-of-adam-elect-one-revealing-mysteries-in-1-enoch-46- | 11:27 | 3 of 4 Matthew members sit on 11:27 | 4/4 | canon/matthew |
| 126 | mysteries-revealed-to-the-meek-in-sirach-3-and-wisdom-of-sol | 11:25 | 3 of 3 Matthew members sit on 11:25 | 3/3 | canon/matthew |
| 127 | put-your-neck-under-the-yoke-find-rest-in-sirach-51-and-6-an | 11:28 | 2 of 5 Matthew members sit on 11:28 (tie with 11:29; earliest taken) | 5/5 | canon/matthew |
| 183 | shabbat-as-covenant-sign-protected-day-and-life-saving-defen | 12:12 | 2 of 3 Matthew members sit on 12:12 | 3/3 | canon/matthew |
| 184 | mercy-as-true-offering-alms-deliver-from-death-in-sirach-and | 12:7 | 3 of 3 Matthew members sit on 12:7 | 3/3 | canon/matthew |
| 185 | eschatological-reversal-righteous-stands-before-those-who-co | 12:14 | 3 of 3 Matthew members sit on 12:14 | 3/3 | canon/matthew |
| 186 | spirit-anointed-elect-one-the-spirit-of-wisdom-on-the-son-in | 12:18 | 3 of 3 Matthew members sit on 12:18 | 3/4 | canon/luke, canon/matthew |
| 187 | compassion-on-the-bruised-cry-of-the-widow-and-orphan-in-sir | 12:20 | 3 of 3 Matthew members sit on 12:20 | 3/4 | canon/luke, canon/matthew |
| 188 | binding-of-the-watchers-typological-anchor-for-binding-the-s | 12:29 | 3 of 3 Matthew members sit on 12:29 | 3/9 | canon/luke, canon/mark, canon/matthew |
| 189 | no-forgiveness-for-the-hardened-disposition-in-jubilees-and- | 12:32 | 2 of 3 Matthew members sit on 12:32 | 3/3 | canon/matthew |
| 190 | tongue-as-trial-of-the-heart-words-as-fruit-of-the-tree-in-s | 12:36 | 2 of 3 Matthew members sit on 12:36 | 3/3 | canon/matthew |
| 191 | resurrection-from-sheol-gates-of-the-dead-give-back-in-wisdo | 12:40 | 3 of 3 Matthew members sit on 12:40 | 3/3 | canon/matthew |
| 192 | adam-and-the-inherited-evil-heart-needing-the-new-heart-clea | 12:45 | 2 of 2 Matthew members sit on 12:45 | 2/3 | canon/luke, canon/matthew |
| 193 | children-of-elohim-by-doing-the-fathers-will-in-wisdom-and-s | 12:50 | 4 of 4 Matthew members sit on 12:50 | 4/4 | canon/matthew |
| 194 | wisdom-hidden-from-the-wicked-revealed-to-the-elect-in-1-eno | 13:11 | 2 of 4 Matthew members sit on 13:11 | 4/4 | canon/matthew |
| 195 | birds-of-the-air-snatching-the-seed-mastema-and-the-watchers | 13:4 | no verse shared by two members; first member verse of the chapter holding most members (ch 13: 2 of 2) | 2/2 | canon/matthew |
| 196 | seed-of-good-and-evil-sown-in-the-heart-of-adam-in-2-esdras | 13:24 | 2 of 3 Matthew members sit on 13:24 | 3/3 | canon/matthew |
| 197 | watchers-corruption-as-tares-sown-in-the-wheat-in-1-enoch-an | 13:38 | 3 of 5 Matthew members sit on 13:38 | 5/5 | canon/matthew |
| 198 | binding-the-watchers-at-the-day-of-judgment-with-fire-in-1-e | 13:42 | 2 of 2 Matthew members sit on 13:42 | 2/2 | canon/matthew |
| 199 | righteous-shall-shine-as-the-sun-in-1-enoch-and-2-esdras-and | 13:43 | 2 of 2 Matthew members sit on 13:43 | 2/2 | canon/matthew |
| 200 | mysteries-hidden-from-the-foundation-revealed-to-the-elect-i | 13:35 | 3 of 4 Matthew members sit on 13:35 | 4/4 | canon/matthew |
| 201 | kingdom-of-supreme-worth-treasure-and-pearl-in-sirach-and-wi | 13:44 | 2 of 4 Matthew members sit on 13:44 (tie with 13:45; earliest taken) | 4/4 | canon/matthew |
| 202 | wheat-from-chaff-and-righteous-from-wicked-at-the-day-of-sep | 13:49 | 4 of 4 Matthew members sit on 13:49 | 4/4 | canon/matthew |
| 203 | seed-war-from-genesis-3-and-the-devil-as-source-of-death-in- | 13:38 | 2 of 3 Matthew members sit on 13:38 | 3/3 | canon/matthew |
| 204 | eliyahu-prophet-pattern-and-promised-return-in-sirach-48 | 14:3 | 2 of 4 Matthew members sit on 14:3 | 4/4 | canon/matthew |
| 205 | wilderness-manna-and-bread-as-word-in-wisdom-of-solomon-and- | 14:19 | 2 of 4 Matthew members sit on 14:19 | 4/4 | canon/matthew |
| 206 | wonders-of-the-sea-and-the-creators-mastery-in-sirach-and-wi | 14:25 | 3 of 3 Matthew members sit on 14:25 | 3/3 | canon/matthew |
| 207 | ehyeh-self-identification-and-the-all-powerful-word-from-hea | 14:27 | 3 of 3 Matthew members sit on 14:27 | 3/3 | canon/matthew |
| 208 | righteous-witness-lied-in-wait-for-and-condemned-with-shamef | 14:3 | no verse shared by two members; first member verse of the chapter holding most members (ch 14: 3 of 3) | 3/3 | canon/matthew |
| 219 | honor-of-parents-fifth-commandment-the-corban-tradition-void | 15:4 | 4 of 5 Matthew members sit on 15:4 | 5/7 | canon/mark, canon/matthew |
| 220 | the-heart-the-source-of-evil-not-the-father-in-sirach-and-wi | 15:18 | 2 of 4 Matthew members sit on 15:18 | 4/4 | canon/matthew |
| 221 | gathering-of-the-scattered-twelve-tribes-in-sirach-and-2-esd | 15:24 | 5 of 5 Matthew members sit on 15:24 | 5/5 | canon/matthew |
| 222 | seed-of-promise-specifically-to-yasharel-not-other-seed-of-a | 15:26 | 3 of 4 Matthew members sit on 15:26 | 4/4 | canon/matthew |
| 223 | yovel-cycle-and-the-year-weeks-architecture-in-jubilees | 15:37 | 3 of 3 Matthew members sit on 15:37 | 3/3 | canon/matthew |
| 224 | the-son-of-the-living-elohim-named-before-the-foundation-in- | 16:16 | 3 of 5 Matthew members sit on 16:16 | 5/5 | canon/matthew |
| 225 | the-elect-one-on-the-throne-and-the-davidic-stewardship-keys | 16:19 | 4 of 4 Matthew members sit on 16:19 | 4/4 | canon/matthew |
| 226 | the-righteous-one-condemned-with-a-shameful-death-in-wisdom- | 16:21 | 5 of 5 Matthew members sit on 16:21 | 5/5 | canon/matthew |
| 227 | the-gates-of-sheol-and-the-resurrection-substance-in-wisdom- | 16:18 | 4 of 4 Matthew members sit on 16:18 | 4/4 | canon/matthew |
| 228 | reward-according-to-works-the-post-harvest-sifting-in-sirach | 16:27 | 5 of 5 Matthew members sit on 16:27 | 5/5 | canon/matthew |

### Threads with 0 members (1)

- 2 `grace-from-names-sake` — Grace from his name's sake — the Tanakh source the Reformation cut in half

### Unanchored threads with no Matthew-source members (3)

- 3 `new-heart` — no Matthew-source members; anchor proposed in Mark/Luke (outside this task, offered for convenience); mark 2:21 (no verse shared by two members; first member verse of the chapter holding most members (ch 2: 2 of 2)), luke 15:17 (no verse shared by two members; first member verse of the chapter holding most members (ch 15: 1 of 1))
- 5 `false-inclusion-rebuttal` — no Matthew-source members; anchor proposed in Mark/Luke (outside this task, offered for convenience); mark 14:27 (3 of 5 Mark members sit on 14:27)
- 15 `paul-and-the-wresting-of-his-letters` — members only in books not provided (e.g. 2 Peter): no proposal possible; 

## Per-card map


### Matthew 1 (49 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2525 | 1:21 → ezekiel 36:22 | PARTIAL | near-not-verbatim |  |  | scattered-seed-gathering |
| 2526 | 1:21 → deuteronomy 9:5 | PARTIAL | near-not-verbatim |  |  | matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13 |
| 2566 | 1:21 → matthew 15:24 | PARTIAL | phrase | jargon:locked |  | matthew-1-he-shall-save-his-people-from-their-sins-psalm-130-isaiah-53-acts-4 |
| 2567 | 1:21 → matthew 10:5 | BARE | none | italics not from target |  | matthew-1-he-shall-save-his-people-from-their-sins-psalm-130-isaiah-53-acts-4 |
| 2568 | 1:21 → ezekiel 34:11 | BARE | none | italics not from target |  | scattered-seed-gathering |
| 2569 | 1:21 → john 10:27 | PARTIAL | phrase |  |  | scattered-seed-gathering |
| 2570 | 1:21 → matthew 28:19 | BARE | none | no quotation | 3192(ma-rev,live) | scattered-seed-gathering |
| 2571 | 1:3 → genesis 38:26 | PARTIAL | near-not-verbatim |  |  | matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4 |
| 2572 | 1:5 → joshua 2:11 | PARTIAL | phrase |  |  | matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4 |
| 2574 | 1:5 → ruth 1:16 | PARTIAL | near-not-verbatim |  |  | matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4 |
| 2575 | 1:5 → genesis 19:36 | BARE | none | no quotation |  | matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4 |
| 2576 | 1:5 → ruth 4:14 | BARE | none | jargon:pre-figur; no quotation |  | matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4 |
| 2577 | 1:6 → 2-samuel 11:27 | PARTIAL | near-not-verbatim |  |  | matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4 |
| 2578 | 1:1 → genesis 12:3 | PARTIAL | near-not-verbatim |  |  | matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31 |
| 2579 | 1:1 → 2-samuel 7:12 | PARTIAL | near-not-verbatim |  |  | matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4 |
| 2580 | 1:11 → 2-kings 24:14 | BARE | none | no quotation |  | matthew-1-the-generation-of-yahusha |
| 2581 | 1:11 → 2-kings 17:6 | BARE | none | no quotation |  | matthew-1-the-generation-of-yahusha |
| 2582 | 1:17 → jeremiah 25:11 | BARE | none | label-like |  | matthew-1-the-generation-of-yahusha |
| 2583 | 1:17 → ezekiel 37:15 | BARE | none | no quotation |  | matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31 |
| 2584 | 1:17 → ezekiel 20:33 | BARE | none | chain:wilderness-of-the-peoples; label-like |  | matthew-1-the-generation-of-yahusha |
| 2585 | 1:17 → isaiah 11:11 | BARE | none | italics not from target |  | matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31 |
| 2586 | 1:17 → hosea 1:11 | PARTIAL | phrase |  |  | matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31 |
| 2587 | 1:17 → ezra 2:1 | BARE | none | no quotation |  | matthew-1-the-generation-of-yahusha |
| 2589 | 1:23 → john 1:14 | PARTIAL | phrase |  |  | matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18 |
| 2590 | 1:23 → exodus 33:20 | PARTIAL | near-not-verbatim |  |  | matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18 |
| 2591 | 1:23 → john 1:18 | PARTIAL | near-not-verbatim |  |  | matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18 |
| 2592 | 1:23 → genesis 18:1 | PARTIAL | near-not-verbatim | jargon:pre-figur |  | matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18 |
| 2593 | 1:23 → exodus 24:9 | BARE | none | italics not from target |  | matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18 |
| 2594 | 1:23 → 1-corinthians 15:28 | DOCREF | phrase | DOCREF:the framework; chain:Formless-and-Formed/co-equal-persons |  | matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18 |
| 2595 | 1:23 → 1-corinthians 11:3 | PARTIAL | phrase |  |  | matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18 |
| 2596 | 1:21 → numbers 13:16 | BARE | none | italics not from target |  | matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13 |
| 2598 | 1:21 → psalms 68:4 | PARTIAL | whole-not-verbatim |  |  | matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13 |
| 2599 | 1:21 → joshua 1:1 | BARE | none | no quotation |  | matthew-1-he-shall-save-his-people-from-their-sins-psalm-130-isaiah-53-acts-4 |
| 2600 | 1:21 → philippians 2:9 | PARTIAL | whole-not-verbatim |  |  | matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13 |
| 3235 | 1:6 → 1-samuel 16:1 | BARE | none | label-like |  | matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4 |
| 3236 | 1:6 → 2-samuel 11:1 | BARE | none | chain:David-Bathsheba-Uriah/naming-by-Uriah; label-like |  | matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4 |
| 3237 | 1:11 → 2-kings 23:34 | BARE | none | no quotation |  | matthew-1-the-generation-of-yahusha |
| 3238 | 1:11 → jeremiah 22:24 | DOCREF | none | DOCREF:framework (other use); chain:Jeconiah-blood-curse; bare-name:Yahuah; italics not from target |  | matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31 |
| 3239 | 1:18 → luke 1:26 | BARE | none | label-like |  | matthew-1-conceived-of-the-ruach-hakodesh-genesis-1-isaiah-11-luke-1 |
| 3240 | 1:19 → deuteronomy 22:23 | BARE | none | no quotation |  | matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1 |
| 3241 | 1:19 → deuteronomy 24:1 | DOCREF | none | DOCREF:framework (other use); label-like |  | matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1 |
| 3242 | 1:20 → genesis 28:12 | BARE | none | chain:angel-in-a-dream; label-like |  | matthew-1-conceived-of-the-ruach-hakodesh-genesis-1-isaiah-11-luke-1 |
| 3243 | 1:20 → genesis 37:5 | BARE | none | no quotation |  | matthean-yoseph-and-the-patriarch-yoseph |
| 3244 | 1:20 → daniel 2:19 | PARTIAL | phrase |  |  | matthew-1-conceived-of-the-ruach-and-yosephs-dream |
| 3245 | 1:20 → 2-samuel 7:12 | BARE | none | italics not from target |  | matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1 |
| 3246 | 1:24 → luke 2:7 | PARTIAL | phrase |  |  | matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1 |
| 3247 | 1:24 → exodus 13:2 | DOCREF | phrase | DOCREF:the framework |  | matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1 |
| 3248 | 1:24 → colossians 1:15 | PARTIAL | phrase |  |  | matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1 |
| 3249 | 1:24 → colossians 1:18 | PARTIAL | phrase |  |  | matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1 |

### Matthew 2 (29 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2601 | 2:1 → daniel 2:48 | BARE | none | no quotation |  | magi-astronomical-tradition |
| 2603 | 2:2 → daniel 9:24 | BARE | none | italics not from target |  | matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24 |
| 2604 | 2:9 → exodus 13:21 | BARE | none | chain:shekinah-leading-by-visible-sign; no quotation |  | matthew-2-wise-men-from-the-east-gold-frankincense-myrrh-nations-to-the-king-isaiah-60-psalm-72 |
| 2606 | 2:3 → obadiah 1:10 | BARE | none | italics not from target |  | matthew-2-the-wise-men-and-the-star |
| 2607 | 2:3 → numbers 20:14 | BARE | none | chain:Edom-against-Yashar'el; bare-name:Yashar'el; no quotation |  | matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24 |
| 2608 | 2:3 → malachi 1:2 | BARE | none | italics not from target |  | matthew-2-the-wise-men-and-the-star |
| 2609 | 2:3 → ezekiel 35:1 | BARE | none | label-like |  | matthew-2-the-wise-men-and-the-star |
| 2610 | 2:3 → psalms 137:7 | PARTIAL | near-not-verbatim |  |  | matthew-2-the-wise-men-and-the-star |
| 2611 | 2:16 → genesis 27:41 | PARTIAL | near-not-verbatim |  |  | matthew-2-herod-and-the-slain-infants |
| 2613 | 2:13 → exodus 1:8 | BARE | none | chain:slaughter-of-the-infants-to-prevent-the-deliverer; no quotation |  | matthew-2-flight-to-egypt-out-of-egypt-have-i-called-my-son-hosea-11-exodus-4 |
| 2614 | 2:13 → exodus 2:1 | BARE | none | no quotation |  | pharaoh-mosheh-herod-yahusha-infant-slaughter |
| 2615 | 2:14 → genesis 46:1 | BARE | none | no quotation |  | matthean-yoseph-and-the-patriarch-yoseph |
| 2616 | 2:14 → exodus 12:40 | BARE | none | chain:Matthew-Egypt-sojourn/four-hundred-year; no quotation |  | matthew-2-flight-to-egypt-out-of-egypt-have-i-called-my-son-hosea-11-exodus-4 |
| 2617 | 2:19 → exodus 4:19 | PARTIAL | near-not-verbatim |  |  | matthew-2-the-return-and-the-nazarene |
| 2620 | 2:18 → jeremiah 31:31 | BARE | none | no quotation |  | matthew-2-rachel-weeping-for-her-children-lament-that-opens-onto-restoration-jeremiah-31 |
| 2621 | 2:18 → genesis 35:16 | BARE | none | jargon:motif; chain:Rachel-weeps-for-children; no quotation |  | rachel-buried-at-bethlehem |
| 2622 | 2:18 → jeremiah 31:9 | PARTIAL | phrase |  |  | matthew-2-rachel-weeping-for-her-children-lament-that-opens-onto-restoration-jeremiah-31 |
| 2623 | 2:18 → matthew 26:28 | FULL | whole | no citation |  | matthew-2-rachel-weeping-for-her-children-lament-that-opens-onto-restoration-jeremiah-31 |
| 2625 | 2:23 → jeremiah 23:5 | PARTIAL | phrase |  |  | plant-of-righteousness-and-the-branch |
| 2626 | 2:23 → jeremiah 33:15 | PARTIAL | phrase |  |  | matthew-2-he-shall-be-called-a-nazarene-the-netzer-branch-isaiah-11-judges-13-isaiah-53 |
| 2627 | 2:23 → zechariah 3:8 | PARTIAL | phrase |  |  | matthew-2-he-shall-be-called-a-nazarene-the-netzer-branch-isaiah-11-judges-13-isaiah-53 |
| 2628 | 2:23 → zechariah 6:12 | PARTIAL | phrase | chain:coming-out-of-Natsareth/grow-up-out-of-his-place |  | matthew-2-he-shall-be-called-a-nazarene-the-netzer-branch-isaiah-11-judges-13-isaiah-53 |
| 3250 | 2:5 → micah 5:2 | PARTIAL | phrase |  |  | matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24 |
| 3251 | 2:5 → 1-samuel 16:1 | BARE | none | label-like |  | matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24 |
| 3252 | 2:5 → 1-samuel 16:4 | BARE | none | label-like |  | matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24 |
| 3253 | 2:5 → ruth 4:11 | PARTIAL | near-not-verbatim |  |  | matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24 |
| 3255 | 2:11 → exodus 30:34 | BARE | none | no quotation |  | matthew-2-wise-men-from-the-east-gold-frankincense-myrrh-nations-to-the-king-isaiah-60-psalm-72 |
| 3256 | 2:11 → psalms 45:8 | PARTIAL | near-not-verbatim |  |  | matthew-2-wise-men-from-the-east-gold-frankincense-myrrh-nations-to-the-king-isaiah-60-psalm-72 |
| 3258 | 2:22 → isaiah 9:1 | PARTIAL | near-not-verbatim | chain:Galilee-of-the-Gentiles |  | fulfill-as-prophecy-bringing-to-pass |

### Matthew 3 (17 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2630 | 3:1 → malachi 4:5 | BARE | none | no quotation |  | matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4 |
| 2631 | 3:1 → 1-kings 18:1 | BARE | none | no quotation |  | matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4 |
| 2633 | 3:7 → ezekiel 18:30 | PARTIAL | phrase | chain:justification-by-faith-alone |  | matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11 |
| 2634 | 3:1 → isaiah 40:3 | BARE | none | chain:gathering-and-return; label-like |  | matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4 |
| 2635 | 3:7 → matthew 23:33 | BARE | none | italics not from target | 3974(ma-rev) | matthew-3-the-axe-the-fan-and-the-fire |
| 2636 | 3:7 → john 8:44 | PARTIAL | near-not-verbatim |  |  | matthew-3-the-axe-the-fan-and-the-fire |
| 2637 | 3:7 → genesis 3:15 | BARE | none | chain:serpent-seed-vs-woman-seed; italics not from target |  | matthew-3-the-axe-the-fan-and-the-fire |
| 2638 | 3:7 → acts 15:1 | PARTIAL | near-not-verbatim |  |  | matthew-3-the-axe-the-fan-and-the-fire |
| 2639 | 3:7 → galatians 2:4 | PARTIAL | near-not-verbatim |  |  | matthew-3-the-axe-the-fan-and-the-fire |
| 2640 | 3:7 → philippians 3:2 | FULL | whole | no citation |  | matthew-3-the-axe-the-fan-and-the-fire |
| 2641 | 3:7 → john 3:1 | DOCREF | none | DOCREF:the framework; chain:victim-not-enemy; no quotation |  | matthew-3-the-axe-the-fan-and-the-fire |
| 2642 | 3:13 → joshua 3:14 | BARE | none | label-like |  | matthew-3-the-baptism-of-yahusha |
| 2643 | 3:13 → joshua 1:1 | BARE | none | label-like |  | matthew-3-the-baptism-of-yahusha |
| 2644 | 3:13 → 2-kings 2:6 | DOCREF | none | DOCREF:the framework; chain:prophetic-mantle-transfer; no quotation |  | praise-of-elijah-and-the-yochanan-pattern |
| 2645 | 3:13 → 2-kings 5:14 | BARE | none | no quotation |  | matthew-3-the-baptism-of-yahusha |
| 3262 | 3:11 → malachi 3:1 | BARE | none | italics not from target |  | matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3 |
| 3264 | 3:15 → isaiah 53:11 | PARTIAL | phrase |  |  | fulfill-as-prophecy-bringing-to-pass |

### Matthew 4 (20 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2646 | 4:5 → psalms 91:11 | PARTIAL | near-not-verbatim |  |  | matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91 |
| 2647 | 4:5 → deuteronomy 6:16 | BARE | none | label-like |  | matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91 |
| 2648 | 4:5 → 1-john 2:3 | BARE | none | italics not from target |  | matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91 |
| 2649 | 4:5 → matthew 22:29 | PARTIAL | near-not-verbatim |  |  | matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91 |
| 2650 | 4:5 → 2-peter 3:16 | PARTIAL | phrase |  |  | matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91 |
| 2651 | 4:8 → daniel 10:13 | BARE | none | no quotation |  | matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34 |
| 2652 | 4:8 → daniel 10:20 | BARE | none | no quotation |  | matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34 |
| 2653 | 4:8 → ephesians 6:12 | PARTIAL | phrase |  |  | matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34 |
| 2654 | 4:8 → 1-john 5:19 | PARTIAL | near-not-verbatim |  |  | matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34 |
| 2655 | 4:8 → daniel 7:13 | PARTIAL | phrase |  |  | matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34 |
| 2656 | 4:8 → revelation 11:15 | PARTIAL | phrase |  |  | matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34 |
| 2657 | 4:8 → genesis 3:15 | BARE | none | chain:seed-of-the-woman; no quotation |  | matthew-4-him-only-shalt-thou-serve-all-the-kingdoms-deuteronomy-6-exodus-34 |
| 3266 | 4:6 → psalms 91:14 | PARTIAL | near-not-verbatim |  |  | matthew-4-thou-shalt-not-tempt-the-lord-pinnacle-deuteronomy-6-psalm-91 |
| 3267 | 4:11 → hebrews 1:14 | FULL | whole | no citation |  | matthew-4-the-temptation-in-the-wilderness |
| 3268 | 4:11 → 1-kings 19:5 | BARE | none | no quotation |  | matthew-4-the-temptation-in-the-wilderness |
| 3269 | 4:17 → matthew 3:2 | BARE | none | no quotation |  | matthew-4-fishers-of-men-repent-they-left-their-nets-jeremiah-16-ezekiel-18 |
| 3270 | 4:17 → daniel 2:44 | PARTIAL | phrase |  |  | matthew-4-fishers-of-men-repent-they-left-their-nets-jeremiah-16-ezekiel-18 |
| 3271 | 4:17 → daniel 7:13 | BARE | none | chain:Son-of-Adam-kingdom-transfer/kingdom-at-hand; label-like |  | matthew-4-fishers-of-men-repent-they-left-their-nets-jeremiah-16-ezekiel-18 |
| 3272 | 4:23 → isaiah 35:4 | BARE | none | italics not from target |  | matthew-4-healing-all-manner-of-sickness-the-sun-of-righteousness-isaiah-53-malachi-4 |
| 3273 | 4:23 → isaiah 61:1 | PARTIAL | near-not-verbatim |  |  | matthew-4-healing-all-manner-of-sickness-the-sun-of-righteousness-isaiah-53-malachi-4 |

### Matthew 5 (22 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2668 | 5:21 → leviticus 19:17 | BARE | none | jargon:substance; italics not from target |  | matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4 |
| 2669 | 5:27 → exodus 20:17 | BARE | none | jargon:substance; italics not from target |  | matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2 |
| 2670 | 5:31 → genesis 2:24 | DOCREF | whole | DOCREF:the framework; no citation |  | matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2 |
| 2671 | 5:31 → matthew 19:8 | PARTIAL | whole-not-verbatim | chain:Torah-mandate-of-permission/concession-to-hardness |  | matthew-5-adultery-and-divorce |
| 2673 | 5:33 → matthew 23:16 | PARTIAL | phrase | jargon:apparatus | 3951(ma-rev) | matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5 |
| 2674 | 5:38 → romans 13:3 | PARTIAL | phrase |  |  | matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50 |
| 2676 | 5:43 → leviticus 19:34 | PARTIAL | near-not-verbatim |  |  | matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12 |
| 2677 | 5:43 → exodus 23:4 | PARTIAL | near-not-verbatim |  |  | matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12 |
| 2678 | 5:43 → proverbs 25:21 | PARTIAL | whole-not-verbatim | jargon:wisdom-stream; chain:love-of-enemy |  | matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12 |
| 2679 | 5:48 → genesis 17:1 | PARTIAL | near-not-verbatim |  |  | matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12 |
| 3274 | 5:3 → isaiah 57:15 | PARTIAL | phrase |  |  | matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37 |
| 3276 | 5:4 → ezekiel 9:4 | DOCREF | phrase | DOCREF:the framework |  | matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37 |
| 3278 | 5:6 → psalms 42:1 | PARTIAL | whole-not-verbatim | chain:Tanakh-hunger-and-thirst |  | matthew-5-the-beatitudes |
| 3279 | 5:6 → jeremiah 23:5 | BARE | none | italics not from target |  | matthew-5-the-beatitudes |
| 3280 | 5:8 → psalms 24:3 | BARE | none | italics not from target |  | matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37 |
| 3281 | 5:8 → jeremiah 31:33 | PARTIAL | phrase |  |  | matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37 |
| 3282 | 5:8 → ezekiel 36:26 | PARTIAL | phrase |  |  | matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37 |
| 3283 | 5:17 → isaiah 42:21 | PARTIAL | whole-not-verbatim |  |  | matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4 |
| 3284 | 5:17 → luke 16:17 | DOCREF | phrase | DOCREF:the framework | 7065(lu-rev,live) | matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4 |
| 3285 | 5:19 → james 2:10 | PARTIAL | phrase |  |  | heart-torah-not-abolition |
| 3286 | 5:48 → 1-peter 1:15 | BARE | none | italics not from target |  | matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12 |
| 119975 | 5:32 → malachi 2:16 | BARE | none | italics not from target |  | matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2 |

### Matthew 6 (49 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2541 | 6:9 → ezekiel 36:22 | PARTIAL | near-not-verbatim | chain:grace-from-name's-sake |  | matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36 |
| 2542 | 6:12 → leviticus 16:30 | PARTIAL | whole-not-verbatim | jargon:architecture |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 2543 | 6:14 → matthew 18:32 | DOCREF | none | DOCREF:the framework; no quotation |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 2681 | 6:14 → hosea 7:13 | PARTIAL | phrase | chain:grace-and-the-opportunity-that-can-be-lost |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 2682 | 6:14 → ezekiel 18:24 | PARTIAL | near-not-verbatim |  |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 2683 | 6:14 → ezekiel 33:12 | PARTIAL | phrase |  |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 2684 | 6:14 → exodus 32:33 | PARTIAL | near-not-verbatim |  |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 2685 | 6:14 → psalms 69:28 | PARTIAL | phrase | jargon:architecture |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 2686 | 6:14 → hebrews 10:26 | PARTIAL | whole-not-verbatim |  |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 2687 | 6:14 → matthew 7:21 | BARE | none | italics not from target |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 2688 | 6:14 → 1-john 1:9 | PARTIAL | phrase | chain:confession-and-walking-in-light |  | matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11 |
| 3287 | 6:1 → deuteronomy 15:7 | BARE | none | no quotation |  | matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4 |
| 3288 | 6:1 → leviticus 19:9 | BARE | none | label-like |  | matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4 |
| 3289 | 6:1 → deuteronomy 24:19 | BARE | none | jargon:substance; label-like |  | matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4 |
| 3290 | 6:1 → psalms 41:1 | PARTIAL | phrase | jargon:substance/wisdom-stream |  | matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4 |
| 3292 | 6:1 → matthew 5:16 | DOCREF | phrase | DOCREF:the framework |  | matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4 |
| 3293 | 6:5 → 1-kings 8:22 | BARE | none | no quotation |  | matthew-6-prayer-in-secret |
| 3294 | 6:5 → acts 1:14 | BARE | none | no quotation |  | matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5 |
| 3295 | 6:5 → acts 2:42 | PARTIAL | phrase |  |  | matthew-6-prayer-in-secret |
| 3296 | 6:5 → acts 4:24 | BARE | none | label-like |  | matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5 |
| 3297 | 6:5 → john 11:41 | BARE | none | italics not from target |  | matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5 |
| 3298 | 6:5 → psalms 139:1 | BARE | none | jargon:substance; chain:Father-knows-before-the-asking; italics not from target |  | matthew-6-prayer-in-secret |
| 3301 | 6:9 → deuteronomy 32:6 | BARE | none | chain:Tanakh-Father-address; italics not from target |  | matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36 |
| 3302 | 6:11 → exodus 16:4 | PARTIAL | phrase | jargon:substance |  | matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36 |
| 3303 | 6:11 → proverbs 30:8 | PARTIAL | phrase | jargon:wisdom-stream |  | matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36 |
| 3304 | 6:11 → matthew 4:4 | PARTIAL | near-not-verbatim |  |  | matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36 |
| 3305 | 6:13 → matthew 4:1 | BARE | none | no quotation |  | matthew-6-the-prayer-and-forgiveness |
| 3306 | 6:13 → 1-corinthians 10:13 | PARTIAL | near-not-verbatim | jargon:substance |  | matthew-6-the-prayer-and-forgiveness |
| 3307 | 6:13 → james 1:13 | PARTIAL | phrase |  |  | matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36 |
| 3308 | 6:16 → leviticus 23:27 | PARTIAL | near-not-verbatim |  |  | matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2 |
| 3309 | 6:16 → joel 1:14 | PARTIAL | near-not-verbatim | jargon:substance |  | matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2 |
| 3311 | 6:16 → matthew 4:2 | DOCREF | none | DOCREF:framework (other use); jargon:pre-figur; label-like |  | matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2 |
| 3312 | 6:20 → proverbs 11:4 | PARTIAL | whole-not-verbatim | jargon:wisdom-stream; chain:futility-of-earth-treasure |  | matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29 |
| 3313 | 6:20 → proverbs 23:4 | BARE | none | jargon:wisdom-stream; italics not from target |  | matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29 |
| 3314 | 6:20 → psalms 49:16 | BARE | none | chain:futility-of-riches; italics not from target |  | matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29 |
| 3315 | 6:20 → luke 12:33 | PARTIAL | near-not-verbatim |  |  | matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29 |
| 3316 | 6:22 → proverbs 22:9 | PARTIAL | whole-not-verbatim |  |  | the-single-eye-of-issachar-and-the-evil-eye-of-sirach |
| 3317 | 6:22 → proverbs 23:6 | PARTIAL | near-not-verbatim |  |  | the-single-eye-of-issachar-and-the-evil-eye-of-sirach |
| 3318 | 6:22 → deuteronomy 15:9 | PARTIAL | near-not-verbatim | chain:stinginess-toward-the-poor |  | the-single-eye-of-issachar-and-the-evil-eye-of-sirach |
| 3319 | 6:22 → proverbs 28:22 | PARTIAL | near-not-verbatim | jargon:wisdom-stream |  | the-single-eye-of-issachar-and-the-evil-eye-of-sirach |
| 3320 | 6:24 → exodus 20:3 | PARTIAL | near-not-verbatim |  |  | matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29 |
| 3321 | 6:24 → deuteronomy 6:4 | FULL | whole | no citation |  | matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29 |
| 3322 | 6:24 → 1-kings 18:21 | PARTIAL | near-not-verbatim |  |  | matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29 |
| 3323 | 6:26 → psalms 147:9 | PARTIAL | whole-not-verbatim |  |  | matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12 |
| 3324 | 6:26 → job 38:4 | BARE | none | no quotation |  | matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12 |
| 3325 | 6:26 → psalms 104:10 | BARE | none | italics not from target |  | matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12 |
| 3326 | 6:33 → 1-kings 3:11 | BARE | none | italics not from target |  | matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12 |
| 3327 | 6:33 → psalms 37:4 | PARTIAL | whole-not-verbatim |  |  | matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12 |
| 3328 | 6:33 → matthew 5:6 | FULL | whole | no citation |  | matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12 |

### Matthew 7 (14 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3330 | 7:1 → john 7:24 | PARTIAL | whole | chain:kind-of-judgment-correction; no citation |  | matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24 |
| 3332 | 7:6 → matthew 10:14 | PARTIAL | whole-not-verbatim | chain:discrimination-of-audience | 2741(ma-rev) | matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23 |
| 3333 | 7:11 → luke 11:13 | PARTIAL | near-not-verbatim |  |  | matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6 |
| 3334 | 7:11 → jeremiah 31:33 | PARTIAL | phrase |  |  | matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6 |
| 3335 | 7:11 → ezekiel 36:26 | PARTIAL | phrase |  |  | matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6 |
| 3336 | 7:13 → isaiah 10:20 | BARE | none | chain:remnant-of-Yashar'el; label-like |  | matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1 |
| 3337 | 7:13 → zechariah 13:8 | PARTIAL | phrase |  |  | matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1 |
| 3338 | 7:13 → zephaniah 3:12 | BARE | none | italics not from target |  | matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1 |
| 3339 | 7:13 → luke 13:23 | BARE | none | italics not from target |  | matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1 |
| 3341 | 7:15 → acts 20:29 | BARE | none | chain:false-prophets-among-the-gathering; italics not from target |  | matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5 |
| 3342 | 7:24 → exodus 24:7 | PARTIAL | near-not-verbatim | chain:do-and-hear |  | matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13 |
| 3343 | 7:24 → deuteronomy 32:4 | PARTIAL | phrase |  |  | matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13 |
| 3344 | 7:24 → psalms 18:2 | PARTIAL | near-not-verbatim | jargon:substance |  | matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13 |
| 3345 | 7:24 → james 1:22 | PARTIAL | near-not-verbatim | chain:hearer-AND-doer |  | wise-and-foolish-builders-and-the-heart-stablished-in-sirach |

### Matthew 8 (27 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2705 | 8:4 → luke 17:14 | BARE | none | label-like |  | matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5 |
| 2706 | 8:4 → matthew 5:17 | BARE | none | chain:Sermon-on-the-Mount; label-like |  | matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5 |
| 2707 | 8:4 → matthew 12:9 | BARE | none | jargon:substance; chain:heart-Torah-walking-in-practice; no quotation |  | matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5 |
| 2708 | 8:4 → mark 7:10 | BARE | none | italics not from target |  | matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5 |
| 2709 | 8:4 → acts 6:7 | PARTIAL | phrase |  |  | matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5 |
| 3346 | 8:1 → leviticus 13:45 | BARE | none | jargon:architecture; label-like |  | matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5 |
| 3347 | 8:1 → luke 17:11 | BARE | none | italics not from target |  | matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5 |
| 3348 | 8:5 → luke 7:1 | BARE | none | no quotation | 7007(lu-rev) | matthew-8-the-centurions-servant |
| 3349 | 8:11 → jeremiah 31:8 | BARE | none | no quotation |  | scattered-seed-gathering |
| 3351 | 8:17 → isaiah 35:5 | BARE | none | no quotation |  | matthew-8-himself-took-our-infirmities-isaiah-53-4-psalm-103 |
| 3352 | 8:17 → matthew 11:4 | BARE | none | no quotation |  | matthew-8-himself-took-our-infirmities-isaiah-53-4-psalm-103 |
| 3353 | 8:20 → psalms 8:4 | PARTIAL | near-not-verbatim | jargon:substance; chain:son-of-Adam |  | matthew-8-the-son-of-man-nowhere-to-lay-his-head-daniel-7-enoch-46 |
| 3354 | 8:20 → luke 3:38 | PARTIAL | phrase | chain:seed-of-Adam-line-of-promise |  | matthew-8-the-son-of-man-nowhere-to-lay-his-head-daniel-7-enoch-46 |
| 3355 | 8:22 → exodus 20:12 | DOCREF | none | DOCREF:the framework; jargon:substance; no quotation |  | matthew-8-the-cost-of-following |
| 3356 | 8:22 → genesis 50:5 | PARTIAL | near-not-verbatim |  |  | matthew-8-the-cost-of-following |
| 3357 | 8:22 → mark 7:10 | BARE | none | italics not from target |  | matthew-8-the-cost-of-following |
| 3358 | 8:26 → psalms 89:8 | BARE | none | chain:Tanakh-creation-authority; italics not from target |  | matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38 |
| 3359 | 8:26 → psalms 107:23 | BARE | none | chain:sailors-in-the-storm; italics not from target |  | matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38 |
| 3360 | 8:26 → job 38:8 | BARE | none | italics not from target |  | matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38 |
| 3361 | 8:26 → jonah 1:5 | PARTIAL | near-not-verbatim |  |  | matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38 |
| 3362 | 8:26 → matthew 12:41 | PARTIAL | near-not-verbatim |  |  | matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38 |
| 3363 | 8:29 → 1-john 3:8 | BARE | none | italics not from target |  | matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15 |
| 3364 | 8:29 → 2-peter 2:4 | PARTIAL | phrase | jargon:architecture; chain:bound-angels-reserved-for-judgment |  | matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15 |
| 3365 | 8:29 → jude 1:6 | PARTIAL | phrase | jargon:architecture |  | matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15 |
| 3366 | 8:30 → leviticus 11:7 | BARE | none | jargon:marker; no quotation |  | matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15 |
| 3367 | 8:30 → deuteronomy 14:8 | BARE | none | label-like |  | matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15 |
| 177461 | 8:11 → romans 11:25 | BARE | none | quotes source verse only |  | matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1 |

### Matthew 9 (38 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2711 | 9:13 → matthew 12:7 | BARE | none | label-like |  | matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick |
| 2713 | 9:13 → psalms 40:6 | BARE | none | italics not from target |  | matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick |
| 2714 | 9:13 → psalms 51:16 | PARTIAL | near-not-verbatim |  |  | matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick |
| 2715 | 9:13 → isaiah 1:11 | PARTIAL | phrase |  |  | matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick |
| 2716 | 9:13 → jeremiah 7:21 | BARE | none | italics not from target |  | matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick |
| 2717 | 9:13 → amos 5:21 | PARTIAL | phrase |  |  | matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick |
| 2718 | 9:13 → micah 6:6 | BARE | none | italics not from target |  | matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick |
| 2720 | 9:15 → hosea 2:19 | BARE | none | label-like |  | matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant |
| 2721 | 9:15 → isaiah 54:5 | PARTIAL | near-not-verbatim |  |  | matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant |
| 2722 | 9:15 → jeremiah 3:14 | PARTIAL | phrase | jargon:substance |  | matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant |
| 2723 | 9:15 → john 3:29 | BARE | none | chain:bridegroom-and-friend-of-the-bridegroom; label-like |  | matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant |
| 2724 | 9:15 → ephesians 5:25 | BARE | none | jargon:architecture; chain:King-and-the-assembly; label-like |  | matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant |
| 2725 | 9:15 → revelation 19:7 | BARE | none | chain:eschatological-wedding-of-the-Lamb; label-like |  | matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant |
| 2726 | 9:15 → revelation 21:2 | PARTIAL | near-not-verbatim |  |  | matthew-9-new-wine-into-new-bottles-the-bridegroom-jeremiah-31-renewed-covenant |
| 2728 | 9:27 → isaiah 11:1 | PARTIAL | phrase |  |  | matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7 |
| 2729 | 9:27 → jeremiah 23:5 | PARTIAL | phrase |  |  | matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7 |
| 2730 | 9:27 → ezekiel 34:23 | PARTIAL | phrase |  |  | matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7 |
| 2731 | 9:27 → ezekiel 37:24 | PARTIAL | phrase |  |  | matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7 |
| 2732 | 9:27 → matthew 15:22 | PARTIAL | near-not-verbatim |  |  | matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7 |
| 2733 | 9:27 → matthew 20:30 | BARE | none | quotes source verse only | 3761(ma-rev) | matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7 |
| 2734 | 9:27 → matthew 21:9 | PARTIAL | phrase |  |  | matthew-9-two-blind-men-thou-son-of-david-isaiah-35-psalm-146-2-samuel-7 |
| 3370 | 9:6 → daniel 7:13 | PARTIAL | phrase |  |  | matthew-9-thy-sins-be-forgiven-son-of-adam-power-to-forgive-isaiah-43-exodus-34 |
| 3371 | 9:6 → matthew 28:18 | PARTIAL | phrase |  |  | the-named-son-of-adam-in-enoch-similitudes |
| 3372 | 9:13 → luke 19:10 | PARTIAL | phrase |  |  | matthew-9-i-will-have-mercy-and-not-sacrifice-hosea-6-the-physician-to-the-sick |
| 3374 | 9:17 → ezekiel 36:26 | BARE | none | chain:heart-Torah-walking; label-like |  | new-wine-and-the-old-friend-inverse-in-sirach |
| 3375 | 9:17 → matthew 5:17 | BARE | none | no quotation |  | new-wine-and-the-old-friend-inverse-in-sirach |
| 3376 | 9:22 → leviticus 15:25 | BARE | none | label-like |  | matthew-9-the-hem-of-his-garment-the-fringe-healing-in-his-wings-numbers-15-malachi-4 |
| 3377 | 9:22 → matthew 8:2 | BARE | none | label-like |  | physician-prayer-architecture-in-sirach-bypassed |
| 3378 | 9:24 → daniel 12:2 | PARTIAL | phrase |  |  | matthew-9-jairus-daughter-and-the-hem-of-the-garment |
| 3379 | 9:24 → isaiah 26:19 | PARTIAL | near-not-verbatim | chain:present-age-foretaste |  | matthew-9-jairus-daughter-and-the-hem-of-the-garment |
| 3380 | 9:24 → john 11:11 | PARTIAL | near-not-verbatim | chain:death-as-sleep |  | matthew-9-jairus-daughter-and-the-hem-of-the-garment |
| 3381 | 9:24 → 1-thessalonians 4:13 | BARE | none | chain:sleep-and-awakening; label-like |  | matthew-9-jairus-daughter-and-the-hem-of-the-garment |
| 3382 | 9:34 → matthew 12:22 | BARE | none | label-like |  | matthew-9-the-harvest-and-the-shepherdless-sheep |
| 3383 | 9:34 → matthew 12:31 | BARE | none | chain:blasphemy-against-the-Ruach; label-like | 2777(ma-rev) | matthew-9-the-harvest-and-the-shepherdless-sheep |
| 3384 | 9:34 → 2-kings 1:2 | BARE | none | italics not from target |  | matthew-9-the-harvest-and-the-shepherdless-sheep |
| 3385 | 9:36 → zechariah 10:2 | PARTIAL | phrase |  |  | matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5 |
| 3386 | 9:37 → john 4:35 | PARTIAL | phrase |  |  | harvest-of-the-age-in-2-baruch |
| 3387 | 9:37 → matthew 10:1 | BARE | none | chain:immediate-next-verse; no quotation |  | matthew-9-sheep-having-no-shepherd-the-harvest-plenteous-numbers-27-ezekiel-34-baruch-5 |

### Matthew 10 (54 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2735 | 10:1 → matthew 19:28 | PARTIAL | near-not-verbatim |  |  | matthew-10-the-twelve-named |
| 2736 | 10:1 → luke 22:30 | BARE | none | label-like |  | matthew-10-the-twelve-named |
| 2737 | 10:1 → revelation 21:14 | PARTIAL | phrase | jargon:architecture |  | matthew-10-the-twelve-named |
| 2738 | 10:1 → revelation 21:12 | PARTIAL | phrase | jargon:architecture; chain:twelve-tribe-side |  | matthew-10-the-twelve-named |
| 2739 | 10:1 → revelation 7:4 | BARE | none | jargon:architecture; no quotation |  | matthew-10-the-twelve-named |
| 2740 | 10:1 → ezekiel 47:1 | BARE | none | chain:millennial-twelve-tribe; label-like |  | matthew-10-the-twelve-named |
| 2741 | 10:14 → matthew 7:6 | PARTIAL | near-not-verbatim | jargon:substance; chain:broader-pearl-level/not-wasting-substance-on-unworthy-receivers | 3332(ma-rev) | matthew-10-the-lost-sheep-mission |
| 2742 | 10:14 → matthew 8:34 | BARE | none | no quotation |  | matthew-10-the-lost-sheep-mission |
| 2743 | 10:14 → acts 13:51 | BARE | none | label-like |  | matthew-10-the-lost-sheep-mission |
| 2744 | 10:14 → acts 18:6 | PARTIAL | phrase | chain:shake-the-dust-off |  | matthew-10-the-lost-sheep-mission |
| 2745 | 10:15 → genesis 19:24 | BARE | none | chain:Sodom-and-Gomorrah; label-like |  | matthew-10-the-lost-sheep-mission |
| 3388 | 10:2 → mark 3:13 | BARE | none | label-like |  | matthew-10-the-twelve-named |
| 3389 | 10:2 → luke 6:12 | BARE | none | label-like |  | matthew-10-the-twelve-named |
| 3390 | 10:2 → acts 1:13 | BARE | none | label-like |  | matthew-10-the-twelve-named |
| 3391 | 10:5 → matthew 15:24 | BARE | none | label-like | 2869(ma-rev) | matthew-10-the-lost-sheep-of-the-house-of-israel-ezekiel-34-jeremiah-50 |
| 3392 | 10:5 → romans 1:16 | DOCREF | phrase | DOCREF:framework (other use); chain:scattered-seed-in-the-nations-territories |  | matthew-10-the-lost-sheep-of-the-house-of-israel-ezekiel-34-jeremiah-50 |
| 3393 | 10:5 → romans 15:8 | DOCREF | whole-not-verbatim | DOCREF:framework (other use) |  | matthew-10-the-lost-sheep-mission |
| 3394 | 10:8 → isaiah 35:5 | BARE | none | label-like |  | matthew-10-the-lost-sheep-mission |
| 3395 | 10:8 → matthew 11:5 | BARE | none | no quotation |  | matthew-10-the-lost-sheep-mission |
| 3396 | 10:8 → acts 8:18 | BARE | none | no quotation |  | matthew-10-the-lost-sheep-mission |
| 3397 | 10:14 → mark 6:11 | BARE | none | chain:shake-the-dust-off; label-like | 5069(ma-rev) | matthew-10-the-lost-sheep-mission |
| 3398 | 10:14 → luke 9:5 | BARE | none | label-like | 7022(lu-rev) | matthew-10-the-lost-sheep-mission |
| 3399 | 10:15 → matthew 11:23 | BARE | none | chain:eschatological-graduated-accountability; label-like |  | matthew-10-the-lost-sheep-mission |
| 3401 | 10:16 → genesis 8:11 | BARE | none | chain:new-creation-after-the-flood; label-like |  | matthew-10-sheep-among-wolves-spirit-of-your-father-speaketh-genesis-3-exodus-4 |
| 3402 | 10:16 → matthew 3:16 | BARE | none | jargon:substance; no quotation |  | matthew-10-sheep-among-wolves-spirit-of-your-father-speaketh-genesis-3-exodus-4 |
| 3403 | 10:22 → matthew 24:13 | BARE | none | label-like |  | matthew-10-sheep-among-wolves |
| 3404 | 10:22 → mark 13:13 | BARE | none | label-like |  | matthew-10-sheep-among-wolves |
| 3405 | 10:22 → hebrews 3:14 | PARTIAL | whole-not-verbatim |  |  | matthew-10-sheep-among-wolves |
| 3406 | 10:22 → hebrews 10:36 | DOCREF | none | DOCREF:framework (other use); chain:draw-back-warning/patience-and-perseverance; label-like |  | matthew-10-sheep-among-wolves |
| 3407 | 10:23 → daniel 7:13 | PARTIAL | phrase |  |  | scattered-seed-gathering |
| 3408 | 10:23 → matthew 24:30 | BARE | none | chain:future-coming-in-glory; label-like |  | matthew-10-sheep-among-wolves |
| 3409 | 10:23 → matthew 16:27 | PARTIAL | phrase | chain:future-coming-in-glory |  | matthew-10-sheep-among-wolves |
| 3410 | 10:28 → isaiah 66:24 | PARTIAL | phrase | chain:eschatological-judgment-aftermath |  | matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56 |
| 3411 | 10:28 → jeremiah 7:31 | BARE | none | chain:Valley-of-Hinnom's-prophetic-naming; label-like |  | matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56 |
| 3412 | 10:28 → 2-kings 23:10 | BARE | none | no quotation |  | matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56 |
| 3413 | 10:28 → revelation 20:14 | BARE | none | chain:lake-of-fire; label-like |  | matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56 |
| 3414 | 10:28 → proverbs 9:10 | DOCREF | near-not-verbatim | DOCREF:the framework; jargon:substance |  | matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56 |
| 3415 | 10:32 → luke 12:8 | BARE | none | chain:confession-and-denial; label-like | 7043(lu-rev,live) | names-in-the-books-of-life-not-blotted-out-in-1-enoch-103 |
| 3416 | 10:32 → 2-timothy 2:12 | PARTIAL | phrase |  |  | names-in-the-books-of-life-not-blotted-out-in-1-enoch-103 |
| 3417 | 10:32 → matthew 7:21 | BARE | none | jargon:substance; chain:Torah-walking-substance/confession-as-credential-without-substance; no quotation |  | names-in-the-books-of-life-not-blotted-out-in-1-enoch-103 |
| 3418 | 10:34 → micah 7:6 | BARE | none | label-like |  | matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33 |
| 3419 | 10:34 → luke 12:51 | BARE | none | label-like |  | matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33 |
| 3420 | 10:34 → genesis 3:15 | BARE | none | jargon:substance; chain:enmity-between-the-two-seeds; label-like |  | matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33 |
| 3421 | 10:37 → exodus 20:12 | BARE | none | italics not from target |  | matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33 |
| 3422 | 10:38 → matthew 16:24 | BARE | none | chain:take-up-your-cross; label-like | 2909(ma-rev) | matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33 |
| 3423 | 10:38 → mark 8:34 | BARE | none | label-like | 5144(ma-rev) | matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33 |
| 3424 | 10:38 → luke 9:23 | BARE | none | label-like |  | matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33 |
| 3425 | 10:38 → luke 14:27 | BARE | none | chain:cost-of-discipleship; label-like | 6845(lu-rev,live) | matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33 |
| 3426 | 10:39 → matthew 6:19 | DOCREF | none | DOCREF:framework (other use); chain:treasures-in-heaven/watcher-rebellion-administration's; label-like |  | matthew-10-not-peace-but-a-sword |
| 3427 | 10:39 → psalms 49:1 | BARE | none | no quotation |  | matthew-10-not-peace-but-a-sword |
| 3428 | 10:40 → john 13:20 | PARTIAL | near-not-verbatim |  |  | matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17 |
| 3429 | 10:40 → matthew 25:40 | PARTIAL | near-not-verbatim |  |  | matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17 |
| 3430 | 10:42 → matthew 6:1 | BARE | none | jargon:substance; chain:Pharisaic-grandstanding-religiosity/cup-of-cold-water; label-like |  | matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17 |
| 3431 | 10:42 → matthew 25:34 | PARTIAL | whole-not-verbatim |  |  | matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17 |

### Matthew 11 (27 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2746 | 11:28 → jeremiah 6:16 | PARTIAL | near-not-verbatim |  |  | matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51 |
| 2747 | 11:28 → isaiah 28:12 | PARTIAL | near-not-verbatim |  |  | matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51 |
| 2748 | 11:28 → matthew 23:4 | BARE | none | label-like | 3928(ma-rev) | matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51 |
| 2749 | 11:28 → acts 15:10 | BARE | none | label-like |  | matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51 |
| 2750 | 11:28 → galatians 1:14 | PARTIAL | phrase | chain:Pharisaic-oral-tradition |  | matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51 |
| 2751 | 11:28 → jeremiah 31:33 | BARE | none | jargon:substance; chain:Torah-on-the-heart; label-like |  | matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51 |
| 2752 | 11:28 → ezekiel 36:26 | BARE | none | jargon:substance; chain:new-heart-and-new-spirit; label-like |  | matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51 |
| 2753 | 11:28 → 1-john 5:3 | PARTIAL | phrase |  |  | matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51 |
| 2754 | 11:28 → matthew 5:17 | BARE | none | chain:Father's-Torah-internalized; no quotation |  | matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51 |
| 2755 | 11:27 → matthew 28:18 | PARTIAL | phrase | jargon:substance |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 2756 | 11:27 → john 1:18 | PARTIAL | near-not-verbatim |  |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 2757 | 11:27 → john 5:19 | PARTIAL | near-not-verbatim | jargon:substance; chain:Son's-derived-substance |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 2758 | 11:27 → john 14:6 | BARE | none | jargon:substance; chain:Son-reveals-the-Father; italics not from target |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 2759 | 11:27 → john 10:30 | FULL | whole | no citation,no prose |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 2760 | 11:27 → john 17:1 | BARE | none | jargon:architecture; chain:high-priestly-prayer's; label-like |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 2761 | 11:27 → 1-corinthians 8:6 | DOCREF | phrase | DOCREF:framework (other use) |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 2762 | 11:27 → hebrews 1:1 | DOCREF | none | DOCREF:framework (other use); italics not from target |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 2763 | 11:27 → colossians 1:15 | PARTIAL | whole | jargon:substance; no citation |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 3436 | 11:5 → luke 4:17 | BARE | none | chain:day-of-vengeance; no quotation |  | matthew-11-art-thou-he-the-works-prove-messiah-isaiah-35-isaiah-61 |
| 3440 | 11:14 → matthew 17:10 | BARE | none | label-like |  | matthew-11-john-the-messenger-elijah-restore-the-tribes-malachi-3-malachi-4-sirach-48 |
| 3442 | 11:21 → ezekiel 28:1 | BARE | none | jargon:substance; label-like |  | mighty-men-mightily-tormented-in-wisdom-of-solomon-6 |
| 3443 | 11:21 → isaiah 23:1 | BARE | none | label-like |  | matthew-11-woe-unto-the-cities-greater-light-greater-judgment-isaiah-14-ezekiel-16 |
| 3445 | 11:23 → genesis 19:24 | BARE | none | chain:Sodom-and-Gomorrah; label-like |  | sodom-as-judgment-archetype-in-jubilees-16-and-wisdom-10 |
| 3447 | 11:25 → john 5:19 | BARE | none | jargon:substance; chain:Son's-derived-substance; label-like |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 3448 | 11:25 → john 10:14 | BARE | none | jargon:architecture; italics not from target |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 3449 | 11:25 → 1-corinthians 1:18 | BARE | none | chain:babes-over-wise; italics not from target |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |
| 3450 | 11:25 → exodus 33:20 | PARTIAL | near-not-verbatim | jargon:substance; chain:Formless-Father's-invisibility |  | matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2 |

### Matthew 12 (37 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2765 | 12:3 → 1-samuel 21:1 | BARE | none | label-like |  | matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6 |
| 2767 | 12:5 → leviticus 24:8 | BARE | none | label-like |  | matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6 |
| 2769 | 12:8 → genesis 2:3 | BARE | none | label-like |  | shabbat-as-covenant-sign-protected-day-and-life-saving-defense |
| 2770 | 12:8 → exodus 20:8 | BARE | none | jargon:substance; chain:Decalogue's-Shabbat-command; label-like |  | shabbat-as-covenant-sign-protected-day-and-life-saving-defense |
| 2772 | 12:9 → john 7:22 | BARE | none | chain:circumcision-on-Shabbat; label-like |  | shabbat-as-covenant-sign-protected-day-and-life-saving-defense |
| 2773 | 12:12 → isaiah 58:13 | PARTIAL | near-not-verbatim | jargon:substance; chain:Shabbat-as-delight |  | matthew-12-lawful-to-do-well-on-the-sabbath-the-withered-hand-deuteronomy-22-leviticus-19 |
| 2774 | 12:1 → hebrews 4:9 | PARTIAL | near-not-verbatim |  |  | matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6 |
| 2775 | 12:1 → acts 17:2 | BARE | none | chain:Paul's-Shabbat-keeping; label-like |  | matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6 |
| 2776 | 12:1 → daniel 7:25 | DOCREF | phrase | DOCREF:the framework; jargon:substance; chain:institutional-Christian-Sunday-Law/institutional-Christian-claim |  | matthew-12-lord-of-the-sabbath |
| 2777 | 12:31 → matthew 9:34 | BARE | none | label-like | 3383(ma-rev) | matthew-12-binding-the-strong-man-blasphemy-against-the-spirit-isaiah-49-1-enoch-15 |
| 2778 | 12:31 → matthew 10:25 | BARE | none | label-like |  | no-forgiveness-for-the-hardened-disposition-in-jubilees-and-1-enoch-and-wisdom |
| 2779 | 12:31 → mark 3:28 | BARE | none | label-like |  | no-forgiveness-for-the-hardened-disposition-in-jubilees-and-1-enoch-and-wisdom |
| 2780 | 12:31 → luke 12:10 | BARE | none | label-like | 7044(lu-rev) | no-forgiveness-for-the-hardened-disposition-in-jubilees-and-1-enoch-and-wisdom |
| 2781 | 12:31 → hebrews 6:4 | BARE | none | label-like |  | no-forgiveness-for-the-hardened-disposition-in-jubilees-and-1-enoch-and-wisdom |
| 2782 | 12:31 → hebrews 10:26 | BARE | none | italics not from target |  | no-forgiveness-for-the-hardened-disposition-in-jubilees-and-1-enoch-and-wisdom |
| 2783 | 12:31 → 1-john 5:16 | PARTIAL | phrase |  |  | no-forgiveness-for-the-hardened-disposition-in-jubilees-and-1-enoch-and-wisdom |
| 2784 | 12:31 → 1-timothy 1:13 | PARTIAL | phrase | chain:blasphemy-against-the-Ruach/word-against-the-Son-of-Adam |  | no-forgiveness-for-the-hardened-disposition-in-jubilees-and-1-enoch-and-wisdom |
| 2785 | 12:38 → jonah 1:17 | BARE | none | label-like |  | matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10 |
| 2786 | 12:40 → matthew 27:62 | BARE | none | label-like |  | matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10 |
| 2787 | 12:40 → matthew 28:1 | BARE | none | label-like |  | matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10 |
| 2790 | 12:41 → matthew 11:21 | BARE | none | chain:eschatological-graduated-accountability; label-like |  | matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10 |
| 2791 | 12:50 → matthew 7:21 | PARTIAL | phrase | jargon:substance; chain:kingdom-entry-criterion | 2690(ma-rev,live) | children-of-elohim-by-doing-the-fathers-will-in-wisdom-and-sirach-and-jubilees |
| 2792 | 12:50 → matthew 25:31 | BARE | none | chain:deeds-as-evidence/sheep-and-goats; label-like |  | matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22 |
| 2793 | 12:50 → john 15:14 | PARTIAL | near-not-verbatim |  |  | matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22 |
| 2794 | 12:50 → 1-john 2:3 | BARE | none | chain:contrary-to-Torah; label-like |  | matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22 |
| 2795 | 12:46 → john 19:26 | BARE | none | jargon:substance; chain:Torah's-family-substance; label-like |  | matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22 |
| 2796 | 12:46 → mark 7:9 | DOCREF | none | DOCREF:the framework; italics not from target |  | matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22 |
| 3452 | 12:8 → isaiah 56:1 | BARE | none | jargon:substance; chain:Shabbat-as-eschatological-substance; label-like |  | shabbat-as-covenant-sign-protected-day-and-life-saving-defense |
| 3453 | 12:18 → isaiah 11:2 | BARE | none | label-like |  | matthew-12-behold-my-servant-whom-i-have-chosen-isaiah-42-isaiah-49-isaiah-11 |
| 3454 | 12:18 → isaiah 61:1 | BARE | none | chain:Spirit-anointing-to-preach; label-like |  | spirit-anointed-elect-one-the-spirit-of-wisdom-on-the-son-in-1-enoch |
| 3455 | 12:28 → matthew 4:17 | BARE | none | chain:kingdom-at-hand; label-like |  | matthew-12-beelzebub-and-the-blasphemy |
| 3456 | 12:28 → luke 11:20 | PARTIAL | phrase |  |  | matthew-12-binding-the-strong-man-blasphemy-against-the-spirit-isaiah-49-1-enoch-15 |
| 3457 | 12:28 → daniel 2:44 | BARE | none | chain:kingdom-of-Elohim's-arrival; bare-name:Elohim; label-like |  | scattered-seed-gathering |
| 3458 | 12:30 → john 11:52 | PARTIAL | phrase | jargon:substance; chain:Tanakh-and-NT/gathering-of-the-scattered |  | matthew-12-beelzebub-and-the-blasphemy |
| 3459 | 12:30 → ezekiel 34:11 | BARE | none | chain:shepherd's-gathering-of-the-lost-sheep; label-like |  | scattered-seed-gathering |
| 3461 | 12:41 → 1-kings 10:1 | BARE | none | chain:coming-to-Shelomoh/queen-of-Sheva's; label-like |  | matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10 |
| 3462 | 12:41 → deuteronomy 18:15 | BARE | none | chain:prophet-like-unto-Mosheh; label-like |  | matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10 |

### Matthew 13 (65 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2797 | 13:25 → genesis 6:1 | BARE | none | chain:tares-sown-in-by-the-enemy; label-like |  | watchers-corruption-as-tares-sown-in-the-wheat-in-1-enoch-and-jubilees |
| 2798 | 13:25 → genesis 3:1 | BARE | none | no quotation |  | seed-of-good-and-evil-sown-in-the-heart-of-adam-in-2-esdras |
| 2799 | 13:38 → john 8:44 | PARTIAL | near-not-verbatim | jargon:substance; chain:children-of-the-wicked-one |  | seed-war-from-genesis-3-and-the-devil-as-source-of-death-in-wisdom-and-jubilees-and-1-enoch |
| 2800 | 13:38 → 1-john 3:8 | BARE | none | italics not from target |  | seed-war-from-genesis-3-and-the-devil-as-source-of-death-in-wisdom-and-jubilees-and-1-enoch |
| 2801 | 13:38 → 1-samuel 2:12 | BARE | none | chain:within-the-line; no quotation |  | watchers-corruption-as-tares-sown-in-the-wheat-in-1-enoch-and-jubilees |
| 2802 | 13:30 → ezekiel 20:33 | DOCREF | none | DOCREF:the framework; jargon:architecture; no quotation |  | matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4 |
| 2803 | 13:41 → ezekiel 20:33 | DOCREF | none | DOCREF:the framework; jargon:architecture; no quotation |  | scattered-seed-gathering |
| 2804 | 13:41 → matthew 7:21 | BARE | none | jargon:substance; chain:post-harvest-sifting; italics not from target |  | matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4 |
| 2805 | 13:41 → luke 3:17 | PARTIAL | near-not-verbatim |  |  | matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4 |
| 2806 | 13:43 → matthew 25:34 | PARTIAL | phrase | jargon:substance; chain:kingdom-of-the-Father |  | righteous-shall-shine-as-the-sun-in-1-enoch-and-2-esdras-and-wisdom |
| 2807 | 13:30 → zechariah 13:8 | DOCREF | none | DOCREF:SUMMATION; chain:lineage-claim-alone/one-third-through-the-fire; label-like |  | matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4 |
| 2808 | 13:39 → matthew 24:31 | BARE | none | chain:angels-with-the-trumpet; label-like |  | matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4 |
| 2810 | 13:36 → revelation 14:14 | DOCREF | none | DOCREF:the framework; jargon:architecture; no quotation |  | matthew-13-the-tares-explained |
| 2811 | 13:13 → isaiah 6:9 | BARE | none | label-like |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 2812 | 13:11 → john 10:26 | PARTIAL | near-not-verbatim | chain:cause-and-effect-of-hearing |  | wisdom-hidden-from-the-wicked-revealed-to-the-elect-in-1-enoch-and-2-esdras-and-wisdom |
| 2813 | 13:11 → 1-corinthians 2:14 | PARTIAL | near-not-verbatim |  |  | wisdom-hidden-from-the-wicked-revealed-to-the-elect-in-1-enoch-and-2-esdras-and-wisdom |
| 2814 | 13:14 → john 12:37 | BARE | none | label-like |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 2815 | 13:14 → acts 28:25 | BARE | none | no quotation |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 2816 | 13:14 → romans 11:7 | PARTIAL | near-not-verbatim | jargon:architecture |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 2817 | 13:16 → 1-peter 1:10 | BARE | none | chain:inquired-into-the-salvation-now-revealed/positioned-unique-moment; label-like |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 2818 | 13:11 → daniel 2:21 | BARE | none | italics not from target |  | wisdom-hidden-from-the-wicked-revealed-to-the-elect-in-1-enoch-and-2-esdras-and-wisdom |
| 2819 | 13:47 → matthew 13:36 | BARE | none | jargon:architecture; chain:wheat-and-tares; label-like |  | matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51 |
| 2820 | 13:47 → matthew 4:19 | PARTIAL | phrase | chain:apostolic-net-casting |  | matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51 |
| 2821 | 13:47 → ezekiel 47:9 | PARTIAL | whole-not-verbatim |  |  | matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51 |
| 2822 | 13:49 → matthew 25:31 | FULL | whole |  |  | wheat-from-chaff-and-righteous-from-wicked-at-the-day-of-separation-in-2-esdras-and-1-enoch-and-wisdom |
| 2823 | 13:49 → daniel 12:2 | PARTIAL | phrase |  |  | wheat-from-chaff-and-righteous-from-wicked-at-the-day-of-separation-in-2-esdras-and-1-enoch-and-wisdom |
| 2824 | 13:33 → exodus 12:15 | BARE | none | jargon:substance; chain:Leaven-removed-from-the-house/separation-from-corruption; label-like |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 2825 | 13:33 → leviticus 2:11 | BARE | none | label-like |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 2826 | 13:33 → matthew 16:6 | BARE | none | label-like |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 2827 | 13:33 → matthew 16:11 | BARE | none | label-like |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 2828 | 13:33 → luke 12:1 | BARE | none | label-like |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 2829 | 13:33 → 1-corinthians 5:6 | PARTIAL | phrase |  |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 2830 | 13:33 → galatians 5:9 | BARE | none | label-like |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 2831 | 13:33 → genesis 18:6 | DOCREF | none | DOCREF:the framework; jargon:substance; chain:leaven-hidden-in-the-covenant-meal/three-measures-of-meal; no quotation |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 3463 | 13:9 → matthew 13:43 | BARE | none | chain:wheat-and-tares; label-like |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 3464 | 13:9 → deuteronomy 29:4 | PARTIAL | whole-not-verbatim |  |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 3465 | 13:11 → 1-corinthians 2:7 | PARTIAL | phrase |  |  | wisdom-hidden-from-the-wicked-revealed-to-the-elect-in-1-enoch-and-2-esdras-and-wisdom |
| 3466 | 13:11 → ephesians 3:3 | BARE | none | italics not from target |  | wisdom-hidden-from-the-wicked-revealed-to-the-elect-in-1-enoch-and-2-esdras-and-wisdom |
| 3467 | 13:13 → john 12:37 | BARE | none | label-like |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 3468 | 13:13 → acts 28:25 | BARE | none | label-like |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 3469 | 13:13 → romans 11:7 | BARE | none | label-like |  | matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55 |
| 3470 | 13:24 → matthew 13:36 | BARE | none | chain:King's-own-interpretation; label-like |  | seed-of-good-and-evil-sown-in-the-heart-of-adam-in-2-esdras |
| 3471 | 13:24 → genesis 6:1 | BARE | none | label-like |  | watchers-corruption-as-tares-sown-in-the-wheat-in-1-enoch-and-jubilees |
| 3472 | 13:24 → genesis 3:1 | BARE | none | label-like |  | matthew-13-the-wheat-and-the-tares |
| 3473 | 13:31 → ezekiel 17:22 | BARE | none | chain:birds-of-the-air; label-like |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 3474 | 13:31 → daniel 4:12 | BARE | none | label-like |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 3475 | 13:31 → ezekiel 31:6 | BARE | none | chain:birds-of-the-air/cedar-of-Lebanon; label-like |  | matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4 |
| 3476 | 13:34 → psalms 78:2 | BARE | none | label-like |  | matthew-13-i-will-open-my-mouth-in-parables-kept-secret-psalm-78-psalm-49 |
| 3477 | 13:34 → romans 16:25 | BARE | none | chain:mystery-kept-secret-since-the-world-began; label-like |  | matthew-13-i-will-open-my-mouth-in-parables-kept-secret-psalm-78-psalm-49 |
| 3478 | 13:36 → john 8:44 | PARTIAL | near-not-verbatim | jargon:substance; chain:children-of-the-wicked-one |  | matthew-13-the-tares-explained |
| 3479 | 13:36 → 1-john 3:8 | BARE | none | chain:children-of-Elohim/children-of-the-devil; label-like |  | seed-war-from-genesis-3-and-the-devil-as-source-of-death-in-wisdom-and-jubilees-and-1-enoch |
| 3480 | 13:36 → daniel 12:3 | BARE | none | jargon:substance; chain:righteous-shining-as-the-sun; label-like |  | matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4 |
| 3481 | 13:36 → matthew 25:34 | BARE | none | chain:kingdom-prepared-from-the-foundation-of-the-world; label-like |  | matthew-13-the-tares-explained |
| 3482 | 13:44 → isaiah 43:4 | PARTIAL | near-not-verbatim | chain:Father's-paying-the-price |  | matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51 |
| 3483 | 13:44 → philippians 2:6 | BARE | none | chain:King's-paying-the-price; italics not from target |  | matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51 |
| 3484 | 13:44 → deuteronomy 7:6 | PARTIAL | near-not-verbatim | jargon:substance |  | matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51 |
| 3485 | 13:47 → matthew 25:31 | FULL | whole |  |  | wheat-from-chaff-and-righteous-from-wicked-at-the-day-of-separation-in-2-esdras-and-1-enoch-and-wisdom |
| 3486 | 13:47 → daniel 12:2 | BARE | none | label-like |  | matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51 |
| 3487 | 13:52 → matthew 5:17 | BARE | none | jargon:substance; chain:Torah-not-destroyed; label-like |  | matthew-13-the-scribe-brings-things-new-and-old-a-prophet-without-honour-jeremiah-6 |
| 3488 | 13:52 → romans 7:22 | PARTIAL | phrase | chain:kept-in-the-new-heart-disposition |  | matthew-13-the-scribe-brings-things-new-and-old-a-prophet-without-honour-jeremiah-6 |
| 3489 | 13:52 → jeremiah 31:33 | BARE | none | jargon:substance; chain:old-written-in-new/written-on-the-heart; label-like |  | matthew-13-the-scribe-brings-things-new-and-old-a-prophet-without-honour-jeremiah-6 |
| 3490 | 13:55 → john 7:5 | BARE | none | label-like |  | matthew-13-rejected-at-nazareth |
| 3491 | 13:55 → mark 6:1 | BARE | none | label-like |  | matthew-13-rejected-at-nazareth |
| 3492 | 13:55 → luke 4:16 | BARE | none | label-like |  | matthew-13-rejected-at-nazareth |
| 3493 | 13:55 → jeremiah 11:21 | BARE | none | label-like |  | matthew-13-the-scribe-brings-things-new-and-old-a-prophet-without-honour-jeremiah-6 |

### Matthew 14 (42 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2832 | 14:3 → 1-kings 21:17 | BARE | none | no quotation |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 2833 | 14:3 → 1-kings 19:1 | BARE | none | chain:queen-orchestration-of-killing; label-like |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 2834 | 14:5 → matthew 21:26 | BARE | none | jargon:substance; italics not from target |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 2835 | 14:1 → matthew 11:14 | PARTIAL | near-not-verbatim |  |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 2836 | 14:1 → matthew 17:12 | PARTIAL | near-not-verbatim | chain:King's-own-suffering |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 2837 | 14:1 → 2-chronicles 24:20 | BARE | none | chain:Tanakh-prophet-killing; no quotation |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 2838 | 14:1 → matthew 23:34 | BARE | none | chain:broader-Tanakh-prophet-killing-pattern; label-like |  | matthew-14-herod-and-the-death-of-yochanan |
| 2839 | 14:1 → revelation 11:7 | BARE | none | chain:Eliyahu-pattern's-second-fulfillment/eschatological-two-witnesses; label-like |  | matthew-14-herod-and-the-death-of-yochanan |
| 2840 | 14:3 → mark 6:14 | BARE | none | chain:Herod's-conflicted-attention; label-like |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 2841 | 14:13 → exodus 16:14 | BARE | none | chain:King's-recapitulation-and-exceeding; label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 2842 | 14:13 → numbers 11:7 | BARE | none | jargon:substance; label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 2843 | 14:13 → 2-kings 4:42 | BARE | none | chain:Elisha's-feeding-of-the-hundred; label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 2844 | 14:13 → isaiah 25:6 | BARE | none | jargon:pre-figur; chain:mountain-of-Yahuah; label-like |  | matthew-14-feeding-the-five-thousand |
| 2845 | 14:19 → matthew 26:26 | BARE | none | label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 2846 | 14:20 → matthew 19:28 | BARE | none | jargon:architecture; chain:twelve-tribes-architecture; label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 2847 | 14:13 → john 6:1 | BARE | none | chain:Bread-of-Life; label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 2848 | 14:13 → john 6:31 | BARE | none | chain:Bread-of-Life; label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 2849 | 14:14 → ezekiel 34:11 | BARE | none | jargon:substance; chain:own-shepherding-of-the-scattered-flock/shepherd-compassion-substance; label-like |  | scattered-seed-gathering |
| 2850 | 14:13 → matthew 15:32 | BARE | none | chain:wilderness-feeding-in-the-Galilee; label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 2853 | 14:25 → habakkuk 3:15 | BARE | none | italics not from target |  | wonders-of-the-sea-and-the-creators-mastery-in-sirach-and-wisdom-of-solomon |
| 2855 | 14:27 → john 8:58 | PARTIAL | near-not-verbatim |  |  | matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3 |
| 2856 | 14:27 → john 6:20 | BARE | none | label-like |  | matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3 |
| 2857 | 14:33 → matthew 16:16 | BARE | none | jargon:pre-figur; label-like | 3528(ma-rev) | matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3 |
| 2858 | 14:22 → matthew 8:23 | BARE | none | chain:amazement-at-the-storm-stilled/confession-of-the-Son-of-Elohim; bare-name:Elohim; label-like |  | matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3 |
| 3494 | 14:2 → matthew 16:14 | BARE | none | label-like |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 3495 | 14:2 → mark 6:16 | BARE | none | chain:Herod's-superstitious-recognition; label-like |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 3496 | 14:3 → leviticus 18:16 | PARTIAL | near-not-verbatim |  |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 3497 | 14:3 → leviticus 20:21 | PARTIAL | phrase |  |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 3498 | 14:3 → 1-kings 21:5 | BARE | none | chain:orchestrating-the-killing; label-like |  | matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18 |
| 3499 | 14:13 → matthew 14:23 | BARE | none | chain:same-evening's-mountain-prayer; label-like |  | matthew-14-feeding-the-five-thousand |
| 3500 | 14:13 → mark 6:31 | PARTIAL | near-not-verbatim |  |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 3501 | 14:19 → luke 24:30 | BARE | none | chain:King's-recognized-at-the-bread-blessing; label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 3502 | 14:20 → revelation 21:14 | BARE | none | label-like |  | matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16 |
| 3503 | 14:23 → matthew 5:1 | BARE | none | label-like |  | matthew-14-walking-on-the-sea |
| 3504 | 14:23 → matthew 17:1 | BARE | none | label-like |  | matthew-14-walking-on-the-sea |
| 3505 | 14:23 → matthew 26:36 | BARE | none | chain:Garden-of-Gethsemane; label-like |  | matthew-14-walking-on-the-sea |
| 3506 | 14:23 → matthew 28:16 | BARE | none | label-like |  | matthew-14-walking-on-the-sea |
| 3507 | 14:27 → isaiah 41:10 | PARTIAL | near-not-verbatim | jargon:substance; bare-name:Yahuah |  | matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3 |
| 3508 | 14:27 → isaiah 41:13 | PARTIAL | near-not-verbatim | jargon:substance; bare-name:Yahuah |  | matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3 |
| 3509 | 14:33 → psalms 2:7 | PARTIAL | near-not-verbatim | jargon:substance; chain:Davidic-Messianic-Son-of-Elohim; bare-name:Elohim |  | matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3 |
| 3510 | 14:36 → matthew 9:20 | BARE | none | chain:touching-the-hem; label-like |  | matthew-14-the-hem-of-his-garment-the-tzitzit-wings-of-torah-numbers-15-malachi-4 |
| 5521 | 14:25 → psalms 77:20 | BARE | whole-not-verbatim | prefix:walking-on-the-sea-formed-cloud-rider; chain:right-hand-of-Mosheh/walking-on-the-sea |  | matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3 |

### Matthew 15 (41 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2859 | 15:8 → isaiah 29:13 | BARE | none | label-like |  | matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3 |
| 2860 | 15:3 → exodus 20:12 | BARE | none | label-like |  | matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3 |
| 2862 | 15:6 → mark 7:9 | BARE | none | italics not from target |  | matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3 |
| 2863 | 15:6 → deuteronomy 4:2 | BARE | none | chain:adding-or-diminishing; label-like |  | matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3 |
| 2864 | 15:6 → deuteronomy 12:32 | BARE | none | label-like |  | matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3 |
| 2865 | 15:9 → daniel 7:25 | PARTIAL | phrase | jargon:substance/architecture; chain:antichrist-system's-substance/its-first-century-costume |  | matthew-15-the-tradition-of-the-elders |
| 2866 | 15:9 → 1-john 2:3 | DOCREF | none | DOCREF:voice skill/1234 of Truth; chain:contrary-to-Torah; no quotation |  | matthew-15-the-tradition-of-the-elders |
| 2867 | 15:1 → matthew 23:16 | BARE | none | jargon:architecture; chain:King's-later-Matt/Pharisaic-tradition's-vow-architecture; no quotation |  | matthew-15-the-tradition-of-the-elders |
| 2868 | 15:1 → galatians 1:14 | PARTIAL | phrase | jargon:architecture; chain:Paul's-pre-conversion/Pharisaic-traditions-architecture |  | matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3 |
| 2869 | 15:24 → matthew 10:5 | BARE | none | chain:apostolic-mission-scope/confirms-and-reinforces; label-like | 3391(ma-rev) | gathering-of-the-scattered-twelve-tribes-in-sirach-and-2-esdras-and-tobit |
| 2870 | 15:24 → romans 15:8 | BARE | none | chain:King's-mission-scope/Paul's-apostolic-restatement; label-like |  | gathering-of-the-scattered-twelve-tribes-in-sirach-and-2-esdras-and-tobit |
| 2871 | 15:21 → matthew 8:5 | BARE | none | chain:God-fearer-Yashar'el/individual-nations-figure; label-like |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 2872 | 15:21 → ruth 1:1 | BARE | none | chain:individual-nations-figure/through-marriage-into-the-covenant-line; label-like |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 2873 | 15:21 → 1-kings 17:8 | BARE | none | chain:from-Yahuah-through-Eliyahu/individual-nations-figure; bare-name:Yahuah; label-like |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 2874 | 15:21 → 2-kings 5:1 | BARE | none | chain:from-Yahuah-through-Elisha/individual-nations-figure; bare-name:Yahuah; label-like |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 2875 | 15:21 → luke 4:25 | DOCREF | none | DOCREF:the framework; chain:King's-own-citation/widow-of-Tsarephath; no quotation |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 2876 | 15:24 → matthew 28:19 | DOCREF | none | DOCREF:Red Line; no quotation |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 2877 | 15:28 → hebrews 11:31 | BARE | none | jargon:substance; chain:individual-faith-honored-substance; label-like |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 2878 | 15:28 → matthew 8:10 | PARTIAL | phrase | jargon:substance; chain:centurion-pericope's-faith-honoring |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 2879 | 15:11 → mark 7:14 | BARE | none | label-like |  | matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51 |
| 2880 | 15:18 → genesis 6:5 | PARTIAL | phrase | jargon:substance |  | matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51 |
| 2881 | 15:18 → jeremiah 17:9 | PARTIAL | phrase | jargon:substance |  | matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51 |
| 2882 | 15:18 → ezekiel 36:26 | DOCREF | none | DOCREF:the framework; jargon:substance; label-like |  | matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51 |
| 2883 | 15:11 → acts 10:14 | PARTIAL | phrase |  |  | the-heart-the-source-of-evil-not-the-father-in-sirach-and-wisdom-of-solomon |
| 2884 | 15:11 → leviticus 11:1 | BARE | none | jargon:substance; chain:Torah's-dietary-substance; label-like |  | matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51 |
| 2885 | 15:11 → deuteronomy 14:1 | BARE | none | jargon:substance; chain:Torah's-dietary-substance; label-like |  | matthew-15-what-defiles-a-man |
| 2886 | 15:13 → matthew 13:24 | BARE | none | chain:wheat-and-tares; label-like |  | matthew-15-what-defiles-a-man |
| 2887 | 15:14 → matthew 13:13 | BARE | none | chain:cause-and-effect-of-hearing; label-like |  | matthew-15-what-defiles-a-man |
| 3513 | 15:8 → colossians 2:8 | PARTIAL | phrase | chain:Paul's-apostolic-restatement |  | matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3 |
| 3514 | 15:11 → acts 10:9 | DOCREF | none | DOCREF:the framework; chain:abolition-of-the-dietary-categories; label-like |  | matthew-15-what-defiles-a-man |
| 3515 | 15:13 → matthew 13:36 | BARE | none | jargon:architecture; chain:Adam-and-Tares; label-like |  | matthew-15-what-defiles-a-man |
| 3516 | 15:13 → isaiah 60:21 | PARTIAL | phrase |  |  | matthew-15-what-defiles-a-man |
| 3517 | 15:14 → matthew 23:16 | BARE | none | label-like |  | matthew-15-what-defiles-a-man |
| 3518 | 15:24 → ezekiel 34:11 | PARTIAL | phrase | jargon:substance; chain:Tanakh-shepherd-substance |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 3519 | 15:24 → jeremiah 50:6 | PARTIAL | near-not-verbatim |  |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 3520 | 15:27 → matthew 8:10 | BARE | none | jargon:substance; chain:centurion-pericope's-faith-honoring-substance; label-like |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 3521 | 15:27 → ruth 1:1 | BARE | none | label-like |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |
| 3522 | 15:31 → matthew 11:5 | BARE | none | label-like |  | matthew-15-the-dumb-speak-the-lame-walk-feeding-the-four-thousand-isaiah-35-psalm-107-exodus-16 |
| 3524 | 15:36 → matthew 14:19 | BARE | none | chain:first-feeding's-take-bless-break-distribute; label-like |  | matthew-15-the-dumb-speak-the-lame-walk-feeding-the-four-thousand-isaiah-35-psalm-107-exodus-16 |
| 3525 | 15:36 → matthew 26:26 | BARE | none | label-like |  | matthew-15-the-dumb-speak-the-lame-walk-feeding-the-four-thousand-isaiah-35-psalm-107-exodus-16 |
| 177460 | 15:24 → romans 11:25 | BARE | none | quotes source verse only |  | matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17 |

### Matthew 16 (38 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2888 | 16:17 → matthew 11:25 | BARE | none | chain:Father-Son-revelation-economy; label-like |  | the-son-of-the-living-elohim-named-before-the-foundation-in-1-enoch-and-wisdom-of-solomon |
| 2889 | 16:18 → deuteronomy 32:4 | BARE | none | jargon:substance; label-like |  | the-gates-of-sheol-and-the-resurrection-substance-in-wisdom-of-solomon-and-1-enoch |
| 2890 | 16:18 → psalms 18:2 | PARTIAL | near-not-verbatim |  |  | matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28 |
| 2891 | 16:18 → 1-corinthians 10:4 | PARTIAL | near-not-verbatim |  |  | matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28 |
| 2892 | 16:18 → 1-peter 2:4 | BARE | none | label-like |  | matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28 |
| 2893 | 16:18 → ephesians 2:20 | BARE | none | chain:King-as-the-chief-corner-stone; label-like |  | matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28 |
| 2895 | 16:18 → psalms 118:22 | PARTIAL | whole | jargon:substance; chain:rejected-stone-becoming-the-cornerstone; no citation |  | matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28 |
| 2896 | 16:18 → isaiah 38:10 | BARE | none | jargon:substance; label-like |  | the-gates-of-sheol-and-the-resurrection-substance-in-wisdom-of-solomon-and-1-enoch |
| 2897 | 16:18 → psalms 9:13 | BARE | none | label-like |  | the-gates-of-sheol-and-the-resurrection-substance-in-wisdom-of-solomon-and-1-enoch |
| 2900 | 16:19 → matthew 18:18 | BARE | none | chain:binding-and-loosing; label-like | 3629(ma-rev) | the-elect-one-on-the-throne-and-the-davidic-stewardship-keys-in-1-enoch |
| 2901 | 16:21 → isaiah 53:1 | BARE | none | jargon:substance; label-like |  | matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53 |
| 2902 | 16:21 → zechariah 13:7 | BARE | none | label-like |  | matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53 |
| 2903 | 16:21 → zechariah 12:10 | DOCREF | phrase | DOCREF:SUMMATION; jargon:substance; chain:second-coming-recognition-substance |  | matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53 |
| 2904 | 16:21 → matthew 17:22 | BARE | none | chain:second-passion-prediction; label-like | 3591(ma-rev) | the-righteous-one-condemned-with-a-shameful-death-in-wisdom-of-solomon |
| 2905 | 16:21 → matthew 20:17 | BARE | none | chain:third-passion-prediction; label-like | 3729(ma-rev) | the-righteous-one-condemned-with-a-shameful-death-in-wisdom-of-solomon |
| 2906 | 16:22 → matthew 4:8 | BARE | none | jargon:substance; chain:kingdoms-without-the-cross/wilderness-temptation-responses; label-like |  | matthew-16-the-passion-foretold |
| 2907 | 16:21 → galatians 3:13 | DOCREF | near-not-verbatim | DOCREF:the framework; chain:curse-of-the-law-as-Deuteronomy |  | the-righteous-one-condemned-with-a-shameful-death-in-wisdom-of-solomon |
| 2908 | 16:21 → romans 6:14 | DOCREF | none | DOCREF:the framework; jargon:architecture; chain:consequence-system-still-operative/framework's-grace-architecture; label-like |  | matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53 |
| 2909 | 16:24 → matthew 10:38 | BARE | none | chain:cross-bearing-discipleship-cost; label-like | 3422(ma-rev) | matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7 |
| 2910 | 16:25 → john 12:25 | PARTIAL | whole-not-verbatim |  |  | matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7 |
| 2911 | 16:26 → matthew 4:8 | BARE | none | chain:kingdoms-of-the-world; label-like |  | matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7 |
| 2912 | 16:27 → matthew 25:31 | FULL | whole |  |  | matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7 |
| 2913 | 16:27 → matthew 13:36 | BARE | none | chain:post-harvest-sifting/wheat-and-tares; label-like |  | matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7 |
| 2914 | 16:28 → matthew 17:1 | BARE | none | label-like | 3541(ma-rev) | matthew-16-take-up-your-cross |
| 2915 | 16:28 → 2-peter 1:16 | PARTIAL | phrase |  |  | matthew-16-take-up-your-cross |
| 3526 | 16:4 → matthew 12:39 | BARE | none | label-like |  | matthew-16-no-sign-but-the-prophet-jonah-the-signs-of-the-times-jonah-1 |
| 3527 | 16:4 → isaiah 1:21 | BARE | none | chain:Tanakh-prophetic-vocabulary; label-like |  | matthew-16-no-sign-but-the-prophet-jonah-the-signs-of-the-times-jonah-1 |
| 3528 | 16:16 → matthew 14:33 | BARE | none | chain:walking-on-the-sea; label-like | 2857(ma-rev) | matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28 |
| 3531 | 16:17 → john 6:44 | PARTIAL | near-not-verbatim |  |  | matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28 |
| 3532 | 16:17 → galatians 1:15 | BARE | none | chain:Paul's-apostolic-restatement; label-like |  | matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28 |
| 3533 | 16:18 → 1-corinthians 15:54 | BARE | none | chain:through-the-resurrection; label-like |  | the-gates-of-sheol-and-the-resurrection-substance-in-wisdom-of-solomon-and-1-enoch |
| 3534 | 16:21 → matthew 12:39 | BARE | none | chain:sign-of-Yonah; label-like |  | matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53 |
| 3535 | 16:24 → luke 14:27 | BARE | none | label-like | 7056(lu-rev) | matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7 |
| 3536 | 16:24 → john 12:25 | BARE | none | jargon:substance; chain:lose-life-find-life; label-like |  | matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7 |
| 3538 | 16:27 → matthew 7:21 | BARE | none | chain:kingdom-entry-criterion; italics not from target |  | matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7 |
| 3539 | 16:27 → psalms 62:12 | PARTIAL | near-not-verbatim |  |  | reward-according-to-works-the-post-harvest-sifting-in-sirach-and-2-esdras |
| 3540 | 16:27 → romans 2:6 | BARE | none | label-like |  | reward-according-to-works-the-post-harvest-sifting-in-sirach-and-2-esdras |
| 124247 | 16:28 → zechariah 14:5 | PARTIAL | whole-not-verbatim |  |  | matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7 |

### Matthew 17 (51 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3541 | 17:1 → matthew 16:28 | PARTIAL | phrase |  | 2914(ma-rev) | matthew-17-the-transfiguration |
| 3542 | 17:1 → exodus 24:15 | BARE | none | chain:six-days-before-Yahuah-called-Mosheh-out-of-the-cloud; bare-name:Yahuah; label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3543 | 17:1 → exodus 19:10 | BARE | none | chain:two-days-and-the-third-day; italics not from target |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3546 | 17:2 → daniel 10:5 | BARE | none | chain:man-clothed-in-linen; label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3547 | 17:2 → revelation 1:13 | PARTIAL | near-not-verbatim | jargon:substance |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3548 | 17:2 → philippians 2:6 | BARE | none | chain:form-of-Elohim; label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3549 | 17:3 → deuteronomy 34:5 | BARE | none | label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3550 | 17:3 → 2-kings 2:11 | BARE | none | label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3552 | 17:3 → luke 9:31 | BARE | none | label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3553 | 17:3 → hebrews 11:39 | DOCREF | none | DOCREF:Red Line; label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3554 | 17:4 → leviticus 23:33 | BARE | none | jargon:substance; label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3555 | 17:4 → zechariah 14:16 | BARE | none | label-like |  | matthew-17-the-transfiguration |
| 3556 | 17:4 → john 1:14 | BARE | none | jargon:substance; chain:King-as-the-Sukkot-substance; italics not from target |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3557 | 17:4 → revelation 21:3 | PARTIAL | phrase | jargon:substance |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3561 | 17:5 → matthew 3:17 | BARE | none | label-like | 121830(ma-rev,live) | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3562 | 17:5 → exodus 13:21 | BARE | none | chain:cloud-and-fire-pillar; label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3563 | 17:5 → exodus 40:34 | BARE | none | italics not from target |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3564 | 17:5 → 1-kings 8:10 | BARE | none | label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3565 | 17:5 → isaiah 4:5 | BARE | none | chain:eschatological-cloud-and-fire-of-glory; label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3566 | 17:5 → acts 3:22 | BARE | none | label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3567 | 17:5 → 2-peter 1:17 | BARE | none | label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3568 | 17:6 → daniel 8:17 | BARE | none | label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3569 | 17:6 → ezekiel 1:28 | BARE | none | label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3570 | 17:6 → isaiah 6:5 | PARTIAL | phrase |  |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3571 | 17:6 → revelation 1:17 | BARE | none | label-like |  | matthew-17-transfiguration-this-is-my-beloved-son-hear-ye-him-exodus-34-deuteronomy-18-malachi-4 |
| 3572 | 17:9 → matthew 12:39 | BARE | none | chain:sign-of-Yonah; label-like |  | matthew-17-elijah-has-come |
| 3573 | 17:9 → matthew 16:20 | BARE | none | chain:first-passion-prediction/tell-no-man; label-like |  | matthew-17-elijah-has-come |
| 3575 | 17:11 → matthew 11:14 | PARTIAL | near-not-verbatim |  |  | matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48 |
| 3576 | 17:11 → matthew 14:1 | BARE | none | chain:Eliyahu-pattern-martyrdom; label-like |  | matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48 |
| 3577 | 17:11 → luke 1:17 | PARTIAL | near-not-verbatim |  |  | matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48 |
| 3578 | 17:11 → revelation 11:3 | BARE | none | label-like |  | matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48 |
| 3579 | 17:11 → acts 3:21 | PARTIAL | near-not-verbatim |  |  | matthew-17-elias-is-come-already-restore-all-things-malachi-4-sirach-48 |
| 3580 | 17:17 → deuteronomy 32:5 | BARE | none | chain:perverse-and-crooked; label-like |  | matthew-17-faith-like-a-mustard-seed |
| 3581 | 17:17 → deuteronomy 32:20 | BARE | none | chain:perverse-and-crooked; label-like |  | matthew-17-faith-like-a-mustard-seed |
| 3582 | 17:17 → psalms 78:8 | PARTIAL | phrase |  |  | matthew-17-faith-like-a-mustard-seed |
| 3583 | 17:17 → psalms 95:10 | PARTIAL | phrase |  |  | matthew-17-faith-like-a-mustard-seed |
| 3584 | 17:20 → matthew 13:31 | BARE | none | label-like |  | matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40 |
| 3585 | 17:20 → matthew 21:21 | BARE | none | chain:fig-tree-and-the-mountain; label-like | 3802(ma-rev) | matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40 |
| 3586 | 17:20 → 1-corinthians 13:2 | BARE | none | label-like |  | matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40 |
| 3587 | 17:21 → matthew 6:16 | BARE | none | label-like |  | matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40 |
| 3588 | 17:21 → isaiah 58:6 | BARE | none | jargon:substance; label-like |  | matthew-17-faith-like-a-mustard-seed |
| 3589 | 17:21 → acts 13:2 | BARE | none | label-like |  | matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40 |
| 3590 | 17:21 → acts 14:23 | BARE | none | chain:apostolic-elder-appointment; label-like |  | matthew-17-faith-as-a-grain-of-mustard-seed-remove-this-mountain-zechariah-4-isaiah-40 |
| 3591 | 17:22 → matthew 16:21 | BARE | none | chain:first-passion-prediction; label-like | 2904(ma-rev) | matthew-17-the-second-passion-foretelling |
| 3592 | 17:22 → matthew 20:17 | BARE | none | chain:third-passion-prediction; label-like | 3730(ma-rev) | matthew-17-the-second-passion-foretelling |
| 3593 | 17:22 → isaiah 53:6 | PARTIAL | near-not-verbatim | jargon:substance |  | matthew-17-the-second-passion-foretelling |
| 3594 | 17:22 → zechariah 13:7 | BARE | none | label-like |  | matthew-17-the-second-passion-foretelling |
| 3595 | 17:24 → exodus 30:11 | BARE | none | label-like |  | matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24 |
| 3596 | 17:24 → jonah 1:17 | BARE | none | chain:appointed-by-Yahuah; bare-name:Yahuah; label-like |  | matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24 |
| 3597 | 17:24 → john 8:35 | BARE | none | italics not from target |  | matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24 |
| 3598 | 17:24 → romans 14:13 | BARE | none | jargon:substance; chain:voluntary-restraint-for-the-sake-of-others; label-like |  | matthew-17-tribute-money-the-children-are-free-half-shekel-exodus-30-psalm-24 |

### Matthew 18 (50 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3599 | 18:1 → matthew 19:14 | PARTIAL | phrase |  |  | the-greatness-as-humility-and-the-proud-cast-down-in-the-wisdom-stream |
| 3600 | 18:1 → psalms 131:1 | BARE | none | italics not from target |  | the-greatness-as-humility-and-the-proud-cast-down-in-the-wisdom-stream |
| 3601 | 18:1 → jeremiah 31:18 | PARTIAL | near-not-verbatim | jargon:substance |  | the-greatness-as-humility-and-the-proud-cast-down-in-the-wisdom-stream |
| 3602 | 18:4 → proverbs 22:4 | PARTIAL | whole-not-verbatim |  |  | the-greatness-as-humility-and-the-proud-cast-down-in-the-wisdom-stream |
| 3603 | 18:4 → isaiah 57:15 | BARE | none | jargon:substance; chain:contrite-and-humble; label-like |  | the-greatness-as-humility-and-the-proud-cast-down-in-the-wisdom-stream |
| 3604 | 18:4 → 1-peter 5:5 | BARE | none | label-like |  | the-greatness-as-humility-and-the-proud-cast-down-in-the-wisdom-stream |
| 3605 | 18:6 → matthew 5:29 | BARE | none | label-like |  | the-watcher-rebellion-as-the-stumbling-block-architecture-in-1-enoch |
| 3606 | 18:6 → mark 9:42 | BARE | none | label-like |  | the-watcher-rebellion-as-the-stumbling-block-architecture-in-1-enoch |
| 3607 | 18:6 → luke 17:1 | BARE | none | label-like | 7070(lu-rev,live) | the-watcher-rebellion-as-the-stumbling-block-architecture-in-1-enoch |
| 3608 | 18:8 → matthew 5:29 | BARE | none | label-like |  | resurrection-keeps-the-form |
| 3609 | 18:8 → mark 9:43 | BARE | none | jargon:substance; chain:worm-and-fire; label-like |  | resurrection-keeps-the-form |
| 3610 | 18:8 → isaiah 66:24 | PARTIAL | phrase |  |  | resurrection-keeps-the-form |
| 3611 | 18:8 → jeremiah 7:31 | BARE | none | jargon:substance; chain:valley-of-slaughter; label-like |  | resurrection-keeps-the-form |
| 3612 | 18:10 → psalms 91:11 | PARTIAL | near-not-verbatim |  |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3613 | 18:10 → daniel 10:13 | BARE | none | jargon:substance; chain:Michael-and-Persia; label-like |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3614 | 18:10 → daniel 10:21 | BARE | none | jargon:substance; chain:Michael-and-Persia; label-like |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3615 | 18:10 → hebrews 1:14 | PARTIAL | phrase |  |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3616 | 18:12 → ezekiel 34:11 | PARTIAL | phrase | jargon:substance; chain:Tanakh-Yahuah-shepherd-substance; bare-name:Yahuah |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3617 | 18:12 → psalms 119:176 | PARTIAL | near-not-verbatim |  |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3618 | 18:12 → isaiah 53:6 | PARTIAL | phrase |  |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3619 | 18:12 → jeremiah 50:6 | PARTIAL | near-not-verbatim |  |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3620 | 18:12 → luke 15:3 | BARE | none | chain:publicans-and-sinners; label-like |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3621 | 18:12 → 2-peter 3:9 | PARTIAL | phrase |  |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3622 | 18:12 → matthew 10:6 | BARE | none | chain:lost-sheep-of-the-house-of-Yashar'el; label-like |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3623 | 18:12 → matthew 15:24 | BARE | none | label-like |  | the-lord-of-the-sheep-and-the-gathering-in-the-animal-apocalypse |
| 3624 | 18:15 → leviticus 19:17 | BARE | none | jargon:substance; label-like |  | the-reproof-and-restoration-procedure-in-sirach |
| 3625 | 18:15 → deuteronomy 19:15 | BARE | none | chain:two-or-three-witnesses; label-like |  | the-reproof-and-restoration-procedure-in-sirach |
| 3626 | 18:15 → 1-corinthians 5:1 | BARE | none | label-like |  | the-reproof-and-restoration-procedure-in-sirach |
| 3627 | 18:15 → galatians 6:1 | BARE | none | label-like |  | the-reproof-and-restoration-procedure-in-sirach |
| 3628 | 18:15 → 1-timothy 5:19 | BARE | none | chain:two-or-three-witnesses; label-like |  | the-reproof-and-restoration-procedure-in-sirach |
| 3629 | 18:18 → matthew 16:19 | BARE | none | chain:binding-and-loosing; label-like | 2900(ma-rev) | matthew-18-reproof-and-binding |
| 3630 | 18:18 → john 20:21 | BARE | none | label-like |  | matthew-18-reproof-and-binding |
| 3631 | 18:18 → acts 15:1 | BARE | none | label-like |  | matthew-18-reproof-and-binding |
| 3632 | 18:19 → malachi 3:16 | PARTIAL | near-not-verbatim |  |  | matthew-18-reproof-and-binding |
| 3633 | 18:19 → matthew 28:20 | PARTIAL | phrase |  |  | matthew-18-reproof-and-binding |
| 3634 | 18:19 → john 5:14 | BARE | none | italics not from target |  | matthew-18-reproof-and-binding |
| 3635 | 18:19 → hebrews 13:5 | PARTIAL | near-not-verbatim |  |  | matthew-18-reproof-and-binding |
| 3636 | 18:21 → genesis 4:23 | BARE | none | jargon:substance; chain:seventy-and-sevenfold; label-like |  | forgive-and-be-forgiven-the-mercy-met-with-mercy-architecture |
| 3637 | 18:21 → luke 17:3 | BARE | none | label-like |  | forgive-and-be-forgiven-the-mercy-met-with-mercy-architecture |
| 3638 | 18:21 → psalms 103:8 | BARE | none | jargon:substance; chain:Father's-forgiveness-substance; label-like |  | forgive-and-be-forgiven-the-mercy-met-with-mercy-architecture |
| 3639 | 18:21 → micah 7:18 | BARE | none | jargon:substance; chain:Father's-pardoning-substance; label-like |  | forgive-and-be-forgiven-the-mercy-met-with-mercy-architecture |
| 3640 | 18:23 → matthew 6:14 | BARE | none | chain:Lord's-Prayer's-forgiveness-condition; label-like |  | forgive-and-be-forgiven-the-mercy-met-with-mercy-architecture |
| 3641 | 18:23 → matthew 7:1 | BARE | none | jargon:substance; label-like |  | matthew-18-forgiveness-and-the-unforgiving-servant |
| 3642 | 18:23 → james 2:13 | PARTIAL | near-not-verbatim |  |  | matthew-18-forgiveness-and-the-unforgiving-servant |
| 3643 | 18:23 → ephesians 4:32 | PARTIAL | phrase |  |  | forgive-and-be-forgiven-the-mercy-met-with-mercy-architecture |
| 3644 | 18:23 → colossians 3:13 | PARTIAL | phrase |  |  | matthew-18-forgiveness-and-the-unforgiving-servant |
| 3645 | 18:23 → proverbs 21:13 | FULL | whole | no citation,no prose |  | matthew-18-forgiveness-and-the-unforgiving-servant |
| 3646 | 18:23 → james 5:16 | BARE | none | jargon:substance; chain:apostolic-confession-and-prayer; label-like |  | matthew-18-forgiveness-and-the-unforgiving-servant |
| 133759 | 18:8 → john 20:27 | PARTIAL | near-not-verbatim |  |  | resurrection-keeps-the-form |
| 133760 | 18:8 → isaiah 56:5 | PARTIAL | phrase |  |  | resurrection-keeps-the-form |

### Matthew 19 (72 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3647 | 19:1 → matthew 4:23 | BARE | none | chain:Galilean-multitudes-following; label-like |  | matthew-19-marriage-divorce-and-eunuchs |
| 3648 | 19:1 → joshua 1:1 | BARE | none | jargon:substance; chain:Yashar'el-entry-into-the-Land/from-beyond-the-Yarden; bare-name:Yashar'el; label-like |  | matthew-19-marriage-divorce-and-eunuchs |
| 3649 | 19:4 → genesis 1:27 | PARTIAL | phrase |  |  | matthew-19-marriage-divorce-and-eunuchs |
| 3650 | 19:4 → genesis 2:24 | PARTIAL | phrase |  |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3651 | 19:4 → malachi 2:14 | BARE | none | italics not from target |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3652 | 19:4 → 1-corinthians 6:16 | PARTIAL | near-not-verbatim |  |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3653 | 19:4 → ephesians 5:31 | PARTIAL | phrase |  |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3654 | 19:7 → deuteronomy 24:1 | BARE | none | jargon:substance; chain:bill-of-divorce; label-like |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3655 | 19:7 → deuteronomy 17:14 | BARE | none | jargon:substance; chain:concession-to-hardness-of-heart-substance; label-like |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3656 | 19:7 → 1-samuel 8:5 | BARE | none | jargon:substance; chain:Tanakh-king-concession; italics not from target |  | matthew-19-marriage-divorce-and-eunuchs |
| 3657 | 19:9 → matthew 5:31 | BARE | none | label-like |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3658 | 19:9 → mark 10:11 | BARE | none | label-like |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3659 | 19:9 → luke 16:18 | BARE | none | label-like |  | matthew-19-marriage-divorce-and-eunuchs |
| 3660 | 19:9 → 1-corinthians 7:10 | BARE | none | chain:Pauline-apostolic-application; label-like |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3661 | 19:10 → isaiah 56:3 | BARE | none | jargon:substance; chain:eunuchs-who-keep-my-sabbaths; label-like |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3662 | 19:10 → 1-corinthians 7:7 | BARE | none | jargon:substance; chain:Pauline-celibacy-for-undistracted-kingdom-substance; label-like |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3663 | 19:10 → 1-corinthians 7:32 | BARE | none | jargon:substance; chain:Pauline-celibacy-for-undistracted-kingdom-substance; label-like |  | creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon |
| 3664 | 19:10 → revelation 14:4 | PARTIAL | phrase | jargon:substance |  | matthew-19-marriage-divorce-and-eunuchs |
| 3665 | 19:13 → matthew 18:1 | BARE | none | jargon:substance; chain:King's-child-substance/disciples'-greatness-question; label-like |  | receiving-the-children-and-parental-instruction-in-sirach-and-tobit |
| 3666 | 19:13 → mark 10:13 | BARE | none | label-like |  | receiving-the-children-and-parental-instruction-in-sirach-and-tobit |
| 3667 | 19:13 → luke 18:15 | BARE | none | label-like |  | receiving-the-children-and-parental-instruction-in-sirach-and-tobit |
| 3668 | 19:13 → psalms 8:2 | PARTIAL | near-not-verbatim |  |  | receiving-the-children-and-parental-instruction-in-sirach-and-tobit |
| 3669 | 19:13 → isaiah 11:6 | PARTIAL | phrase |  |  | receiving-the-children-and-parental-instruction-in-sirach-and-tobit |
| 3670 | 19:16 → deuteronomy 30:15 | PARTIAL | near-not-verbatim |  |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3671 | 19:16 → leviticus 18:5 | PARTIAL | phrase |  |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3672 | 19:16 → ezekiel 20:11 | PARTIAL | phrase |  |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3673 | 19:16 → proverbs 4:13 | PARTIAL | whole-not-verbatim |  |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3674 | 19:16 → proverbs 7:2 | PARTIAL | phrase |  |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3675 | 19:16 → john 2:3 | DOCREF | none | DOCREF:1234 of Truth; label-like |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3676 | 19:16 → revelation 22:14 | BARE | none | jargon:substance; chain:blessed-are-they-that-do-his-commandments; label-like |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3677 | 19:18 → exodus 20:12 | BARE | none | label-like |  | matthew-19-the-rich-young-ruler |
| 3678 | 19:18 → leviticus 19:18 | PARTIAL | near-not-verbatim |  |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3679 | 19:18 → deuteronomy 5:16 | BARE | none | label-like |  | matthew-19-the-rich-young-ruler |
| 3680 | 19:21 → matthew 5:48 | BARE | none | jargon:substance; italics not from target |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3681 | 19:21 → genesis 17:1 | PARTIAL | near-not-verbatim |  |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3682 | 19:21 → deuteronomy 18:13 | BARE | none | italics not from target |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3683 | 19:21 → luke 12:33 | PARTIAL | near-not-verbatim |  |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3684 | 19:21 → acts 4:32 | BARE | none | jargon:substance; chain:voluntary-substance-sharing; label-like |  | keep-the-commandments-as-life-and-lay-up-treasure-in-heaven-in-sirach-tobit-and-testaments-of-levi |
| 3685 | 19:23 → proverbs 30:8 | PARTIAL | phrase |  |  | woes-on-the-rich-and-riches-cannot-save-in-1-enoch |
| 3686 | 19:23 → jeremiah 9:23 | PARTIAL | phrase |  |  | woes-on-the-rich-and-riches-cannot-save-in-1-enoch |
| 3687 | 19:23 → psalms 49:6 | PARTIAL | phrase |  |  | woes-on-the-rich-and-riches-cannot-save-in-1-enoch |
| 3688 | 19:23 → james 5:1 | PARTIAL | near-not-verbatim | jargon:substance; chain:apostolic-Tanakh-prophetic-substance |  | woes-on-the-rich-and-riches-cannot-save-in-1-enoch |
| 3689 | 19:23 → 1-timothy 6:9 | PARTIAL | phrase |  |  | woes-on-the-rich-and-riches-cannot-save-in-1-enoch |
| 3690 | 19:25 → genesis 18:14 | PARTIAL | near-not-verbatim |  |  | matthew-19-the-camel-and-the-needle |
| 3691 | 19:25 → jeremiah 32:17 | PARTIAL | near-not-verbatim |  |  | matthew-19-the-camel-and-the-needle |
| 3692 | 19:25 → jeremiah 32:27 | PARTIAL | phrase |  |  | matthew-19-the-camel-and-the-needle |
| 3693 | 19:25 → job 42:2 | PARTIAL | near-not-verbatim |  |  | matthew-19-the-camel-and-the-needle |
| 3694 | 19:25 → luke 1:37 | FULL | whole | no citation,no prose |  | woes-on-the-rich-and-riches-cannot-save-in-1-enoch |
| 3695 | 19:25 → ezekiel 36:26 | PARTIAL | phrase | jargon:substance; chain:Father's-substance-enabling-the-substance/natural-substance-cannot |  | woes-on-the-rich-and-riches-cannot-save-in-1-enoch |
| 3696 | 19:28 → daniel 7:13 | DOCREF | phrase | DOCREF:Red Line; chain:coming-with-the-clouds |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3697 | 19:28 → matthew 25:31 | PARTIAL | whole-elided |  | 2919(ma-rev,live) | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3698 | 19:28 → isaiah 65:17 | PARTIAL | phrase | jargon:substance |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3699 | 19:28 → isaiah 66:22 | PARTIAL | phrase |  |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3700 | 19:28 → acts 3:21 | PARTIAL | phrase |  |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3701 | 19:28 → romans 8:18 | BARE | none | italics not from target |  | matthew-19-the-twelve-thrones |
| 3702 | 19:28 → revelation 21:1 | PARTIAL | phrase | jargon:substance; chain:consummated-kingdom-substance |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3703 | 19:28 → revelation 21:12 | PARTIAL | phrase |  |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3704 | 19:28 → revelation 21:14 | PARTIAL | phrase |  |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3705 | 19:28 → revelation 4:4 | PARTIAL | phrase |  |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3706 | 19:28 → ezekiel 37:15 | BARE | none | jargon:substance; chain:twelve-tribes-restoration/two-sticks-becoming-one; italics not from target |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3707 | 19:28 → isaiah 11:11 | BARE | none | italics not from target |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3708 | 19:28 → jeremiah 31:31 | BARE | none | jargon:substance; chain:new-covenant-with-both-houses; label-like |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3709 | 19:28 → ezekiel 47:1 | BARE | none | chain:twelve-tribes-land-allotment; label-like |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3710 | 19:28 → james 1:1 | PARTIAL | phrase | jargon:substance; chain:Apostolic-greeting-substance/assuming-the-twelve-tribes |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3711 | 19:28 → acts 26:7 | PARTIAL | phrase | jargon:substance; chain:Paul's-Tanakh-twelve-tribes-hope-substance |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3712 | 19:28 → 1-corinthians 6:2 | PARTIAL | near-not-verbatim | jargon:substance; chain:apostolic-saints-judging-substance |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3713 | 19:28 → revelation 20:4 | PARTIAL | phrase | jargon:substance; chain:reigning-with-the-King |  | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3714 | 19:28 → luke 22:28 | BARE | none | italics not from target | 7105(lu-rev,live) | the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii |
| 3715 | 19:29 → matthew 20:1 | BARE | none | jargon:substance; chain:laborers-in-the-vineyard/that-extends-the-substance; label-like |  | matthew-19-the-twelve-thrones |
| 3716 | 19:29 → mark 10:29 | BARE | none | italics not from target |  | matthew-19-the-twelve-thrones |
| 3717 | 19:29 → luke 18:29 | BARE | none | label-like |  | matthew-19-the-twelve-thrones |
| 3718 | 19:29 → psalms 84:10 | PARTIAL | near-not-verbatim |  |  | matthew-19-the-twelve-thrones |

### Matthew 20 (56 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3719 | 20:1 → isaiah 5:1 | BARE | none | jargon:substance; chain:Tanakh-vineyard-substance; bare-name:Yahuah; label-like |  | the-vineyard-of-yashar-el-and-the-sovereign-grace-of-the-master-in-sirach-and-2-esdras |
| 3720 | 20:1 → jeremiah 12:10 | BARE | none | jargon:substance; chain:vineyard-Tanakh-substance; label-like |  | the-vineyard-of-yashar-el-and-the-sovereign-grace-of-the-master-in-sirach-and-2-esdras |
| 3721 | 20:13 → matthew 6:22 | BARE | none | jargon:substance; chain:Hebrew-idiom-substance; italics not from target |  | matthew-20-the-laborers-in-the-vineyard |
| 3722 | 20:13 → deuteronomy 15:9 | PARTIAL | near-not-verbatim |  |  | matthew-20-the-laborers-in-the-vineyard |
| 3723 | 20:13 → proverbs 23:6 | PARTIAL | near-not-verbatim |  |  | matthew-20-the-laborers-in-the-vineyard |
| 3724 | 20:13 → proverbs 28:22 | PARTIAL | near-not-verbatim |  |  | matthew-20-the-laborers-in-the-vineyard |
| 3725 | 20:16 → matthew 19:30 | BARE | none | label-like |  | many-be-called-but-few-chosen-in-1-enoch-and-2-esdras |
| 3726 | 20:16 → matthew 22:14 | PARTIAL | phrase |  | 3878(ma-rev) | many-be-called-but-few-chosen-in-1-enoch-and-2-esdras |
| 3727 | 20:16 → isaiah 6:9 | DOCREF | none | DOCREF:Red Line; jargon:substance; chain:cause-and-effect-of-hearing; label-like |  | many-be-called-but-few-chosen-in-1-enoch-and-2-esdras |
| 3728 | 20:16 → revelation 17:14 | PARTIAL | phrase |  |  | many-be-called-but-few-chosen-in-1-enoch-and-2-esdras |
| 3729 | 20:17 → matthew 16:21 | BARE | none | chain:first-passion-prediction; label-like | 2905(ma-rev) | matthew-20-the-third-passion-foretelling |
| 3730 | 20:17 → matthew 17:22 | BARE | none | chain:second-passion-prediction; label-like | 3592(ma-rev) | matthew-20-the-third-passion-foretelling |
| 3731 | 20:17 → isaiah 53:1 | BARE | none | jargon:substance; label-like |  | matthew-20-the-third-passion-foretelling |
| 3732 | 20:17 → psalms 22:1 | BARE | none | jargon:substance; chain:crucifixion-Tanakh-substance; label-like |  | matthew-20-the-third-passion-foretelling |
| 3733 | 20:17 → daniel 9:26 | PARTIAL | near-not-verbatim |  |  | matthew-20-the-third-passion-foretelling |
| 3734 | 20:17 → zechariah 12:10 | PARTIAL | phrase |  |  | matthew-20-the-third-passion-foretelling |
| 3735 | 20:17 → zechariah 13:7 | PARTIAL | phrase |  |  | matthew-20-the-third-passion-foretelling |
| 3736 | 20:20 → matthew 4:21 | BARE | none | label-like |  | matthew-20-the-cup-and-the-ransom |
| 3737 | 20:20 → matthew 17:1 | BARE | none | chain:transfiguration-inner-circle-three; label-like |  | matthew-20-the-cup-and-the-ransom |
| 3738 | 20:20 → mark 10:35 | BARE | none | label-like |  | matthew-20-the-cup-and-the-ransom |
| 3739 | 20:22 → matthew 26:39 | BARE | none | chain:King's-Gethsemane-cup; label-like |  | the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees |
| 3740 | 20:22 → matthew 26:42 | BARE | none | chain:King's-Gethsemane-cup; label-like |  | the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees |
| 3741 | 20:22 → psalms 75:8 | BARE | none | chain:Tanakh-cup-of-wrath; label-like |  | the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees |
| 3742 | 20:22 → isaiah 51:17 | BARE | none | chain:cup-of-trembling; label-like |  | the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees |
| 3743 | 20:22 → isaiah 51:22 | BARE | none | chain:cup-of-trembling; label-like |  | the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees |
| 3744 | 20:22 → jeremiah 25:15 | BARE | none | chain:wine-cup-of-fury; label-like |  | the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees |
| 3745 | 20:22 → habakkuk 2:16 | BARE | none | chain:cup-of-Yahuah's-right-hand; bare-name:Yahuah; label-like |  | the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees |
| 3746 | 20:25 → mark 10:42 | BARE | none | label-like |  | matthew-20-the-cup-and-the-ransom |
| 3747 | 20:25 → luke 22:24 | BARE | none | label-like |  | matthew-20-the-cup-and-the-ransom |
| 3748 | 20:25 → daniel 10:13 | BARE | none | jargon:substance; chain:princes-of-Persia; label-like |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3749 | 20:25 → daniel 10:20 | BARE | none | jargon:substance; chain:princes-of-Persia; label-like |  | matthew-20-the-cup-and-the-ransom |
| 3750 | 20:25 → ephesians 6:12 | BARE | none | jargon:substance; chain:principalities-and-powers-substance; label-like |  | matthew-20-the-cup-and-the-ransom |
| 3751 | 20:28 → isaiah 53:10 | BARE | none | jargon:substance; italics not from target |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3752 | 20:28 → psalms 49:7 | PARTIAL | whole-elided |  |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3753 | 20:28 → exodus 21:30 | BARE | none | jargon:substance; italics not from target |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3754 | 20:28 → exodus 30:11 | BARE | none | jargon:substance; label-like |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3755 | 20:28 → daniel 9:24 | BARE | none | jargon:substance; label-like |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3756 | 20:28 → 1-timothy 2:5 | BARE | none | jargon:substance; italics not from target |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3757 | 20:28 → 1-peter 1:18 | BARE | none | label-like |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3758 | 20:28 → revelation 5:9 | BARE | none | italics not from target |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3759 | 20:28 → john 13:1 | BARE | none | jargon:substance; chain:King-himself-models/foot-washing-substance; label-like |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3760 | 20:28 → philippians 2:5 | BARE | none | italics not from target |  | the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach |
| 3761 | 20:30 → matthew 9:27 | PARTIAL | phrase | chain:two-blind-men | 2733(ma-rev) | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3762 | 20:30 → matthew 15:22 | PARTIAL | phrase |  |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3763 | 20:30 → matthew 21:9 | PARTIAL | phrase | jargon:substance; chain:children-in-the-temple |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3764 | 20:30 → matthew 21:15 | PARTIAL | phrase | jargon:substance; chain:children-in-the-temple |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3765 | 20:30 → matthew 22:41 | BARE | none | chain:King's-own-substantial-question; quotes source verse only |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3766 | 20:30 → 2-samuel 7:12 | BARE | none | label-like |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3767 | 20:30 → isaiah 11:1 | BARE | none | chain:rod-of-Yishai; label-like |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3768 | 20:30 → jeremiah 23:5 | BARE | none | label-like |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3769 | 20:30 → ezekiel 34:23 | BARE | none | chain:David-my-servant; label-like |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3770 | 20:30 → ezekiel 37:24 | BARE | none | chain:David-king-over-the-restored-twelve-tribes; label-like |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3771 | 20:34 → isaiah 35:5 | PARTIAL | phrase |  |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3772 | 20:34 → isaiah 32:3 | PARTIAL | phrase |  |  | matthew-20-the-two-blind-men-of-jericho |
| 3773 | 20:34 → isaiah 42:7 | PARTIAL | phrase |  |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |
| 3774 | 20:34 → psalms 146:8 | PARTIAL | near-not-verbatim |  |  | the-davidic-messianic-son-recognized-by-the-marginalized-in-testaments-of-the-twelve |

### Matthew 21 (88 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3775 | 21:1 → zechariah 14:4 | BARE | none | jargon:substance; label-like |  | matthew-21-the-entry-on-the-colt |
| 3776 | 21:1 → 1-samuel 9:5 | BARE | none | jargon:substance; chain:and-the-asses/finds-the-substance-of-substantial-substance; label-like |  | matthew-21-the-entry-on-the-colt |
| 3778 | 21:4 → isaiah 62:11 | BARE | none | italics not from target |  | davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees |
| 3779 | 21:4 → zephaniah 3:14 | PARTIAL | near-not-verbatim |  |  | davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees |
| 3780 | 21:9 → psalms 118:25 | BARE | none | no quotation |  | davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees |
| 3781 | 21:9 → 2-samuel 7:12 | BARE | none | label-like |  | davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees |
| 3782 | 21:9 → isaiah 11:1 | BARE | none | chain:rod-of-Yishai; label-like |  | davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees |
| 3783 | 21:9 → isaiah 11:10 | BARE | none | chain:rod-of-Yishai; label-like |  | davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees |
| 3784 | 21:9 → jeremiah 23:5 | BARE | none | label-like |  | davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees |
| 3785 | 21:9 → ezekiel 34:23 | BARE | none | chain:David-my-servant; label-like |  | davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees |
| 3786 | 21:9 → ezekiel 37:24 | BARE | none | chain:David-king-over-the-restored-twelve-tribes; label-like |  | davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees |
| 3787 | 21:12 → malachi 3:1 | PARTIAL | near-not-verbatim |  |  | matthew-21-cleansing-the-temple |
| 3788 | 21:12 → zechariah 14:21 | PARTIAL | near-not-verbatim |  |  | temple-cleansing-and-the-maccabean-rededication-architecture |
| 3789 | 21:13 → isaiah 56:7 | PARTIAL | phrase |  |  | temple-cleansing-and-the-maccabean-rededication-architecture |
| 3790 | 21:13 → jeremiah 7:11 | PARTIAL | phrase |  |  | temple-cleansing-and-the-maccabean-rededication-architecture |
| 3791 | 21:13 → jeremiah 7:1 | BARE | none | label-like |  | temple-cleansing-and-the-maccabean-rededication-architecture |
| 3792 | 21:14 → isaiah 35:5 | BARE | none | label-like |  | matthew-21-cleansing-the-temple |
| 3793 | 21:14 → 2-samuel 5:8 | BARE | none | chain:rabbinic-categorical-exclusion; label-like |  | temple-cleansing-and-the-maccabean-rededication-architecture |
| 3794 | 21:14 → isaiah 56:7 | BARE | none | jargon:substance; label-like |  | temple-cleansing-and-the-maccabean-rededication-architecture |
| 3795 | 21:16 → psalms 8:2 | BARE | none | label-like |  | matthew-21-cleansing-the-temple |
| 3796 | 21:16 → psalms 8:4 | DOCREF | near-not-verbatim | DOCREF:Red Line |  | matthew-21-cleansing-the-temple |
| 3797 | 21:18 → jeremiah 8:13 | PARTIAL | near-not-verbatim |  |  | leaves-without-fruit-judged-in-wisdom-of-solomon-sirach-and-1-enoch |
| 3798 | 21:18 → hosea 9:10 | PARTIAL | phrase |  |  | leaves-without-fruit-judged-in-wisdom-of-solomon-sirach-and-1-enoch |
| 3799 | 21:18 → micah 7:1 | PARTIAL | phrase |  |  | matthew-21-the-fig-tree-withered |
| 3800 | 21:18 → joel 1:7 | PARTIAL | phrase |  |  | leaves-without-fruit-judged-in-wisdom-of-solomon-sirach-and-1-enoch |
| 3801 | 21:18 → isaiah 5:1 | BARE | none | jargon:substance; chain:vineyard-fig-substance; label-like |  | matthew-21-the-fig-tree-withered |
| 3802 | 21:21 → matthew 17:20 | BARE | none | jargon:substance; chain:mustard-seed-faith; label-like | 3585(ma-rev) | matthew-21-the-fig-tree-withered |
| 3803 | 21:21 → psalms 46:2 | PARTIAL | phrase |  |  | leaves-without-fruit-judged-in-wisdom-of-solomon-sirach-and-1-enoch |
| 3804 | 21:21 → isaiah 54:10 | PARTIAL | phrase |  |  | matthew-21-the-fig-tree-withered |
| 3805 | 21:21 → john 14:13 | PARTIAL | near-not-verbatim |  |  | matthew-21-the-fig-tree-withered |
| 3806 | 21:21 → john 5:14 | BARE | none | jargon:substance; italics not from target |  | matthew-21-the-fig-tree-withered |
| 3807 | 21:23 → matthew 3:1 | BARE | none | jargon:substance; label-like |  | matthew-21-by-what-authority |
| 3808 | 21:23 → matthew 11:9 | BARE | none | chain:Eliyahu-pattern-prophet; label-like |  | matthew-21-by-what-authority |
| 3809 | 21:23 → matthew 17:5 | DOCREF | none | DOCREF:backticked thread slug; jargon:substance; chain:fathers-voice-combined-citation-davidic-servant-prophet; label-like |  | matthew-21-by-what-authority |
| 3810 | 21:23 → deuteronomy 18:15 | BARE | none | label-like |  | matthew-21-by-what-authority |
| 3811 | 21:28 → matthew 7:21 | PARTIAL | near-not-verbatim |  |  | parable-of-the-two-sons-and-the-wisdom-streams-repentance-and-hypocrisy-architecture |
| 3812 | 21:28 → matthew 12:46 | BARE | none | jargon:substance; label-like |  | parable-of-the-two-sons-and-the-wisdom-streams-repentance-and-hypocrisy-architecture |
| 3813 | 21:28 → ezekiel 33:30 | BARE | none | italics not from target |  | parable-of-the-two-sons-and-the-wisdom-streams-repentance-and-hypocrisy-architecture |
| 3814 | 21:28 → james 1:22 | PARTIAL | near-not-verbatim |  |  | parable-of-the-two-sons-and-the-wisdom-streams-repentance-and-hypocrisy-architecture |
| 3815 | 21:28 → john 2:3 | DOCREF | none | DOCREF:1234 of Truth; label-like |  | matthew-21-the-two-sons |
| 3816 | 21:33 → isaiah 5:1 | BARE | none | jargon:substance; chain:vineyard-of-Yahuah; bare-name:Yahuah; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3817 | 21:33 → psalms 80:8 | BARE | none | jargon:substance; chain:vine-out-of-Egypt; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3818 | 21:33 → jeremiah 2:21 | PARTIAL | near-not-verbatim |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3819 | 21:33 → ezekiel 15:1 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3820 | 21:33 → ezekiel 19:10 | BARE | none | jargon:substance; chain:mother-as-vine; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3821 | 21:35 → jeremiah 7:25 | PARTIAL | phrase |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3822 | 21:35 → jeremiah 25:4 | PARTIAL | near-not-verbatim |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3823 | 21:35 → 2-chronicles 24:20 | BARE | none | chain:Zecharyah-ben-Yehoyada; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3824 | 21:35 → jeremiah 26:20 | BARE | none | label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3825 | 21:35 → jeremiah 38:6 | BARE | none | label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3826 | 21:35 → nehemiah 9:26 | PARTIAL | near-not-verbatim |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3827 | 21:35 → 1-kings 19:10 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3828 | 21:35 → 1-kings 19:14 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3829 | 21:38 → isaiah 53:1 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3830 | 21:38 → psalms 2:1 | BARE | none | jargon:substance; chain:Father-Son-anointed; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3831 | 21:38 → daniel 9:26 | PARTIAL | near-not-verbatim |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3832 | 21:38 → hebrews 13:12 | PARTIAL | phrase |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3833 | 21:38 → acts 7:51 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3834 | 21:42 → psalms 118:22 | BARE | none | label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3835 | 21:42 → isaiah 28:16 | PARTIAL | phrase |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3836 | 21:42 → isaiah 8:14 | BARE | none | jargon:substance; chain:stone-of-stumbling; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3837 | 21:42 → daniel 2:34 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3838 | 21:42 → daniel 2:44 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3839 | 21:42 → acts 4:11 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3840 | 21:42 → romans 9:33 | BARE | none | label-like |  | matthew-21-the-wicked-husbandmen-and-the-stone |
| 3841 | 21:42 → ephesians 2:20 | PARTIAL | phrase |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3842 | 21:42 → 1-peter 2:4 | PARTIAL | phrase |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3843 | 21:43 → matthew 19:28 | BARE | none | jargon:substance; chain:twelve-thrones-twelve-tribes-restoration; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3844 | 21:43 → 1-peter 2:9 | BARE | none | italics not from target |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3845 | 21:43 → hosea 1:9 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3846 | 21:43 → hosea 2:23 | BARE | none | italics not from target |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3847 | 21:43 → isaiah 11:11 | BARE | none | chain:gathering-of-the-twelve-tribes; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3848 | 21:43 → jeremiah 31:31 | BARE | none | label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3849 | 21:43 → ezekiel 36:26 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3850 | 21:43 → ezekiel 37:15 | BARE | none | jargon:substance; chain:two-sticks-becoming-one; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3851 | 21:43 → ephesians 2:20 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3852 | 21:43 → revelation 7:4 | BARE | none | chain:twelve-tribes-of-Yashar'el; bare-name:Yashar'el; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3853 | 21:43 → revelation 21:12 | BARE | none | label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3854 | 21:43 → matthew 7:15 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3855 | 21:43 → john 15:1 | BARE | none | jargon:substance; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3856 | 21:43 → james 2:14 | BARE | none | jargon:substance; chain:faith-and-works; label-like |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3857 | 21:43 → revelation 22:14 | PARTIAL | phrase |  |  | wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning |
| 3858 | 21:44 → daniel 2:34 | BARE | none | jargon:substance; chain:stone-cut-without-hands-grinding-to-powder; label-like |  | matthew-21-the-wicked-husbandmen-and-the-stone |
| 3859 | 21:44 → isaiah 8:14 | BARE | none | jargon:substance; chain:stone-of-stumbling-substance; label-like |  | matthew-21-the-wicked-husbandmen-and-the-stone |
| 3860 | 21:44 → isaiah 60:12 | PARTIAL | near-not-verbatim |  |  | matthew-21-the-wicked-husbandmen-and-the-stone |
| 3861 | 21:45 → matthew 26:3 | BARE | none | jargon:substance; label-like |  | matthew-21-the-wicked-husbandmen-and-the-stone |
| 3862 | 21:45 → john 11:47 | BARE | none | jargon:substance; label-like |  | matthew-21-the-wicked-husbandmen-and-the-stone |
| 3863 | 21:45 → john 12:42 | BARE | none | italics not from target |  | matthew-21-the-wicked-husbandmen-and-the-stone |

### Matthew 22 (62 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3864 | 22:1 → isaiah 25:6 | BARE | none | jargon:substance; chain:Tanakh-Messianic-banquet; label-like |  | the-wedding-feast-and-the-garments-of-the-righteous-in-2-esdras-and-wisdom-of-solomon |
| 3865 | 22:1 → isaiah 55:1 | BARE | none | jargon:substance; label-like |  | matthew-22-the-wedding-feast |
| 3866 | 22:1 → isaiah 61:10 | BARE | none | jargon:substance; chain:garments-of-salvation/robe-of-righteousness; label-like |  | matthew-22-the-wedding-feast |
| 3867 | 22:1 → revelation 19:6 | BARE | none | chain:marriage-of-the-Lamb; label-like |  | matthew-22-the-wedding-feast |
| 3868 | 22:7 → matthew 23:38 | PARTIAL | phrase |  | 3989(ma-rev) | matthew-22-the-wedding-feast |
| 3869 | 22:7 → matthew 24:1 | BARE | none | label-like |  | matthew-22-the-wedding-feast |
| 3870 | 22:7 → jeremiah 7:1 | BARE | none | label-like |  | matthew-22-the-wedding-feast |
| 3871 | 22:7 → isaiah 10:5 | BARE | none | bare-name:Yahuah; label-like |  | matthew-22-the-wedding-feast |
| 3872 | 22:11 → isaiah 61:10 | BARE | none | jargon:substance; chain:garments-of-salvation; label-like |  | the-wedding-feast-and-the-garments-of-the-righteous-in-2-esdras-and-wisdom-of-solomon |
| 3873 | 22:11 → isaiah 64:6 | PARTIAL | phrase |  |  | the-wedding-feast-and-the-garments-of-the-righteous-in-2-esdras-and-wisdom-of-solomon |
| 3874 | 22:11 → zechariah 3:3 | BARE | none | jargon:substance; chain:Yehoshua-the-high-priest; label-like |  | the-wedding-feast-and-the-garments-of-the-righteous-in-2-esdras-and-wisdom-of-solomon |
| 3875 | 22:11 → revelation 19:8 | PARTIAL | phrase |  |  | the-wedding-feast-and-the-garments-of-the-righteous-in-2-esdras-and-wisdom-of-solomon |
| 3876 | 22:11 → revelation 3:5 | PARTIAL | phrase |  |  | the-wedding-feast-and-the-garments-of-the-righteous-in-2-esdras-and-wisdom-of-solomon |
| 3877 | 22:11 → matthew 7:21 | BARE | none | italics not from target |  | the-wedding-feast-and-the-garments-of-the-righteous-in-2-esdras-and-wisdom-of-solomon |
| 3878 | 22:14 → matthew 20:16 | PARTIAL | whole-elided |  | 3726(ma-rev) | matthew-22-the-wedding-feast |
| 3879 | 22:14 → isaiah 6:9 | DOCREF | none | DOCREF:Red Line; chain:cause-and-effect-of-hearing; label-like |  | matthew-22-the-wedding-feast |
| 3880 | 22:14 → revelation 17:14 | PARTIAL | phrase |  |  | matthew-22-the-wedding-feast |
| 3881 | 22:21 → genesis 1:26 | BARE | none | jargon:substance; chain:image-of-Elohim; bare-name:Elohim; label-like |  | render-unto-caesar-and-the-image-of-elohim-stamped-on-man-in-sirach-and-wisdom-of-solomon |
| 3882 | 22:21 → romans 13:1 | BARE | none | chain:Pauline-apostolic-restatement; label-like |  | render-unto-caesar-and-the-image-of-elohim-stamped-on-man-in-sirach-and-wisdom-of-solomon |
| 3883 | 22:21 → 1-peter 2:13 | BARE | none | chain:Kefa-apostolic-restatement; label-like |  | render-unto-caesar-and-the-image-of-elohim-stamped-on-man-in-sirach-and-wisdom-of-solomon |
| 3884 | 22:21 → acts 5:29 | PARTIAL | phrase |  |  | render-unto-caesar-and-the-image-of-elohim-stamped-on-man-in-sirach-and-wisdom-of-solomon |
| 3885 | 22:23 → deuteronomy 25:5 | BARE | none | jargon:substance; label-like |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3886 | 22:23 → genesis 38:1 | BARE | none | jargon:substance; bare-name:Yahudah; label-like |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3887 | 22:23 → ruth 4:1 | BARE | none | jargon:substance; chain:kinsman-redeemer-substance; label-like |  | matthew-22-the-resurrection-and-the-sadducees |
| 3888 | 22:23 → acts 23:8 | BARE | none | jargon:substance; chain:Sadducean-no-resurrection-no-angels-no-spirit; label-like |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3889 | 22:29 → john 5:39 | PARTIAL | whole-elided |  |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3890 | 22:29 → 2-timothy 3:15 | BARE | none | italics not from target |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3891 | 22:30 → genesis 6:1 | BARE | none | jargon:substance; chain:fallen-Bene-Elohim; bare-name:Elohim; label-like |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3892 | 22:30 → jude 1:6 | PARTIAL | phrase |  |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3893 | 22:30 → 1-corinthians 6:3 | PARTIAL | near-not-verbatim |  |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3894 | 22:31 → exodus 3:6 | BARE | none | label-like |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3895 | 22:31 → daniel 12:2 | BARE | none | jargon:substance; label-like |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3896 | 22:31 → isaiah 26:19 | PARTIAL | near-not-verbatim |  |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3897 | 22:31 → hosea 13:14 | PARTIAL | near-not-verbatim |  |  | matthew-22-the-resurrection-and-the-sadducees |
| 3898 | 22:31 → job 19:25 | PARTIAL | near-not-verbatim |  |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3899 | 22:31 → ezekiel 37:1 | BARE | none | jargon:substance; chain:valley-of-dry-bones; label-like |  | matthew-22-the-resurrection-and-the-sadducees |
| 3900 | 22:31 → psalms 16:9 | BARE | none | italics not from target |  | the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream |
| 3901 | 22:37 → deuteronomy 6:4 | BARE | none | label-like |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3902 | 22:37 → leviticus 19:18 | BARE | none | label-like |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3903 | 22:37 → leviticus 19:34 | BARE | none | jargon:substance; chain:stranger-as-yourself; label-like |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3904 | 22:37 → deuteronomy 11:1 | PARTIAL | phrase |  |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3905 | 22:37 → deuteronomy 30:6 | BARE | none | jargon:substance; chain:Father-circumcising-the-heart; label-like |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3906 | 22:37 → micah 6:8 | PARTIAL | phrase |  |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3907 | 22:37 → hosea 6:6 | PARTIAL | phrase |  |  | matthew-22-the-great-commandment |
| 3908 | 22:40 → matthew 7:12 | PARTIAL | phrase |  |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3909 | 22:40 → romans 13:8 | BARE | none | italics not from target |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3910 | 22:40 → galatians 5:14 | PARTIAL | phrase |  |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3911 | 22:40 → james 2:8 | PARTIAL | phrase |  |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3912 | 22:40 → john 4:7 | BARE | none | jargon:substance; chain:love-of-Elohim-and-the-brother; bare-name:Elohim; label-like |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3913 | 22:40 → john 5:2 | BARE | none | italics not from target |  | love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon |
| 3914 | 22:41 → psalms 110:1 | BARE | none | label-like |  | the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables |
| 3915 | 22:41 → psalms 110:4 | BARE | none | jargon:substance; chain:priestly-Melek-Tsadiq; label-like |  | matthew-22-davids-lord |
| 3916 | 22:41 → psalms 2:7 | BARE | none | jargon:substance; chain:Davidic-Royal-Son; label-like |  | the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables |
| 3917 | 22:41 → 2-samuel 7:12 | BARE | none | label-like |  | matthew-22-davids-lord |
| 3918 | 22:41 → isaiah 9:6 | PARTIAL | phrase |  |  | the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables |
| 3919 | 22:41 → isaiah 11:1 | BARE | none | jargon:substance; chain:rod-of-Yishai; label-like |  | matthew-22-davids-lord |
| 3920 | 22:41 → jeremiah 23:5 | BARE | none | italics not from target |  | the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables |
| 3921 | 22:41 → daniel 7:13 | DOCREF | phrase | DOCREF:Red Line; jargon:substance |  | the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables |
| 3922 | 22:41 → matthew 26:64 | BARE | none | jargon:substance; label-like | 3010(ma-rev,live) | the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables |
| 3923 | 22:41 → acts 2:34 | BARE | none | jargon:substance; chain:Kefa's-Pentecost-substance; label-like |  | the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables |
| 3924 | 22:41 → hebrews 1:3 | BARE | none | jargon:substance; label-like |  | the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables |
| 3925 | 22:41 → hebrews 1:13 | BARE | none | jargon:substance; label-like |  | the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables |

### Matthew 23 (70 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3926 | 23:2 → deuteronomy 17:8 | BARE | none | jargon:substance; chain:priestly-and-judicial-authority; label-like |  | matthew-23-the-seat-of-moses-torah-witnesses |
| 3927 | 23:2 → malachi 2:7 | PARTIAL | phrase |  |  | matthew-23-the-seat-of-moses-prophets-and-histories |
| 3928 | 23:4 → matthew 11:28 | BARE | none | italics not from target | 2748(ma-rev) | matthew-23-the-seat-of-moses-gospel-parallels |
| 3929 | 23:4 → acts 15:10 | PARTIAL | phrase |  |  | matthew-23-the-seat-of-moses-other-witnesses |
| 3930 | 23:5 → exodus 13:9 | BARE | none | jargon:substance; label-like |  | matthew-23-the-seat-of-moses-torah-witnesses |
| 3931 | 23:5 → exodus 13:16 | BARE | none | jargon:substance; label-like |  | matthew-23-the-seat-of-moses-torah-witnesses |
| 3932 | 23:5 → numbers 15:38 | BARE | none | jargon:substance; label-like |  | matthew-23-the-seat-of-moses-torah-witnesses |
| 3933 | 23:5 → deuteronomy 22:12 | BARE | none | jargon:substance; label-like |  | the-pride-and-religious-status-architecture-in-sirach |
| 3934 | 23:5 → matthew 9:20 | BARE | none | jargon:substance; chain:King's-own-hem-of-the-garment; label-like |  | matthew-23-the-seat-of-moses-gospel-parallels |
| 3935 | 23:5 → matthew 14:36 | BARE | none | jargon:substance; label-like |  | matthew-23-the-seat-of-moses-gospel-parallels |
| 3936 | 23:8 → isaiah 63:16 | PARTIAL | near-not-verbatim |  |  | matthew-23-the-seat-of-moses-prophets-and-histories |
| 3937 | 23:8 → isaiah 64:8 | BARE | none | italics not from target |  | matthew-23-the-seat-of-moses-prophets-and-histories |
| 3938 | 23:8 → deuteronomy 32:6 | PARTIAL | near-not-verbatim |  |  | matthew-23-the-seat-of-moses-torah-witnesses |
| 3939 | 23:8 → 1-corinthians 4:15 | PARTIAL | near-not-verbatim | jargon:substance; chain:does-NOT-substantially-overturn/substantial-substance-of-the-substance-of-the-substantial-substance-of-Pauline-subst |  | matthew-23-the-seat-of-moses-other-witnesses |
| 3940 | 23:11 → matthew 18:1 | BARE | none | jargon:substance; chain:greatness-as-child; label-like |  | the-pride-and-religious-status-architecture-in-sirach |
| 3941 | 23:11 → matthew 20:25 | BARE | none | jargon:substance; chain:kingdom-citizens-greatness-as-servant; label-like |  | the-pride-and-religious-status-architecture-in-sirach |
| 3942 | 23:11 → james 4:6 | BARE | none | italics not from target |  | the-pride-and-religious-status-architecture-in-sirach |
| 3943 | 23:11 → james 4:10 | PARTIAL | phrase |  |  | the-pride-and-religious-status-architecture-in-sirach |
| 3944 | 23:11 → 1-peter 5:5 | BARE | none | chain:Kefa-apostolic-restatement; label-like |  | the-pride-and-religious-status-architecture-in-sirach |
| 3945 | 23:13 → luke 11:52 | PARTIAL | near-not-verbatim |  | 6810(lu-rev,live) | the-corrupted-priesthood-and-false-credentialing-in-testaments-of-levi-and-wisdom-stream |
| 3946 | 23:15 → galatians 1:6 | BARE | none | jargon:substance; label-like |  | the-corrupted-priesthood-and-false-credentialing-in-testaments-of-levi-and-wisdom-stream |
| 3947 | 23:15 → galatians 3:1 | DOCREF | none | DOCREF:voice skill/the framework; jargon:substance; chain:skill's-framework-deep; label-like |  | the-corrupted-priesthood-and-false-credentialing-in-testaments-of-levi-and-wisdom-stream |
| 3948 | 23:15 → acts 15:1 | BARE | none | jargon:substance; chain:Pharisaic-Judaizer-substance; label-like |  | the-corrupted-priesthood-and-false-credentialing-in-testaments-of-levi-and-wisdom-stream |
| 3949 | 23:15 → acts 15:5 | BARE | none | jargon:substance; chain:Pharisaic-Judaizer-substance; label-like |  | the-corrupted-priesthood-and-false-credentialing-in-testaments-of-levi-and-wisdom-stream |
| 3950 | 23:15 → acts 15:10 | PARTIAL | near-not-verbatim |  |  | the-corrupted-priesthood-and-false-credentialing-in-testaments-of-levi-and-wisdom-stream |
| 3951 | 23:16 → matthew 5:33 | BARE | none | jargon:substance; italics not from target | 2673(ma-rev) | swearing-and-the-faithful-yes-and-nay-in-sirach |
| 3952 | 23:16 → leviticus 19:12 | PARTIAL | near-not-verbatim |  |  | swearing-and-the-faithful-yes-and-nay-in-sirach |
| 3953 | 23:16 → numbers 30:2 | BARE | none | jargon:substance; label-like |  | swearing-and-the-faithful-yes-and-nay-in-sirach |
| 3954 | 23:16 → deuteronomy 23:21 | BARE | none | jargon:substance; label-like |  | swearing-and-the-faithful-yes-and-nay-in-sirach |
| 3955 | 23:16 → james 5:12 | PARTIAL | phrase |  |  | swearing-and-the-faithful-yes-and-nay-in-sirach |
| 3956 | 23:23 → micah 6:8 | PARTIAL | phrase |  |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3957 | 23:23 → hosea 6:6 | PARTIAL | phrase |  |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3958 | 23:23 → isaiah 1:11 | BARE | none | italics not from target |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3959 | 23:23 → amos 5:21 | BARE | none | italics not from target |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3960 | 23:23 → zechariah 7:8 | BARE | none | italics not from target |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3961 | 23:23 → deuteronomy 14:22 | BARE | none | jargon:substance; label-like |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3962 | 23:23 → leviticus 27:30 | BARE | none | jargon:substance; label-like |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3963 | 23:25 → matthew 15:10 | BARE | none | jargon:substance; label-like |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3964 | 23:25 → mark 7:1 | BARE | none | jargon:substance; label-like |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3965 | 23:27 → numbers 19:11 | BARE | none | jargon:substance; label-like |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3966 | 23:27 → ezekiel 13:10 | PARTIAL | near-not-verbatim |  |  | the-double-heart-and-two-faces-in-sirach-testaments-of-asher-and-wisdom-of-solomon |
| 3967 | 23:29 → jeremiah 7:25 | PARTIAL | phrase |  |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3968 | 23:29 → jeremiah 25:4 | PARTIAL | near-not-verbatim |  |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3969 | 23:29 → nehemiah 9:26 | PARTIAL | near-not-verbatim |  |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3970 | 23:29 → acts 7:51 | BARE | none | jargon:substance; label-like |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3971 | 23:29 → genesis 15:16 | PARTIAL | phrase | jargon:substance; chain:measure-being-filled |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3972 | 23:29 → deuteronomy 32:34 | PARTIAL | phrase | jargon:substance |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3973 | 23:29 → 1-thessalonians 2:14 | BARE | none | italics not from target |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3974 | 23:33 → matthew 3:7 | PARTIAL | phrase | jargon:substance | 2635(ma-rev) | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3975 | 23:33 → matthew 12:34 | PARTIAL | phrase | jargon:substance |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3976 | 23:33 → genesis 3:15 | BARE | none | jargon:substance; chain:seed-of-the-serpent; label-like |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3977 | 23:33 → john 8:44 | PARTIAL | near-not-verbatim |  |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3978 | 23:34 → genesis 4:8 | BARE | none | label-like |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3979 | 23:34 → 2-chronicles 24:20 | BARE | none | chain:Zecharyah-ben-Yehoyada; label-like |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3980 | 23:34 → zechariah 1:1 | BARE | none | label-like |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3981 | 23:34 → luke 11:49 | BARE | none | label-like |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3982 | 23:34 → hebrews 11:35 | BARE | none | italics not from target |  | matthew-23-the-blood-of-the-prophets |
| 3983 | 23:37 → deuteronomy 32:11 | BARE | none | jargon:substance; chain:eagle-and-her-young; label-like |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3984 | 23:37 → ruth 2:12 | PARTIAL | near-not-verbatim |  |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3985 | 23:37 → isaiah 31:5 | PARTIAL | near-not-verbatim |  |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3986 | 23:38 → jeremiah 12:7 | PARTIAL | near-not-verbatim |  |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3987 | 23:38 → jeremiah 22:5 | PARTIAL | phrase |  |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3988 | 23:38 → matthew 24:1 | BARE | none | label-like | 4000(ma-rev) | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3989 | 23:38 → matthew 22:7 | PARTIAL | phrase |  | 3868(ma-rev) | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3990 | 23:39 → psalms 118:26 | BARE | none | label-like |  | matthew-23-jerusalem-and-the-gathering-hen |
| 3991 | 23:39 → matthew 21:9 | BARE | none | jargon:substance; label-like |  | matthew-23-jerusalem-and-the-gathering-hen |
| 3992 | 23:39 → matthew 21:15 | BARE | none | jargon:substance; chain:children-in-the-Temple; label-like |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3993 | 23:39 → zechariah 12:10 | PARTIAL | phrase |  |  | the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras |
| 3994 | 23:39 → zechariah 13:8 | BARE | none | jargon:substance; chain:surviving-third-substance; label-like |  | matthew-23-jerusalem-and-the-gathering-hen |
| 3995 | 23:39 → romans 11:25 | BARE | none | italics not from target |  | matthew-23-jerusalem-and-the-gathering-hen |

### Matthew 24 (92 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3996 | 24:1 → jeremiah 7:1 | BARE | none | label-like |  | matthew-24-the-temple-torn-down-and-the-question |
| 3997 | 24:1 → jeremiah 26:6 | BARE | none | jargon:substance; chain:Tanakh-Temple-destruction; label-like |  | matthew-24-the-temple-torn-down-and-the-question |
| 3998 | 24:1 → jeremiah 26:18 | BARE | none | jargon:substance; chain:Tanakh-Temple-destruction; label-like |  | matthew-24-the-temple-torn-down-and-the-question |
| 3999 | 24:1 → micah 3:12 | PARTIAL | near-not-verbatim |  |  | matthew-24-the-temple-torn-down-and-the-question |
| 4000 | 24:1 → matthew 23:38 | FULL | whole | no citation,no prose | 3988(ma-rev) | matthew-24-the-temple-torn-down-and-the-question |
| 4001 | 24:1 → luke 19:41 | BARE | none | jargon:substance; chain:wept-over-Yerushalayim; label-like |  | matthew-24-the-temple-torn-down-and-the-question |
| 4002 | 24:3 → zechariah 14:4 | PARTIAL | phrase |  |  | the-mount-of-olives-vision-and-the-gathering-of-the-tribes-in-testaments-of-naphtali-and-asher |
| 4003 | 24:3 → mark 13:3 | BARE | none | label-like |  | matthew-24-the-temple-torn-down-and-the-question |
| 4004 | 24:3 → luke 21:7 | BARE | none | label-like |  | matthew-24-the-temple-torn-down-and-the-question |
| 4005 | 24:5 → isaiah 19:2 | BARE | none | chain:of-substantial-wars; label-like |  | matthew-24-the-beginning-of-sorrows |
| 4006 | 24:5 → zechariah 14:13 | BARE | none | chain:of-substantial-judgment; label-like |  | matthew-24-the-beginning-of-sorrows |
| 4007 | 24:9 → matthew 10:22 | BARE | none | jargon:substance; label-like |  | matthew-24-the-beginning-of-sorrows |
| 4008 | 24:9 → matthew 7:23 | DOCREF | none | DOCREF:backticked thread slug; jargon:substance; chain:lord-lord-and-torahlessness/substantial-substance-of-the-direct-anchor; italics not f |  | matthew-24-the-beginning-of-sorrows |
| 4009 | 24:9 → john 2:18 | BARE | none | jargon:substance; italics not from target |  | matthew-24-the-beginning-of-sorrows |
| 4010 | 24:9 → 2-thessalonians 2:3 | PARTIAL | phrase | jargon:substance; chain:substantial-falling-away/substantial-mystery-of-iniquity-substance |  | matthew-24-the-beginning-of-sorrows |
| 4011 | 24:9 → 2-thessalonians 2:7 | BARE | none | jargon:substance; chain:substantial-falling-away/substantial-mystery-of-iniquity-substance; italics not from target |  | matthew-24-the-beginning-of-sorrows |
| 4012 | 24:9 → 2-timothy 3:1 | PARTIAL | phrase |  |  | matthew-24-the-beginning-of-sorrows |
| 4013 | 24:9 → isaiah 60:1 | PARTIAL | near-not-verbatim |  |  | matthew-24-the-beginning-of-sorrows |
| 4014 | 24:9 → isaiah 66:18 | BARE | none | italics not from target |  | matthew-24-the-beginning-of-sorrows |
| 4015 | 24:15 → daniel 9:27 | BARE | none | label-like |  | matthew-24-the-abomination-of-desolation |
| 4016 | 24:15 → daniel 12:1 | PARTIAL | phrase |  |  | matthew-24-the-abomination-of-desolation |
| 4017 | 24:15 → luke 21:20 | BARE | none | jargon:substance; chain:Yerushalayim-encircled-substance; label-like |  | matthew-24-the-abomination-of-desolation |
| 4018 | 24:15 → 2-thessalonians 2:3 | BARE | none | jargon:substance; chain:man-of-sin-substance; label-like |  | matthew-24-the-abomination-of-desolation |
| 4019 | 24:15 → revelation 11:1 | BARE | none | jargon:substance; chain:forty-two-months; label-like |  | matthew-24-the-abomination-of-desolation |
| 4020 | 24:15 → revelation 13:5 | BARE | none | jargon:substance; label-like |  | matthew-24-the-abomination-of-desolation |
| 4021 | 24:23 → deuteronomy 13:1 | BARE | none | jargon:substance; label-like |  | matthew-24-false-christs-and-the-lightning |
| 4022 | 24:23 → job 39:30 | PARTIAL | phrase |  |  | matthew-24-false-christs-and-the-lightning |
| 4023 | 24:23 → isaiah 56:9 | PARTIAL | near-not-verbatim |  |  | matthew-24-false-christs-and-the-lightning |
| 4024 | 24:23 → hosea 8:1 | PARTIAL | near-not-verbatim |  |  | matthew-24-false-christs-and-the-lightning |
| 4025 | 24:23 → revelation 19:17 | BARE | none | chain:supper-of-the-great-Elohim; bare-name:Elohim; label-like |  | matthew-24-false-christs-and-the-lightning |
| 4026 | 24:23 → luke 17:23 | BARE | none | jargon:substance; label-like |  | matthew-24-false-christs-and-the-lightning |
| 4027 | 24:29 → isaiah 13:10 | BARE | none | label-like |  | matthew-24-the-coming-and-the-gathering |
| 4028 | 24:29 → isaiah 24:23 | PARTIAL | phrase |  |  | matthew-24-the-coming-and-the-gathering |
| 4029 | 24:29 → isaiah 34:4 | PARTIAL | phrase |  |  | matthew-24-the-coming-and-the-gathering |
| 4030 | 24:29 → joel 2:10 | BARE | none | italics not from target |  | matthew-24-the-coming-and-the-gathering |
| 4031 | 24:29 → joel 2:31 | PARTIAL | phrase |  |  | the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras |
| 4032 | 24:29 → joel 3:15 | PARTIAL | phrase |  |  | matthew-24-the-coming-and-the-gathering |
| 4033 | 24:29 → ezekiel 32:7 | PARTIAL | phrase |  |  | matthew-24-the-coming-and-the-gathering |
| 4034 | 24:29 → amos 8:9 | PARTIAL | phrase |  |  | matthew-24-the-coming-and-the-gathering |
| 4035 | 24:29 → micah 3:6 | PARTIAL | phrase |  |  | the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras |
| 4036 | 24:29 → zephaniah 1:14 | BARE | none | italics not from target |  | matthew-24-the-coming-and-the-gathering |
| 4037 | 24:29 → revelation 6:12 | BARE | none | label-like |  | the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras |
| 4038 | 24:29 → revelation 8:12 | BARE | none | label-like |  | matthew-24-the-coming-and-the-gathering |
| 4039 | 24:29 → acts 2:19 | BARE | none | chain:Kefa's-Pentecost-citation; label-like |  | the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras |
| 4040 | 24:30 → daniel 7:13 | DOCREF | phrase | DOCREF:Red Line |  | the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras |
| 4041 | 24:30 → zechariah 12:10 | PARTIAL | phrase |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4042 | 24:30 → revelation 1:7 | PARTIAL | near-not-verbatim |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4043 | 24:30 → revelation 14:14 | DOCREF | phrase | DOCREF:Red Line; chain:harvest-of-the-earth |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4044 | 24:30 → revelation 19:11 | BARE | none | chain:white-horse-coming; label-like |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4045 | 24:30 → psalms 104:3 | PARTIAL | near-not-verbatim |  |  | the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras |
| 4046 | 24:30 → isaiah 19:1 | PARTIAL | near-not-verbatim |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4047 | 24:30 → nahum 1:3 | PARTIAL | near-not-verbatim |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4048 | 24:31 → deuteronomy 30:4 | PARTIAL | near-not-verbatim |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4049 | 24:31 → isaiah 11:11 | BARE | none | label-like |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4050 | 24:31 → isaiah 27:13 | PARTIAL | phrase |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4051 | 24:31 → isaiah 43:5 | PARTIAL | near-not-verbatim |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4052 | 24:31 → isaiah 56:8 | PARTIAL | near-not-verbatim |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4053 | 24:31 → jeremiah 31:8 | BARE | none | chain:gathering-from-the-north-country; label-like |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4054 | 24:31 → ezekiel 37:21 | PARTIAL | phrase |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4055 | 24:31 → leviticus 23:23 | BARE | none | jargon:substance; label-like |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4056 | 24:31 → numbers 29:1 | BARE | none | jargon:substance; label-like |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4057 | 24:31 → 1-thessalonians 4:13 | PARTIAL | whole-not-verbatim |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4058 | 24:31 → 1-corinthians 15:51 | FULL | whole |  |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4059 | 24:31 → revelation 7:1 | BARE | none | label-like |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4060 | 24:31 → revelation 14:1 | BARE | none | label-like |  | the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables |
| 4061 | 24:32 → matthew 5:18 | PARTIAL | phrase |  |  | matthew-24-the-fig-tree-parable |
| 4062 | 24:32 → mark 13:31 | BARE | none | label-like |  | matthew-24-the-fig-tree-parable |
| 4063 | 24:32 → psalms 102:25 | BARE | none | italics not from target |  | matthew-24-the-fig-tree-parable |
| 4064 | 24:32 → isaiah 40:8 | FULL | whole | no citation,no prose |  | matthew-24-the-fig-tree-parable |
| 4065 | 24:32 → isaiah 51:6 | PARTIAL | phrase |  |  | matthew-24-the-fig-tree-parable |
| 4066 | 24:36 → matthew 20:23 | PARTIAL | phrase | jargon:grid; chain:Son's-eternal-submission |  | matthew-24-the-day-and-hour-and-the-days-of-noach-gospel-parallels |
| 4067 | 24:36 → mark 13:32 | BARE | none | label-like | 4967(ma-rev,live) | matthew-24-the-day-and-hour-and-the-days-of-noach-gospel-parallels |
| 4068 | 24:36 → acts 1:6 | BARE | none | italics not from target |  | matthew-24-the-day-and-hour-and-the-days-of-noach-apostolic-writings |
| 4069 | 24:36 → psalms 110:1 | DOCREF | none | DOCREF:backticked thread slug; jargon:substance/grid; chain:Son's-at-the-Father's-right-hand/davids-lord-and-the-formless-formed-grid-at-the |  | matthew-24-the-day-and-hour-and-the-days-of-noach-other-witnesses |
| 4070 | 24:37 → genesis 6:1 | DOCREF | none | DOCREF:Red Line; jargon:substance; chain:Watcher-Rebellion-substance/substantial-pre-flood-substance; label-like |  | the-days-of-noach-and-the-watcher-rebellion-judgment-pattern-in-1-enoch-and-jubilees |
| 4071 | 24:37 → genesis 7:1 | BARE | none | jargon:substance; chain:substantial-flood-substance; label-like |  | the-days-of-noach-and-the-watcher-rebellion-judgment-pattern-in-1-enoch-and-jubilees |
| 4072 | 24:37 → 2-peter 2:5 | PARTIAL | near-not-verbatim |  |  | the-days-of-noach-and-the-watcher-rebellion-judgment-pattern-in-1-enoch-and-jubilees |
| 4073 | 24:37 → 2-peter 3:3 | BARE | none | jargon:substance; chain:at-the-substantial-substance/substantial-substance-of-the-substantial-substance-of-the-substantial-substance; label- |  | matthew-24-the-day-and-hour-and-the-days-of-noach-apostolic-writings |
| 4074 | 24:37 → luke 17:26 | BARE | none | jargon:substance; chain:days-of-Lot-substance; label-like | 7076(lu-rev,live) | the-days-of-noach-and-the-watcher-rebellion-judgment-pattern-in-1-enoch-and-jubilees |
| 4075 | 24:40 → luke 17:34 | BARE | none | label-like |  | matthew-24-the-day-and-hour-and-the-days-of-noach-gospel-parallels |
| 4076 | 24:40 → matthew 13:30 | DOCREF | none | DOCREF:Red Line; jargon:substance; chain:post-harvest-sifting/wheat-and-tares; label-like |  | matthew-24-the-day-and-hour-and-the-days-of-noach-gospel-parallels |
| 4077 | 24:40 → matthew 13:41 | DOCREF | none | DOCREF:Red Line; jargon:substance; chain:post-harvest-sifting/wheat-and-tares; label-like |  | matthew-24-the-day-and-hour-and-the-days-of-noach-gospel-parallels |
| 4078 | 24:40 → matthew 13:47 | BARE | none | jargon:substance; label-like |  | matthew-24-the-day-and-hour-and-the-days-of-noach-gospel-parallels |
| 4079 | 24:42 → 1-thessalonians 5:1 | BARE | none | jargon:substance; chain:day-of-Yahuah-substance; bare-name:Yahuah; italics not from target |  | matthew-24-the-day-and-hour-and-the-days-of-noach-apostolic-writings |
| 4080 | 24:42 → revelation 3:3 | PARTIAL | near-not-verbatim |  |  | matthew-24-the-day-and-hour-and-the-days-of-noach-other-witnesses |
| 4081 | 24:42 → revelation 16:15 | PARTIAL | phrase |  |  | matthew-24-the-day-and-hour-and-the-days-of-noach-other-witnesses |
| 4082 | 24:42 → 2-peter 3:10 | PARTIAL | near-not-verbatim |  |  | matthew-24-the-day-and-hour-and-the-days-of-noach-apostolic-writings |
| 4083 | 24:45 → matthew 25:14 | BARE | none | jargon:substance; label-like | 2977(ma-rev,live) | the-faithful-and-wise-servant-and-the-day-of-visitation-in-sirach-and-wisdom-of-solomon |
| 4084 | 24:45 → luke 12:42 | BARE | none | label-like | 7047(lu-rev,live) | the-faithful-and-wise-servant-and-the-day-of-visitation-in-sirach-and-wisdom-of-solomon |
| 4085 | 24:45 → matthew 21:33 | BARE | none | jargon:substance; chain:stewardship-given-to-the-bringing-forth-fruit; label-like |  | the-faithful-and-wise-servant-and-the-day-of-visitation-in-sirach-and-wisdom-of-solomon |
| 4086 | 24:45 → ezekiel 34:1 | BARE | none | jargon:substance; chain:substantial-Father-substance/walks-out-against; label-like |  | the-faithful-and-wise-servant-and-the-day-of-visitation-in-sirach-and-wisdom-of-solomon |
| 4087 | 24:45 → jeremiah 23:1 | PARTIAL | phrase |  |  | the-faithful-and-wise-servant-and-the-day-of-visitation-in-sirach-and-wisdom-of-solomon |

### Matthew 25 (69 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 2939 | 25:45 → matthew 25:40 | PARTIAL | near-not-verbatim |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2940 | 25:40 → matthew 12:46 | BARE | none | italics not from target |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2941 | 25:45 → matthew 12:46 | BARE | none | italics not from target |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2942 | 25:40 → matthew 28:10 | PARTIAL | phrase |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2943 | 25:45 → matthew 28:10 | PARTIAL | phrase |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2944 | 25:40 → john 20:17 | PARTIAL | phrase |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2945 | 25:45 → john 20:17 | PARTIAL | phrase |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2946 | 25:40 → hebrews 2:11 | PARTIAL | phrase |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2947 | 25:45 → hebrews 2:11 | PARTIAL | phrase |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2948 | 25:40 → hebrews 2:16 | PARTIAL | near-not-verbatim | chain:substantial-Avrahamic-lineage |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2949 | 25:45 → hebrews 2:16 | PARTIAL | near-not-verbatim | chain:substantial-Avrahamic-lineage |  | matthew-25-the-sheep-and-the-goats-other-witnesses |
| 2950 | 25:40 → romans 8:29 | PARTIAL | phrase |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2951 | 25:45 → romans 8:29 | PARTIAL | phrase |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2952 | 25:40 → deuteronomy 17:15 | PARTIAL | near-not-verbatim | jargon:substance |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2953 | 25:45 → deuteronomy 17:15 | PARTIAL | near-not-verbatim | jargon:substance |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2954 | 25:40 → psalms 22:22 | PARTIAL | near-not-verbatim |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2955 | 25:45 → psalms 22:22 | PARTIAL | near-not-verbatim |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2956 | 25:40 → proverbs 17:17 | PARTIAL | phrase |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2957 | 25:45 → proverbs 17:17 | PARTIAL | phrase |  |  | matthew-25-the-sheep-and-the-goats-other-witnesses |
| 2958 | 25:40 → acts 9:4 | BARE | none | chain:identifies-with-his-brethren/s-persecution-of-the-assembly; label-like |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2959 | 25:45 → acts 9:4 | BARE | none | chain:identifies-with-his-brethren/s-persecution-of-the-assembly; label-like |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2960 | 25:40 → acts 22:14 | PARTIAL | near-not-verbatim | jargon:substance; chain:substantial-Tanakh-fathers-substance |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 2961 | 25:45 → acts 22:14 | PARTIAL | near-not-verbatim | jargon:substance; chain:substantial-Tanakh-fathers-substance |  | matthew-25-the-sheep-and-the-goats-other-witnesses |
| 2990 | 25:46 → matthew 25:34 | PARTIAL | phrase |  | 2991(ma-rev) | the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon |
| 2991 | 25:34 → matthew 25:46 | BARE | none | jargon:substance; chain:substantial-millennial-reign-and-beyond-substance; label-like | 2990(ma-rev) | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 2992 | 25:34 → isaiah 60:1 | PARTIAL | whole-not-verbatim |  |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 2993 | 25:46 → isaiah 60:1 | PARTIAL | whole-not-verbatim |  |  | the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon |
| 2994 | 25:34 → isaiah 66:18 | FULL | whole |  |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 2995 | 25:46 → isaiah 66:18 | FULL | whole |  |  | the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon |
| 2996 | 25:34 → zechariah 14:16 | FULL | whole |  |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 2997 | 25:46 → zechariah 14:16 | FULL | whole |  |  | the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon |
| 2998 | 25:34 → revelation 21:24 | FULL | whole |  |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 2999 | 25:46 → revelation 21:24 | FULL | whole |  |  | the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon |
| 3000 | 25:34 → revelation 22:1 | BARE | none | chain:for-the-healing-of-the-nations/leaves-of-the-tree; label-like |  | matthew-25-the-sheep-and-the-goats-revelation |
| 3001 | 25:46 → revelation 22:1 | BARE | none | chain:leaves-for-the-healing-of-the-nations/tree-of-life; label-like |  | matthew-25-the-sheep-and-the-goats-revelation |
| 3002 | 25:34 → revelation 20:4 | BARE | none | jargon:substance; chain:millennial-reign-substance; label-like |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 3003 | 25:46 → revelation 20:4 | BARE | none | jargon:substance; chain:millennial-reign-substance; label-like |  | matthew-25-the-sheep-and-the-goats-revelation |
| 3004 | 25:34 → joel 3:1 | FULL | whole |  |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 3005 | 25:46 → joel 3:1 | FULL | whole |  |  | the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon |
| 3006 | 25:34 → micah 4:1 | BARE | none | chain:flow-unto-the-mountain-of-Yahuah's-house; bare-name:Yahuah; label-like |  | matthew-25-the-sheep-and-the-goats-prophets-and-histories |
| 3007 | 25:46 → micah 4:1 | BARE | none | chain:flow-unto-the-mountain-of-Yahuah's-house; bare-name:Yahuah; label-like |  | matthew-25-the-sheep-and-the-goats-prophets-and-histories |
| 3008 | 25:34 → isaiah 2:2 | BARE | none | jargon:substance; chain:at-the-substantial-substance/to-the-Father's-house; label-like |  | matthew-25-the-sheep-and-the-goats-prophets-and-histories |
| 3009 | 25:46 → isaiah 2:2 | BARE | none | jargon:substance; chain:at-the-substantial-substance/to-the-Father's-house; label-like |  | matthew-25-the-sheep-and-the-goats-prophets-and-histories |
| 4088 | 25:1 → luke 12:35 | FULL | whole | no citation,no prose |  | matthew-25-the-ten-virgins |
| 4089 | 25:31 → zechariah 14:5 | PARTIAL | near-not-verbatim |  |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 4090 | 25:31 → deuteronomy 33:2 | PARTIAL | phrase |  |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4091 | 25:31 → 2-thessalonians 1:7 | PARTIAL | phrase |  |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4092 | 25:31 → revelation 19:11 | BARE | none | chain:King-and-the-armies-of-heaven; label-like |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4093 | 25:34 → matthew 12:46 | BARE | none | chain:those-who-do-the-will-of-the-Father; label-like |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 4094 | 25:34 → hebrews 2:11 | PARTIAL | phrase | chain:seed-of-Avraham |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 4095 | 25:34 → romans 8:29 | PARTIAL | phrase |  |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 4096 | 25:34 → isaiah 58:6 | BARE | none | jargon:substance; chain:fast-the-Father-chose; label-like |  | matthew-25-the-sheep-and-the-goats-prophets-and-histories |
| 4097 | 25:34 → isaiah 61:1 | BARE | none | jargon:substance; chain:substantial-Messianic-credential-substance; label-like |  | matthew-25-the-sheep-and-the-goats-prophets-and-histories |
| 4098 | 25:34 → job 31:16 | BARE | none | jargon:substance; chain:care-of-the-vulnerable; label-like |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 4099 | 25:34 → proverbs 19:17 | PARTIAL | near-not-verbatim |  |  | the-mercy-toward-the-poor-the-stranger-and-the-needy-as-the-criterion-of-righteousness-in-sirach-and-tobit |
| 4100 | 25:34 → deuteronomy 10:18 | BARE | none | italics not from target |  | matthew-25-the-sheep-and-the-goats-other-witnesses |
| 4101 | 25:34 → john 20:17 | PARTIAL | phrase |  |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 4102 | 25:34 → acts 9:4 | BARE | none | italics not from target |  | sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory |
| 4103 | 25:41 → revelation 20:10 | BARE | none | chain:devil-cast-into-the-lake-of-fire; label-like |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4104 | 25:41 → revelation 20:14 | BARE | none | jargon:substance; label-like |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4105 | 25:41 → 2-peter 2:4 | BARE | none | chain:angels-that-sinned; label-like |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4106 | 25:41 → jude 1:6 | BARE | none | chain:angels-which-kept-not-their-first-estate; label-like |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4107 | 25:41 → proverbs 21:13 | PARTIAL | phrase |  |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4108 | 25:41 → james 4:17 | PARTIAL | near-not-verbatim |  |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4109 | 25:41 → john 3:16 | BARE | none | jargon:substance; chain:walked-not-in-word-but-in-deed-and-in-truth; label-like |  | the-judgment-of-the-kings-and-the-mighty-cast-down-in-1-enoch-parables |
| 4110 | 25:46 → daniel 12:2 | PARTIAL | phrase |  |  | matthew-25-the-sheep-and-the-goats-prophets-and-histories |
| 4111 | 25:46 → isaiah 66:24 | PARTIAL | phrase |  |  | matthew-25-the-sheep-and-the-goats-prophets-and-histories |
| 4112 | 25:46 → revelation 20:11 | FULL | whole |  |  | the-day-of-vindication-of-the-righteous-and-the-judgment-of-the-nations-in-wisdom-of-solomon |
| 4113 | 25:46 → revelation 21:1 | BARE | none | jargon:substance; chain:new-heavens-and-new-earth; label-like |  | matthew-25-the-sheep-and-the-goats-revelation |

### Matthew 26 (67 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 3065 | 26:2 → exodus 12:1 | BARE | none | jargon:substance; chain:Tanakh-Pesach-substance; label-like |  | matthew-26-the-plot-against-yahusha-torah-witnesses |
| 3066 | 26:17 → exodus 12:1 | BARE | none | label-like |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 3067 | 26:2 → john 1:29 | PARTIAL | phrase |  |  | matthew-26-the-plot-against-yahusha-gospel-parallels |
| 3068 | 26:17 → john 1:36 | PARTIAL | phrase |  |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 3069 | 26:2 → john 19:14 | BARE | none | jargon:substance; italics not from target |  | matthew-26-the-plot-against-yahusha-gospel-parallels |
| 3070 | 26:17 → john 19:36 | PARTIAL | near-not-verbatim | jargon:substance |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 3071 | 26:2 → 1-corinthians 5:7 | PARTIAL | near-not-verbatim |  |  | matthew-26-the-plot-against-yahusha-other-witnesses |
| 3072 | 26:17 → 1-corinthians 5:7 | PARTIAL | near-not-verbatim |  |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 3073 | 26:2 → 1-peter 1:18 | BARE | none | chain:as-of-a-lamb-without-blemish-and-without-spot; label-like |  | matthew-26-the-plot-against-yahusha-other-witnesses |
| 3074 | 26:17 → 1-peter 1:18 | BARE | none | chain:as-of-a-lamb-without-blemish-and-without-spot; label-like |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 3075 | 26:2 → revelation 5:6 | BARE | none | chain:Lamb-as-it-had-been-slain; label-like |  | matthew-26-the-plot-against-yahusha-revelation |
| 3076 | 26:17 → revelation 5:12 | BARE | none | chain:Lamb-as-it-had-been-slain; label-like |  | matthew-26-the-passover-and-the-betrayer |
| 3077 | 26:2 → revelation 7:14 | BARE | none | chain:robes-washed-in-the-blood-of-the-Lamb; label-like |  | matthew-26-the-plot-against-yahusha-revelation |
| 3078 | 26:17 → revelation 7:14 | BARE | none | chain:robes-washed-in-the-blood-of-the-Lamb; label-like |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 3079 | 26:2 → revelation 12:11 | BARE | none | chain:They-overcame-him-by-the-blood-of-the-Lamb; label-like |  | matthew-26-the-plot-against-yahusha-revelation |
| 3080 | 26:17 → revelation 12:11 | BARE | none | chain:They-overcame-him-by-the-blood-of-the-Lamb; label-like |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 3081 | 26:2 → isaiah 53:7 | PARTIAL | phrase |  |  | matthew-26-the-plot-against-yahusha-other-witnesses |
| 3082 | 26:17 → isaiah 53:7 | PARTIAL | phrase |  |  | matthew-26-the-passover-and-the-betrayer |
| 3083 | 26:2 → genesis 22:8 | PARTIAL | near-not-verbatim |  |  | matthew-26-the-plot-against-yahusha-torah-witnesses |
| 3084 | 26:17 → genesis 22:8 | PARTIAL | near-not-verbatim |  |  | matthew-26-the-passover-and-the-betrayer |
| 3085 | 26:2 → revelation 19:7 | BARE | none | chain:marriage-of-the-Lamb; label-like |  | matthew-26-the-plot-against-yahusha-revelation |
| 3086 | 26:17 → revelation 19:7 | BARE | none | chain:marriage-of-the-Lamb; label-like |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 4114 | 26:1 → matthew 21:33 | BARE | none | jargon:substance; label-like |  | matthew-26-the-plot-against-yahusha-gospel-parallels |
| 4115 | 26:1 → matthew 23:34 | BARE | none | jargon:substance; label-like |  | matthew-26-the-plot-against-yahusha-gospel-parallels |
| 4116 | 26:1 → psalms 2:1 | BARE | none | italics not from target |  | matthew-26-the-plot-against-yahusha-other-witnesses |
| 4117 | 26:1 → john 11:47 | BARE | none | jargon:substance; chain:previous-substantial-counsel; label-like |  | matthew-26-the-plot-against-yahusha-gospel-parallels |
| 4118 | 26:1 → exodus 12:1 | BARE | none | jargon:substance; chain:Tanakh-Pesach-substance; label-like |  | matthew-26-the-plot-against-yahusha-torah-witnesses |
| 4119 | 26:6 → john 12:1 | BARE | none | chain:Miryam-of-Beit-Anyah-named; label-like |  | matthew-26-the-anointing-at-bethany |
| 4120 | 26:6 → luke 7:36 | BARE | none | jargon:substance; chain:different-event-substance/sinful-woman-anointing; label-like |  | matthew-26-the-anointing-at-bethany |
| 4121 | 26:6 → 1-samuel 10:1 | BARE | none | chain:anointing-of-the-king; label-like |  | matthew-26-the-anointing-at-bethany |
| 4122 | 26:6 → 1-samuel 16:13 | BARE | none | chain:anointing-of-David; label-like |  | matthew-26-the-anointing-at-bethany |
| 4123 | 26:6 → psalms 45:7 | BARE | none | italics not from target |  | matthew-26-the-anointing-at-bethany |
| 4124 | 26:6 → deuteronomy 15:11 | PARTIAL | phrase |  |  | matthew-26-the-anointing-at-bethany |
| 4125 | 26:14 → john 13:2 | BARE | none | jargon:substance; chain:walks-into-Yahudah; bare-name:Yahudah; label-like |  | thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment |
| 4126 | 26:14 → john 13:27 | BARE | none | jargon:substance; chain:walks-into-Yahudah; bare-name:Yahudah; label-like |  | thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment |
| 4127 | 26:17 → mark 14:12 | BARE | none | label-like |  | matthew-26-the-passover-and-the-betrayer |
| 4128 | 26:17 → luke 22:7 | BARE | none | label-like |  | matthew-26-the-passover-and-the-betrayer |
| 4129 | 26:17 → 1-corinthians 11:23 | BARE | none | label-like |  | matthew-26-the-passover-and-the-betrayer |
| 4130 | 26:17 → exodus 24:8 | PARTIAL | phrase |  |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 4131 | 26:17 → jeremiah 31:31 | BARE | none | label-like |  | the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees |
| 4132 | 26:17 → isaiah 53:10 | BARE | none | jargon:substance; chain:ransom-for-many; label-like |  | matthew-26-the-passover-and-the-betrayer |
| 4133 | 26:47 → mark 14:43 | BARE | none | label-like |  | matthew-26-the-arrest |
| 4134 | 26:47 → luke 22:47 | BARE | none | jargon:substance; chain:substantial-substance-of-the-King's-healing-of-the-ear; label-like |  | matthew-26-the-arrest |
| 4135 | 26:47 → john 18:2 | BARE | none | label-like |  | matthew-26-the-arrest |
| 4136 | 26:47 → proverbs 27:6 | PARTIAL | phrase |  |  | matthew-26-the-arrest |
| 4137 | 26:47 → psalms 55:12 | BARE | none | jargon:substance; label-like |  | matthew-26-the-arrest |
| 4138 | 26:47 → genesis 9:6 | PARTIAL | phrase |  |  | matthew-26-the-arrest |
| 4139 | 26:47 → zechariah 13:7 | PARTIAL | phrase |  |  | matthew-26-the-arrest |
| 4140 | 26:47 → john 10:17 | BARE | none | italics not from target |  | matthew-26-the-arrest |
| 4141 | 26:57 → mark 14:53 | BARE | none | label-like |  | matthew-26-before-the-sanhedrin |
| 4142 | 26:57 → luke 22:54 | BARE | none | label-like |  | matthew-26-before-the-sanhedrin |
| 4143 | 26:57 → luke 22:63 | BARE | none | label-like |  | matthew-26-before-the-sanhedrin |
| 4144 | 26:57 → john 18:13 | BARE | none | label-like |  | matthew-26-before-the-sanhedrin |
| 4145 | 26:57 → john 18:19 | BARE | none | label-like |  | the-elect-one-vindicated-on-the-throne-and-the-kings-condemned-in-1-enoch-46-48-62-63 |
| 4146 | 26:57 → psalms 110:1 | BARE | none | jargon:substance; chain:substantial-right-hand-substance; label-like |  | the-elect-one-vindicated-on-the-throne-and-the-kings-condemned-in-1-enoch-46-48-62-63 |
| 4147 | 26:57 → daniel 7:13 | DOCREF | none | DOCREF:Red Line; jargon:substance; chain:substantial-Son-of-Adam-coming-with-the-clouds; label-like |  | the-elect-one-vindicated-on-the-throne-and-the-kings-condemned-in-1-enoch-46-48-62-63 |
| 4148 | 26:57 → isaiah 53:7 | PARTIAL | near-not-verbatim |  |  | matthew-26-before-the-sanhedrin |
| 4149 | 26:57 → isaiah 50:6 | PARTIAL | phrase |  |  | matthew-26-before-the-sanhedrin |
| 4150 | 26:57 → deuteronomy 19:15 | BARE | none | jargon:substance; chain:substantial-Tanakh-procedural-substance-of-witnesses; label-like |  | matthew-26-before-the-sanhedrin |
| 4151 | 26:69 → mark 14:66 | BARE | none | label-like |  | matthew-26-kefas-denial |
| 4152 | 26:69 → luke 22:54 | BARE | none | chain:King's-substantial-look; label-like |  | matthew-26-kefas-denial |
| 4153 | 26:69 → john 18:15 | BARE | none | label-like |  | matthew-26-kefas-denial |
| 4154 | 26:69 → john 18:25 | BARE | none | label-like |  | matthew-26-kefas-denial |
| 4155 | 26:69 → matthew 26:33 | BARE | none | chain:substantial-prediction-of-the-denial; label-like |  | matthew-26-kefas-denial |
| 4156 | 26:69 → john 21:15 | BARE | none | jargon:substance; chain:substantial-restoration-of-Kefa; label-like |  | matthew-26-kefas-denial |
| 4157 | 26:69 → psalms 51:17 | PARTIAL | phrase |  |  | matthew-26-kefas-denial |
| 4158 | 26:69 → joel 2:12 | BARE | none | italics not from target |  | matthew-26-kefas-denial |

### Matthew 27 (37 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 4159 | 27:1 → zechariah 11:12 | BARE | none | chain:of-the-thirty-pieces-of-silver/substantial-Tanakh-anchor; label-like |  | matthew-27-judas-and-the-potters-field |
| 4160 | 27:1 → jeremiah 19:1 | BARE | none | jargon:substance; chain:substantial-potter's-field; label-like |  | the-kings-and-the-mighty-condemning-the-elect-one-and-the-elect-one-vindicated-on-the-throne-of-his-glory-in-1-enoch-parables |
| 4161 | 27:1 → jeremiah 32:6 | BARE | none | jargon:substance; chain:buying-of-the-field; label-like |  | the-kings-and-the-mighty-condemning-the-elect-one-and-the-elect-one-vindicated-on-the-throne-of-his-glory-in-1-enoch-parables |
| 4162 | 27:1 → psalms 109:8 | PARTIAL | whole | jargon:substance; no citation,no prose |  | the-kings-and-the-mighty-condemning-the-elect-one-and-the-elect-one-vindicated-on-the-throne-of-his-glory-in-1-enoch-parables |
| 4163 | 27:1 → acts 1:16 | BARE | none | jargon:substance; chain:substantial-Yahudah-substance; bare-name:Yahudah; label-like |  | matthew-27-judas-and-the-potters-field |
| 4164 | 27:1 → deuteronomy 23:18 | BARE | none | jargon:substance; chain:substantial-Tanakh-money-substance-prohibition; label-like |  | the-kings-and-the-mighty-condemning-the-elect-one-and-the-elect-one-vindicated-on-the-throne-of-his-glory-in-1-enoch-parables |
| 4165 | 27:11 → mark 15:1 | BARE | none | label-like |  | matthew-27-pilate-and-barabbas |
| 4166 | 27:11 → luke 23:1 | BARE | none | label-like |  | matthew-27-pilate-and-barabbas |
| 4167 | 27:11 → john 18:28 | BARE | none | italics not from target |  | matthew-27-pilate-and-barabbas |
| 4168 | 27:11 → isaiah 53:7 | PARTIAL | near-not-verbatim |  |  | matthew-27-pilate-and-barabbas |
| 4169 | 27:11 → deuteronomy 21:1 | BARE | none | chain:hand-washing-Tanakh-procedural; label-like |  | matthew-27-pilate-and-barabbas |
| 4170 | 27:11 → acts 3:13 | PARTIAL | phrase |  |  | matthew-27-pilate-and-barabbas |
| 4171 | 27:11 → acts 4:25 | BARE | none | jargon:substance; chain:substantial-gathering-against-the-Father's-anointed; label-like |  | matthew-27-pilate-and-barabbas |
| 4172 | 27:27 → mark 15:16 | BARE | none | label-like |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4173 | 27:27 → luke 23:26 | BARE | none | jargon:substance; chain:substantial-women-of-Yerushalayim-substance; label-like |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4174 | 27:27 → john 19:17 | BARE | none | label-like |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4175 | 27:27 → isaiah 50:6 | PARTIAL | phrase |  |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4176 | 27:27 → isaiah 53:3 | BARE | none | jargon:substance; label-like |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4177 | 27:27 → isaiah 53:7 | BARE | none | jargon:substance; label-like |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4178 | 27:27 → psalms 22:7 | BARE | none | jargon:substance; chain:casting-of-lots; label-like |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4179 | 27:27 → psalms 22:16 | BARE | none | jargon:substance; chain:casting-of-lots; label-like |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4180 | 27:27 → genesis 3:15 | BARE | none | jargon:substance; label-like |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4181 | 27:27 → genesis 3:18 | BARE | none | jargon:substance; label-like |  | matthew-27-the-mocking-and-the-crown-of-thorns |
| 4182 | 27:39 → mark 15:29 | BARE | none | italics not from target |  | matthew-27-the-crucifixion |
| 4183 | 27:39 → luke 23:35 | BARE | none | jargon:substance; chain:substantial-thief-substance; italics not from target |  | matthew-27-the-crucifixion |
| 4184 | 27:39 → john 19:25 | BARE | none | italics not from target |  | matthew-27-the-crucifixion |
| 4185 | 27:39 → psalms 22:1 | BARE | none | chain:as-a-whole/suffering-into-vindication; label-like |  | matthew-27-the-crucifixion |
| 4186 | 27:39 → psalms 69:21 | BARE | none | jargon:substance; label-like |  | matthew-27-the-crucifixion |
| 4187 | 27:39 → amos 8:9 | PARTIAL | phrase |  |  | matthew-27-the-crucifixion |
| 4188 | 27:39 → john 10:17 | PARTIAL | phrase |  |  | matthew-27-the-crucifixion |
| 4189 | 27:39 → hebrews 5:7 | PARTIAL | phrase |  |  | matthew-27-the-crucifixion |
| 4190 | 27:51 → john 19:31 | BARE | none | label-like |  | the-temple-veil-rent-and-the-way-back-into-the-most-holy-place-opened-in-2-baruch-and-testaments-xii |
| 4191 | 27:57 → mark 15:42 | BARE | none | label-like |  | matthew-27-the-burial |
| 4192 | 27:57 → luke 23:50 | BARE | none | jargon:substance; chain:substantial-substance-of-the-substantial-not-consenting-to-the-counsel; label-like |  | matthew-27-the-burial |
| 4193 | 27:57 → john 19:38 | BARE | none | label-like |  | matthew-27-the-burial |
| 4194 | 27:57 → isaiah 53:9 | PARTIAL | phrase |  |  | the-beloved-crucified-on-a-tree-descended-and-risen-and-many-of-the-righteous-ascending-with-him-in-ascension-of-isaiah |
| 4195 | 27:57 → matthew 28:11 | BARE | none | jargon:substance; chain:substantial-Resurrection-witness/substantial-Roman-watch; label-like |  | matthew-27-the-burial |

### Matthew 28 (25 orphans)

| id | ref | grade | quote | flags | dup | group |
|---|---|---|---|---|---|---|
| 4196 | 28:1 → matthew 12:38 | BARE | none | jargon:substance; chain:sign-of-Yonah-substance; label-like |  | matthew-28-the-empty-tomb |
| 4197 | 28:1 → matthew 26:32 | PARTIAL | phrase |  |  | matthew-28-the-empty-tomb |
| 4198 | 28:1 → john 20:17 | PARTIAL | phrase | jargon:substance; chain:King-identification-substance |  | the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance |
| 4199 | 28:1 → matthew 25:40 | DOCREF | none | DOCREF:S-number/FRAMEWORK-MAJOR; label-like |  | matthew-28-the-empty-tomb |
| 4200 | 28:1 → hebrews 2:11 | PARTIAL | phrase |  |  | matthew-28-the-empty-tomb |
| 4201 | 28:1 → leviticus 23:15 | BARE | none | jargon:substance; chain:Wave-Sheaf-Offering; label-like |  | matthew-28-the-empty-tomb |
| 4202 | 28:11 → matthew 27:62 | BARE | none | chain:substantial-guarding-of-the-tomb; label-like |  | the-king-resurrected-and-ascended-sending-out-the-twelve-witnessed-in-ascension-of-isaiah-11 |
| 4203 | 28:11 → acts 4:1 | BARE | none | jargon:substance; chain:substantial-Sanhedrin-substance/walking-the-substance-of-the-substantial-Resurrection-suppression; label-like |  | the-king-ascending-and-the-tribes-rising-each-over-his-tribe-in-testaments-of-the-twelve |
| 4204 | 28:11 → acts 5:17 | BARE | none | jargon:substance; chain:substantial-anti-Resurrection-narrative-substance/substantial-substance-of-the-substantial-leadership-substance; lab |  | the-king-resurrected-and-ascended-sending-out-the-twelve-witnessed-in-ascension-of-isaiah-11 |
| 4205 | 28:16 → matthew 26:32 | PARTIAL | phrase |  |  | the-king-ascending-and-the-tribes-rising-each-over-his-tribe-in-testaments-of-the-twelve |
| 4206 | 28:16 → matthew 17:1 | BARE | none | jargon:substance; label-like |  | trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid |
| 4207 | 28:16 → matthew 5:1 | BARE | none | jargon:substance; chain:Sermon-on-the-Mount; label-like |  | matthew-28-the-great-commission |
| 4208 | 28:16 → luke 24:36 | BARE | none | jargon:substance; chain:Lukan-substance-of-the-substantial-substance-of-the-substantial-substance/substantial-substance-of-the-doubting-subs |  | the-king-ascending-and-the-tribes-rising-each-over-his-tribe-in-testaments-of-the-twelve |
| 4209 | 28:16 → john 20:24 | BARE | none | jargon:substance; chain:substantial-substance-of-the-doubting-and-believing-substance; label-like |  | the-king-ascending-and-the-tribes-rising-each-over-his-tribe-in-testaments-of-the-twelve |
| 4210 | 28:16 → acts 1:15 | BARE | none | jargon:substance; chain:substantial-Matthias-substance/substantial-twelve-restored-substance; label-like |  | the-king-ascending-and-the-tribes-rising-each-over-his-tribe-in-testaments-of-the-twelve |
| 4211 | 28:18 → mark 16:14 | BARE | none | label-like |  | all-power-given-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables |
| 4212 | 28:18 → luke 24:44 | BARE | none | label-like |  | all-power-given-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables |
| 4213 | 28:18 → john 20:21 | BARE | none | label-like |  | all-power-given-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables |
| 4214 | 28:18 → psalms 110:1 | BARE | none | chain:substantial-right-hand-of-power; label-like |  | all-power-given-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables |
| 4215 | 28:18 → psalms 8:6 | BARE | none | italics not from target |  | all-power-given-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables |
| 4216 | 28:18 → matthew 1:21 | BARE | none | jargon:substance; chain:bookended-at-Matt/substantial-Yahusha-saves; bare-name:Yahusha; label-like |  | trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid |
| 4217 | 28:18 → matthew 1:23 | BARE | none | jargon:substance; chain:bookended-at-Matt/substantial-Yahusha-saves; bare-name:Yahusha; label-like |  | trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid |
| 4218 | 28:18 → matthew 5:17 | BARE | none | chain:directly-closed-by-Matt/substantial-anti-antinomian; label-like |  | teaching-them-to-observe-all-things-i-have-commanded-you-heart-torah-closing-the-anti-antinomian-bookend |
| 4219 | 28:18 → matthew 7:21 | BARE | none | jargon:substance; chain:substantial-doing-the-will-of-the-Father; label-like |  | all-power-given-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables |
| 4220 | 28:18 → john 14:15 | BARE | none | jargon:substance; chain:substantial-keeping-of-the-commandments-substance; label-like |  | teaching-them-to-observe-all-things-i-have-commanded-you-heart-torah-closing-the-anti-antinomian-bookend |
