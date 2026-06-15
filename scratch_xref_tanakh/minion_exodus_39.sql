-- ----- fragment: minion_exodus_39.sql (Exodus 39) -----
-- Exodus 39 — the priestly garments MADE + the "as Yahuah commanded Moses" refrain + Moses blesses the finished work
-- Session prefix s305 | tag ex39 | temp view _s305_ex39_lookup | sort band 29950 step +3
--
-- Exodus 39 coverage:
--   v.1,5     (cloths of service / curious girdle "as Yahuah commanded Moses") — folded into the refrain thread (v.42-43 anchor); NT: none warranted alone; Extras: Ecclesiasticus 45 (garments) used at stones/bells/crown; Tanakh: Exod 28 command-side.
--   v.2-5     (the ephod made) — Tanakh: Exod 28:6-8 command (folded into stones thread context); NT: none warranted alone; Extras: Ecclesiasticus 45:8-10 robe/ephod.
--   v.6-7,14  (★ onyx stones + breastplate, twelve-tribe names, "stones for a memorial") — Tanakh: Exod 28:9-12,21; NT: Rev 21:12-14 (twelve tribes named on the gates); Extras: Ecclesiasticus 45:11 (stones graven like seals, after the number of the tribes). THREAD 1.
--   v.8-21    (breastplate construction) — folded with v.6-7/14 (the borne-on-the-heart two-house thread).
--   v.22-24   (robe / hems / pomegranates) — feeds the bells thread.
--   v.25-26   (bells of pure gold between pomegranates "to minister in") — Extras: Ecclesiasticus 45:9 (golden bells, a sound heard, a memorial); NT: none warranted; Tanakh: Exod 28:33-35. THREAD 2.
--   v.27-29   (coats/mitre/breeches/girdle made) — none warranted beyond refrain (folded).
--   v.30-31   (★ the plate of the holy crown, HOLINESS TO THE Yahuah) — Tanakh: Zech 14:20-21, Lev 19:2; NT: 1 Pet 1:16; Extras: Ecclesiasticus 45:12 (crown engraved "Holiness"). THREAD 3.
--   v.32      (the work of the tabernacle FINISHED, Israel did all that Yahuah commanded) — NT: Rev 21:3 (the tabernacle of Elohim is with men); Extras: Jubilees 1:17 (I shall build My sanctuary and dwell with them). THREAD 4.
--   v.33-41   (the brought-finished furniture inventory) — none warranted (descriptive list; the finished-dwelling weight carried by v.32/v.42-43).
--   v.42-43   (★★★ "According to all that Yahuah commanded Moses... and Moses blessed them") — Tanakh: Exod 25:40, Gen 1:31, Gen 2:1-2, Gen 6:22, Exod 40:16; NT: Heb 8:5, Heb 3:2, John 17:4, John 19:30, Matt 7:24; Extras: none warranted (Ecclesiasticus 45 used at garments). THREAD 5.
--
-- THREADS (slug — target libraries):
--   1. exodus-39-the-twelve-tribe-stones-borne-for-a-memorial-rev-21   [canon Tanakh + NT + apocrypha/ecclesiasticus] tier extras
--   2. exodus-39-the-bells-and-pomegranates-the-sound-of-ministry      [canon Tanakh + apocrypha/ecclesiasticus] tier extras
--   3. exodus-39-holiness-to-yahuah-the-golden-crown                   [canon Tanakh + NT + apocrypha/ecclesiasticus] tier extras
--   4. exodus-39-the-tabernacle-finished-yahuah-dwells-with-his-people [canon NT + jubilees] tier extras
--   5. exodus-39-as-yahuah-commanded-moses-the-finished-obedient-work  [canon Tanakh + NT] tier free
-- ============================================================================

CREATE TEMP VIEW _s305_ex39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ---------- B. cross_references ----------
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the twelve-tribe stones borne for a memorial → Rev 21
    ('canon','exodus',39,6,'canon','exodus',28,11,'free',
     E'*With the work of an engraver in stone, like the engravings of a signet, shalt thou engrave the two stones with the names of the children of Yashar''el (Israel): thou shalt make them to be set in ouches of gold* (Exodus 28:11). What Yahuah commanded on the mount is here MADE: *they wrought onyx stones inclosed in ouches of gold, graven, as signets are graven, with the names of the children of Yashar''el* (Exodus 39:6) — the pattern reproduced exactly.'),
    ('canon','exodus',39,7,'canon','exodus',28,12,'free',
     E'*And thou shalt put the two stones upon the shoulders of the ephod for stones of memorial unto the children of Yashar''el (Israel): and Aaron shall bear their names before Yahuah (LORD) upon his two shoulders for a memorial* (Exodus 28:12). The high priest BEARS the whole twelve-tribe people: *he put them on the shoulders of the ephod, that they should be stones for a memorial to the children of Yashar''el* (Exodus 39:7) — the two-house people carried, never one tribe forgotten.'),
    ('canon','exodus',39,14,'canon','exodus',28,21,'free',
     E'*And the stones shall be with the names of the children of Yashar''el (Israel), twelve, according to their names, like the engravings of a signet; every one with his name shall they be according to the twelve tribes* (Exodus 28:21). Made exactly so: *the stones were according to the names of the children of Yashar''el, twelve, according to their names... every one with his name, according to the twelve tribes* (Exodus 39:14) — all twelve borne on the heart of the priest.'),
    ('canon','exodus',39,14,'canon','revelation',21,12,'free',
     E'*And had a wall great and high, and had twelve gates, and at the gates twelve angels, and names written thereon, which are the names of the twelve tribes of the children of Yashar''el (Israel)* (Revelation 21:12). The twelve names graven on the breastplate — *twelve, according to their names... according to the twelve tribes* (Exodus 39:14) — are the same twelve names written on the gates of the restored city: the whole borne-people brought home.'),
    ('canon','exodus',39,14,'canon','revelation',21,14,'free',
     E'*And the wall of the city had twelve foundations, and in them the names of the twelve apostles of the Lamb* (Revelation 21:14). The twelve tribe-stones in their settings of gold (Exodus 39:14) and the twelve foundation-stones of the New Jerusalem are one architecture: the two-house people written into the eternal dwelling, no tribe lost.'),
    ('canon','exodus',39,14,'apocrypha','ecclesiasticus',45,11,'extras',
     E'*With twisted scarlet, the work of the cunning workman, with precious stones graven like seals, and set in gold, the work of the jeweller, with a writing engraved for a memorial, after the number of the tribes of Yashar''el (Israel)* (Ecclesiasticus 45:11). The restored sage sings the very breastplate of Exodus 39:14 — *precious stones graven like seals... after the number of the tribes* — the twelve-tribe memorial worn before Yahuah.'),

    -- THREAD 2: the bells and pomegranates, the sound of ministry
    ('canon','exodus',39,25,'apocrypha','ecclesiasticus',45,9,'extras',
     E'*And he compassed him with pomegranates, and with many golden bells round about, that as he went there might be a sound, and a noise made that might be heard in the temple, for a memorial to the children of his people* (Ecclesiasticus 45:9). The made hem of Exodus 39:25 — *bells of pure gold... between the pomegranates upon the hem of the robe* — is the same robe the sage praises: the golden bells sounding ministry, a memorial for the people.'),
    ('canon','exodus',39,26,'apocrypha','ecclesiasticus',45,9,'extras',
     E'*And he compassed him with pomegranates, and with many golden bells round about, that as he went there might be a sound, and a noise made that might be heard in the temple, for a memorial to the children of his people* (Ecclesiasticus 45:9). *A bell and a pomegranate, a bell and a pomegranate, round about the hem of the robe to minister in* (Exodus 39:26) — the heard sound marks the priest accepted as he ministers, the people remembered before Yahuah.'),

    -- THREAD 3: HOLINESS TO YAHUAH, the golden crown
    ('canon','exodus',39,30,'canon','zechariah',14,20,'free',
     E'*In that day shall there be upon the bells of the horses, HOLINESS UNTO THE Yahuah (LORD); and the pots in the LORD''S house shall be like the bowls before the altar* (Zechariah 14:20). The crown that only the high priest wore — *they made the plate of the holy crown of pure gold, and wrote upon it... HOLINESS TO THE Yahuah* (Exodus 39:30) — is, in the day of restoration, written upon everything: all Yahudah made holy as the priest was.'),
    ('canon','exodus',39,30,'canon','leviticus',19,2,'free',
     E'*Speak unto all the congregation of the children of Yashar''el (Israel), and say unto them, Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). The plate worn on the priest''s brow declares the calling of the whole people: *HOLINESS TO THE Yahuah* (Exodus 39:30) — set-apartness to Yahuah is the command on every Yashar''elite, borne visibly by the one who represents them.'),
    ('canon','exodus',39,30,'canon','1-peter',1,16,'free',
     E'*Because it is written, Be ye holy; for I am holy* (1 Peter 1:16). The golden crown engraved *HOLINESS TO THE Yahuah* (Exodus 39:30) is quoted forward into the restored people: the same Torah-command (Leviticus 19:2) borne on the priest is laid on all who are called — holiness affirmed, never abolished.'),
    ('canon','exodus',39,30,'apocrypha','ecclesiasticus',45,12,'extras',
     E'*He set a crown of gold upon the mitre, in which was engraved Holiness, an ornament of honour, a costly work, the desires of the eyes, goodly and beautiful* (Ecclesiasticus 45:12). The sage names the very plate of Exodus 39:30 — *the holy crown of pure gold... HOLINESS TO THE Yahuah* — the crown engraved Holiness, the glory of Aaron''s garments.'),

    -- THREAD 4: the tabernacle finished — Yahuah dwells with his people
    ('canon','exodus',39,32,'canon','revelation',21,3,'free',
     E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The first finished tabernacle — *thus was all the work of the tabernacle of the tent of the congregation finished* (Exodus 39:32) — is the down-payment of the last: Yahuah dwelling in the midst of his people forever.'),
    ('canon','exodus',39,32,'jubilees','jubilees',1,17,'extras',
     E'*And I shall build My sanctuary in their midst, and I shall dwell with them, and I shall be their Elohim (God) and they will be My people in truth and righteousness* (Jubilees 1:17). The tabernacle finished by Israel''s hands (Exodus 39:32) is the visible promise Yahuah speaks to Moses on the mount: a sanctuary in their midst, Yahuah dwelling, the covenant people his own.'),

    -- THREAD 5: as Yahuah commanded Moses — the finished, obedient work
    ('canon','exodus',39,42,'canon','exodus',25,40,'free',
     E'*And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). The refrain reaches its summit: *according to all that Yahuah commanded Moses, so the children of Yashar''el made all the work* (Exodus 39:42) — the heavenly pattern reproduced on earth in perfect obedience, nothing added, nothing left undone.'),
    ('canon','exodus',39,42,'canon','hebrews',8,5,'free',
     E'*Who serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The made tabernacle is the shadow of the heavenly: *they made all the work* (Exodus 39:42) exactly to the pattern — earth conformed to heaven by obedience.'),
    ('canon','exodus',39,42,'canon','genesis',2,1,'free',
     E'*Thus the heavens and the earth were finished, and all the host of them* (Genesis 2:1). The tabernacle-build mirrors the creation-finishing: *thus was all the work of the tabernacle... finished* (Exodus 39:32) and *they made all the work* (Exodus 39:42) — the dwelling is a new creation, the work completed and brought to rest.'),
    ('canon','exodus',39,42,'canon','genesis',2,2,'free',
     E'*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2). As Elohim ended and rested, so Israel ended the dwelling — *they made all the work* (Exodus 39:42); the finished tabernacle and the finished creation are one pattern, the work brought to completion and Sabbath.'),
    ('canon','exodus',39,42,'canon','genesis',6,22,'free',
     E'*Thus did Noah; according to all that Elohim (God) commanded him, so did he* (Genesis 6:22). The same formula of complete obedience: as Noah built the ark, so Israel built the tabernacle — *according to all that Yahuah commanded Moses, so the children of Yashar''el made all the work* (Exodus 39:42); the doer who obeys all is the one delivered.'),
    ('canon','exodus',39,43,'canon','exodus',40,16,'free',
     E'*Thus did Moses: according to all that Yahuah (LORD) commanded him, so did he* (Exodus 40:16). The blessing of the finished work flows into the rearing-up: *Moses did look upon all the work... they had done it as Yahuah had commanded... and Moses blessed them* (Exodus 39:43), then Moses himself does all as commanded — obedience whole, top to bottom.'),
    ('canon','exodus',39,43,'canon','genesis',1,31,'free',
     E'*And Elohim (God) saw every thing that he had made, and, behold, it was very good* (Genesis 1:31). As Elohim looked and saw it very good, so *Moses did look upon all the work, and, behold, they had done it as Yahuah had commanded... and Moses blessed them* (Exodus 39:43) — the inspecting-and-blessing of the finished dwelling echoes the inspecting-and-blessing of finished creation.'),
    ('canon','exodus',39,43,'canon','hebrews',3,2,'free',
     E'*Who was faithful to him that appointed him, as also Moses was faithful in all his house* (Hebrews 3:2). The blessing rests on faithfulness: *they had done it as Yahuah had commanded, even so had they done it: and Moses blessed them* (Exodus 39:43) — Moses faithful in all his house, the Torah kept in full, the doer blessed.'),
    ('canon','exodus',39,43,'canon','john',17,4,'free',
     E'*I have glorified thee on the earth: I have finished the work which thou gavest me to do* (John 17:4). The Formed Son speaks the language of the finished tabernacle: as the work was *done... as Yahuah had commanded* and Moses blessed them (Exodus 39:43), so the Son finishes the work the Father gave — the obedient completing of the appointed task.'),
    ('canon','exodus',39,43,'canon','john',19,30,'free',
     E'*When Yahusha (Jesus) therefore had received the vinegar, he said, It is finished: and he bowed his head, and gave up the ghost* (John 19:30). The cry "It is finished" answers the finished work blessed by Moses (Exodus 39:43): the dwelling completed in obedience foreshadows the work of the Formed Son brought to its end, the pattern fulfilled.'),
    ('canon','exodus',39,43,'canon','matthew',7,24,'free',
     E'*Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24). The blessed builders of Exodus 39:43 — who *had done it as Yahuah had commanded* — are the doers, not hearers only; the wise man builds by doing what is commanded, and the house stands.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------- C. threads ----------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-39-the-twelve-tribe-stones-borne-for-a-memorial-rev-21',
       E'The Twelve-Tribe Stones, Borne for a Memorial → the Gates of the City',
       E'On the mount Yahuah commanded the stones; here they are MADE: *they wrought onyx stones inclosed in ouches of gold, graven, as signets are graven, with the names of the children of Yashar''el (Israel)* (Exodus 39:6), and the breastplate set with *four rows of stones... according to the names of the children of Yashar''el, twelve, according to their names... every one with his name, according to the twelve tribes* (Exodus 39:14). The command-side stood already: *Aaron shall bear their names before Yahuah (LORD) upon his two shoulders for a memorial* (Exodus 28:12). The high priest BEARS the whole twelve-tribe people on his shoulders and over his heart — not one tribe of the two houses forgotten. The restored sage saw it: *with precious stones graven like seals, and set in gold... with a writing engraved for a memorial, after the number of the tribes of Yashar''el* (Ecclesiasticus 45:11). And the apparatus reaches its end in the city: *names written thereon, which are the names of the twelve tribes of the children of Yashar''el* (Revelation 21:12), *and the wall of the city had twelve foundations* (Revelation 21:14). The twelve names borne on the breastplate are the twelve names written on the gates — the two-house people carried before Yahuah from the wilderness tent to the eternal dwelling, every name kept.',
       sv.verse_id, ev.verse_id, 'extras', 29950
  FROM _s305_ex39_lookup sv, _s305_ex39_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=39 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-39-the-bells-and-pomegranates-the-sound-of-ministry',
       E'The Bells and the Pomegranates — the Sound of Ministry',
       E'On the hem of the high priest''s robe they made *pomegranates of blue, and purple, and scarlet, and twined linen* (Exodus 39:24) and *bells of pure gold... between the pomegranates upon the hem of the robe... A bell and a pomegranate, a bell and a pomegranate, round about the hem of the robe to minister in* (Exodus 39:25-26). The bell sounded as the priest moved in the holy place — the heard mark of accepted ministry. The restored sage describes the same robe: *he compassed him with pomegranates, and with many golden bells round about, that as he went there might be a sound, and a noise made that might be heard in the temple, for a memorial to the children of his people* (Ecclesiasticus 45:9). The sound is a memorial — the people carried before Yahuah even in the ringing of the bells, the priest serving on their behalf, alive and accepted.',
       sv.verse_id, ev.verse_id, 'extras', 29953
  FROM _s305_ex39_lookup sv, _s305_ex39_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=39 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-39-holiness-to-yahuah-the-golden-crown',
       E'HOLINESS TO YAHUAH — the Golden Crown',
       E'*And they made the plate of the holy crown of pure gold, and wrote upon it a writing, like to the engravings of a signet, HOLINESS TO THE Yahuah (LORD)* (Exodus 39:30). The high priest bore on his brow the calling of the whole people: *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). The restored sage names the crown: *he set a crown of gold upon the mitre, in which was engraved Holiness, an ornament of honour... goodly and beautiful* (Ecclesiasticus 45:12). What is worn by the one priest is, in the day of restoration, written upon everything: *In that day shall there be upon the bells of the horses, HOLINESS UNTO THE Yahuah (LORD); and the pots in the LORD''S house shall be like the bowls before the altar* (Zechariah 14:20) — all Yahudah made as holy as the high priest. And the command is carried forward to the called people: *Be ye holy; for I am holy* (1 Peter 1:16) — the Torah-word of Leviticus borne on the crown, never abolished, laid on all who bear the Name.',
       sv.verse_id, ev.verse_id, 'extras', 29956
  FROM _s305_ex39_lookup sv, _s305_ex39_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=39 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-39-the-tabernacle-finished-yahuah-dwells-with-his-people',
       E'The Tabernacle Finished — Yahuah Dwells with His People',
       E'*Thus was all the work of the tabernacle of the tent of the congregation finished: and the children of Yashar''el (Israel) did according to all that Yahuah (LORD) commanded Moses, so did they* (Exodus 39:32). The whole point of the dwelling is the indwelling. Yahuah had spoken it to Moses on the mount: *I shall build My sanctuary in their midst, and I shall dwell with them, and I shall be their Elohim (God) and they will be My people in truth and righteousness* (Jubilees 1:17). The first finished tabernacle is the down-payment of the last: *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). From the wilderness tent to the New Jerusalem the promise is one and unbroken — Yahuah in the midst of his covenant people, his dwelling among them.',
       sv.verse_id, ev.verse_id, 'extras', 29959
  FROM _s305_ex39_lookup sv, _s305_ex39_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=39 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-39-as-yahuah-commanded-moses-the-finished-obedient-work',
       E'As Yahuah Commanded Moses — the Finished, Obedient Work',
       E'The chapter beats out a refrain — *as Yahuah commanded Moses* — eight times, climbing to its summit: *According to all that Yahuah (LORD) commanded Moses, so the children of Yashar''el (Israel) made all the work. And Moses did look upon all the work, and, behold, they had done it as Yahuah (LORD) had commanded, even so had they done it: and Moses blessed them* (Exodus 39:42-43). The work was built EXACTLY to the heavenly pattern: *look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40); *See... that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The finishing mirrors the creation-finishing: *thus the heavens and the earth were finished* (Genesis 2:1); *on the seventh day Elohim (God) ended his work... and he rested* (Genesis 2:2); *Elohim (God) saw every thing that he had made, and, behold, it was very good* (Genesis 1:31) — as Elohim looked and blessed, so Moses looked and blessed. The dwelling is a new creation brought to rest. It is the formula of complete obedience: *thus did Noah; according to all that Elohim (God) commanded him, so did he* (Genesis 6:22); *thus did Moses: according to all that Yahuah (LORD) commanded him, so did he* (Exodus 40:16); *Moses was faithful in all his house* (Hebrews 3:2). And the Formed Son speaks the same language: *I have finished the work which thou gavest me to do* (John 17:4); *It is finished* (John 19:30). The doer is the one blessed: *whosoever heareth these sayings of mine, and doeth them... I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24). Obedience finishes the dwelling — the Torah kept in full, nothing abolished, the doer blessed.',
       sv.verse_id, ev.verse_id, 'free', 29962
  FROM _s305_ex39_lookup sv, _s305_ex39_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=42
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=39 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

-- ---------- D. thread_members ----------
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (39,6,'canon','exodus',28,11,1,E'*Like the engravings of a signet, shalt thou engrave the two stones with the names of the children of Yashar''el* (Exodus 28:11) — the command on the mount, now MADE.'),
    (39,7,'canon','exodus',28,12,2,E'*Aaron shall bear their names before Yahuah upon his two shoulders for a memorial* (Exodus 28:12) — the priest bears the whole people.'),
    (39,14,'canon','exodus',28,21,3,E'*Twelve, according to their names... according to the twelve tribes* (Exodus 28:21) — every tribe of the two houses set in gold.'),
    (39,14,'canon','revelation',21,12,4,E'*The names of the twelve tribes of the children of Yashar''el* (Revelation 21:12) — the same twelve names on the gates of the city.'),
    (39,14,'canon','revelation',21,14,5,E'*The wall of the city had twelve foundations* (Revelation 21:14) — the breastplate-stones become the foundation-stones.'),
    (39,14,'apocrypha','ecclesiasticus',45,11,6,E'*Precious stones graven like seals... after the number of the tribes of Yashar''el* (Ecclesiasticus 45:11) — the restored sage sings the breastplate.')
  ) AS m(srcv_ch,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s305_ex39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=m.srcv
  JOIN _s305_ex39_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='exodus-39-the-twelve-tribe-stones-borne-for-a-memorial-rev-21'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (39,25,'apocrypha','ecclesiasticus',45,9,1,E'*Pomegranates, and... many golden bells round about, that as he went there might be a sound* (Ecclesiasticus 45:9) — the bells made on the hem.'),
    (39,26,'apocrypha','ecclesiasticus',45,9,2,E'*A noise made that might be heard in the temple, for a memorial to the children of his people* (Ecclesiasticus 45:9) — the sound of accepted ministry, the people remembered.')
  ) AS m(srcv_ch,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s305_ex39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=m.srcv
  JOIN _s305_ex39_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='exodus-39-the-bells-and-pomegranates-the-sound-of-ministry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (39,30,'canon','leviticus',19,2,1,E'*Ye shall be holy: for I Yahuah Elohaychem am holy* (Leviticus 19:2) — the calling the crown declares for the whole people.'),
    (39,30,'canon','zechariah',14,20,2,E'*HOLINESS UNTO THE Yahuah* upon the bells of the horses (Zechariah 14:20) — in the day of restoration all is made holy as the priest.'),
    (39,30,'canon','1-peter',1,16,3,E'*Be ye holy; for I am holy* (1 Peter 1:16) — Leviticus quoted forward onto the called people, holiness affirmed.'),
    (39,30,'apocrypha','ecclesiasticus',45,12,4,E'*A crown of gold... in which was engraved Holiness* (Ecclesiasticus 45:12) — the sage names the very plate.')
  ) AS m(srcv_ch,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s305_ex39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=m.srcv
  JOIN _s305_ex39_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='exodus-39-holiness-to-yahuah-the-golden-crown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (39,32,'jubilees','jubilees',1,17,1,E'*I shall build My sanctuary in their midst, and I shall dwell with them* (Jubilees 1:17) — the promise the finished tent makes visible.'),
    (39,32,'canon','revelation',21,3,2,E'*The tabernacle of Elohim is with men, and he will dwell with them* (Revelation 21:3) — the first tent the down-payment of the last.')
  ) AS m(srcv_ch,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s305_ex39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=m.srcv
  JOIN _s305_ex39_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='exodus-39-the-tabernacle-finished-yahuah-dwells-with-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (39,42,'canon','exodus',25,40,1,E'*Make them after their pattern, which was shewed thee in the mount* (Exodus 25:40) — the work built exactly to the pattern.'),
    (39,42,'canon','hebrews',8,5,2,E'*Make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5) — the made tent the shadow of the heavenly.'),
    (39,42,'canon','genesis',2,1,3,E'*The heavens and the earth were finished* (Genesis 2:1) — the dwelling-build mirrors the creation-finishing.'),
    (39,42,'canon','genesis',2,2,4,E'*On the seventh day Elohim ended his work... and he rested* (Genesis 2:2) — the finished work brought to rest.'),
    (39,42,'canon','genesis',6,22,5,E'*Thus did Noah; according to all that Elohim commanded him, so did he* (Genesis 6:22) — the same formula of complete obedience.'),
    (39,43,'canon','genesis',1,31,6,E'*Elohim saw every thing... and, behold, it was very good* (Genesis 1:31) — looked-and-blessed, as Moses looked and blessed.'),
    (39,43,'canon','exodus',40,16,7,E'*Thus did Moses: according to all that Yahuah commanded him, so did he* (Exodus 40:16) — obedience whole, top to bottom.'),
    (39,43,'canon','hebrews',3,2,8,E'*Moses was faithful in all his house* (Hebrews 3:2) — the blessing rests on faithfulness.'),
    (39,43,'canon','john',17,4,9,E'*I have finished the work which thou gavest me to do* (John 17:4) — the Formed Son finishes the appointed work.'),
    (39,43,'canon','john',19,30,10,E'*It is finished* (John 19:30) — the cry that answers the finished, blessed work.'),
    (39,43,'canon','matthew',7,24,11,E'*Whosoever heareth these sayings... and doeth them... built his house upon a rock* (Matthew 7:24) — the doer blessed, the house stands.')
  ) AS m(srcv_ch,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s305_ex39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=39 AND sv.verse_number=m.srcv
  JOIN _s305_ex39_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='exodus-39-as-yahuah-commanded-moses-the-finished-obedient-work'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
