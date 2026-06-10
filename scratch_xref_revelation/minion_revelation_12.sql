-- ----- fragment: minion_revelation_12.sql (S224 Revelation 12) -----
-- =====================================================================
-- S224 minion — REVELATION 12 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 12 (17 verses) — the woman clothed with the sun, the man child, the great
--   red dragon, war in heaven (Michael and the dragon), the woman fled into the wilderness on
--   eagle's wings, and THE CENTERPIECE — 12:17 the remnant of her seed WHICH KEEP THE COMMANDMENTS
--   of Elohim and have the testimony of Yahusha. THIS IS A BLESSING CHAPTER.
-- Tag: rv12 (temp view _s224_rv12_lookup).
-- Sort band: floor 9275, step 3 (9275, 9278, 9281, 9284, 9287, 9290, 9293 used; under 9300).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Revelation is the consummation of the covenant story — the same Yahuah, the same
-- Torah, the same Yashar'el (Israel) brought to restoration; NOT a rapture-escape, NOT a church that
-- replaced Israel, NOT a Torah abolished). Chapter 12 names the saints by the mark the prophets
-- always named: those who KEEP THE COMMANDMENTS of Elohim (12:17), the Torah-keepers, covenant
-- faithfulness and never legalism. The woman is Yashar'el — Joseph's sun-moon-stars dream (Genesis
-- 37:9) — bearing the messianic deliverer, fled into the wilderness and borne on eagle's wings as at
-- the exodus (Exodus 19:4), the dragon the old serpent of Genesis 3 cast down, the man child caught
-- up to rule with the rod of iron (Psalm 2:9). Christology: the man child is Yahusha (Jesus) the
-- Formed, the slain Lamb by whose blood the saints overcome (12:11). The 12:17 keep-the-commandments
-- mark is woven heavily as the covenant faithfulness of the remnant the prophets named (Malachi 4:4
-- *Remember ye the law of Moses my servant*; Deuteronomy 30:16).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed per verse-block):
--   v.1-2   the woman clothed with the sun, moon under her feet, crown of twelve stars; travailing
--           Tanakh: Genesis 37:9 (sun, moon, eleven stars made obeisance — Joseph's dream, Israel),
--                   Isaiah 54:1 (sing, O barren that didst not travail), Isaiah 54:5 (thy Maker thine
--                   husband), Micah 4:10 (be in pain and labour, O daughter of Zion)
--           Extras: none warranted (the woman-as-Zion 2 Esdras material not pulled; covered in Tanakh)
--           NT: none warranted (carried in prose)
--   v.2,5   she brought forth a man child to rule all nations with a rod of iron; caught up to the throne
--           Tanakh: Isaiah 66:7 (before she travailed she brought forth a man child), Isaiah 66:8
--                   (as soon as Zion travailed she brought forth her children), Micah 5:3 (until she
--                   which travaileth hath brought forth), Psalm 2:9 (break them with a rod of iron)
--           Extras: none warranted   NT: none warranted
--   v.9-10  the great dragon cast out, that old serpent, the Devil and Satan, the accuser cast down
--           Tanakh: Genesis 3:1 (the serpent more subtil), Genesis 3:15 (enmity, bruise thy head),
--                   Job 1:6 (Satan among the sons of Elohim), Zechariah 3:1 (Satan at his right hand to resist)
--           Extras: Wisdom of Solomon 2:24 (through envy of the devil came death into the world)
--           NT: Luke 10:18 (I beheld Satan as lightning fall from heaven), John 12:31 (the prince of
--               this world cast out), Romans 16:20 (the Elohim of peace shall bruise Satan), Revelation
--               20:2 (laid hold on the dragon, that old serpent — the same captor, the final binding)
--   v.7-8   war in heaven; Michael and his angels fought against the dragon
--           Tanakh: Daniel 10:13 (Michael, one of the chief princes, came to help), Daniel 10:21
--                   (Michael your prince), Daniel 12:1 (Michael shall stand up, the great prince)
--           Extras: 1 Enoch 10:11 (Michael sent to bind Semjaza and his associates), 1 Enoch 20:5
--                   (Michael, set over the best part of mankind and over chaos)
--           NT: none warranted (the casting-down NT echoes carried in the serpent thread)
--   v.11    they overcame him by the blood of the Lamb and the word of their testimony
--           Tanakh: Exodus 12:13 (the blood a token; when I see the blood I will pass over you)
--           Extras: none warranted   NT: none warranted
--   v.6,14  the woman fled into the wilderness, nourished, given two wings of a great eagle
--           Tanakh: Exodus 19:4 (I bare you on eagles' wings and brought you unto myself),
--                   Deuteronomy 32:10 (he found him in the waste howling wilderness, kept him as the
--                   apple of his eye), Deuteronomy 32:11 (as an eagle... beareth them on her wings),
--                   Isaiah 40:31 (they shall mount up with wings as eagles), Hosea 2:14 (I will bring
--                   her into the wilderness and speak comfortably unto her)
--           Extras: none warranted   NT: none warranted
--   v.17    THE CENTERPIECE — the remnant which keep the commandments of Elohim and have the testimony
--           Tanakh: Malachi 4:4 (Remember ye the law of Moses my servant), Deuteronomy 30:16 (love
--                   Yahuah, keep his commandments, that thou mayest live), Deuteronomy 30:14 (the word
--                   is very nigh thee, in thy mouth and in thy heart, that thou mayest do it)
--           Extras: none warranted (the keep-commandments extras carried at Rev 14 / elsewhere)
--           NT: Revelation 14:12 (here are they that keep the commandments of Elohim and the faith of
--               Yahusha — the chapter's twin), 1 John 5:3 (this is the love of Elohim, that we keep
--               his commandments: and his commandments are not grievous)
--
-- THREADS (slug -> target libraries):
--   9275 revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37            (Tanakh)
--   9278 revelation-12-she-brought-forth-a-man-child-to-rule-with-a-rod-of-iron-psalm-2         (Tanakh)
--   9281 revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3                 (Tanakh + Extras + NT)
--   9284 revelation-12-michael-and-his-angels-fought-against-the-dragon-daniel-10-and-12        (Tanakh + Extras)
--   9287 revelation-12-overcame-by-the-blood-of-the-lamb-and-the-word-of-their-testimony-exodus-12  (Tanakh)
--   9290 revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19       (Tanakh)
--   9293 revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4              (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s224_rv12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37
  ('canon', 'revelation', 12, 1, 'canon', 'genesis', 37, 9, 'free', E'*And he dreamed yet another dream, and told it his brethren, and said, Behold, I have dreamed a dream more; and, behold, the sun and the moon and the eleven stars made obeisance to me.* (Genesis 37:9). The woman of the vision wears the very signs of Joseph''s dream — *a woman clothed with the sun, and the moon under her feet, and upon her head a crown of twelve stars* (Revelation 12:1). The sun, the moon, the stars: this is the house of Yashar''el (Israel), Jacob and Rachel and the twelve sons, the covenant family the dream first sketched. The woman is no new thing and no replacement; she is the people of the promise, clothed in the lights of heaven, carrying the seed.'),
  ('canon', 'revelation', 12, 2, 'canon', 'isaiah', 54, 1, 'free', E'*Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* (Isaiah 54:1). The woman *being with child cried, travailing in birth, and pained to be delivered* (Revelation 12:2). Isaiah set the figure long before: Zion as the travailing woman whose desolation turns to a multitude of children. The pangs are real and the deliverance is sure — the daughter of Zion in labour, bringing forth the seed of promise out of her affliction.'),
  ('canon', 'revelation', 12, 1, 'canon', 'isaiah', 54, 5, 'free', E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called.* (Isaiah 54:5). The woman *clothed with the sun* (Revelation 12:1) is the wife of Yahuah (LORD), the espoused of the covenant — *thy Maker is thine husband.* She is not an abstraction but the bride of the Holy One of Yashar''el (Israel), the people he took to himself; and it is from her, his own, that the deliverer comes.'),
  ('canon', 'revelation', 12, 2, 'canon', 'micah', 4, 10, 'free', E'*Be in pain, and labour to bring forth, O daughter of Zion, like a woman in travail: for now shalt thou go forth out of the city, and thou shalt dwell in the field, and thou shalt go even to Babylon; there shalt thou be delivered; there Yahuah (LORD) shall redeem thee from the hand of thine enemies.* (Micah 4:10). The travail of the woman *pained to be delivered* (Revelation 12:2) is the travail Micah named — the daughter of Zion labouring through exile and dwelling in the field, yet promised deliverance and redemption from her enemies'' hand. Her labour ends not in loss but in the redeeming of the seed.'),
  -- thread: revelation-12-she-brought-forth-a-man-child-to-rule-with-a-rod-of-iron-psalm-2
  ('canon', 'revelation', 12, 5, 'canon', 'isaiah', 66, 7, 'free', E'*Before she travailed, she brought forth; before her pain came, she was delivered of a man child.* (Isaiah 66:7). John''s words are Isaiah''s words: *And she brought forth a man child* (Revelation 12:5). The seer reaches back to the prophet''s own astonishing sign — Zion delivered of *a man child* — and lays it over the woman of the vision. The deliverer she bears is the one Isaiah saw, brought forth out of the travailing people.'),
  ('canon', 'revelation', 12, 5, 'canon', 'isaiah', 66, 8, 'free', E'*Who hath heard such a thing? who hath seen such things? Shall the earth be made to bring forth in one day? or shall a nation be born at once? for as soon as Zion travailed, she brought forth her children.* (Isaiah 66:8). The man child the woman *brought forth* (Revelation 12:5) comes from the same travail in which *Zion travailed, she brought forth her children.* The birth of the deliverer and the birth of the nation are one wonder — the people of the promise and the one who rules them, brought forth together out of Zion''s pangs.'),
  ('canon', 'revelation', 12, 5, 'canon', 'micah', 5, 3, 'free', E'*Therefore will he give them up, until the time that she which travaileth hath brought forth: then the remnant of his brethren shall return unto the children of Yashar''el (Israel).* (Micah 5:3). Micah binds the travailing woman, the birth of the ruler, and the return of the remnant into one promise; the man child *brought forth* (Revelation 12:5) is the ruler whose coming is the hinge — *she which travaileth hath brought forth* — after which *the remnant of his brethren shall return unto the children of Yashar''el (Israel).* The birth opens the gathering home.'),
  ('canon', 'revelation', 12, 5, 'canon', 'psalms', 2, 9, 'free', E'*Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* (Psalm 2:9). The man child *was to rule all nations with a rod of iron* (Revelation 12:5) — the very sceptre of the anointed Son of the second Psalm, to whom Yahuah (LORD) says *Ask of me, and I shall give thee the heathen for thine inheritance.* The deliverer caught up *unto Elohim (God), and to his throne* (Revelation 12:5) is the King set on the holy hill of Zion, the Formed Son who reigns; his throne is the Father''s throne, and the nations are his inheritance.'),
  -- thread: revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3
  ('canon', 'revelation', 12, 9, 'canon', 'genesis', 3, 1, 'free', E'*Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1). When the seer names the dragon *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9), he reaches all the way back to the garden. The deceiver who whispered *hath Elohim (God) said* to the first woman is the same adversary now cast out — the lie that has run from Eden to the end is one lie, and its author is one and the same old serpent.'),
  ('canon', 'revelation', 12, 9, 'canon', 'genesis', 3, 15, 'free', E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The war of *the dragon... with the remnant of her seed* (Revelation 12:9,17) is the enmity Yahuah Elohim (the LORD God) declared in the garden — *between thy seed and her seed.* The whole chapter is that first promise unfolding: the woman, her seed, the serpent, and the head that is bruised. The casting-down of the old serpent is the head-crushing begun, the ancient sentence coming to pass.'),
  ('canon', 'revelation', 12, 10, 'canon', 'job', 1, 6, 'free', E'*Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them.* (Job 1:6). The loud voice cries that *the accuser of our brethren is cast down, which accused them before our Elohim (God) day and night* (Revelation 12:10). This is the accuser of Job''s day — Satan come among the sons of Elohim (God) to lay his charge against the righteous. His office was always the accusing; and the voice from heaven declares that office ended, the accuser thrown down.'),
  ('canon', 'revelation', 12, 10, 'canon', 'zechariah', 3, 1, 'free', E'*And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* (Zechariah 3:1). The *accuser of our brethren... cast down, which accused them before our Elohim (God) day and night* (Revelation 12:10) is the Satan of Zechariah''s vision, standing to resist the high priest and accuse him before Yahuah (LORD). There the answer was *Yahuah (LORD) rebuke thee, O Satan*; here the rebuke is final — the resister cast out of heaven, the brethren no longer accused.'),
  ('canon', 'revelation', 12, 9, 'apocrypha', 'the-wisdom-of-solomon', 2, 24, 'extras', E'*Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* (Wisdom of Solomon 2:24). The Hebrew library knew the dragon by his oldest work: *through envy of the devil came death into the world.* So when *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9) is cast out, the one cast down is death''s author — the envy that beguiled the garden and brought mortality on the children of Adam. To overcome him by the blood of the Lamb is to overturn the very death he loosed.'),
  ('canon', 'revelation', 12, 9, 'canon', 'luke', 10, 18, 'free', E'*And he said unto them, I beheld Satan as lightning fall from heaven.* (Luke 10:18). Yahusha (Jesus) had already seen what the vision shows: *he was cast out into the earth, and his angels were cast out with him* (Revelation 12:9). The fall of the adversary is no late surprise but a thing the Master beheld — *I beheld Satan as lightning fall from heaven* — the dominion of the deceiver broken as the kingdom of Elohim (God) drew near.'),
  ('canon', 'revelation', 12, 9, 'canon', 'john', 12, 31, 'free', E'*Now is the judgment of this world: now shall the prince of this world be cast out.* (John 12:31). The casting-out of *the great dragon... that old serpent* (Revelation 12:9) is the very sentence Yahusha (Jesus) pronounced as his hour came: *now shall the prince of this world be cast out.* The cross is the throwing-down; the man child caught up to the throne is the prince of this world undone, the usurper expelled from his place.'),
  ('canon', 'revelation', 12, 10, 'canon', 'romans', 16, 20, 'free', E'*And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* (Romans 16:20). The casting-down of the accuser and the coming of *salvation, and strength, and the kingdom of our Elohim (God)* (Revelation 12:10) is the bruising Paul promised the saints: *the Elohim (God) of peace shall bruise Satan under your feet shortly.* It is the Genesis 3:15 head-crushing reaching down to the feet of the seed — the people who overcome share in the victory of the man child.'),
  ('canon', 'revelation', 12, 9, 'canon', 'revelation', 20, 2, 'free', E'*And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* (Revelation 20:2). The same fourfold name returns at the end of the book: the dragon *cast out into the earth* (Revelation 12:9) is *laid hold on... that old serpent, which is the Devil, and Satan, and bound* (Revelation 20:2). What chapter twelve begins — the throwing-down — chapter twenty completes in the binding; one adversary, one undoing, from his expulsion from heaven to his chaining in the pit.'),
  -- thread: revelation-12-michael-and-his-angels-fought-against-the-dragon-daniel-10-and-12
  ('canon', 'revelation', 12, 7, 'canon', 'daniel', 10, 13, 'free', E'*But the prince of the kingdom of Persia withstood me one and twenty days: but, lo, Michael, one of the chief princes, came to help me; and I remained there with the kings of Persia.* (Daniel 10:13). *Michael and his angels fought against the dragon* (Revelation 12:7) — the same Michael who came to the aid of the messenger in Daniel''s vision, *one of the chief princes,* the warrior over against the princes of the kingdoms. The war in heaven is the unseen battle Daniel was shown, now brought to its decisive hour.'),
  ('canon', 'revelation', 12, 7, 'canon', 'daniel', 10, 21, 'free', E'*But I will shew thee that which is noted in the scripture of truth: and there is none that holdeth with me in these things, but Michael your prince.* (Daniel 10:21). Michael who *fought against the dragon* (Revelation 12:7) is named in Daniel as *your prince* — the prince set for the people of Yashar''el (Israel). His battle against the dragon is a battle for the woman and her seed; the prince of the covenant people contends against the accuser of the brethren.'),
  ('canon', 'revelation', 12, 7, 'canon', 'daniel', 12, 1, 'free', E'*And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). The rising of *Michael and his angels* (Revelation 12:7) is the standing-up Daniel foretold — *Michael... the great prince which standeth for the children of thy people* — and it brings the deliverance of all *found written in the book.* The war in heaven and the deliverance of the people are one event: Michael stands, the dragon falls, the saints are saved.'),
  ('canon', 'revelation', 12, 7, 'enoch', '1-enoch', 10, 11, 'extras', E'*And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* (1 Enoch 10:11). The restored library remembers Michael as the appointed warrior against the rebel powers: it was Michael whom Yahuah (God) sent to *bind* the chief of the fallen and his associates. So when *Michael and his angels fought against the dragon* (Revelation 12:7), it is the same archangel doing the same office — the binder of the rebels set against the great rebel himself.'),
  ('canon', 'revelation', 12, 7, 'enoch', '1-enoch', 20, 5, 'extras', E'*Michael, one of the holy and honoured angels, who is set over the best part of mankind and over chaos.* (1 Enoch 20:5). The library names Michael''s very charge: *set over the best part of mankind* — over the people of the promise — *and over chaos.* That is exactly his work in the vision: *Michael and his angels fought against the dragon* (Revelation 12:7), the guardian of the covenant people warring against the chaos-serpent who would devour the woman''s child.'),
  -- thread: revelation-12-overcame-by-the-blood-of-the-lamb-and-the-word-of-their-testimony-exodus-12
  ('canon', 'revelation', 12, 11, 'canon', 'exodus', 12, 13, 'free', E'*And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* (Exodus 12:13). *And they overcame him by the blood of the Lamb* (Revelation 12:11) — the blood that overcomes is the Passover blood, the token on the door before which the destroyer must pass over. As the lamb''s blood shielded the houses of Yashar''el (Israel) in Egypt, so the blood of the Lamb shields the brethren from the accuser; the exodus deliverance is the pattern of the saints'' victory.'),
  -- thread: revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19
  ('canon', 'revelation', 12, 14, 'canon', 'exodus', 19, 4, 'free', E'*Ye have seen what I did unto the Egyptians, and how I bare you on eagles'' wings, and brought you unto myself.* (Exodus 19:4). *And to the woman were given two wings of a great eagle, that she might fly into the wilderness* (Revelation 12:14) — the very deliverance of the exodus, for Yahuah (LORD) bore his people out of Egypt *on eagles'' wings.* The woman carried into the wilderness is Yashar''el (Israel) carried again, the rescue of Sinai re-enacted; the eagle''s wings are the Father''s own bearing of his own.'),
  ('canon', 'revelation', 12, 14, 'canon', 'deuteronomy', 32, 11, 'free', E'*As an eagle stirreth up her nest, fluttereth over her young, spreadeth abroad her wings, taketh them, beareth them on her wings:* (Deuteronomy 32:11). The *two wings of a great eagle* given the woman (Revelation 12:14) are the wings of the song of Moses — Yahuah (LORD) as the eagle who *spreadeth abroad her wings... beareth them on her wings.* The figure for the Father''s care of his people in the wilderness becomes the figure for the keeping of the woman; he who bore Yashar''el (Israel) of old bears her still.'),
  ('canon', 'revelation', 12, 6, 'canon', 'deuteronomy', 32, 10, 'free', E'*He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye.* (Deuteronomy 32:10). *And the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there* (Revelation 12:6). The wilderness is not abandonment but the place of keeping — where Yahuah (LORD) *found* his people and *kept him as the apple of his eye.* The woman nourished in the wilderness is the people sheltered and fed by the Father in the very wasteland, as he sheltered them of old.'),
  ('canon', 'revelation', 12, 14, 'canon', 'isaiah', 40, 31, 'free', E'*But they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint.* (Isaiah 40:31). The woman given *two wings of a great eagle* (Revelation 12:14) flies with the strength Isaiah promised to those who wait on Yahuah (LORD) — *they shall mount up with wings as eagles.* The eagle''s wings are the renewed strength of the waiting people, lifting the woman beyond the reach of the serpent''s flood.'),
  ('canon', 'revelation', 12, 14, 'canon', 'hosea', 2, 14, 'free', E'*Therefore, behold, I will allure her, and bring her into the wilderness, and speak comfortably unto her.* (Hosea 2:14). The woman *nourished for a time, and times, and half a time* in the wilderness (Revelation 12:14) is the bride Hosea saw led there to be wooed: *I will allure her, and bring her into the wilderness, and speak comfortably unto her.* The wilderness is the place of betrothal and tenderness, where Yahuah (LORD) renews his covenant with his wife — the woman nourished there is the people brought back to her first love.'),
  -- thread: revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4
  ('canon', 'revelation', 12, 17, 'canon', 'malachi', 4, 4, 'free', E'*Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* (Malachi 4:4). The remnant of the woman''s seed are marked out by one thing — they *keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ)* (Revelation 12:17). This is the charge with which the prophets closed the old covenant and opened the day of Yahuah (LORD): *Remember ye the law of Moses my servant... with the statutes and judgments.* The saints of the end are the keepers of that very law — the covenant faithfulness Malachi named, carried unbroken to the last generation.'),
  ('canon', 'revelation', 12, 17, 'canon', 'deuteronomy', 30, 16, 'free', E'*In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* (Deuteronomy 30:16). To *keep the commandments of Elohim (God)* (Revelation 12:17) is the way of life Moses set before the people — *to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments... that thou mayest live.* The remnant''s commandment-keeping is no burden and no legalism; it is love and life, the covenant walk that brings the blessing — the same choosing of life held out at the edge of the land.'),
  ('canon', 'revelation', 12, 17, 'canon', 'deuteronomy', 30, 14, 'free', E'*But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14). The commandments the remnant *keep* (Revelation 12:17) are never far off or beyond reach — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The keeping is the doing of a word already given and already near, written on the heart of the covenant people; the remnant simply hold fast what was always within reach.'),
  ('canon', 'revelation', 12, 17, 'canon', 'revelation', 14, 12, 'free', E'*Here is the patience of the saints: here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus).* (Revelation 14:12). The book says it twice, and the second saying is the seal of the first: the remnant *which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ)* (Revelation 12:17) are *they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus)* (Revelation 14:12). Commandment-keeping and the faith of Yahusha (Jesus) are bound together as the two marks of one people — never set against each other, but joined as the patience of the saints.'),
  ('canon', 'revelation', 12, 17, 'canon', '1-john', 5, 3, 'free', E'*For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* (1 John 5:3). The remnant *which keep the commandments of Elohim (God)* (Revelation 12:17) keep them as the very shape of their love — *this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The keeping is not a yoke laid against grace but the love of the saints answering the love of the Father; his commandments are not grievous to those who are his.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37',
       E'The woman clothed with the sun — the travail of Zion, the house of Yashar''el (Israel) (Genesis 37)',
       E'*And there appeared a great wonder in heaven; a woman clothed with the sun, and the moon under her feet, and upon her head a crown of twelve stars* (Revelation 12:1). The signs are Joseph''s dream: *behold, the sun and the moon and the eleven stars made obeisance to me* (Genesis 37:9) — the sun and moon Jacob and Rachel, the stars the sons, the whole house of Yashar''el (Israel). The woman is no new thing and no replacement people; she is the covenant family of the promise, clothed in the lights of heaven, carrying the seed. And she travails: *she being with child cried, travailing in birth, and pained to be delivered* (Revelation 12:2). The prophets had drawn this woman long before. She is the Zion of Isaiah whose desolation turns to a multitude — *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife* (Isaiah 54:1) — the wife of Yahuah (LORD) himself: *thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). And she is the labouring daughter of Zion of Micah, brought through exile to deliverance: *Be in pain, and labour to bring forth, O daughter of Zion, like a woman in travail... there shalt thou be delivered; there Yahuah (LORD) shall redeem thee from the hand of thine enemies* (Micah 4:10). The pangs are real; the deliverance is sure. The woman in labour is the covenant people bringing forth, out of her affliction, the seed of promise.',
       sv.verse_id, ev.verse_id, 'free', 9275
  FROM _s224_rv12_lookup sv, _s224_rv12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-12-she-brought-forth-a-man-child-to-rule-with-a-rod-of-iron-psalm-2',
       E'She brought forth a man child to rule with a rod of iron — the King of Zion caught up to the throne (Psalm 2)',
       E'*And she brought forth a man child, who was to rule all nations with a rod of iron: and her child was caught up unto Elohim (God), and to his throne* (Revelation 12:5). Every phrase is a prophet''s word brought to its hour. The birth itself is Isaiah''s astonishing sign: *Before she travailed, she brought forth; before her pain came, she was delivered of a man child* (Isaiah 66:7), the same travail in which the nation is born — *as soon as Zion travailed, she brought forth her children* (Isaiah 66:8). The deliverer and the people come forth together out of Zion''s pangs. Micah binds the same birth to the gathering home: *until the time that she which travaileth hath brought forth: then the remnant of his brethren shall return unto the children of Yashar''el (Israel)* (Micah 5:3) — the birth opens the return. And the rule he is born to is the sceptre of the anointed Son of the second Psalm: *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9), to whom Yahuah (LORD) says *Ask of me, and I shall give thee the heathen for thine inheritance.* The man child *caught up unto Elohim (God), and to his throne* is Yahusha (Jesus), the Formed Son, the King set on the holy hill of Zion — and the throne he is caught up to is the Father''s own throne, where he reigns with the nations for his inheritance.',
       sv.verse_id, ev.verse_id, 'free', 9278
  FROM _s224_rv12_lookup sv, _s224_rv12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3',
       E'That old serpent, the Devil and Satan, cast down — the accuser thrown out of heaven (Genesis 3)',
       E'*And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him* (Revelation 12:9). The seer names the dragon by his oldest name, and the name reaches back to the garden: *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said* (Genesis 3:1). The deceiver who first whispered *hath Elohim (God) said* is the same adversary now thrown down — one lie running from Eden to the end. And the whole chapter is the first promise unfolding: *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — the woman, her seed, the serpent, the bruised head, all here. His office was accusing: *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them* (Job 1:6); *Satan standing at his right hand to resist him* (Zechariah 3:1). And the voice from heaven declares that office ended — *the accuser of our brethren is cast down, which accused them before our Elohim (God) day and night* (Revelation 12:10). The Hebrew library knew him as death''s author: *through envy of the devil came death into the world* (Wisdom of Solomon 2:24). And the New Testament saw the throwing-down begin in the hour of the Messiah — *I beheld Satan as lightning fall from heaven* (Luke 10:18); *now shall the prince of this world be cast out* (John 12:31) — and reaching to the feet of the saints: *the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). What begins here ends in the binding: *he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years* (Revelation 20:2). One adversary, one undoing, from his expulsion from heaven to his chaining in the pit.',
       sv.verse_id, ev.verse_id, 'extras', 9281
  FROM _s224_rv12_lookup sv, _s224_rv12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=12 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-12-michael-and-his-angels-fought-against-the-dragon-daniel-10-and-12',
       E'Michael and his angels fought against the dragon — the prince who standeth for the people (Daniel 10 and 12)',
       E'*And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels, And prevailed not; neither was their place found any more in heaven* (Revelation 12:7-8). Michael is the warrior Daniel was shown — the unseen battle behind the kingdoms of the earth. *Lo, Michael, one of the chief princes, came to help me* (Daniel 10:13); he is named *your prince* (Daniel 10:21), the prince set for the covenant people; and his rising is the deliverance of that people: *And at that time shall Michael stand up, the great prince which standeth for the children of thy people... and at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). The war in heaven and the saving of the saints are one event — Michael stands, the dragon falls, the people are delivered. The restored library remembers the same Michael at the same office, the appointed binder of the rebel powers: *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates''* (1 Enoch 10:11); *Michael, one of the holy and honoured angels, who is set over the best part of mankind and over chaos* (1 Enoch 20:5). Set over the best part of mankind — the people of the promise — and over chaos: that is exactly his work in the vision, the guardian of the woman warring against the chaos-serpent who would devour her child.',
       sv.verse_id, ev.verse_id, 'extras', 9284
  FROM _s224_rv12_lookup sv, _s224_rv12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-12-overcame-by-the-blood-of-the-lamb-and-the-word-of-their-testimony-exodus-12',
       E'They overcame by the blood of the Lamb — the Passover blood on the door (Exodus 12)',
       E'*And they overcame him by the blood of the Lamb, and by the word of their testimony; and they loved not their lives unto the death* (Revelation 12:11). The blood that overcomes the accuser is the Passover blood. *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt* (Exodus 12:13). As the blood of the lamb on the door-posts shielded the houses of Yashar''el (Israel) so that the destroyer passed over, so the blood of the Lamb shields the brethren so that the accuser''s charge cannot destroy them. The exodus deliverance is the pattern of the saints'' victory — not their own strength but the blood, and the word of their testimony, and a love that did not cling to its own life. The same Lamb whose blood marked the doors in Egypt marks the people who overcome the dragon.',
       sv.verse_id, ev.verse_id, 'free', 9287
  FROM _s224_rv12_lookup sv, _s224_rv12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19',
       E'Two wings of a great eagle into the wilderness — Yashar''el (Israel) borne and nourished as at the exodus (Exodus 19)',
       E'*And the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there* (Revelation 12:6); *And to the woman were given two wings of a great eagle, that she might fly into the wilderness, into her place, where she is nourished for a time, and times, and half a time, from the face of the serpent* (Revelation 12:14). This is the exodus re-enacted. The eagle''s wings are the wings of Sinai: *Ye have seen what I did unto the Egyptians, and how I bare you on eagles'' wings, and brought you unto myself* (Exodus 19:4). They are the wings of the song of Moses: *As an eagle stirreth up her nest, fluttereth over her young, spreadeth abroad her wings... beareth them on her wings* (Deuteronomy 32:11). And the wilderness is not abandonment but the place of keeping, where Yahuah (LORD) found his people of old: *He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10). The wings are the renewed strength of the waiting people — *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles* (Isaiah 40:31) — and the wilderness is the place of betrothal and tenderness, where the bride is wooed back to her first love: *behold, I will allure her, and bring her into the wilderness, and speak comfortably unto her* (Hosea 2:14). He who bore Yashar''el (Israel) out of Egypt bears her still, shelters her, feeds her, and renews her beyond the serpent''s reach.',
       sv.verse_id, ev.verse_id, 'free', 9290
  FROM _s224_rv12_lookup sv, _s224_rv12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=12 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4',
       E'The remnant which keep the commandments of Elohim (God) — the Torah-keepers the prophets named (Malachi 4)',
       E'*And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ)* (Revelation 12:17). Here the whole book lifts its banner over the saints, and marks them out by one thing: they *keep the commandments of Elohim (God).* This is the very charge with which the prophets closed the old covenant and opened the day of Yahuah (LORD): *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* (Malachi 4:4). The remnant of the end are the keepers of that law — the covenant faithfulness Malachi named, carried unbroken to the last generation. And this keeping is no burden and no legalism; it is the way of life Moses set before the people at the edge of the land: *I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee* (Deuteronomy 30:16). It is love and life, the covenant walk that brings the blessing — and it is never far off, never beyond reach: *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). The book seals it by saying the same thing twice: *Here is the patience of the saints: here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus)* (Revelation 14:12). Commandment-keeping and the faith of Yahusha (Jesus) are bound together as the two marks of one people, never set against each other. And the keeping is the very shape of their love: *this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3). The remnant the dragon makes war on are the woman''s own seed — the covenant people, keeping the commandments their Father gave, holding the testimony of Yahusha (Jesus); and against them the old serpent cannot prevail.',
       sv.verse_id, ev.verse_id, 'free', 9293
  FROM _s224_rv12_lookup sv, _s224_rv12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=12 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:9 — *the sun and the moon and the eleven stars made obeisance to me* Joseph''s dream of the house of Yashar''el (Israel); the woman wears its signs, the covenant family clothed in the lights of heaven (Revelation 12:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 54:1 — *Sing, O barren... thou that didst not travail with child* Zion the travailing woman whose desolation turns to a multitude of children; the figure of the woman in labour (Revelation 12:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:5 — *thy Maker is thine husband... thy Redeemer the Holy One of Yashar''el (Israel)* the woman is the wife of Yahuah (LORD), the espoused covenant people from whom the deliverer comes (Revelation 12:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Micah 4:10 — *Be in pain, and labour to bring forth, O daughter of Zion... there Yahuah (LORD) shall redeem thee* the daughter of Zion labouring through exile to deliverance; her travail ends in redemption, not loss (Revelation 12:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-12-she-brought-forth-a-man-child-to-rule-with-a-rod-of-iron-psalm-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:7 — *Before she travailed, she brought forth... she was delivered of a man child* Isaiah''s sign of Zion delivered of a man child; John''s words are the prophet''s (Revelation 12:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-she-brought-forth-a-man-child-to-rule-with-a-rod-of-iron-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:8 — *as soon as Zion travailed, she brought forth her children* the deliverer and the nation born together out of Zion''s pangs (Revelation 12:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-she-brought-forth-a-man-child-to-rule-with-a-rod-of-iron-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Micah 5:3 — *until... she which travaileth hath brought forth: then the remnant of his brethren shall return* the birth of the ruler opens the gathering home of the remnant (Revelation 12:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-she-brought-forth-a-man-child-to-rule-with-a-rod-of-iron-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 2:9 — *Thou shalt break them with a rod of iron* the sceptre of the anointed Son; the man child caught up to the throne is the King of Zion, the Formed Son (Revelation 12:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-she-brought-forth-a-man-child-to-rule-with-a-rod-of-iron-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *the serpent was more subtil... Yea, hath Elohim (God) said* the deceiver of the garden is the same old serpent now cast out; one lie from Eden to the end (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *enmity between... thy seed and her seed; it shall bruise thy head* the war of the dragon with the woman''s seed is the garden enmity unfolding, the head-crushing begun (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 1:6 — *Satan came also among them* the accuser of Job''s day come among the sons of Elohim (God); his office of accusing now ended (Revelation 12:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 3:1 — *Satan standing at his right hand to resist him* the resister of the high priest; here cast out, the brethren no longer accused (Revelation 12:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 2:24 — *through envy of the devil came death into the world* the Hebrew library knows the dragon as death''s author; the one cast down loosed the death the Lamb''s blood overturns (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 10:18 — *I beheld Satan as lightning fall from heaven* the Master had already seen the fall the vision shows; the deceiver''s dominion broken (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'John 12:31 — *now shall the prince of this world be cast out* the casting-out is the sentence Yahusha (Jesus) pronounced as his hour came; the cross is the throwing-down (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Romans 16:20 — *the Elohim (God) of peace shall bruise Satan under your feet shortly* the Genesis 3:15 head-crushing reaching to the feet of the seed; the saints share the man child''s victory (Revelation 12:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Revelation 20:2 — *laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him* the same fourfold name; what ch.12 begins in the casting-down, ch.20 completes in the binding (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-12-michael-and-his-angels-fought-against-the-dragon-daniel-10-and-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 10:13 — *Michael, one of the chief princes, came to help me* the warrior of Daniel''s vision, the unseen battle behind the kingdoms (Revelation 12:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-michael-and-his-angels-fought-against-the-dragon-daniel-10-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 10:21 — *Michael your prince* the prince set for the covenant people; his battle against the dragon is a battle for the woman and her seed (Revelation 12:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-michael-and-his-angels-fought-against-the-dragon-daniel-10-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *Michael... the great prince which standeth for the children of thy people... thy people shall be delivered* the war in heaven and the deliverance of the saints are one event (Revelation 12:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-michael-and-his-angels-fought-against-the-dragon-daniel-10-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: Go, bind Semjâzâ and his associates* the restored library''s Michael, the appointed binder of the rebel powers; the same archangel, the same office (Revelation 12:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-michael-and-his-angels-fought-against-the-dragon-daniel-10-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 20:5 — *Michael... set over the best part of mankind and over chaos* his very charge — guardian of the people of promise against the chaos-serpent who would devour the child (Revelation 12:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-michael-and-his-angels-fought-against-the-dragon-daniel-10-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-12-overcame-by-the-blood-of-the-lamb-and-the-word-of-their-testimony-exodus-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:13 — *when I see the blood, I will pass over you* the Passover blood on the door; the blood of the Lamb shields the brethren from the accuser as the lamb''s blood shielded the houses in Egypt (Revelation 12:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-overcame-by-the-blood-of-the-lamb-and-the-word-of-their-testimony-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:4 — *how I bare you on eagles'' wings, and brought you unto myself* the exodus deliverance; the woman carried into the wilderness is Yashar''el (Israel) carried again (Revelation 12:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:11 — *As an eagle... spreadeth abroad her wings... beareth them on her wings* the wings of the song of Moses; the Father''s bearing of his people becomes the keeping of the woman (Revelation 12:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:10 — *He found him... in the waste howling wilderness... kept him as the apple of his eye* the wilderness as the place of keeping, not abandonment; the woman sheltered and fed there (Revelation 12:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 40:31 — *they shall mount up with wings as eagles* the renewed strength of the waiting people, lifting the woman beyond the serpent''s flood (Revelation 12:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hosea 2:14 — *I will allure her, and bring her into the wilderness, and speak comfortably unto her* the wilderness as the place of betrothal; the woman nourished there brought back to her first love (Revelation 12:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 4:4 — *Remember ye the law of Moses my servant... with the statutes and judgments* the charge that closes the old covenant and opens the day of Yahuah (LORD); the remnant of the end are the keepers of that law (Revelation 12:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:16 — *to keep his commandments... that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee* keeping the commandments is the way of life and blessing, never legalism (Revelation 12:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:14 — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* the commandments are near and within reach; the remnant hold fast what was always given (Revelation 12:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 14:12 — *here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus)* the book''s twin saying; commandment-keeping and the faith of Yahusha (Jesus) bound as one people''s two marks (Revelation 12:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 John 5:3 — *this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* the keeping is the shape of the saints'' love, not a yoke against grace (Revelation 12:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv12_lookup sv, _s224_rv12_lookup tv
 WHERE t.slug='revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
