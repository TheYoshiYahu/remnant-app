# Luke orphan-card map (S495 Phase 2)

- Model: **claude-sonnet-5-5 (Sonnet 5.5)**
- Session: S495 (Phase 2), generated 2026-11-08
- Source: `/home/claude/s495/live/canon__luke.json` (read-only; nothing in `live/` was modified)
- Method: every orphan card graded by script against its own `t_text` (word-level verbatim check), `grade.py` rules below; no prose was rewritten.

## Grade rules
- **DOCREF**: the note names Red Line / voice skill / the framework / S-number / Yoshi / SUMMATION / FRAMEWORK-MAJOR / teaching corpus / Q-flag / backticked thread slug / "1234 of Truth" (token listed). Wins over every other grade.
- **BARE**: note carries a `thread:slug |` prefix, OR has no quotation of the target verse (label-like, no quotation, italics from another verse, or quotes only the source verse).
- **PARTIAL**: quotes the target as a phrase, with an ellipsis, or not verbatim to the live text; OR quotes the whole verse verbatim but carries jargon (substance, architecture, register, wisdom-stream, motif, prototype, marker, locked, grid, ...) or a 3+ segment hyphen-chain.
- **FULL**: quotes the whole target verse verbatim in italics (word-for-word against `t_text`, punctuation/case ignored) and the prose has no jargon token or hyphen-chain. `shape_gaps` notes if it lacks a citation or any prose.
- `grade_ignoring_prefix` = the grade the note body would earn without the `thread:slug |` prefix. Bare-sacred-name flags (Yahuah/Yahusha/Elohim/... without a parenthetical in the prose) are informational and do not change the grade.

## Headline counts

- Orphan cards: **61** — FULL **0**, PARTIAL **5**, BARE **44**, DOCREF **12**
- Same count if the `thread:slug |` prefix is ignored: {'FULL': 0, 'PARTIAL': 17, 'BARE': 32, 'DOCREF': 12}
- `thread:` prefix notes: 56; prefix slug names a live Luke thread: 0
- Quote kinds: {'none': 40, 'phrase': 8, 'near-not-verbatim': 10, 'whole-not-verbatim': 2, 'whole-elided': 1}
- BARE reasons: {'prefix': 44, 'italics not from target': 22, 'quotes source verse only': 5, 'no quotation': 4, 'label-like': 1}
- Jargon tokens (cards): {'substance': 12, 'architecture': 9, 'register': 8}; cards with a 3+ hyphen-chain: 39
- DOCREF tokens: {'the framework': 12, 'Red Line': 1, 'FRAMEWORK-MAJOR': 1} — 12 cards carry a house-document reference; 0 more use the bare word 'framework' only
- Cards flagged dup: **4** (0 same pair, 0 reversed within Luke, 4 reversed against a card in another Gospel file); distinct dup pairs: 4

## Per chapter

| ch | orphans | FULL | PARTIAL | BARE | DOCREF | BARE ignoring prefix | dup cards |
|---|---|---|---|---|---|---|---|
| 1 | 6 | 0 | 0 | 6 | 0 | 4 | 0 |
| 2 | 1 | 0 | 0 | 1 | 0 | 1 | 0 |
| 3 | 2 | 0 | 0 | 2 | 0 | 0 | 0 |
| 4 | 3 | 0 | 0 | 2 | 1 | 2 | 0 |
| 5 | 3 | 0 | 0 | 3 | 0 | 2 | 0 |
| 6 | 3 | 0 | 0 | 3 | 0 | 3 | 0 |
| 7 | 7 | 0 | 0 | 6 | 1 | 4 | 1 |
| 8 | 3 | 0 | 0 | 2 | 1 | 2 | 0 |
| 9 | 8 | 0 | 0 | 7 | 1 | 5 | 1 |
| 10 | 1 | 0 | 0 | 1 | 0 | 1 | 0 |
| 11 | 2 | 0 | 0 | 2 | 0 | 1 | 0 |
| 12 | 3 | 0 | 0 | 0 | 3 | 0 | 1 |
| 13 | 1 | 0 | 0 | 0 | 1 | 0 | 0 |
| 14 | 3 | 0 | 0 | 2 | 1 | 1 | 1 |
| 15 | 1 | 0 | 0 | 1 | 0 | 0 | 0 |
| 16 | 3 | 0 | 0 | 2 | 1 | 2 | 0 |
| 17 | 1 | 0 | 0 | 1 | 0 | 1 | 0 |
| 18 | 4 | 0 | 0 | 2 | 2 | 2 | 0 |
| 19 | 1 | 0 | 0 | 1 | 0 | 1 | 0 |
| 21 | 5 | 0 | 5 | 0 | 0 | 0 | 0 |

## DOCREF list (12 Luke cards)

| id | ref | tokens | context |
|---|---|---|---|
| 6987 | 4:25 -> matthew 15:24 | the framework | …Syrian — the individual-mercy contrast cases the framework holds against the false-inclusion-gospel. Th… |
| 7006 | 7:9 -> matthew 8:10 | Red Line, the framework | …he framework's individual-mercy carveout per Red Line #7. The Gentile centurion receives mercy wit… ‖ …n's faith against the seed-of-promise body — the framework's individual-mercy carveout per Red Line #7.… |
| 7017 | 8:21 -> matthew 12:50 | the framework | …h hear the word of Elohim (God), and do it.* The framework-substance: hearing-and-doing reveals the fam… |
| 7022 | 9:5 -> matthew 10:14 | the framework | …rom your feet for a testimony against them.* The framework's reading: the pursuit ends where the reject… |
| 7042 | 12:1 -> matthew 16:6 | the framework | …ies the leaven as hypocrisy in plain words — the framework-substance of the Pharisaic-system-as-ferment… |
| 7044 | 12:10 -> matthew 12:31 | the framework | …given.* Luke's version preserves the warning the framework reads as the no-place-of-repentance for the … |
| 7048 | 12:47 -> matthew 25:14 | the framework | …is will, shall be beaten with many stripes.* The framework's post-harvest-sifting substance — names get… |
| 7054 | 13:20 -> matthew 13:33 | the framework | …ll the whole was leavened* (Luke 13:20-21) — the framework reading of leaven across the gospels is the … |
| 7055 | 14:1 -> mark 2:27 | the framework | … — they hold their peace. Same heart-shabbat the framework restores — the day-Yahuah-hallowed is for th… |
| 7067 | 16:19 -> matthew 13:24 | the framework, FRAMEWORK-MAJOR | …man-and-Lazaros parable. FRAMEWORK-MAJOR for the framework-honest sheol-and-resurrection register. Two … ‖ …itecture \| The rich-man-and-Lazaros parable. FRAMEWORK-MAJOR for the framework-honest sheol-and-resurrect… |
| 7077 | 18:9 -> ezekiel 18:21 | the framework | …o me a sinner* — the contrite-spirit posture the framework names. Yechezk'el (Ezekiel) 18:21's repentan… |
| 7084 | 18:35 -> matthew 9:27 | the framework | …cry from the marginalized — the same pattern the framework names across the gospels. |

## `thread:` prefix slugs (33 distinct; none resolves to a live Luke thread)

- `yochanan-as-eliyahu-pattern-prophet` (no live thread) — 6 cards: 6956, 6973, 7008, 7009, 7010, 7011
- `leaven-as-corruption-substance` (no live thread) — 3 cards: 6995, 7042, 7054
- `shabbat-controversy-heart-shabbat-vs-pharisaic-fence` (no live thread) — 3 cards: 6996, 6997, 7055
- `kinship-redefinition-kingdom-family` (no live thread) — 3 cards: 7017, 7041, 7057
- `grace-and-the-opportunity-that-can-be-lost` (no live thread) — 3 cards: 7048, 7061, 7077
- `messianic-line-preservation-by-sovereign-decree` (no live thread) — 2 cards: 6959, 6960
- `kingdoms-now-under-watcher-rebellion-administration` (no live thread) — 2 cards: 6984, 7034
- `canaanite-woman-master` (no live thread) — 2 cards: 6987, 7007
- `lost-sheep-mission-scope` (no live thread) — 2 cards: 6989, 7087
- `messiah-as-torah-affirming-healer` (no live thread) — 2 cards: 6991, 7085
- `parables-of-the-kingdom-and-the-cause-and-effect-of-hearing` (no live thread) — 2 cards: 7014, 7015
- `shake-the-dust-off-rejection-response` (no live thread) — 2 cards: 7022, 7030
- `first-passion-prediction-and-the-must-of-the-passion` (no live thread) — 2 cards: 7025, 7083
- `take-up-the-cross-discipleship-cost` (no live thread) — 2 cards: 7026, 7056
- `wheat-and-tares-the-post-harvest-sifting-architecture` (no live thread) — 2 cards: 7067, 7074
- `the-seed-of-promise-is-singular-paternal` (no live thread) — 1 cards: 6958
- `avraham-reckoned-before-circumcision` (no live thread) — 1 cards: 6964
- `gospel-promised-afore` (no live thread) — 1 cards: 6965
- `trumpets-and-the-day-of-yahuah` (no live thread) — 1 cards: 6970
- `another-gospel-as-judaizer-flesh-credential` (no live thread) — 1 cards: 6976
- `bridegroom-messianic-identification` (no live thread) — 1 cards: 6994
- `twelve-apostles-twelve-tribes-restoration-architecture` (no live thread) — 1 cards: 6998
- `my-brethren-substance-distinguishing-the-seed-of-promise-from-the-categorical-nations` (no live thread) — 1 cards: 7006
- `eliyahu-pattern-prophet-martyrdom` (no live thread) — 1 cards: 7012
- `wilderness-feeding-as-messianic-banquet-pre-figuration` (no live thread) — 1 cards: 7023
- `caesarea-philippi-confession-the-rock-the-keys-the-assembly` (no live thread) — 1 cards: 7024
- `the-formless-father-and-the-formed-son-witnessed-in-ascension-of-isaiah` (no live thread) — 1 cards: 7027
- `the-son-of-adam-glorified-in-1-enoch-throne-vision-and-parables` (no live thread) — 1 cards: 7029
- `sign-of-yonah-resurrection-credential` (no live thread) — 1 cards: 7038
- `blasphemy-against-the-ruach-warning` (no live thread) — 1 cards: 7044
- `pharisaic-traditions-make-the-commandment-of-none-effect` (no live thread) — 1 cards: 7064
- `scripture-twisting-and-the-harmonization-discipline` (no live thread) — 1 cards: 7068
- `son-of-david-messianic-recognition-by-marginalized` (no live thread) — 1 cards: 7084

## Per-card map


### Luke 1 (6 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 6956 | 1:17 → malachi 4:5 | BARE | none | prefix:yochanan-as-eliyahu-pattern-prophet; chain:spirit-and-power; italics not from target |  |
| 6958 | 1:31 → 2-samuel 7:12 | BARE | none | prefix:the-seed-of-promise-is-singular-paternal; chain:paternal-seed-singular; italics not from target |  |
| 6959 | 1:32 → 2-samuel 7:12 | BARE | none | prefix:messianic-line-preservation-by-sovereign-decree; chain:paternal-seed-singular/scepter-not-departing; quotes source verse only |  |
| 6960 | 1:33 → daniel 7:14 | BARE | phrase | prefix:messianic-line-preservation-by-sovereign-decree; chain:eternal-kingdom-of-the-Son-of-Adam |  |
| 6964 | 1:55 → genesis 17:7 | BARE | near-not-verbatim | prefix:avraham-reckoned-before-circumcision; chain:daughter-of-Yashar'el/paternal-seed-promise; bare-name:Yashar'el |  |
| 6965 | 1:67 → isaiah 11:1 | BARE | none | prefix:gospel-promised-afore; chain:gospel-promised-afore/horn-of-salvation; italics not from target |  |

### Luke 2 (1 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 6970 | 2:13 → revelation 19:1 | BARE | none | prefix:trumpets-and-the-day-of-yahuah; italics not from target |  |

### Luke 3 (2 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 6973 | 3:2 → isaiah 40:3 | BARE | near-not-verbatim | prefix:yochanan-as-eliyahu-pattern-prophet |  |
| 6976 | 3:8 → matthew 3:9 | BARE | whole-not-verbatim | prefix:another-gospel-as-judaizer-flesh-credential |  |

### Luke 4 (3 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 6984 | 4:5 → matthew 4:8 | BARE | none | prefix:kingdoms-now-under-watcher-rebellion-administration; jargon:substance; chain:kingdoms-now-under-watcher-rebellion-administration; ita |  |
| 6987 | 4:25 → matthew 15:24 | DOCREF | none | prefix:canaanite-woman-master; DOCREF:the framework; chain:false-inclusion-gospel/seed-of-promise; no quotation |  |
| 6989 | 4:43 → matthew 15:24 | BARE | none | prefix:lost-sheep-mission-scope; quotes source verse only |  |

### Luke 5 (3 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 6991 | 5:14 → matthew 8:4 | BARE | none | prefix:messiah-as-torah-affirming-healer; italics not from target |  |
| 6994 | 5:34 → matthew 9:15 | BARE | near-not-verbatim | prefix:bridegroom-messianic-identification; chain:bridegroom-self-identification |  |
| 6995 | 5:36 → matthew 9:17 | BARE | none | prefix:leaven-as-corruption-substance; jargon:substance; chain:new-heart-and-new-spirit/new-wine-and-old-bottles; italics not from target |  |

### Luke 6 (3 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 6996 | 6:1 → mark 2:23 | BARE | none | prefix:shabbat-controversy-heart-shabbat-vs-pharisaic-fence; chain:David-and-the-shewbread; italics not from target |  |
| 6997 | 6:6 → mark 3:1 | BARE | none | prefix:shabbat-controversy-heart-shabbat-vs-pharisaic-fence; chain:heart-Shabbat-versus-Pharisaic-fence; italics not from target |  |
| 6998 | 6:12 → matthew 10:1 | BARE | none | prefix:twelve-apostles-twelve-tribes-restoration-architecture; jargon:architecture; chain:twelve-tribes-restoration; italics not from target |  |

### Luke 7 (7 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7006 | 7:9 → matthew 8:10 | DOCREF | phrase | prefix:my-brethren-substance-distinguishing-the-seed-of-promise-from-the-categorical-nations; DOCREF:Red Line/the framework; chain:seed-of-p |  |
| 7007 | 7:1 → matthew 8:5 | BARE | none | prefix:canaanite-woman-master; jargon:substance; chain:canaanite-woman-master/my-brethren-substance; no quotation | 3348(ma-rev) |
| 7008 | 7:27 → malachi 3:1 | BARE | none | prefix:yochanan-as-eliyahu-pattern-prophet; italics not from target |  |
| 7009 | 7:28 → matthew 11:11 | BARE | near-not-verbatim | prefix:yochanan-as-eliyahu-pattern-prophet; jargon:architecture |  |
| 7010 | 7:29 → john 10:27 | BARE | phrase | prefix:yochanan-as-eliyahu-pattern-prophet; chain:hearing-and-turning |  |
| 7011 | 7:33 → 1-kings 19:8 | BARE | none | prefix:yochanan-as-eliyahu-pattern-prophet; jargon:register; italics not from target |  |
| 7012 | 7:24 → 1-kings 19:10 | BARE | none | prefix:eliyahu-pattern-prophet-martyrdom; jargon:register; chain:reed-shaken-with-the-wind; no quotation |  |

### Luke 8 (3 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7014 | 8:4 → matthew 13:3 | BARE | none | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing; jargon:architecture/register; chain:cause-and-effect-of-hearing; no quot |  |
| 7015 | 8:10 → matthew 13:11 | BARE | none | prefix:parables-of-the-kingdom-and-the-cause-and-effect-of-hearing; chain:cause-and-effect-of-hearing; quotes source verse only |  |
| 7017 | 8:21 → matthew 12:50 | DOCREF | none | prefix:kinship-redefinition-kingdom-family; DOCREF:the framework; jargon:substance; chain:cause-and-effect-of-hearing/hearing-and-doing; quo |  |

### Luke 9 (8 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7022 | 9:5 → matthew 10:14 | DOCREF | none | prefix:shake-the-dust-off-rejection-response; DOCREF:the framework; italics not from target | 3398(ma-rev) |
| 7023 | 9:10 → matthew 14:13 | BARE | none | prefix:wilderness-feeding-as-messianic-banquet-pre-figuration; jargon:substance/register; chain:wilderness-feeding-as-messianic-banquet; no  |  |
| 7024 | 9:18 → matthew 16:13 | BARE | none | prefix:caesarea-philippi-confession-the-rock-the-keys-the-assembly; jargon:architecture/register; italics not from target |  |
| 7025 | 9:21 → matthew 16:21 | BARE | near-not-verbatim | prefix:first-passion-prediction-and-the-must-of-the-passion; jargon:architecture/register; chain:first-passion-prediction |  |
| 7026 | 9:23 → matthew 16:24 | BARE | near-not-verbatim | prefix:take-up-the-cross-discipleship-cost; chain:one-time-transaction |  |
| 7027 | 9:28 → matthew 17:1 | BARE | none | prefix:the-formless-father-and-the-formed-son-witnessed-in-ascension-of-isaiah; jargon:architecture; italics not from target |  |
| 7029 | 9:32 → matthew 17:2 | BARE | none | prefix:the-son-of-adam-glorified-in-1-enoch-throne-vision-and-parables; chain:Son-of-Adam-in-glorified-form; quotes source verse only |  |
| 7030 | 9:54 → matthew 10:14 | BARE | none | prefix:shake-the-dust-off-rejection-response; jargon:register; chain:calling-fire-down/seventy-sent-out; italics not from target |  |

### Luke 10 (1 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7034 | 10:18 → daniel 7:25 | BARE | none | prefix:kingdoms-now-under-watcher-rebellion-administration; jargon:substance; chain:kingdoms-under-the-administration/territory-by-territory |  |

### Luke 11 (2 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7038 | 11:29 → matthew 12:39 | BARE | near-not-verbatim | prefix:sign-of-yonah-resurrection-credential; jargon:substance; chain:Yonah-as-resurrection-credential/preaching-as-the-sign |  |
| 7041 | 11:27 → matthew 12:50 | BARE | none | prefix:kinship-redefinition-kingdom-family; jargon:substance; chain:hearing-and-doing-reveals-the-family; label-like |  |

### Luke 12 (3 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7042 | 12:1 → matthew 16:6 | DOCREF | none | prefix:leaven-as-corruption-substance; DOCREF:the framework; jargon:substance; chain:Pharisaic-system-as-fermenting-corruption; italics not  |  |
| 7044 | 12:10 → matthew 12:31 | DOCREF | near-not-verbatim | prefix:blasphemy-against-the-ruach-warning; DOCREF:the framework; chain:no-place-of-repentance | 2780(ma-rev) |
| 7048 | 12:47 → matthew 25:14 | DOCREF | none | prefix:grace-and-the-opportunity-that-can-be-lost; DOCREF:the framework; jargon:substance; chain:post-harvest-sifting; quotes source verse o |  |

### Luke 13 (1 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7054 | 13:20 → matthew 13:33 | DOCREF | near-not-verbatim | prefix:leaven-as-corruption-substance; DOCREF:the framework; jargon:substance; chain:kingdom-growth-substance |  |

### Luke 14 (3 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7055 | 14:1 → mark 2:27 | DOCREF | none | prefix:shabbat-controversy-heart-shabbat-vs-pharisaic-fence; DOCREF:the framework; chain:day-Yahuah-hallowed; bare-name:Yahuah; italics not  |  |
| 7056 | 14:27 → matthew 16:24 | BARE | none | prefix:take-up-the-cross-discipleship-cost; chain:bearing-the-cross; italics not from target | 3535(ma-rev) |
| 7057 | 14:26 → mark 3:33 | BARE | phrase | prefix:kinship-redefinition-kingdom-family |  |

### Luke 15 (1 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7061 | 15:18 → ezekiel 18:21 | BARE | phrase | prefix:grace-and-the-opportunity-that-can-be-lost; jargon:architecture |  |

### Luke 16 (3 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7064 | 16:14 → mark 7:13 | BARE | none | prefix:pharisaic-traditions-make-the-commandment-of-none-effect; italics not from target |  |
| 7067 | 16:19 → matthew 13:24 | DOCREF | none | prefix:wheat-and-tares-the-post-harvest-sifting-architecture; DOCREF:the framework/FRAMEWORK-MAJOR; jargon:register; chain:rich-man-and-Laza |  |
| 7068 | 16:29 → 2-peter 3:15 | BARE | none | prefix:scripture-twisting-and-the-harmonization-discipline; italics not from target |  |

### Luke 17 (1 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7074 | 17:34 → matthew 13:24 | BARE | none | prefix:wheat-and-tares-the-post-harvest-sifting-architecture; jargon:architecture; chain:day-of-the-Son-of-Adam/post-harvest-sifting; italic |  |

### Luke 18 (4 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7077 | 18:9 → ezekiel 18:21 | DOCREF | none | prefix:grace-and-the-opportunity-that-can-be-lost; DOCREF:the framework; jargon:substance/architecture; chain:Pharisee-and-publican/repentan |  |
| 7083 | 18:31 → matthew 16:21 | BARE | none | prefix:first-passion-prediction-and-the-must-of-the-passion; italics not from target |  |
| 7084 | 18:35 → matthew 9:27 | DOCREF | near-not-verbatim | prefix:son-of-david-messianic-recognition-by-marginalized; DOCREF:the framework; chain:Son-of-David |  |
| 7085 | 18:42 → acts 3:6 | BARE | none | prefix:messiah-as-torah-affirming-healer; italics not from target |  |

### Luke 19 (1 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 7087 | 19:10 → matthew 10:6 | BARE | none | prefix:lost-sheep-mission-scope; chain:gathering-of-the-scattered/seeking-and-saving; quotes source verse only |  |

### Luke 21 (5 orphans)

| id | ref | grade | quote | flags | dup |
|---|---|---|---|---|---|
| 177457 | 21:24 → ezekiel 9:6 | PARTIAL | phrase |  |  |
| 177458 | 21:24 → zechariah 13:8 | PARTIAL | phrase |  |  |
| 177459 | 21:24 → zechariah 14:9 | PARTIAL | whole-not-verbatim | bare-name:Yahuah |  |
| 177462 | 21:24 → ezekiel 33:6 | PARTIAL | whole-elided |  |  |
| 177463 | 21:24 → ezekiel 33:28 | PARTIAL | phrase |  |  |
