-- ----- fragment: minion_psalms_75.sql (Psalm 75) -----
-- Chapter: Psalm 75 — ELOHIM THE JUDGE WHO ABASES AND EXALTS / THE CUP OF HIS WRATH. A psalm of
-- Asaph framed by thanksgiving (*Unto thee, O Elohim (God), do we give thanks... for that thy name
-- is near*, v.1; *But I will declare for ever; I will sing praises to the Elohim (God) of Jacob*,
-- v.9). Between the thanks stands the great court of Yahuah: the One who keeps the appointed time
-- of judgment (*When I shall receive the congregation I will judge uprightly*, v.2), who alone
-- lifts up and casts down (*Elohim (God) is the judge: he putteth down one, and setteth up
-- another*, vv.6-7), who holds the ★★ KEYSTONE cup of wrath (*For in the hand of Yahuah (LORD)
-- there is a cup, and the wine is red; it is full of mixture... the dregs thereof, all the wicked
-- of the earth shall wring them out, and drink them*, v.8), and who at the last cuts off the horns
-- of the wicked and exalts the horns of the righteous (v.10).
-- Tag: ps075   Temp view: _s302_ps075_lookup
-- Sort band: base 23850, step 3 -> threads at 23850, 23853, 23856, 23859 (4 threads)
-- Source of EVERY row: 'canon','psalms',75,v
--
-- Psalm 75 coverage:
--   v.1 (Unto thee, O Elohim, do we give thanks... for that thy name is near thy wondrous works declare)
--        NT/Extras/Tanakh: none warranted as separate (the thanksgiving frame; folded as the opening of
--                the psalm, paired with v.9; not framework-load-bearing apart from the court that follows)
--   ★ v.2 (When I shall receive the congregation I will judge uprightly)
--        NT:     ★ Acts 17:31 (he hath appointed a day, in the which he will judge the world in
--                righteousness — the appointed day of righteous judgment) — THREAD 1
--        Extras: none warranted (the appointed-time-of-judgment weave is carried clean by Acts 17 + Hab 2 + Ps 102)
--        Tanakh: ★ Habakkuk 2:3 (the vision is yet for an appointed time... wait for it; it will surely
--                come — the set time fixed and certain), Psalm 102:13 (the time to favour her, yea, the
--                set time, is come — Yahuah's appointed moment) — THREAD 1
--   vv.3-5 (The earth... are dissolved: I bear up the pillars... Lift not up the horn... speak not
--          with a stiff neck)
--        NT/Extras: none warranted
--        Tanakh: the lift-not-up-the-horn warning is the negative of v.10's verdict; folded into THREAD 4
--                (the horns cut off); the pillars-of-the-earth note echoes 1 Sam 2:8, carried in THREAD 2
--   ★ vv.6-7 (For promotion cometh neither from the east, nor from the west, nor from the south. But
--          Elohim is the judge: he putteth down one, and setteth up another)
--        NT:     ★ Luke 1:52 (He hath put down the mighty from their seats, and exalted them of low
--                degree — Miryam's song of the same reversal), James 4:10 (Humble yourselves... and he
--                shall lift you up — the abasement that He turns to exaltation) — THREAD 2
--        Extras: ★ Sirach 10:14 (Yahuah (God) has cast down the thrones of proud princes, and set up the
--                meek in their stead — the restored wisdom sings the abase-and-exalt) — THREAD 2
--        Tanakh: ★ 1 Samuel 2:7-8 (Yahuah maketh poor, and maketh rich... he raiseth up the poor out of
--                the dust — Hannah's song, the source-spring), Daniel 2:21 (he removeth kings, and
--                setteth up kings — the same hand over the thrones) — THREAD 2
--   ★★ v.8 KEYSTONE (For in the hand of Yahuah there is a cup, and the wine is red; it is full of
--          mixture; and he poureth out of the same: but the dregs thereof, all the wicked of the
--          earth shall wring them out, and drink them)
--        NT:     ★★ Revelation 14:10 (drink of the wine of the wrath of Elohim... poured out without
--                mixture into the cup of his indignation), Revelation 16:19 (the cup of the wine of the
--                fierceness of his wrath), Matthew 26:39 (let this cup pass from me — the Messiah who
--                drank that cup) — THREAD 3
--        Extras: none warranted (weighed; the cup-of-wrath weave is overwhelmingly carried by the canon
--                witnesses Jeremiah 25 / Isaiah 51 / Revelation — extras lean here, none forced)
--        Tanakh: ★★ Jeremiah 25:15 (Take the wine cup of this fury at my hand, and cause all the nations
--                to drink it), Isaiah 51:17 (the cup of his fury... the dregs of the cup of trembling, and
--                wrung them out), Psalm 11:6 (fire and brimstone... the portion of their cup) — THREAD 3
--   ★ v.10 (All the horns of the wicked also will I cut off; but the horns of the righteous shall be
--          exalted)
--        NT:     ★ Luke 1:69 (an horn of salvation for us in the house of his servant David — the horn
--                of the righteous lifted in the Messiah) — THREAD 4
--        Extras: none warranted (the horn-cast-down/lifted-up weave is carried by 1 Sam 2 + Ps 89/92 + Luke 1)
--        Tanakh: ★ 1 Samuel 2:1 (mine horn is exalted in Yahuah), ★ 1 Samuel 2:10 (he shall... exalt the
--                horn of his anointed — the horn of the anointed king), Psalm 89:17 (in thy favour our
--                horn shall be exalted), Psalm 92:10 (my horn shalt thou exalt like the horn of an
--                unicorn) — THREAD 4
--   v.9 (But I will declare for ever; I will sing praises to the Elohim of Jacob)
--        NT/Extras/Tanakh: none warranted as separate (the thanksgiving close, pair of v.1; recorded as
--                the doxology frame, not a separate thread)
--
-- Threads (slug — target libraries):
--   1. psalm-75-the-appointed-time-of-righteous-judgment — NT (Acts 17) + Tanakh (Habakkuk 2, Psalm 102)
--      [free] (★ v.2: the set time of upright judgment — Yahuah hath appointed a day)
--   2. psalm-75-he-putteth-down-one-and-setteth-up-another — NT (Luke 1, James 4) + Extras (Sirach 10) +
--      Tanakh (1 Samuel 2, Daniel 2) [extras] (★ vv.6-7: the One who abases and exalts — Hannah's spring)
--   3. psalm-75-the-cup-of-yahuahs-wrath — NT (Revelation 14, Revelation 16, Matthew 26) + Tanakh
--      (Jeremiah 25, Isaiah 51, Psalm 11) [free] (★★ KEYSTONE v.8: the cup of fury the wicked drink — the
--      Messiah who drank it)
--   4. psalm-75-the-horns-of-the-wicked-cut-off-the-horns-of-the-righteous-exalted — NT (Luke 1) + Tanakh
--      (1 Samuel 2, Psalm 89, Psalm 92) [free] (★ v.10: the horns cast down and lifted up — the horn of salvation)
--
-- Framing notes:
--   ★ THE APPOINTED TIME OF JUDGMENT (THREAD 1, v.2): *When I shall receive the congregation I will judge
--      uprightly* (75:2). Yahuah's judgment is not arbitrary but set to His own appointed moment. Paul
--      preaches the very thing on Mars' hill — *he hath appointed a day, in the which he will judge the
--      world in righteousness by that man whom he hath ordained* (Acts 17:31) — the upright judgment of
--      the psalm become the appointed day by the Formed Son ordained to judge. The prophet was told the
--      same of the vision — *the vision is yet for an appointed time... wait for it; because it will
--      surely come* (Habakkuk 2:3) — and the psalter of the set time to favour Zion — *the time to
--      favour her, yea, the set time, is come* (Psalm 102:13). The Judge keeps His own clock.
--   ★ HE PUTTETH DOWN ONE AND SETTETH UP ANOTHER (THREAD 2, vv.6-7): *For promotion cometh neither from
--      the east, nor from the west, nor from the south. But Elohim (God) is the judge: he putteth down
--      one, and setteth up another* (75:6-7). Promotion is from no quarter of earth but from the hand of
--      the Judge. Hannah sang the spring of it — *Yahuah (LORD) maketh poor, and maketh rich... he
--      raiseth up the poor out of the dust* (1 Samuel 2:7-8) — Daniel saw it over the thrones — *he
--      removeth kings, and setteth up kings* (Daniel 2:21) — Miryam sang it again at the door of the
--      gospel — *He hath put down the mighty from their seats, and exalted them of low degree* (Luke
--      1:52) — and James turns it to a charge — *Humble yourselves in the sight of Yahuah (Lord), and he
--      shall lift you up* (James 4:10). The restored wisdom sings the same reversal — *Yahuah (God) has
--      cast down the thrones of proud princes, and set up the meek in their stead* (Sirach 10:14). The
--      One who lifts and casts down is the Judge alone; the abased He exalts.
--   ★★ KEYSTONE — THE CUP OF YAHUAH'S WRATH (THREAD 3, v.8): *For in the hand of Yahuah (LORD) there is a
--      cup, and the wine is red; it is full of mixture; and he poureth out of the same: but the dregs
--      thereof, all the wicked of the earth shall wring them out, and drink them* (75:8). This cup runs
--      the whole canon. Jeremiah is handed it — *Take the wine cup of this fury at my hand, and cause all
--      the nations... to drink it* (Jeremiah 25:15) — Jerusalem drinks it — *the cup of his fury; thou
--      hast drunken the dregs of the cup of trembling, and wrung them out* (Isaiah 51:17) — the wicked's
--      portion is named — *fire and brimstone... the portion of their cup* (Psalm 11:6). At the end it is
--      poured full strength — *drink of the wine of the wrath of Elohim (God), which is poured out
--      without mixture into the cup of his indignation* (Revelation 14:10); *the cup of the wine of the
--      fierceness of his wrath* (Revelation 16:19). And the Formed Son took that very cup into His own
--      hand in the garden — *O my Father, if it be possible, let this cup pass from me: nevertheless not
--      as I will, but as thou wilt* (Matthew 26:39) — the cup the wicked must wring out, the Messiah
--      drank, that the dregs might not fall on His own.
--   ★ THE HORNS CUT OFF AND EXALTED (THREAD 4, v.10): *All the horns of the wicked also will I cut off;
--      but the horns of the righteous shall be exalted* (75:10) — answering the warning of vv.4-5, *Lift
--      not up the horn... speak not with a stiff neck*. Hannah opened and closed her song on the horn —
--      *mine horn is exalted in Yahuah (LORD)* (1 Samuel 2:1); *he shall give strength unto his king, and
--      exalt the horn of his anointed* (1 Samuel 2:10). The psalter sings the exalted horn — *in thy
--      favour our horn shall be exalted* (Psalm 89:17); *my horn shalt thou exalt like the horn of an
--      unicorn* (Psalm 92:10). And Zacharias names the horn raised at last — *an horn of salvation for us
--      in the house of his servant David* (Luke 1:69) — the horn of the righteous lifted in the Messiah,
--      the horns of the wicked cut off.
--   VERSES WITH NO SEPARATE ADD: vv.1,9 (the thanksgiving frame) and vv.3-5 (the pillars-borne earth and
--      the lift-not-up-the-horn warning) carry the doxology and the negative of the final verdict; these
--      are recorded as folded (vv.3-5 into THREADS 2 and 4) — the framework weight sits on vv.2,6-7,8,10.

CREATE TEMP VIEW _s302_ps075_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The appointed time of righteous judgment
    ('canon','psalms',75,2,'canon','acts',17,31,'free',
      E'*Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained; whereof he hath given assurance unto all men, in that he hath raised him from the dead* (Acts 17:31). *When I shall receive the congregation I will judge uprightly* (Psalm 75:2): the upright judgment of the psalm is the appointed day Paul preaches — Yahuah hath set the day and ordained the Formed Son to judge the world in righteousness. The Judge keeps His own appointed time.'),
    ('canon','psalms',75,2,'canon','habakkuk',2,3,'free',
      E'*For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:3). *When I shall receive the congregation I will judge uprightly* (Psalm 75:2): the judgment is fixed to an appointed time — the vision will surely come at the end. What the psalm calls the receiving of the congregation, the prophet calls the appointed time that does not lie.'),
    ('canon','psalms',75,2,'canon','psalms',102,13,'free',
      E'*Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come* (Psalm 102:13). *When I shall receive the congregation I will judge uprightly* (Psalm 75:2): the same set time governs Yahuah''s acts — the moment to favour Zion and the moment to judge uprightly are both His appointed hour, fixed and certain.'),

    -- THREAD 2 (★): He putteth down one and setteth up another — the One who abases and exalts
    ('canon','psalms',75,7,'canon','luke',1,52,'free',
      E'*He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). *But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7): Miryam sings the very reversal at the door of the gospel — the mighty cast down, the lowly lifted. The Judge who puts down one and sets up another is the One whose mercy fills her song.'),
    ('canon','psalms',75,7,'canon','james',4,10,'free',
      E'*Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10). *He putteth down one, and setteth up another* (Psalm 75:7): the abasement the proud refuse, the humble embrace — and the Judge who casts down the lofty lifts up the one who humbles himself. The setting-up of the psalm is the lifting-up James promises.'),
    ('canon','psalms',75,7,'canon','1-samuel',2,7,'free',
      E'*Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7). *But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7): Hannah''s song is the spring of the psalm — Yahuah brings low and lifts up, the same hand over poverty and riches, the same hand over the abased and the exalted.'),
    ('canon','psalms',75,7,'canon','1-samuel',2,8,'free',
      E'*He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory: for the pillars of the earth are the LORD''S, and he hath set the world upon them* (1 Samuel 2:8). *He putteth down one, and setteth up another* (Psalm 75:7), and *I bear up the pillars of it* (75:3): Hannah names both — the poor raised to the throne of glory, and the pillars of the earth held in Yahuah''s own hand. The One who bears the pillars is the One who sets up and casts down.'),
    ('canon','psalms',75,7,'canon','daniel',2,21,'free',
      E'*And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding* (Daniel 2:21). *He putteth down one, and setteth up another* (Psalm 75:7): Daniel sees the same hand over the thrones of the nations — Yahuah removes kings and sets up kings. Promotion comes from no quarter of earth (75:6) but from the Judge who governs the times.'),
    ('canon','psalms',75,7,'apocrypha','ecclesiasticus',10,14,'extras',
      E'*Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* (Sirach 10:14). *He putteth down one, and setteth up another* (Psalm 75:7): the restored wisdom sings the abase-and-exalt outright — the thrones of the proud cast down, the meek set up in their place. The reversal of the psalm is the settled way of the Judge.'),

    -- THREAD 3 (★★ KEYSTONE): The cup of Yahuah's wrath
    ('canon','psalms',75,8,'canon','jeremiah',25,15,'free',
      E'*For thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel) unto me; Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it* (Jeremiah 25:15). *For in the hand of Yahuah (LORD) there is a cup, and the wine is red; it is full of mixture... all the wicked of the earth shall wring them out, and drink them* (Psalm 75:8): the cup in Yahuah''s hand is the wine cup of fury Jeremiah is handed — all the nations made to drink it. The psalm names the cup; the prophet pours it.'),
    ('canon','psalms',75,8,'canon','isaiah',51,17,'free',
      E'*Awake, awake, stand up, O Jerusalem, which hast drunk at the hand of Yahuah (LORD) the cup of his fury; thou hast drunken the dregs of the cup of trembling, and wrung them out* (Isaiah 51:17). *The dregs thereof, all the wicked of the earth shall wring them out, and drink them* (Psalm 75:8): the very dregs of the psalm are the dregs of the cup of trembling Jerusalem wrings out — the same cup of fury at Yahuah''s hand, drunk to the bottom.'),
    ('canon','psalms',75,8,'canon','psalms',11,6,'free',
      E'*Upon the wicked he shall rain snares, fire and brimstone, and an horrible tempest: this shall be the portion of their cup* (Psalm 11:6). *All the wicked of the earth shall wring them out, and drink them* (Psalm 75:8): the cup the wicked must drink is their portion — fire and brimstone rained upon them. What Psalm 75 calls the dregs, Psalm 11 calls the portion of their cup.'),
    ('canon','psalms',75,8,'canon','revelation',14,10,'free',
      E'*The same shall drink of the wine of the wrath of Elohim (God), which is poured out without mixture into the cup of his indignation; and he shall be tormented with fire and brimstone in the presence of the holy angels, and in the presence of the Lamb* (Revelation 14:10). *In the hand of Yahuah (LORD) there is a cup... and he poureth out of the same* (Psalm 75:8): the cup poured out at the end is the same cup of wrath — the wine of the indignation of Elohim, drunk by the wicked. The psalm''s mixed wine becomes the wrath poured without mixture.'),
    ('canon','psalms',75,8,'canon','revelation',16,19,'free',
      E'*And the great city was divided into three parts... and great Babylon came in remembrance before Elohim (God), to give unto her the cup of the wine of the fierceness of his wrath* (Revelation 16:19). *He poureth out of the same: but the dregs thereof, all the wicked of the earth shall wring them out, and drink them* (Psalm 75:8): Babylon is given the cup at last — the cup of the wine of the fierceness of His wrath, the dregs of the psalm poured out upon the wicked city.'),
    ('canon','psalms',75,8,'canon','matthew',26,39,'free',
      E'*And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt* (Matthew 26:39). *For in the hand of Yahuah (LORD) there is a cup... all the wicked of the earth shall wring them out, and drink them* (Psalm 75:8): the cup the wicked must drink, the Formed Son took into His own hand in the garden — *let this cup pass from me* — the Messiah who drank the cup of wrath that the dregs might not fall on His own.'),

    -- THREAD 4 (★): The horns of the wicked cut off, the horns of the righteous exalted
    ('canon','psalms',75,10,'canon','1-samuel',2,1,'free',
      E'*And Hannah prayed, and said, My heart rejoiceth in Yahuah (LORD), mine horn is exalted in Yahuah (LORD): my mouth is enlarged over mine enemies; because I rejoice in thy salvation* (1 Samuel 2:1). *The horns of the righteous shall be exalted* (Psalm 75:10): Hannah opens her song on the exalted horn — *mine horn is exalted in Yahuah* — the very lifting-up the psalm promises the righteous.'),
    ('canon','psalms',75,10,'canon','1-samuel',2,10,'free',
      E'*The adversaries of Yahuah (LORD) shall be broken to pieces... Yahuah (LORD) shall judge the ends of the earth; and he shall give strength unto his king, and exalt the horn of his anointed* (1 Samuel 2:10). *All the horns of the wicked also will I cut off; but the horns of the righteous shall be exalted* (Psalm 75:10): Hannah closes as the psalm closes — the adversaries broken, the horn of the anointed exalted. The horns cut off and lifted up are the verdict of the Judge over the ends of the earth.'),
    ('canon','psalms',75,10,'canon','psalms',89,17,'free',
      E'*For thou art the glory of their strength: and in thy favour our horn shall be exalted* (Psalm 89:17). *The horns of the righteous shall be exalted* (Psalm 75:10): the exalting of the horn is in Yahuah''s favour — His favour the glory of their strength, the lifting-up of the righteous the work of His hand.'),
    ('canon','psalms',75,10,'canon','psalms',92,10,'free',
      E'*But my horn shalt thou exalt like the horn of an unicorn: I shall be anointed with fresh oil* (Psalm 92:10). *The horns of the righteous shall be exalted* (Psalm 75:10): the psalter sings the lifted horn again — the horn of the righteous exalted, anointed with fresh oil, while the horns of the wicked are cut off.'),
    ('canon','psalms',75,10,'canon','luke',1,69,'free',
      E'*And hath raised up an horn of salvation for us in the house of his servant David* (Luke 1:69). *The horns of the righteous shall be exalted* (Psalm 75:10): Zacharias names the horn raised at last — *an horn of salvation... in the house of his servant David* — the horn of the righteous lifted in the Messiah, the Davidic deliverance the psalm foretells.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps075_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps075_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-75-the-appointed-time-of-righteous-judgment',
       E'When I shall receive the congregation I will judge uprightly — the appointed time of righteous judgment',
       E'*When I shall receive the congregation I will judge uprightly* (Psalm 75:2). Yahuah''s judgment is not arbitrary but set to His own appointed moment — the receiving of the congregation, the upright verdict. Paul preaches the very thing on Mars'' hill: *Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained; whereof he hath given assurance unto all men, in that he hath raised him from the dead* (Acts 17:31) — the upright judgment of the psalm become the appointed day by the Formed Son ordained to judge. The prophet was told the same of the vision: *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:3). And the psalter sings the set time to favour Zion: *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come* (Psalm 102:13). The Judge keeps His own clock — the moment to favour and the moment to judge are both His appointed hour, fixed and certain.',
       sv.verse_id, ev.verse_id, 'free', 23850
  FROM _s302_ps075_lookup sv, _s302_ps075_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=75 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-75-he-putteth-down-one-and-setteth-up-another',
       E'He putteth down one, and setteth up another — the One who abases and exalts',
       E'*For promotion cometh neither from the east, nor from the west, nor from the south. But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:6-7). Promotion is from no quarter of earth but from the hand of the Judge alone. Hannah sang the spring of it: *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up. He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes... for the pillars of the earth are the LORD''S* (1 Samuel 2:7-8) — and the One who bears the pillars (*I bear up the pillars of it*, 75:3) is the One who casts down and sets up. Daniel saw the same hand over the thrones: *he removeth kings, and setteth up kings* (Daniel 2:21). Miryam sang it again at the door of the gospel: *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). James turns it to a charge: *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10). And the restored wisdom sings the same reversal: *Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* (Sirach 10:14). The abased He exalts; the proud He casts down — this is the settled way of the Judge.',
       sv.verse_id, ev.verse_id, 'extras', 23853
  FROM _s302_ps075_lookup sv, _s302_ps075_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=75 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-75-the-cup-of-yahuahs-wrath',
       E'In the hand of Yahuah there is a cup — the cup of his wrath the wicked drink',
       E'The keystone of the psalm is the cup: *For in the hand of Yahuah (LORD) there is a cup, and the wine is red; it is full of mixture; and he poureth out of the same: but the dregs thereof, all the wicked of the earth shall wring them out, and drink them* (Psalm 75:8). This cup runs the whole canon. Jeremiah is handed it: *Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it* (Jeremiah 25:15). Jerusalem drinks it to the bottom: *thou hast drunken the dregs of the cup of trembling, and wrung them out* (Isaiah 51:17). The wicked''s portion is named: *fire and brimstone... the portion of their cup* (Psalm 11:6). At the end it is poured full strength: *drink of the wine of the wrath of Elohim (God), which is poured out without mixture into the cup of his indignation* (Revelation 14:10); and Babylon is given *the cup of the wine of the fierceness of his wrath* (Revelation 16:19). And the Formed Son took that very cup into His own hand in the garden: *O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt* (Matthew 26:39) — the cup the wicked must wring out, the Messiah drank, that the dregs might not fall on His own. The mixed wine of the psalm is the wrath poured out without mixture at the last.',
       sv.verse_id, ev.verse_id, 'free', 23856
  FROM _s302_ps075_lookup sv, _s302_ps075_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=75 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-75-the-horns-of-the-wicked-cut-off-the-horns-of-the-righteous-exalted',
       E'All the horns of the wicked will I cut off; but the horns of the righteous shall be exalted',
       E'*All the horns of the wicked also will I cut off; but the horns of the righteous shall be exalted* (Psalm 75:10) — the final verdict, answering the warning of vv.4-5, *Lift not up the horn... speak not with a stiff neck*. Hannah opened and closed her song on the horn: *mine horn is exalted in Yahuah (LORD)* (1 Samuel 2:1); and *he shall give strength unto his king, and exalt the horn of his anointed* (1 Samuel 2:10). The psalter sings the exalted horn: *in thy favour our horn shall be exalted* (Psalm 89:17); *my horn shalt thou exalt like the horn of an unicorn: I shall be anointed with fresh oil* (Psalm 92:10). And Zacharias names the horn raised at last: *And hath raised up an horn of salvation for us in the house of his servant David* (Luke 1:69) — the horn of the righteous lifted in the Messiah, the Davidic deliverance foretold, while the horns of the wicked are cut off. The horn lifted up in pride against Yahuah is broken; the horn lifted up by Yahuah for the righteous endures.',
       sv.verse_id, ev.verse_id, 'free', 23859
  FROM _s302_ps075_lookup sv, _s302_ps075_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=75 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained* (Acts 17:31) — Paul preaches 75:2: the upright judgment is the appointed day by the Formed Son ordained.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=2
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-appointed-time-of-righteous-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the vision is yet for an appointed time... wait for it; because it will surely come* (Habakkuk 2:3) — the judgment of 75:2 fixed to an appointed time that does not lie.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=2
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-appointed-time-of-righteous-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the time to favour her, yea, the set time, is come* (Psalm 102:13) — the same set time as 75:2: Yahuah''s appointed hour to favour and to judge, fixed and certain.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=2
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-appointed-time-of-righteous-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7) — Hannah''s song, the spring of 75:7: the same hand over the abased and the exalted.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=7
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-he-putteth-down-one-and-setteth-up-another'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *He raiseth up the poor out of the dust... for the pillars of the earth are the LORD''S* (1 Samuel 2:8) — Hannah names both the raising-up of 75:7 and the borne pillars of 75:3.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=7
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-he-putteth-down-one-and-setteth-up-another'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he removeth kings, and setteth up kings* (Daniel 2:21) — the same hand of 75:7 over the thrones of the nations: promotion from the Judge, not from any quarter of earth.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=7
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-he-putteth-down-one-and-setteth-up-another'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52) — Miryam sings the reversal of 75:7 at the door of the gospel: the mighty cast down, the lowly lifted.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=7
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-he-putteth-down-one-and-setteth-up-another'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10) — the setting-up of 75:7 turned to a charge: the One who casts down the lofty lifts the humble.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=7
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-he-putteth-down-one-and-setteth-up-another'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* (Sirach 10:14) — the restored wisdom sings the abase-and-exalt of 75:7 outright.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=7
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-he-putteth-down-one-and-setteth-up-another'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Take the wine cup of this fury at my hand, and cause all the nations... to drink it* (Jeremiah 25:15) — the cup in Yahuah''s hand (75:8) handed to the prophet to pour on the nations.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=8
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-cup-of-yahuahs-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *thou hast drunken the dregs of the cup of trembling, and wrung them out* (Isaiah 51:17) — the very dregs of 75:8: the cup of fury at Yahuah''s hand drunk to the bottom.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=8
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-cup-of-yahuahs-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*fire and brimstone... the portion of their cup* (Psalm 11:6) — what 75:8 calls the dregs the wicked drink, Psalm 11 calls the portion of their cup.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=8
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-cup-of-yahuahs-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the wine of the wrath of Elohim (God), which is poured out without mixture into the cup of his indignation* (Revelation 14:10) — the cup of 75:8 poured at the end: the mixed wine become wrath without mixture.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=8
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-cup-of-yahuahs-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the cup of the wine of the fierceness of his wrath* (Revelation 16:19) — the dregs of 75:8 poured upon Babylon at the last: the cup given to the wicked city.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=8
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-cup-of-yahuahs-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *O my Father, if it be possible, let this cup pass from me* (Matthew 26:39) — the cup the wicked must wring out (75:8) the Formed Son took into His own hand, drinking the wrath that the dregs might not fall on His own.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=8
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-cup-of-yahuahs-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *mine horn is exalted in Yahuah (LORD)* (1 Samuel 2:1) — Hannah opens her song on the exalted horn of 75:10: the lifting-up of the righteous.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=10
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-horns-of-the-wicked-cut-off-the-horns-of-the-righteous-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *he shall give strength unto his king, and exalt the horn of his anointed* (1 Samuel 2:10) — Hannah closes as 75:10 closes: adversaries broken, the horn of the anointed exalted.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=10
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-horns-of-the-wicked-cut-off-the-horns-of-the-righteous-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*in thy favour our horn shall be exalted* (Psalm 89:17) — the exalted horn of 75:10 lifted in Yahuah''s favour, His favour the glory of their strength.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=10
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-horns-of-the-wicked-cut-off-the-horns-of-the-righteous-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*my horn shalt thou exalt like the horn of an unicorn* (Psalm 92:10) — the psalter sings the lifted horn of 75:10 again, the righteous anointed with fresh oil.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=10
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=92 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-horns-of-the-wicked-cut-off-the-horns-of-the-righteous-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *an horn of salvation for us in the house of his servant David* (Luke 1:69) — Zacharias names the horn of 75:10 raised at last: the horn of the righteous lifted in the Messiah.'
  FROM cross_reference_threads t
  JOIN _s302_ps075_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=75 AND sv.verse_number=10
  JOIN _s302_ps075_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=69
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-75-the-horns-of-the-wicked-cut-off-the-horns-of-the-righteous-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
