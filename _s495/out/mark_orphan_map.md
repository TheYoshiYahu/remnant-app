# Mark orphan-card map (S495 Phase 2)

- Model: **claude-sonnet-5-5 (Sonnet 5.5)**
- Session: S495 (Phase 2), generated 2026-11-08
- Source: `/home/claude/s495/live/canon__mark.json` (read-only; nothing in `live/` was modified)
- Method: every orphan card graded by script against its own `t_text` (word-level verbatim check), `grade.py` rules below; no prose was rewritten.

## Grade rules
- **DOCREF**: the note names Red Line / voice skill / the framework / S-number / Yoshi / SUMMATION / FRAMEWORK-MAJOR / teaching corpus / Q-flag / backticked thread slug / "1234 of Truth" (token listed). Wins over every other grade.
- **BARE**: note carries a `thread:slug |` prefix, OR has no quotation of the target verse (label-like, no quotation, italics from another verse, or quotes only the source verse).
- **PARTIAL**: quotes the target as a phrase, with an ellipsis, or not verbatim to the live text; OR quotes the whole verse verbatim but carries jargon (substance, architecture, register, wisdom-stream, motif, prototype, marker, locked, grid, ...) or a 3+ segment hyphen-chain.
- **FULL**: quotes the whole target verse verbatim in italics (word-for-word against `t_text`, punctuation/case ignored) and the prose has no jargon token or hyphen-chain. `shape_gaps` notes if it lacks a citation or any prose.
- `grade_ignoring_prefix` = the grade the note body would earn without the `thread:slug |` prefix. Bare-sacred-name flags (Yahuah/Yahusha/Elohim/... without a parenthetical in the prose) are informational and do not change the grade.

## Headline counts

- Orphan cards: **169** — FULL **0**, PARTIAL **0**, BARE **164**, DOCREF **5**
- Same count if the `thread:slug |` prefix is ignored: {'FULL': 0, 'PARTIAL': 84, 'BARE': 80, 'DOCREF': 5}
- `thread:` prefix notes: 169; prefix slug names a live Mark thread: 0
- Quote kinds: {'none': 82, 'whole-not-verbatim': 7, 'near-not-verbatim': 30, 'phrase': 50}
- BARE reasons: {'prefix': 164, 'quotes source verse only': 18, 'italics not from target': 28, 'no quotation': 12, 'label-like': 22}
- Jargon tokens (cards): {'architecture': 14, 'substance': 8, 'Tanakh-source/shape': 1, 'register': 1}; cards with a 3+ hyphen-chain: 37
- DOCREF tokens: {'S-number': 3, 'Q-flag/queued': 3, 'the framework': 2, 'Red Line': 1, 'framework (other use)': 1} — 5 cards carry a house-document reference; 0 more use the bare word 'framework' only
- Cards flagged dup: **4** (0 same pair, 0 reversed within Mark, 4 reversed against a card in another Gospel file); distinct dup pairs: 4

## Per chapter

| ch | orphans | FULL | PARTIAL | BARE | DOCREF | BARE ignoring prefix | dup cards |
|---|---|---|---|---|---|---|---|
| 1 | 6 | 0 | 0 | 6 | 0 | 2 | 0 |
| 2 | 6 | 0 | 0 | 6 | 0 | 3 | 0 |
| 3 | 9 | 0 | 0 | 9 | 0 | 5 | 0 |
| 4 | 8 | 0 | 0 | 8 | 0 | 3 | 0 |
| 5 | 11 | 0 | 0 | 11 | 0 | 5 | 0 |
| 6 | 22 | 0 | 0 | 22 | 0 | 14 | 1 |
| 7 | 17 | 0 | 0 | 14 | 3 | 5 | 0 |
| 8 | 20 | 0 | 0 | 20 | 0 | 12 | 1 |
| 9 | 12 | 0 | 0 | 12 | 0 | 3 | 0 |
| 10 | 15 | 0 | 0 | 13 | 2 | 7 | 0 |
| 11 | 4 | 0 | 0 | 4 | 0 | 3 | 1 |
| 12 | 8 | 0 | 0 | 8 | 0 | 3 | 0 |
| 13 | 17 | 0 | 0 | 17 | 0 | 6 | 0 |
| 14 | 11 | 0 | 0 | 11 | 0 | 7 | 1 |
| 15 | 3 | 0 | 0 | 3 | 0 | 2 | 0 |

## DOCREF list (5 Mark cards)

| id | ref | tokens | context |
|---|---|---|---|
| 5100 | 7:6 -> isaiah 29:13 | S-number, Q-flag/queued | …s. **Q15 OT-quotation KEEP flag** queued for S184. ‖ …aiah) 29:13 against the tradition-keepers. **Q15 OT-quotation KEEP flag** queued for S184. |
| 5115 | 7:24 -> matthew 15:21 | Red Line | …thean Canaanite-woman of Matthew 15:21-28. **Red Line #7 individual-mercy contrast case:** mercy g… |
| 5117 | 7:28 -> matthew 15:27 | the framework, framework (other use), S-number, Q-flag/queued | … King handed her. Her wisdom is in receiving the framework, not arguing it away. **Q14 NT-Lord vocative… ‖ …bs.* The woman accepts the children-and-dogs framework the King handed her. Her wisdom is in receiv… ‖ …ay. **Q14 NT-Lord vocative flag** queued for S184: render as *Lord* (preserve). |
| 5196 | 10:6 -> genesis 2:24 | the framework | …hit (Genesis) 2:24 is the marriage-mechanism the framework reads forward as the seed-of-promise archite… |
| 5214 | 10:46 -> jeremiah 23:5 | S-number, Q-flag/queued | …5). **Q14 NT-Lord flag** at 10:51 queued for S184. ‖ …ghteous Branch* (Yirmeyahu/Jeremiah 23:5). **Q14 NT-Lord flag** at 10:51 queued for S184. |

## `thread:` prefix slugs (40 distinct; none resolves to a live Mark thread)

- `parables-of-the-kingdom-and-the-cause-and-effect-of-hearing` (no live thread) — 11 cards: 5034, 5042, 5098, 5127, 5128, 5129, 5205, 5206, 5207, 5217, 5218
- `eliyahu-pattern-prophet-martyrdom` (no live thread) — 11 cards: 5063, 5064, 5065, 5075, 5076, 5077, 5078, 5164, 5165, 5176, 5177
- `pharisaic-traditions-make-the-commandment-of-none-effect` (no live thread) — 9 cards: 5002, 5029, 5099, 5100, 5101, 5102, 5103, 5104, 5105
- `kinship-redefinition-kingdom-family` (no live thread) — 8 cards: 5031, 5032, 5185, 5186, 5197, 5198, 5203, 5204
- `first-passion-prediction-and-the-must-of-the-passion` (no live thread) — 8 cards: 5136, 5137, 5138, 5172, 5181, 5182, 5208, 5209
- `nature-of-god-formed-in-flesh` (no live thread) — 7 cards: 5049, 5050, 5330, 5331, 5355, 5356, 5357
- `like-the-son-of-adam-coming-with-the-clouds` (no live thread) — 7 cards: 5284, 5285, 5286, 5287, 5327, 5328, 5329
- `wilderness-feeding-as-messianic-banquet-pre-figuration` (no live thread) — 6 cards: 5079, 5080, 5081, 5087, 5088, 5089
- `messiah-as-torah-affirming-healer` (no live thread) — 5 cards: 5005, 5053, 5054, 5055, 5131
- `shabbat-controversy-heart-shabbat-vs-pharisaic-fence` (no live thread) — 5 cards: 5016, 5017, 5018, 5022, 5023
- `wheat-and-tares-the-post-harvest-sifting-architecture` (no live thread) — 5 cards: 5036, 5037, 5288, 5289, 5290
- `son-of-david-messianic-recognition-by-marginalized` (no live thread) — 5 cards: 5051, 5052, 5214, 5215, 5216
- `heart-defilement-and-the-mouth-substance` (no live thread) — 5 cards: 5108, 5109, 5112, 5113, 5114
- `caesarea-philippi-confession-the-rock-the-keys-the-assembly` (no live thread) — 5 cards: 5132, 5133, 5134, 5232, 5233
- `lost-sheep-mission-scope` (no live thread) — 4 cards: 5003, 5004, 5010, 5011
- `bridegroom-messianic-identification` (no live thread) — 4 cards: 5012, 5302, 5303, 5304
- `twelve-apostles-twelve-tribes-restoration-architecture` (no live thread) — 4 cards: 5027, 5028, 5067, 5068
- `i-know-thy-works-and-names-blotted-out` (no live thread) — 4 cards: 5040, 5278, 5279, 5280
- `just-shall-live-by-his-faithfulness` (no live thread) — 4 cards: 5056, 5057, 5058, 5059
- `shake-the-dust-off-rejection-response` (no live thread) — 4 cards: 5069, 5070, 5071, 5072
- `take-up-the-cross-discipleship-cost` (no live thread) — 4 cards: 5144, 5145, 5146, 5147
- `another-gospel-as-judaizer-flesh-credential` (no live thread) — 4 cards: 5263, 5264, 5265, 5266
- `yochanan-as-eliyahu-pattern-prophet` (no live thread) — 3 cards: 4993, 5174, 5175
- `pharisaic-sadducean-system-as-judaizer-predecessor` (no live thread) — 3 cards: 5024, 5142, 5143
- `walking-on-the-sea-formed-cloud-rider` (no live thread) — 3 cards: 5045, 5092, 5093
- `canaanite-woman-master` (no live thread) — 3 cards: 5115, 5116, 5117
- `sign-of-yonah-resurrection-credential` (no live thread) — 3 cards: 5121, 5122, 5123
- `appointed-reign-on-the-earth-and-the-priestly-remnant` (no live thread) — 3 cards: 5160, 5313, 5314
- `natural-branches-asleep-grafted-again` (no live thread) — 3 cards: 5244, 5245, 5246
- `mercy-not-sacrifice-hosea-6-6-citation` (no live thread) — 3 cards: 5252, 5253, 5254
- `trumpets-and-the-day-of-yahuah` (no live thread) — 3 cards: 5281, 5282, 5283
- `grace-and-the-opportunity-that-can-be-lost` (no live thread) — 2 cards: 5038, 5039
- `oral-tradition-correction-not-torah-supersession` (no live thread) — 2 cards: 5110, 5111
- `love-brings-torah-to-pass` (no live thread) — 2 cards: 5230, 5231
- `sovereign-election-and-the-remnant-of-yashar-el` (no live thread) — 2 cards: 5236, 5237
- `gospel-promised-afore` (no live thread) — 1 cards: 4990
- `blasphemy-against-the-ruach-warning` (no live thread) — 1 cards: 5030
- `leaven-as-corruption-substance` (no live thread) — 1 cards: 5124
- `the-seed-of-promise-is-singular-paternal` (no live thread) — 1 cards: 5196
- `pesach-lamb-fulfillment-substance-the-king-as-the-substantial-pesach-lamb` (no live thread) — 1 cards: 5308

## Per-card map


### Mark 1 (6 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 4990 | 1:1 → romans 1:1 | BARE | none | prefix:gospel-promised-afore; quotes source verse only |  |
| 4993 | 1:3 → malachi 4:5 | BARE | whole-not-verbatim | prefix:yochanan-as-eliyahu-pattern-prophet |  |
| 5002 | 1:22 → mark 7:13 | BARE | near-not-verbatim | prefix:pharisaic-traditions-make-the-commandment-of-none-effect |  |
| 5003 | 1:38 → matthew 15:24 | BARE | phrase | prefix:lost-sheep-mission-scope; chain:gathering-of-the-lost-sheep |  |
| 5004 | 1:38 → ezekiel 34:11 | BARE | near-not-verbatim | prefix:lost-sheep-mission-scope; jargon:substance |  |
| 5005 | 1:40 → leviticus 14:2 | BARE | none | prefix:messiah-as-torah-affirming-healer; italics not from target |  |

### Mark 2 (6 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5010 | 2:14 → ezekiel 34:16 | BARE | phrase | prefix:lost-sheep-mission-scope; jargon:architecture |  |
| 5011 | 2:17 → ezekiel 34:4 | BARE | near-not-verbatim | prefix:lost-sheep-mission-scope; jargon:Tanakh-source/shape |  |
| 5012 | 2:19 → hosea 2:19 | BARE | near-not-verbatim | prefix:bridegroom-messianic-identification |  |
| 5016 | 2:23 → leviticus 19:9 | BARE | none | prefix:shabbat-controversy-heart-shabbat-vs-pharisaic-fence; chain:gleaning-as-you-walked; italics not from target |  |
| 5017 | 2:23 → deuteronomy 23:25 | BARE | none | prefix:shabbat-controversy-heart-shabbat-vs-pharisaic-fence; chain:fence-not-Torah; italics not from target |  |
| 5018 | 2:25 → 1-samuel 21:1 | BARE | none | prefix:shabbat-controversy-heart-shabbat-vs-pharisaic-fence; chain:David-at-Nob; bare-name:Yahuah; no quotation |  |

### Mark 3 (9 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5022 | 3:1 → exodus 20:8 | BARE | none | prefix:shabbat-controversy-heart-shabbat-vs-pharisaic-fence; chain:healing-on-the-Sabbath; italics not from target |  |
| 5023 | 3:1 → deuteronomy 5:12 | BARE | phrase | prefix:shabbat-controversy-heart-shabbat-vs-pharisaic-fence; jargon:substance; chain:heart-of-Torah |  |
| 5024 | 3:6 → john 11:47 | BARE | none | prefix:pharisaic-sadducean-system-as-judaizer-predecessor; jargon:architecture; chain:flesh-credential-system-plus-political-power; quotes s |  |
| 5027 | 3:14 → ezekiel 37:15 | BARE | none | prefix:twelve-apostles-twelve-tribes-restoration-architecture; chain:two-sticks-becoming-one; quotes source verse only |  |
| 5028 | 3:14 → revelation 21:12 | BARE | none | prefix:twelve-apostles-twelve-tribes-restoration-architecture; jargon:architecture; italics not from target |  |
| 5029 | 3:22 → mark 7:13 | BARE | none | prefix:pharisaic-traditions-make-the-commandment-of-none-effect; italics not from target |  |
| 5030 | 3:28 → 1-john 5:16 | BARE | phrase | prefix:blasphemy-against-the-ruach-warning; chain:calling-of-the-Spirit-unclean |  |
| 5031 | 3:33 → hosea 1:10 | BARE | near-not-verbatim | prefix:kinship-redefinition-kingdom-family; chain:doing-the-Father's-will/post-Lo-Ammi |  |
| 5032 | 3:35 → matthew 7:21 | BARE | near-not-verbatim | prefix:kinship-redefinition-kingdom-family; jargon:substance/architecture; chain:doing-the-will-as-kingdom-membership |  |

### Mark 4 (8 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5034 | 4:3 → john 10:26 | BARE | near-not-verbatim | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing; jargon:architecture; chain:cause-and-effect-of-hearing |  |
| 5036 | 4:14 → matthew 13:18 | BARE | none | prefix:wheat-and-tares-the-post-harvest-sifting-architecture; no quotation |  |
| 5037 | 4:14 → ezekiel 20:37 | BARE | none | prefix:wheat-and-tares-the-post-harvest-sifting-architecture; jargon:architecture; italics not from target |  |
| 5038 | 4:17 → hebrews 6:4 | BARE | none | prefix:grace-and-the-opportunity-that-can-be-lost; italics not from target |  |
| 5039 | 4:19 → 1-timothy 6:9 | BARE | phrase | prefix:grace-and-the-opportunity-that-can-be-lost |  |
| 5040 | 4:22 → ecclesiastes 12:14 | BARE | phrase | prefix:i-know-thy-works-and-names-blotted-out; chain:manifestation-at-the-end |  |
| 5042 | 4:25 → revelation 13:8 | BARE | phrase | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing |  |
| 5045 | 4:35 → psalms 89:9 | BARE | whole-not-verbatim | prefix:walking-on-the-sea-formed-cloud-rider; chain:wind-and-sea-stilling; bare-name:Yahuah |  |

### Mark 5 (11 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5049 | 5:7 → james 2:19 | BARE | phrase | prefix:nature-of-god-formed-in-flesh |  |
| 5050 | 5:7 → genesis 14:18 | BARE | near-not-verbatim | prefix:nature-of-god-formed-in-flesh; chain:Formed-in-flesh |  |
| 5051 | 5:23 → matthew 9:18 | BARE | none | prefix:son-of-david-messianic-recognition-by-marginalized; italics not from target |  |
| 5052 | 5:23 → luke 8:41 | BARE | none | prefix:son-of-david-messianic-recognition-by-marginalized; chain:desperation-from-magistrate/recognition-by-marginalized; no quotation |  |
| 5053 | 5:25 → leviticus 15:25 | BARE | none | prefix:messiah-as-torah-affirming-healer; quotes source verse only |  |
| 5054 | 5:25 → numbers 15:38 | BARE | none | prefix:messiah-as-torah-affirming-healer; italics not from target |  |
| 5055 | 5:25 → jeremiah 23:6 | BARE | near-not-verbatim | prefix:messiah-as-torah-affirming-healer; jargon:architecture |  |
| 5056 | 5:34 → habakkuk 2:4 | BARE | near-not-verbatim | prefix:just-shall-live-by-his-faithfulness; chain:Formed-in-flesh/seed-of-promise |  |
| 5057 | 5:34 → psalms 27:13 | BARE | whole-not-verbatim | prefix:just-shall-live-by-his-faithfulness; jargon:architecture |  |
| 5058 | 5:34 → isaiah 7:9 | BARE | near-not-verbatim | prefix:just-shall-live-by-his-faithfulness; jargon:architecture |  |
| 5059 | 5:36 → psalms 27:13 | BARE | none | prefix:just-shall-live-by-his-faithfulness; quotes source verse only |  |

### Mark 6 (22 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5063 | 6:4 → 1-kings 19:10 | BARE | none | prefix:eliyahu-pattern-prophet-martyrdom; no quotation |  |
| 5064 | 6:4 → matthew 13:57 | BARE | phrase | prefix:eliyahu-pattern-prophet-martyrdom |  |
| 5065 | 6:4 → luke 4:24 | BARE | phrase | prefix:eliyahu-pattern-prophet-martyrdom |  |
| 5067 | 6:7 → matthew 10:1 | BARE | none | prefix:twelve-apostles-twelve-tribes-restoration-architecture; chain:sending-of-the-twelve; label-like |  |
| 5068 | 6:7 → revelation 21:12 | BARE | none | prefix:twelve-apostles-twelve-tribes-restoration-architecture; no quotation |  |
| 5069 | 6:11 → matthew 10:14 | BARE | none | prefix:shake-the-dust-off-rejection-response; chain:prophetic-witness-act; quotes source verse only | 3397(ma-rev) |
| 5070 | 6:11 → acts 13:51 | BARE | none | prefix:shake-the-dust-off-rejection-response; no quotation |  |
| 5071 | 6:11 → john 10:27 | BARE | phrase | prefix:shake-the-dust-off-rejection-response |  |
| 5072 | 6:11 → matthew 7:6 | BARE | near-not-verbatim | prefix:shake-the-dust-off-rejection-response |  |
| 5075 | 6:14 → 1-kings 21:17 | BARE | none | prefix:eliyahu-pattern-prophet-martyrdom; quotes source verse only |  |
| 5076 | 6:14 → mark 9:13 | BARE | phrase | prefix:eliyahu-pattern-prophet-martyrdom; chain:Yochanan-as-Eliyahu |  |
| 5077 | 6:18 → 1-kings 21:17 | BARE | none | prefix:eliyahu-pattern-prophet-martyrdom; italics not from target |  |
| 5078 | 6:18 → 2-chronicles 24:20 | BARE | none | prefix:eliyahu-pattern-prophet-martyrdom; chain:Zecharyah-stoned-between-temple-and-altar; no quotation |  |
| 5079 | 6:30 → numbers 27:17 | BARE | none | prefix:wilderness-feeding-as-messianic-banquet-pre-figuration; chain:sheep-without-a-shepherd; italics not from target |  |
| 5080 | 6:30 → ezekiel 34:5 | BARE | none | prefix:wilderness-feeding-as-messianic-banquet-pre-figuration; bare-name:Yashar'el; italics not from target |  |
| 5081 | 6:30 → 1-kings 22:17 | BARE | phrase | prefix:wilderness-feeding-as-messianic-banquet-pre-figuration |  |
| 5087 | 6:37 → 2-kings 4:42 | BARE | none | prefix:wilderness-feeding-as-messianic-banquet-pre-figuration; no quotation |  |
| 5088 | 6:37 → ezekiel 34:14 | BARE | phrase | prefix:wilderness-feeding-as-messianic-banquet-pre-figuration; jargon:substance; chain:shepherd-feeding-the-flock |  |
| 5089 | 6:37 → ezekiel 34:23 | BARE | phrase | prefix:wilderness-feeding-as-messianic-banquet-pre-figuration |  |
| 5092 | 6:48 → exodus 33:19 | BARE | none | prefix:walking-on-the-sea-formed-cloud-rider; bare-name:Yahuah; quotes source verse only |  |
| 5093 | 6:48 → 1-kings 19:11 | BARE | none | prefix:walking-on-the-sea-formed-cloud-rider; no quotation |  |
| 5098 | 6:52 → isaiah 6:9 | BARE | none | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing; quotes source verse only |  |

### Mark 7 (17 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5099 | 7:3 → leviticus 22:1 | BARE | none | prefix:pharisaic-traditions-make-the-commandment-of-none-effect; quotes source verse only |  |
| 5100 | 7:6 → isaiah 29:13 | DOCREF | near-not-verbatim | prefix:pharisaic-traditions-make-the-commandment-of-none-effect; DOCREF:S-number/Q-flag/queued |  |
| 5101 | 7:8 → deuteronomy 4:2 | BARE | near-not-verbatim | prefix:pharisaic-traditions-make-the-commandment-of-none-effect; jargon:architecture |  |
| 5102 | 7:8 → deuteronomy 12:32 | BARE | whole-not-verbatim | prefix:pharisaic-traditions-make-the-commandment-of-none-effect |  |
| 5103 | 7:9 → exodus 20:12 | BARE | none | prefix:pharisaic-traditions-make-the-commandment-of-none-effect; italics not from target |  |
| 5104 | 7:9 → deuteronomy 5:16 | BARE | none | prefix:pharisaic-traditions-make-the-commandment-of-none-effect; italics not from target |  |
| 5105 | 7:9 → 1-john 2:3 | BARE | phrase | prefix:pharisaic-traditions-make-the-commandment-of-none-effect; chain:contrary-to-Torah |  |
| 5108 | 7:14 → jeremiah 17:9 | BARE | phrase | prefix:heart-defilement-and-the-mouth-substance |  |
| 5109 | 7:14 → deuteronomy 30:6 | BARE | near-not-verbatim | prefix:heart-defilement-and-the-mouth-substance |  |
| 5110 | 7:19 → leviticus 11:1 | BARE | none | prefix:oral-tradition-correction-not-torah-supersession; quotes source verse only |  |
| 5111 | 7:19 → acts 10:14 | BARE | phrase | prefix:oral-tradition-correction-not-torah-supersession |  |
| 5112 | 7:21 → exodus 20:13 | BARE | none | prefix:heart-defilement-and-the-mouth-substance; italics not from target |  |
| 5113 | 7:21 → jeremiah 17:9 | BARE | phrase | prefix:heart-defilement-and-the-mouth-substance |  |
| 5114 | 7:21 → ezekiel 36:26 | BARE | phrase | prefix:heart-defilement-and-the-mouth-substance |  |
| 5115 | 7:24 → matthew 15:21 | DOCREF | none | prefix:canaanite-woman-master; DOCREF:Red Line; no quotation |  |
| 5116 | 7:24 → matthew 15:24 | BARE | phrase | prefix:canaanite-woman-master; chain:daughter-of-the-nations/seed-of-promise |  |
| 5117 | 7:28 → matthew 15:27 | DOCREF | none | prefix:canaanite-woman-master; DOCREF:the framework/framework (other use)/S-number/Q-flag/queued; chain:children-and-dogs; quotes source ver |  |

### Mark 8 (20 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5121 | 8:11 → matthew 12:38 | BARE | none | prefix:sign-of-yonah-resurrection-credential; no quotation |  |
| 5122 | 8:11 → matthew 16:1 | BARE | none | prefix:sign-of-yonah-resurrection-credential; label-like |  |
| 5123 | 8:11 → jonah 1:17 | BARE | near-not-verbatim | prefix:sign-of-yonah-resurrection-credential; jargon:substance |  |
| 5124 | 8:15 → exodus 12:15 | BARE | none | prefix:leaven-as-corruption-substance; jargon:substance; chain:leaven-as-corruption; quotes source verse only |  |
| 5127 | 8:17 → isaiah 6:9 | BARE | none | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing; italics not from target |  |
| 5128 | 8:17 → jeremiah 5:21 | BARE | phrase | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing |  |
| 5129 | 8:17 → ezekiel 12:2 | BARE | phrase | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing |  |
| 5131 | 8:22 → isaiah 42:7 | BARE | phrase | prefix:messiah-as-torah-affirming-healer |  |
| 5132 | 8:27 → matthew 16:13 | BARE | none | prefix:caesarea-philippi-confession-the-rock-the-keys-the-assembly; italics not from target |  |
| 5133 | 8:27 → luke 9:18 | BARE | none | prefix:caesarea-philippi-confession-the-rock-the-keys-the-assembly; label-like |  |
| 5134 | 8:27 → john 6:69 | BARE | near-not-verbatim | prefix:caesarea-philippi-confession-the-rock-the-keys-the-assembly |  |
| 5136 | 8:31 → psalms 22:6 | BARE | phrase | prefix:first-passion-prediction-and-the-must-of-the-passion |  |
| 5137 | 8:31 → zechariah 12:10 | BARE | phrase | prefix:first-passion-prediction-and-the-must-of-the-passion |  |
| 5138 | 8:31 → matthew 16:21 | BARE | none | prefix:first-passion-prediction-and-the-must-of-the-passion; label-like |  |
| 5142 | 8:33 → mark 7:8 | BARE | none | prefix:pharisaic-sadducean-system-as-judaizer-predecessor; italics not from target |  |
| 5143 | 8:33 → matthew 16:23 | BARE | none | prefix:pharisaic-sadducean-system-as-judaizer-predecessor; label-like |  |
| 5144 | 8:34 → matthew 10:38 | BARE | none | prefix:take-up-the-cross-discipleship-cost; quotes source verse only | 3423(ma-rev) |
| 5145 | 8:34 → matthew 16:24 | BARE | none | prefix:take-up-the-cross-discipleship-cost; chain:take-up-the-cross; label-like |  |
| 5146 | 8:34 → luke 9:23 | BARE | none | prefix:take-up-the-cross-discipleship-cost; chain:take-up-the-cross; label-like |  |
| 5147 | 8:34 → luke 14:27 | BARE | whole-not-verbatim | prefix:take-up-the-cross-discipleship-cost |  |

### Mark 9 (12 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5160 | 9:1 → daniel 7:14 | BARE | phrase | prefix:appointed-reign-on-the-earth-and-the-priestly-remnant; chain:kingdom-come-with-power |  |
| 5164 | 9:4 → 2-kings 2:11 | BARE | near-not-verbatim | prefix:eliyahu-pattern-prophet-martyrdom |  |
| 5165 | 9:4 → deuteronomy 34:5 | BARE | none | prefix:eliyahu-pattern-prophet-martyrdom; bare-name:Yahuah; no quotation |  |
| 5172 | 9:9 → isaiah 53:3 | BARE | phrase | prefix:first-passion-prediction-and-the-must-of-the-passion |  |
| 5174 | 9:13 → 1-kings 19:2 | BARE | none | prefix:yochanan-as-eliyahu-pattern-prophet; quotes source verse only |  |
| 5175 | 9:13 → malachi 4:5 | BARE | whole-not-verbatim | prefix:yochanan-as-eliyahu-pattern-prophet |  |
| 5176 | 9:13 → 2-chronicles 24:20 | BARE | none | prefix:eliyahu-pattern-prophet-martyrdom; chain:Zecharyah-stoned-in-the-temple-courts; label-like |  |
| 5177 | 9:13 → matthew 23:35 | BARE | near-not-verbatim | prefix:eliyahu-pattern-prophet-martyrdom |  |
| 5181 | 9:31 → isaiah 53:8 | BARE | phrase | prefix:first-passion-prediction-and-the-must-of-the-passion |  |
| 5182 | 9:31 → zechariah 13:7 | BARE | phrase | prefix:first-passion-prediction-and-the-must-of-the-passion |  |
| 5185 | 9:37 → matthew 12:50 | BARE | phrase | prefix:kinship-redefinition-kingdom-family |  |
| 5186 | 9:37 → john 13:20 | BARE | near-not-verbatim | prefix:kinship-redefinition-kingdom-family |  |

### Mark 10 (15 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5196 | 10:6 → genesis 2:24 | DOCREF | near-not-verbatim | prefix:the-seed-of-promise-is-singular-paternal; DOCREF:the framework; jargon:architecture; chain:seed-of-promise/two-become-one |  |
| 5197 | 10:14 → matthew 18:3 | BARE | none | prefix:kinship-redefinition-kingdom-family; quotes source verse only |  |
| 5198 | 10:14 → psalms 131:1 | BARE | phrase | prefix:kinship-redefinition-kingdom-family |  |
| 5203 | 10:28 → matthew 12:50 | BARE | none | prefix:kinship-redefinition-kingdom-family; italics not from target |  |
| 5204 | 10:28 → mark 3:35 | BARE | none | prefix:kinship-redefinition-kingdom-family; jargon:architecture/register; label-like |  |
| 5205 | 10:31 → matthew 22:14 | BARE | phrase | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing |  |
| 5206 | 10:31 → matthew 19:30 | BARE | none | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing; label-like |  |
| 5207 | 10:31 → luke 13:30 | BARE | none | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing; label-like |  |
| 5208 | 10:32 → isaiah 53:7 | BARE | phrase | prefix:first-passion-prediction-and-the-must-of-the-passion |  |
| 5209 | 10:32 → psalms 22:6 | BARE | none | prefix:first-passion-prediction-and-the-must-of-the-passion; no quotation |  |
| 5214 | 10:46 → jeremiah 23:5 | DOCREF | phrase | prefix:son-of-david-messianic-recognition-by-marginalized; DOCREF:S-number/Q-flag/queued |  |
| 5215 | 10:46 → 2-samuel 7:12 | BARE | none | prefix:son-of-david-messianic-recognition-by-marginalized; label-like |  |
| 5216 | 10:46 → isaiah 11:1 | BARE | near-not-verbatim | prefix:son-of-david-messianic-recognition-by-marginalized |  |
| 5217 | 10:52 → john 10:27 | BARE | phrase | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing; chain:son-of-Adam |  |
| 5218 | 10:52 → revelation 13:8 | BARE | near-not-verbatim | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing |  |

### Mark 11 (4 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5230 | 11:25 → leviticus 19:18 | BARE | none | prefix:love-brings-torah-to-pass; jargon:architecture; italics not from target |  |
| 5231 | 11:25 → matthew 6:14 | BARE | whole-not-verbatim | prefix:love-brings-torah-to-pass | 120012(ma-rev,live) |
| 5232 | 11:27 → matthew 16:13 | BARE | none | prefix:caesarea-philippi-confession-the-rock-the-keys-the-assembly; jargon:architecture; label-like |  |
| 5233 | 11:27 → matthew 21:23 | BARE | none | prefix:caesarea-philippi-confession-the-rock-the-keys-the-assembly; label-like |  |

### Mark 12 (8 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5236 | 12:1 → romans 11:5 | BARE | none | prefix:sovereign-election-and-the-remnant-of-yashar-el; bare-name:Yashar'el; italics not from target |  |
| 5237 | 12:1 → isaiah 10:21 | BARE | near-not-verbatim | prefix:sovereign-election-and-the-remnant-of-yashar-el |  |
| 5244 | 12:26 → exodus 3:6 | BARE | near-not-verbatim | prefix:natural-branches-asleep-grafted-again |  |
| 5245 | 12:26 → daniel 12:2 | BARE | phrase | prefix:natural-branches-asleep-grafted-again |  |
| 5246 | 12:26 → hebrews 11:13 | BARE | phrase | prefix:natural-branches-asleep-grafted-again |  |
| 5252 | 12:32 → hosea 6:6 | BARE | none | prefix:mercy-not-sacrifice-hosea-6-6-citation; italics not from target |  |
| 5253 | 12:32 → 1-samuel 15:22 | BARE | phrase | prefix:mercy-not-sacrifice-hosea-6-6-citation |  |
| 5254 | 12:32 → micah 6:6 | BARE | none | prefix:mercy-not-sacrifice-hosea-6-6-citation; italics not from target |  |

### Mark 13 (17 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5263 | 13:6 → matthew 24:5 | BARE | phrase | prefix:another-gospel-as-judaizer-flesh-credential; chain:contrary-to-Torah |  |
| 5264 | 13:6 → luke 21:8 | BARE | none | prefix:another-gospel-as-judaizer-flesh-credential; label-like |  |
| 5265 | 13:6 → 2-corinthians 11:4 | BARE | phrase | prefix:another-gospel-as-judaizer-flesh-credential |  |
| 5266 | 13:6 → galatians 1:6 | BARE | phrase | prefix:another-gospel-as-judaizer-flesh-credential |  |
| 5278 | 13:22 → deuteronomy 13:1 | BARE | none | prefix:i-know-thy-works-and-names-blotted-out; chain:contrary-to-Torah; quotes source verse only |  |
| 5279 | 13:22 → revelation 13:13 | BARE | none | prefix:i-know-thy-works-and-names-blotted-out; chain:signs-of-the-second-beast; label-like |  |
| 5280 | 13:22 → 2-thessalonians 2:9 | BARE | phrase | prefix:i-know-thy-works-and-names-blotted-out |  |
| 5281 | 13:24 → joel 2:10 | BARE | none | prefix:trumpets-and-the-day-of-yahuah; chain:day-of-Yahuah; bare-name:Yahuah; italics not from target |  |
| 5282 | 13:24 → isaiah 13:10 | BARE | phrase | prefix:trumpets-and-the-day-of-yahuah |  |
| 5283 | 13:24 → isaiah 34:4 | BARE | phrase | prefix:trumpets-and-the-day-of-yahuah |  |
| 5284 | 13:26 → daniel 7:13 | BARE | none | prefix:like-the-son-of-adam-coming-with-the-clouds; quotes source verse only |  |
| 5285 | 13:26 → matthew 24:30 | BARE | none | prefix:like-the-son-of-adam-coming-with-the-clouds; label-like |  |
| 5286 | 13:26 → revelation 1:7 | BARE | near-not-verbatim | prefix:like-the-son-of-adam-coming-with-the-clouds |  |
| 5287 | 13:26 → zechariah 12:10 | BARE | phrase | prefix:like-the-son-of-adam-coming-with-the-clouds |  |
| 5288 | 13:27 → matthew 13:41 | BARE | phrase | prefix:wheat-and-tares-the-post-harvest-sifting-architecture |  |
| 5289 | 13:27 → ezekiel 37:21 | BARE | phrase | prefix:wheat-and-tares-the-post-harvest-sifting-architecture |  |
| 5290 | 13:27 → deuteronomy 30:4 | BARE | near-not-verbatim | prefix:wheat-and-tares-the-post-harvest-sifting-architecture |  |

### Mark 14 (11 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5302 | 14:3 → 1-samuel 16:13 | BARE | none | prefix:bridegroom-messianic-identification; jargon:substance; italics not from target |  |
| 5303 | 14:3 → matthew 26:6 | BARE | none | prefix:bridegroom-messianic-identification; label-like |  |
| 5304 | 14:3 → john 12:1 | BARE | none | prefix:bridegroom-messianic-identification; label-like |  |
| 5308 | 14:12 → exodus 12:1 | BARE | none | prefix:pesach-lamb-fulfillment-substance-the-king-as-the-substantial-pesach-lamb; jargon:substance; italics not from target |  |
| 5313 | 14:25 → revelation 19:9 | BARE | none | prefix:appointed-reign-on-the-earth-and-the-priestly-remnant; quotes source verse only |  |
| 5314 | 14:25 → isaiah 25:6 | BARE | phrase | prefix:appointed-reign-on-the-earth-and-the-priestly-remnant |  |
| 5327 | 14:62 → daniel 7:13 | BARE | near-not-verbatim | prefix:like-the-son-of-adam-coming-with-the-clouds |  |
| 5328 | 14:62 → matthew 26:64 | BARE | none | prefix:like-the-son-of-adam-coming-with-the-clouds; label-like | 3013(ma-rev,live) |
| 5329 | 14:62 → revelation 1:7 | BARE | near-not-verbatim | prefix:like-the-son-of-adam-coming-with-the-clouds |  |
| 5330 | 14:61 → john 10:36 | BARE | phrase | prefix:nature-of-god-formed-in-flesh |  |
| 5331 | 14:61 → hebrews 1:1 | BARE | none | prefix:nature-of-god-formed-in-flesh; italics not from target |  |

### Mark 15 (3 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 5355 | 15:39 → matthew 27:54 | BARE | near-not-verbatim | prefix:nature-of-god-formed-in-flesh |  |
| 5356 | 15:39 → luke 23:47 | BARE | none | prefix:nature-of-god-formed-in-flesh; label-like |  |
| 5357 | 15:39 → john 19:35 | BARE | none | prefix:nature-of-god-formed-in-flesh; label-like |  |
