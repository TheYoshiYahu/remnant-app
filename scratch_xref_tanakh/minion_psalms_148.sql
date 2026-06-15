-- ----- fragment: minion_psalms_148.sql (Psalm 148) -----
-- Chapter: Psalm 148 — the cosmic Hallel: all creation summoned to praise (heights, then earth)
-- Tag: ps148   Session prefix: s302   Sort band base: 25675 (25675, 25678, 25681, 25684)
-- Source rows ALWAYS 'canon','psalms',148,v.   Thread slug prefix SINGULAR: psalm-148-...
-- (Authored directly by the orchestrator after two minion socket-deaths; greenfield 0; idempotent.)
--
-- THREADS (slug — target libraries):
--   T1 psalm-148-praise-him-from-the-heights-all-his-angels-and-the-luminaries   [Tanakh]  (free)
--        vv.1-4 the angelic host + the appointed-times luminaries + the waters above (Ps103:20-21, Job38:7, Gen1:14,16,7)
--   T2 psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass [Tanakh + NT] (free)
--        vv.5-6 creation BY the spoken Word; the fixed decree = the seed of Yashar'el never ceases (Ps33:6,9, John1:3, Col1:16, Heb11:3, Jer31:35-36, Jer33:25)
--   T3 psalm-148-praise-him-from-the-earth-the-elements-fulfilling-his-word        [Tanakh]  (free)
--        vv.7-10 fire/hail/snow/wind "fulfilling his word" = the elements obeying his command (Ps147:15,18)
--   T4 psalm-148-his-name-alone-excellent-and-the-horn-of-his-people-exalted       [Tanakh + NT] (free)
--        vv.13-14 the Name alone exalted; the horn of his people lifted; the saints/Yashar'el a people NEAR (Rev5:13, 1Sam2:1,10, Luke1:69, Ps132:17, Deut4:7, Eph2:13)
--
-- Psalm 148 coverage checklist:
--   v.1     NT: none warranted   Extras: none warranted   Tanakh: folded into T1 (the summons from the heavens) -- anchor only
--   v.2     NT: none warranted   Extras: 1 Enoch praising-luminaries weighed -> no clean witness in this parse, held   Tanakh: Ps103:20, Ps103:21, Job38:7  -> T1
--   v.3     NT: none warranted   Extras: none warranted   Tanakh: Gen1:14 (signs/seasons), Gen1:16 (two great lights)  -> T1
--   v.4     NT: none warranted   Extras: none warranted   Tanakh: Gen1:7 (waters above the firmament)  -> T1
--   v.5     NT: John1:3, Col1:16, Heb11:3 (all made by the Word)   Extras: none warranted   Tanakh: Ps33:6, Ps33:9 (he spake and it was done)  -> T2
--   v.6     NT: none warranted   Extras: none warranted   Tanakh: Jer31:35, Jer31:36 (the ordinances/seed never ceases), Jer33:25 (covenant of day and night)  -> T2
--   v.7     NT: none warranted   Extras: none warranted   Tanakh: folded into T3 (dragons/deeps) -- anchor only
--   v.8     NT: none warranted   Extras: none warranted   Tanakh: Ps147:15, Ps147:18 (his word runneth; the elements obey)  -> T3
--   v.9-10  NT: none warranted   Extras: none warranted   Tanakh: folded into T3 (mountains/trees/beasts) -- carried in prose
--   v.11-12 NT: none warranted   Extras: none warranted   Tanakh: folded into T4 (kings/peoples/young/old summoned) -- carried in prose
--   v.13    NT: Rev5:13 (every creature ascribing glory)   Extras: none warranted   Tanakh: carried in T4 prose  -> T4
--   v.14    NT: Luke1:69 (horn of salvation), Eph2:13 (made nigh)   Extras: none warranted   Tanakh: 1Sam2:1, 1Sam2:10 (horn exalted), Ps132:17 (horn of David), Deut4:7 (a people near)  -> T4
--
-- Framework-load-bearing notes:
--   * vv.3-4 the sun, moon, and stars are the appointed-times luminaries set "for signs, and for seasons" (Gen1:14)
--     -- the moedim root praising their Maker; the host of heaven keeps his calendar, not abolished.
--   * vv.5-6 "he commanded, and they were created" = creation by the spoken Word, the Formed Son who is the agent of
--     all making (John1:3 / Col1:16 / Heb11:3 / Ps33:6,9) and who has a Father -- not a co-equal trinitarian person.
--     The "decree which shall not pass" (v.6) is the same fixed ordinance Jeremiah binds to Yashar'el's permanence:
--     while sun/moon keep their courses the seed of Yashar'el shall never cease to be a nation (Jer31:35-36; 33:25)
--     -- a two-house guard (Rom11:1-2), the covenant people no more cast off than the stars are unmade.
--   * v.14 "the horn of his people... the children of Yashar'el (Israel), a people near unto him" -- the horn lifted
--     is the horn of salvation in David's house (1Sam2:1,10; Ps132:17; Luke1:69); the nearness is the covenant
--     nearness of the Torah-people (Deut4:7) made nigh by the blood (Eph2:13). The saints/Yashar'el restored and
--     brought near, NOT replaced.

CREATE TEMP VIEW _s302_ps148_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- T1 praise from the heights ------------------------------------------------------------
    ('canon','psalms',148,2,'canon','psalms',103,20,'free',
      E'*Bless Yahuah (LORD), ye his angels, that excel in strength, that do his commandments, hearkening unto the voice of his word.* (Psalm 103:20) — when Psalm 148 cries *Praise ye him, all his angels* (Psalm 148:2), it summons the very host that *do his commandments*: the angelic praise is obedience, the strong ones hearkening to the voice of his word.'),
    ('canon','psalms',148,2,'canon','psalms',103,21,'free',
      E'*Bless ye Yahuah (LORD), all ye his hosts; ye ministers of his, that do his pleasure.* (Psalm 103:21) — *praise ye him, all his hosts* (Psalm 148:2). The armies of heaven, the ministering spirits that do his pleasure, are called to the same praise; the whole celestial court answers the summons.'),
    ('canon','psalms',148,2,'canon','job',38,7,'free',
      E'*When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* (Job 38:7) — the praise Psalm 148 commands of *all his angels* and *all his hosts* (Psalm 148:2) was sounding at the foundation of the world: the morning stars and the sons of Elohim sang as the earth was laid. The heights have praised him from the first.'),
    ('canon','psalms',148,3,'canon','genesis',1,14,'free',
      E'*And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) — *Praise ye him, sun and moon: praise him, all ye stars of light* (Psalm 148:3). The luminaries summoned to praise are the very lights set *for signs, and for seasons* — the appointed-times (moedim) keeping his calendar; the host of heaven praises its Maker by keeping its courses.'),
    ('canon','psalms',148,3,'canon','genesis',1,16,'free',
      E'*And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* (Genesis 1:16) — the *sun and moon* and *all ye stars of light* (Psalm 148:3) called to praise are the two great lights and the stars he made; the creatures praise the One who formed them and gave them their rule.'),
    ('canon','psalms',148,4,'canon','genesis',1,7,'free',
      E'*And Elohim (God) made the firmament, and divided the waters which were under the firmament from the waters which were above the firmament: and it was so.* (Genesis 1:7) — *Praise him, ye heavens of heavens, and ye waters that be above the heavens* (Psalm 148:4). The waters above the firmament, parted at creation, are summoned with the highest heavens to praise the One who divided them.'),

    -- T2 he commanded and they were created --------------------------------------------------
    ('canon','psalms',148,5,'canon','psalms',33,6,'free',
      E'*By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* (Psalm 33:6) — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created* (Psalm 148:5). The host of heaven praise the Name because that Name is their Maker: the heavens and all their host were made *by the word of Yahuah* — the spoken Word that called them into being.'),
    ('canon','psalms',148,5,'canon','psalms',33,9,'free',
      E'*For he spake, and it was done; he commanded, and it stood fast.* (Psalm 33:9) — this is the very grammar of Psalm 148:5: *he commanded, and they were created*. Creation answers a word; the command and the coming-to-be are one act. The creatures owe their existence to a spoken decree, and so they owe him praise.'),
    ('canon','psalms',148,5,'canon','john',1,3,'free',
      E'*All things were made by him; and without him was not any thing made that was made.* (John 1:3) — the One who *commanded, and they were created* (Psalm 148:5) is the Word by whom all things were made. The Formed Son, the expressed Word drawn from the Formless Father, is the agent of the creation Psalm 148 calls to praise — Yahuah, and having a Father.'),
    ('canon','psalms',148,5,'canon','colossians',1,16,'free',
      E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him* (Colossians 1:16) — the heavens and their hosts, the sun and stars and the things of earth that Psalm 148 summons, are the *all things* created *by him, and for him*. They were made for his praise; *he commanded, and they were created* (Psalm 148:5).'),
    ('canon','psalms',148,5,'canon','hebrews',11,3,'free',
      E'*Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* (Hebrews 11:3) — the worlds *framed by the word* are the same creation Psalm 148:5 grounds in his command: *he commanded, and they were created*. The visible host of heaven and earth came from the unseen Word, and they praise the Name that spoke them.'),
    ('canon','psalms',148,6,'canon','jeremiah',31,35,'free',
      E'*Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name* (Jeremiah 31:35) — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass* (Psalm 148:6). The fixed ordinances of sun, moon, and stars are the decree that shall not pass; the luminaries keep their unbroken courses by his appointment.'),
    ('canon','psalms',148,6,'canon','jeremiah',31,36,'free',
      E'*If those ordinances depart from before me, saith Yahuah (LORD), then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever.* (Jeremiah 31:36) — the *decree which shall not pass* (Psalm 148:6) is bound to the permanence of the covenant people: while the sun and stars keep their courses, the seed of Yashar''el shall never cease to be a nation. The fixed heavens are the guarantee that the two-house people are no more cast off than the stars are unmade.'),
    ('canon','psalms',148,6,'canon','jeremiah',33,25,'free',
      E'*Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25) — the *decree which shall not pass* (Psalm 148:6) is his covenant with day and night, the appointed ordinances of heaven and earth. The creation he established *for ever and ever* is the standing pledge of his covenant faithfulness.'),

    -- T3 praise from the earth ---------------------------------------------------------------
    ('canon','psalms',148,8,'canon','psalms',147,15,'free',
      E'*He sendeth forth his commandment upon earth: his word runneth very swiftly.* (Psalm 147:15) — *Fire, and hail; snow, and vapour; stormy wind fulfilling his word* (Psalm 148:8). The elements praise him by obeying: the stormy wind *fulfilling his word* is the commandment that *runneth very swiftly* upon the earth. Their praise is their obedience to his swift-running word.'),
    ('canon','psalms',148,8,'canon','psalms',147,18,'free',
      E'*He sendeth out his word, and melteth them: he causeth his wind to blow, and the waters flow.* (Psalm 147:18) — the *snow* and *stormy wind* of Psalm 148:8 obey the same word: he sends it out and the snow melts, he causes the wind to blow and the waters flow. The weather is his servant, *fulfilling his word*, and so it praises him from the earth.'),

    -- T4 his name alone excellent + the horn of his people -----------------------------------
    ('canon','psalms',148,13,'canon','revelation',5,13,'free',
      E'*And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* (Revelation 5:13) — *Let them praise the name of Yahuah (LORD): for his name alone is excellent; his glory is above the earth and heaven* (Psalm 148:13). What Psalm 148 commands of all creation, the Revelation hears fulfilled: every creature in heaven and earth ascribing blessing, honour, and glory — the Name alone exalted above earth and heaven.'),
    ('canon','psalms',148,14,'canon','1-samuel',2,1,'free',
      E'*And Hannah prayed, and said, My heart rejoiceth in Yahuah (LORD), mine horn is exalted in Yahuah (LORD): my mouth is enlarged over mine enemies; because I rejoice in thy salvation.* (1 Samuel 2:1) — *He also exalteth the horn of his people* (Psalm 148:14). Hannah''s song is the pattern: the horn exalted in Yahuah, the lifting up of the lowly into his salvation — the same raised horn the whole creation is called to praise.'),
    ('canon','psalms',148,14,'canon','1-samuel',2,10,'free',
      E'*…Yahuah (LORD) shall judge the ends of the earth; and he shall give strength unto his king, and exalt the horn of his anointed.* (1 Samuel 2:10) — the *horn of his people* (Psalm 148:14) is exalted in the horn of his anointed: Yahuah gives strength to his king and lifts the horn of his Mashiach. The praise of the saints rises with the exalting of the anointed King.'),
    ('canon','psalms',148,14,'canon','psalms',132,17,'free',
      E'*There will I make the horn of David to bud: I have ordained a lamp for mine anointed.* (Psalm 132:17) — the *horn of his people* (Psalm 148:14) buds in David''s house: the horn of David made to bud, the lamp ordained for the anointed. The lifted horn of Psalm 148 is the Davidic horn of salvation, the King in whom his people are exalted.'),
    ('canon','psalms',148,14,'canon','luke',1,69,'free',
      E'*And hath raised up an horn of salvation for us in the house of his servant David* (Luke 1:69) — the *horn of his people* (Psalm 148:14) is raised up as the *horn of salvation… in the house of his servant David*. Zechariah names what the psalm foresaw: the exalted horn of his people is the Davidic Saviour in whom the saints are lifted and made near.'),
    ('canon','psalms',148,14,'canon','deuteronomy',4,7,'free',
      E'*For what nation is there so great, who hath Elohim (God) so nigh unto them, as Yahuah Eloheinu (the LORD our God) is in all things that we call upon him for?* (Deuteronomy 4:7) — *the children of Yashar''el (Israel), a people near unto him* (Psalm 148:14). The nearness the psalm names is the covenant nearness of the Torah-people: no nation has Elohim so nigh. The praise of the saints rises from a people he has drawn near to himself.'),
    ('canon','psalms',148,14,'canon','ephesians',2,13,'free',
      E'*But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ).* (Ephesians 2:13) — *a people near unto him* (Psalm 148:14). The far-off of the scattered house are *made nigh by the blood* — the covenant nearness restored, the two houses brought near, not a new people replacing Yashar''el but the children of Yashar''el drawn back to the One who is near to them.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps148_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps148_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-148-praise-him-from-the-heights-all-his-angels-and-the-luminaries',
       E'Praise him from the heights — all his angels and the luminaries',
       E'*Praise ye Yahuah (LORD) from the heavens: praise him in the heights. Praise ye him, all his angels: praise ye him, all his hosts. Praise ye him, sun and moon: praise him, all ye stars of light. Praise him, ye heavens of heavens, and ye waters that be above the heavens.* (Psalm 148:1-4) — the Hallel begins at the top of creation. The angels summoned are the host that *do his commandments, hearkening unto the voice of his word* (Psalm 103:20) and his *ministers… that do his pleasure* (Psalm 103:21); their praise is obedience. They were singing at the foundation, *when the morning stars sang together, and all the sons of Elohim (God) shouted for joy* (Job 38:7). And the sun, moon, and stars called to praise are the very lights set *for signs, and for seasons* (Genesis 1:14), the *two great lights… he made the stars also* (Genesis 1:16) — the appointed-times luminaries keeping his calendar, praising their Maker by keeping their courses. Even the *waters that be above the heavens* are the waters he divided at creation (Genesis 1:7). The heights have praised him from the first.',
       sv.verse_id, ev.verse_id, 'free', 25675
  FROM _s302_ps148_lookup sv, _s302_ps148_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=148 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass',
       E'He commanded, and they were created — the decree that shall not pass',
       E'*Let them praise the name of Yahuah (LORD): for he commanded, and they were created. He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalm 148:5-6) — the creatures praise the Name because that Name made them, and made them by a word. *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6); *he spake, and it was done; he commanded, and it stood fast* (Psalm 33:9). That spoken Word is the Formed Son, the One by whom *all things were made* (John 1:3), by whom and for whom *all things created* in heaven and earth came to be (Colossians 1:16), the Word by whom *the worlds were framed* (Hebrews 11:3) — Yahuah, and having a Father. And the *decree which shall not pass* is the fixed ordinance of sun and moon and stars (Jeremiah 31:35), bound to the very permanence of the covenant people: while those ordinances keep their courses *the seed of Yashar''el (Israel) also shall* never *cease from being a nation* (Jeremiah 31:36), for his covenant is *with day and night… the ordinances of heaven and earth* (Jeremiah 33:25). The fixed heavens are the pledge that the two-house people are no more cast off than the stars are unmade.',
       sv.verse_id, ev.verse_id, 'free', 25678
  FROM _s302_ps148_lookup sv, _s302_ps148_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=148 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-148-praise-him-from-the-earth-the-elements-fulfilling-his-word',
       E'Praise him from the earth — the elements fulfilling his word',
       E'*Praise Yahuah (LORD) from the earth, ye dragons, and all deeps: Fire, and hail; snow, and vapour; stormy wind fulfilling his word* (Psalm 148:7-8) — the summons descends from the heights to the deeps, and the weather itself is named a worshipper. The elements praise him by obeying: the *stormy wind fulfilling his word* is the same commandment that *runneth very swiftly* upon the earth (Psalm 147:15). *He sendeth out his word, and melteth them: he causeth his wind to blow, and the waters flow* (Psalm 147:18) — the snow and the wind of Psalm 148 are his servants, doing his bidding the moment he speaks. Their obedience is their praise; the mountains and trees, the beasts and creeping things and flying fowl, all join the chorus of a creation that answers its Maker''s word.',
       sv.verse_id, ev.verse_id, 'free', 25681
  FROM _s302_ps148_lookup sv, _s302_ps148_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=148 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-148-his-name-alone-excellent-and-the-horn-of-his-people-exalted',
       E'His name alone excellent — and the horn of his people exalted',
       E'*Let them praise the name of Yahuah (LORD): for his name alone is excellent; his glory is above the earth and heaven. He also exalteth the horn of his people, the praise of all his saints; even of the children of Yashar''el (Israel), a people near unto him. Praise ye Yahuah (LORD).* (Psalm 148:13-14) — the cosmic Hallel closes with the Name alone exalted and the people drawn near. What the psalm commands of all creation, the Revelation hears answered: *every creature which is in heaven, and on the earth… Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb* (Revelation 5:13). And the *horn of his people* lifted is the horn of salvation: Hannah sang *mine horn is exalted in Yahuah (LORD)* (1 Samuel 2:1) and that Yahuah would *exalt the horn of his anointed* (1 Samuel 2:10); *there will I make the horn of David to bud* (Psalm 132:17); raised up at last as *an horn of salvation… in the house of his servant David* (Luke 1:69). The nearness is covenant nearness — no nation has Elohim *so nigh* (Deuteronomy 4:7) — and the far-off of the scattered house are *made nigh by the blood of Messiah (Christ)* (Ephesians 2:13): the children of Yashar''el restored and brought near, not replaced, a people near unto him.',
       sv.verse_id, ev.verse_id, 'free', 25684
  FROM _s302_ps148_lookup sv, _s302_ps148_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=148 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ===== thread members =====
-- THREAD 1 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*…ye his angels, that excel in strength, that do his commandments* (Psalm 103:20) — the angelic praise is obedience to the voice of his word.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=2
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-praise-him-from-the-heights-all-his-angels-and-the-luminaries'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*…all ye his hosts; ye ministers of his, that do his pleasure* (Psalm 103:21) — the armies of heaven answer the same summons.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=2
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-praise-him-from-the-heights-all-his-angels-and-the-luminaries'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*When the morning stars sang together…* (Job 38:7) — the heights praised him at the foundation of the world.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=2
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-praise-him-from-the-heights-all-his-angels-and-the-luminaries'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*…let them be for signs, and for seasons* (Genesis 1:14) — the luminaries called to praise are the appointed-times lights.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=3
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-praise-him-from-the-heights-all-his-angels-and-the-luminaries'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*…two great lights… he made the stars also* (Genesis 1:16) — the sun, moon, and stars praise the One who formed them.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=3
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-praise-him-from-the-heights-all-his-angels-and-the-luminaries'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*…the waters which were above the firmament* (Genesis 1:7) — the waters above, parted at creation, summoned to praise.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=4
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-praise-him-from-the-heights-all-his-angels-and-the-luminaries'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By the word of Yahuah (LORD) were the heavens made* (Psalm 33:6) — the host praise the Name that made them by a word.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=5
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For he spake, and it was done; he commanded, and it stood fast* (Psalm 33:9) — the very grammar of "he commanded, and they were created."'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=5
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*All things were made by him* (John 1:3) — the Word, the Formed Son, is the agent of the creation called to praise.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=5
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*…all things were created by him, and for him* (Colossians 1:16) — the all things made for his praise.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=5
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*…the worlds were framed by the word of Elohim (God)* (Hebrews 11:3) — the visible host came from the unseen Word.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=5
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*…the ordinances of the moon and of the stars* (Jeremiah 31:35) — the fixed courses are the decree that shall not pass.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=6
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*…then the seed of Yashar''el (Israel) also shall cease from being a nation* (Jeremiah 31:36) — the fixed heavens guarantee the covenant people are not cast off.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=6
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*If my covenant be not with day and night…* (Jeremiah 33:25) — the decree is his covenant with the ordinances of heaven and earth.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=6
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-he-commanded-and-they-were-created-the-decree-that-shall-not-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He sendeth forth his commandment upon earth: his word runneth very swiftly* (Psalm 147:15) — the stormy wind "fulfilling his word" is the swift-running commandment.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=8
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-praise-him-from-the-earth-the-elements-fulfilling-his-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He sendeth out his word, and melteth them: he causeth his wind to blow* (Psalm 147:18) — the snow and wind obey the moment he speaks.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=8
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-praise-him-from-the-earth-the-elements-fulfilling-his-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And every creature which is in heaven, and on the earth… Blessing, and honour, and glory* (Revelation 5:13) — the cosmic summons answered, the Name alone exalted.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=13
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-his-name-alone-excellent-and-the-horn-of-his-people-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*…mine horn is exalted in Yahuah (LORD)* (1 Samuel 2:1) — Hannah''s song, the pattern of the exalted horn.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=14
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-his-name-alone-excellent-and-the-horn-of-his-people-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*…and exalt the horn of his anointed* (1 Samuel 2:10) — the people''s horn is lifted in the horn of his anointed King.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=14
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-his-name-alone-excellent-and-the-horn-of-his-people-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*There will I make the horn of David to bud* (Psalm 132:17) — the lifted horn is the Davidic horn of salvation.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=14
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-his-name-alone-excellent-and-the-horn-of-his-people-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*…an horn of salvation for us in the house of his servant David* (Luke 1:69) — the horn foreseen, raised up at last.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=14
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=69
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-his-name-alone-excellent-and-the-horn-of-his-people-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*…who hath Elohim (God) so nigh unto them* (Deuteronomy 4:7) — the covenant nearness of the Torah-people.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=14
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-his-name-alone-excellent-and-the-horn-of-his-people-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*…ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) — the scattered house brought near, restored not replaced.'
  FROM cross_reference_threads t
  JOIN _s302_ps148_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=148 AND sv.verse_number=14
  JOIN _s302_ps148_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-148-his-name-alone-excellent-and-the-horn-of-his-people-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
