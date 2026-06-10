-- ----- fragment: minion_romans_12.sql (S219 Romans 12) -----
-- =====================================================================
-- S219 minion — ROMANS 12 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 12.  Tag: r12 (temp view _s219_r12_lookup).  Sort band: 6275, step 3 (<6300).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#6/#8): Romans 12 is not a new severed morality bolted onto
-- a finished doctrine of grace — it is the Torah''s own ethic of love and the Master''s own Sermon
-- teaching lived out by the assembly. The *living sacrifice* and *be not conformed to this world*
-- (12:1-2) are the Torah-life of holiness and separation Yashar''el was always called to: *ye shall
-- be holy; for I am holy* (Leviticus 11:44), *an holy people unto Yahuah Elohayka (the LORD thy
-- God)* (Deuteronomy 14:2). *Abhor that which is evil; cleave to that which is good* (12:9) is the
-- prophet''s *hate the evil, and love the good* (Amos 5:15). *Recompense to no man evil for evil*
-- (12:17) and *avenge not yourselves... Vengeance is mine; I will repay, saith Yahuah (Lord)*
-- (12:19) is Moses'' own word — *To me belongeth vengeance, and recompence* (Deuteronomy 32:35) —
-- and the heart-law *thou shalt not avenge... but thou shalt love thy neighbour as thyself*
-- (Leviticus 19:18); the NT-Lord rule is preserved as the pull gives it (Yahuah (Lord) at 12:11,
-- 12:19). *Feed thine enemy... heap coals of fire on his head* (12:20) is Proverbs 25:21-22 word
-- for word; *overcome evil with good* (12:21) is the Master''s *love your enemies* (Matthew 5:44).
-- These are the commandments lived, not a Torah-free ethic.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   living sacrifice / be not conformed   Tanakh: Leviticus 11:44, Deuteronomy 14:2 (holy people, separation)  Extras: none warranted (apparatus noise in cleanest witnesses)  NT: none added (the holiness call carried by the Torah targets)
--   v.3-8   sober mind / one body / gifts          Tanakh: Proverbs 3:7 (be not wise in thine own eyes)  Extras: Sirach 3:18 (humble thyself, find favour)  NT: none warranted (body imagery carried at 1 Cor elsewhere; curated out)
--   v.9-10  love without dissimulation / abhor evil Tanakh: Amos 5:15, Psalm 34:14 (hate evil, love good; depart from evil)  Extras: none warranted  NT: none added (Sermon carried at v.17-21)
--   v.11-12 fervent in spirit / patient            Tanakh: none warranted  Extras: none warranted  NT: none warranted (epistolary exhortation)
--   v.13-15 distribute / rejoice and weep           Tanakh: none added (Torah of the poor carried at Lev 19 elsewhere)  Extras: Sirach 7:32, Sirach 7:34 (stretch thy hand to the poor; mourn with them that mourn)  NT: none warranted
--   v.16    mind not high things / not wise in own  Tanakh: Proverbs 3:7 (folded into v.3-8 thread)  Extras: Sirach 3:18 (folded into v.3-8 thread)  NT: none warranted
--   v.17-19 recompense no evil / avenge not          Tanakh: Deuteronomy 32:35, Leviticus 19:18, Psalm 34:14  Extras: none warranted (Testament of Gad witness — live verse carries Charles apparatus noise [fear 7and] / stray sigla — not clean enough to quote)  NT: Matthew 5:39 (resist not evil, turn the cheek)
--   v.20-21 feed thine enemy / overcome with good    Tanakh: Proverbs 25:21, Proverbs 25:22 (coals of fire)  Extras: none warranted (Benjamin witness carries apparatus noise)  NT: Matthew 5:44 (love your enemies, do good to them that hate you)
--
-- THREADS (slug -> target libraries):
--   6275 romans-12-a-living-sacrifice-be-not-conformed-the-torah-life-of-holiness   (Tanakh)
--   6278 romans-12-think-soberly-the-greater-thou-art-the-more-humble-thyself        (Tanakh + Extras)
--   6281 romans-12-abhor-the-evil-cleave-to-the-good-hate-evil-love-good             (Tanakh)
--   6284 romans-12-weep-with-them-that-weep-stretch-thy-hand-to-the-poor             (Extras)
--   6287 romans-12-avenge-not-yourselves-vengeance-is-mine-saith-yahuah              (Tanakh + NT)
--   6290 romans-12-feed-thine-enemy-overcome-evil-with-good-coals-of-fire            (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s219_r12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-12-a-living-sacrifice-be-not-conformed-the-torah-life-of-holiness
  ('canon', 'romans', 12, 1, 'canon', 'leviticus', 11, 44, 'free', E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth.* (Leviticus 11:44). Paul beseeches the assembly *that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service* (Romans 12:1). The living sacrifice is the body set apart — the very holiness Yahuah commanded at Sinai, *sanctify yourselves, and ye shall be holy; for I am holy.* The presented body is not a new demand but the old call to be set apart unto Elohim, now offered in flesh and spirit.'),
  ('canon', 'romans', 12, 2, 'canon', 'deuteronomy', 14, 2, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations that are upon the earth.* (Deuteronomy 14:2). *And be not conformed to this world: but be ye transformed by the renewing of your mind* (Romans 12:2). To refuse the mould of this world is to live as the *peculiar people* Yahuah chose *above all the nations* — the people of separation Moses named. The renewed mind is the holy people''s mind: not conformed to the nations, but proving *that good, and acceptable, and perfect, will of Elohim (God).*'),
  -- thread: romans-12-think-soberly-the-greater-thou-art-the-more-humble-thyself
  ('canon', 'romans', 12, 3, 'apocrypha', 'ecclesiasticus', 3, 18, 'extras', E'*The greater you are, the more humble thyself, and you shall find favour before Yahuah (God).* (Sirach 3:18). Paul charges *every man that is among you, not to think of himself more highly than he ought to think; but to think soberly* (Romans 12:3). The wisdom-teacher had already set the measure: the greater a man is, the lower he bends, and so *find favour before Yahuah.* Sober self-reckoning is not self-contempt but the humility that walks before Elohim and is lifted by him.'),
  ('canon', 'romans', 12, 16, 'apocrypha', 'ecclesiasticus', 3, 18, 'extras', E'*The greater you are, the more humble thyself, and you shall find favour before Yahuah (God).* (Sirach 3:18). *Mind not high things, but condescend to men of low estate. Be not wise in your own conceits* (Romans 12:16). To bend toward the low estate is the wisdom-teacher''s own counsel — the greater bending lower, finding favour before Yahuah. The high-minded conceit Paul forbids is the very thing humility uproots.'),
  ('canon', 'romans', 12, 16, 'canon', 'proverbs', 3, 7, 'free', E'*Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil.* (Proverbs 3:7). *Be not wise in your own conceits* (Romans 12:16) is the proverb almost word for word: *be not wise in thine own eyes.* And the proverb names what such humility is for — *fear Yahuah, and depart from evil* — binding the lowered mind to the fear of Yahuah and the turning from evil that Paul presses through the whole chapter.'),
  -- thread: romans-12-abhor-the-evil-cleave-to-the-good-hate-evil-love-good
  ('canon', 'romans', 12, 9, 'canon', 'amos', 5, 15, 'free', E'*Hate the evil, and love the good, and establish judgment in the gate: it may be that Yahuah Elohim (the LORD God) of hosts will be gracious unto the remnant of Joseph.* (Amos 5:15). *Let love be without dissimulation. Abhor that which is evil; cleave to that which is good* (Romans 12:9). Paul''s charge is the prophet''s charge: *hate the evil, and love the good.* And Amos names whose ethic this is — the remnant of Joseph, the scattered northern house, upon whom Yahuah may yet be gracious. To abhor evil and cleave to good is the gathered remnant''s own life.'),
  ('canon', 'romans', 12, 9, 'canon', 'psalms', 34, 14, 'free', E'*Depart from evil, and do good; seek peace, and pursue it.* (Psalm 34:14). *Abhor that which is evil; cleave to that which is good* (Romans 12:9). The psalmist set the same two motions side by side — *depart from evil, and do good* — and added the third that Paul also presses: *seek peace, and pursue it,* the very *live peaceably with all men* (Romans 12:18) that crowns the chapter. To turn from evil and hold fast the good is the old path of the righteous.'),
  -- thread: romans-12-weep-with-them-that-weep-stretch-thy-hand-to-the-poor
  ('canon', 'romans', 12, 15, 'apocrypha', 'ecclesiasticus', 7, 34, 'extras', E'*Fail not to be with them that weep, and mourn with them that mourn.* (Sirach 7:34). *Rejoice with them that do rejoice, and weep with them that weep* (Romans 12:15). The wisdom-teacher had already laid the same yoke of shared sorrow upon the faithful — *fail not to be with them that weep, and mourn with them that mourn.* Paul adds the shared joy; the heart that bears its brother''s grief is the heart the wisdom-writer formed.'),
  ('canon', 'romans', 12, 13, 'apocrypha', 'ecclesiasticus', 7, 32, 'extras', E'*And stretch yours hand to the poor, that your blessing may be perfected.* (Sirach 7:32). *Distributing to the necessity of saints; given to hospitality* (Romans 12:13). To distribute to those in need is the wisdom-teacher''s *stretch yours hand to the poor* — and he names the fruit: *that your blessing may be perfected.* The open hand to the needy is not optional generosity but the perfecting of the blessing, the giving Paul says to do *with simplicity* (Romans 12:8).'),
  -- thread: romans-12-avenge-not-yourselves-vengeance-is-mine-saith-yahuah
  ('canon', 'romans', 12, 19, 'canon', 'deuteronomy', 32, 35, 'free', E'*To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* (Deuteronomy 32:35). *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). Paul quotes Moses'' own song: *to me belongeth vengeance, and recompence.* The hand that repays is Yahuah''s, not the wronged man''s. To avenge oneself is to seize what belongs to Yahuah alone; to give place unto wrath is to trust the Judge who said the recompence is his.'),
  ('canon', 'romans', 12, 19, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). *Avenge not yourselves... Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). The command not to avenge is no new word — it stands in the heart of the holiness code, *thou shalt not avenge, nor bear any grudge,* sealed with *I am Yahuah.* And the same verse gives the positive Paul lives out across the chapter: *thou shalt love thy neighbour as thyself.* Refusing vengeance is loving the neighbour; both are the Torah''s own command.'),
  ('canon', 'romans', 12, 17, 'canon', 'psalms', 34, 14, 'free', E'*Depart from evil, and do good; seek peace, and pursue it.* (Psalm 34:14). *Recompense to no man evil for evil. Provide things honest in the sight of all men* (Romans 12:17). To render no evil for evil is to depart from evil and do good, then to *seek peace, and pursue it* — the very next words Paul reaches, *if it be possible, as much as lieth in you, live peaceably with all men* (Romans 12:18). The psalmist''s threefold path is Paul''s pattern: turn from evil, do good, pursue peace.'),
  ('canon', 'romans', 12, 17, 'canon', 'matthew', 5, 39, 'free', E'*But I say unto you, That ye resist not evil: but whosoever shall smite thee on thy right cheek, turn to him the other also.* (Matthew 5:39). *Recompense to no man evil for evil* (Romans 12:17). Paul is teaching the Master''s own Sermon: not to resist evil with evil, but to turn the other cheek. The refusal to repay evil for evil is not Paul''s invention but Yahusha''s word from the mountain, lived out in the body of the assembly.'),
  -- thread: romans-12-feed-thine-enemy-overcome-evil-with-good-coals-of-fire
  ('canon', 'romans', 12, 20, 'canon', 'proverbs', 25, 21, 'free', E'*If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink:* (Proverbs 25:21). *Therefore if thine enemy hunger, feed him; if he thirst, give him drink* (Romans 12:20). Paul quotes the proverb almost syllable for syllable. The enemy''s hunger is met with bread, his thirst with drink — the wisdom of Solomon become the practice of the assembly. Love of enemy is not a new commandment but the proverb''s old counsel pressed home.'),
  ('canon', 'romans', 12, 20, 'canon', 'proverbs', 25, 22, 'free', E'*For thou shalt heap coals of fire upon his head, and Yahuah (LORD) shall reward thee.* (Proverbs 25:22). *...for in so doing thou shalt heap coals of fire on his head* (Romans 12:20). The proverb supplies Paul''s very image and its promise: the kindness shown the enemy heaps coals of fire on his head, and *Yahuah shall reward thee.* The burning is the shame that melts the enemy''s hardness — good rendered for evil — and the reward is Yahuah''s, the same Judge who keeps the vengeance to himself.'),
  ('canon', 'romans', 12, 21, 'canon', 'matthew', 5, 44, 'free', E'*But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;* (Matthew 5:44). *Be not overcome of evil, but overcome evil with good* (Romans 12:21). To overcome evil with good is the Master''s own command lived out: *love your enemies... do good to them that hate you.* And it echoes back through the whole chapter — *bless them which persecute you: bless, and curse not* (Romans 12:14) is Yahusha''s *bless them that curse you.* Paul gives the assembly the Sermon as its daily walk.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-12-a-living-sacrifice-be-not-conformed-the-torah-life-of-holiness',
       E'A living sacrifice, be not conformed — the Torah-life of holiness',
       E'Paul opens the assembly''s walk not with a new ethic but with the old call to holiness: *I beseech you therefore, brethren, by the mercies of Elohim (God), that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service. And be not conformed to this world: but be ye transformed by the renewing of your mind* (Romans 12:1-2). The living sacrifice is the body set apart, and the setting-apart is what Yahuah commanded at Sinai: *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44). To refuse the mould of this world is to live as the people Moses named: *thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations that are upon the earth* (Deuteronomy 14:2). The renewed mind is the holy people''s mind — not conformed to the nations, but proving *that good, and acceptable, and perfect, will of Elohim (God).* The presented body and the unconformed mind are the Torah-life of separation, now offered in flesh and spirit.',
       sv.verse_id, ev.verse_id, 'free', 6275
  FROM _s219_r12_lookup sv, _s219_r12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-12-think-soberly-the-greater-thou-art-the-more-humble-thyself',
       E'Think soberly — the greater thou art, the more humble thyself',
       E'*For I say, through the grace given unto me, to every man that is among you, not to think of himself more highly than he ought to think; but to think soberly, according as Elohim (God) hath dealt to every man the measure of faith* (Romans 12:3) — and again, *Mind not high things, but condescend to men of low estate. Be not wise in your own conceits* (Romans 12:16). This sober, low-bending mind is the wisdom the elders taught long before. The wisdom-teacher set the measure: *the greater you are, the more humble thyself, and you shall find favour before Yahuah (God)* (Sirach 3:18) — humility is not self-contempt but the lowering that is lifted before Yahuah. And the proverb gives Paul his very words: *be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil* (Proverbs 3:7). To refuse one''s own conceit, to bend toward the low estate, to fear Yahuah and turn from evil — this is the one walk Paul presses and the wisdom of the fathers commends.',
       sv.verse_id, ev.verse_id, 'extras', 6278
  FROM _s219_r12_lookup sv, _s219_r12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=12 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-12-abhor-the-evil-cleave-to-the-good-hate-evil-love-good',
       E'Abhor the evil, cleave to the good — hate evil, love good',
       E'*Let love be without dissimulation. Abhor that which is evil; cleave to that which is good* (Romans 12:9). Paul''s charge is the prophet''s charge, spoken to the scattered northern house: *hate the evil, and love the good, and establish judgment in the gate: it may be that Yahuah Elohim (the LORD God) of hosts will be gracious unto the remnant of Joseph* (Amos 5:15). To abhor evil and cleave to good is the gathered remnant''s own life — the very ethic upon which Yahuah may yet be gracious to the remnant of Joseph. And the psalmist set the same two motions side by side, with the peace Paul also presses: *depart from evil, and do good; seek peace, and pursue it* (Psalm 34:14) — the *live peaceably with all men* (Romans 12:18) that crowns the chapter. Love without dissimulation, the hatred of evil, the holding-fast of good, the pursuit of peace: not a severed morality but the old path of the righteous.',
       sv.verse_id, ev.verse_id, 'free', 6281
  FROM _s219_r12_lookup sv, _s219_r12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-12-weep-with-them-that-weep-stretch-thy-hand-to-the-poor',
       E'Weep with them that weep — stretch thy hand to the poor',
       E'*Distributing to the necessity of saints; given to hospitality... Rejoice with them that do rejoice, and weep with them that weep* (Romans 12:13, 15). The open hand and the shared sorrow Paul commands are the wisdom-teacher''s own yoke upon the faithful. *And stretch yours hand to the poor, that your blessing may be perfected* (Sirach 7:32) — the giving to the needy is not optional generosity but the perfecting of the blessing, the very giving Paul says to do *with simplicity* (Romans 12:8). And the heart that bears its brother''s grief was formed long before Rome heard the letter: *fail not to be with them that weep, and mourn with them that mourn* (Sirach 7:34). Paul adds the shared joy to the shared mourning; the open hand to the poor and the wet eye beside the grieving are the one love the fathers taught and the assembly lives.',
       sv.verse_id, ev.verse_id, 'extras', 6284
  FROM _s219_r12_lookup sv, _s219_r12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-12-avenge-not-yourselves-vengeance-is-mine-saith-yahuah',
       E'Avenge not yourselves — vengeance is mine, saith Yahuah (Lord)',
       E'*Recompense to no man evil for evil. Provide things honest in the sight of all men* (Romans 12:17); *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). Paul is not loosing a new principle but quoting Moses'' own song: *to me belongeth vengeance, and recompence; their foot shall slide in due time* (Deuteronomy 32:35). The hand that repays is Yahuah''s, not the wronged man''s. The command not to avenge stands already in the heart of the holiness code — *thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18) — where refusing vengeance and loving the neighbour are one command. The psalmist gave the pattern: *depart from evil, and do good; seek peace, and pursue it* (Psalm 34:14), the *live peaceably with all men* (Romans 12:18) Paul reaches next. It is the Master''s Sermon lived out — *resist not evil: but whosoever shall smite thee on thy right cheek, turn to him the other also* (Matthew 5:39). To give place unto wrath is to leave the avenging where it belongs: with Yahuah, the Judge who keeps the recompence to himself.',
       sv.verse_id, ev.verse_id, 'free', 6287
  FROM _s219_r12_lookup sv, _s219_r12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=12 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-12-feed-thine-enemy-overcome-evil-with-good-coals-of-fire',
       E'Feed thine enemy, overcome evil with good — coals of fire',
       E'*Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head. Be not overcome of evil, but overcome evil with good* (Romans 12:20-21). Paul quotes the proverb almost syllable for syllable: *if thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink: for thou shalt heap coals of fire upon his head, and Yahuah (LORD) shall reward thee* (Proverbs 25:21-22). The enemy''s hunger is met with bread, his thirst with drink; the coals are the shame that melts the enemy''s hardness — good rendered for evil — and the reward is Yahuah''s, the same Judge who keeps the vengeance to himself. And to overcome evil with good is the Master''s own command lived out: *love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you* (Matthew 5:44) — which echoes back through the whole chapter, for *bless them which persecute you: bless, and curse not* (Romans 12:14) is Yahusha''s *bless them that curse you.* Paul gives the assembly the Sermon and the proverb as its daily walk: love of enemy is not a new commandment but the old wisdom and the King''s own word pressed home.',
       sv.verse_id, ev.verse_id, 'free', 6290
  FROM _s219_r12_lookup sv, _s219_r12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=12 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-12-a-living-sacrifice-be-not-conformed-the-torah-life-of-holiness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:44 — *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* the living sacrifice is the body set apart, the holiness Yahuah commanded at Sinai (Romans 12:1).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-a-living-sacrifice-be-not-conformed-the-torah-life-of-holiness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 14:2 — *thou art an holy people unto Yahuah Elohayka (the LORD thy God) ... a peculiar people unto himself* the unconformed mind is the holy people''s mind, separate from the nations (Romans 12:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-a-living-sacrifice-be-not-conformed-the-torah-life-of-holiness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-12-think-soberly-the-greater-thou-art-the-more-humble-thyself
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 3:18 — *the greater you are, the more humble thyself, and you shall find favour before Yahuah (God)* the sober mind that thinks not too highly is the wisdom-teacher''s humility (Romans 12:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-think-soberly-the-greater-thou-art-the-more-humble-thyself'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 3:18 — *the greater you are, the more humble thyself* to condescend to the low estate is the wisdom-teacher''s bending lower (Romans 12:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-think-soberly-the-greater-thou-art-the-more-humble-thyself'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:7 — *be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil* Paul''s *be not wise in your own conceits* almost word for word, bound to the fear of Yahuah (Romans 12:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-think-soberly-the-greater-thou-art-the-more-humble-thyself'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-12-abhor-the-evil-cleave-to-the-good-hate-evil-love-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 5:15 — *hate the evil, and love the good ... gracious unto the remnant of Joseph* Paul''s charge is the prophet''s, spoken to the scattered northern house (Romans 12:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-abhor-the-evil-cleave-to-the-good-hate-evil-love-good'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:14 — *depart from evil, and do good; seek peace, and pursue it* the two motions Paul joins, with the peace that crowns the chapter (Romans 12:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-abhor-the-evil-cleave-to-the-good-hate-evil-love-good'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-12-weep-with-them-that-weep-stretch-thy-hand-to-the-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 7:32 — *stretch yours hand to the poor, that your blessing may be perfected* the distributing to the saints is the perfecting of the blessing (Romans 12:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-weep-with-them-that-weep-stretch-thy-hand-to-the-poor'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 7:34 — *fail not to be with them that weep, and mourn with them that mourn* the shared sorrow Paul commands, formed long before by the wisdom-teacher (Romans 12:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-weep-with-them-that-weep-stretch-thy-hand-to-the-poor'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-12-avenge-not-yourselves-vengeance-is-mine-saith-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:39 — *resist not evil: but whosoever shall smite thee on thy right cheek, turn to him the other also* recompensing no evil for evil is the Master''s Sermon lived out (Romans 12:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-avenge-not-yourselves-vengeance-is-mine-saith-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:14 — *depart from evil, and do good; seek peace, and pursue it* rendering no evil for evil, then the pursuit of peace Paul reaches next (Romans 12:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-avenge-not-yourselves-vengeance-is-mine-saith-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:35 — *to me belongeth vengeance, and recompence* Paul quotes Moses'' song: the hand that repays is Yahuah''s, not the wronged man''s (Romans 12:19).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-avenge-not-yourselves-vengeance-is-mine-saith-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 19:18 — *thou shalt not avenge, nor bear any grudge ... but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the command not to avenge stands in the holiness code, one with loving the neighbour (Romans 12:19).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-avenge-not-yourselves-vengeance-is-mine-saith-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-12-feed-thine-enemy-overcome-evil-with-good-coals-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 25:21 — *if thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink* Paul quotes the proverb almost syllable for syllable (Romans 12:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-feed-thine-enemy-overcome-evil-with-good-coals-of-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 25:22 — *thou shalt heap coals of fire upon his head, and Yahuah (LORD) shall reward thee* Paul''s very image and its promise: the reward is Yahuah''s, the same Judge who keeps the vengeance (Romans 12:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-feed-thine-enemy-overcome-evil-with-good-coals-of-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:44 — *love your enemies, bless them that curse you, do good to them that hate you* overcoming evil with good is the Master''s own command, echoed at *bless them which persecute you* (Romans 12:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r12_lookup sv, _s219_r12_lookup tv
 WHERE t.slug='romans-12-feed-thine-enemy-overcome-evil-with-good-coals-of-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
