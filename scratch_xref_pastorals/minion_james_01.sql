-- ----- fragment: minion_james_01.sql (S239 James 1) -----
-- =====================================================================
-- S239 minion — JAMES 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: JAMES 1 (27 verses) — the wisdom-of-the-two-house-remnant letter opens.
-- Tag: j239c1 (temp view _s239_j239c1_lookup).
-- Sort band: floor 8800, step 3 (8800,8803,8806,8809,8812,8815,8818,8821,8824 used; under 8830).
-- Source is ALWAYS the canon James verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (James = Proverbs and Sirach made apostolic, written to the twelve tribes which are
-- scattered abroad — the dispersed two-house remnant of Yashar'el, the Torah-keeping assembly; the
-- whole letter assumes the Torah is in force and kept. Chapter 1: trials counted joy and faith tried
-- as gold; wisdom asked of Elohim; the rich as the flower of grass; the guard that no man is tempted
-- of Elohim — the lust is man's own; the Father of lights with whom is no variableness; swift to hear;
-- and the load-bearing center — be ye DOERS of the word, not hearers only, looking into the perfect
-- law of liberty, the Torah AFFIRMED, not abolished, not a new law, not freedom-from-the-law; pure
-- religion visiting the fatherless and widows. No replacement theology, no law-vs-grace antithesis.
-- Christology: every good gift cometh down from the Father of lights — the Father the source.)
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     to the twelve tribes which are scattered abroad
--           Tanakh: Deuteronomy 30:1-4 (gather thee from all the nations), Ezekiel 37:21-22 (one
--                   nation, no more two), Isaiah 11:11-12 (the dispersed... outcasts gathered)
--           Extras: none warranted   NT: 1 Peter 1:1 (the strangers scattered — same address)
--   v.2-4,12 count it all joy / the trying of your faith / blessed is he that endureth, tried
--           Tanakh: Proverbs 17:3 (the furnace for gold: Yahuah trieth the hearts)
--           Extras: Sirach 2:1-5 (prepare for temptation... gold is tried in the fire), Wisdom of
--                   Solomon 3:5-6 (proved them... as gold in the furnace tried them)
--           NT: none warranted (the joy-in-trial root is the wisdom library)
--   v.5     if any lack wisdom, let him ask of Elohim
--           Tanakh: Proverbs 2:3-6 (Yahuah giveth wisdom: out of his mouth cometh knowledge)
--           Extras: none warranted (carried in prose; Wisdom 7/9 belong to ch3's wisdom thread)
--           NT: none warranted
--   v.10-11 the rich as the flower of the grass shall pass away
--           Tanakh: Isaiah 40:6-8 (all flesh is grass... the word of our Elohim shall stand),
--                   Psalm 103:15-16 (man's days as grass... the wind passeth over it)
--           Extras: none warranted   NT: 1 Peter 1:24 (all flesh is as grass)
--   v.13-15 let no man say, I am tempted of Elohim — the lust is man's own [GUARD]
--           Tanakh: Proverbs 19:3 (the foolishness of man... his heart fretteth against Yahuah)
--           Extras: Sirach 15:11 (say not, It is through Yahuah that I fell away), Sirach 15:14
--                   (made man... left him in the hand of his counsel)
--           NT: none warranted
--   v.17    the Father of lights, with whom is no variableness
--           Tanakh: Malachi 3:6 (I am Yahuah, I change not), Numbers 23:19 (Elohim is not a man,
--                   that he should lie), Genesis 1:14 (let there be lights in the firmament)
--           Extras: none warranted   NT: none warranted
--   v.19    swift to hear, slow to speak, slow to wrath
--           Tanakh: Proverbs 10:19 (in the multitude of words wanteth not sin), Proverbs 17:27 (he
--                   that hath knowledge spareth his words), Ecclesiastes 5:1-2 (let thy words be few)
--           Extras: Sirach 5:11 (be swift to hear... with patience give answer)
--           NT: none warranted
--   v.22-25 be ye DOERS of the word, not hearers only / the perfect law of liberty [BLESSING]
--           Tanakh: Psalm 19:7 (the law of Yahuah is perfect), Psalm 119:45 (I will walk at liberty:
--                   for I seek thy precepts), Exodus 24:7 (all that Yahuah hath said will we do),
--                   Ezekiel 33:31-32 (they hear thy words, but they do them not), Deuteronomy 5:1
--                   (learn them, and keep, and do them)
--           Extras: none warranted   NT: Matthew 7:24-27 (whoso heareth and doeth them, on the rock),
--                   Romans 2:13 (the doers of the law shall be justified)
--   v.26-27 pure religion: visit the fatherless and widows in their affliction
--           Tanakh: Isaiah 1:16-17 (plead for the widow), Deuteronomy 10:18 (judgment of the
--                   fatherless and widow), Psalm 68:5 (a father of the fatherless), Isaiah 58:6-7
--                   (deal thy bread to the hungry), Exodus 22:22 (afflict not any widow)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8800 james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37  (Tanakh + NT)  [★ two-house]
--   8803 james-1-the-trying-of-your-faith-counted-joy-as-gold-tried-in-the-fire-proverbs-17-sirach-2    (Tanakh + Extras)
--   8806 james-1-if-any-lack-wisdom-let-him-ask-of-elohim-proverbs-2                                    (Tanakh)
--   8809 james-1-the-rich-as-the-flower-of-the-grass-shall-pass-away-isaiah-40-psalm-103                (Tanakh + NT)
--   8812 james-1-let-no-man-say-i-am-tempted-of-elohim-the-lust-his-own-sirach-15-proverbs-19           (Tanakh + Extras)  [GUARD]
--   8815 james-1-the-father-of-lights-with-whom-is-no-variableness-malachi-3-numbers-23                 (Tanakh)
--   8818 james-1-swift-to-hear-slow-to-speak-slow-to-wrath-proverbs-10-sirach-5                         (Tanakh + Extras)
--   8821 james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33      (Tanakh + NT)  [★★ BLESSING]
--   8824 james-1-pure-religion-to-visit-the-fatherless-and-widows-isaiah-1-deuteronomy-10               (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s239_j239c1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37
  ('canon', 'james', 1, 1, 'canon', 'deuteronomy', 30, 3, 'free', E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* (Deuteronomy 30:3). James writes *to the twelve tribes which are scattered abroad* (James 1:1) — the very dispersion Moses foretold, the scattered seed Yahuah (LORD) pledged to gather *from all the nations.* The address is not a metaphor for a generic church; it is the covenant people in dispersion, the twelve tribes whom Yahuah (LORD) will *return and gather.* James writes to them as those being brought home.'),
  ('canon', 'james', 1, 1, 'canon', 'deuteronomy', 30, 4, 'free', E'*If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee:* (Deuteronomy 30:4). However far driven, *unto the outmost parts of heaven,* the gathering is sure — *from thence will Yahuah (LORD)... fetch thee.* James names them *the twelve tribes which are scattered abroad* (James 1:1): the outcasts at the outmost parts, to whom the half-brother of Yahusha (Jesus) writes the wisdom of the kingdom while the regathering of Yashar''el (Israel) is underway.'),
  ('canon', 'james', 1, 1, 'canon', 'ezekiel', 37, 21, 'free', E'*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21). The two-sticks prophecy names the same scattered people James addresses: the children of Yashar''el (Israel) *gathered... on every side.* *The twelve tribes which are scattered abroad* (James 1:1) are the very ones Adonai Yahuah (the Lord GOD) takes *from among the heathen* — the dispersion that ends in one land.'),
  ('canon', 'james', 1, 1, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). The end of the scattering is the two houses made *one nation... no more two nations.* James writes *to the twelve tribes which are scattered abroad* (James 1:1): the dispersed of both houses, addressed together as the one people being knit into one nation under one King — the literal twelve tribes, not a replacement.'),
  ('canon', 'james', 1, 1, 'canon', 'isaiah', 11, 12, 'free', E'*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12). The regathering reaches both houses — *the outcasts of Yashar''el (Israel)* and *the dispersed of Yahudah (Judah)* — from *the four corners of the earth.* These are *the twelve tribes which are scattered abroad* (James 1:1): the outcasts and the dispersed of the whole house, the ensign already raised, the assembly underway.'),
  ('canon', 'james', 1, 1, 'canon', '1-peter', 1, 1, 'free', E'*Peter, an apostle of Yahusha HaMashiach (Jesus Christ), to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia,* (1 Peter 1:1). The other pillar wrote the same address to the same people: *the strangers scattered.* James salutes *the twelve tribes which are scattered abroad* (James 1:1) and Peter *the strangers scattered* — the dispersed of Yashar''el (Israel) in the nations, the two-house remnant to whom the apostles of the circumcision wrote, holding the Torah and awaiting the gathering.'),
  -- thread: james-1-the-trying-of-your-faith-counted-joy-as-gold-tried-in-the-fire-proverbs-17-sirach-2
  ('canon', 'james', 1, 3, 'canon', 'proverbs', 17, 3, 'free', E'*The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts.* (Proverbs 17:3). As the furnace tries gold, so *Yahuah (LORD) trieth the hearts.* James names the same proving: *the trying of your faith worketh patience* (James 1:3), the testing that purifies. The trial is not Elohim''s (God''s) cruelty but his refining — the heart put to the furnace and brought out tried, that patience may have *her perfect work* (James 1:4).'),
  ('canon', 'james', 1, 2, 'apocrypha', 'ecclesiasticus', 2, 1, 'extras', E'*My son, if you come to serve Yahuah (God), prepare your soul for temptation.* (Sirach 2:1). The wisdom library set the very posture James commands: the one who comes to serve Yahuah (God) must *prepare your soul for temptation* — and so *count it all joy when ye fall into divers temptations* (James 1:2). Trial is not the surprise of the faithless but the expected schooling of the servant; James re-speaks Sirach''s counsel, that the trial be met not with dismay but with steadfastness.'),
  ('canon', 'james', 1, 3, 'apocrypha', 'ecclesiasticus', 2, 5, 'extras', E'*For gold is tried in the fire, and acceptable men in the furnace of adversity.* (Sirach 2:5). Here is the image beneath James''s words: *gold is tried in the fire, and acceptable men in the furnace of adversity.* So *the trying of your faith worketh patience* (James 1:3) — the believer is the gold, the trial the fire, the patience the proof. The furnace does not destroy the acceptable; it makes them acceptable, *perfect and entire, wanting nothing* (James 1:4).'),
  ('canon', 'james', 1, 12, 'apocrypha', 'the-wisdom-of-solomon', 3, 6, 'extras', E'*As gold in the furnace has he tried them, and received them as a burnt offering.* (Wisdom of Solomon 3:6). The Wisdom of Solomon reads the trial as Yahuah (God) refining his own: *as gold in the furnace has he tried them, and received them.* So *blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life* (James 1:12). The enduring man is the tried gold, and the end of the trying is not loss but the crown — received, as the burnt offering is received, by the One who proved him.'),
  -- thread: james-1-if-any-lack-wisdom-let-him-ask-of-elohim-proverbs-2
  ('canon', 'james', 1, 5, 'canon', 'proverbs', 2, 6, 'free', E'*For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding.* (Proverbs 2:6). The fountain of wisdom is Yahuah (LORD): *out of his mouth cometh knowledge and understanding.* So James directs the seeker to the same source — *if any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally* (James 1:5). Wisdom is not earned by the clever but given by the Giver; the one who lacks has only to ask of the One out of whose mouth it comes.'),
  ('canon', 'james', 1, 5, 'canon', 'proverbs', 2, 3, 'free', E'*Yea, if thou criest after knowledge, and liftest up thy voice for understanding;* (Proverbs 2:3). Wisdom is had by asking — *cry after knowledge,* *lift up thy voice for understanding.* James turns the cry into prayer: *let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not* (James 1:5). The crying-after of Proverbs is the asking-in-faith of James; the One who hears the lifted voice gives liberally, never reproaching the one who comes empty.'),
  -- thread: james-1-the-rich-as-the-flower-of-the-grass-shall-pass-away-isaiah-40-psalm-103
  ('canon', 'james', 1, 10, 'canon', 'isaiah', 40, 6, 'free', E'*The voice said, Cry. And he said, What shall I cry? All flesh is grass, and all the goodliness thereof is as the flower of the field:* (Isaiah 40:6). The prophet''s cry is James''s warning to the rich: *all flesh is grass, and all the goodliness thereof is as the flower of the field.* So *the rich, in that he is made low: because as the flower of the grass he shall pass away* (James 1:10). The glory of wealth is the goodliness of the field — bright for a morning, gone by evening; the low brother is exalted, the rich man humbled, by the same measure of the grass.'),
  ('canon', 'james', 1, 11, 'canon', 'isaiah', 40, 8, 'free', E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever.* (Isaiah 40:8). The flower fades, but one thing stands: *the word of our Elohim (God) shall stand for ever.* James paints the fading — *the sun is no sooner risen with a burning heat, but it withereth the grass, and the flower thereof falleth... so also shall the rich man fade away in his ways* (James 1:11). The contrast is Isaiah''s own: the riches that wither against the word that abides, the engrafted word *able to save your souls* (James 1:21).'),
  ('canon', 'james', 1, 11, 'canon', 'psalms', 103, 15, 'free', E'*As for man, his days are as grass: as a flower of the field, so he flourisheth.* (Psalm 103:15). Man''s days are *as grass... a flower of the field* — flourishing, then gone. James says the same of the rich man fading *as the flower of the grass* (James 1:11). The frame is the Psalm''s tender knowledge that *he remembereth that we are dust* (Psalm 103:14): the brevity of the flower is not despair but the call to count the days and seek what does not wither.'),
  ('canon', 'james', 1, 11, 'canon', 'psalms', 103, 16, 'free', E'*For the wind passeth over it, and it is gone; and the place thereof shall know it no more.* (Psalm 103:16). A breath of wind and the flower *is gone; and the place thereof shall know it no more.* So the rich man *fade away in his ways* (James 1:11): the sun rises with burning heat and the flower falls. What the Psalm says of every man, James presses upon the one who trusts in riches — the place that knew him shall know him no more.'),
  ('canon', 'james', 1, 10, 'canon', '1-peter', 1, 24, 'free', E'*For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away:* (1 Peter 1:24). Peter quotes the same Isaiah-40 word to the same scattered remnant: *all flesh is as grass, and all the glory of man as the flower of grass.* James and Peter speak with one voice — the rich man *as the flower of the grass shall pass away* (James 1:10) — and both set against it the abiding word: in Peter, *the word of Yahuah (LORD) endureth for ever*; in James, the engrafted word that saves the soul.'),
  -- thread: james-1-let-no-man-say-i-am-tempted-of-elohim-the-lust-his-own-sirach-15-proverbs-19  [GUARD]
  ('canon', 'james', 1, 13, 'apocrypha', 'ecclesiasticus', 15, 11, 'extras', E'*Say not you, It is through Yahuah (God) that I fell away: for you oughtest not to do the things that he hates.* (Sirach 15:11). The very guard James raises stood already in the wisdom library: *say not you, It is through Yahuah (God) that I fell away.* So James commands, *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man* (James 1:13). The fault may never be charged upward; the One who hates evil neither tempts to it nor authors it in any man.'),
  ('canon', 'james', 1, 14, 'apocrypha', 'ecclesiasticus', 15, 14, 'extras', E'*He himself made man from the beginning, and left him in the hand of his counsel;* (Sirach 15:14). Sirach locates the source of the fall not in Elohim (God) but in man''s own will: he *made man from the beginning, and left him in the hand of his counsel.* James names the same engine: *every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14). The lust is man''s own; left in the hand of his own counsel, he is drawn away by what is within, not driven by the One who tempts no man.'),
  ('canon', 'james', 1, 14, 'canon', 'proverbs', 19, 3, 'free', E'*The foolishness of man perverteth his way: and his heart fretteth against Yahuah (LORD).* (Proverbs 19:3). Proverbs catches the very turn James forbids: a man''s own *foolishness... perverteth his way,* and then *his heart fretteth against Yahuah (LORD)* — blaming above for the ruin he made below. James severs that lie: *every man is tempted, when he is drawn away of his own lust, and enticed. Then when lust hath conceived, it bringeth forth sin* (James 1:14-15). The way is perverted from within; the fretting against Yahuah (LORD) is the false charge James will not allow.'),
  -- thread: james-1-the-father-of-lights-with-whom-is-no-variableness-malachi-3-numbers-23
  ('canon', 'james', 1, 17, 'canon', 'malachi', 3, 6, 'free', E'*For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed.* (Malachi 3:6). The unchangeableness James ascribes to the Father of lights is Yahuah''s (LORD''s) own word: *I am Yahuah (LORD), I change not.* So *every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17). The Giver does not shift like the lights he made; and because he changes not, *ye sons of Jacob are not consumed* — the same constancy that keeps the covenant keeps the gift coming down.'),
  ('canon', 'james', 1, 17, 'canon', 'numbers', 23, 19, 'free', E'*Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). The Father of lights, *with whom is no variableness* (James 1:17), is the Elohim (God) who *is not a man, that he should lie,* who does not turn back on his word. The shadow that turns belongs to the creature; the One who said and does, who spoke and makes it good, gives only *every good gift and every perfect gift* — no shifting, no dark turning, in the One who changes not.'),
  ('canon', 'james', 1, 17, 'canon', 'genesis', 1, 14, 'free', E'*And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14). The title *Father of lights* (James 1:17) names the Maker of the sun, moon, and stars — *the lights in the firmament of the heaven.* But mark the contrast James draws: the lights he made cast shifting shadows and turn through their seasons, *with whom is no variableness, neither shadow of turning.* The Father of the lights does not move as the lights move; he is above the turning of the very heavens he set for signs and seasons.'),
  -- thread: james-1-swift-to-hear-slow-to-speak-slow-to-wrath-proverbs-10-sirach-5
  ('canon', 'james', 1, 19, 'canon', 'proverbs', 10, 19, 'free', E'*In the multitude of words there wanteth not sin: but he that refraineth his lips is wise.* (Proverbs 10:19). The proverb sets the bridle James commands: *in the multitude of words there wanteth not sin,* and *he that refraineth his lips is wise.* So *let every man be swift to hear, slow to speak, slow to wrath* (James 1:19). The wisdom of the refrained lip is the slowness to speak; James gathers the wisdom-book counsel into a single apostolic charge to the scattered tribes.'),
  ('canon', 'james', 1, 19, 'canon', 'proverbs', 17, 27, 'free', E'*He that hath knowledge spareth his words: and a man of understanding is of an excellent spirit.* (Proverbs 17:27). Understanding shows in restraint — *he that hath knowledge spareth his words.* James says the same: *slow to speak, slow to wrath: For the wrath of man worketh not the righteousness of Elohim (God)* (James 1:19-20). The sparing of words and the cooling of wrath are one wisdom; the excellent spirit of the understanding man is the slow-to-wrath spirit that does the righteousness of Elohim (God).'),
  ('canon', 'james', 1, 19, 'canon', 'ecclesiastes', 5, 2, 'free', E'*Be not rash with thy mouth, and let not thine heart be hasty to utter any thing before Elohim (God): for Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few.* (Ecclesiastes 5:2). The Preacher counsels the very slowness James commands: *be not rash with thy mouth... let thy words be few.* So *swift to hear, slow to speak* (James 1:19). Before the Elohim (God) who is in heaven, the wise are quick to listen and sparing to speak — the reverence of Ecclesiastes made the temper of the believer.'),
  ('canon', 'james', 1, 19, 'apocrypha', 'ecclesiasticus', 5, 11, 'extras', E'*Be swift to hear; and let your life be sincere; and with patience give answer.* (Sirach 5:11). The phrase is nearly James''s own: *be swift to hear... with patience give answer.* James commands, *let every man be swift to hear, slow to speak, slow to wrath* (James 1:19). The wisdom library had already coined the maxim; James presses it on the gathered remnant as the mark of the one who receives *with meekness the engrafted word* (James 1:21) — quick to hear it, slow to answer back against it.'),
  -- thread: james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33  [★★ BLESSING]
  ('canon', 'james', 1, 25, 'canon', 'psalms', 19, 7, 'free', E'*The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalm 19:7). When James names *the perfect law of liberty* (James 1:25), he speaks the Psalm''s word: *the law of Yahuah (LORD) is perfect, converting the soul.* The perfect law is the Torah of Yahuah (LORD) — not a new law that replaced it, not a freedom from it, but the very Torah that converts the soul, into which the blessed man looks and continues. To look into it and do it is to be *blessed in his deed* (James 1:25).'),
  ('canon', 'james', 1, 25, 'canon', 'psalms', 119, 45, 'free', E'*And I will walk at liberty: for I seek thy precepts.* (Psalm 119:45). Here is the liberty James means: *I will walk at liberty: for I seek thy precepts.* The freedom is not freedom from the law but the freedom of the one who keeps it — to *walk at liberty* is to *seek thy precepts.* So *the perfect law of liberty* (James 1:25) is the Torah sought and kept from a willing heart; its doer *shall be blessed in his deed,* walking at liberty in the very precepts he seeks.'),
  ('canon', 'james', 1, 22, 'canon', 'exodus', 24, 7, 'free', E'*And he took the book of the covenant, and read in the audience of the people: and they said, All that Yahuah (LORD) hath said will we do, and be obedient.* (Exodus 24:7). At Sinai the people answered the read covenant, *All that Yahuah (LORD) hath said will we do, and be obedient* — hearing bound to doing. James re-speaks the Sinai demand itself: *be ye doers of the word, and not hearers only, deceiving your own selves* (James 1:22). The covenant was never heard-only; *we will do* is the response the word requires, and the deceiver is the one who hears and does not.'),
  ('canon', 'james', 1, 22, 'canon', 'ezekiel', 33, 31, 'free', E'*And they come unto thee as the people cometh, and they sit before thee as my people, and they hear thy words, but they will not do them: for with their mouth they shew much love, but their heart goeth after their covetousness.* (Ezekiel 33:31). Ezekiel names the very self-deception James rebukes: *they hear thy words, but they will not do them.* So *be ye doers of the word, and not hearers only, deceiving your own selves* (James 1:22). To sit as the people and hear with love on the lips while the heart goes after covetousness — that is the forgetful hearer who beholds his face in a glass and straightway forgets what manner of man he was.'),
  ('canon', 'james', 1, 22, 'canon', 'ezekiel', 33, 32, 'free', E'*And, lo, thou art unto them as a very lovely song of one that hath a pleasant voice, and can play well on an instrument: for they hear thy words, but they do them not.* (Ezekiel 33:32). The word becomes a pleasant song they enjoy and do not obey — *they hear thy words, but they do them not.* James presses the same charge: the hearer-only *is like unto a man beholding his natural face in a glass: For he beholdeth himself, and goeth his way, and straightway forgetteth* (James 1:23-24). The hearing that does not do is the lovely song forgotten; the doer continues in the perfect law and is blessed.'),
  ('canon', 'james', 1, 22, 'canon', 'deuteronomy', 5, 1, 'free', E'*And Moses called all Yashar''el (Israel), and said unto them, Hear, O Yashar''el (Israel), the statutes and judgments which I speak in your ears this day, that ye may learn them, and keep, and do them.* (Deuteronomy 5:1). Moses joins the three James joins: *learn them, and keep, and do them.* Hearing is for doing — *be ye doers of the word, and not hearers only* (James 1:22). The statutes and judgments were never given to be heard and shelved; James''s charge to the twelve tribes is Moses''s charge to all Yashar''el (Israel), that they keep and do the very Torah they hear.'),
  ('canon', 'james', 1, 25, 'canon', 'matthew', 7, 24, 'free', E'*Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock:* (Matthew 7:24). Yahusha (Jesus) drew the same line between hearing and doing: the one who *heareth these sayings of mine, and doeth them* is the wise builder on the rock, while the hearer-only builds on sand. James presses his Master''s word — *be ye doers of the word, and not hearers only* (James 1:22) — and the doer who *continueth therein... shall be blessed in his deed* (James 1:25) is the house that stands when the floods come.'),
  ('canon', 'james', 1, 25, 'canon', 'romans', 2, 13, 'free', E'*(For not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified.* (Romans 2:13). Sha''ul (Paul) writes the same principle James does: *not the hearers of the law... but the doers of the law shall be justified.* James says it plainly — *be ye doers of the word, and not hearers only* (James 1:22) — and the man who looks into *the perfect law of liberty, and continueth therein,* the *doer of the work... shall be blessed in his deed* (James 1:25). Hearing the Torah leaves a man where it found him; doing it is the blessed walk of the justified.'),
  -- thread: james-1-pure-religion-to-visit-the-fatherless-and-widows-isaiah-1-deuteronomy-10
  ('canon', 'james', 1, 27, 'canon', 'isaiah', 1, 17, 'free', E'*Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* (Isaiah 1:17). Isaiah defines true worship as care for the helpless: *judge the fatherless, plead for the widow.* James names the same as the heart of acceptable religion: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction* (James 1:27). The visiting of the fatherless and the widow is no addendum to faith but its proof — the doing of the word that Isaiah called Yashar''el (Israel) to learn.'),
  ('canon', 'james', 1, 27, 'canon', 'deuteronomy', 10, 18, 'free', E'*He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment.* (Deuteronomy 10:18). Pure religion images the very heart of Yahuah (LORD), who *doth execute the judgment of the fatherless and widow, and loveth the stranger.* To *visit the fatherless and widows in their affliction* (James 1:27) is to do as Elohim (God) does — the believer''s mercy mirroring the Father''s. The religion that is undefiled before Elohim (God) and the Father is the religion that loves whom the Father loves.'),
  ('canon', 'james', 1, 27, 'canon', 'psalms', 68, 5, 'free', E'*A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* (Psalm 68:5). Elohim (God) is himself *a father of the fatherless, and a judge of the widows.* So pure religion *before Elohim (God) and the Father* is *to visit the fatherless and widows in their affliction* (James 1:27) — to share the Father''s own care. The undefiled religion is to stand where Elohim (God) stands, beside the fatherless and the widow whom he fathers and judges.'),
  ('canon', 'james', 1, 27, 'canon', 'exodus', 22, 22, 'free', E'*Ye shall not afflict any widow, or fatherless child.* (Exodus 22:22). The Torah guards the widow and the fatherless with a direct command: *ye shall not afflict any widow, or fatherless child.* James turns the prohibition into a positive duty — *to visit the fatherless and widows in their affliction* (James 1:27). What the law forbids harming, pure religion goes to help; the undefiled worshipper not only refrains from afflicting but visits the afflicted, keeping himself *unspotted from the world.*'),
  ('canon', 'james', 1, 27, 'canon', 'isaiah', 58, 7, 'free', E'*Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* (Isaiah 58:7). The fast Yahuah (LORD) chooses is mercy made practical: *deal thy bread to the hungry... bring the poor... cover the naked.* So pure religion is *to visit the fatherless and widows in their affliction* (James 1:27) — not ritual hidden from need but the hand stretched to the cast-out. James''s undefiled religion is Isaiah''s chosen fast, the worship Elohim (God) receives because it does the word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s239_j239c1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s239_j239c1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37',
       E'To the twelve tribes which are scattered abroad — the two-house dispersion (Deuteronomy 30, Ezekiel 37)',
       E'James opens by naming his readers: *James, a servant of Elohim (God) and of the Lord Yahusha HaMashiach (Lord Jesus Christ), to the twelve tribes which are scattered abroad, greeting* (James 1:1). Read through the framework, this is no metaphor for a generic church but the **dispersed two-house remnant of Yashar''el (Israel)** — the literal twelve tribes in the nations. The scattering and the gathering are Moses''s own promise: *Yahuah Elohayka (the LORD thy God) will turn thy captivity... and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3), and *if any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* (Deuteronomy 30:4). The prophets name the same regathering of both houses: *Behold, I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* (Ezekiel 37:21), and *I will make them one nation in the land... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the two sticks made one. Isaiah sees both houses gathered: *he shall... assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). And the other apostle of the circumcision wrote to the same people with the same word: *Peter... to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia* (1 Peter 1:1). The twelve tribes are literal — the covenant people in dispersion, being knit into one nation under one King, the olive tree to which they are gathered. James writes the wisdom of the kingdom to a people whom Yahuah (LORD) is bringing home, not to a people who replaced them.',
       sv.verse_id, ev.verse_id, 'free', 8800
  FROM _s239_j239c1_lookup sv, _s239_j239c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=1 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-1-the-trying-of-your-faith-counted-joy-as-gold-tried-in-the-fire-proverbs-17-sirach-2',
       E'Count it all joy — the trying of your faith, as gold tried in the fire (Proverbs 17, Sirach 2)',
       E'*My brethren, count it all joy when ye fall into divers temptations; Knowing this, that the trying of your faith worketh patience. But let patience have her perfect work, that ye may be perfect and entire, wanting nothing* (James 1:2-4). The trial is the refiner''s furnace, and the wisdom library had already taught the believer to expect it and to read it as proving, not punishment. *The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts* (Proverbs 17:3) — the heart is the gold, the trial the fire. Sirach sets the very posture James commands: *My son, if you come to serve Yahuah (God), prepare your soul for temptation* (Sirach 2:1), *for gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). And the Wisdom of Solomon reads the end of the trying as acceptance: *as gold in the furnace has he tried them, and received them as a burnt offering* (Wisdom of Solomon 3:6). So James can promise, *Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which Yahuah (Lord) hath promised to them that love him* (James 1:12). The furnace does not consume the faithful; it purifies them — the tried gold received, the enduring man crowned. The joy is not in the pain but in the proving, that patience may have her perfect work and the believer come out *perfect and entire, wanting nothing.*',
       sv.verse_id, ev.verse_id, 'extras', 8803
  FROM _s239_j239c1_lookup sv, _s239_j239c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-1-if-any-lack-wisdom-let-him-ask-of-elohim-proverbs-2',
       E'If any lack wisdom, let him ask of Elohim (God) (Proverbs 2)',
       E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). The counsel rests on the wisdom-book truth that wisdom is given, not generated — *for Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6). And it is had by asking: *yea, if thou criest after knowledge, and liftest up thy voice for understanding* (Proverbs 2:3). James turns the crying-after into prayer to the liberal Giver who *upbraideth not* — never reproaching the one who comes empty. But the asking must be single-hearted: *let him ask in faith, nothing wavering. For he that wavereth is like a wave of the sea driven with the wind and tossed* (James 1:6), for *a double minded man is unstable in all his ways* (James 1:8). The seeker who lifts his voice for understanding and asks in faith of the One out of whose mouth wisdom comes shall not be sent away empty; it *shall be given him.*',
       sv.verse_id, ev.verse_id, 'free', 8806
  FROM _s239_j239c1_lookup sv, _s239_j239c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-1-the-rich-as-the-flower-of-the-grass-shall-pass-away-isaiah-40-psalm-103',
       E'The rich as the flower of the grass shall pass away (Isaiah 40, Psalm 103)',
       E'James humbles the rich with the oldest image of mortality: *the rich, in that he is made low: because as the flower of the grass he shall pass away. For the sun is no sooner risen with a burning heat, but it withereth the grass, and the flower thereof falleth, and the grace of the fashion of it perisheth: so also shall the rich man fade away in his ways* (James 1:10-11). This is Isaiah''s cry: *all flesh is grass, and all the goodliness thereof is as the flower of the field* (Isaiah 40:6) — and the contrast that gives the warning its point, *the grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). The Psalm sings the same brevity: *as for man, his days are as grass: as a flower of the field, so he flourisheth. For the wind passeth over it, and it is gone; and the place thereof shall know it no more* (Psalm 103:15-16). And Peter pressed the very words on the same scattered remnant: *all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away* (1 Peter 1:24). The glory of wealth is the goodliness of the field — bright for a morning, gone by the burning heat of noon. The low brother is exalted and the rich man humbled by one measure: the riches that wither against the engrafted word *which is able to save your souls* (James 1:21), the word that stands for ever when the flower has fallen.',
       sv.verse_id, ev.verse_id, 'free', 8809
  FROM _s239_j239c1_lookup sv, _s239_j239c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-1-let-no-man-say-i-am-tempted-of-elohim-the-lust-his-own-sirach-15-proverbs-19',
       E'Let no man say, I am tempted of Elohim (God) — the lust is his own (Sirach 15, Proverbs 19)',
       E'James raises a guard the wisdom library had already set: *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man: But every man is tempted, when he is drawn away of his own lust, and enticed. Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:13-15). The fault may never be charged upward. Sirach said it first: *say not you, It is through Yahuah (God) that I fell away: for you oughtest not to do the things that he hates* (Sirach 15:11); for *he himself made man from the beginning, and left him in the hand of his counsel* (Sirach 15:14) — man is left to his own choosing, and the sin is his. Proverbs catches the very turn James forbids: *the foolishness of man perverteth his way: and his heart fretteth against Yahuah (LORD)* (Proverbs 19:3) — a man ruins his own way and then blames Heaven for the ruin. James severs that lie. Elohim (God), the Father of lights *with whom is no variableness,* cannot be tempted with evil and tempts no man; the lust is man''s own, conceived within, and it is lust — not Elohim (God) — that brings forth sin and death. The believer owns the fault and never lays it on the One who only gives good gifts.',
       sv.verse_id, ev.verse_id, 'extras', 8812
  FROM _s239_j239c1_lookup sv, _s239_j239c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-1-the-father-of-lights-with-whom-is-no-variableness-malachi-3-numbers-23',
       E'The Father of lights, with whom is no variableness (Malachi 3, Numbers 23)',
       E'*Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17). The title keeps the Father the source — every good thing *cometh down from* him, the Maker of the lights of heaven: *and Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). But mark the contrast James draws: the lights he made cast shifting shadows and turn through their seasons, while in the Father *is no variableness, neither shadow of turning.* His constancy is Yahuah''s (LORD''s) own word: *for I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6) — the same unchangeableness that keeps the covenant keeps the gift coming down. And he is *not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). The shadow that turns belongs to the creature; the Father of the very lights does not move as the lights move. Of his own unchanging will *begat he us with the word of truth, that we should be a kind of firstfruits of his creatures* (James 1:18) — the same steadfast Giver who changes not.',
       sv.verse_id, ev.verse_id, 'free', 8815
  FROM _s239_j239c1_lookup sv, _s239_j239c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-1-swift-to-hear-slow-to-speak-slow-to-wrath-proverbs-10-sirach-5',
       E'Swift to hear, slow to speak, slow to wrath (Proverbs 10, Sirach 5)',
       E'*Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath: For the wrath of man worketh not the righteousness of Elohim (God)* (James 1:19-20). The charge gathers the wisdom-book counsel on the bridled tongue into one apostolic word. *In the multitude of words there wanteth not sin: but he that refraineth his lips is wise* (Proverbs 10:19); *he that hath knowledge spareth his words: and a man of understanding is of an excellent spirit* (Proverbs 17:27). The Preacher sets the same reverent restraint before the Elohim (God) of heaven: *be not rash with thy mouth, and let not thine heart be hasty to utter any thing before Elohim (God): for Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few* (Ecclesiastes 5:2). And Sirach coins the maxim nearly in James''s own words: *be swift to hear; and let your life be sincere; and with patience give answer* (Sirach 5:11). The sparing of words and the cooling of wrath are one wisdom — the man of understanding is slow to speak and slow to wrath, for the wrath of man does not work the righteousness of Elohim (God). This is the temper of the one who lays apart all filthiness and *receive[s] with meekness the engrafted word, which is able to save your souls* (James 1:21): quick to hear it, slow to answer back against it.',
       sv.verse_id, ev.verse_id, 'extras', 8818
  FROM _s239_j239c1_lookup sv, _s239_j239c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33',
       E'Be ye doers of the word, not hearers only — the perfect law of liberty (Psalm 19, Ezekiel 33)',
       E'*But be ye doers of the word, and not hearers only, deceiving your own selves... But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed* (James 1:22,25). Read through the framework, *the perfect law of liberty* is **the Torah of Yahuah (LORD)** — not a new law that replaced it, not a freedom *from* the law, but the very Torah kept from a willing heart. James speaks the Psalm''s word: *the law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7); and the liberty is the freedom of the one who keeps it — *I will walk at liberty: for I seek thy precepts* (Psalm 119:45). Doing, not merely hearing, is the Sinai demand itself: the people answered the read covenant, *All that Yahuah (LORD) hath said will we do, and be obedient* (Exodus 24:7); and Moses charged all Yashar''el (Israel), *Hear, O Yashar''el (Israel)... that ye may learn them, and keep, and do them* (Deuteronomy 5:1). The hearer-only is the very man Ezekiel rebukes: *they hear thy words, but they will not do them: for with their mouth they shew much love, but their heart goeth after their covetousness* (Ezekiel 33:31), the word become *a very lovely song... for they hear thy words, but they do them not* (Ezekiel 33:32). Such a one *beholding his natural face in a glass... straightway forgetteth what manner of man he was* (James 1:23-24). Yahusha (Jesus) drew the same line — *whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24) — and Sha''ul (Paul) the same: *not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified* (Romans 2:13). The perfect law of liberty is no abolition and no replacement; it is the Torah looked into, continued in, and done — and the doer of the work *shall be blessed in his deed.*',
       sv.verse_id, ev.verse_id, 'free', 8821
  FROM _s239_j239c1_lookup sv, _s239_j239c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=1 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-1-pure-religion-to-visit-the-fatherless-and-widows-isaiah-1-deuteronomy-10',
       E'Pure religion: to visit the fatherless and widows in their affliction (Isaiah 1, Deuteronomy 10)',
       E'*Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). The mark of true worship is mercy to the helpless — the same that Isaiah set against empty ritual: *learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow* (Isaiah 1:17), and that the chosen fast made practical: *deal thy bread to the hungry, and... bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him* (Isaiah 58:7). To visit the fatherless and the widow is to image the very heart of Yahuah (LORD), who *doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment* (Deuteronomy 10:18), who is himself *a father of the fatherless, and a judge of the widows... in his holy habitation* (Psalm 68:5). The Torah guards them with a direct command — *ye shall not afflict any widow, or fatherless child* (Exodus 22:22) — and pure religion goes beyond refraining from harm to visiting the afflicted. Religion that *bridleth not his tongue* and only seems devout is vain (James 1:26); the undefiled religion is the doing of the word — care for whom the Father cares, kept unspotted from the world.',
       sv.verse_id, ev.verse_id, 'free', 8824
  FROM _s239_j239c1_lookup sv, _s239_j239c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=1 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *Yahuah Elohayka (the LORD thy God)... will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* the dispersion James addresses, *the twelve tribes which are scattered abroad* (James 1:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:4 — *if any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* the outcasts at the outmost parts, *scattered abroad* (James 1:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:21 — *I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* the gathering that ends the scattering of *the twelve tribes* (James 1:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:22 — *I will make them one nation in the land... and they shall be no more two nations* the two houses joined; the dispersed addressed as one people (James 1:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 11:12 — *assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* both houses regathered, *the twelve tribes which are scattered abroad* (James 1:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Peter 1:1 — *Peter... to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia* the same address to the same scattered remnant James salutes (James 1:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-twelve-tribes-scattered-abroad-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-1-the-trying-of-your-faith-counted-joy-as-gold-tried-in-the-fire-proverbs-17-sirach-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:3 — *the fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts* the refiner''s furnace beneath *the trying of your faith worketh patience* (James 1:3).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-trying-of-your-faith-counted-joy-as-gold-tried-in-the-fire-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 2:1 — *My son, if you come to serve Yahuah (God), prepare your soul for temptation* the posture James commands, *count it all joy when ye fall into divers temptations* (James 1:2).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-trying-of-your-faith-counted-joy-as-gold-tried-in-the-fire-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 2:5 — *for gold is tried in the fire, and acceptable men in the furnace of adversity* the image beneath *the trying of your faith* (James 1:3) that makes the believer perfect and entire.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-trying-of-your-faith-counted-joy-as-gold-tried-in-the-fire-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 3:6 — *as gold in the furnace has he tried them, and received them as a burnt offering* the end of the trying is acceptance; *blessed is the man that endureth temptation... he shall receive the crown of life* (James 1:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-trying-of-your-faith-counted-joy-as-gold-tried-in-the-fire-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-1-if-any-lack-wisdom-let-him-ask-of-elohim-proverbs-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 2:6 — *for Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* the Giver to whom James sends the seeker, *let him ask of Elohim (God), that giveth to all men liberally* (James 1:5).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-if-any-lack-wisdom-let-him-ask-of-elohim-proverbs-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 2:3 — *if thou criest after knowledge, and liftest up thy voice for understanding* the crying-after turned to asking-in-faith, *let him ask in faith, nothing wavering* (James 1:5-6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-if-any-lack-wisdom-let-him-ask-of-elohim-proverbs-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-1-the-rich-as-the-flower-of-the-grass-shall-pass-away-isaiah-40-psalm-103
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:6 — *all flesh is grass, and all the goodliness thereof is as the flower of the field* the prophet''s cry behind *the rich... as the flower of the grass he shall pass away* (James 1:10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-rich-as-the-flower-of-the-grass-shall-pass-away-isaiah-40-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:8 — *the grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* the fading riches against the abiding word; *so also shall the rich man fade away in his ways* (James 1:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-rich-as-the-flower-of-the-grass-shall-pass-away-isaiah-40-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 103:15 — *as for man, his days are as grass: as a flower of the field, so he flourisheth* the brevity of the flower; the rich man fading *as the flower of the grass* (James 1:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-rich-as-the-flower-of-the-grass-shall-pass-away-isaiah-40-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 103:16 — *the wind passeth over it, and it is gone; and the place thereof shall know it no more* a breath and the flower is gone, as the rich man *fade away in his ways* (James 1:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-rich-as-the-flower-of-the-grass-shall-pass-away-isaiah-40-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 1:24 — *all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away* Peter''s same Isaiah-40 word to the scattered; the rich *as the flower of the grass shall pass away* (James 1:10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-rich-as-the-flower-of-the-grass-shall-pass-away-isaiah-40-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-1-let-no-man-say-i-am-tempted-of-elohim-the-lust-his-own-sirach-15-proverbs-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 15:11 — *say not you, It is through Yahuah (God) that I fell away: for you oughtest not to do the things that he hates* the wisdom-library guard James raises, *Let no man say... I am tempted of Elohim (God)* (James 1:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-let-no-man-say-i-am-tempted-of-elohim-the-lust-his-own-sirach-15-proverbs-19'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 15:14 — *he himself made man from the beginning, and left him in the hand of his counsel* the fall located in man''s own will; *every man is tempted, when he is drawn away of his own lust* (James 1:14).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-let-no-man-say-i-am-tempted-of-elohim-the-lust-his-own-sirach-15-proverbs-19'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 19:3 — *the foolishness of man perverteth his way: and his heart fretteth against Yahuah (LORD)* the false charge James forbids; the lust is man''s own (James 1:14-15).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-let-no-man-say-i-am-tempted-of-elohim-the-lust-his-own-sirach-15-proverbs-19'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-1-the-father-of-lights-with-whom-is-no-variableness-malachi-3-numbers-23
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:6 — *for I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* the unchangeableness of the Father of lights, *with whom is no variableness* (James 1:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-father-of-lights-with-whom-is-no-variableness-malachi-3-numbers-23'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 23:19 — *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent* the One who does not turn back on his word; *neither shadow of turning* (James 1:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-father-of-lights-with-whom-is-no-variableness-malachi-3-numbers-23'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:14 — *Let there be lights in the firmament of the heaven... for signs, and for seasons* the Father of lights made the very lights whose turning shadows he is above (James 1:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-the-father-of-lights-with-whom-is-no-variableness-malachi-3-numbers-23'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-1-swift-to-hear-slow-to-speak-slow-to-wrath-proverbs-10-sirach-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:19 — *in the multitude of words there wanteth not sin: but he that refraineth his lips is wise* the bridled lip behind *slow to speak* (James 1:19).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-swift-to-hear-slow-to-speak-slow-to-wrath-proverbs-10-sirach-5'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 17:27 — *he that hath knowledge spareth his words: and a man of understanding is of an excellent spirit* the sparing of words and cooling of wrath; *slow to speak, slow to wrath* (James 1:19).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-swift-to-hear-slow-to-speak-slow-to-wrath-proverbs-10-sirach-5'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 5:2 — *be not rash with thy mouth... let thy words be few* reverent restraint before the Elohim (God) of heaven; *swift to hear, slow to speak* (James 1:19).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-swift-to-hear-slow-to-speak-slow-to-wrath-proverbs-10-sirach-5'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 5:11 — *be swift to hear; and let your life be sincere; and with patience give answer* the maxim nearly in James''s own words, *let every man be swift to hear* (James 1:19).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-swift-to-hear-slow-to-speak-slow-to-wrath-proverbs-10-sirach-5'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *the law of Yahuah (LORD) is perfect, converting the soul* the perfect law James names; *the perfect law of liberty* is the Torah, not a new law (James 1:25).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:45 — *I will walk at liberty: for I seek thy precepts* the liberty of the one who keeps the law; *the perfect law of liberty... continueth therein* (James 1:25).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 24:7 — *All that Yahuah (LORD) hath said will we do, and be obedient* the Sinai answer binding hearing to doing; *be ye doers of the word, and not hearers only* (James 1:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 33:31 — *they hear thy words, but they will not do them: for with their mouth they shew much love, but their heart goeth after their covetousness* the self-deceiving hearer-only James rebukes (James 1:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 33:32 — *they hear thy words, but they do them not* the word become a lovely song unobeyed; the forgetful hearer who beholds his face and forgets (James 1:23-24).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 5:1 — *Hear, O Yashar''el (Israel)... that ye may learn them, and keep, and do them* Moses joining hear-learn-keep-do; *be ye doers of the word, and not hearers only* (James 1:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 7:24 — *whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* Yahusha''s (Jesus'') doer on the rock; the doer of the work *blessed in his deed* (James 1:25).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Romans 2:13 — *not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified* Sha''ul''s (Paul''s) same principle; *be ye doers of the word, and not hearers only* (James 1:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-doers-of-the-word-not-hearers-only-the-perfect-law-of-liberty-psalm-19-ezekiel-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-1-pure-religion-to-visit-the-fatherless-and-widows-isaiah-1-deuteronomy-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 1:17 — *judge the fatherless, plead for the widow* true worship as mercy to the helpless; *to visit the fatherless and widows in their affliction* (James 1:27).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-pure-religion-to-visit-the-fatherless-and-widows-isaiah-1-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 10:18 — *He doth execute the judgment of the fatherless and widow, and loveth the stranger* pure religion images the heart of Yahuah (LORD); the believer loves whom the Father loves (James 1:27).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-pure-religion-to-visit-the-fatherless-and-widows-isaiah-1-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 68:5 — *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation* to stand where Elohim (God) stands beside the fatherless and widow (James 1:27).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-pure-religion-to-visit-the-fatherless-and-widows-isaiah-1-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 22:22 — *Ye shall not afflict any widow, or fatherless child* the Torah''s guard turned to a positive duty; pure religion *to visit the fatherless and widows in their affliction* (James 1:27).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-pure-religion-to-visit-the-fatherless-and-widows-isaiah-1-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 58:7 — *deal thy bread to the hungry, and... bring the poor that are cast out to thy house... cover the naked* the chosen fast made practical; undefiled religion the doing of the word (James 1:27).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c1_lookup sv, _s239_j239c1_lookup tv
 WHERE t.slug='james-1-pure-religion-to-visit-the-fatherless-and-widows-isaiah-1-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
