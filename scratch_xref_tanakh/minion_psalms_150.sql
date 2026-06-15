-- ----- fragment: minion_psalms_150.sql (Psalm 150) -----
-- Chapter: Psalm 150 — the FINAL psalm, the capstone doxology that seals the whole Psalter.
--   "Let every thing that hath breath praise Yah. Praise ye Yah." (★★★ the telos of the 150)
-- Tag: ps150   Session prefix: s302   Sort band base: 25725   Temp view: _s302_ps150_lookup
-- Output: minion_psalms_150.sql
-- Slug prefix SINGULAR: psalm-150-...  (verse-lookup book_slug stays PLURAL 'psalms')
--
-- ============================ COVERAGE CHECKLIST (all 3 libraries per verse-block) ============================
-- Psalm 150 coverage:
--   v.1  WHERE — praise El in his sanctuary + the firmament of his power
--        NT:     Hebrews 8:5 (earthly tabernacle the shadow of heavenly), Hebrews 9:24 (the heavenly holy place) — bound
--        Extras: none warranted here (the Enoch heavenly-sanctuary praise carried in v.6 capstone thread)
--        Tanakh: Psalm 134:1-2 (bless Yahuah in the sanctuary, lift hands), Psalm 19:1 (firmament sheweth his handywork),
--                Genesis 1:6-7 (the firmament made) — bound
--   v.2  WHY — his mighty acts + his excellent (unsearchable) greatness
--        NT:     none warranted (the doxological "great is Yahuah" sweeps forward in the v.6 thread)
--        Extras: none warranted
--        Tanakh: Psalm 145:3-6 (great is Yahuah... his greatness is unsearchable... his mighty acts — keystone twin),
--                Deuteronomy 3:24 (thy greatness, thy mighty hand) — bound
--   vv.3-5  HOW — the full Levitical temple orchestra: trumpet, psaltery, harp, timbrel, dance, strings, organs, cymbals
--        NT:     Revelation 5:8 (elders with harps before the Lamb), Revelation 15:2-3 (harps of Elohim, the song) — bound
--        Extras: none warranted (heavenly-praise extras carried in v.6 capstone)
--        Tanakh: 1 Chronicles 16:4-6 (David appoints Levites: psalteries, harps, cymbals, trumpets),
--                1 Chronicles 25:1 (sons of Asaph/Heman/Jeduthun prophesy with harps, psalteries, cymbals),
--                2 Chronicles 5:13 (the trumpeters and singers as one — the glory-cloud fills the house),
--                Leviticus 23:24 (memorial of blowing of trumpets — the appointed-times call),
--                Numbers 10:10 (blow the trumpets over your offerings, in your solemn days — a memorial) — bound
--   v.6  ★★★ THE CONSUMMATION — let every thing that hath breath (kol haneshamah) praise Yahuah
--        NT:     Revelation 5:13 (every creature in heaven/earth/sea praising), Philippians 2:10 (every knee bow),
--                Acts 17:25 (he giveth to all life and breath) — bound
--        Extras: 1 Enoch 61:11 (they shall raise ONE voice and bless... all say with one voice),
--                1 Enoch 39:12 (the four presences uttering praises before Yahuah of glory),
--                Jubilees 2:21 (the peculiar people to bless Him who has created all things) — bound
--        Tanakh: Genesis 2:7 (breathed into his nostrils the breath of life — the breath returns as praise),
--                Isaiah 42:5 (he that giveth breath unto the people upon it), Isaiah 45:23 (every knee shall bow,
--                every tongue shall swear), Psalm 145:21 (let all flesh bless his holy name for ever) — bound
--
-- ============================ THREADS (4) ============================
--   1. psalm-150-praise-el-in-his-sanctuary-and-the-firmament-of-his-power
--        [WHERE] Tanakh(Ps134, Ps19, Gen1) + NT(Heb8:5, Heb9:24) — free
--   2. psalm-150-his-mighty-acts-and-his-excellent-greatness
--        [WHY] Tanakh(Ps145:3-6, Deut3:24) — free
--   3. psalm-150-the-full-levitical-orchestra-of-davids-temple-worship
--        [HOW] Tanakh(1Chr16, 1Chr25, 2Chr5, Lev23, Num10) + NT(Rev5:8, Rev15:2-3) — free
--   4. psalm-150-let-every-thing-that-hath-breath-praise-yah  ★★★ CAPSTONE
--        [CONSUMMATION] Tanakh(Gen2:7, Isa42:5, Isa45:23, Ps145:21) + NT(Rev5:13, Phil2:10, Acts17:25)
--        + Extras(1En61:11, 1En39:12, Jub2:21) — extras
--
-- ============================ FRAMEWORK NOTES ============================
--  • Psalm 150 is the doxology that seals the five books of the Psalter; the framing follows WHERE/WHY/HOW/WHO.
--  • vv.3-5 are the Torah-shaped, David-appointed temple liturgy — the appointed-times shofar (Lev23:24/Num10:10),
--    NOT abolished worship. It crescendos FORWARD to the harps of heaven (Rev5:8 / 15:2-3), the same liturgy
--    consummated, not replaced.
--  • Hebrews 8:5 / 9:24 frame the sanctuary of v.1 as the earthly pattern of the heavenly holy place — the praise
--    below joined to the praise above; Formed-Son mediation (Heb9:24, "to appear in the presence of Elohim for us")
--    without trinitarian grammar.
--  • v.6 kol haneshamah = the breath given at creation (Gen2:7) returning as praise — every breathing creature, the
--    gathered two-house people and all creation in one final Hallelujah; the extras (1En61:11 "with one voice",
--    Jub2:21 the peculiar people blessing the Creator) and the NT every-knee/every-creature texts complete the telos.

CREATE TEMP VIEW _s302_ps150_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- ---- Thread 1: WHERE — sanctuary + firmament (v.1) ----
    ('canon','psalms',150,1, 'canon','psalms',134,1, 'free',
     E'*Behold, bless ye Yahuah (LORD), all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1). The capstone''s WHERE — *Praise Elohim (God) in his sanctuary* — is the night-watch psalm answered: the servants who stand in the house of Yahuah lift the praise the doxology now commands.'),
    ('canon','psalms',150,1, 'canon','psalms',134,2, 'free',
     E'*Lift up your hands in the sanctuary, and bless Yahuah (LORD)* (Psalm 134:2). The very posture of *praise Elohim (God) in his sanctuary* — hands lifted in the holy place; the Torah-shaped temple worship the final psalm crowns.'),
    ('canon','psalms',150,1, 'canon','psalms',19,1, 'free',
     E'*The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1). The second WHERE of the capstone — *praise him in the firmament of his power* — is the firmament already preaching; the dome above and the sanctuary below are one house of praise.'),
    ('canon','psalms',150,1, 'canon','genesis',1,6, 'free',
     E'*And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters* (Genesis 1:6). The *firmament of his power* of the capstone is the firmament the Formed-Son spoke into being on the second day — the same word now summoned to praise.'),
    ('canon','psalms',150,1, 'canon','genesis',1,7, 'free',
     E'*And Elohim (God) made the firmament, and divided the waters which were under the firmament from the waters which were above the firmament: and it was so* (Genesis 1:7). The making of the *firmament of his power* — creation''s architecture, the dome of heaven, now called to declare its Maker''s praise.'),
    ('canon','psalms',150,1, 'canon','hebrews',8,5, 'free',
     E'*Who serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The *sanctuary* of the capstone is the earthly pattern of the heavenly holy place — the praise below shaped to the worship above; the Torah tabernacle a shadow, never a defunct thing.'),
    ('canon','psalms',150,1, 'canon','hebrews',9,24, 'free',
     E'*For Messiah (Christ) is not entered into the holy places made with hands, which are the figures of the true; but into heaven itself, now to appear in the presence of Elohim (God) for us* (Hebrews 9:24). The *sanctuary* where El is praised joins the heavenly holy place the Formed-Son has entered — the praise of v.1 carried into the presence of Elohim.'),

    -- ---- Thread 2: WHY — mighty acts + excellent greatness (v.2) ----
    ('canon','psalms',150,2, 'canon','psalms',145,3, 'free',
     E'*Great is Yahuah (LORD), and greatly to be praised; and his greatness is unsearchable* (Psalm 145:3). The capstone''s WHY — *praise him according to his excellent greatness* — is the keystone twin: the greatness so excellent it cannot be searched out is the very ground of the praise.'),
    ('canon','psalms',150,2, 'canon','psalms',145,4, 'free',
     E'*One generation shall praise thy works to another, and shall declare thy mighty acts* (Psalm 145:4). *Praise him for his mighty acts* — the doxology gathers the generations'' declaring into one final shout.'),
    ('canon','psalms',150,2, 'canon','psalms',145,5, 'free',
     E'*I will speak of the glorious honour of thy majesty, and of thy wondrous works* (Psalm 145:5). The *excellent greatness* of the capstone is the majesty and the wondrous works the psalmist resolved to rehearse — now made the whole Psalter''s closing theme.'),
    ('canon','psalms',150,2, 'canon','psalms',145,6, 'free',
     E'*And men shall speak of the might of thy terrible acts: and I will declare thy greatness* (Psalm 145:6). *Praise him for his mighty acts... according to his excellent greatness* — the twin verbs of the capstone, the might and the greatness, drawn straight from the keystone hymn.'),
    ('canon','psalms',150,2, 'canon','deuteronomy',3,24, 'free',
     E'*O Yahuah (Lord) GOD, thou hast begun to shew thy servant thy greatness, and thy mighty hand: for what Elohim (God) is there in heaven or in earth, that can do according to thy works, and according to thy might?* (Deuteronomy 3:24). Moses'' word frames the capstone''s WHY at the Torah''s root — the *greatness* and the *mighty* works that no other in heaven or earth can match.'),

    -- ---- Thread 3: HOW — the full Levitical orchestra (vv.3-5) ----
    ('canon','psalms',150,3, 'canon','1-chronicles',16,4, 'free',
     E'*And he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4). The orchestra of vv.3-5 is no spontaneous flourish but David''s appointed temple order — the Levites set in place to praise.'),
    ('canon','psalms',150,3, 'canon','1-chronicles',16,5, 'free',
     E'*Asaph the chief... and Jeiel with psalteries and with harps; but Asaph made a sound with cymbals* (1 Chronicles 16:5). *Praise him with the psaltery and harp... upon the loud cymbals* — the very instruments of the capstone, named in David''s appointment.'),
    ('canon','psalms',150,3, 'canon','1-chronicles',16,6, 'free',
     E'*Benaiah also and Jahaziel the priests with trumpets continually before the ark of the covenant of Elohim (God)* (1 Chronicles 16:6). *Praise him with the sound of the trumpet* — the priests'' continual trumpet before the ark, the appointed liturgy the capstone crowns.'),
    ('canon','psalms',150,3, 'canon','1-chronicles',25,1, 'free',
     E'*Moreover David and the captains of the host separated to the service of the sons of Asaph, and of Heman, and of Jeduthun, who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1). The temple-music of vv.3-5 is a prophetic ministry — *prophesy with harps, with psalteries, and with cymbals* — the worship the Torah-ordained Levites carried.'),
    ('canon','psalms',150,5, 'canon','2-chronicles',5,13, 'free',
     E'*It came even to pass, as the trumpeters and singers were as one, to make one sound to be heard in praising and thanking Yahuah (LORD)... that then the house was filled with a cloud, even the house of Yahuah (LORD)* (2 Chronicles 5:13). The crescendo of *loud cymbals... high sounding cymbals* finds its end here: when the temple orchestra became one sound, the glory-cloud filled the house — praise meeting the Presence.'),
    ('canon','psalms',150,3, 'canon','leviticus',23,24, 'free',
     E'*Speak unto the children of Yashar''el (Israel), saying, In the seventh month, in the first day of the month, shall ye have a sabbath, a memorial of blowing of trumpets, an holy convocation* (Leviticus 23:24). *Praise him with the sound of the trumpet* — the shofar of the capstone is the appointed-times call of the Torah, the memorial of blowing the feast-calendar commands.'),
    ('canon','psalms',150,3, 'canon','numbers',10,10, 'free',
     E'*Also in the day of your gladness, and in your solemn days, and in the beginnings of your months, ye shall blow with the trumpets over your burnt offerings... that they may be to you for a memorial before your Elohim (God): I am Yahuah Elohaychem (the LORD your God)* (Numbers 10:10). The trumpet of v.3 is the Torah''s memorial blast over the appointed offerings — worship Yahuah himself ordained, never abolished.'),
    ('canon','psalms',150,3, 'canon','revelation',5,8, 'free',
     E'*And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints* (Revelation 5:8). The harps of v.3 crescendo FORWARD to the harps of heaven before the Lamb — the same temple liturgy consummated, not replaced.'),
    ('canon','psalms',150,5, 'canon','revelation',15,2, 'free',
     E'*And I saw as it were a sea of glass mingled with fire: and them that had gotten the victory over the beast... stand on the sea of glass, having the harps of Elohim (God)* (Revelation 15:2). The instruments of vv.3-5 reach their telos in the redeemed standing with *the harps of Elohim (God)* — the orchestra of David carried into the new song of the overcomers.'),
    ('canon','psalms',150,5, 'canon','revelation',15,3, 'free',
     E'*And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways, thou King of saints* (Revelation 15:3). The praise of *his mighty acts* set to the harps ends in the song of Moses AND the Lamb — the Torah''s worship and its fulfillment sung as one.'),

    -- ---- Thread 4: ★★★ CONSUMMATION — let every thing that hath breath praise Yah (v.6) ----
    ('canon','psalms',150,6, 'canon','genesis',2,7, 'free',
     E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). *Let every thing that hath breath praise Yahuah* — the breath the Formed-Son breathed in at creation returns at the Psalter''s end as praise; the gift of breath answered by the use of breath.'),
    ('canon','psalms',150,6, 'canon','isaiah',42,5, 'free',
     E'*Thus saith Elohim (God) Yahuah (LORD)... he that giveth breath unto the people upon it, and spirit to them that walk therein* (Isaiah 42:5). He who *giveth breath unto the people* is the one *every thing that hath breath* is now summoned to praise — the Giver claiming the gift back as worship.'),
    ('canon','psalms',150,6, 'canon','psalms',145,21, 'free',
     E'*My mouth shall speak the praise of Yahuah (LORD): and let all flesh bless his holy name for ever and ever* (Psalm 145:21). The keystone''s closing vow — *let all flesh bless his holy name* — is widened in the capstone to *every thing that hath breath*; the whole Psalter ends where the great Hallel began.'),
    ('canon','psalms',150,6, 'canon','isaiah',45,23, 'free',
     E'*I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear* (Isaiah 45:23). *Every thing that hath breath* gathered to praise is the sworn oath of Yahuah — every knee, every tongue, no breathing creature withheld.'),
    ('canon','psalms',150,6, 'canon','acts',17,25, 'free',
     E'*Neither is worshipped with men''s hands, as though he needed any thing, seeing he giveth to all life, and breath, and all things* (Acts 17:25). He *giveth to all life, and breath* — the very breath the capstone calls back into praise; the Creator who needs nothing, sought by everything that breathes.'),
    ('canon','psalms',150,6, 'canon','revelation',5,13, 'free',
     E'*And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever* (Revelation 5:13). The capstone''s *every thing that hath breath* reaches its consummation here — every creature in every realm joined in one blessing; the Psalter''s final Hallelujah become the song of all creation.'),
    ('canon','psalms',150,6, 'canon','philippians',2,10, 'free',
     E'*That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). *Every thing that hath breath* — every knee in heaven, earth, and under the earth — the universal homage the kenosis-hymn foretells, the Formed-Son exalted by the Father.'),
    ('canon','psalms',150,6, 'enoch','1-enoch',61,11, 'extras',
     E'*And they shall raise one voice and bless and glorify and extol and praise the name of Yahuah (God) of Spirits... and shall all say with one voice: "Blessed is He, and may the name of Yahuah (God) of Spirits be blessed for ever and ever"* (1 Enoch 61:11). The capstone''s summons of *every thing that hath breath* is the host of heaven raising ONE voice — the same final, unanimous Hallelujah the Psalter ends on.'),
    ('canon','psalms',150,6, 'enoch','1-enoch',39,12, 'extras',
     E'*And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory* (1 Enoch 39:12). The praise the capstone commands below is already sounding above — the four presences before the throne uttering the praise *every thing that hath breath* is now gathered into.'),
    ('canon','psalms',150,6, 'jubilees','jubilees',2,21, 'extras',
     E'*...to bless Him who has created all things as He has blessed and sanctified to Himself a peculiar people above all peoples* (Jubilees 2:21). The two-house people sanctified as a *peculiar people* are summoned to bless the Creator — the covenant breath gathered into the *every thing that hath breath* of the final Hallelujah.')
  ) AS i(src_edition,src_slug,src_ch,src_v, tgt_edition,tgt_slug,tgt_ch,tgt_v, tier,note)
  JOIN _s302_ps150_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps150_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-150-praise-el-in-his-sanctuary-and-the-firmament-of-his-power',
       E'Praise El in His Sanctuary, and the Firmament of His Power (WHERE)',
       E'The final psalm opens with the WHERE of praise: *Praise ye Yahuah (LORD). Praise Elohim (God) in his sanctuary: praise him in the firmament of his power* (Psalm 150:1). Two houses of praise are joined — the sanctuary below and the firmament above. The sanctuary is the night-watch psalm answered, *Behold, bless ye Yahuah (LORD), all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1), *Lift up your hands in the sanctuary, and bless Yahuah (LORD)* (Psalm 134:2). The firmament already preaches: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1) — the very dome the Formed-Son spoke into being, *Let there be a firmament in the midst of the waters* (Genesis 1:6), *And Elohim (God) made the firmament* (Genesis 1:7). And the earthly sanctuary is no defunct thing but the pattern of the heavenly: *Who serve unto the example and shadow of heavenly things... that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5), into which *Messiah (Christ)... is entered... into heaven itself, now to appear in the presence of Elohim (God) for us* (Hebrews 9:24). The praise below is the praise above.',
       sv.verse_id, ev.verse_id, 'free', 25725
  FROM _s302_ps150_lookup sv, _s302_ps150_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=150 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=150 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-150-his-mighty-acts-and-his-excellent-greatness',
       E'His Mighty Acts and His Excellent Greatness (WHY)',
       E'The psalm gives the WHY of praise: *Praise him for his mighty acts: praise him according to his excellent greatness* (Psalm 150:2). This is the keystone hymn distilled — *Great is Yahuah (LORD), and greatly to be praised; and his greatness is unsearchable* (Psalm 145:3); *One generation shall praise thy works to another, and shall declare thy mighty acts* (Psalm 145:4); *I will speak of the glorious honour of thy majesty, and of thy wondrous works* (Psalm 145:5); *And men shall speak of the might of thy terrible acts: and I will declare thy greatness* (Psalm 145:6). The twin verbs of the capstone — the *mighty acts* and the *excellent greatness* — are drawn straight from that great acrostic. And the root runs back to Moses at the Torah: *thou hast begun to shew thy servant thy greatness, and thy mighty hand: for what Elohim (God) is there in heaven or in earth, that can do according to thy works, and according to thy might?* (Deuteronomy 3:24). No other in heaven or earth can match the works the final psalm praises.',
       sv.verse_id, ev.verse_id, 'free', 25733
  FROM _s302_ps150_lookup sv, _s302_ps150_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=150 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=150 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-150-the-full-levitical-orchestra-of-davids-temple-worship',
       E'The Full Levitical Orchestra of David''s Temple Worship (HOW)',
       E'The psalm gives the HOW of praise — the full temple orchestra: *Praise him with the sound of the trumpet: praise him with the psaltery and harp. Praise him with the timbrel and dance: praise him with stringed instruments and organs. Praise him upon the loud cymbals: praise him upon the high sounding cymbals* (Psalm 150:3-5). This is no spontaneous flourish but the worship David appointed at the ark: *And he appointed certain of the Levites to minister before the ark of Yahuah (LORD)... to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4), with *Jeiel with psalteries and with harps; but Asaph made a sound with cymbals* (1 Chronicles 16:5) and *Benaiah also and Jahaziel the priests with trumpets continually before the ark* (1 Chronicles 16:6). It was a prophetic ministry — *who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1) — and when its sound became one, the Presence came: *as the trumpeters and singers were as one, to make one sound... that then the house was filled with a cloud, even the house of Yahuah (LORD)* (2 Chronicles 5:13). The trumpet itself is the Torah''s appointed-times call: *a memorial of blowing of trumpets, an holy convocation* (Leviticus 23:24); *in your solemn days... ye shall blow with the trumpets... that they may be to you for a memorial before your Elohim (God)* (Numbers 10:10). This Torah-shaped liturgy is never abolished — it crescendos FORWARD to the harps of heaven: *the four and twenty elders fell down before the Lamb, having every one of them harps* (Revelation 5:8), the overcomers *having the harps of Elohim (God)* (Revelation 15:2), who *sing the song of Moses the servant of Elohim (God), and the song of the Lamb* (Revelation 15:3). The same worship, consummated.',
       sv.verse_id, ev.verse_id, 'free', 25741
  FROM _s302_ps150_lookup sv, _s302_ps150_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=150 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=150 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-150-let-every-thing-that-hath-breath-praise-yah',
       E'Let Every Thing That Hath Breath Praise Yah — the Consummation of the Psalter',
       E'The whole Psalter ends on a single, total summons: *Let every thing that hath breath praise Yahuah (LORD). Praise ye Yahuah (LORD)* (Psalm 150:6). Every breathing creature — kol haneshamah — is called, and the breath itself is the clue: it was given at creation, *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7), and it is held by the One *that giveth breath unto the people upon it, and spirit to them that walk therein* (Isaiah 42:5), who *giveth to all life, and breath, and all things* (Acts 17:25). The gift returns as praise. This widens the keystone''s closing vow — *let all flesh bless his holy name for ever and ever* (Psalm 145:21) — to the very edge of creation, and it is sworn by Yahuah himself: *unto me every knee shall bow, every tongue shall swear* (Isaiah 45:23), *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). The restored library hears it already sounding above and ahead: *And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory* (1 Enoch 39:12); the host *shall raise one voice and bless and glorify and extol and praise the name of Yahuah (God) of Spirits... and shall all say with one voice: "Blessed is He"* (1 Enoch 61:11); and the *peculiar people above all peoples* are sanctified *to bless Him who has created all things* (Jubilees 2:21). It consummates in John''s vision, where *every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them* cries *Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever* (Revelation 5:13). This is the telos of the whole Psalter: the gathered two-house people and all that breathes, in one final Hallelujah. Praise ye Yah.',
       sv.verse_id, ev.verse_id, 'extras', 25749
  FROM _s302_ps150_lookup sv, _s302_ps150_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=150 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=150 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- Thread 1: WHERE — sanctuary + firmament
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','psalms',134,1, 1, E'Psalm 134:1 — the servants who *by night stand in the house of Yahuah* — the sanctuary praise the doxology commands.'),
    ('canon','psalms',134,2, 2, E'Psalm 134:2 — *Lift up your hands in the sanctuary, and bless Yahuah* — the posture of praise in the holy place.'),
    ('canon','psalms',19,1, 3, E'Psalm 19:1 — *the firmament sheweth his handywork* — the firmament of his power already preaching.'),
    ('canon','genesis',1,6, 4, E'Genesis 1:6 — *Let there be a firmament* — the firmament the Formed-Son spoke into being, day two.'),
    ('canon','genesis',1,7, 5, E'Genesis 1:7 — *Elohim (God) made the firmament* — creation''s dome, now summoned to praise its Maker.'),
    ('canon','hebrews',8,5, 6, E'Hebrews 8:5 — the earthly tabernacle the *shadow of heavenly things*; the sanctuary praise patterned on the heavenly worship.'),
    ('canon','hebrews',9,24, 7, E'Hebrews 9:24 — Messiah entered *heaven itself... in the presence of Elohim* — the sanctuary praise carried above.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v, sort_order, member_note)
  JOIN _s302_ps150_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=150 AND sv.verse_number=1
  JOIN _s302_ps150_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-150-praise-el-in-his-sanctuary-and-the-firmament-of-his-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: WHY — mighty acts + excellent greatness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','psalms',145,3, 1, E'Psalm 145:3 — *his greatness is unsearchable* — the keystone twin of *his excellent greatness*.'),
    ('canon','psalms',145,4, 2, E'Psalm 145:4 — *shall declare thy mighty acts* — the generations'' praise the doxology gathers.'),
    ('canon','psalms',145,5, 3, E'Psalm 145:5 — *thy majesty... thy wondrous works* — the excellent greatness rehearsed.'),
    ('canon','psalms',145,6, 4, E'Psalm 145:6 — *the might of thy terrible acts... thy greatness* — both verbs of the capstone, side by side.'),
    ('canon','deuteronomy',3,24, 5, E'Deuteronomy 3:24 — Moses: *thy greatness, and thy mighty hand* — the WHY at the Torah''s root.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v, sort_order, member_note)
  JOIN _s302_ps150_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=150 AND sv.verse_number=2
  JOIN _s302_ps150_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-150-his-mighty-acts-and-his-excellent-greatness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: HOW — the Levitical orchestra (members across src v.3 and v.5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (3, 'canon','1-chronicles',16,4, 1, E'1 Chronicles 16:4 — David appoints the Levites to praise before the ark — the orchestra ordained.'),
    (3, 'canon','1-chronicles',16,5, 2, E'1 Chronicles 16:5 — *psalteries... harps... cymbals* — the very instruments of v.3-5, named.'),
    (3, 'canon','1-chronicles',16,6, 3, E'1 Chronicles 16:6 — the priests *with trumpets continually before the ark* — *the sound of the trumpet*.'),
    (3, 'canon','1-chronicles',25,1, 4, E'1 Chronicles 25:1 — the temple-music a prophetic ministry: *prophesy with harps, with psalteries, and with cymbals*.'),
    (5, 'canon','2-chronicles',5,13, 5, E'2 Chronicles 5:13 — the orchestra as *one sound* and the glory-cloud fills the house — praise meeting the Presence.'),
    (3, 'canon','leviticus',23,24, 6, E'Leviticus 23:24 — *a memorial of blowing of trumpets* — the shofar as the Torah''s appointed-times call.'),
    (3, 'canon','numbers',10,10, 7, E'Numbers 10:10 — the trumpet *for a memorial before your Elohim* over the offerings — worship Yahuah ordained.'),
    (3, 'canon','revelation',5,8, 8, E'Revelation 5:8 — the elders before the Lamb *having every one of them harps* — the harps crescendo to heaven.'),
    (5, 'canon','revelation',15,2, 9, E'Revelation 15:2 — the overcomers *having the harps of Elohim (God)* — the orchestra in the new song.'),
    (5, 'canon','revelation',15,3, 10, E'Revelation 15:3 — *the song of Moses... and the song of the Lamb* — the Torah''s worship and its fulfillment as one.')
  ) AS m(src_v, tgt_ed,tgt_slug,tgt_ch,tgt_v, sort_order, member_note)
  JOIN _s302_ps150_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=150 AND sv.verse_number=m.src_v
  JOIN _s302_ps150_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-150-the-full-levitical-orchestra-of-davids-temple-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: ★★★ CONSUMMATION — every thing that hath breath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','genesis',2,7, 1, E'Genesis 2:7 — *breathed into his nostrils the breath of life* — the breath given at creation returns as praise.'),
    ('canon','isaiah',42,5, 2, E'Isaiah 42:5 — *he that giveth breath unto the people* — the Giver claiming the gift back as worship.'),
    ('canon','psalms',145,21, 3, E'Psalm 145:21 — *let all flesh bless his holy name* — the keystone vow widened to all that breathes.'),
    ('canon','isaiah',45,23, 4, E'Isaiah 45:23 — *every knee shall bow, every tongue shall swear* — Yahuah''s sworn oath, no creature withheld.'),
    ('canon','acts',17,25, 5, E'Acts 17:25 — *he giveth to all life, and breath* — the breath the capstone calls back into praise.'),
    ('canon','revelation',5,13, 6, E'Revelation 5:13 — *every creature... in heaven... earth... sea* blessing the throne and the Lamb — the consummation.'),
    ('canon','philippians',2,10, 7, E'Philippians 2:10 — *every knee should bow, of things in heaven, and things in earth* — the universal homage.'),
    ('enoch','1-enoch',61,11, 8, E'1 Enoch 61:11 — the host *shall raise one voice... and all say with one voice: "Blessed is He"* — the unanimous final Hallelujah.'),
    ('enoch','1-enoch',39,12, 9, E'1 Enoch 39:12 — the four presences *uttered praises before Yahuah (God) of glory* — the praise already sounding above.'),
    ('jubilees','jubilees',2,21, 10, E'Jubilees 2:21 — the *peculiar people* sanctified *to bless Him who has created all things* — the covenant breath in the Hallelujah.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v, sort_order, member_note)
  JOIN _s302_ps150_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=150 AND sv.verse_number=6
  JOIN _s302_ps150_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-150-let-every-thing-that-hath-breath-praise-yah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
