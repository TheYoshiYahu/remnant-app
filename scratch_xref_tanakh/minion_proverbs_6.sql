-- ----- fragment: minion_proverbs_6.sql (Proverbs 6) -----
-- Chapter: Proverbs 6 — the father's instruction unfolds through four warnings: the snare of suretyship (1-5), the sluggard rebuked by the ant (6-11), the worthless man of Belial who soweth discord (12-15), the SEVEN things Yahuah hates (16-19), and the FRAMEWORK-HEAVYWEIGHT charge — *keep thy father's commandment, and forsake not the law of thy mother... For the commandment is a lamp; and the law is light; and reproofs of instruction are the way of life* (6:20-23) — guarding the son from the strange woman (24-35). The Torah-is-light verse (6:23) is the anti-antinomian centerpiece: the commandment a lamp, the Torah light, the way of life — never abolished.
-- Tag: pr06   Temp view: _s304_pr06_lookup   Session prefix: s304
-- Sort band: base 28125, step 3 -> threads at 28125, 28128, 28131, 28134, 28137 (5 threads)
-- Source of EVERY row: 'canon','proverbs',6,v
--
-- Proverbs 6 coverage:
--   v.1-5 (My son, if thou be surety for thy friend... deliver thyself as a roe from the hand of the hunter)
--        NT:     none warranted (the suretyship-snare warning is prudential; the surety motif that bears framework weight — Yahudah's surety for Benjamin, Messiah our surety — belongs to Genesis 43/44 and Hebrews 7:22, not forced onto a stand-alone warning here)
--        Extras: none warranted (Sirach 29:14-20 on suretyship weighed; prudential, no clean framework hinge — not forced)
--        Tanakh: none warranted distinct (Proverbs 11:15 / 17:18 / 22:26 are the lateral suretyship sayings; carried within Proverbs' own wisdom corpus, no thread forced)
--   v.6-11 (Go to the ant, thou sluggard; consider her ways, and be wise... So shall thy poverty come as one that travelleth) — THREAD 1
--        NT:     2 Thessalonians 3:10 (if any would not work, neither should he eat) — THREAD 1
--        Extras: none warranted distinct (Sirach diligence sayings weighed; the Tanakh laterals + NT carry it cleanly)
--        Tanakh: Proverbs 10:4 (the hand of the diligent maketh rich); Proverbs 24:30-34 (I went by the field of the slothful... yet a little sleep, a little slumber) — THREAD 1 (the sluggard's overgrown field, the verbatim "a little sleep" refrain)
--   v.12-15 (A naughty person, a wicked man, walketh with a froward mouth... he soweth discord) — THREAD 2
--        NT:     Romans 16:17-18 (mark them which cause divisions... by good words and fair speeches deceive the hearts of the simple) — THREAD 2
--        Extras: Sirach 27:22 (He that winketh with the eyes works evil) — THREAD 2 (near-verbatim of 6:13 he winketh with his eyes)
--        Tanakh: carried within THREAD 3 (he that soweth discord is the seventh abomination of 6:19)
--   ★ v.16-19 (These six things doth Yahuah hate: yea, seven are an abomination unto him...) — THREAD 3
--        NT:     none warranted distinct (the numbered hate-list is a Tanakh/wisdom form; the NT abomination weave is diffuse, not forced)
--        Extras: Sirach 25:2 (Three sorts of men my soul hates... an old adulterer that doateth) — THREAD 3 (the things-Yahuah-hates list form)
--        Tanakh: Deuteronomy 25:16 (all that do unrighteously are an abomination unto Yahuah); Proverbs 12:22 (Lying lips are abomination to Yahuah); Genesis 9:6 (Whoso sheddeth man's blood... for in the image of Elohim made he man); Deuteronomy 19:10 (that innocent blood be not shed) — THREAD 3
--   ★★ v.20-23 (My son, keep thy father's commandment, and forsake not the law of thy mother... For the commandment is a lamp; and the law is light) — THREAD 4 (FRAMEWORK HEAVYWEIGHT)
--        NT:     1 John 2:8 (the darkness is past, and the true light now shineth); Matthew 5:14 (Ye are the light of the world); Matthew 5:17-19 (I am not come to destroy... one jot or one tittle shall in no wise pass from the law) — THREAD 4 (the Torah-as-light NOT abolished)
--        Extras: none warranted distinct (the lamp/light/Torah cluster is carried wholly by Psalm 119/Psalm 19/Deuteronomy 6/Isaiah 8 + the NT; no extras witness closer)
--        Tanakh: ★ Psalm 119:105 (Thy word is a lamp unto my feet, and a light unto my path); Psalm 19:8 (the commandment of Yahuah is pure, enlightening the eyes); Deuteronomy 6:6-8 (bind them for a sign upon thine hand — the very language 6:21 echoes); Isaiah 8:20 (To the law and to the testimony... there is no light in them) — THREAD 4
--   v.24-35 (To keep thee from the evil woman... Can a man take fire in his bosom, and his clothes not be burned? ... jealousy is the rage of a man) — THREAD 5
--        NT:     none warranted distinct (Matthew 5:27-28 lust-in-the-heart weighed; the seventh-word forward-weave belongs to Proverbs 5 / Exodus 20 source-threads, not forced here)
--        Extras: Sirach 23:18-19 (A man that breaks wedlock... Who seeth me? ... the eyes of Yahuah are ten thousand times brighter than the sun); Sirach 23:16-17 (a fornicator in the body of his flesh will never cease till he has kindled a fire) — THREAD 5
--        Tanakh: Exodus 20:14 (Thou shalt not commit adultery); Deuteronomy 5:18 (Neither shalt thou commit adultery) — THREAD 5 (the seventh word the commandment guards)
--
-- Threads (slug — target libraries):
--   1. proverbs-6-go-to-the-ant-thou-sluggard-consider-her-ways — Tanakh (Proverbs 10, 24) + NT (2 Thessalonians) [free] (diligence from creation; the ant's wisdom; he that will not work)
--   2. proverbs-6-the-man-of-belial-soweth-discord — Tanakh-source + NT (Romans 16) + Extras (Sirach 27) [extras] (the worthless man, mark them which cause divisions — conduct, not ethnicity)
--   3. proverbs-6-these-six-things-doth-yahuah-hate-yea-seven — Tanakh (Deuteronomy 25, 19; Genesis 9; Proverbs 12) + Extras (Sirach 25) [extras] (★ the numbered abomination-list; the hated things of the Torah; innocent blood)
--   4. proverbs-6-the-commandment-is-a-lamp-and-the-law-is-light — Tanakh (Psalm 119, 19; Deuteronomy 6; Isaiah 8) + NT (1 John 2; Matthew 5) [free] (★★ FRAMEWORK HEAVYWEIGHT: the Torah is light, the way of life, NOT abolished)
--   5. proverbs-6-the-commandment-keepeth-from-the-strange-woman — Tanakh (Exodus 20; Deuteronomy 5) + Extras (Sirach 23) [extras] (the seventh word kept; can a man take fire in his bosom; covenant-faithfulness, victims not enemies)
--
-- Framing notes:
--   ★★ THE COMMANDMENT IS A LAMP, THE TORAH IS LIGHT (THREAD 4): *For the commandment is a lamp; and the law is light; and reproofs of instruction are the way of life* (6:23). This is the anti-antinomian centerpiece of the chapter. The son is charged *keep thy father's commandment, and forsake not the law of thy mother... Bind them continually upon thine heart, and tie them about thy neck* (6:20-21) — the very binding-language of the Shema (*thou shalt bind them for a sign upon thine hand* — Deuteronomy 6:8). The Torah is named LAMP and LIGHT and the WAY OF LIFE — never a defunct burden. Psalm 119:105 sings it (*Thy word is a lamp unto my feet, and a light unto my path*); Psalm 19:8 (*the commandment of Yahuah is pure, enlightening the eyes*); Isaiah measures every spirit by it (*To the law and to the testimony... there is no light in them*). And the Formed Son who IS the light does not abolish that light — *I am not come to destroy, but to fulfil... one jot or one tittle shall in no wise pass from the law* (Matthew 5:17-18); the *true light now shineth* in the keeping of *an old commandment which ye had from the beginning* (1 John 2:7-8). The lamp is the commandment; the light is the Torah; both still shine.
--   ★ THE SEVEN THINGS YAHUAH HATES (THREAD 3): *These six things doth Yahuah (LORD) hate: yea, seven are an abomination unto him* (6:16). A self-contained numbered list, climaxing in *he that soweth discord among brethren* (6:19) — binding THREAD 2 into it. Each hated thing has its Torah root: *hands that shed innocent blood* (6:17) is the image-of-Elohim blood-guilt of *Whoso sheddeth man's blood, by man shall his blood be shed: for in the image of Elohim made he man* (Genesis 9:6) and the land-defiling *innocent blood* of Deuteronomy 19:10; *a lying tongue* / *a false witness that speaketh lies* (6:17,19) is the *Lying lips are abomination to Yahuah* of Proverbs 12:22; and the whole list answers Deuteronomy 25:16's *all that do unrighteously, are an abomination unto Yahuah*. These are hated CONDUCT, never hated peoples.
--   BELIAL / SEED-WAR (THREAD 2): *A naughty person, a wicked man, walketh with a froward mouth... he soweth discord* (6:12,14) — the man of Belial read by conduct. Sha'ul (Paul) names the same discord-sower in the assembly: *mark them which cause divisions and offences contrary to the doctrine... by good words and fair speeches deceive the hearts of the simple* (Romans 16:17-18). NOT an ethnic enemy; a conduct to be marked and avoided.
--   THE STRANGE WOMAN (THREAD 5): the commandment-lamp's first guard is *To keep thee from the evil woman, from the flattery of the tongue of a strange woman* (6:24). The Torah's seventh word stands behind it (*Thou shalt not commit adultery* — Exodus 20:14 / Deuteronomy 5:18); *Can a man take fire in his bosom, and his clothes not be burned?* (6:27). Sirach keeps the same warning — the adulterer who says *Who seeth me?* not knowing *the eyes of Yahuah are ten thousand times brighter than the sun* (Sirach 23:18-19). Framed as covenant-faithfulness and the ruin of the unfaithful — the adulteress is a snare named, the warning is to the son, not contempt for women.
--   EXTRAS double-written: Sirach edition 'apocrypha' + book 'ecclesiasticus' (Sirach 25:2, 27:22, 23:16, 23:18, 23:19). All clean parses, verified via dump_canon.
--   VERSES WITH NO ADD: v.1-5 (the suretyship-snare warning) — no thread; prudential wisdom whose framework-bearing surety motif lives in Genesis 43/44 (Yahudah's surety) and Hebrews 7:22 (Messiah surety), not forced onto this stand-alone caution; the lateral Proverbs 11:15/17:18/22:26 sayings carry it within the book's own corpus.

CREATE TEMP VIEW _s304_pr06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Go to the ant, thou sluggard (diligence from creation)
    ('canon','proverbs',6,6,'canon','proverbs',24,30,'free',
      E'*I went by the field of the slothful, and by the vineyard of the man void of understanding; And, lo, it was all grown over with thorns, and nettles had covered the face thereof, and the stone wall thereof was broken down* (Proverbs 24:30-31). The sluggard sent to the ant — *Go to the ant, thou sluggard; consider her ways, and be wise* (6:6) — is shown his own end: a field choked with thorns, the wall broken down. The ant that *provideth her meat in the summer* (6:8) is the rebuke to the man whose vineyard the slothfulness ruins.'),
    ('canon','proverbs',6,10,'canon','proverbs',24,33,'free',
      E'*Yet a little sleep, a little slumber, a little folding of the hands to sleep: So shall thy poverty come as one that travelleth; and thy want as an armed man* (Proverbs 24:33-34). The very words of 6:10-11 — *Yet a little sleep, a little slumber, a little folding of the hands to sleep: So shall thy poverty come as one that travelleth, and thy want as an armed man* — are repeated verbatim over the slothful man''s overgrown field. The sluggard''s "little sleep" is the same refrain in both: poverty creeps in like a robber upon the one who will not rouse.'),
    ('canon','proverbs',6,8,'canon','proverbs',10,4,'free',
      E'*He becometh poor that dealeth with a slack hand: but the hand of the diligent maketh rich* (Proverbs 10:4). The ant who *gathereth her food in the harvest* (6:8) is the diligent hand: the creature with *no guide, overseer, or ruler* (6:7) yet provident teaches the proverb of the slack hand against the diligent. The slothful folds his hands to sleep; the diligent, like the ant, lays up in the harvest.'),
    ('canon','proverbs',6,9,'canon','2-thessalonians',3,10,'free',
      E'*For even when we were with you, this we commanded you, that if any would not work, neither should he eat* (2 Thessalonians 3:10). The rebuke *How long wilt thou sleep, O sluggard? when wilt thou arise out of thy sleep?* (6:9) is carried forward into the assembly''s order: *if any would not work, neither should he eat*. The ant''s wisdom — provident, self-moved, laboring without a taskmaster — becomes the apostolic rule against idleness; the sluggard''s want (6:11) is the wage of the will that will not work.'),

    -- THREAD 2: The man of Belial soweth discord (the worthless man)
    ('canon','proverbs',6,12,'canon','romans',16,17,'free',
      E'*Now I beseech you, brethren, mark them which cause divisions and offences contrary to the doctrine which ye have learned; and avoid them* (Romans 16:17). The worthless man — *A naughty person, a wicked man, walketh with a froward mouth... he soweth discord* (6:12,14) — is the very one Sha''ul (Paul) bids the assembly mark: *them which cause divisions and offences*. The discord-sower of the proverb and the division-maker of the assembly are one conduct, to be marked and avoided.'),
    ('canon','proverbs',6,14,'canon','romans',16,18,'free',
      E'*For they that are such serve not our Lord Yahusha HaMashiach (Lord Jesus Christ), but their own belly; and by good words and fair speeches deceive the hearts of the simple* (Romans 16:18). The man who *deviseth mischief continually; he soweth discord* (6:14) is unmasked: such *by good words and fair speeches deceive the hearts of the simple*. He winks and signals (6:13) while his heart frames mischief; the smooth speech is the cover of the discord he sows — conduct to be discerned, never an ethnicity to be hated.'),
    ('canon','proverbs',6,13,'apocrypha','ecclesiasticus',27,22,'extras',
      E'*He that winketh with the eyes works evil: and he that knoweth him will depart from him* (Sirach 27:22). The body-language of the worthless man — *He winketh with his eyes, he speaketh with his feet, he teacheth with his fingers* (6:13) — is named almost verbatim in the restored witness: *He that winketh with the eyes works evil*. The wink is the secret signal of the deceiver; the wise man, knowing him, departs from him.'),

    -- THREAD 3: These six things doth Yahuah hate; yea, seven (the abomination-list)
    ('canon','proverbs',6,16,'canon','deuteronomy',25,16,'free',
      E'*For all that do such things, and all that do unrighteously, are an abomination unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 25:16). The numbered hate-list — *These six things doth Yahuah (LORD) hate: yea, seven are an abomination unto him* (6:16) — gathers up the Torah''s own verdict: *all that do unrighteously, are an abomination unto Yahuah*. The proverb counts what the Torah condemns; the things Yahuah hates are deeds of unrighteousness, not peoples.'),
    ('canon','proverbs',6,17,'canon','genesis',9,6,'free',
      E'*Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). Among the seven is *hands that shed innocent blood* (6:17); its root is the covenant with Noah — blood-guilt because man bears the image of Elohim: *for in the image of Elohim made he man*. To shed innocent blood is to deface the image; that is why Yahuah hates the hands that do it.'),
    ('canon','proverbs',6,17,'canon','deuteronomy',19,10,'free',
      E'*That innocent blood be not shed in thy land, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance, and so blood be upon thee* (Deuteronomy 19:10). The *hands that shed innocent blood* (6:17) that Yahuah hates are guarded against by the cities of refuge: *that innocent blood be not shed in thy land... and so blood be upon thee*. The land itself bears the guilt of innocent blood; the Torah builds refuge against it, and the proverb names the shedding hands an abomination.'),
    ('canon','proverbs',6,17,'canon','proverbs',12,22,'free',
      E'*Lying lips are abomination to Yahuah (LORD): but they that deal truly are his delight* (Proverbs 12:22). Twice the hate-list names the false tongue — *a lying tongue* (6:17) and *a false witness that speaketh lies* (6:19) — and the same book seals it: *Lying lips are abomination to Yahuah*. What the seven-list counts, the proverb confesses outright: the lying tongue is the thing Yahuah abhors, the truthful His delight.'),
    ('canon','proverbs',6,16,'apocrypha','ecclesiasticus',25,2,'extras',
      E'*Three sorts of men my soul hates, and I am greatly offended at their life: a poor man that is proud, a rich man that is a liar, and an old adulterer that doateth* (Sirach 25:2). The numbered form of *These six things doth Yahuah (LORD) hate: yea, seven are an abomination unto him* (6:16) is kept by the restored witness, which counts its own list of the hated — *a poor man that is proud, a rich man that is a liar, and an old adulterer*. The pride and the lying tongue Yahuah hates (6:17) stand at the head of both lists.'),

    -- THREAD 4: The commandment is a lamp, and the law is light (FRAMEWORK HEAVYWEIGHT)
    ('canon','proverbs',6,21,'canon','deuteronomy',6,8,'free',
      E'*And thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8). The charge *Bind them continually upon thine heart, and tie them about thy neck* (6:21) is the Shema''s own binding-language: *thou shalt bind them for a sign upon thine hand*. The father''s commandment and the mother''s Torah (6:20) ARE the words Moshe (Moses) bid Yashar''el (Israel) bind on hand and heart — the same Torah, worn continually, the lamp that leads when thou goest (6:22).'),
    ('canon','proverbs',6,23,'canon','psalms',119,105,'free',
      E'*Thy word is a lamp unto my feet, and a light unto my path* (Psalm 119:105). The framework-verse *the commandment is a lamp; and the law is light* (6:23) is sung whole in the great Torah-psalm: *Thy word is a lamp unto my feet, and a light unto my path*. The commandment is the lamp, the Torah the light, the word that shows the foot where to walk — the way of life, not a defunct burden.'),
    ('canon','proverbs',6,23,'canon','psalms',19,8,'free',
      E'*The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes* (Psalm 19:8). The proverb''s *the commandment is a lamp* (6:23) is David''s confession: *the commandment of Yahuah is pure, enlightening the eyes*. The Torah does not blind nor bind; it ENLIGHTENS — gives sight, rejoices the heart, is the light by which the eye sees the way of life.'),
    ('canon','proverbs',6,23,'canon','isaiah',8,20,'free',
      E'*To the law and to the testimony: if they speak not according to this word, it is because there is no light in them* (Isaiah 8:20). Isaiah makes the Torah the very test of light: *To the law and to the testimony... there is no light in them*. The proverb declares it — *the law is light* (6:23) — and the prophet measures every spirit by it: where the law is forsaken there is no light at all. The Torah is the lamp that exposes the dark, never the dark itself.'),
    ('canon','proverbs',6,23,'canon','1-john',2,8,'free',
      E'*Again, a new commandment I write unto you, which thing is true in him and in you: because the darkness is past, and the true light now shineth* (1 John 2:8). The commandment Yochanan (John) writes is *an old commandment which ye had from the beginning* (1 John 2:7) — the same Torah-light of *the commandment is a lamp; and the law is light* (6:23). The *true light now shineth* not by abolishing the commandment but by keeping it; the lamp first lit in Proverbs still burns, the darkness passing as the old-and-true commandment is walked.'),
    ('canon','proverbs',6,23,'canon','matthew',5,14,'free',
      E'*Ye are the light of the world. A city that is set on an hill cannot be hid* (Matthew 5:14). The Torah that *is light* (6:23) makes its keepers light: *Ye are the light of the world*. Yahusha (Jesus) does not extinguish the lamp of the commandment but sets it on the candlestick — *Let your light so shine before men, that they may see your good works* (5:16); the commandment-lamp shines through the lives that keep it.'),
    ('canon','proverbs',6,23,'canon','matthew',5,17,'free',
      E'*Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil. For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled* (Matthew 5:17-18). The plainest seal on *the law is light* (6:23): the Formed Son who IS the light declares the Torah-lamp shall not be put out — *I am not come to destroy, but to fulfil... one jot or one tittle shall in no wise pass from the law*. The commandment that is a lamp, the Torah that is light, is not abolished; it abides till heaven and earth pass, the unbroken way of life.'),

    -- THREAD 5: The commandment keepeth from the strange woman (the seventh word)
    ('canon','proverbs',6,24,'canon','exodus',20,14,'free',
      E'*Thou shalt not commit adultery* (Exodus 20:14). The first guard the commandment-lamp gives is *To keep thee from the evil woman, from the flattery of the tongue of a strange woman* (6:24) — and the wall behind it is the seventh word: *Thou shalt not commit adultery*. The Torah that is light (6:23) keeps the son from the adulteress; the commandment is the lamp that shows the fire for what it is — *Can a man take fire in his bosom, and his clothes not be burned?* (6:27).'),
    ('canon','proverbs',6,29,'canon','deuteronomy',5,18,'free',
      E'*Neither shalt thou commit adultery* (Deuteronomy 5:18). The verdict *So he that goeth in to his neighbour''s wife; whosoever toucheth her shall not be innocent* (6:29) rests on the seventh word repeated in the second giving of the Torah: *Neither shalt thou commit adultery*. The neighbour''s wife is hedged by the commandment; the man who breaks it *destroyeth his own soul* (6:32) — covenant-faithfulness guarded, the unfaithful self-ruined.'),
    ('canon','proverbs',6,25,'apocrypha','ecclesiasticus',23,18,'extras',
      E'*A man that breaks wedlock, saying thus in his heart, Who seeth me? I am compassed about with darkness, the walls cover me, and no body seeth me; what need I to fear? the Most High will not remember my sins* (Sirach 23:18). The lust warned against — *Lust not after her beauty in thine heart; neither let her take thee with her eyelids* (6:25) — is traced to its root in the restored witness: the adulterer''s secret reasoning, *Who seeth me? ... the walls cover me*. The heart that lusts hides behind imagined darkness; the proverb and Sirach alike strip the cover away.'),
    ('canon','proverbs',6,29,'apocrypha','ecclesiasticus',23,19,'extras',
      E'*Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Sirach 23:19). The adulterer who thinks he *shall not be innocent* yet unseen (6:29) is answered: *the eyes of Yahuah are ten thousand times brighter than the sun, beholding all the ways of men*. No wall covers the deed; the secret toucher of the neighbour''s wife stands already in the light that the commandment-lamp serves.'),
    ('canon','proverbs',6,27,'apocrypha','ecclesiasticus',23,16,'extras',
      E'*Two sorts of men multiply sin, and the third will bring wrath: a hot mind is as a burning fire, it will never be quenched till it be consumed: a fornicator in the body of his flesh will never cease till he has kindled a fire* (Sirach 23:16). The proverb''s fire — *Can a man take fire in his bosom, and his clothes not be burned?* (6:27) — is the very figure the restored witness keeps: *a fornicator in the body of his flesh will never cease till he has kindled a fire*. The adulterer carries the coal that consumes him; the burning of 6:27 is the burning of 6:28, *Can one go upon hot coals, and his feet not be burned?*')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-6-go-to-the-ant-thou-sluggard-consider-her-ways',
       E'Go to the ant, thou sluggard — diligence read from creation',
       E'The father turns the son to a creature for instruction: *Go to the ant, thou sluggard; consider her ways, and be wise: Which having no guide, overseer, or ruler, Provideth her meat in the summer, and gathereth her food in the harvest* (Proverbs 6:6-8). The ant has no taskmaster, yet she is provident — self-moved to lay up in the season of plenty. Against her stands the sluggard: *How long wilt thou sleep, O sluggard? ... Yet a little sleep, a little slumber, a little folding of the hands to sleep: So shall thy poverty come as one that travelleth, and thy want as an armed man* (6:9-11). The same wisdom-book draws the picture out whole — *I went by the field of the slothful... it was all grown over with thorns, and nettles had covered the face thereof, and the stone wall thereof was broken down* (Proverbs 24:30-31) — and closes with the identical refrain, word for word: *Yet a little sleep, a little slumber, a little folding of the hands to sleep: So shall thy poverty come as one that travelleth; and thy want as an armed man* (Proverbs 24:33-34). The proverb of the hands seals it: *He becometh poor that dealeth with a slack hand: but the hand of the diligent maketh rich* (Proverbs 10:4). And the lesson carries forward into the order of the assembly, where idleness is no virtue: *if any would not work, neither should he eat* (2 Thessalonians 3:10). The ant''s provident way — labor in season, no overseer needed — is the wisdom set against the sleep that ends in want.',
       sv.verse_id, ev.verse_id, 'free', 28125
  FROM _s304_pr06_lookup sv, _s304_pr06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-6-the-man-of-belial-soweth-discord',
       E'The worthless man — he soweth discord',
       E'Between the sluggard and the seven-fold abomination stands a portrait of the worthless man, the man of Belial: *A naughty person, a wicked man, walketh with a froward mouth. He winketh with his eyes, he speaketh with his feet, he teacheth with his fingers; Frowardness is in his heart, he deviseth mischief continually; he soweth discord* (Proverbs 6:12-14). He works by signal and sign — winking, gesturing — while his heart frames mischief, and his end is sudden: *Therefore shall his calamity come suddenly; suddenly shall he be broken without remedy* (6:15). This is the seed-war read by CONDUCT, never by ethnicity: not a people to be hated but a way of acting to be discerned. The restored witness names his body-language almost word for word — *He that winketh with the eyes works evil: and he that knoweth him will depart from him* (Sirach 27:22). And Sha''ul (Paul) names the same discord-sower at work inside the assembly, to be marked and shunned: *mark them which cause divisions and offences contrary to the doctrine which ye have learned; and avoid them. For they that are such serve not our Lord Yahusha HaMashiach (Lord Jesus Christ), but their own belly; and by good words and fair speeches deceive the hearts of the simple* (Romans 16:17-18). The wink, the smooth speech, the framing of mischief — these are the marks of the discord-sower in every age; the wise depart from him, the assembly avoids him.',
       sv.verse_id, ev.verse_id, 'extras', 28128
  FROM _s304_pr06_lookup sv, _s304_pr06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-6-these-six-things-doth-yahuah-hate-yea-seven',
       E'These six things doth Yahuah hate — yea, seven are an abomination',
       E'The chapter rises to a numbered list of the things Yahuah abhors: *These six things doth Yahuah (LORD) hate: yea, seven are an abomination unto him: A proud look, a lying tongue, and hands that shed innocent blood, An heart that deviseth wicked imaginations, feet that be swift in running to mischief, A false witness that speaketh lies, and he that soweth discord among brethren* (Proverbs 6:16-19). The seven are deeds, not peoples — hated CONDUCT, each with its root in the Torah''s own verdict. The whole list answers Moshe (Moses): *all that do unrighteously, are an abomination unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 25:16). The *hands that shed innocent blood* (6:17) are the blood-guilt of the Noahic covenant — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6) — and the land-defiling blood the cities of refuge guard against: *that innocent blood be not shed in thy land... and so blood be upon thee* (Deuteronomy 19:10). The *lying tongue* and the *false witness that speaketh lies* (6:17,19) are sealed by the same book: *Lying lips are abomination to Yahuah (LORD): but they that deal truly are his delight* (Proverbs 12:22). The restored witness keeps the very form of the counted-hatred — *Three sorts of men my soul hates... a poor man that is proud, a rich man that is a liar, and an old adulterer that doateth* (Sirach 25:2) — pride and the lie at the head of both. And the seventh, the climax — *he that soweth discord among brethren* (6:19) — gathers up the worthless man of the verses just before: the discord-sower is the very thing Yahuah hates most, named last and named worst.',
       sv.verse_id, ev.verse_id, 'extras', 28131
  FROM _s304_pr06_lookup sv, _s304_pr06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=6 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (FRAMEWORK HEAVYWEIGHT)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-6-the-commandment-is-a-lamp-and-the-law-is-light',
       E'The commandment is a lamp, and the Torah is light — the way of life',
       E'Here the chapter reaches its framework-heart. The son is charged to hold fast the instruction of both his parents — and that instruction is named the Torah: *My son, keep thy father''s commandment, and forsake not the law of thy mother: Bind them continually upon thine heart, and tie them about thy neck. When thou goest, it shall lead thee; when thou sleepest, it shall keep thee; and when thou awakest, it shall talk with thee. For the commandment is a lamp; and the law is light; and reproofs of instruction are the way of life* (Proverbs 6:20-23). This is the anti-antinomian centerpiece of the whole book: the commandment is a LAMP, the Torah is LIGHT, the reproofs are the WAY OF LIFE — never a defunct burden, never the curse, but the living instruction that leads, keeps, and speaks. The binding-language is the Shema''s own: *thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8) — the same Torah Moshe (Moses) bid Yashar''el (Israel) wear on hand and heart. The Psalter sings the lamp entire — *Thy word is a lamp unto my feet, and a light unto my path* (Psalm 119:105) — and confesses what the commandment does to the eye: *the commandment of Yahuah (LORD) is pure, enlightening the eyes* (Psalm 19:8). The Torah does not blind; it gives sight. Isaiah makes it the very test of every spirit: *To the law and to the testimony: if they speak not according to this word, it is because there is no light in them* (Isaiah 8:20) — where the Torah is forsaken there is no light at all. And the Formed Son, who IS the light, does not put out the lamp He kindled: *I am not come to destroy, but to fulfil... Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law* (Matthew 5:17-18); His keepers become *the light of the world* (Matthew 5:14); the commandment Yochanan (John) writes is *an old commandment which ye had from the beginning... the darkness is past, and the true light now shineth* (1 John 2:7-8). The lamp first lit in Proverbs still burns: the commandment is a lamp, the Torah is light, the reproofs the way of life — one unbroken light from Moshe to the Messiah.',
       sv.verse_id, ev.verse_id, 'free', 28134
  FROM _s304_pr06_lookup sv, _s304_pr06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-6-the-commandment-keepeth-from-the-strange-woman',
       E'The commandment keepeth from the strange woman — the seventh word guarded',
       E'The commandment-lamp''s first task is to guard the son: *To keep thee from the evil woman, from the flattery of the tongue of a strange woman. Lust not after her beauty in thine heart; neither let her take thee with her eyelids* (Proverbs 6:24-25). The Torah that is light (6:23) shines first upon this danger — and the wall behind the warning is the seventh word: *Thou shalt not commit adultery* (Exodus 20:14), repeated in the second giving, *Neither shalt thou commit adultery* (Deuteronomy 5:18). The proverb presses the fire of it: *Can a man take fire in his bosom, and his clothes not be burned? Can one go upon hot coals, and his feet not be burned? So he that goeth in to his neighbour''s wife; whosoever toucheth her shall not be innocent* (6:27-29), and names the self-ruin: *whoso committeth adultery with a woman lacketh understanding: he that doeth it destroyeth his own soul* (6:32). The restored witness keeps the same warning and lays bare the adulterer''s self-deceiving heart: *A man that breaks wedlock, saying thus in his heart, Who seeth me? ... the walls cover me, and no body seeth me* (Sirach 23:18) — and answers it, *the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Sirach 23:19). The same coal burns in both: *a fornicator in the body of his flesh will never cease till he has kindled a fire* (Sirach 23:16). This is covenant-faithfulness guarded, the unfaithful self-consumed — the strange woman a snare named to the son, the warning a hedge of love, not contempt; the commandment is the lamp that shows the fire for what it is before it burns.',
       sv.verse_id, ev.verse_id, 'extras', 28137
  FROM _s304_pr06_lookup sv, _s304_pr06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=6 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I went by the field of the slothful... it was all grown over with thorns... and the stone wall thereof was broken down* (Proverbs 24:30-31) — the sluggard of 6:6 shown his end: the field the ant''s opposite leaves to ruin.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-go-to-the-ant-thou-sluggard-consider-her-ways'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yet a little sleep, a little slumber, a little folding of the hands to sleep: So shall thy poverty come...* (Proverbs 24:33-34) — the verbatim refrain of 6:10-11 over the slothful man''s overgrown field; poverty creeps in like a robber.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-go-to-the-ant-thou-sluggard-consider-her-ways'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the hand of the diligent maketh rich* (Proverbs 10:4) — the ant who gathereth in the harvest (6:8) is the diligent hand; the slack hand becometh poor.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-go-to-the-ant-thou-sluggard-consider-her-ways'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*if any would not work, neither should he eat* (2 Thessalonians 3:10) — the rebuke to the sluggard (6:9) carried into the assembly''s order against idleness; the ant''s wisdom made apostolic rule.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-go-to-the-ant-thou-sluggard-consider-her-ways'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*mark them which cause divisions and offences... and avoid them* (Romans 16:17) — the discord-sower of 6:12,14 named in the assembly; the same conduct to be marked and shunned.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-man-of-belial-soweth-discord'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*by good words and fair speeches deceive the hearts of the simple* (Romans 16:18) — the man who deviseth mischief and soweth discord (6:14) unmasked; smooth speech is the cover of the discord he sows.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-man-of-belial-soweth-discord'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He that winketh with the eyes works evil: and he that knoweth him will depart from him* (Sirach 27:22) — the near-verbatim of 6:13 *He winketh with his eyes*; the wise, knowing the deceiver, depart from him.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=27 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-man-of-belial-soweth-discord'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*all that do unrighteously, are an abomination unto Yahuah* (Deuteronomy 25:16) — the Torah''s own verdict the seven-list counts (6:16); the things Yahuah hates are deeds of unrighteousness.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-these-six-things-doth-yahuah-hate-yea-seven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Whoso sheddeth man''s blood... for in the image of Elohim made he man* (Genesis 9:6) — the root of *hands that shed innocent blood* (6:17); blood-guilt because man bears the image of Elohim.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-these-six-things-doth-yahuah-hate-yea-seven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*that innocent blood be not shed in thy land... and so blood be upon thee* (Deuteronomy 19:10) — the cities of refuge guard against the *innocent blood* of 6:17; the land bears the guilt.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-these-six-things-doth-yahuah-hate-yea-seven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Lying lips are abomination to Yahuah: but they that deal truly are his delight* (Proverbs 12:22) — the *lying tongue* and *false witness* of 6:17,19 confessed outright as the thing Yahuah abhors.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-these-six-things-doth-yahuah-hate-yea-seven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Three sorts of men my soul hates... a poor man that is proud, a rich man that is a liar, and an old adulterer that doateth* (Sirach 25:2) — the restored witness keeps the counted-hatred form of 6:16; pride and the lie at the head of both lists.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=25 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-these-six-things-doth-yahuah-hate-yea-seven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (FRAMEWORK HEAVYWEIGHT)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8) — the Shema''s binding-language that 6:21 echoes; the father''s commandment and mother''s Torah ARE the words Moshe bid Israel bind on hand and heart.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=21
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-is-a-lamp-and-the-law-is-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thy word is a lamp unto my feet, and a light unto my path* (Psalm 119:105) — the framework-verse 6:23 sung whole; the commandment the lamp, the Torah the light that shows the foot where to walk.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=105
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-is-a-lamp-and-the-law-is-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the commandment of Yahuah is pure, enlightening the eyes* (Psalm 19:8) — the Torah does not blind nor bind; it ENLIGHTENS, the light of 6:23 by which the eye sees the way of life.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-is-a-lamp-and-the-law-is-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*To the law and to the testimony... there is no light in them* (Isaiah 8:20) — Isaiah makes the Torah the test of light; the *law is light* (6:23), and where it is forsaken there is no light at all.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-is-a-lamp-and-the-law-is-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the darkness is past, and the true light now shineth* (1 John 2:8) — the commandment Yochanan writes is *an old commandment... from the beginning* (2:7); the true light shines by keeping it, the lamp of 6:23 still burning.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-is-a-lamp-and-the-law-is-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Ye are the light of the world* (Matthew 5:14) — the Torah that is light (6:23) makes its keepers light; the commandment-lamp set on the candlestick to shine through the lives that keep it.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-is-a-lamp-and-the-law-is-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*I am not come to destroy, but to fulfil... one jot or one tittle shall in no wise pass from the law* (Matthew 5:17-18) — the plainest seal on *the law is light* (6:23): the Formed Son does not put out the Torah-lamp He kindled; it abides till heaven and earth pass.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-is-a-lamp-and-the-law-is-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt not commit adultery* (Exodus 20:14) — the seventh word behind the commandment-lamp''s first guard (6:24); the Torah that is light keeps the son from the strange woman.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=24
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-keepeth-from-the-strange-woman'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Neither shalt thou commit adultery* (Deuteronomy 5:18) — the seventh word repeated in the second giving, behind the verdict *whosoever toucheth her shall not be innocent* (6:29).'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=29
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-keepeth-from-the-strange-woman'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*A man that breaks wedlock, saying thus in his heart, Who seeth me? ... the walls cover me* (Sirach 23:18) — the lust of 6:25 traced to the adulterer''s self-deceiving heart hiding behind imagined darkness.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-keepeth-from-the-strange-woman'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the eyes of Yahuah are ten thousand times brighter than the sun, beholding all the ways of men* (Sirach 23:19) — the answer to the secret toucher of 6:29; no wall covers the deed, all stands already in the light.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=29
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-keepeth-from-the-strange-woman'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a fornicator in the body of his flesh will never cease till he has kindled a fire* (Sirach 23:16) — the same coal of 6:27-28; the adulterer carries the fire that consumes him.'
  FROM cross_reference_threads t
  JOIN _s304_pr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=6 AND sv.verse_number=27
  JOIN _s304_pr06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-6-the-commandment-keepeth-from-the-strange-woman'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
