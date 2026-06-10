-- ----- fragment: minion_revelation_08.sql (S224 Revelation 8) -----
-- =====================================================================
-- S224 minion — REVELATION 8 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 8 (13 verses) — the seventh seal opened, silence in heaven, the seven
--   trumpets given, the prayers of the saints with incense, the censer cast to the earth, and
--   the first four trumpet-plagues re-speaking the Exodus on a cosmic scale.
-- Tag: rv08 (temp view _s224_rv08_lookup).
-- Sort band: floor 9175, step 3 (9175, 9178, 9181, 9184, 9187, 9190, 9193 used; under 9200).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: The trumpets of Revelation 8 are not a secret-rapture escape-clock; they are
-- the day of Yahuah (LORD) breaking upon the earth in the very words of the Exodus — hail and
-- fire, the waters to blood, the bitter waters, the sun and moon darkened — the same Yahuah who
-- judged Egypt now judging the whole earth, with the prayers of his saints rising as the incense
-- that sets it all in motion. The censer of wrath is filled FROM the altar where the saints'
-- prayers were just offered: the judgment answers the cry of the righteous (the *how long* of the
-- fifth seal, 6:10). The seven trumpets are the priestly silver trumpets of Numbers 10 sounded on
-- a cosmic scale — the assembly gathered, the alarm of war, the memorial before Elohim (God). No
-- Trinitarian grammar surfaces; the One on the throne and the Lamb are distinguished, and the
-- angels minister, they are not worshipped.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     silence in heaven about the space of half an hour
--           Tanakh: Habakkuk 2:20 (let all the earth keep silence before him), Zephaniah 1:7
--                   (hold thy peace at the presence of Adonai Yahuah), Zechariah 2:13 (be silent,
--                   O all flesh, before Yahuah)
--           Extras: none warranted   NT: none warranted (carried in the trumpet thread)
--   v.2,6   the seven angels and the seven trumpets prepared to sound
--           Tanakh: Numbers 10:9 (blow an alarm... ye shall be remembered before Yahuah),
--                   Numbers 10:10 (a memorial before your Elohim), Joel 2:1 (blow the trumpet in
--                   Zion... the day of Yahuah cometh)
--           Extras: none warranted   NT: none warranted
--   v.3-4   the prayers of all saints with much incense ascending before Elohim
--           Tanakh: Psalm 141:2 (let my prayer be set forth before thee as incense), Exodus 30:1
--                   (an altar to burn incense upon), Exodus 30:7 (Aaron shall burn sweet incense)
--           Extras: Tobit 12:15 (Raphael... which present the prayers of the saints), Tobit 12:12
--                   (I did bring the remembrance of your prayers before the Holy One), 1 Enoch
--                   47:1 (ascended the prayer of the righteous... before Yahuah of Spirits),
--                   1 Enoch 99:3 (raise your prayers as a memorial... before the angels)
--           NT: Revelation 5:8 (golden vials full of odours, which are the prayers of saints)
--   v.5     the censer filled with fire of the altar, cast into the earth
--           Tanakh: Ezekiel 10:2 (fill thine hand with coals of fire from between the cherubims,
--                   and scatter them over the city)
--           Extras: none warranted   NT: none warranted
--   v.7-9   hail and fire mingled with blood; the burning mountain; the third of the sea to blood
--           Tanakh: Exodus 9:23 (Yahuah sent thunder and hail, and the fire ran along), Exodus
--                   9:24 (hail, and fire mingled with the hail), Exodus 7:20 (the waters... turned
--                   to blood), Exodus 7:21 (the fish... died), Jeremiah 51:25 (O destroying
--                   mountain... I will make thee a burnt mountain)
--           Extras: none warranted   NT: none warranted
--   v.10-11 the star Wormwood; the third of the waters made bitter
--           Tanakh: Jeremiah 9:15 (I will feed them... with wormwood, and give them water of
--                   gall), Jeremiah 23:15 (I will feed them with wormwood), Exodus 15:23 (the
--                   waters of Marah... they were bitter)
--           Extras: none warranted   NT: none warranted
--   v.12-13 the sun/moon/stars a third darkened; the eagle's threefold Woe
--           Tanakh: Exodus 10:21 (darkness over the land of Egypt), Exodus 10:22 (thick darkness
--                   three days), Joel 2:10 (the sun and the moon shall be dark, and the stars
--                   shall withdraw their shining), Isaiah 13:10 (the stars... shall not give their
--                   light: the sun shall be darkened)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9175 revelation-8-silence-in-heaven-before-yahuah-habakkuk-2                                  (Tanakh)
--   9178 revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10                           (Tanakh)
--   9181 revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30                  (Tanakh + Extras + NT)
--   9184 revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10                            (Tanakh)
--   9187 revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9                (Tanakh)
--   9190 revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15                (Tanakh)
--   9193 revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2                     (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-8-silence-in-heaven-before-yahuah-habakkuk-2
  ('canon', 'revelation', 8, 1, 'canon', 'habakkuk', 2, 20, 'free', E'*But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him.* (Habakkuk 2:20). When the seventh seal is opened *there was silence in heaven about the space of half an hour* (Revelation 8:1) — and the seer is hearing the prophet. The silence is not emptiness but the hush of the whole creation before the One enthroned in his holy temple; heaven itself falls still as the earth is bidden to, for the day of his judgment is about to break. The prayers of the saints are about to be answered, and before the answer comes, all flesh holds its breath.'),
  ('canon', 'revelation', 8, 1, 'canon', 'zephaniah', 1, 7, 'free', E'*Hold thy peace at the presence of Adonai Yahuah (the Lord GOD): for the day of Yahuah (LORD) is at hand: for Yahuah (LORD) hath prepared a sacrifice, he hath bid his guests.* (Zephaniah 1:7). The *silence in heaven* (Revelation 8:1) is the silence Zephaniah commands when the day of Yahuah (LORD) draws near — *hold thy peace at the presence of Adonai Yahuah (the Lord GOD).* The half-hour of stillness is the pause before the trumpets, the held breath of a creation that knows the day of slaughter has been prepared and the guests bidden; the same dread day the prophets named is breaking, and heaven goes quiet before it.'),
  ('canon', 'revelation', 8, 1, 'canon', 'zechariah', 2, 13, 'free', E'*Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation.* (Zechariah 2:13). Zechariah calls *all flesh* to silence because Yahuah (LORD) is *raised up out of his holy habitation* to act — and that is exactly the moment of *silence in heaven* (Revelation 8:1). The seventh seal opens, and before a single trumpet sounds, the silence falls: Yahuah (LORD) is rising up out of his holy place to judge, and the only fitting answer of every creature, in heaven and on earth, is to be still.'),
  -- thread: revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10
  ('canon', 'revelation', 8, 2, 'canon', 'numbers', 10, 9, 'free', E'*And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies.* (Numbers 10:9). The *seven trumpets* given to the seven angels (Revelation 8:2) are the silver trumpets of the wilderness sounded on a cosmic scale. In the camp the alarm-blast was the cry that brought Yashar''el (Israel) to mind before Yahuah Elohaychem (the LORD your God) in the day of battle — *ye shall be remembered* — and so the trumpet-blasts of heaven are the remembrance of the saints'' prayers turned into the alarm of war against the oppressor of the earth.'),
  ('canon', 'revelation', 8, 6, 'canon', 'numbers', 10, 10, 'free', E'*Also in the day of your gladness, and in your solemn days, and in the beginnings of your months, ye shall blow with the trumpets over your burnt offerings, and over the sacrifices of your peace offerings; that they may be to you for a memorial before your Elohim (God): I am Yahuah Elohaychem (the LORD your God).* (Numbers 10:10). When *the seven angels which had the seven trumpets prepared themselves to sound* (Revelation 8:6), the instrument is the priestly trumpet of Numbers — blown to make *a memorial before your Elohim (God).* The trumpets that once sounded over the offerings of Yashar''el (Israel) now sound the memorial of the saints'' incense-prayers just offered at the golden altar, and the answer to that memorial is the judgment that follows.'),
  ('canon', 'revelation', 8, 6, 'canon', 'joel', 2, 1, 'free', E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* (Joel 2:1). Joel''s trumpet announces *the day of Yahuah (LORD)* — and that is the day the seven angels are *prepared... to sound* (Revelation 8:6). The blast in Zion that made the inhabitants tremble is the same blast taken up by the seven trumpets of heaven; the day Joel saw *nigh at hand* now breaks upon the earth, and the trembling of the land answers the alarm.'),
  -- thread: revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30
  ('canon', 'revelation', 8, 3, 'canon', 'exodus', 30, 1, 'free', E'*And thou shalt make an altar to burn incense upon: of shittim wood shalt thou make it.* (Exodus 30:1). The *golden altar which was before the throne* (Revelation 8:3) is the heavenly pattern of the altar of incense Yahuah (LORD) commanded Moses to make. The angel with the golden censer stands at the very altar the tabernacle copied — the place where the sweet smoke rose before the veil — and there he offers *much incense... with the prayers of all saints,* the earthly furniture of worship shown to be the shadow of a real altar in the presence of Elohim (God).'),
  ('canon', 'revelation', 8, 3, 'canon', 'exodus', 30, 7, 'free', E'*And Aaron shall burn thereon sweet incense every morning: when he dresseth the lamps, he shall burn incense upon it.* (Exodus 30:7). The priest''s daily office — Aaron burning *sweet incense* on the golden altar — is what the angel performs in heaven: *there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar* (Revelation 8:3). The morning and evening incense that ascended in the holy place was always the figure of prayer rising before Yahuah (LORD); here the figure becomes the thing itself, the prayers of the saints carried up in the smoke.'),
  ('canon', 'revelation', 8, 4, 'canon', 'psalms', 141, 2, 'free', E'*Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* (Psalm 141:2). David prayed that his prayer might rise *as incense,* and Revelation shows the prayer and the incense made one: *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). What the psalmist asked for is granted in heaven — the prayers of all the saints go up as the evening sacrifice, set forth before the throne and received.'),
  ('canon', 'revelation', 8, 4, 'apocrypha', 'tobit', 12, 15, 'extras', E'*I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15). The angel at the golden altar who carries the saints'' prayers up before Elohim (God) (Revelation 8:3-4) does the very work Raphael named — *one of the seven holy angels, which present the prayers of the saints.* The seven angels of Revelation 8:2 and the seven holy ones who *go in and out before the glory of the Holy One* are the same heavenly order; the incense rising with the prayers is the presenting of those prayers before the throne.'),
  ('canon', 'revelation', 8, 3, 'apocrypha', 'tobit', 12, 12, 'extras', E'*Now therefore, when you did pray, and Sara your daughter in law, I did bring the remembrance of your prayers before the Holy One: and when you did bury the dead, I was with you likewise.* (Tobit 12:12). Raphael tells how the prayers of the righteous are handled in heaven — *I did bring the remembrance of your prayers before the Holy One* — and that is the angel''s office in Revelation: he offers *the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3). The prayers are not lost in the air; a holy one bears their remembrance up before the presence of Elohim (God), and the answer comes down in the trumpets.'),
  ('canon', 'revelation', 8, 4, 'enoch', '1-enoch', 47, 1, 'extras', E'*And in those days shall have ascended the prayer of the righteous, And the blood of the righteous from the earth before Yahuah (God) of Spirits.* (1 Enoch 47:1). The restored library saw the same ascending prayer that Revelation shows rising in the incense-smoke: *the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). In Enoch the prayer of the righteous and the blood of the righteous go up together before Yahuah (God) of Spirits, and the throne answers in judgment — the very pattern of Revelation 8, where the prayers rise and then the censer of fire is cast to the earth.'),
  ('canon', 'revelation', 8, 4, 'enoch', '1-enoch', 99, 3, 'extras', E'*In those days make ready, ye righteous, to raise your prayers as a memorial, And place them as a testimony before the angels, That they may place the sin of the sinners for a memorial before the Most High.* (1 Enoch 99:3). Enoch bids the righteous *raise your prayers as a memorial... before the angels* — and in Revelation an angel does exactly that, offering the incense *with the prayers of all saints* so that they *ascended up before Elohim (God)* (Revelation 8:4). The prayers are a memorial laid before the Most High, and the same fire-bearing angel who carries them up then casts the fire of the altar to the earth (8:5): the memorial of the righteous becomes the judgment on the sinners.'),
  ('canon', 'revelation', 8, 3, 'canon', 'revelation', 5, 8, 'free', E'*And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* (Revelation 5:8). What the elders held in golden vials at the throne — *odours, which are the prayers of saints* — is now offered at the altar: *much incense, that he should offer it with the prayers of all saints* (Revelation 8:3). The book sealed in chapter 5 and the prayers gathered in golden vials there are taken up here; the incense of the saints'' prayers, stored before the throne, is at last poured out as the seals give way to the trumpets and the day of Yahuah (LORD) begins.'),
  -- thread: revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10
  ('canon', 'revelation', 8, 5, 'canon', 'ezekiel', 10, 2, 'free', E'*And he spake unto the man clothed with linen, and said, Go in between the wheels, even under the cherub, and fill thine hand with coals of fire from between the cherubims, and scatter them over the city. And he went in in my sight.* (Ezekiel 10:2). The angel who *took the censer, and filled it with fire of the altar, and cast it into the earth* (Revelation 8:5) is enacting the vision Ezekiel saw: the man in linen bidden to *fill thine hand with coals of fire from between the cherubims, and scatter them over the city.* The same fire that burned at the altar of prayer is taken as the fire of judgment and flung to the earth, and *there were voices, and thunderings, and lightnings, and an earthquake* — the throne-fire answering the prayers it had just received.'),
  -- thread: revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9
  ('canon', 'revelation', 8, 7, 'canon', 'exodus', 9, 24, 'free', E'*So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation.* (Exodus 9:24). The first trumpet brings *hail and fire mingled with blood* (Revelation 8:7), and it is the seventh plague of Egypt sounded over the whole earth — *hail, and fire mingled with the hail.* The judgment that fell on Pharaoh''s land *such as there was none like it* now falls on the third part of the earth; the same Yahuah (LORD) who smote Egypt smites the oppressor of his saints, the Exodus enlarged to the day of his wrath.'),
  ('canon', 'revelation', 8, 7, 'canon', 'exodus', 9, 23, 'free', E'*And Moses stretched forth his rod toward heaven: and Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground; and Yahuah (LORD) rained hail upon the land of Egypt.* (Exodus 9:23). When the first angel sounded, *there followed hail and fire... and they were cast upon the earth: and the third part of trees was burnt up, and all green grass was burnt up* (Revelation 8:7). Moses stretched his rod and *the fire ran along upon the ground,* burning Egypt''s field; the trumpet does the same to the third part of the earth. The hand that rained hail upon Pharaoh is the hand at work in the trumpet, the plague-pattern unmistakable.'),
  ('canon', 'revelation', 8, 8, 'canon', 'jeremiah', 51, 25, 'free', E'*Behold, I am against thee, O destroying mountain, saith Yahuah (LORD), which destroyest all the earth: and I will stretch out mine hand upon thee, and roll thee down from the rocks, and will make thee a burnt mountain.* (Jeremiah 51:25). The second trumpet casts *as it were a great mountain burning with fire... into the sea* (Revelation 8:8), and Jeremiah had already named the *burnt mountain* — Babylon, the *destroying mountain* Yahuah (LORD) would make a charred ruin and roll down. The mountain that *destroyest all the earth* is itself burned and hurled down; the proud world-power that oppressed Zion becomes the burning mountain cast into the sea, and the third part of the sea becomes blood.'),
  ('canon', 'revelation', 8, 8, 'canon', 'exodus', 7, 20, 'free', E'*And Moses and Aaron did so, as Yahuah (LORD) commanded; and he lifted up the rod, and smote the waters that were in the river, in the sight of Pharaoh, and in the sight of his servants; and all the waters that were in the river were turned to blood.* (Exodus 7:20). *The third part of the sea became blood* (Revelation 8:8) re-speaks the first plague of Egypt, when the waters of the Nile *were turned to blood.* The judgment Moses called down upon Pharaoh''s river is poured out over the sea of the whole earth; the same Yahuah (LORD) who turned Egypt''s waters to blood turns the third part of the sea, and the Exodus plague becomes the trumpet-plague.'),
  ('canon', 'revelation', 8, 9, 'canon', 'exodus', 7, 21, 'free', E'*And the fish that was in the river died; and the river stank, and the Egyptians could not drink of the water of the river; and there was blood throughout all the land of Egypt.* (Exodus 7:21). At the second trumpet *the third part of the creatures which were in the sea, and had life, died* (Revelation 8:9) — and the blood-plague of Egypt killed the river''s life the same way: *the fish that was in the river died.* The dying of the sea-creatures and the wreck of the ships answer the dying of Egypt''s fish; the waters that turned to blood under Moses turn to blood and death under the trumpet, the plague spread from one river to the third part of the sea.'),
  -- thread: revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15
  ('canon', 'revelation', 8, 11, 'canon', 'jeremiah', 9, 15, 'free', E'*Therefore thus saith Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of Yashar''el (Israel); Behold, I will feed them, even this people, with wormwood, and give them water of gall to drink.* (Jeremiah 9:15). The third trumpet names the fallen star *Wormwood,* and *the third part of the waters became wormwood; and many men died of the waters, because they were made bitter* (Revelation 8:11). Jeremiah had named the judgment of *wormwood* and *water of gall* given to a people who walked after their own heart; the bitter draught the prophet pronounced is poured into the rivers and fountains of the earth, the waters of life turned to a cup of death.'),
  ('canon', 'revelation', 8, 11, 'canon', 'jeremiah', 23, 15, 'free', E'*Therefore thus saith Yahuah Tseva''ot (LORD of hosts) concerning the prophets; Behold, I will feed them with wormwood, and make them drink the water of gall: for from the prophets of Jerusalem is profaneness gone forth into all the land.* (Jeremiah 23:15). Twice Jeremiah pronounced the sentence of *wormwood* and *the water of gall,* here upon the false prophets whose profaneness filled the land — and the third trumpet makes the very name a star: *the name of the star is called Wormwood* (Revelation 8:11). The bitter judgment the prophet spoke against corruption becomes a cosmic plague; the waters made bitter answer the bitterness of those who turned the people from Yahuah (LORD).'),
  ('canon', 'revelation', 8, 11, 'canon', 'exodus', 15, 23, 'free', E'*And when they came to Marah, they could not drink of the waters of Marah, for they were bitter: therefore the name of it was called Marah.* (Exodus 15:23). At Marah the waters were *bitter* and could not be drunk, and the place was named for its bitterness; the third trumpet turns the third part of the waters bitter so that *many men died of the waters, because they were made bitter* (Revelation 8:11). The bitter waters of the wilderness, which Yahuah (LORD) made sweet for his redeemed, become in the day of judgment the bitter waters of death for the inhabiters of the earth — the same sign, the mercy withheld.'),
  -- thread: revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2
  ('canon', 'revelation', 8, 12, 'canon', 'exodus', 10, 22, 'free', E'*And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days:* (Exodus 10:22). The fourth trumpet smites *the third part of the sun... the moon... the stars... so as the third part of them was darkened* (Revelation 8:12), and the ninth plague of Egypt is its root: *thick darkness in all the land of Egypt three days.* The darkness Moses brought over Pharaoh''s land by stretching his hand toward heaven now falls over the lights of heaven themselves; the plague that blinded Egypt is enlarged until the day shines not for a third part of it.'),
  ('canon', 'revelation', 8, 12, 'canon', 'exodus', 10, 21, 'free', E'*And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt.* (Exodus 10:21). Yahuah (LORD) commanded a *darkness which may be felt* over Egypt, and the fourth trumpet brings a like darkening of *the day* and *the night* (Revelation 8:12). The same word that darkened Pharaoh''s land darkens the sun and moon and stars at the trumpet; the Exodus judgment that fell on the oppressor of Yashar''el (Israel) falls now on the whole earth that oppresses the saints.'),
  ('canon', 'revelation', 8, 12, 'canon', 'joel', 2, 10, 'free', E'*The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining:* (Joel 2:10). Joel saw the day of Yahuah (LORD) darken the heavens — *the sun and the moon shall be dark, and the stars shall withdraw their shining* — and that is the fourth trumpet: *the third part of the sun was smitten, and the third part of the moon, and the third part of the stars* (Revelation 8:12). The darkening Joel announced as the sign of the great and terrible day is the trumpet''s work; the lights of heaven fail as the day of Yahuah (LORD) the prophet foretold breaks upon the earth.'),
  ('canon', 'revelation', 8, 12, 'canon', 'isaiah', 13, 10, 'free', E'*For the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened in his going forth, and the moon shall not cause her light to shine.* (Isaiah 13:10). Isaiah''s oracle of the day of Yahuah (LORD) darkened sun, moon, and stars together — and the fourth trumpet darkens all three: *the third part of the sun... the moon... the stars; so as the third part of them was darkened* (Revelation 8:12). The very lights Isaiah said would not give their light in the day of wrath are smitten at the trumpet, and the eagle''s threefold *Woe, woe, woe* (8:13) follows, the day of Yahuah (LORD) the prophets saw now poured upon the inhabiters of the earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-silence-in-heaven-before-yahuah-habakkuk-2',
       E'Silence in heaven about the space of half an hour — let all the earth keep silence before him (Habakkuk 2)',
       E'When the Lamb opens the last seal, the first thing the seer reports is not a sound but its absence: *And when he had opened the seventh seal, there was silence in heaven about the space of half an hour* (Revelation 8:1). This is the hush the prophets command when the day of Yahuah (LORD) draws near. *But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20) — the silence is the whole creation stilled before the One enthroned in his holy temple. *Hold thy peace at the presence of Adonai Yahuah (the Lord GOD): for the day of Yahuah (LORD) is at hand: for Yahuah (LORD) hath prepared a sacrifice, he hath bid his guests* (Zephaniah 1:7) — the half-hour is the held breath before the day of slaughter the prophet saw prepared. *Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:13) — heaven goes quiet because Yahuah (LORD) is rising up out of his holy place to act. The prayers of the saints are about to be answered and the trumpets about to sound; before the answer comes, every creature in heaven and on earth falls still. The silence is not emptiness. It is reverence before the day of Yahuah (LORD), the pause before the judgment that the saints have been crying for.',
       sv.verse_id, ev.verse_id, 'free', 9175
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10',
       E'The seven trumpets of the seven angels — the silver trumpets of Numbers blown on a cosmic scale (Numbers 10)',
       E'*And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets* (Revelation 8:2), and *the seven angels which had the seven trumpets prepared themselves to sound* (Revelation 8:6). These are the silver trumpets of the wilderness raised to a cosmic pitch. Yahuah (LORD) had told Moses their use: *if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). The alarm-blast was the cry that brought Yashar''el (Israel) to remembrance before Yahuah Elohaychem (the LORD your God) in the day of battle — and so the trumpets of heaven sound the remembrance of the saints'' prayers turned into the alarm of war against the oppressor of the earth. And the trumpet was blown over the offerings to make *a memorial before your Elohim (God): I am Yahuah Elohaychem (the LORD your God)* (Numbers 10:10) — the very memorial of the incense-prayers just offered at the golden altar. Joel names the day the trumpet announces: *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1). The blast that made the inhabitants of the land tremble is taken up by the seven angels; the day of Yahuah (LORD) Joel saw nigh at hand now breaks upon the earth.',
       sv.verse_id, ev.verse_id, 'free', 9178
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30',
       E'The prayers of all saints with much incense ascending before Elohim (God) (Exodus 30, Tobit 12, 1 Enoch 47)',
       E'Between the silence and the trumpets stands the altar, and at it an angel offers the prayers of the saints. *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne. And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:3-4). This *golden altar which was before the throne* is the heavenly pattern of the altar Moses was commanded to build: *thou shalt make an altar to burn incense upon* (Exodus 30:1), where *Aaron shall burn thereon sweet incense every morning* (Exodus 30:7). The daily incense of the holy place was always the figure of prayer rising before Yahuah (LORD) — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2) — and here the figure becomes the thing itself: the prayers of all the saints carried up in the smoke. The restored library names the very office of the angel who bears them. *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One* (Tobit 12:15); *when you did pray... I did bring the remembrance of your prayers before the Holy One* (Tobit 12:12) — the seven holy ones and the seven angels of Revelation are one order, and they bear the prayers up before the throne. So too Enoch saw the prayer of the righteous ascend: *And in those days shall have ascended the prayer of the righteous, And the blood of the righteous from the earth before Yahuah (God) of Spirits* (1 Enoch 47:1), and bade them *raise your prayers as a memorial... before the angels* (1 Enoch 99:3) — the very pattern of Revelation 8, where the prayers rise and the throne answers in fire. And what the elders held in golden vials in the throne-room — *golden vials full of odours, which are the prayers of saints* (Revelation 5:8) — is here poured out at the altar. The prayers are not lost in the air; they are stored before the throne, borne up by a holy one, and at last answered, for the same angel who carries them up then casts the fire of the altar to the earth.',
       sv.verse_id, ev.verse_id, 'extras', 9181
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10',
       E'The censer filled with fire of the altar, cast into the earth — the coals scattered over the city (Ezekiel 10)',
       E'The same censer that carried the saints'' prayers up now becomes the vessel of judgment. *And the angel took the censer, and filled it with fire of the altar, and cast it into the earth: and there were voices, and thunderings, and lightnings, and an earthquake* (Revelation 8:5). The seer is watching the vision Ezekiel saw enacted. *And he spake unto the man clothed with linen, and said, Go in between the wheels, even under the cherub, and fill thine hand with coals of fire from between the cherubims, and scatter them over the city. And he went in in my sight* (Ezekiel 10:2). The man in linen was bidden to take fire from between the cherubim and scatter it over the doomed city; the angel of Revelation takes the fire of the altar — the very altar where the prayers were just received — and flings it to the earth. The fire of intercession and the fire of judgment are one fire: the prayers rose, and the answer comes down as thunderings and lightnings and earthquake. The throne-fire answers the cry of the saints, *How long?* (Revelation 6:10), and the day of Yahuah (LORD) begins.',
       sv.verse_id, ev.verse_id, 'free', 9184
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9',
       E'Hail and fire mingled with blood, the burning mountain, the sea to blood — the Exodus plagues enlarged (Exodus 9, Exodus 7, Jeremiah 51)',
       E'The first two trumpets re-speak the plagues of Egypt over the whole earth. *The first angel sounded, and there followed hail and fire mingled with blood, and they were cast upon the earth: and the third part of trees was burnt up, and all green grass was burnt up* (Revelation 8:7) — and this is the seventh plague: *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation* (Exodus 9:24), when *Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground* (Exodus 9:23). The judgment that fell on Pharaoh''s land falls now on the third part of the earth. Then *the second angel sounded, and as it were a great mountain burning with fire was cast into the sea: and the third part of the sea became blood* (Revelation 8:8) — and Jeremiah had named the burning mountain: *Behold, I am against thee, O destroying mountain, saith Yahuah (LORD), which destroyest all the earth... and will make thee a burnt mountain* (Jeremiah 51:25). The proud world-power that oppressed Zion is itself burned and hurled down. And the sea turning to blood re-speaks the first plague: *all the waters that were in the river were turned to blood* (Exodus 7:20), so that *the fish that was in the river died* (Exodus 7:21) — just as now *the third part of the creatures which were in the sea, and had life, died* (Revelation 8:9). The same Yahuah (LORD) who smote Egypt to deliver Yashar''el (Israel) smites the oppressor of his saints; the Exodus is enlarged to the day of his wrath.',
       sv.verse_id, ev.verse_id, 'free', 9187
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15',
       E'The star Wormwood and the waters made bitter — the wormwood of Jeremiah and the bitter waters of Marah (Jeremiah 9, Exodus 15)',
       E'The third trumpet poisons the waters of the earth with a judgment the prophets had named. *And the third angel sounded, and there fell a great star from heaven, burning as it were a lamp, and it fell upon the third part of the rivers, and upon the fountains of waters; And the name of the star is called Wormwood: and the third part of the waters became wormwood; and many men died of the waters, because they were made bitter* (Revelation 8:10-11). The very name is Jeremiah''s sentence: *Behold, I will feed them, even this people, with wormwood, and give them water of gall to drink* (Jeremiah 9:15), spoken against a people who walked after their own heart; and again, *Behold, I will feed them with wormwood, and make them drink the water of gall: for from the prophets of Jerusalem is profaneness gone forth into all the land* (Jeremiah 23:15), against the false prophets who corrupted the people. The bitter draught the prophet pronounced is now a star, and it falls into the rivers and fountains until the waters of life become a cup of death. And behind it stands Marah: *when they came to Marah, they could not drink of the waters of Marah, for they were bitter: therefore the name of it was called Marah* (Exodus 15:23). The bitter waters that Yahuah (LORD) once made sweet for his redeemed become, in the day of judgment, the bitter waters of death for the inhabiters of the earth — the same sign, the mercy withheld.',
       sv.verse_id, ev.verse_id, 'free', 9190
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2',
       E'The sun, moon, and stars a third darkened, and the threefold Woe — the darkness of Egypt and the day of Yahuah (Exodus 10, Joel 2, Isaiah 13)',
       E'The fourth trumpet strikes the lights of heaven, and the eagle cries the threefold woe. *And the fourth angel sounded, and the third part of the sun was smitten, and the third part of the moon, and the third part of the stars; so as the third part of them was darkened, and the day shone not for a third part of it, and the night likewise* (Revelation 8:12). Its root is the ninth plague of Egypt: *And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt* (Exodus 10:21), and *there was a thick darkness in all the land of Egypt three days* (Exodus 10:22). The darkness Moses brought over Pharaoh''s land now falls on the sun and moon and stars themselves. And the prophets had foreseen this darkening as the sign of the day of Yahuah (LORD): *The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining* (Joel 2:10); *For the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened in his going forth, and the moon shall not cause her light to shine* (Isaiah 13:10). The very lights Joel and Isaiah said would fail in the day of wrath are smitten at the trumpet. Then *I beheld, and heard an angel flying through the midst of heaven, saying with a loud voice, Woe, woe, woe, to the inhabiters of the earth by reason of the other voices of the trumpet of the three angels, which are yet to sound* (Revelation 8:13) — three trumpets are spent, and the threefold woe warns that the worst of the day of Yahuah (LORD) is still to come upon the earth.',
       sv.verse_id, ev.verse_id, 'free', 9193
  FROM _s224_rv08_lookup sv, _s224_rv08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-8-silence-in-heaven-before-yahuah-habakkuk-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 2:20 — *Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* the silence in heaven is the hush of all creation before the One in his holy temple (Revelation 8:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-silence-in-heaven-before-yahuah-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zephaniah 1:7 — *Hold thy peace at the presence of Adonai Yahuah (the Lord GOD): for the day of Yahuah (LORD) is at hand* the half-hour silence is the held breath before the day of slaughter the prophet saw prepared (Revelation 8:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-silence-in-heaven-before-yahuah-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 2:13 — *Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* heaven goes quiet because Yahuah is rising up out of his holy place to judge (Revelation 8:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-silence-in-heaven-before-yahuah-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 10:9 — *ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God)* the silver war-alarm of the camp; the trumpets of heaven are the remembrance of the saints turned into the alarm of war (Revelation 8:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 10:10 — *ye shall blow with the trumpets... that they may be to you for a memorial before your Elohim (God)* the priestly trumpet blown over the offerings, now the memorial of the saints'' incense-prayers (Revelation 8:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:1 — *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh, for it is nigh at hand* the blast that made the land tremble; the day Joel saw nigh now breaks at the trumpets (Revelation 8:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-seven-trumpets-of-the-seven-angels-numbers-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 30:1 — *thou shalt make an altar to burn incense upon* the golden altar before the throne is the heavenly pattern the tabernacle copied (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 30:7 — *Aaron shall burn thereon sweet incense every morning* the priest''s daily office of incense, the figure of prayer rising, now performed by the angel (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* David''s petition granted in heaven, the prayers of the saints rising as the evening sacrifice (Revelation 8:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=141 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints* the restored library names the angel''s office: the seven holy ones who bear the prayers before the throne (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 12:12 — *I did bring the remembrance of your prayers before the Holy One* the prayers borne up, not lost in the air; the angel offers them on the golden altar (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 47:1 — *shall have ascended the prayer of the righteous... before Yahuah (God) of Spirits* Enoch saw the same ascending prayer; the throne answers it in judgment (Revelation 8:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Enoch 99:3 — *raise your prayers as a memorial... before the angels* the prayers laid as a memorial before the Most High, the very pattern of the incense-offering (Revelation 8:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=99 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Revelation 5:8 — *golden vials full of odours, which are the prayers of saints* the prayers stored before the throne in chapter 5 are now poured out at the altar (Revelation 8:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-prayers-of-all-saints-with-incense-ascending-exodus-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 10:2 — *fill thine hand with coals of fire from between the cherubims, and scatter them over the city* the angel enacts the vision; the fire of the altar of prayer becomes the fire of judgment cast to the earth (Revelation 8:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-censer-cast-to-the-earth-with-fire-ezekiel-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:24 — *there was hail, and fire mingled with the hail, very grievous* the seventh plague of Egypt; the first trumpet sounds it over the third part of the earth (Revelation 8:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 9:23 — *Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground* Moses stretched his rod and the fire ran over Egypt; the trumpet burns the third part of the earth the same way (Revelation 8:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 51:25 — *O destroying mountain... I will make thee a burnt mountain* the burning mountain cast into the sea is the proud world-power burned and hurled down (Revelation 8:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 7:20 — *all the waters that were in the river were turned to blood* the first plague; the third part of the sea becomes blood at the second trumpet (Revelation 8:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 7:21 — *the fish that was in the river died; and the river stank* the blood-plague killed the river''s life; the trumpet kills the third part of the sea-creatures (Revelation 8:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 9:15 — *I will feed them... with wormwood, and give them water of gall to drink* the prophet''s sentence of wormwood becomes a star; the third part of the waters made bitter (Revelation 8:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 23:15 — *I will feed them with wormwood, and make them drink the water of gall* the same sentence against corruption; the star''s very name is Wormwood (Revelation 8:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 15:23 — *the waters of Marah... they were bitter* the bitter waters Yahuah once made sweet for his redeemed become the bitter waters of death (Revelation 8:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 10:22 — *there was a thick darkness in all the land of Egypt three days* the ninth plague; the fourth trumpet darkens the sun, moon, and stars themselves (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 10:21 — *darkness over the land of Egypt, even darkness which may be felt* the same word that darkened Pharaoh''s land darkens the day and night at the trumpet (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:10 — *the sun and the moon shall be dark, and the stars shall withdraw their shining* the darkening Joel announced as the sign of the day of Yahuah, now the trumpet''s work (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 13:10 — *the stars of heaven... shall not give their light: the sun shall be darkened* the lights Isaiah said would fail in the day of wrath are smitten; the threefold Woe follows (Revelation 8:12-13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv08_lookup sv, _s224_rv08_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
