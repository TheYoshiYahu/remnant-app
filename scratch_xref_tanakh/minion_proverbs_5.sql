-- ----- fragment: minion_proverbs_5.sql (Proverbs 5) -----
-- Chapter: Proverbs 5 — the first FULL strange-woman / adultery discourse, the seventh word set as a fatherly warning. The chapter runs three movements: the seduction-unto-death of the strange woman whose *lips drop as an honeycomb* but whose *end is bitter as wormwood* and whose *feet go down to death* (5:3-6); the bitter lament of the ruined man who *hated instruction* (5:11-14); and — the framework heart — the call to covenant-marriage faithfulness, *Drink waters out of thine own cistern... rejoice with the wife of thy youth* (5:15-19). It closes on the all-seeing eye — *the ways of man are before the eyes of Yahuah (LORD)* (5:21) — and on sin self-binding — *His own iniquities shall take the wicked himself* (5:22). The seventh commandment (Exodus 20:14 / Deuteronomy 5:18) stands behind the whole chapter: Torah affirmed, not abolished. Pairs with the ch2 and ch7 strange-woman discourses.
-- Tag: pr05   Temp view: _s304_pr05_lookup
-- Sort band: base 28100, step 3 -> threads at 28100, 28103, 28106, 28109, 28112 (5 threads)
-- Source of EVERY row: 'canon','proverbs',5,v
--
-- Proverbs 5 coverage:
--   ★ v.3-6 (the lips of a strange woman drop as an honeycomb... her end is bitter as wormwood... Her feet go down to death; her steps take hold on hell)
--        NT:     ★ 2 Peter 2:18-19 (great swelling words of vanity, they allure through the lusts of the flesh... while they promise them liberty, they themselves are the servants of corruption) — THREAD 1
--        Extras: ★ Sirach 9:3 (Meet not with an harlot, lest you fall into her snares); Sirach 9:8 (Turn away your eye from a beautiful woman... for many have been deceived) — THREAD 1
--        Tanakh: ★★ Proverbs 2:18-19 (her house inclineth unto death... None that go unto her return again); Proverbs 7:26-27 (many strong men have been slain by her. Her house is the way to hell); Proverbs 14:12 (a way which seemeth right unto a man, but the end thereof are the ways of death) — THREAD 1
--   v.7-10 (Remove thy way far from her... Lest thou give thine honour unto others, and thy years unto the cruel)
--        folded into THREAD 1 (the "remove thy way far from her" is the practical edge of the death-figure; 7:25 lateral touched in prose)
--   v.11-14 (And thou mourn at the last... How have I hated instruction, and my heart despised reproof; And have not obeyed the voice of my teachers)
--        NT:     none warranted distinct (the despised-reproof lament carried whole by Proverbs laterals)
--        Extras: none warranted distinct
--        Tanakh: ★ Proverbs 1:24-26 (I have called, and ye refused... I also will laugh at your calamity); Proverbs 29:1 (He, that being often reproved hardeneth his neck, shall suddenly be destroyed) — THREAD 2
--   ★★ v.15-19 (Drink waters out of thine own cistern... rejoice with the wife of thy youth... be thou ravished always with her love) — THE FRAMEWORK HEART (covenant-marriage faithfulness)
--        NT:     ★ Hebrews 13:4 (Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge) — THREAD 3
--        Extras: none warranted distinct (the own-fountain figure carried by Song + Malachi; Sirach pulled into THREAD 1/4)
--        Tanakh: ★★ Malachi 2:14-15 (the wife of thy youth... yet is she thy companion, and the wife of thy covenant... That he might seek a godly seed); Genesis 2:24 (shall cleave unto his wife: and they shall be one flesh); Song of Solomon 4:12 (A garden inclosed... a spring shut up, a fountain sealed); Exodus 20:14 / Deuteronomy 5:18 (Thou shalt not commit adultery) — THREAD 3 (the seventh word behind the whole chapter)
--   v.20 (why wilt thou, my son, be ravished with a strange woman, and embrace the bosom of a stranger?)
--        folded into THREAD 3 (the contrast that the own-fountain answers; the "strange woman" reaches back to THREAD 1)
--   ★ v.21 (For the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings)
--        NT:     ★ Hebrews 4:13 (all things are naked and opened unto the eyes of him with whom we have to do) — THREAD 4
--        Extras: ★ Sirach 23:18-19 (Who seeth me?... the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men) — THREAD 4
--        Tanakh: ★ Proverbs 15:3 (The eyes of Yahuah (LORD) are in every place, beholding the evil and the good) — THREAD 4
--   ★ v.22-23 (His own iniquities shall take the wicked himself... He shall die without instruction)
--        NT:     ★ Galatians 6:7-8 (whatsoever a man soweth, that shall he also reap... he that soweth to his flesh shall of the flesh reap corruption) — THREAD 5
--        Extras: none warranted distinct
--        Tanakh: ★ Numbers 32:23 (ye have sinned against Yahuah (LORD): and be sure your sin will find you out) — THREAD 5
--   v.1-2 (My son, attend unto my wisdom... that thy lips may keep knowledge): none warranted (the standard fatherly preamble; folded contextually into the chapter frame, no thread)
--
-- Threads (slug — target libraries):
--   1. proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood — Tanakh (Proverbs) + NT (2 Peter) + Extras (Sirach) [extras] (the seduction-unto-death figure; the way that seemeth right whose end is death; pairs with ch2/ch7)
--   2. proverbs-5-thou-mourn-at-the-last-how-have-i-hated-instruction — Tanakh (Proverbs) [free] (the lament of the ruined man who despised reproof too late)
--   3. proverbs-5-drink-waters-out-of-thine-own-cistern-rejoice-with-the-wife-of-thy-youth — Tanakh (Malachi, Genesis, Song, Exodus, Deuteronomy) + NT (Hebrews) [free] (★★ covenant-marriage faithfulness; the seventh word affirmed, not abolished)
--   4. proverbs-5-the-ways-of-man-are-before-the-eyes-of-yahuah — Tanakh (Proverbs) + NT (Hebrews) + Extras (Sirach) [extras] (the all-seeing eye; nothing hid from Yahuah)
--   5. proverbs-5-his-own-iniquities-shall-take-the-wicked-himself — Tanakh (Numbers) + NT (Galatians) [free] (sin self-binding; whatsoever a man soweth he reaps; your sin will find you out)
--
-- Framing notes:
--   ★ STRANGE WOMAN (THREAD 1): *For the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil: But her end is bitter as wormwood, sharp as a twoedged sword. Her feet go down to death; her steps take hold on hell* (5:3-5). The honey-then-wormwood figure is the seduction-unto-death the whole book names: *her house inclineth unto death, and her paths unto the dead. None that go unto her return again* (2:18-19); *many strong men have been slain by her. Her house is the way to hell, going down to the chambers of death* (7:26-27). It is the very paradigm of *There is a way which seemeth right unto a man, but the end thereof are the ways of death* (14:12) — the sweet beginning, the bitter end. The restored witness guards the same gate — *Meet not with an harlot, lest you fall into her snares* (Sirach 9:3); *Turn away your eye from a beautiful woman... for many have been deceived by the beauty of a woman* (Sirach 9:8). And the NT carries the figure forward into the false teachers who seduce by the same flattery and the same false promise: *when they speak great swelling words of vanity, they allure through the lusts of the flesh... While they promise them liberty, they themselves are the servants of corruption* (2 Peter 2:18-19). The strange woman is VICTIM-and-snare both — the warning dismantles the seduction, not the person; the son is bidden *Remove thy way far from her* (5:8).
--   ★ THE LAMENT TOO LATE (THREAD 2): *And thou mourn at the last, when thy flesh and thy body are consumed, And say, How have I hated instruction, and my heart despised reproof; And have not obeyed the voice of my teachers* (5:11-13). This is the cry Wisdom foretold at the book's opening — *Because I have called, and ye refused... I also will laugh at your calamity* (1:24-26) — and the doom of the hardened neck: *He, that being often reproved hardeneth his neck, shall suddenly be destroyed, and that without remedy* (29:1). The reproof despised in the day of choosing becomes the reproof mourned in the day of ruin.
--   ★★ THE OWN CISTERN / WIFE OF THY YOUTH (THREAD 3): *Drink waters out of thine own cistern, and running waters out of thine own well... rejoice with the wife of thy youth* (5:15-18) — the framework heart of the chapter, covenant-marriage faithfulness. Malachi names the same wife and the same covenant: *Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant* (2:14), and gives the reason — *That he might seek a godly seed* (2:15), tying marriage to the seed-of-promise itself. It reaches back to the one-flesh ordinance of the garden — *shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24) — and the Song sings the sealed, kept fountain — *A garden inclosed is my sister, my spouse; a spring shut up, a fountain sealed* (4:12). Behind the whole chapter stands the seventh word, unrepealed: *Thou shalt not commit adultery* (Exodus 20:14; Deuteronomy 5:18) — and the NT keeps it whole, never abolishing it: *Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge* (Hebrews 13:4). The own-fountain is the covenant kept; the strange woman is the covenant betrayed.
--   ★ THE ALL-SEEING EYE (THREAD 4): *For the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings* (5:21) — the answer to the adulterer who thinks himself hidden. The same book says it plainly: *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good* (15:3). The restored witness draws the very self-deceiving thought and shatters it: *A man that breaks wedlock, saying thus in his heart, Who seeth me?... knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men* (Sirach 23:18-19). And the NT seals it: *all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). There is no secret place for the strange-woman's path.
--   ★ SIN SELF-BINDING (THREAD 5): *His own iniquities shall take the wicked himself, and he shall be holden with the cords of his sins* (5:22). The sin is its own snare and its own jailer — the principle the Torah set at Jordan: *be sure your sin will find you out* (Numbers 32:23) — and the NT keeps as unbreakable law: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap. For he that soweth to his flesh shall of the flesh reap corruption* (Galatians 6:7-8). The man who would not be bound by instruction (5:23) is bound instead by the cords of his own sins.
--   EXTRAS: Sirach (Ecclesiasticus) double-written edition 'apocrypha' + book 'ecclesiasticus'. Clean witnesses pulled: 9:3, 9:8 (the harlot/strange woman, THREAD 1), 23:18, 23:19 (the adulterer who says "who seeth me", THREAD 4). Sirach 23:22-27 (the wife that breaks wedlock) weighed but not forced — 23:18-19 carries the all-seeing-eye nexus cleanest against 5:21.

CREATE TEMP VIEW _s304_pr05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: The strange woman's lips drop honeycomb but her end is bitter as wormwood
    ('canon','proverbs',5,3,'canon','proverbs',2,18,'free',
      E'*For her house inclineth unto death, and her paths unto the dead* (Proverbs 2:18). The honey-mouthed strange woman whose *lips of a strange woman drop as an honeycomb* (Proverbs 5:3) is the same figure the book has already drawn: *her house inclineth unto death, and her paths unto the dead*. The sweetness on the lips and the death at the end are one warning sounded twice.'),
    ('canon','proverbs',5,4,'canon','proverbs',2,19,'free',
      E'*None that go unto her return again, neither take they hold of the paths of life* (Proverbs 2:19). Why is *her end... bitter as wormwood, sharp as a twoedged sword* (Proverbs 5:4)? Because, as the book has said, *None that go unto her return again, neither take they hold of the paths of life*. The path that seems sweet does not loop back to life; it is a one-way descent.'),
    ('canon','proverbs',5,5,'canon','proverbs',7,27,'free',
      E'*Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27). The feet of the strange woman that *go down to death; her steps take hold on hell* (Proverbs 5:5) are the same feet the ch7 discourse traces: *Her house is the way to hell, going down to the chambers of death*. The address is identical — the door of the strange woman opens on the grave.'),
    ('canon','proverbs',5,5,'canon','proverbs',7,26,'free',
      E'*For she hath cast down many wounded: yea, many strong men have been slain by her* (Proverbs 7:26). The death of *Her feet go down to death; her steps take hold on hell* (Proverbs 5:5) is no idle threat: *she hath cast down many wounded: yea, many strong men have been slain by her*. Strength is no defence; the strong men lie among her slain.'),
    ('canon','proverbs',5,6,'canon','proverbs',14,12,'free',
      E'*There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). The strange woman''s path, whose *ways are moveable, that thou canst not know them* (Proverbs 5:6), is the very paradigm of the way that *seemeth right unto a man, but the end thereof are the ways of death*. The honey on the lips is the seeming-right; the wormwood is the end.'),
    ('canon','proverbs',5,4,'canon','2-peter',2,18,'extras',
      E'*For when they speak great swelling words of vanity, they allure through the lusts of the flesh, through much wantonness, those that were clean escaped from them who live in error* (2 Peter 2:18). The smoother-than-oil mouth of the strange woman, whose *end is bitter as wormwood* (Proverbs 5:4), is carried forward in the false teachers who *speak great swelling words of vanity, they allure through the lusts of the flesh*. The seduction-by-flattery unto death is one figure across the library.'),
    ('canon','proverbs',5,4,'canon','2-peter',2,19,'extras',
      E'*While they promise them liberty, they themselves are the servants of corruption: for of whom a man is overcome, of the same is he brought in bondage* (2 Peter 2:19). The bitter end of *her end is bitter as wormwood* (Proverbs 5:4) is exactly this false promise: *they promise them liberty, they themselves are the servants of corruption*. The strange woman and the false teacher both sell a liberty that is bondage.'),
    ('canon','proverbs',5,3,'apocrypha','ecclesiasticus',9,3,'extras',
      E'*Meet not with an harlot, lest you fall into her snares* (Sirach 9:3). The honey-lipped strange woman of *the lips of a strange woman drop as an honeycomb* (Proverbs 5:3) is the harlot the restored witness warns against: *Meet not with an harlot, lest you fall into her snares*. The wisdom is one — keep far, for the snare is set in the sweetness.'),
    ('canon','proverbs',5,3,'apocrypha','ecclesiasticus',9,8,'extras',
      E'*Turn away your eye from a beautiful woman, and look not upon another''s beauty; for many have been deceived by the beauty of a woman; for herewith love is kindled as a fire* (Sirach 9:8). The smoother-than-oil mouth of Proverbs 5:3 deceives as the restored witness warns: *many have been deceived by the beauty of a woman; for herewith love is kindled as a fire*. The counsel matches the proverb''s — *Remove thy way far from her* (5:8) is *Turn away your eye*.'),

    -- THREAD 2: Thou mourn at the last — How have I hated instruction
    ('canon','proverbs',5,12,'canon','proverbs',1,24,'free',
      E'*Because I have called, and ye refused; I have stretched out my hand, and no man regarded* (Proverbs 1:24). The latter-day cry *How have I hated instruction, and my heart despised reproof* (Proverbs 5:12) is the answer to Wisdom''s long-rejected call: *I have called, and ye refused; I have stretched out my hand, and no man regarded*. The hating of instruction was the refusing of the outstretched hand.'),
    ('canon','proverbs',5,12,'canon','proverbs',1,26,'free',
      E'*I also will laugh at your calamity; I will mock when your fear cometh* (Proverbs 1:26). The mourning *at the last, when thy flesh and thy body are consumed* (Proverbs 5:11) is the calamity Wisdom foretold: *I also will laugh at your calamity; I will mock when your fear cometh*. The reproof despised in the day of choosing is the calamity wept over in the day of ruin.'),
    ('canon','proverbs',5,13,'canon','proverbs',29,1,'free',
      E'*He, that being often reproved hardeneth his neck, shall suddenly be destroyed, and that without remedy* (Proverbs 29:1). The man who *have not obeyed the voice of my teachers, nor inclined mine ear to them that instructed me* (Proverbs 5:13) is the often-reproved one who *hardeneth his neck*, and so *shall suddenly be destroyed, and that without remedy*. The unbent neck breaks beyond mending.'),

    -- THREAD 3: Drink waters out of thine own cistern — rejoice with the wife of thy youth (THE HEART)
    ('canon','proverbs',5,18,'canon','malachi',2,14,'free',
      E'*Yet ye say, Wherefore? Because Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant* (Malachi 2:14). The very phrase of *rejoice with the wife of thy youth* (Proverbs 5:18) returns in Malachi as a covenant Yahuah Himself witnesses: *the wife of thy youth... is thy companion, and the wife of thy covenant*. Marriage is not appetite but covenant, and Yahuah stands witness to it.'),
    ('canon','proverbs',5,18,'canon','malachi',2,15,'free',
      E'*And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth* (Malachi 2:15). The own-fountain faithfulness of Proverbs 5:18 is bound by Malachi to the seed-of-promise itself: the one-flesh union is *That he might seek a godly seed*. Covenant marriage carries the godly seed; treachery against the wife of one''s youth strikes at the lineage of promise.'),
    ('canon','proverbs',5,15,'canon','genesis',2,24,'free',
      E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). The own cistern, the own well of *Drink waters out of thine own cistern* (Proverbs 5:15), is the one-flesh ordinance set in the garden: *shall cleave unto his wife: and they shall be one flesh*. The fountain a man drinks from is the wife he is made one with; to go elsewhere is to break the one flesh.'),
    ('canon','proverbs',5,18,'canon','song-of-solomon',4,12,'free',
      E'*A garden inclosed is my sister, my spouse; a spring shut up, a fountain sealed* (Song of Solomon 4:12). The blessed, kept fountain of *Let thy fountain be blessed: and rejoice with the wife of thy youth* (Proverbs 5:18) is the Song''s sealed garden: *a spring shut up, a fountain sealed*. The fountain is for the covenant spouse alone — *Let them be only thine own, and not strangers'' with thee* (5:17).'),
    ('canon','proverbs',5,20,'canon','exodus',20,14,'free',
      E'*Thou shalt not commit adultery* (Exodus 20:14). Behind the whole question of *why wilt thou, my son, be ravished with a strange woman, and embrace the bosom of a stranger?* (Proverbs 5:20) stands the seventh word, spoken at Sinai and never repealed: *Thou shalt not commit adultery*. The chapter is the seventh commandment unfolded into a father''s plea.'),
    ('canon','proverbs',5,20,'canon','deuteronomy',5,18,'free',
      E'*Neither shalt thou commit adultery* (Deuteronomy 5:18). The strange-woman warning of Proverbs 5:20 rests on the word Moses set before all Yashar''el (Israel) a second time: *Neither shalt thou commit adultery*. The Torah is not the curse but the covenant fence around the wife of one''s youth; Proverbs only preaches what Sinai commanded.'),
    ('canon','proverbs',5,19,'canon','hebrews',13,4,'free',
      E'*Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge* (Hebrews 13:4). The delight commanded in *let her breasts satisfy thee at all times; and be thou ravished always with her love* (Proverbs 5:19) is the honourable, undefiled bed the NT upholds: *Marriage is honourable in all, and the bed undefiled*. The same verse keeps the seventh word standing — *whoremongers and adulterers Elohim (God) will judge*.'),

    -- THREAD 4: The ways of man are before the eyes of Yahuah
    ('canon','proverbs',5,21,'canon','proverbs',15,3,'free',
      E'*The eyes of Yahuah (LORD) are in every place, beholding the evil and the good* (Proverbs 15:3). The all-seeing answer to the secret-keeping adulterer, *the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings* (Proverbs 5:21), is stated plain by the same book: *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good*. There is no path the eye does not see.'),
    ('canon','proverbs',5,21,'canon','hebrews',4,13,'free',
      E'*Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The pondered goings of *he pondereth all his goings* (Proverbs 5:21) are the NT''s *all things are naked and opened unto the eyes of him with whom we have to do*. The eye that weighs every step is unchanged from Proverbs to the apostles; nothing is hid.'),
    ('canon','proverbs',5,21,'apocrypha','ecclesiasticus',23,18,'extras',
      E'*A man that breaks wedlock, saying thus in his heart, Who seeth me? I am compassed about with darkness, the walls cover me, and no body seeth me; what need I to fear? the Most High will not remember my sins* (Sirach 23:18). The restored witness draws the very self-deceiving thought Proverbs 5:21 refutes — the wedlock-breaker who says *Who seeth me?* — against whom *the ways of man are before the eyes of Yahuah (LORD)* stands as the answer. The darkness he trusts is no cover at all.'),
    ('canon','proverbs',5,21,'apocrypha','ecclesiasticus',23,19,'extras',
      E'*Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Sirach 23:19). This is *the ways of man are before the eyes of Yahuah (LORD)* (Proverbs 5:21) made vivid: *the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men*. The eye that beholds all the ways is the eye before which the strange-woman''s path is laid bare.'),

    -- THREAD 5: His own iniquities shall take the wicked himself
    ('canon','proverbs',5,22,'canon','numbers',32,23,'free',
      E'*But if ye will not do so, behold, ye have sinned against Yahuah (LORD): and be sure your sin will find you out* (Numbers 32:23). The self-binding of *His own iniquities shall take the wicked himself, and he shall be holden with the cords of his sins* (Proverbs 5:22) is the principle Moses set at Jordan: *be sure your sin will find you out*. The sin is its own pursuer; it lays hold of the sinner himself.'),
    ('canon','proverbs',5,22,'canon','galatians',6,7,'free',
      E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The cords of one''s own sins in *he shall be holden with the cords of his sins* (Proverbs 5:22) are the harvest of *whatsoever a man soweth, that shall he also reap*. The NT keeps the proverb as unbreakable law — the wicked is taken by his own iniquities.'),
    ('canon','proverbs',5,23,'canon','galatians',6,8,'free',
      E'*For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:8). The man who *shall die without instruction; and in the greatness of his folly he shall go astray* (Proverbs 5:23) is he who *soweth to his flesh* and *shall of the flesh reap corruption*. The strange-woman''s path is sowing to the flesh, and its wage is the corruption Proverbs calls dying without instruction.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood',
       E'The strange woman''s lips drop honeycomb — but her end is bitter as wormwood',
       E'The chapter''s first warning is the seduction-unto-death: *For the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil: But her end is bitter as wormwood, sharp as a twoedged sword. Her feet go down to death; her steps take hold on hell* (Proverbs 5:3-5). The honey on the lips and the wormwood at the end are one figure the whole book sounds again and again: *her house inclineth unto death, and her paths unto the dead. None that go unto her return again, neither take they hold of the paths of life* (2:18-19); *she hath cast down many wounded: yea, many strong men have been slain by her. Her house is the way to hell, going down to the chambers of death* (7:26-27). It is the very paradigm of *There is a way which seemeth right unto a man, but the end thereof are the ways of death* (14:12) — the sweetness is the seeming-right, the wormwood the end. The restored witness keeps the same gate: *Meet not with an harlot, lest you fall into her snares* (Sirach 9:3); *Turn away your eye from a beautiful woman... for many have been deceived by the beauty of a woman; for herewith love is kindled as a fire* (Sirach 9:8). And the New Testament carries the figure forward into the false teachers who seduce by the same flattery and the same false promise: *when they speak great swelling words of vanity, they allure through the lusts of the flesh, through much wantonness* (2 Peter 2:18); *While they promise them liberty, they themselves are the servants of corruption* (2 Peter 2:19). The counsel is the same in every witness — *Remove thy way far from her, and come not nigh the door of her house* (5:8) — for the door of the strange woman opens on the grave. The warning dismantles the snare, never the person: she is the seduction the son must flee, and the father pleads for his son''s life.',
       sv.verse_id, ev.verse_id, 'extras', 28100
  FROM _s304_pr05_lookup sv, _s304_pr05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-5-thou-mourn-at-the-last-how-have-i-hated-instruction',
       E'Thou mourn at the last — How have I hated instruction',
       E'The chapter turns to the bitter latter-day cry of the man who took the strange-woman''s path: *And thou mourn at the last, when thy flesh and thy body are consumed, And say, How have I hated instruction, and my heart despised reproof; And have not obeyed the voice of my teachers, nor inclined mine ear to them that instructed me!* (Proverbs 5:11-13). This is the very calamity Wisdom foretold at the book''s opening, to the ones who would not hear: *Because I have called, and ye refused; I have stretched out my hand, and no man regarded* (1:24), *I also will laugh at your calamity; I will mock when your fear cometh* (1:26). The hating of instruction in the day of choosing becomes the mourning over instruction in the day of ruin. And it is the doom of the hardened neck: *He, that being often reproved hardeneth his neck, shall suddenly be destroyed, and that without remedy* (29:1). The reproof a man will not bend his ear to in time becomes the reproof he weeps over too late, when flesh and body are consumed and there is no remedy left.',
       sv.verse_id, ev.verse_id, 'free', 28103
  FROM _s304_pr05_lookup sv, _s304_pr05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (THE HEART)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-5-drink-waters-out-of-thine-own-cistern-rejoice-with-the-wife-of-thy-youth',
       E'Drink waters out of thine own cistern — rejoice with the wife of thy youth',
       E'Against the strange woman the chapter sets its framework heart — covenant-marriage faithfulness: *Drink waters out of thine own cistern, and running waters out of thine own well... Let them be only thine own, and not strangers'' with thee. Let thy fountain be blessed: and rejoice with the wife of thy youth* (Proverbs 5:15-18). The very phrase returns in Malachi as a covenant Yahuah (LORD) Himself witnesses: *Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant* (Malachi 2:14) — and Malachi binds the one-flesh union to the seed of promise: *And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth* (2:15). The own cistern reaches back to the ordinance set in the garden — *shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24) — and the Song sings the kept, sealed fountain: *A garden inclosed is my sister, my spouse; a spring shut up, a fountain sealed* (Song of Solomon 4:12). Behind the whole chapter stands the seventh word, spoken at Sinai and never repealed: *Thou shalt not commit adultery* (Exodus 20:14; Deuteronomy 5:18) — the Torah is not the curse but the covenant fence around the wife of one''s youth. And the New Testament keeps that word whole, never abolishing it: *Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge* (Hebrews 13:4). So the chapter''s closing question answers itself — *why wilt thou, my son, be ravished with a strange woman, and embrace the bosom of a stranger?* (5:20) — when the blessed fountain, the wife of thy youth, is thine own.',
       sv.verse_id, ev.verse_id, 'free', 28106
  FROM _s304_pr05_lookup sv, _s304_pr05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-5-the-ways-of-man-are-before-the-eyes-of-yahuah',
       E'The ways of man are before the eyes of Yahuah',
       E'To the adulterer who thinks himself hidden the chapter sets the all-seeing eye: *For the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings* (Proverbs 5:21). The same book says it plainly: *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good* (15:3). The restored witness draws the very self-deceiving thought of the wedlock-breaker and shatters it: *A man that breaks wedlock, saying thus in his heart, Who seeth me? I am compassed about with darkness, the walls cover me, and no body seeth me; what need I to fear?* (Sirach 23:18) — *Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Sirach 23:19). And the New Testament seals it: *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The darkness the strange-woman''s path trusts is no cover at all; every secret going is pondered before the eyes of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 28109
  FROM _s304_pr05_lookup sv, _s304_pr05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-5-his-own-iniquities-shall-take-the-wicked-himself',
       E'His own iniquities shall take the wicked himself',
       E'The chapter closes on sin as its own snare and jailer: *His own iniquities shall take the wicked himself, and he shall be holden with the cords of his sins. He shall die without instruction; and in the greatness of his folly he shall go astray* (Proverbs 5:22-23). This is the principle Moses set before Yashar''el (Israel) at the Jordan: *behold, ye have sinned against Yahuah (LORD): and be sure your sin will find you out* (Numbers 32:23) — the sin is its own pursuer, and it lays hold of the sinner himself. And the New Testament keeps it as unbreakable law: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap. For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:7-8). The man who would not be bound by instruction is bound instead by the cords of his own sins; the strange-woman''s path is sowing to the flesh, and its wage is the corruption Proverbs calls dying without instruction.',
       sv.verse_id, ev.verse_id, 'free', 28112
  FROM _s304_pr05_lookup sv, _s304_pr05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=5 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*her house inclineth unto death, and her paths unto the dead* (Proverbs 2:18) — the honey-mouthed strange woman of 5:3 is the same death-figure the book already drew.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*None that go unto her return again, neither take they hold of the paths of life* (Proverbs 2:19) — why her end is bitter as wormwood (5:4): the path does not loop back to life.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27) — the feet that go down to death (5:5) reach the same address the ch7 discourse traces.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*many strong men have been slain by her* (Proverbs 7:26) — the death of 5:5 is no idle threat; strength is no defence against her.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12) — the strange-woman''s moveable ways (5:6) are the paradigm of the seeming-right path with a death-end.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they allure through the lusts of the flesh, through much wantonness* (2 Peter 2:18) — the smoother-than-oil mouth of 5:4 carried forward into the false teachers who seduce by the same flattery.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*they promise them liberty, they themselves are the servants of corruption* (2 Peter 2:19) — the bitter end of 5:4 is the false promise; the strange woman and the false teacher both sell a liberty that is bondage.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Meet not with an harlot, lest you fall into her snares* (Sirach 9:3) — the restored witness keeps the same gate as 5:3; the snare is set in the sweetness.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*many have been deceived by the beauty of a woman; for herewith love is kindled as a fire* (Sirach 9:8) — the deceiving sweetness of 5:3; the restored counsel matches "Remove thy way far from her" (5:8).'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=9 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-strange-womans-lips-drop-honeycomb-but-her-end-is-bitter-as-wormwood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I have called, and ye refused; I have stretched out my hand, and no man regarded* (Proverbs 1:24) — the cry "How have I hated instruction" (5:12) answers Wisdom''s long-rejected call.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-thou-mourn-at-the-last-how-have-i-hated-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I also will laugh at your calamity; I will mock when your fear cometh* (Proverbs 1:26) — the mourning at the last (5:11) is the calamity Wisdom foretold for the reproof-despiser.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-thou-mourn-at-the-last-how-have-i-hated-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*being often reproved hardeneth his neck, shall suddenly be destroyed, and that without remedy* (Proverbs 29:1) — the man who inclined no ear to his teachers (5:13) is the hardened neck that breaks beyond mending.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-thou-mourn-at-the-last-how-have-i-hated-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the wife of thy youth... is thy companion, and the wife of thy covenant* (Malachi 2:14) — the very phrase of 5:18 returns as a covenant Yahuah Himself witnesses.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-drink-waters-out-of-thine-own-cistern-rejoice-with-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And wherefore one? That he might seek a godly seed* (Malachi 2:15) — the own-fountain faithfulness of 5:18 bound to the seed of promise; marriage carries the godly seed.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-drink-waters-out-of-thine-own-cistern-rejoice-with-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24) — the own cistern of 5:15 is the one-flesh ordinance set in the garden.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-drink-waters-out-of-thine-own-cistern-rejoice-with-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a spring shut up, a fountain sealed* (Song of Solomon 4:12) — the blessed, kept fountain of 5:18 is the Song''s sealed garden, for the covenant spouse alone.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='song-of-solomon' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-drink-waters-out-of-thine-own-cistern-rejoice-with-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Thou shalt not commit adultery* (Exodus 20:14) — the seventh word at Sinai stands behind the strange-woman question of 5:20; the chapter is that commandment unfolded.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=20
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-drink-waters-out-of-thine-own-cistern-rejoice-with-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Neither shalt thou commit adultery* (Deuteronomy 5:18) — Moses set the word a second time before all Yashar''el; the Torah is the covenant fence Proverbs 5:20 preaches.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=20
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-drink-waters-out-of-thine-own-cistern-rejoice-with-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge* (Hebrews 13:4) — the delight commanded in 5:19 is the honourable bed the NT upholds; the seventh word stands.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=19
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-drink-waters-out-of-thine-own-cistern-rejoice-with-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The eyes of Yahuah (LORD) are in every place, beholding the evil and the good* (Proverbs 15:3) — the all-seeing answer to 5:21 stated plain by the same book.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-ways-of-man-are-before-the-eyes-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13) — the pondered goings of 5:21 unchanged into the NT; nothing is hid.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-ways-of-man-are-before-the-eyes-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*A man that breaks wedlock, saying thus in his heart, Who seeth me?* (Sirach 23:18) — the very self-deceiving thought 5:21 refutes; the darkness he trusts is no cover.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-ways-of-man-are-before-the-eyes-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men* (Sirach 23:19) — 5:21 made vivid; the eye that beholds all the ways lays the strange-woman''s path bare.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-the-ways-of-man-are-before-the-eyes-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*ye have sinned against Yahuah (LORD): and be sure your sin will find you out* (Numbers 32:23) — the self-binding of 5:22 is the principle Moses set at Jordan; sin is its own pursuer.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=32 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-his-own-iniquities-shall-take-the-wicked-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — the cords of one''s own sins (5:22) are the harvest; the NT keeps the proverb as unbreakable law.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-his-own-iniquities-shall-take-the-wicked-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he that soweth to his flesh shall of the flesh reap corruption* (Galatians 6:8) — the man who dies without instruction (5:23) sows to the flesh; the strange-woman''s path reaps corruption.'
  FROM cross_reference_threads t
  JOIN _s304_pr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=5 AND sv.verse_number=23
  JOIN _s304_pr05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-5-his-own-iniquities-shall-take-the-wicked-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
