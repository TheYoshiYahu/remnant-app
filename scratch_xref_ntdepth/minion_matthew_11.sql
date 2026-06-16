-- ----- fragment: minion_matthew_11.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 11 — full-library cross-reference threads (NT DEPTH pass)
-- 5 threads / 26 members. Band 11300, step +3.
-- ============================================================================

-- 3a. Temp view ---------------------------------------------------------------
CREATE TEMP VIEW _mt11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ---------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

-- THREAD 1 : 11:2-6 art thou he — the works prove Messiah by the signs of Isaiah
  ('canon','matthew',11,5,'canon','isaiah',35,5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5). When John in prison sends to ask *Art thou he that should come, or do we look for another?* (Matthew 11:3), Yahusha (Jesus) does not argue — he points to the works, and the works are Isaiah''s own checklist of the days of Yahuah. The blind, the deaf — the signs were written down centuries before, so that when they came to pass no one would have to guess.'),
  ('canon','matthew',11,5,'canon','isaiah',35,6, 'free', E'*Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert* (Isaiah 35:6). *The lame walk... the deaf hear* (Matthew 11:5) — the very next line of Isaiah''s wilderness song. The answer to John is built straight out of the prophet: this is the One the desert was waiting for.'),
  ('canon','matthew',11,5,'canon','isaiah',61,1, 'free', E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives* (Isaiah 61:1). *The poor have the gospel preached to them* (Matthew 11:5) is the climax of the list, and it is the anointing of Isaiah 61 — the Messiah is the Anointed One who carries the good tidings to the meek.'),
  ('canon','matthew',11,5,'canon','isaiah',29,18, 'free', E'*And in that day shall the deaf hear the words of the book, and the eyes of the blind shall see out of obscurity, and out of darkness* (Isaiah 29:18). *The meek also shall increase their joy in Yahuah (LORD), and the poor among men shall rejoice in the Holy One of Yashar''el (Israel)* (Isaiah 29:19). Deaf hearing, blind seeing, and the poor rejoicing — bound together in Isaiah exactly as Yahusha binds them in his answer to John.'),
  ('canon','matthew',11,5,'canon','isaiah',26,19, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19). *The dead are raised up* (Matthew 11:5) — the last and greatest sign, the resurrection promise of Isaiah, already breaking in.'),
  ('canon','matthew',11,5,'canon','luke',7,22, 'free', E'*Then Yahusha (Jesus) answering said unto them, Go your way, and tell John what things ye have seen and heard; how that the blind see, the lame walk, the lepers are cleansed, the deaf hear, the dead are raised, to the poor the gospel is preached* (Luke 7:22). Luke records the same answer word for word — the testimony is not a proof-text wrenched from one corner; it is the consistent witness of the Messiah to the imprisoned forerunner.'),

-- THREAD 2 : 11:7-15 John more than a prophet — my messenger, Elijah, restore the tribes
  ('canon','matthew',11,10,'canon','malachi',3,1, 'free', E'*Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his temple* (Malachi 3:1). Yahusha quotes it of John: *Behold, I send my messenger before thy face, which shall prepare thy way before thee* (Matthew 11:10). John is the messenger of Malachi, the herald who goes ahead of the coming of Yahuah.'),
  ('canon','matthew',11,10,'canon','isaiah',40,3, 'free', E'*The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD), make straight in the desert a highway for our Elohim (God)* (Isaiah 40:3). The messenger of Malachi is the wilderness voice of Isaiah — the same office: a man sent ahead to make the road ready for the One who follows.'),
  ('canon','matthew',11,14,'canon','malachi',4,5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). *And if ye will receive it, this is Elias, which was for to come* (Matthew 11:14). The promised Elijah is not a riddle — Malachi named him, and Yahusha says John has filled the office.'),
  ('canon','matthew',11,14,'canon','malachi',4,6, 'free', E'*And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse* (Malachi 4:6). The Elijah-work is reconciliation and turning — and Malachi seals the very same chapter with *Remember ye the law of Moses my servant* (Malachi 4:4): the forerunner turns hearts back to the Torah, never away from it.'),
  ('canon','matthew',11,14,'apocrypha','ecclesiasticus',48,10, 'extras', E'*Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God), before it brake forth into fury, and to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10). Ben Sira, reading Malachi two centuries before John, already understood the Elijah-mission as the restoring of the tribes of Jacob — the gathering of the scattered house, the two sticks made one. John''s coming is that two-house hope stirring.'),
  ('canon','matthew',11,14,'canon','luke',1,17, 'free', E'*And he shall go before him in the spirit and power of Elias, to turn the hearts of the fathers to the children, and the disobedient to the wisdom of the just; to make ready a people prepared for Yahuah (Lord)* (Luke 1:17). The angel told Zacharias the same thing before John was born: he comes in the spirit and power of Elijah, turning hearts and making ready a people — the office Malachi promised, fulfilled.'),

-- THREAD 3 : 11:16-24 this generation — woe to the cities, greater light greater judgment
  ('canon','matthew',11,23,'canon','isaiah',14,13, 'free', E'*For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)... I will be like the El Elyon (most High). Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:13-15). *And thou, Capernaum, which art exalted unto heaven, shalt be brought down to hell* (Matthew 11:23). Yahusha lays the ancient taunt-song of the fallen one over Capernaum: the higher the lifting up, the deeper the fall.'),
  ('canon','matthew',11,23,'canon','isaiah',14,15, 'free', E'*Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:15). The exact phrase Yahusha pronounces over the favoured city — *brought down to hell* — is lifted from Isaiah''s sentence on the proud. Privilege unrepented becomes the heaviest judgment.'),
  ('canon','matthew',11,23,'canon','ezekiel',16,49, 'free', E'*Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy* (Ezekiel 16:49). *If the mighty works... had been done in Sodom, it would have remained until this day* (Matthew 11:23). Ezekiel names Sodom''s sin as comfortable pride that would not help the poor — the very sin of cities that watched the mighty works and would not repent.'),
  ('canon','matthew',11,21,'canon','jonah',3,5, 'free', E'*So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5). *They would have repented long ago in sackcloth and ashes* (Matthew 11:21). Nineveh, a heathen city, repented at one reluctant prophet; Chorazin and Bethsaida saw the mighty works themselves and did not. The pagans'' sackcloth rises up against the privileged.'),
  ('canon','matthew',11,19,'canon','isaiah',61,3, 'free', E'*To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning... that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified* (Isaiah 61:3). *Wisdom is justified of her children* (Matthew 11:19) — the generation pipes and mourns and is pleased with neither John nor the Son, but Wisdom''s true children, the planting of Yahuah, are known by the fruit she bears in them.'),

-- THREAD 4 : 11:25-27 hid from the wise, revealed unto babes — the Father reveals the Son
  ('canon','matthew',11,25,'canon','psalms',8,2, 'free', E'*Out of the mouth of babes and sucklings hast thou ordained strength because of thine enemies, that thou mightest still the enemy and the avenger* (Psalm 8:2). *Thou hast hid these things from the wise and prudent, and hast revealed them unto babes* (Matthew 11:25). What the proud cannot grasp, the lowly receive — the Father ordains his strength in the mouths of babes, just as David sang.'),
  ('canon','matthew',11,25,'canon','isaiah',29,14, 'free', E'*Therefore, behold, I will proceed to do a marvellous work among this people, even a marvellous work and a wonder: for the wisdom of their wise men shall perish, and the understanding of their prudent men shall be hid* (Isaiah 29:14). The very pairing — *wise men* and *prudent men* whose wisdom *shall be hid* — is the pattern Yahusha thanks the Father for: revelation is not earned by cleverness; it is given.'),
  ('canon','matthew',11,25,'canon','daniel',2,21, 'free', E'*And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding* (Daniel 2:21). *He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him* (Daniel 2:22). Daniel learned it in Babylon: the deep things are not seized, they are revealed — by the One who is the source of all knowing.'),
  ('canon','matthew',11,27,'canon','isaiah',11,2, 'free', E'*And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD)* (Isaiah 11:2). *All things are delivered unto me of my Father* (Matthew 11:27) — the Son knows the Father because the Father has given him the Spirit and delivered all things into his hand. He is the Formed Son who HAS a Father; the Father is the source, the Son the one who reveals him to whomever he will.'),
  ('canon','matthew',11,27,'canon','john',6,46, 'free', E'*Not that any man hath seen the Father, save he which is of Elohim (God), he hath seen the Father* (John 6:46). *No man knoweth the Son, but the Father; neither knoweth any man the Father, save the Son* (Matthew 11:27). The Son alone, who is of Elohim, has seen the Father — and he reveals the invisible Father to men. Not two co-equal persons trading knowledge, but the begotten Son making the unseen Father known.'),
  ('canon','matthew',11,25,'canon','luke',10,21, 'free', E'*In that hour Yahusha (Jesus) rejoiced in spirit, and said, I thank thee, O Father, Yahuah (Lord) of heaven and earth, that thou hast hid these things from the wise and prudent, and hast revealed them unto babes: even so, Father; for so it seemed good in thy sight* (Luke 10:21). Luke preserves the same prayer — the Son addressing the Father as Yahuah of heaven and earth, the source from whom revelation flows down to the humble.'),

-- THREAD 5 : 11:28-30 ★★ come unto me — take my yoke — the Torah rightly carried (SHOWCASE)
  ('canon','matthew',11,29,'canon','jeremiah',6,16, 'free', E'*Thus saith Yahuah (LORD), Stand ye in the ways, and see, and ask for the old paths, where is the good way, and walk therein, and ye shall find rest for your souls. But they said, We will not walk therein* (Jeremiah 6:16). When Yahusha says *ye shall find rest unto your souls* (Matthew 11:29) he is quoting Jeremiah word for word. The rest is found in the OLD paths — the ancient good way, the Torah walked in. His yoke is not a new burden replacing the old one; it is the old way carried rightly, the way the prophet pled with Yashar''el to walk.'),
  ('canon','matthew',11,28,'canon','exodus',33,14, 'free', E'*And he said, My presence shall go with thee, and I will give thee rest* (Exodus 33:14). *Come unto me... and I will give you rest* (Matthew 11:28). The rest Yahusha offers is the rest Yahuah promised Moses — his presence going with his people. The Formed Son gives what the Father gave at Sinai: himself, present, and the people at rest.'),
  ('canon','matthew',11,29,'canon','isaiah',28,12, 'free', E'*To whom he said, This is the rest wherewith ye may cause the weary to rest; and this is the refreshing: yet they would not hear* (Isaiah 28:12). Yahuah offered rest and refreshing to the weary, *yet they would not hear.* Yahusha stands in that same place — *Come unto me, all ye that labour and are heavy laden* — offering the rest his people had refused. The invitation is ancient; only the gentleness of the Master makes it bearable.'),
  ('canon','matthew',11,29,'canon','psalms',116,7, 'free', E'*Return unto thy rest, O my soul; for Yahuah (LORD) hath dealt bountifully with thee* (Psalm 116:7). The soul''s true home is rest in Yahuah. *Ye shall find rest unto your souls* (Matthew 11:29) — the same rest of soul the psalmist returned to, now opened to all who come and take the gentle yoke.'),
  ('canon','matthew',11,29,'apocrypha','ecclesiasticus',51,26, 'extras', E'*Put your neck under the yoke, and let your soul receive instruction: she is hard at hand to find* (Sirach 51:26). *Behold with your eyes, how that I have but little labour, and have gotten to me much rest* (Sirach 51:27). Ben Sira speaks of Wisdom — the Torah, the instruction — as a YOKE you put your neck under, and the fruit of bearing it is rest. *Take my yoke upon you, and learn of me... and ye shall find rest unto your souls* (Matthew 11:29) is the same picture exactly: the yoke IS the instruction, and rest is found by carrying it, not by casting it off.'),
  ('canon','matthew',11,29,'canon','isaiah',61,1, 'free', E'*Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted* (Isaiah 61:1). *I am meek and lowly in heart* (Matthew 11:29) — the Master under whose yoke the weary come is the meek Anointed of Isaiah, sent to bind up the broken. The yoke is heavy or light entirely by the gentleness of the one who shares it; this Master is lowly, and so his burden is light.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads -----------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-11-art-thou-he-the-works-prove-messiah-isaiah-35-isaiah-61',
       E'Art thou he that should come — the blind see, the dead are raised (Isaiah 35; Isaiah 61; Isaiah 26)',
       E'John, in Herod''s prison, sends to ask the question every honest heart asks: *Art thou he that should come, or do we look for another?* (Matthew 11:3). Yahusha (Jesus) answers not with a claim but with a list — *The blind receive their sight, and the lame walk, the lepers are cleansed, and the deaf hear, the dead are raised up, and the poor have the gospel preached to them* (Matthew 11:5). Every item on that list was written down by Isaiah centuries before. *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5); *Then shall the lame man leap as an hart, and the tongue of the dumb sing* (Isaiah 35:6). *Yahuah (LORD) hath anointed me to preach good tidings unto the meek* (Isaiah 61:1) — the poor receiving the gospel. *The deaf hear the words of the book, and the eyes of the blind shall see... the poor among men shall rejoice in the Holy One of Yashar''el (Israel)* (Isaiah 29:18-19). And the greatest sign of all: *Thy dead men shall live... Awake and sing, ye that dwell in dust* (Isaiah 26:19). The works ARE the answer, because the works are Isaiah''s own checklist of the days of Yahuah. Luke records the same reply word for word (Luke 7:22). Come and see: the Messiah did not have to argue who he was — the prophets had already filled out the description, and he simply did the things.',
       sv.verse_id, ev.verse_id, 'free', 11300
  FROM _mt11_lookup sv, _mt11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-11-john-the-messenger-elijah-restore-the-tribes-malachi-3-malachi-4-sirach-48',
       E'My messenger, Elijah which was for to come — restore the tribes of Jacob (Malachi 3; Malachi 4; Sirach 48)',
       E'*Among them that are born of women there hath not risen a greater than John the Baptist* (Matthew 11:11) — and Yahusha tells us why. *Behold, I send my messenger before thy face, which shall prepare thy way before thee* (Matthew 11:10) is Malachi quoted: *Behold, I will send my messenger, and he shall prepare the way before me* (Malachi 3:1). John is the messenger of the covenant''s herald, the wilderness voice of Isaiah — *Prepare ye the way of Yahuah (LORD), make straight in the desert a highway* (Isaiah 40:3). More than that: *if ye will receive it, this is Elias, which was for to come* (Matthew 11:14). Malachi named him too — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah* (Malachi 4:5), the prophet who would *turn the heart of the fathers to the children* (Malachi 4:6). And what is the Elijah-work? Ben Sira, reading Malachi two centuries before John was born, already knew: Elijah comes *to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10) — the gathering of the scattered house, Judah and Ephraim, the two sticks made one. The angel said the same of John before his birth: *he shall go before him in the spirit and power of Elias, to turn the hearts of the fathers to the children... to make ready a people prepared for Yahuah* (Luke 1:17). Note well: the very chapter that promises Elijah seals with *Remember ye the law of Moses my servant* (Malachi 4:4). The forerunner turns hearts back to the Torah — he never turns them away from it.',
       sv.verse_id, ev.verse_id, 'extras', 11303
  FROM _mt11_lookup sv, _mt11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=11 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-11-woe-unto-the-cities-greater-light-greater-judgment-isaiah-14-ezekiel-16',
       E'Woe unto Chorazin and Capernaum — brought down to hell (Isaiah 14; Ezekiel 16; Jonah 3)',
       E'This generation is like sullen children who will dance to no tune — they called John mad and the Son a glutton (Matthew 11:16-19) — *but wisdom is justified of her children* (Matthew 11:19), known by the fruit she bears in those who truly receive her (compare Isaiah 61:3, the *trees of righteousness, the planting of Yahuah*). Then comes the woe. *And thou, Capernaum, which art exalted unto heaven, shalt be brought down to hell* (Matthew 11:23) — Yahusha lays the ancient taunt over the favoured town: *I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)... Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:13-15). The phrase is lifted whole from Isaiah''s sentence on the proud one. Sodom would have stood, had it seen such works (Matthew 11:23) — and Ezekiel names Sodom''s sin precisely: *pride, fulness of bread, and abundance of idleness... neither did she strengthen the hand of the poor and needy* (Ezekiel 16:49), the comfortable hardness of cities that watch heaven''s power and shrug. Heathen Nineveh, by contrast, *believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least* (Jonah 3:5) — at one reluctant prophet. The principle is older than the gospel and runs straight through the library: greater light, greater accounting. To whom much is shown, much is required.',
       sv.verse_id, ev.verse_id, 'free', 11306
  FROM _mt11_lookup sv, _mt11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=11 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2',
       E'Hid from the wise, revealed unto babes — no man knoweth the Son but the Father (Psalm 8; Isaiah 29; Daniel 2)',
       E'*I thank thee, O Father, Yahuah (Lord) of heaven and earth, because thou hast hid these things from the wise and prudent, and hast revealed them unto babes* (Matthew 11:25). Revelation is not seized by cleverness; it is GIVEN, and the giver is the Father. David sang it: *Out of the mouth of babes and sucklings hast thou ordained strength* (Psalm 8:2) — the lowly carry what the proud cannot grasp. Isaiah foretold it: *the wisdom of their wise men shall perish, and the understanding of their prudent men shall be hid* (Isaiah 29:14) — the exact pairing, wise and prudent, that Yahusha names. Daniel learned it in exile: *He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him* (Daniel 2:22); *he giveth wisdom unto the wise* (Daniel 2:21). Then the heart of it: *All things are delivered unto me of my Father: and no man knoweth the Son, but the Father; neither knoweth any man the Father, save the Son, and he to whomsoever the Son will reveal him* (Matthew 11:27). Hold this exactly: the Son knows the Father because the Father has DELIVERED all things to him and rested his Spirit upon him — *the spirit of wisdom and understanding, the spirit of counsel and might* (Isaiah 11:2). He is the Formed Son who HAS a Father; the Father is the source, and the Son is the one who makes the invisible Father known — *Not that any man hath seen the Father, save he which is of Elohim (God), he hath seen the Father* (John 6:46). This is not two co-equal persons trading secrets; it is the begotten Son revealing the One who sent him, to whomever he will. Luke preserves the same prayer (Luke 10:21), the Son thanking the Father, Yahuah of heaven and earth, the wellspring of all revelation.',
       sv.verse_id, ev.verse_id, 'free', 11309
  FROM _mt11_lookup sv, _mt11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=11 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51',
       E'Take my yoke upon you — ye shall find rest unto your souls (Jeremiah 6:16; Exodus 33; Sirach 51:26)',
       E'*Come unto me, all ye that labour and are heavy laden, and I will give you rest. Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls. For my yoke is easy, and my burden is light* (Matthew 11:28-30). Hear what Yahusha is doing, because it is the opposite of how this verse is usually preached. *Ye shall find rest unto your souls* is Jeremiah, quoted exactly: *Stand ye in the ways, and see, and ask for the OLD PATHS, where is the good way, and walk therein, and ye shall find rest for your souls* (Jeremiah 6:16). The rest is found by WALKING the old paths — the ancient good way, the Torah trodden rightly — not by laying it down. A yoke in the Scriptures is instruction, discipline, the bearing of the commandment. Ben Sira spells it out: *Put your neck under the yoke, and let your soul receive instruction... Behold with your eyes, how that I have but little labour, and have gotten to me much rest* (Sirach 51:26-27). The yoke IS the instruction; the rest is the FRUIT of carrying it. So when Yahusha says *take my yoke,* he is not lifting the Torah off your shoulders — he is offering to carry it WITH you, as the gentle Master. The rest he gives is the rest Yahuah promised Moses: *My presence shall go with thee, and I will give thee rest* (Exodus 33:14); the rest Yahuah held out to a weary people who *would not hear* (Isaiah 28:12); the rest the psalmist returned to — *Return unto thy rest, O my soul; for Yahuah (LORD) hath dealt bountifully with thee* (Psalm 116:7). What makes the yoke easy is not that it is empty, but that the One sharing it is *meek and lowly in heart* — the very Anointed of Isaiah 61:1, *sent... to bind up the brokenhearted.* Come and see: the burden is light because the Master is gentle, and the old paths, walked beside Him, are the rest your soul was made for.',
       sv.verse_id, ev.verse_id, 'extras', 11312
  FROM _mt11_lookup sv, _mt11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=11 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members ----------------------------------------------------------

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The first two signs of Yahusha''s answer, written in the wilderness song.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-art-thou-he-the-works-prove-messiah-isaiah-35-isaiah-61'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:6 — *Then shall the lame man leap as an hart, and the tongue of the dumb sing.* The lame walk and the deaf hear — the next line of Isaiah''s song.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-art-thou-he-the-works-prove-messiah-isaiah-35-isaiah-61'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 61:1 — *Yahuah hath anointed me to preach good tidings unto the meek.* The poor receiving the gospel is the anointing of Isaiah 61, the climax of the list.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-art-thou-he-the-works-prove-messiah-isaiah-35-isaiah-61'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 29:18-19 — *the deaf hear the words of the book... the poor among men shall rejoice in the Holy One of Yashar''el.* Deaf, blind, and poor bound together exactly as Yahusha binds them.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-art-thou-he-the-works-prove-messiah-isaiah-35-isaiah-61'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 26:19 — *Thy dead men shall live... Awake and sing, ye that dwell in dust.* The dead raised — the last and greatest sign, the resurrection promise breaking in.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-art-thou-he-the-works-prove-messiah-isaiah-35-isaiah-61'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 7:22 — *tell John what things ye have seen and heard; how that the blind see, the lame walk... the dead are raised.* Luke records the same answer word for word.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-art-thou-he-the-works-prove-messiah-isaiah-35-isaiah-61'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:1 — *Behold, I will send my messenger, and he shall prepare the way before me.* The verse Yahusha quotes of John: he is Malachi''s herald.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-john-the-messenger-elijah-restore-the-tribes-malachi-3-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:3 — *The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah.* The messenger of Malachi is the wilderness voice of Isaiah, the same office.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-john-the-messenger-elijah-restore-the-tribes-malachi-3-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah.* John is the promised Elijah, named by Malachi.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-john-the-messenger-elijah-restore-the-tribes-malachi-3-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:6 — *he shall turn the heart of the fathers to the children.* The Elijah-work is reconciliation; the same chapter seals with *Remember ye the law of Moses* (4:4).'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-john-the-messenger-elijah-restore-the-tribes-malachi-3-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 48:10 — *to turn the heart of the father to the son, and to restore the tribes of Jacob.* Ben Sira read the Elijah-mission as the two-house restoration, centuries before John.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-john-the-messenger-elijah-restore-the-tribes-malachi-3-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 1:17 — *he shall go before him in the spirit and power of Elias... to make ready a people prepared for Yahuah.* The angel told Zacharias the same of John before his birth.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-john-the-messenger-elijah-restore-the-tribes-malachi-3-malachi-4-sirach-48'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:13 — *I will ascend into heaven, I will exalt my throne above the stars of Elohim.* The taunt-song of the proud one, laid over the exalted city.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-woe-unto-the-cities-greater-light-greater-judgment-isaiah-14-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:15 — *Yet thou shalt be brought down to hell, to the sides of the pit.* The exact phrase Yahusha pronounces over Capernaum, lifted from Isaiah''s sentence on pride.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-woe-unto-the-cities-greater-light-greater-judgment-isaiah-14-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 16:49 — *the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness... neither did she strengthen the hand of the poor.* Sodom''s sin = comfortable hardness before the poor — the sin of cities that shrug at heaven''s works.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-woe-unto-the-cities-greater-light-greater-judgment-isaiah-14-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jonah 3:5 — *the people of Nineveh believed Elohim... and put on sackcloth, from the greatest of them even to the least.* Heathen Nineveh repented at one reluctant prophet; the privileged cities, seeing the works, did not.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-woe-unto-the-cities-greater-light-greater-judgment-isaiah-14-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 61:3 — *trees of righteousness, the planting of Yahuah, that he might be glorified.* *Wisdom is justified of her children* — known by the fruit she bears in those who truly receive her.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-woe-unto-the-cities-greater-light-greater-judgment-isaiah-14-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 8:2 — *Out of the mouth of babes and sucklings hast thou ordained strength.* The lowly carry what the proud cannot grasp; the Father ordains his strength in babes.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 29:14 — *the wisdom of their wise men shall perish, and the understanding of their prudent men shall be hid.* The exact pairing — wise and prudent — whose wisdom is hid; revelation is given, not earned.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 2:21 — *he giveth wisdom unto the wise* and *revealeth the deep and secret things* (2:22). Daniel learned in exile: the deep things are revealed by the source of all knowing, not seized.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:2 — *the spirit of Yahuah shall rest upon him, the spirit of wisdom and understanding.* The Son knows the Father because the Father rested his Spirit upon him and delivered all things to him — the Formed Son who HAS a Father.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 6:46 — *Not that any man hath seen the Father, save he which is of Elohim, he hath seen the Father.* The Son alone, who is of Elohim, makes the invisible Father known — not two co-equal persons trading knowledge.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 10:21 — *I thank thee, O Father, Yahuah of heaven and earth, that thou hast hid these things from the wise and prudent.* Luke preserves the same prayer: the Son thanking the Father, the wellspring of revelation.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-hid-from-the-wise-revealed-unto-babes-the-father-reveals-the-son-psalm-8-isaiah-29-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 6:16 — *ask for the OLD PATHS, where is the good way, and walk therein, and ye shall find rest for your souls.* Yahusha quotes it word for word: the rest is found by walking the ancient way, the Torah trodden rightly — not by laying it down.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 33:14 — *My presence shall go with thee, and I will give thee rest.* The rest Yahusha offers is the rest Yahuah promised Moses: his presence going with his people.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 28:12 — *This is the rest wherewith ye may cause the weary to rest... yet they would not hear.* Yahusha stands where Yahuah stood, offering the rest the weary had refused.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 116:7 — *Return unto thy rest, O my soul; for Yahuah hath dealt bountifully with thee.* The soul''s true home is rest in Yahuah — the same rest of soul now opened to all who take the gentle yoke.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=116 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 51:26 — *Put your neck under the yoke, and let your soul receive instruction... I have but little labour, and have gotten to me much rest* (51:27). Ben Sira: the yoke IS the instruction (the Torah/Wisdom), and rest is the fruit of bearing it — not of casting it off. The direct witness behind *take my yoke.*'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=51 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 61:1 — *Yahuah hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted.* What makes the yoke light is that the Master is *meek and lowly* — the very Anointed of Isaiah 61, sent to bind up the broken.'
  FROM cross_reference_threads t, cross_references x, _mt11_lookup sv, _mt11_lookup tv
 WHERE t.slug='matthew-11-come-unto-me-take-my-yoke-the-old-paths-rest-for-your-souls-jeremiah-6-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
