-- ----- fragment: minion_genesis_7.sql (Genesis 7) -----
-- Chapter: Genesis 7 (Noah and all flesh enter the ark; the clean and unclean by sevens; the
--          fountains of the deep and the windows of heaven broken up; Yahuah shut him in; all flesh died)
-- Tag: ge07   Temp view: _s301_ge07_lookup
-- Sort band: base 20150, step 3 -> threads at 20150, 20153, 20156, 20159 (4 threads)
-- Source of EVERY row: 'canon','genesis',7,v
--
-- Genesis 7 coverage:
--   v.1 (Come thou and all thy house into the ark; thee have I seen righteous before me in this generation)
--        NT:     carried in the "Noah entered / Yahuah shut him in" thread (Heb 11:7, 1 Pet 3:20)
--        Extras: Jubilees 5:19 (no man's person accepted save Noah; saved his sons on his account) — placed in the all-flesh-died thread
--        Tanakh: none warranted as own member (righteousness named again at v.21-23 -> Ezek 14:14)
--   ★ v.2-3 (of every clean beast by sevens, male and female; of beasts not clean by two; fowls by sevens, to keep seed alive)
--        NT:     none warranted (the dietary categories are LAW; Acts 10/Mark 7 are the Christianized-abolition misread, deliberately NOT pulled)
--        Extras: Jasher 6:9 (from the clean animals and clean fowls he brought seven couples, as Elohim had commanded)
--        Tanakh: LEVITICUS 11 (the dietary law NAMED, not invented — the clean/unclean Noah already knew): Lev 11:2,11:3,11:8,11:46,11:47
--   v.4 (yet seven days, and I will cause it to rain forty days and forty nights; destroy every living substance)
--        NT:     none warranted (woven by reference into the fountains-of-the-deep thread)
--        Extras: none warranted distinct (Jasher 6:10 the seven-day delay; quoted by reference in summary)
--        Tanakh: none warranted
--   v.5 (Noah did according unto all that Yahuah commanded him)
--        NT:     Hebrews 11:7 (by faith Noah... prepared an ark to the saving of his house) — placed in the entered/shut-in thread
--        Extras: none warranted
--        Tanakh: none warranted
--   v.6-7 (Noah six hundred years old when the flood was upon the earth; Noah went in, his sons, wife, sons' wives)
--        NT:     none warranted as own thread
--        Extras: none warranted distinct
--        Tanakh: none warranted
--   ★ v.8 (of clean beasts, and of beasts not clean, and of fowls, and of every thing that creepeth) — restates the clean/unclean distinction
--        NT:     none warranted
--        Extras: Jasher 6:9 (covered at v.2-3)
--        Tanakh: LEVITICUS 11:47 (to make a difference between the unclean and the clean) — placed in the by-sevens thread
--   v.9 (there went in two and two unto Noah into the ark, male and female, as Elohim had commanded Noah)
--        NT:     none warranted
--        Extras: none warranted distinct (the pairs; the sevens carry the load)
--        Tanakh: none warranted
--   v.10 (after seven days, the waters of the flood were upon the earth)
--        NT:     none warranted
--        Extras: none warranted distinct
--        Tanakh: none warranted
--   ★ v.11-12 (in the six hundredth year... the same day were all the fountains of the great deep broken up, and the windows of heaven were opened; rain forty days and forty nights) — THE UN-CREATION
--        NT:     Matthew 24:38,24:39 (until the day Noe entered... and knew not until the flood came, and took them all away);
--                Luke 17:27 (the flood came, and destroyed them all); 2 Peter 3:6 (the world that then was, being overflowed with water, perished)
--        Extras: Jubilees 5:23 (Yahuah opened seven flood-gates of heaven and the mouths of the great deep, seven mouths in number);
--                Jasher 6:14 (all the fountains of the deep were broken up, and the windows of heaven were opened, rain forty days and forty nights)
--        Tanakh: Isaiah 24:18 (the windows from on high are open, and the foundations of the earth do shake) — the latter-day un-creation echoing the flood
--   ★ v.13,16 (in the selfsame day entered Noah, Shem, Ham, Japheth... and Yahuah shut him in) — THE DOOR SHUT, THE DELIVERANCE SEALED
--        NT:     1 Peter 3:20 (the longsuffering waited in the days of Noah... eight souls saved by water);
--                Hebrews 11:7 (by faith Noah prepared an ark to the saving of his house)
--        Extras: Jubilees 5:23 (Yahuah God closed it from without on the seventeenth evening);
--                Jasher 6:15 (Noah and his household came into the ark... and Yahuah shut him in)
--        Tanakh: none warranted (the ark-of-safety figure carried forward to NT + out to Jubilees/Jasher)
--   v.14-15,17-20 (every beast after his kind entered; the waters prevailed, the ark lifted up; fifteen cubits; the mountains covered)
--        NT:     none warranted distinct
--        Extras: none warranted distinct (Jubilees 5:23 fifteen cubits / ark lifted up — quoted by reference)
--        Tanakh: none warranted
--   ★ v.21-23 (all flesh died... every man; Noah only remained alive, and they that were with him in the ark) — THE JUDGMENT UNIVERSAL
--        NT:     2 Peter 3:6 (the world that then was, being overflowed with water, perished) — placed in fountains thread; here Matthew 24:39 (took them all away)
--        Extras: Jubilees 5:19 (no man's person accepted save Noah alone); Jasher 6:26 (all flesh that was upon the earth died... there only remained Noah and those with him in the ark)
--        Tanakh: Ezekiel 14:14 (Noah, Daniel, and Job... deliver but their own souls by their righteousness); Isaiah 54:9 (the waters of Noah... should no more go over the earth)
--   v.24 (the waters prevailed upon the earth an hundred and fifty days)
--        NT:     none warranted
--        Extras: Jubilees 5:23 (the water prevailed... one hundred and fifty days) — quoted by reference in summary
--        Tanakh: none warranted
--
-- Threads (slug -> target libraries):
--   genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai   [Tanakh+Extras]  tier extras  ★ creational, pre-Sinai
--   genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven            [NT+Extras+Tanakh] tier extras ★ the un-creation
--   genesis-7-noah-entered-and-yahuah-shut-him-in                            [NT+Extras]      tier extras  ★ the door shut
--   genesis-7-all-flesh-died-and-noah-only-remained                         [NT+Extras+Tanakh] tier extras ★ judgment universal
--
-- Framework-load-bearing notes:
--   ★ v.2-3,8 CLEAN/UNCLEAN BY SEVENS: the clean/unclean distinction is PRESENT BEFORE SINAI — Noah is
--     commanded to take clean beasts by sevens and unclean by twos centuries before Moses. This is
--     CREATIONAL knowledge, not a Mosaic invention and emphatically NOT a temporary/abolished law. The
--     thread weaves LATERALLY to Leviticus 11, where the SAME categories Noah already knew are NAMED and
--     written into the covenant Torah (*to make a difference between the unclean and the clean* — Lev
--     11:47). The Christianized "the dietary law was abolished / invented at Sinai" default is overridden:
--     the law names what was already true. Acts 10 / Mark 7 deliberately NOT pulled (the abolition misread).
--   ★ v.11 THE UN-CREATION: *the fountains of the great deep broken up, and the windows of heaven were
--     opened* is the reversal of Genesis 1 — the waters above and below, divided on day two, let back in.
--     Woven FORWARD as the type of the final reckoning (Matthew 24:38-39, Luke 17:27, 2 Peter 3:6) and OUT
--     to the restored witnesses that count the seven flood-gates (Jubilees 5:23) and repeat the formula
--     verbatim (Jasher 6:14); LATERALLY to Isaiah 24:18 (the windows from on high open in the day of the LORD).
--   ★ v.16 YAHUAH SHUT HIM IN: the door is shut by Yahuah's own hand — the deliverance sealed, the ark of
--     safety. Forward to 1 Peter 3:20 (eight souls saved by water, the figure of baptism) and Hebrews 11:7
--     (by faith, to the saving of his house); out to Jubilees 5:23 (closed from without) and Jasher 6:15.
--   ★ v.21-23 ALL FLESH DIED: the judgment is universal — *Noah only remained alive*. Ezekiel 14:14 reads
--     it as deliverance by personal righteousness (Noah, Daniel, Job deliver but their own souls); Isaiah
--     54:9 names *the waters of Noah* as Yahuah's sworn covenant-mercy. The Formed/Formless lens: it is
--     Yahuah (the visible LORD who shut the door) who judges and who swears the after-mercy.

CREATE TEMP VIEW _s301_ge07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== cross_references ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the clean and unclean by sevens — the distinction before Sinai
    ('canon','genesis',7,2,'canon','leviticus',11,2,'free',
      E'*Speak unto the children of Yashar''el (Israel), saying, These are the beasts which ye shall eat among all the beasts that are on the earth* (Leviticus 11:2). When Noah is told *Of every clean beast thou shalt take to thee by sevens... and of beasts that are not clean by two* (Genesis 7:2), the clean/unclean distinction is already in force — generations before Sinai. Leviticus 11 does not invent the categories; it names in covenant Torah what Noah already knew, the beasts *which ye shall eat* set apart from those *not clean*.'),
    ('canon','genesis',7,2,'canon','leviticus',11,3,'free',
      E'*Whatsoever parteth the hoof, and is clovenfooted, and cheweth the cud, among the beasts, that shall ye eat* (Leviticus 11:3). The *clean beast* Noah took *by sevens* (Genesis 7:2) is here given its marks. The dietary law is not a new yoke laid at Sinai but the spelling-out of a creational distinction the righteous already observed — the same clean kinds, now described so Yashar''el (Israel) may keep them.'),
    ('canon','genesis',7,2,'canon','leviticus',11,8,'free',
      E'*Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* (Leviticus 11:8). Noah''s *beasts that are not clean* taken only *by two* (Genesis 7:2) are the same unclean kinds the Torah names. The category is creational and continuous: what was *not clean* in Noah''s day is *unclean to you* in the covenant Torah — never abolished, never a temporary measure, the difference written into the world before it was written on tablets.'),
    ('canon','genesis',7,8,'canon','leviticus',11,47,'free',
      E'*To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47). Genesis 7:8 quietly repeats the whole categorization — *Of clean beasts, and of beasts that are not clean, and of fowls, and of every thing that creepeth* — proving the distinction stood before the Torah codified it. The very purpose Leviticus states, *to make a difference between the unclean and the clean*, is the difference Noah was already keeping at the ark door.'),
    ('canon','genesis',7,8,'canon','leviticus',11,46,'free',
      E'*This is the law of the beasts, and of the fowl, and of every living creature that moveth in the waters, and of every creature that creepeth upon the earth* (Leviticus 11:46). The four kinds Noah marks at the ark — *clean beasts... beasts that are not clean... fowls... every thing that creepeth* (Genesis 7:8) — are the same four the law of Leviticus 11 governs. The Torah gathers into one *law of the beasts* the distinction Noah obeyed by command, the creational order made covenant instruction.'),
    ('canon','genesis',7,2,'jasher','jasher',6,9,'extras',
      E'*Two and two came to Noah into the ark, but from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9). Jasher carries Genesis 7:2 with the same reckoning — the unclean *two and two*, the *clean animals, and clean fowls... seven couples* — and grounds it in command: *as Elohim (God) had commanded him*. The sevens of the clean are not Noah''s preference but obedience to a clean/unclean order already given, the same order Leviticus 11 will name.'),

    -- THREAD 2 (★): the fountains of the deep and the windows of heaven — the un-creation
    ('canon','genesis',7,11,'jubilees','jubilees',5,23,'extras',
      E'*And Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number. And the flood-gates began to pour down water from the heaven forty days and forty nights, And the fountains of the deep also sent up waters, until the whole world was full of water* (Jubilees 5:23). The Torah''s *all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11) is here counted out — *seven flood-gates of heaven... seven mouths* of the deep — the waters above and the waters below, divided in Genesis 1, let back in at once: the un-creation, the world un-made by the same waters it was framed from.'),
    ('canon','genesis',7,11,'jasher','jasher',6,14,'extras',
      E'*And all the fountains of the deep were broken up, and the windows of heaven were opened, and the rain was upon the earth forty days and forty nights* (Jasher 6:14). Jasher repeats Genesis 7:11 almost word for word — *all the fountains of the great deep broken up, and the windows of heaven were opened* — the double breach of the deep beneath and the heaven above, the ordered separation of the second day undone and the flood loosed for *forty days and forty nights*.'),
    ('canon','genesis',7,11,'canon','isaiah',24,18,'free',
      E'*And it shall come to pass, that he who fleeth from the noise of the fear shall fall into the pit; and he that cometh up out of the midst of the pit shall be taken in the snare: for the windows from on high are open, and the foundations of the earth do shake* (Isaiah 24:18). Isaiah takes up the flood-language of Genesis 7:11 — *the windows of heaven were opened* — for the day of Yahuah: *the windows from on high are open, and the foundations of the earth do shake*. The un-creation of Noah''s day is the prophet''s figure for the final reckoning, the heavens opened once more upon a guilty earth.'),
    ('canon','genesis',7,11,'canon','2-peter',3,6,'free',
      E'*Whereby the world that then was, being overflowed with water, perished* (2 Peter 3:6). When *the fountains of the great deep* were *broken up, and the windows of heaven were opened* (Genesis 7:11), *the world that then was* perished by water. Kepha sets that flood beside the coming judgement by fire — the same word of Elohim (God) that framed the heavens and the earth out of water now keeps them *reserved unto fire* — making the un-creation of Genesis 7 the pledge that the present world too will be judged.'),
    ('canon','genesis',7,12,'canon','matthew',24,38,'free',
      E'*For as in the days that were before the flood they were eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38). The forty days of rain (Genesis 7:12) fell on a world that lived on heedless to the last day. Yahusha (Jesus) names *the days that were before the flood* — the ordinary eating and drinking *until the day that Noe entered into the ark* — as the very pattern of the world at his coming.'),
    ('canon','genesis',7,12,'canon','matthew',24,39,'free',
      E'*And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39). When *the rain was upon the earth forty days and forty nights* (Genesis 7:12), the condemned world *knew not until the flood came, and took them all away*. The Son of Adam makes the suddenness and totality of the flood the figure of his return — *so shall also the coming of the Son of Adam be*.'),
    ('canon','genesis',7,12,'canon','luke',17,27,'free',
      E'*They did eat, they drank, they married wives, they were given in marriage, until the day that Noe entered into the ark, and the flood came, and destroyed them all* (Luke 17:27). Luke''s witness joins the rain of Genesis 7:12 to the return of the Son of Adam: the world ate and drank *until the day that Noe entered into the ark, and the flood came, and destroyed them all* — the un-creation breaking upon a world that read no sign.'),

    -- THREAD 3 (★): Noah entered, and Yahuah shut him in — the door sealed
    ('canon','genesis',7,16,'canon','1-peter',3,20,'free',
      E'*Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20). When *they went in unto Noah into the ark... and Yahuah (LORD) shut him in* (Genesis 7:16), the long-suffering closed and the deliverance sealed — *eight souls were saved by water*. The shut door is the boundary between the saved few and the drowning world, the ark of safety the apostle names as the figure of salvation.'),
    ('canon','genesis',7,13,'canon','hebrews',11,7,'free',
      E'*By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). *In the selfsame day entered Noah, and Shem, and Ham, and Japheth... and Noah''s wife, and the three wives of his sons with them, into the ark* (Genesis 7:13) — the whole house entering is the ark *to the saving of his house*. Noah''s obedience in building and entering is faith made visible, the righteous remnant condemning the world by going in.'),
    ('canon','genesis',7,16,'jubilees','jubilees',5,23,'extras',
      E'*And he entered in the sixth (year) thereof, in the second month, on the new moon of the second month, till the sixteenth; and he entered, and all that we brought to him, into the ark, and Yahuah (God) closed it from without on the seventeenth evening* (Jubilees 5:23). Jubilees carries Genesis 7:16 — *Yahuah (LORD) shut him in* — with the same hand sealing the door from outside: *Yahuah (God) closed it from without on the seventeenth evening*. The deliverance is shut by Yahuah''s own act, the ark sealed against the rising waters.'),
    ('canon','genesis',7,16,'jasher','jasher',6,15,'extras',
      E'*And Noah and his household, and all the living creatures that were with him, came into the ark on account of the waters of the flood, and Yahuah (the Lord) shut him in* (Jasher 6:15). Jasher repeats Genesis 7:16 word for word — *and Yahuah (the Lord) shut him in* — Noah and his household and the creatures gathered inside, and the door closed by Yahuah. The same sealed deliverance: those within preserved, the door shut by the hand that judges.'),

    -- THREAD 4 (★): all flesh died, and Noah only remained
    ('canon','genesis',7,21,'jasher','jasher',6,26,'extras',
      E'*And the rain was still descending upon the earth, and it descended forty days and forty nights, and the waters prevailed greatly upon the earth; and all flesh that was upon the earth or in the waters died, whether men, animals, beasts, creeping things or birds of the air, and there only remained Noah and those that were with him in the ark* (Jasher 6:26). Jasher carries Genesis 7:21 in full — *all flesh died that moved upon the earth* — and names the sole exception the Torah names: *there only remained Noah and those that were with him in the ark*. The judgement is universal; the preserved are only those the door shut in.'),
    ('canon','genesis',7,23,'jubilees','jubilees',5,19,'extras',
      E'*And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways* (Jubilees 5:19). *Noah only remained alive, and they that were with him in the ark* (Genesis 7:23): Jubilees gives the reason — *no man''s person was accepted save that of Noah alone* — and the mechanism of the sons'' survival, *accepted in behalf of his sons*. The seed-line is preserved through the one righteous man while all corrupted flesh is swept away.'),
    ('canon','genesis',7,23,'canon','ezekiel',14,14,'free',
      E'*Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 14:14). *Noah only remained alive* (Genesis 7:23) is read by Ezekiel as the pattern of deliverance by personal righteousness: even *Noah, Daniel, and Job* could *deliver but their own souls by their righteousness*. The flood shows it — Noah''s righteousness saved Noah''s house, not the guilty world; each is answerable for his own standing before Yahuah.'),
    ('canon','genesis',7,23,'canon','isaiah',54,9,'free',
      E'*For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee* (Isaiah 54:9). The universal judgement of Genesis 7:23 — *every living substance was destroyed... and Noah only remained alive* — becomes Yahuah''s standing oath of mercy: *the waters of Noah should no more go over the earth*. The flood that drowned all flesh is named in the covenant of peace, the sworn pledge that such wrath will not return upon his people.'),
    ('canon','genesis',7,21,'canon','matthew',24,39,'free',
      E'*And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39). *And all flesh died that moved upon the earth, both of fowl, and of cattle, and of beast... and every man* (Genesis 7:21): the flood *took them all away*. Yahusha (Jesus) makes that total taking the figure of his coming — the unready world swept off in a day, *so shall also the coming of the Son of Adam be*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== threads ==============================
-- THREAD 1 (★): the clean and unclean by sevens — the distinction before Sinai
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai',
       E'The clean and unclean by sevens — the distinction before Sinai',
       E'Long before Sinai, before any tablet was cut, the clean and the unclean are already two kinds. *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female* (Genesis 7:2), *to keep seed alive upon the face of all the earth* (Genesis 7:3). Genesis 7:8 says it again at the ark door — *Of clean beasts, and of beasts that are not clean, and of fowls, and of every thing that creepeth upon the earth*. Noah does not ask which beasts are clean; he already knows. This is creational knowledge, the difference written into the world. When the Torah later sets it in covenant law, it does not invent the categories — it names them: *Speak unto the children of Yashar''el (Israel), saying, These are the beasts which ye shall eat* (Leviticus 11:2); *Whatsoever parteth the hoof, and is clovenfooted, and cheweth the cud, among the beasts, that shall ye eat* (Leviticus 11:3); *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* (Leviticus 11:8). And the purpose Leviticus states is the very distinction Noah was keeping: *This is the law of the beasts, and of the fowl... To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:46-47). Jasher remembers it as command, not custom: *from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9). The clean/unclean distinction is not a Mosaic novelty and not a temporary measure abolished later — it predates Moses, Noah already knew it, and the Torah merely wrote down what was true before it was written. The dietary law is named at Sinai, never invented there, and never repealed.',
       sv.verse_id, ev.verse_id, 'extras', 20150
  FROM _s301_ge07_lookup sv, _s301_ge07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★): the fountains of the deep and the windows of heaven — the un-creation
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven',
       E'The fountains of the deep and the windows of heaven — the un-creation',
       E'On one day the world is un-made. *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11), *and the rain was upon the earth forty days and forty nights* (Genesis 7:12). This is the reversal of Genesis 1: the waters above and the waters below, divided on the second day, are let back in at once. The restored witnesses count the breach: *Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number... until the whole world was full of water* (Jubilees 5:23); Jasher repeats the Torah almost word for word — *all the fountains of the deep were broken up, and the windows of heaven were opened, and the rain was upon the earth forty days and forty nights* (Jasher 6:14). The prophet takes up the same language for the day of Yahuah: *the windows from on high are open, and the foundations of the earth do shake* (Isaiah 24:18). And the New Testament makes the flood the pledge of the final reckoning: *Whereby the world that then was, being overflowed with water, perished* (2 Peter 3:6); *as in the days that were before the flood they were eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38), *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39); *the flood came, and destroyed them all* (Luke 17:27). The un-creation of Noah''s day is no closed event — it is the figure of the world un-made again, sudden and total, upon a generation that read no sign.',
       sv.verse_id, ev.verse_id, 'extras', 20153
  FROM _s301_ge07_lookup sv, _s301_ge07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★): Noah entered, and Yahuah shut him in
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-7-noah-entered-and-yahuah-shut-him-in',
       E'Noah entered, and Yahuah shut him in',
       E'The deliverance is sealed by Yahuah''s own hand. *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark* (Genesis 7:13), *And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in* (Genesis 7:16). The door is not closed by Noah but by Yahuah — the same visible LORD who walked with the fathers seals the ark from without. The restored books keep that detail: *Yahuah (God) closed it from without on the seventeenth evening* (Jubilees 5:23); *Noah and his household, and all the living creatures that were with him, came into the ark... and Yahuah (the Lord) shut him in* (Jasher 6:15). The shut door is the boundary between the saved few and the drowning world. The apostles read the ark as the figure of salvation itself: *the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20); *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). The whole house entering, the door shut by Yahuah — this is the ark of safety, the few preserved inside while the long-suffering closes and the waters rise.',
       sv.verse_id, ev.verse_id, 'extras', 20156
  FROM _s301_ge07_lookup sv, _s301_ge07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=7 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★): all flesh died, and Noah only remained
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-7-all-flesh-died-and-noah-only-remained',
       E'All flesh died, and Noah only remained',
       E'The judgement is universal, the exception is one household. *And all flesh died that moved upon the earth, both of fowl, and of cattle, and of beast, and of every creeping thing that creepeth upon the earth, and every man* (Genesis 7:21); *All in whose nostrils was the breath of life, of all that was in the dry land, died* (Genesis 7:22); *and Noah only remained alive, and they that were with him in the ark* (Genesis 7:23). The restored witnesses tell it the same: *all flesh that was upon the earth or in the waters died... and there only remained Noah and those that were with him in the ark* (Jasher 6:26); and Jubilees gives the reason — *no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways* (Jubilees 5:19). The seed-line passes through the one righteous man while all corrupted flesh is swept away. Ezekiel reads the flood as the pattern of deliverance by personal righteousness: *Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 14:14) — Noah''s righteousness saved Noah''s house, not the guilty world. And the same waters become Yahuah''s sworn mercy in the covenant of peace: *as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee* (Isaiah 54:9). The flood that drowned all flesh is also the oath that such wrath will not return upon his people — judgement universal, mercy sworn, the seed preserved through the one whom Yahuah shut into the ark.',
       sv.verse_id, ev.verse_id, 'extras', 20159
  FROM _s301_ge07_lookup sv, _s301_ge07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ============================== thread_members ==============================
-- THREAD 1 members (★ clean/unclean before Sinai)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*These are the beasts which ye shall eat* (Leviticus 11:2) — the Torah names, not invents, the clean/unclean kinds Noah took by sevens and twos (Genesis 7:2).'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Whatsoever parteth the hoof... that shall ye eat* (Leviticus 11:3) — the marks of the clean beast Noah took by sevens (Genesis 7:2), the creational distinction spelled out.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they are unclean to you* (Leviticus 11:8) — the *beasts that are not clean* Noah took only by two (Genesis 7:2); the category continuous, never abolished.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*This is the law of the beasts, and of the fowl* (Leviticus 11:46) — the four kinds Genesis 7:8 marks at the ark, gathered into one law of the beasts.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*To make a difference between the unclean and the clean* (Leviticus 11:47) — the very purpose Noah was already keeping when he sorted clean from unclean at the ark (Genesis 7:8).'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9) — the sevens of Genesis 7:2 grounded in command, an order already given.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★ the un-creation)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number* (Jubilees 5:23) — the breach of Genesis 7:11 counted out, the waters above and below let in.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all the fountains of the deep were broken up, and the windows of heaven were opened* (Jasher 6:14) — Genesis 7:11 repeated almost verbatim, the double breach of deep and heaven.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the windows from on high are open, and the foundations of the earth do shake* (Isaiah 24:18) — the flood-language of Genesis 7:11 taken up for the day of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the world that then was, being overflowed with water, perished* (2 Peter 3:6) — the un-creation of Genesis 7:11 as the pledge of the coming judgement.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38) — the heedless world of the forty days'' rain (Genesis 7:12) as the pattern of the last days.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39) — the suddenness of Genesis 7:12 made the figure of the return.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the flood came, and destroyed them all* (Luke 17:27) — the rain of Genesis 7:12 joined again to the coming of the Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=17 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★ the door shut)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the longsuffering of Elohim (God) waited in the days of Noah... eight souls were saved by water* (1 Peter 3:20) — the door Yahuah shut (Genesis 7:16) as the boundary of the saved few.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-noah-entered-and-yahuah-shut-him-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith Noah... prepared an ark to the saving of his house* (Hebrews 11:7) — the whole house entering (Genesis 7:13) as faith made visible, condemning the world.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-noah-entered-and-yahuah-shut-him-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (God) closed it from without on the seventeenth evening* (Jubilees 5:23) — Genesis 7:16''s *Yahuah shut him in* sealed by his own hand from outside.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-noah-entered-and-yahuah-shut-him-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*and Yahuah (the Lord) shut him in* (Jasher 6:15) — Genesis 7:16 word for word, the household and creatures sealed inside the ark.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-noah-entered-and-yahuah-shut-him-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★ all flesh died)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*all flesh that was upon the earth or in the waters died... there only remained Noah and those that were with him in the ark* (Jasher 6:26) — Genesis 7:21 in full, the sole exception named.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*no man''s person was accepted save that of Noah alone... accepted in behalf of his sons* (Jubilees 5:19) — the reason *Noah only remained alive* (Genesis 7:23), the seed-line preserved.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Noah, Daniel, and Job... should deliver but their own souls by their righteousness* (Ezekiel 14:14) — the flood (Genesis 7:23) read as deliverance by personal righteousness.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the waters of Noah should no more go over the earth* (Isaiah 54:9) — the flood of Genesis 7:23 named as Yahuah''s sworn covenant-mercy.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*knew not until the flood came, and took them all away* (Matthew 24:39) — *all flesh died... every man* (Genesis 7:21), the total taking made the figure of the coming.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
