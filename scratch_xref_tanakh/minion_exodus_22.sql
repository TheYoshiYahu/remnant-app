-- ----- fragment: minion_exodus_22.sql (Exodus 22) -----
-- Chapter: Exodus 22 (Mishpatim continued — theft & restitution; usury & the pledged garment;
--   the witch and the sacrificer to other gods; the stranger, widow, fatherless; the firstborn given).
-- Tag: ex22   Session: s305   Sort band base: 29525 (step 3)
-- CENTRAL FRAME: the Mishpatim are Yahuah's righteous judgments — the civil Torah is NOT abolished
--   but the standing pattern of mercy-and-justice the prophets and apostles carry forward. The curse
--   is exile for covenant-breaking, never the Torah itself.
--
-- ===== PER-VERSE COVERAGE CHECKLIST =====
--   v.1-4   theft/restitution (restore five/four/double)
--           NT:     Luke 19:8 (Zacchaeus restores fourfold) — THREADED
--           Extras: none warranted
--           Tanakh: none warranted (kept tight to NT fulfillment)
--   v.5-15  restitution for fields/fire/deposit/borrowed beasts
--           NT/Extras/Tanakh: folded into the restitution frame (anchor spans v.1-15)
--   v.16-17 seduction of an unbetrothed maid — none warranted (no strong full-library weave)
--   v.18    suffer not a witch to live
--           NT:     Galatians 5:20 (witchcraft a work of the flesh); Rev 21:8 / 22:15 (sorcerers without) — THREADED
--           Extras: none warranted (avoided apparatus noise)
--           Tanakh: Deut 18:10-12; Lev 19:31 — THREADED
--   v.19    bestiality put to death — none warranted (folded into seed-war/sorcery context, not threaded)
--   v.20    sacrifice to any god save Yahuah — utterly destroyed
--           NT:     (Rev 21:8 idolaters) covered in witch/sorcery thread
--           Tanakh: Deut 18:9 abominations of the nations — covered laterally — THREADED w/ v.18
--   v.21    vex not a stranger (ye were strangers in Egypt)
--           NT:     James 1:27 (visit fatherless & widows) — THREADED
--           Extras: Tobit 4:7 (give alms, turn not face from the poor) — THREADED
--           Tanakh: Deut 10:18-19; Zech 7:10 — THREADED
--   v.22-24 afflict not widow/fatherless; my wrath shall wax hot — same thread as v.21
--   v.25-27 lend without usury; the pledged raiment returned by sunset
--           NT:     none warranted (Tanakh-dense weave)
--           Extras: none warranted
--           Tanakh: Deut 24:12-13; Lev 25:35-37; Ps 15:5; Ezek 18:8 — THREADED
--   v.28    revile not the gods/ruler — none warranted
--   v.29-30 firstborn of sons & beasts given; eighth day
--           NT:     none warranted
--           Extras: none warranted
--           Tanakh: Exod 13:2; Exod 13:13 (firstborn dedication, lateral) — THREADED
--   v.31    be holy men; eat not flesh torn of beasts
--           Tanakh: Lev 17:15 (that which is torn — set-apart eating, Torah standing) — THREADED w/ v.29-31
--
-- ===== THREADS (5) =====
--   exodus-22-the-gospel-does-not-abolish-restitution-it-produces-it   [free]  src 22:1->22:15  -> Luke 19:8
--   exodus-22-vex-not-the-stranger-afflict-not-the-widow-or-fatherless [extras] src 22:21->22:24 -> James 1:27, Deut 10:18-19, Zech 7:10, Tobit 4:7(apocrypha)
--   exodus-22-the-pledged-garment-returned-before-the-sun-goes-down    [free]  src 22:25->22:27 -> Deut 24:12-13, Lev 25:35-37, Ps 15:5, Ezek 18:8
--   exodus-22-thou-shalt-not-suffer-a-witch-to-live                    [free]  src 22:18->22:20 -> Deut 18:10-12, Lev 19:31, Gal 5:20, Rev 21:8, Rev 22:15
--   exodus-22-the-firstborn-given-and-a-set-apart-people               [free]  src 22:29->22:31 -> Exod 13:2, Exod 13:13, Lev 17:15

CREATE TEMP VIEW _s305_ex22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: theft & restitution -> Luke 19:8
    ('canon','exodus',22,1,'canon','luke',19,8,'free',
      E'*And Zacchæus stood, and said unto Yahuah (Lord); Behold, Yahuah (Lord), the half of my goods I give to the poor; and if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8). The Mishpat stands: *If a man shall steal an ox, or a sheep... he shall restore five oxen for an ox, and four sheep for a sheep* (Exodus 22:1). The tax-collector turned does not abolish the restitution law — he obeys it; the gospel produces the very fourfold restoring the Torah commands. Salvation that does not restore the neighbour is not the salvation of Yahuah.'),
    ('canon','exodus',22,4,'canon','luke',19,8,'free',
      E'*If the theft be certainly found in his hand alive, whether it be ox, or ass, or sheep; he shall restore double* (Exodus 22:4). Zacchæus: *if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8) — the higher measure of the willing heart, going beyond the bare double. Grace does not cancel the debt to the wronged; it pays it.'),
    -- THREAD 2: stranger / widow / fatherless
    ('canon','exodus',22,21,'canon','james',1,27,'free',
      E'*Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). This is the same heart commanded in *Thou shalt neither vex a stranger, nor oppress him... Ye shall not afflict any widow, or fatherless child* (Exodus 22:21-22). The apostle names the very Torah-mercy as the test of true religion — not a new ethic, the standing one the prophets carried.'),
    ('canon','exodus',22,22,'canon','james',1,27,'free',
      E'*To visit the fatherless and widows in their affliction* (James 1:27) is the apostolic echo of *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22). The defenceless are Yahuah''s special charge from Sinai to the assembly; to oppress them is to invite the wrath that *shall wax hot* (Exodus 22:24).'),
    ('canon','exodus',22,21,'canon','deuteronomy',10,18,'free',
      E'*He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment* (Deuteronomy 10:18). Moses grounds the command in Yahuah''s own character; the very motive of *for ye were strangers in the land of Egypt* (Exodus 22:21) is repeated: *Love ye therefore the stranger: for ye were strangers in the land of Egypt* (Deuteronomy 10:19). Israel''s own bondage is the abiding reason it must not oppress.'),
    ('canon','exodus',22,21,'canon','deuteronomy',10,19,'free',
      E'*Love ye therefore the stranger: for ye were strangers in the land of Egypt* (Deuteronomy 10:19) — Moses repeats the Egypt-memory that anchors *for ye were strangers in the land of Egypt* (Exodus 22:21). The redeemed remember the iron furnace so that they become a refuge, not an oppressor.'),
    ('canon','exodus',22,22,'canon','zechariah',7,10,'free',
      E'*And oppress not the widow, nor the fatherless, the stranger, nor the poor; and let none of you imagine evil against his brother in your heart* (Zechariah 7:10). Centuries on, the prophet names the exact four the Mishpat protects — *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22) — and the failure to keep it was the very sin that sent Israel into exile (Zechariah 7:12-14). The curse was exile for breaking the mercy-law, never the law itself.'),
    ('canon','exodus',22,21,'apocrypha','tobit',4,7,'extras',
      E'*Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7). The exile-righteous Tobit lives the Mishpat among the nations: the open hand to the poor is the same mercy the Torah commands in *Thou shalt neither vex a stranger, nor oppress him* (Exodus 22:21). The promise mirrors the warning — turn not thy face from the poor, and Yahuah turns not His from thee.'),
    -- THREAD 3: usury / pledged garment
    ('canon','exodus',22,26,'canon','deuteronomy',24,12,'free',
      E'*And if the man be poor, thou shalt not sleep with his pledge: In any case thou shalt deliver him the pledge again when the sun goeth down, that he may sleep in his own raiment, and bless thee: and it shall be righteousness unto thee before Yahuah Elohayka (the LORD thy God)* (Deuteronomy 24:12-13). Moses restates the sunset-mercy of *if thou at all take thy neighbour''s raiment to pledge, thou shalt deliver it unto him by that the sun goeth down* (Exodus 22:26). The covenant calls the returning of the cloak *righteousness* — the very thing the false reading says the Torah cannot give.'),
    ('canon','exodus',22,27,'canon','deuteronomy',24,13,'free',
      E'*In any case thou shalt deliver him the pledge again when the sun goeth down, that he may sleep in his own raiment, and bless thee: and it shall be righteousness unto thee* (Deuteronomy 24:13). This answers the cry of *For that is his covering only, it is his raiment for his skin: wherein shall he sleep?* (Exodus 22:27). The poor man''s blessing and Yahuah''s reckoning of righteousness hang on a single returned garment.'),
    ('canon','exodus',22,25,'canon','leviticus',25,36,'free',
      E'*Take thou no usury of him, or increase: but fear thy Elohim (God); that thy brother may live with thee* (Leviticus 25:36). The Jubilee-law repeats *thou shalt not be to him as an usurer, neither shalt thou lay upon him usury* (Exodus 22:25). To lend without increase is to fear Elohim and keep the poor brother alive in the land — mercy made law.'),
    ('canon','exodus',22,25,'canon','leviticus',25,35,'free',
      E'*And if thy brother be waxen poor, and fallen in decay with thee; then thou shalt relieve him: yea, though he be a stranger, or a sojourner; that he may live with thee* (Leviticus 25:35). The same poor brother of *If thou lend money to any of my people that is poor by thee* (Exodus 22:25) — and the stranger is gathered in with him, not shut out.'),
    ('canon','exodus',22,25,'canon','psalms',15,5,'free',
      E'*He that putteth not out his money to usury, nor taketh reward against the innocent. He that doeth these things shall never be moved* (Psalm 15:5). David names the usury-refuser among those who may dwell in Yahuah''s tabernacle — the living-out of *neither shalt thou lay upon him usury* (Exodus 22:25). The Torah-keeper, not the Torah-breaker, abides on the holy hill.'),
    ('canon','exodus',22,26,'canon','ezekiel',18,8,'free',
      E'*He that hath not given forth upon usury, neither hath taken any increase, that hath withdrawn his hand from iniquity, hath executed true judgment between man and man* (Ezekiel 18:8). The prophet marks the just man by the very Mishpatim of Exodus 22 — refusing usury (Exodus 22:25) and *hath restored to the debtor his pledge... hath covered the naked with a garment* (Ezekiel 18:7), the returned cloak of *thou shalt deliver it unto him by that the sun goeth down* (Exodus 22:26). The righteousness Ezekiel preaches is Torah-shaped, not Torah-free.'),
    -- THREAD 4: the witch / sacrifice to other gods
    ('canon','exodus',22,18,'canon','deuteronomy',18,10,'free',
      E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10), *Or a charmer, or a consulter with familiar spirits, or a wizard, or a necromancer* (Deuteronomy 18:11), *For all that do these things are an abomination unto Yahuah* (Deuteronomy 18:12). Moses widens *Thou shalt not suffer a witch to live* (Exodus 22:18) into the whole catalogue of the nations'' sorcery — the seed-war against the dark arts the Watchers taught, judged by conduct, never by ethnicity.'),
    ('canon','exodus',22,18,'canon','leviticus',19,31,'free',
      E'*Regard not them that have familiar spirits, neither seek after wizards, to be defiled by them: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:31). The same ban on sorcery that stands behind *Thou shalt not suffer a witch to live* (Exodus 22:18): to consult the spirits is to be defiled, to abandon the Holy One who alone is to be sought.'),
    ('canon','exodus',22,18,'canon','galatians',5,20,'free',
      E'Paul lists *Idolatry, witchcraft, hatred, variance, emulations, wrath, strife, seditions, heresies* (Galatians 5:20) among *the works of the flesh* (Galatians 5:19) that bar the kingdom. The apostle has not relaxed *Thou shalt not suffer a witch to live* (Exodus 22:18) — he carries the very judgment forward; witchcraft remains a flesh-work that shuts a soul out of the inheritance.'),
    ('canon','exodus',22,20,'canon','revelation',21,8,'free',
      E'*But the fearful, and unbelieving, and the abominable, and murderers, and whoremongers, and sorcerers, and idolaters, and all liars, shall have their part in the lake which burneth with fire and brimstone: which is the second death* (Revelation 21:8). The end answers the Mishpat: *He that sacrificeth unto any god, save unto Yahuah (LORD) only... shall be utterly destroyed* (Exodus 22:20). The sorcerer and the idolater meet the same utter destruction — the second death — at the last.'),
    ('canon','exodus',22,18,'canon','revelation',22,15,'free',
      E'*For without are dogs, and sorcerers, and whoremongers, and murderers, and idolaters, and whosoever loveth and maketh a lie* (Revelation 22:15). The sorcerer barred from the New Jerusalem is the witch of *Thou shalt not suffer a witch to live* (Exodus 22:18) — the same conduct, the same exclusion, from Sinai to the city of Yahuah.'),
    -- THREAD 5: firstborn given / set-apart people
    ('canon','exodus',22,29,'canon','exodus',13,2,'free',
      E'*Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Yashar''el (Israel), both of man and of beast: it is mine* (Exodus 13:2). The Mishpat *the firstborn of thy sons shalt thou give unto me* (Exodus 22:29) gathers up the Passover-night claim: the firstborn spared by the blood belong wholly to Yahuah, a perpetual remembrance of the redemption out of Egypt.'),
    ('canon','exodus',22,29,'canon','exodus',13,13,'free',
      E'*And every firstling of an ass thou shalt redeem with a lamb; and if thou wilt not redeem it, then thou shalt break his neck: and all the firstborn of man among thy children shalt thou redeem* (Exodus 13:13). The firstborn of *the firstborn of thy sons shalt thou give unto me* (Exodus 22:29) is given by redemption — bought back by a lamb, the type of the Lamb who redeems the whole assembly of the firstborn.'),
    ('canon','exodus',22,31,'canon','leviticus',17,15,'free',
      E'*And every soul that eateth that which died of itself, or that which was torn with beasts, whether it be one of your own country, or a stranger, he shall both wash his clothes, and bathe himself in water, and be unclean until the even: then shall he be clean* (Leviticus 17:15). The holiness-eating of *ye shall be holy men unto me: neither shall ye eat any flesh that is torn of beasts in the field* (Exodus 22:31) stands across the Torah — to be set apart is to eat as a set-apart people, the dietary holiness never abolished.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-22-the-gospel-does-not-abolish-restitution-it-produces-it',
       E'The gospel does not abolish restitution — it produces it',
       E'The Mishpatim open with the law of the thief: *If a man shall steal an ox, or a sheep, and kill it, or sell it; he shall restore five oxen for an ox, and four sheep for a sheep* (Exodus 22:1), and *If the theft be certainly found in his hand alive... he shall restore double* (Exodus 22:4). This is Yahuah''s righteous judgment — the wrong must be made right to the one wronged, not merely confessed to heaven.\n\nWhen the tax-collector is turned, watch what salvation does: *And Zacchæus stood, and said unto Yahuah (Lord); Behold, Yahuah (Lord), the half of my goods I give to the poor; and if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8). And the answer comes: *This day is salvation come to this house* (Luke 19:9). The gospel does not cancel the restitution law — it produces the very fourfold restoring the Torah commands, and beyond it. A grace that leaves the neighbour unrepaid is not the grace of Yahuah; the civil Torah is the standing pattern of justice the Messiah''s mercy fulfils, never sweeps away.',
       sv.verse_id, ev.verse_id, 'free', 29525
  FROM _s305_ex22_lookup sv, _s305_ex22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=22 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-22-vex-not-the-stranger-afflict-not-the-widow-or-fatherless',
       E'Vex not the stranger, afflict not the widow or the fatherless',
       E'Here is the heart of the Mishpatim: *Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt* (Exodus 22:21); *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22). And the warning is fierce — *If thou afflict them in any wise, and they cry at all unto me, I will surely hear their cry* (Exodus 22:23); *And my wrath shall wax hot* (Exodus 22:24). The defenceless are Yahuah''s own charge, and Israel''s memory of its own bondage is the abiding reason it must become a refuge, not an oppressor.\n\nMoses grounds it in Yahuah''s very character: *He doth execute the judgment of the fatherless and widow, and loveth the stranger... Love ye therefore the stranger: for ye were strangers in the land of Egypt* (Deuteronomy 10:18-19). The prophet names the same four, and their oppression as the sin that sent Israel into exile: *And oppress not the widow, nor the fatherless, the stranger, nor the poor* (Zechariah 7:10). The exile-righteous Tobit lives it among the nations: *Give alms of your substance... neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7). And the apostle makes it the very test of true religion: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction* (James 1:27). From Sinai to the assembly the mercy-law never moves — the curse was exile for breaking it, never the law itself.',
       sv.verse_id, ev.verse_id, 'extras', 29528
  FROM _s305_ex22_lookup sv, _s305_ex22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=22 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-22-the-pledged-garment-returned-before-the-sun-goes-down',
       E'No usury, and the pledged garment returned before the sun goes down',
       E'The Mishpat guards the poor brother in his need: *If thou lend money to any of my people that is poor by thee, thou shalt not be to him as an usurer, neither shalt thou lay upon him usury* (Exodus 22:25). And the cloak taken in pledge must come back by nightfall: *If thou at all take thy neighbour''s raiment to pledge, thou shalt deliver it unto him by that the sun goeth down: For that is his covering only, it is his raiment for his skin: wherein shall he sleep?* (Exodus 22:26-27) — *and it shall come to pass, when he crieth unto me, that I will hear; for I am gracious* (Exodus 22:27).\n\nThe whole Tanakh carries this mercy forward. Moses calls the returned garment *righteousness*: *thou shalt deliver him the pledge again when the sun goeth down... and it shall be righteousness unto thee before Yahuah Elohayka (the LORD thy God)* (Deuteronomy 24:12-13). The Jubilee-law repeats the ban on increase: *Take thou no usury of him, or increase: but fear thy Elohim (God); that thy brother may live with thee* (Leviticus 25:36), the stranger gathered in beside him (Leviticus 25:35). David marks the usury-refuser as one who may dwell on the holy hill: *He that putteth not out his money to usury... shall never be moved* (Psalm 15:5). And Ezekiel makes it the very mark of the just man: *He that hath not given forth upon usury, neither hath taken any increase... hath restored to the debtor his pledge... hath covered the naked with a garment* (Ezekiel 18:7-8). The righteousness the prophets preach is Torah-shaped, never Torah-free.',
       sv.verse_id, ev.verse_id, 'free', 29531
  FROM _s305_ex22_lookup sv, _s305_ex22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=22 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-22-thou-shalt-not-suffer-a-witch-to-live',
       E'Thou shalt not suffer a witch to live — the seed-war against the sorcery of the nations',
       E'Two short Mishpatim strike at the dark arts and the worship of other elohim: *Thou shalt not suffer a witch to live* (Exodus 22:18), and *He that sacrificeth unto any god, save unto Yahuah (LORD) only, he shall be utterly destroyed* (Exodus 22:20). This is conduct, not ethnicity — the seed-war against the sorcery the nations learned from the fallen ones, and against the idolatry that draws the covenant-people away from the One who alone is to be served.\n\nMoses widens it into the whole catalogue: *There shall not be found among you... an enchanter, or a witch, Or a charmer, or a consulter with familiar spirits, or a wizard, or a necromancer* (Deuteronomy 18:10-11) — *all that do these things are an abomination unto Yahuah* (Deuteronomy 18:12). To seek the spirits is to be defiled: *Regard not them that have familiar spirits, neither seek after wizards, to be defiled by them: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:31). And the apostles carry the same judgment forward, never relaxed: Paul lists *witchcraft* among *the works of the flesh* that bar the kingdom (Galatians 5:19-20); and the end seals it — *sorcerers... shall have their part in the lake which burneth with fire and brimstone: which is the second death* (Revelation 21:8); *For without are dogs, and sorcerers* (Revelation 22:15). The sorcerer barred from the city is the witch of Sinai: the same conduct, the same utter destruction, from the wilderness to the last day.',
       sv.verse_id, ev.verse_id, 'free', 29534
  FROM _s305_ex22_lookup sv, _s305_ex22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=22 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-22-the-firstborn-given-and-a-set-apart-people',
       E'The firstborn given, and a set-apart people',
       E'The chapter closes by drawing Israel back to the Passover-claim and to its calling as a holy people: *Thou shalt not delay to offer the first of thy ripe fruits, and of thy liquors: the firstborn of thy sons shalt thou give unto me* (Exodus 22:29); *And ye shall be holy men unto me: neither shall ye eat any flesh that is torn of beasts in the field; ye shall cast it to the dogs* (Exodus 22:31).\n\nThe firstborn-claim looks straight back to the night of the tenth plague: *Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Yashar''el (Israel), both of man and of beast: it is mine* (Exodus 13:2) — and the firstborn is given by redemption, bought back by a lamb: *all the firstborn of man among thy children shalt thou redeem* (Exodus 13:13), the type of the Lamb who redeems the whole assembly of the firstborn. And the set-apart eating stands across the Torah: *every soul that eateth that which died of itself, or that which was torn with beasts... he shall both wash his clothes, and bathe himself in water, and be unclean until the even* (Leviticus 17:15). To belong wholly to Yahuah is to eat as a set-apart people — the holiness never abolished, the mark of a people redeemed to be His own.',
       sv.verse_id, ev.verse_id, 'free', 29537
  FROM _s305_ex22_lookup sv, _s305_ex22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=22 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8) — the turned tax-collector obeys the restitution law, going beyond the bare measure; the gospel produces what the Torah commands.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=1
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-gospel-does-not-abolish-restitution-it-produces-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he shall restore double* (Exodus 22:4) is the floor the Mishpat sets; Zacchæus *restore[s] him fourfold* (Luke 19:8) from a willing heart — grace pays the debt to the wronged, it does not cancel it.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=4
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-gospel-does-not-abolish-restitution-it-produces-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*To visit the fatherless and widows in their affliction* (James 1:27) — the apostle names the Torah-mercy of *Thou shalt neither vex a stranger, nor oppress him* (Exodus 22:21) as the very test of pure religion.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=21
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-vex-not-the-stranger-afflict-not-the-widow-or-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*To visit the fatherless and widows in their affliction* (James 1:27) echoes *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22) — to oppress them invites the wrath that *shall wax hot* (Exodus 22:24).'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=22
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-vex-not-the-stranger-afflict-not-the-widow-or-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He doth execute the judgment of the fatherless and widow, and loveth the stranger* (Deuteronomy 10:18) — Moses grounds *for ye were strangers in the land of Egypt* (Exodus 22:21) in Yahuah''s own character.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=21
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-vex-not-the-stranger-afflict-not-the-widow-or-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Love ye therefore the stranger: for ye were strangers in the land of Egypt* (Deuteronomy 10:19) — the Egypt-memory that anchors *for ye were strangers in the land of Egypt* (Exodus 22:21); the redeemed become a refuge, not an oppressor.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=21
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-vex-not-the-stranger-afflict-not-the-widow-or-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*And oppress not the widow, nor the fatherless, the stranger, nor the poor* (Zechariah 7:10) — the prophet names the exact four the Mishpat protects (Exodus 22:22); failing it was the sin that sent Israel into exile (Zechariah 7:12-14). The curse was exile, never the law.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=22
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-vex-not-the-stranger-afflict-not-the-widow-or-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Give alms of your substance... neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7) — the exile-righteous Tobit lives the Mishpat of *Thou shalt neither vex a stranger, nor oppress him* (Exodus 22:21) among the nations.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=21
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-vex-not-the-stranger-afflict-not-the-widow-or-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt deliver him the pledge again when the sun goeth down... and it shall be righteousness unto thee* (Deuteronomy 24:12-13) — Moses restates the sunset-mercy of *deliver it unto him by that the sun goeth down* (Exodus 22:26) and calls it righteousness.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=26
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-pledged-garment-returned-before-the-sun-goes-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*that he may sleep in his own raiment, and bless thee: and it shall be righteousness unto thee* (Deuteronomy 24:13) answers the cry *wherein shall he sleep?* (Exodus 22:27) — the poor man''s blessing hangs on a returned garment.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=27
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-pledged-garment-returned-before-the-sun-goes-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And if thy brother be waxen poor... then thou shalt relieve him: yea, though he be a stranger* (Leviticus 25:35) — the poor brother of *that is poor by thee* (Exodus 22:25), the stranger gathered in beside him.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=25
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-pledged-garment-returned-before-the-sun-goes-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Take thou no usury of him, or increase: but fear thy Elohim (God); that thy brother may live with thee* (Leviticus 25:36) — the Jubilee-law repeats *neither shalt thou lay upon him usury* (Exodus 22:25); to lend without increase keeps the poor brother alive.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=25
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-pledged-garment-returned-before-the-sun-goes-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He that putteth not out his money to usury... shall never be moved* (Psalm 15:5) — David names the usury-refuser of *neither shalt thou lay upon him usury* (Exodus 22:25) among those who dwell on the holy hill.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=25
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-pledged-garment-returned-before-the-sun-goes-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*He that hath not given forth upon usury... hath restored to the debtor his pledge... hath covered the naked with a garment* (Ezekiel 18:7-8) — the prophet marks the just man by the very Mishpatim of *deliver it unto him by that the sun goeth down* (Exodus 22:26).'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=26
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-pledged-garment-returned-before-the-sun-goes-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*an enchanter, or a witch, Or a charmer, or a consulter with familiar spirits, or a wizard, or a necromancer* (Deuteronomy 18:10-11) — Moses widens *Thou shalt not suffer a witch to live* (Exodus 22:18) into the whole catalogue of the nations'' sorcery, *an abomination unto Yahuah*.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=18
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-thou-shalt-not-suffer-a-witch-to-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Regard not them that have familiar spirits, neither seek after wizards, to be defiled by them* (Leviticus 19:31) — the same ban behind *Thou shalt not suffer a witch to live* (Exodus 22:18); to consult the spirits is to be defiled.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=18
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-thou-shalt-not-suffer-a-witch-to-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Idolatry, witchcraft...* (Galatians 5:20) among *the works of the flesh* (Galatians 5:19) — Paul has not relaxed *Thou shalt not suffer a witch to live* (Exodus 22:18); witchcraft still shuts a soul out of the kingdom.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=18
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-thou-shalt-not-suffer-a-witch-to-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*sorcerers, and idolaters... shall have their part in the lake which burneth with fire and brimstone: which is the second death* (Revelation 21:8) — the end answers *He that sacrificeth unto any god... shall be utterly destroyed* (Exodus 22:20).'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=20
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-thou-shalt-not-suffer-a-witch-to-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For without are dogs, and sorcerers* (Revelation 22:15) — the sorcerer barred from the New Jerusalem is the witch of *Thou shalt not suffer a witch to live* (Exodus 22:18): the same conduct, the same exclusion.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=18
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-thou-shalt-not-suffer-a-witch-to-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Sanctify unto me all the firstborn, whatsoever openeth the womb... it is mine* (Exodus 13:2) — the firstborn-claim of *the firstborn of thy sons shalt thou give unto me* (Exodus 22:29) reaches back to the Passover-night redemption.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=29
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-firstborn-given-and-a-set-apart-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all the firstborn of man among thy children shalt thou redeem* (Exodus 13:13) — the firstborn given (Exodus 22:29) is bought back by a lamb, the type of the Lamb who redeems the assembly of the firstborn.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=29
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-firstborn-given-and-a-set-apart-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*every soul that eateth that which died of itself, or that which was torn with beasts... shall... be unclean until the even* (Leviticus 17:15) — the set-apart eating of *neither shall ye eat any flesh that is torn of beasts* (Exodus 22:31) stands across the Torah, never abolished.'
  FROM cross_reference_threads t
  JOIN _s305_ex22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=22 AND sv.verse_number=31
  JOIN _s305_ex22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-22-the-firstborn-given-and-a-set-apart-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
