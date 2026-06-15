-- =====================================================================
-- Session 239 — James FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session239_james_cross_references.sql
-- =====================================================================

\echo 'session239 — James cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_james_02.sql (S239 James 2) -----
-- =====================================================================
-- S239 minion — JAMES 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: JAMES 2 (26 verses) — THE FRAMEWORK KEYSTONE CHAPTER of the book.
-- Tag: j239c2 (temp view _s239_j239c2_lookup).
-- Sort band: floor 8830, step 3 (8830, 8833, 8836, 8839, 8842 used; under 8860).
-- Source is ALWAYS the canon James verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (James = the wisdom-of-the-two-house-remnant letter, written to the twelve tribes
-- scattered abroad; the Torah is in force and being kept). Chapter 2 is the framework keystone:
-- (1) respect of persons / no partiality (2:1-9) re-speaks Leviticus 19:15 and Sirach 35:12-13 — the
-- chosen poor are rich in faith and heirs of the kingdom; (2) ★★ the royal law / the whole law / guilty
-- of all (2:8-12) — *the royal law according to the scripture* is Leviticus 19:18 (*love thy neighbour
-- as thyself*), the *whole law* the indivisible Torah (Deuteronomy 27:26), the two commands cited are the
-- Decalogue verbatim (Exodus 20:13-14 / Deuteronomy 5:17-18); believers SHALL BE JUDGED by the law of
-- liberty — the opposite of "the law is abolished"; (3) ★★★ faith perfected by works — Abraham and
-- Rahab (2:14-26) — NOT Reformation grammar, NOT a works-vs-grace antithesis: living faith is Torah-
-- obedient faith, works the COMPLETION and evidence of faith. Genesis 15:6 (the belief) and Genesis 22
-- (the obedience that *made faith perfect*) are ONE pattern read through the keystone Genesis 26:5
-- (*Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws*); the Second-
-- Temple library makes the same fusion (1 Maccabees 2:52, Sirach 44:20). Paul (Romans 4) is the
-- COMPLEMENT not the contradiction — same Abraham, same Genesis 15:6; Paul excludes flesh-merit boasting,
-- James requires obedient living faith. Christology: *the faith of our Lord Yahusha HaMashiach, Yahuah
-- (Lord) of glory* (2:1) and *one Elohim* (2:19, Deuteronomy 6:4) — the Father is one; the Son bears his
-- Name and glory. No co-equal-persons grammar; no modalist collapse; no replacement theology.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-7   the faith of the Lord of glory held WITHOUT respect of persons; the chosen poor
--           Tanakh: Leviticus 19:15 (respect not the person of the poor nor the mighty),
--                   Deuteronomy 1:17 / 16:19 (respect not persons in judgment), Proverbs 24:23,
--                   1 Samuel 2:8 / Psalm 113:7 / Isaiah 66:2 (the poor lifted up / the contrite),
--                   Proverbs 17:5 (mocketh the poor reproacheth his Maker)
--           Extras: Sirach 35:12-13 (Yahuah is judge, no respect of persons; hears the oppressed)
--           NT: none warranted (the partiality root is the Tanakh + Sirach)
--   v.8-12  the royal law / the whole law / guilty of all; judged by the law of liberty
--           Tanakh: Leviticus 19:18 (love thy neighbour as thyself), Exodus 20:13-14 +
--                   Deuteronomy 5:17-18 (the Decalogue verbatim), Deuteronomy 27:26 (confirmeth
--                   not all the words of this law)
--           Extras: none warranted   NT: Galatians 5:14 (all the law fulfilled in one word)
--   v.13    judgment without mercy to him that shewed no mercy; mercy rejoiceth against judgment
--           Tanakh: Micah 6:8 (love mercy, walk humbly), Proverbs 21:13 (stoppeth ears at the cry)
--           Extras: Sirach 28:1-4 (forgive thy neighbour, so shall thy sins be forgiven)
--           NT: Matthew 5:7 (blessed are the merciful)
--   v.14-17,26 faith without works is dead; shut-up compassion to the naked and destitute
--           Tanakh: none warranted (the works-of-faith root is Abraham/Rahab below)
--           Extras: none warranted   NT: 1 John 3:17 (shutteth up his bowels of compassion)
--   v.18-26 faith perfected by works — Abraham offered Yitzhaq, Rahab; one Elohim
--           Tanakh: Genesis 15:6 (Abraham believed; counted for righteousness), Genesis 22:9-12,16-18
--                   (offered Yitzhaq, obeyed my voice), Genesis 26:5 (kept my charge, my commandments),
--                   Joshua 2:11 / 6:25 (Rahab), Deuteronomy 6:4 (one Yahuah — for 2:19)
--           Extras: 1 Maccabees 2:52 (Abraham faithful in temptation, imputed for righteousness),
--                   Sirach 44:20 (kept the law of the Most High... was found faithful)
--           NT: Hebrews 11:17-19,31 (Abraham and Rahab by faith), Romans 4:3,20-21 (the COMPLEMENT)
--
-- THREADS (slug -> target libraries):
--   8830 james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35        (Tanakh + Extras)
--   8833 james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue     (Tanakh + NT)  [★★ BLESSING]
--   8836 james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28             (Tanakh + Extras + NT)
--   8839 james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22  (Tanakh + Extras + NT)  [★★★ KEYSTONE / BLESSING]
--   8842 james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3      (NT)
-- =====================================================================

CREATE TEMP VIEW _s239_j239c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35
  ('canon', 'james', 2, 1, 'canon', 'leviticus', 19, 15, 'free', E'*Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour.* (Leviticus 19:15). James'' rebuke — *have not the faith of our Lord Yahusha HaMashiach (Lord Jesus Christ), Yahuah (Lord) of glory, with respect of persons* (James 2:1) — stands squarely on the Torah''s own command. The same chapter that gives the royal law (Leviticus 19:18) forbids respecting the person of the poor OR the mighty; James applies it to the assembly that fawns on the man with the gold ring and shames the poor man in vile raiment. To hold the faith of the Lord of glory with partiality is to *commit sin, and are convinced of the law as transgressors* (James 2:9) — measured by this very statute.'),
  ('canon', 'james', 2, 9, 'canon', 'deuteronomy', 1, 17, 'free', E'*Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man; for the judgment is Elohim''s (God''s): and the cause that is too hard for you, bring it unto me, and I will hear it.* (Deuteronomy 1:17). Mosheh charged the judges of Yashar''el (Israel) to *hear the small as well as the great,* for *the judgment is Elohim''s (God''s).* When James says *if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors* (James 2:9), he convicts by this command: to seat the rich and footstool the poor is to usurp the judgment that belongs to Elohim (God), who shows no partiality.'),
  ('canon', 'james', 2, 9, 'canon', 'deuteronomy', 16, 19, 'free', E'*Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous.* (Deuteronomy 16:19). The Torah binds the judge: *thou shalt not respect persons, neither take a gift.* James'' partial assembly — dazzled by *a gold ring, in goodly apparel* (James 2:2) — has let the gift blind its eyes, becoming *judges of evil thoughts* (James 2:4). The respecting of persons James names is the very corruption the Torah forbids at the gate.'),
  ('canon', 'james', 2, 9, 'canon', 'proverbs', 24, 23, 'free', E'*These things also belong to the wise. It is not good to have respect of persons in judgment.* (Proverbs 24:23). The wisdom books say plainly what James presses on the assembly: *It is not good to have respect of persons in judgment.* James'' assembly that says to the rich *Sit thou here in a good place* and to the poor *Stand thou there, or sit here under my footstool* (James 2:3) has departed from the wisdom of the Tanakh as surely as from its law — for the two are one in Yahuah (LORD).'),
  ('canon', 'james', 2, 5, 'canon', '1-samuel', 2, 8, 'free', E'*He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory: for the pillars of the earth are the LORD''S, and he hath set the world upon them.* (1 Samuel 2:8). Channah''s song already sang what James proclaims: Yahuah (LORD) *raiseth up the poor out of the dust... to make them inherit the throne of glory.* So James: *Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* (James 2:5). The assembly despises whom Elohim (God) has chosen to enthrone; to shame the poor is to despise the heirs of the kingdom.'),
  ('canon', 'james', 2, 5, 'canon', 'isaiah', 66, 2, 'free', E'*For all those things hath mine hand made, and all those things have been, saith Yahuah (LORD): but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* (Isaiah 66:2). Yahuah (LORD) declares whom he regards: *him that is poor and of a contrite spirit, and trembleth at my word.* This is the man James says Elohim (God) *hath chosen... rich in faith* (James 2:5) — the very man the partial assembly seats under its footstool. To honour the rich oppressor over the poor who trembles at the word is to invert the looking of Yahuah (LORD) himself.'),
  ('canon', 'james', 2, 6, 'canon', 'proverbs', 17, 5, 'free', E'*Whoso mocketh the poor reproacheth his Maker: and he that is glad at calamities shall not be unpunished.* (Proverbs 17:5). Proverbs warns that *whoso mocketh the poor reproacheth his Maker.* James turns the same edge on the assembly: *ye have despised the poor* (James 2:6) — and despising the poor whom Elohim (God) made and chose is to reproach the Maker, the One whose faith of glory they claim to hold. The partiality is not a social slight but an offence against the Creator of both poor and rich.'),
  ('canon', 'james', 2, 1, 'apocrypha', 'ecclesiasticus', 35, 12, 'extras', E'*Do not think to corrupt with gifts; for such he will not receive: and trust not to unrighteous sacrifices; for Yahuah (God) is judge, and with him is no respect of persons.* (Sirach 35:12). The wisdom of the Hebrew library already held the framework James presses: *Yahuah (God) is judge, and with him is no respect of persons.* Because Elohim (God) judges without partiality, the assembly that holds *the faith of our Lord Yahusha HaMashiach (Lord Jesus Christ), Yahuah (Lord) of glory, with respect of persons* (James 2:1) contradicts the very character of the One it worships. James is re-speaking Sirach as much as Leviticus 19.'),
  ('canon', 'james', 2, 6, 'apocrypha', 'ecclesiasticus', 35, 13, 'extras', E'*He will not accept any person against a poor man, but will hear the prayer of the oppressed.* (Sirach 35:13). Sirach declares that Yahuah (God) *will not accept any person against a poor man, but will hear the prayer of the oppressed.* James'' assembly does the opposite — it *despised the poor* and sides with the rich who *oppress you, and draw you before the judgment seats* (James 2:6). To favour the oppressor over the oppressed is to stand against the One who hears the oppressed; the framework of the wisdom library and the apostle is one.'),

  -- thread: james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue  [★★ BLESSING]
  ('canon', 'james', 2, 8, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). When James writes *If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well* (James 2:8), the *royal law according to the scripture* is this verse of the Torah, word for word. It is not a new commandment that replaced the law; it is a commandment OF the law, the summary the King himself gives — *love thy neighbour as thyself: I am Yahuah (LORD).* To fulfil the royal law is to keep the Torah, not to be freed from it.'),
  ('canon', 'james', 2, 11, 'canon', 'exodus', 20, 14, 'free', E'*Thou shalt not commit adultery.* (Exodus 20:14). James cites the Decalogue verbatim to prove the Torah is one indivisible whole: *For he that said, Do not commit adultery, said also, Do not kill* (James 2:11). The same Yahuah (LORD) who spoke *Thou shalt not commit adultery* spoke also *Thou shalt not kill*; therefore to break one is to become *a transgressor of the law* (James 2:11) as a whole. The commandments are not a menu; they are the single voice of the one Lawgiver.'),
  ('canon', 'james', 2, 11, 'canon', 'exodus', 20, 13, 'free', E'*Thou shalt not kill.* (Exodus 20:13). The second of the two words James quotes — *said also, Do not kill* (James 2:11) — is the Decalogue verbatim. James'' point is the indivisibility of the Torah: he that keeps the whole law *yet offend in one point, he is guilty of all* (James 2:10), because every word is the speech of the one Yahuah (LORD). The man who avoids adultery but kills *art become a transgressor of the law,* having broken the one law given by the one Lawgiver.'),
  ('canon', 'james', 2, 11, 'canon', 'deuteronomy', 5, 18, 'free', E'*Neither shalt thou commit adultery.* (Deuteronomy 5:18). At the renewal of the covenant Mosheh re-spoke the same word: *Neither shalt thou commit adultery.* James anchors his argument in this Decalogue — *he that said, Do not commit adultery, said also, Do not kill* (James 2:11) — to show that the Torah of Sinai and of Moab is one law, and the believer is bound to its whole, *judged by the law of liberty* (James 2:12).'),
  ('canon', 'james', 2, 11, 'canon', 'deuteronomy', 5, 17, 'free', E'*Thou shalt not kill.* (Deuteronomy 5:17). The Decalogue given again in Deuteronomy carries the same word — *Thou shalt not kill* — that James pairs with the command against adultery (James 2:11). The pairing makes the framework plain: the whole Torah stands or falls together, *for whosoever shall keep the whole law, and yet offend in one point, he is guilty of all* (James 2:10). The law is not abolished in James; it is upheld as the indivisible standard by which believers *shall be judged* (James 2:12).'),
  ('canon', 'james', 2, 10, 'canon', 'deuteronomy', 27, 26, 'free', E'*Cursed be he that confirmeth not all the words of this law to do them. And all the people shall say, Amen.* (Deuteronomy 27:26). At the Shechem covenant the people said Amen to the curse on *him that confirmeth not ALL the words of this law to do them.* This is the very principle James states: *whosoever shall keep the whole law, and yet offend in one point, he is guilty of all* (James 2:10). The Torah is to be confirmed in its wholeness; partial obedience is no obedience. James holds believers to all the words of the law, exactly as Deuteronomy does.'),
  ('canon', 'james', 2, 8, 'canon', 'galatians', 5, 14, 'free', E'*For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself.* (Galatians 5:14). Sha''ul (Paul) names the same royal law James names: *all the law is fulfilled in one word... Thou shalt love thy neighbour as thyself* — Leviticus 19:18. Far from setting Paul against James, this shows their agreement: love of neighbour is not the abolition of the Torah but its fulfilling, its summing-up. James'' *royal law according to the scripture* (James 2:8) and Paul''s *one word* in which *all the law is fulfilled* are the same commandment, the same Torah honoured by both apostles.'),

  -- thread: james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28
  ('canon', 'james', 2, 13, 'canon', 'micah', 6, 8, 'free', E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). What Yahuah (LORD) requires through Micah — *to do justly, and to love mercy, and to walk humbly* — is the very thing James presses: *he shall have judgment without mercy, that hath shewed no mercy; and mercy rejoiceth against judgment* (James 2:13). The one who loves mercy will find mercy rejoicing over him in the day of judgment; the merciless, having despised what Yahuah (LORD) requires, meets judgment without mercy.'),
  ('canon', 'james', 2, 13, 'canon', 'proverbs', 21, 13, 'free', E'*Whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard.* (Proverbs 21:13). Proverbs sets the measure-for-measure James states: *whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard.* So James: *he shall have judgment without mercy, that hath shewed no mercy* (James 2:13). The one who shut his ears to the poor — the very poor the partial assembly footstooled (James 2:2-6) — will himself be unheard in the day of his crying.'),
  ('canon', 'james', 2, 13, 'canon', 'matthew', 5, 7, 'free', E'*Blessed are the merciful: for they shall obtain mercy.* (Matthew 5:7). The Sermon on the Mount is James'' twin. Yahusha (Jesus) blessed the merciful — *they shall obtain mercy* — and James gives the obverse and the promise together: *he shall have judgment without mercy, that hath shewed no mercy; and mercy rejoiceth against judgment* (James 2:13). The merciful obtain mercy; over them mercy triumphs in the judgment. James is preaching the beatitude of his elder brother.'),
  ('canon', 'james', 2, 13, 'apocrypha', 'ecclesiasticus', 28, 2, 'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2). The wisdom of the library teaches the reciprocity James proclaims: *Forgive your neighbour... so shall your sins also be forgiven.* James'' *he shall have judgment without mercy, that hath shewed no mercy* (James 2:13) is the same law of mercy from the other side — Sirach asks, *He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* (Sirach 28:4). The merciless cannot claim mercy; the framework of the wisdom books and the apostle is one.'),

  -- thread: james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22  [★★★ KEYSTONE / BLESSING]
  ('canon', 'james', 2, 23, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). This is the scripture James says was *fulfilled* — *Abraham believed Elohim (God), and it was imputed unto him for righteousness* (James 2:23). But mark how James reads it: the believing of Genesis 15:6 was *fulfilled* — brought to its completion — when Abraham offered Yitzhaq (Isaac) decades later (James 2:21-22). The faith that was counted for righteousness is the faith that obeyed; *by works was faith made perfect* (James 2:22). Genesis 15:6 is not set against works; it is consummated in them.'),
  ('canon', 'james', 2, 21, 'canon', 'genesis', 22, 9, 'free', E'*And they came to the place which Elohim (God) had told him of; and Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood.* (Genesis 22:9). This is the work James names: *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* (James 2:21). The binding of Yitzhaq (Isaac) on the wood is the obedience in which the faith of Genesis 15:6 was made perfect. James does not pit this against believing; he shows that *faith wrought with his works, and by works was faith made perfect* (James 2:22) — the altar is where the belief became visible and complete.'),
  ('canon', 'james', 2, 22, 'canon', 'genesis', 22, 12, 'free', E'*And he said, Lay not thine hand upon the lad, neither do thou any thing unto him: for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me.* (Genesis 22:12). The angel of Yahuah (LORD) declares the verdict: *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son.* This is precisely James'' point — *Seest thou how faith wrought with his works, and by works was faith made perfect?* (James 2:22). The not-withholding is the work; by it the unseen faith of Abraham was proved and perfected, and Elohim (God) himself says *now I know.* Living faith is the faith that obeys.'),
  ('canon', 'james', 2, 21, 'canon', 'genesis', 22, 16, 'free', E'*And said, By myself have I sworn, saith Yahuah (LORD), for because thou hast done this thing, and hast not withheld thy son, thine only son:* (Genesis 22:16). Yahuah (LORD) swears the blessing *because thou hast done this thing* — the obedience is the ground of the oath. James reads the Aqedah exactly so: Abraham was *justified by works, when he had offered Isaac his son upon the altar* (James 2:21). The doing, the not-withholding, draws forth the sworn covenant; the blessing of the multiplied seed (Genesis 22:17) follows the obeyed voice, not a faith that stayed in the heart alone.'),
  ('canon', 'james', 2, 21, 'canon', 'genesis', 22, 18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). The covenant of the nations is sealed *because thou hast obeyed my voice.* This is the framework''s own grammar, and James''s: obedient faith, not bare assent, is what Yahuah (LORD) crowns. James'' *by works a man is justified, and not by faith only* (James 2:24) re-speaks *because thou hast obeyed my voice.* The obedience is not a rival to faith but its very life, the channel of the promise to all nations.'),
  ('canon', 'james', 2, 22, 'canon', 'genesis', 26, 5, 'free', E'*Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* (Genesis 26:5). The keystone that holds James'' whole argument: Yahuah (LORD) testifies that Abraham *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* The faith counted for righteousness in Genesis 15:6 was a Torah-keeping, voice-obeying faith — exactly the *faith made perfect* by *works* that James preaches (James 2:22). Read through Genesis 26:5, James'' Abraham is no proof of works-less belief but the pattern of obedient living faith: the believer and the keeper of the commandments are one man.'),
  ('canon', 'james', 2, 25, 'canon', 'joshua', 2, 11, 'free', E'*And as soon as we had heard these things, our hearts did melt, neither did there remain any more courage in any man, because of you: for Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath.* (Joshua 2:11). Rahab confessed the faith — *Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* — and then she ACTED it, hiding the spies. James names her as the second witness: *Likewise also was not Rahab the harlot justified by works, when she had received the messengers, and had sent them out another way?* (James 2:25). Her confession alone would have been the dead faith of the devils who *believe, and tremble* (James 2:19); her hiding of the messengers made it living.'),
  ('canon', 'james', 2, 25, 'canon', 'joshua', 6, 25, 'free', E'*And Joshua saved Rahab the harlot alive, and her father''s household, and all that she had; and she dwelleth in Yashar''el (Israel) even unto this day; because she hid the messengers, which Joshua sent to spy out Jericho.* (Joshua 6:25). Rahab was saved and grafted into Yashar''el (Israel) *because she hid the messengers* — the work in which her faith was made perfect. James points to exactly this: she was *justified by works, when she had received the messengers, and had sent them out another way* (James 2:25). The harlot of Jericho becomes a daughter of the covenant by obedient faith — the two-house gathering pattern, faith proved in the deed.'),
  ('canon', 'james', 2, 23, 'canon', 'romans', 4, 3, 'free', E'*For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* (Romans 4:3). Sha''ul (Paul) quotes the same Genesis 15:6 that James quotes — *Abraham believed Elohim (God), and it was counted unto him for righteousness* — and the two are complement, not contradiction. Paul excludes the boasting of flesh-merit (*not of works, lest any man should boast*), James excludes the dead assent that never obeys (*faith without works is dead,* James 2:26). Both honour the same Abraham and the same scripture; Paul guards grace from earning, James guards faith from emptiness. The living faith Paul credits is the obedient faith James requires.'),
  ('canon', 'james', 2, 19, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). James grants the creed of Yashar''el (Israel) — *Thou believest that there is one Elohim (God); thou doest well* (James 2:19) — the Shema, *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* But bare monotheistic assent is not saving faith: *the devils also believe, and tremble.* The confession of the one Elohim (God) must be made alive by works, as Abraham''s and Rahab''s were. The Shema is true and good; held without obedience it is the faith of demons.'),
  ('canon', 'james', 2, 21, 'apocrypha', '1-maccabees', 2, 52, 'extras', E'*Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). Mattithyahu''s dying charge to his sons makes the very fusion James makes: *Abraham found faithful in temptation* (the Aqedah, the offering of Yitzhaq) *and it was imputed to him for righteousness* (Genesis 15:6). The Second-Temple library already read the believing of Genesis 15 and the proving of Genesis 22 as ONE act of faithful obedience — exactly James'' *faith wrought with his works, and by works was faith made perfect* (James 2:22). James is not innovating; he is speaking the framework the Hebrew library already held.'),
  ('canon', 'james', 2, 23, 'apocrypha', 'ecclesiasticus', 44, 20, 'extras', E'*Who kept the law of the Most High, and was in covenant with him: he established the covenant in his flesh; and when he was proved, he was found faithful.* (Sirach 44:20). Sirach''s praise of Abraham binds together everything James binds: he *kept the law of the Most High,* he *was in covenant,* and *when he was proved, he was found faithful.* The keeping of the law, the covenant, and the proving (the Aqedah) are one righteousness — the obedient faith that James calls *made perfect* by works (James 2:22). The wisdom library''s Abraham is James'' Abraham: the believer who kept the commandments and was found faithful when tried.'),
  ('canon', 'james', 2, 21, 'canon', 'hebrews', 11, 17, 'free', E'*By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* (Hebrews 11:17). Hebrews names the same act James names, calling it the work OF faith: *By faith Abraham, when he was tried, offered up Isaac.* Where James says Abraham was *justified by works, when he had offered Isaac his son upon the altar* (James 2:21), Hebrews says it was *by faith* — and both are true, for the offering IS the faith in action. *Accounting that Elohim (God) was able to raise him up* (Hebrews 11:19): the trusting and the obeying are one; the faith and the work are not two things but one living thing.'),
  ('canon', 'james', 2, 25, 'canon', 'hebrews', 11, 31, 'free', E'*By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace.* (Hebrews 11:31). Hebrews lists Rahab among the faithful for the same deed James lists her among the justified: *the harlot Rahab perished not... when she had received the spies with peace.* James: she was *justified by works, when she had received the messengers* (James 2:25). One witness says *by faith,* the other *by works* — because the receiving of the spies was both, the faith of Joshua 2:11 made alive in the hiding of Joshua 6:25. Rahab proves the apostles agree: living faith and obedient works are inseparable.'),

  -- thread: james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3
  ('canon', 'james', 2, 16, 'canon', '1-john', 3, 17, 'free', E'*But whoso hath this world''s good, and seeth his brother have need, and shutteth up his bowels of compassion from him, how dwelleth the love of Elohim (God) in him?* (1 John 3:17). Yochanan (John) names the same hollow word James names: to see a brother in need and *shutteth up his bowels of compassion from him.* James'' picture is identical — *If a brother or sister be naked, and destitute of daily food, And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* (James 2:15-16). A faith that speaks blessing but withholds bread is the dead faith of James 2:17; the love of Elohim (God) does not dwell where compassion is shut up.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s239_j239c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s239_j239c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35',
       E'Have not the faith of the Lord of glory with respect of persons — the chosen poor (Leviticus 19, Sirach 35)',
       E'James opens the keystone chapter with a command rooted in the Torah''s own law: *My brethren, have not the faith of our Lord Yahusha HaMashiach (Lord Jesus Christ), Yahuah (Lord) of glory, with respect of persons* (James 2:1). The assembly that seats the man *with a gold ring, in goodly apparel* in a good place and tells the poor man *Stand thou there, or sit here under my footstool* (James 2:2-3) has *become judges of evil thoughts* (James 2:4) — and the standard that convicts them is Leviticus 19, the same chapter that gives the royal law: *thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). The Torah forbids partiality at the gate — *the judgment is Elohim''s (God''s)* (Deuteronomy 1:17), *thou shalt not respect persons, neither take a gift* (Deuteronomy 16:19) — and the wisdom books say plainly *It is not good to have respect of persons in judgment* (Proverbs 24:23). James'' verdict is the Torah''s: *if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors* (James 2:9). And the partiality is worse than unjust, for it despises the very ones Elohim (God) has chosen: *Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* (James 2:5). Channah sang it — Yahuah (LORD) *raiseth up the poor out of the dust... to make them inherit the throne of glory* (1 Samuel 2:8); Isaiah heard it — *to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2); Proverbs warned it — *whoso mocketh the poor reproacheth his Maker* (Proverbs 17:5). The Hebrew wisdom library held the framework whole: *Yahuah (God) is judge, and with him is no respect of persons* (Sirach 35:12), and *He will not accept any person against a poor man, but will hear the prayer of the oppressed* (Sirach 35:13). To hold the faith of the Lord of glory with partiality is to contradict the character of the One worshipped — the impartial Judge who lifts the poor and hears the oppressed.',
       sv.verse_id, ev.verse_id, 'extras', 8830
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue',
       E'The royal law and the whole law — guilty of all, judged by the law of liberty (Leviticus 19, the Decalogue)',
       E'*If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well* (James 2:8). The *royal law according to the scripture* is not a new commandment that displaced the Torah; it is a commandment OF the Torah, quoted word for word: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18) — the summary the King himself gives. Sha''ul (Paul) names the identical law and calls it the law''s fulfilling, not its abolition: *all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14). And James presses the indivisibility of that law with all his weight: *whosoever shall keep the whole law, and yet offend in one point, he is guilty of all. For he that said, Do not commit adultery, said also, Do not kill* (James 2:10-11). The two commands he cites are the Decalogue verbatim — *Thou shalt not commit adultery* (Exodus 20:14) and *Thou shalt not kill* (Exodus 20:13), given again at Moab (Deuteronomy 5:17-18) — and his logic is the logic of Shechem, where all the people said Amen: *Cursed be he that confirmeth not all the words of this law to do them* (Deuteronomy 27:26). The Torah is one because the Lawgiver is one; to break a single word is to transgress the whole speech of Yahuah (LORD). So far from teaching that the law is abolished, James holds believers to the WHOLE of it and tells them they will be measured by it: *So speak ye, and so do, as they that shall be judged by the law of liberty* (James 2:12). The law of liberty is the Torah kept from a willing heart — the standard of the judgment, not a yoke removed. This is the opposite of antinomianism: the royal law, the whole law, guilty of all, judged by the law of liberty.',
       sv.verse_id, ev.verse_id, 'free', 8833
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28',
       E'Judgment without mercy to the merciless — mercy rejoiceth against judgment (Micah 6, Sirach 28, Matthew 5)',
       E'James closes the law section with the measure-for-measure of mercy: *For he shall have judgment without mercy, that hath shewed no mercy; and mercy rejoiceth against judgment* (James 2:13). This is what Yahuah (LORD) declared he requires through Micah — *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8) — and what the wisdom of Proverbs set as the rule of the unheard: *Whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard* (Proverbs 21:13). The one who footstooled the poor (James 2:2-6) and shut his ears to their cry will himself find judgment without mercy. Yahusha (Jesus), James'' elder brother, blessed the opposite man in the Sermon on the Mount: *Blessed are the merciful: for they shall obtain mercy* (Matthew 5:7) — and James gives both sides of that beatitude in one verse: the merciless meet mercilessness, but over the merciful *mercy rejoiceth against judgment.* The Hebrew wisdom library taught the same reciprocity: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* (Sirach 28:2), and it pressed the searching question — *He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* (Sirach 28:4). The framework is one across the law, the prophets, the wisdom books, and the gospel: mercy shown is mercy obtained, and in the day of judgment mercy triumphs.',
       sv.verse_id, ev.verse_id, 'extras', 8836
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22',
       E'Faith perfected by works — Abraham offered Yitzhaq, and Rahab (Genesis 15, Genesis 22, Genesis 26)',
       E'This is the framework keystone, and it must NOT be read in Reformation grammar as a works-versus-grace debate to be defused. James means what he says: living faith is Torah-obedient faith, and works are the COMPLETION and evidence of faith, not its rival. *What doth it profit, my brethren, though a man say he hath faith, and have not works? can faith save him?... faith, if it hath not works, is dead, being alone* (James 2:14,17). The proof is Abraham: *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar? Seest thou how faith wrought with his works, and by works was faith made perfect?* (James 2:21-22). James welds the two Abraham texts the framework holds as ONE pattern. The belief: *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6) — which James says was *fulfilled,* brought to completion, in the offering decades later (James 2:23). The obedience that perfected it: *Abraham built an altar there... and bound Isaac his son, and laid him on the altar upon the wood* (Genesis 22:9), and the verdict of heaven, *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son* (Genesis 22:12); the oath sworn *because thou hast done this thing* (Genesis 22:16) and the nations blessed *because thou hast obeyed my voice* (Genesis 22:18). And the keystone that holds the whole: *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5) — the faith counted for righteousness was a voice-obeying, commandment-keeping faith. So *by works a man is justified, and not by faith only* (James 2:24). The Second-Temple library already read it this way: *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52) — the very fusion of Genesis 15 and Genesis 22 James makes — and *Who kept the law of the Most High... and when he was proved, he was found faithful* (Sirach 44:20). Rahab is the second witness: she confessed *Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* (Joshua 2:11) and then ACTED it, so she was *justified by works, when she had received the messengers* (James 2:25), saved alive and grafted into Yashar''el (Israel) *because she hid the messengers* (Joshua 6:25). Mere assent is the dead faith of the demons who *believe, and tremble* (James 2:19) at the Shema — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) — true and good, but lifeless without works. And Sha''ul (Paul) is the COMPLEMENT, not the contradiction: he quotes the same *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3), excluding flesh-merit boasting where James excludes dead assent — the same Abraham, the same scripture. Hebrews binds the two witnesses by faith: *By faith Abraham, when he was tried, offered up Isaac* (Hebrews 11:17) and *By faith the harlot Rahab perished not... when she had received the spies with peace* (Hebrews 11:31) — for the offering and the receiving WERE the faith in action. *For as the body without the spirit is dead, so faith without works is dead also* (James 2:26): obedience-less belief is no living faith at all.',
       sv.verse_id, ev.verse_id, 'extras', 8839
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3',
       E'Depart in peace, be ye warmed — but ye give them not: faith that withholds bread is dead (1 John 3)',
       E'Between the call to mercy (James 2:13) and the keystone on faith and works, James gives the homeliest test of a living faith — the brother in need: *If a brother or sister be naked, and destitute of daily food, And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* (James 2:15-16). A faith that speaks the blessing but withholds the bread profits nothing; *even so faith, if it hath not works, is dead, being alone* (James 2:17). Yochanan (John) names the same hollow profession and weighs it the same way: *whoso hath this world''s good, and seeth his brother have need, and shutteth up his bowels of compassion from him, how dwelleth the love of Elohim (God) in him?* (1 John 3:17). The love of Elohim (God) does not dwell where compassion is shut up; the faith that warms with words alone is the dead faith James condemns. This is the seam that joins the chosen-poor of the chapter''s opening to the works-of-faith of its close: to honour the rich and footstool the poor, and then to dismiss the destitute with empty blessing, is the very faith-without-works that cannot save.',
       sv.verse_id, ev.verse_id, 'free', 8842
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:15 — *thou shalt not respect the person of the poor, nor honour the person of the mighty* the Torah command James enforces against the partial assembly (James 2:1,9).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 1:17 — *Ye shall not respect persons in judgment... for the judgment is Elohim''s (God''s)* the charge to the judges; the partial assembly usurps Elohim''s (God''s) impartial judgment (James 2:9).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 16:19 — *thou shalt not respect persons, neither take a gift* the gift that blinds; the assembly dazzled by the gold ring is blinded the same way (James 2:2-4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 24:23 — *It is not good to have respect of persons in judgment* the wisdom books say plainly what James presses (James 2:9).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Samuel 2:8 — *He raiseth up the poor out of the dust... to make them inherit the throne of glory* Channah''s song; the poor Elohim (God) *chosen... rich in faith, and heirs of the kingdom* (James 2:5).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 66:2 — *to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* the man Elohim (God) regards is the one the assembly footstools (James 2:5).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Proverbs 17:5 — *Whoso mocketh the poor reproacheth his Maker* the despising of the poor is an offence against the Creator (James 2:6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Sirach 35:12 — *Yahuah (God) is judge, and with him is no respect of persons* the wisdom library''s frame: partiality contradicts the character of the One worshipped (James 2:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Sirach 35:13 — *He will not accept any person against a poor man, but will hear the prayer of the oppressed* the assembly sides with the oppressor against the oppressed Elohim (God) hears (James 2:6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the royal law *according to the scripture* (James 2:8), a commandment OF the Torah, not a replacement of it.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:14 — *all the law is fulfilled in one word... Thou shalt love thy neighbour as thyself* Paul names the same royal law and calls it the law''s fulfilling, not its abolition (James 2:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 27:26 — *Cursed be he that confirmeth not all the words of this law to do them* the Shechem Amen; the Torah confirmed in its wholeness, *guilty of all* if one point is broken (James 2:10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 20:14 — *Thou shalt not commit adultery* the Decalogue verbatim; *he that said, Do not commit adultery* (James 2:11), the one voice of the one Lawgiver.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 20:13 — *Thou shalt not kill* the Decalogue verbatim; *said also, Do not kill* (James 2:11), proving the Torah is one indivisible whole.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 5:18 — *Neither shalt thou commit adultery* the Decalogue re-spoken at Moab; the Torah of Sinai and Moab is one law (James 2:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Deuteronomy 5:17 — *Thou shalt not kill* the Decalogue re-spoken at Moab; the indivisible standard by which believers *shall be judged* (James 2:11-12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 6:8 — *to do justly, and to love mercy, and to walk humbly with thy Elohim (God)* what Yahuah (LORD) requires; the merciful find *mercy rejoiceth against judgment* (James 2:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 21:13 — *Whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard* the measure-for-measure James states: judgment without mercy to the merciless (James 2:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:7 — *Blessed are the merciful: for they shall obtain mercy* the beatitude of James'' elder brother; James gives both sides in one verse (James 2:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 28:2 — *Forgive your neighbour the hurt... so shall your sins also be forgiven* the wisdom library''s reciprocity of mercy; the merciless cannot claim mercy (James 2:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* the belief, *fulfilled* — brought to completion — in the offering of Yitzhaq (James 2:22-23).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:9 — *Abraham built an altar there... and bound Isaac his son, and laid him on the altar* the work in which faith was made perfect; *justified by works, when he had offered Isaac* (James 2:21-22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:12 — *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son* the verdict of heaven; by the not-withholding *faith was made perfect* (James 2:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 22:16 — *By myself have I sworn... because thou hast done this thing, and hast not withheld thy son* the oath sworn on the obedience; the doing draws forth the covenant (James 2:21).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* the obedient faith Yahuah (LORD) crowns; *by works a man is justified, and not by faith only* (James 2:24).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Genesis 26:5 — *Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* THE KEYSTONE: the faith counted for righteousness was a Torah-keeping faith (James 2:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Joshua 2:11 — *Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* Rahab''s confession, made living by the hiding of the spies; *justified by works* (James 2:25).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Joshua 6:25 — *she dwelleth in Yashar''el (Israel) even unto this day; because she hid the messengers* Rahab grafted into Yashar''el (Israel) by the work of faith; *justified by works, when she had received the messengers* (James 2:25).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Deuteronomy 6:4 — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* the Shema; *thou believest that there is one Elohim (God); thou doest well: the devils also believe, and tremble* (James 2:19) — assent without works is the faith of demons.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'1 Maccabees 2:52 — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* the very fusion of Genesis 15 and Genesis 22 James makes; the Hebrew library already held it (James 2:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Sirach 44:20 — *Who kept the law of the Most High... and when he was proved, he was found faithful* the keeping of the law, the covenant, and the proving are one righteousness; James'' obedient faith (James 2:23).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 12, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac* the same act James calls *justified by works* — the offering IS the faith in action (James 2:21).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 13, E'Hebrews 11:31 — *By faith the harlot Rahab perished not... when she had received the spies with peace* the same deed James calls *justified by works* — receiving the spies was the faith made alive (James 2:25).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 14, E'Romans 4:3 — *Abraham believed Elohim (God), and it was counted unto him for righteousness* the COMPLEMENT, not contradiction: Paul excludes flesh-merit boasting, James excludes dead assent; same Abraham, same scripture (James 2:23).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:17 — *seeth his brother have need, and shutteth up his bowels of compassion from him, how dwelleth the love of Elohim (God) in him?* the same hollow profession James names; faith that withholds bread is dead (James 2:15-17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_james_03.sql (S239 James 3) -----
-- =====================================================================
-- S239 minion — JAMES 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: JAMES 3 (18 verses) — the wisdom-literature heart of the epistle: the bridled tongue,
-- the fire of an unruly member, the blessing-and-cursing mouth, the fountain and the fig-tree, and
-- the two wisdoms — the earthly and the wisdom that is from above.
-- Tag: j239c3 (temp view _s239_j239c3_lookup).
-- Sort band: floor 8860, step 3 (8860, 8863, 8866, 8869, 8872 used; under 8890).
-- Source is ALWAYS the canon James verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (James = the wisdom of the two-house remnant, Proverbs and Sirach made apostolic,
-- the perfect law of liberty kept; NO replacement theology, NO law-vs-grace antithesis). Chapter 3 is
-- the bridled-tongue chapter — Proverbs and Sirach are everywhere under its skin. The tongue is the
-- little member that boasts great things, the fire that defileth the whole body; with it men bless
-- Elohim (God) the Father and curse men made after his similitude (Genesis 1:26-27). A fountain sends
-- not sweet and bitter from one place; the fig-tree bears not olive berries — the mouth is known by
-- its fruit (Matthew 7:16-18). And the chapter closes on the two wisdoms: the earthly, sensual,
-- devilish; and *the wisdom that is from above* — *first pure, then peaceable, gentle... full of mercy
-- and good fruits*, a near-verbatim echo of the Wisdom of Solomon's hymn to wisdom *holy... undefiled...
-- pure... kind to man* (Wisdom 7:22-27), the fruit of righteousness sown in peace. No Christology
-- carve-out arises in this chapter (the Formed is not in view); the Father is named the One blessed
-- (3:9). Preserve the pull's sacred-name renderings exactly.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   be not many masters; if any offend not in word, the same is a perfect man
--           Tanakh: none warranted (carried in the tongue thread at v.5-8)
--           Extras: none warranted   NT: none warranted
--   v.3-4   bits in the horses' mouths; the ships turned with a small helm
--           Tanakh: none warranted (the figure feeds the tongue thread)   Extras: none warranted
--           NT: none warranted
--   v.5-8   the tongue a little member, a fire, a world of iniquity, an unruly evil, deadly poison
--           Tanakh: Proverbs 16:27 (in his lips there is as a burning fire), Proverbs 18:21 (death
--                   and life are in the power of the tongue), Psalm 39:1 (I will keep my mouth with a
--                   bridle), Psalm 140:3 (sharpened their tongues like a serpent; adders' poison)
--           Extras: Ecclesiasticus/Sirach 28:11-26 (the stroke of the tongue breaks the bones)
--           NT: none warranted
--   v.9-10  therewith bless we Elohim... and curse we men, made after the similitude of Elohim
--           Tanakh: Genesis 1:26-27 (in our image, after our likeness), Genesis 9:6 (in the image of
--                   Elohim made he man)
--           Extras: none warranted   NT: none warranted
--   v.11-12 the fountain sweet and bitter; the fig tree bear olive berries
--           Tanakh: none warranted   Extras: none warranted
--           NT: Matthew 7:16-18 (ye shall know them by their fruits; a good tree... a corrupt tree)
--   v.13-18 the two wisdoms; the wisdom from above first pure then peaceable; fruit of righteousness
--           Tanakh: Proverbs 2:6 (Yahuah giveth wisdom: out of his mouth cometh knowledge), Proverbs
--                   3:13,17-18 (her ways are ways of pleasantness... a tree of life), Job 28:28 (the
--                   fear of Yahuah, that is wisdom); Isaiah 32:17 (the work of righteousness shall be
--                   peace), Proverbs 11:18 (to him that soweth righteousness... a sure reward),
--                   Hosea 10:12 (sow to yourselves in righteousness, reap in mercy)
--           Extras: Wisdom of Solomon 7:22-27 (wisdom holy... undefiled... pure... kind to man — the
--                   near-verbatim parallel), Ecclesiasticus/Sirach 1:1-10 (all wisdom comes from Yahuah)
--           NT: none warranted (the wisdom-from-above root is the Tanakh + Wisdom hymn)
--
-- THREADS (slug -> target libraries):
--   8860 james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28   (Tanakh + Extras)
--   8863 james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1     (Tanakh)
--   8866 james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7          (NT)
--   8869 james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7       (Tanakh + Extras)  [BLESSING]
--   8872 james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10           (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s239_j239c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28
  ('canon', 'james', 3, 6, 'canon', 'proverbs', 16, 27, 'free', E'*An ungodly man diggeth up evil: and in his lips there is as a burning fire.* (Proverbs 16:27). Proverbs already named the mouth a hearth of fire — *in his lips there is as a burning fire.* James takes up the figure and presses it home: *the tongue is a fire, a world of iniquity... and setteth on fire the course of nature; and it is set on fire of hell* (James 3:6). The little member that *boasteth great things,* the spark by which *how great a matter a little fire kindleth* (James 3:5), is the very burning lip the wise man warned of; the apostle of the dispersed tribes speaks Proverbs'' own wisdom on the tongue.'),
  ('canon', 'james', 3, 5, 'canon', 'proverbs', 18, 21, 'free', E'*Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* (Proverbs 18:21). Proverbs weighs the tongue with the gravest scales — *death and life are in the power of the tongue.* James says the same of *a little member* that *boasteth great things* (James 3:5) and that *can no man tame; it is an unruly evil, full of deadly poison* (James 3:8). The power Proverbs set in the tongue is the power James warns is loosed for ruin; the bridled tongue is life, the unbridled is death, and the doer of the perfect law of liberty must master it.'),
  ('canon', 'james', 3, 2, 'canon', 'psalms', 39, 1, 'free', E'*I said, I will take heed to my ways, that I sin not with my tongue: I will keep my mouth with a bridle, while the wicked is before me.* (Psalm 39:1). David resolved to *keep my mouth with a bridle* — the very image James presses: *If any man offend not in word, the same is a perfect man, and able also to bridle the whole body* (James 3:2), as a man puts *bits in the horses'' mouths, that they may obey us* (James 3:3). The bridled mouth of the psalmist is the bridled tongue of the perfect man; to govern the tongue is to govern the whole body, the wisdom David sought and James commends.'),
  ('canon', 'james', 3, 8, 'canon', 'psalms', 140, 3, 'free', E'*They have sharpened their tongues like a serpent; adders'' poison is under their lips. Selah.* (Psalm 140:3). The psalmist names the wicked tongue with the very venom James names: *adders'' poison is under their lips.* James says *the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8). The serpent''s poison David found under the lips of the violent is the *deadly poison* of the untamed tongue — the one member of the body man cannot subdue, deadly as the adder, needing the bridle no man supplies of himself.'),
  ('canon', 'james', 3, 6, 'apocrypha', 'ecclesiasticus', 28, 17, 'extras', E'*The stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones.* (Ecclesiasticus 28:17). Sirach is James''s nearest companion on the tongue: *an hasty contention kindleth a fire* (Sirach 28:11), *the stroke of the tongue breaks the bones* (28:17), *many have fallen by the edge of the sword: but not so many as have fallen by the tongue* (28:18). James re-speaks the very same: *the tongue is a fire... it defileth the whole body* (James 3:6). The wisdom that bade men *weigh your words in a balance, and make a door and bar for your mouth* (Sirach 28:25) is the wisdom James presses on the scattered tribes — the bridle on the burning, bone-breaking tongue.'),
  -- thread: james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1
  ('canon', 'james', 3, 9, 'canon', 'genesis', 1, 26, 'free', E'*And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* (Genesis 1:26). James grounds the sin of the cursing tongue in the creation word: *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God)* (James 3:9). The *similitude* is Genesis'' *likeness* — *in our image, after our likeness.* To curse a man is to revile the image of the One we bless; the same mouth cannot rightly bless the Father and curse the man who bears the Father''s likeness.'),
  ('canon', 'james', 3, 9, 'canon', 'genesis', 1, 27, 'free', E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). The creation word stands doubled for emphasis — *in the image of Elohim (God) created he him.* This is the *similitude of Elohim (God)* after which men are made (James 3:9), and which James says the cursing tongue assaults: *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be* (James 3:10). The image that Elohim (God) set on man at creation is the reason the blessing and the cursing cannot both rightly come from one mouth.'),
  ('canon', 'james', 3, 9, 'canon', 'genesis', 9, 6, 'free', E'*Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* (Genesis 9:6). After the flood the image is named again as the ground of man''s sacredness — *for in the image of Elohim (God) made he man.* James reasons by the same image: men *are made after the similitude of Elohim (God)* (James 3:9), and therefore the tongue that curses them sins against the One whose likeness they bear. As shedding a man''s blood violates the image, so does cursing the man who bears it; *these things ought not so to be* (James 3:10).'),
  -- thread: james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7
  ('canon', 'james', 3, 12, 'canon', 'matthew', 7, 16, 'free', E'*Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* (Matthew 7:16). The Sermon on the Mount is James''s twin, and here they speak as one. Yahusha (Jesus) asks *do men gather grapes of thorns, or figs of thistles?* — James asks *Can the fig tree, my brethren, bear olive berries? either a vine, figs?* (James 3:12). Each tree brings forth after its own kind, and *so can no fountain both yield salt water and fresh* (James 3:12). The mouth, like the tree, is known by what it bears — the heart''s wisdom shows in the fruit of the lips.'),
  ('canon', 'james', 3, 12, 'canon', 'matthew', 7, 17, 'free', E'*Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* (Matthew 7:17). The Master''s rule is James''s rule: *every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* James presses it on the divided mouth — *Doth a fountain send forth at the same place sweet water and bitter?* (James 3:11), *Can the fig tree... bear olive berries?* (James 3:12). The blessing-and-cursing mouth is the tree at war with its own kind; the good tree and the good fountain bring forth one fruit, and by it the wise man is known.'),
  ('canon', 'james', 3, 11, 'canon', 'matthew', 7, 18, 'free', E'*A good tree cannot bring forth evil fruit, neither can a corrupt tree bring forth good fruit.* (Matthew 7:18). Yahusha (Jesus) lays the impossibility bare — *a good tree cannot bring forth evil fruit.* James sets the same impossibility in the fountain: *Doth a fountain send forth at the same place sweet water and bitter?... so can no fountain both yield salt water and fresh* (James 3:11-12). One source, one kind of water; one tree, one kind of fruit. The mixed mouth that blesses and curses (James 3:10) is the unnatural thing the Master''s parable forbids — the fountain and the fig-tree testify against it.'),
  -- thread: james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7  [BLESSING]
  ('canon', 'james', 3, 17, 'apocrypha', 'the-wisdom-of-solomon', 7, 22, 'extras', E'*For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good quick, which cannot be letted, ready to do good,* (Wisdom of Solomon 7:22). Here is the near-verbatim parallel to James''s wisdom from above. Solomon''s hymn names the spirit of wisdom *holy... undefiled... loving the thing that is good... ready to do good* — and James says *the wisdom that is from above is first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits* (James 3:17). The *undefiled* of Solomon is the *pure* of James; the *ready to do good* is the *good fruits.* The two texts hymn one wisdom, descending from above, the gift the man who lacks must ask of Elohim (God).'),
  ('canon', 'james', 3, 17, 'apocrypha', 'the-wisdom-of-solomon', 7, 23, 'extras', E'*Kind to man, steadfast, sure, free from care, having all power, overseeing all things, and going through all understanding, pure, and most subtil, spirits.* (Wisdom of Solomon 7:23). Solomon''s wisdom is *kind to man... pure* — and James''s wisdom from above is *gentle, and easy to be intreated, full of mercy and good fruits, without partiality, and without hypocrisy* (James 3:17). The *kind to man* answers the *gentle* and *full of mercy*; the *pure* answers James''s *first pure.* This is the wisdom that is not *earthly, sensual, devilish* (James 3:15) but heavenly — peaceable, merciful, single-hearted, the very temper Solomon prized above sceptre and throne.'),
  ('canon', 'james', 3, 17, 'apocrypha', 'the-wisdom-of-solomon', 7, 25, 'extras', E'*For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* (Wisdom of Solomon 7:25). Solomon names the source of wisdom from above: *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty.* This is why James can call it *the wisdom that is from above* and say it is *first pure* (James 3:17) — *therefore can no defiled thing fall into her.* The earthly wisdom rises from envy and strife (James 3:14-16); the heavenly descends from the glory of the Almighty, pure at its fountainhead, and so pure in all its fruits.'),
  ('canon', 'james', 3, 13, 'canon', 'proverbs', 2, 6, 'free', E'*For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding.* (Proverbs 2:6). The root of the wisdom from above is Proverbs'' own confession — *Yahuah (LORD) giveth wisdom.* James opens the matter by asking *Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom* (James 3:13), and answers it with *the wisdom that is from above* (James 3:17). The knowledge that comes *out of his mouth* is the gift descending from the Father of lights; true wisdom is shown not in boasting but in meek and good works.'),
  ('canon', 'james', 3, 17, 'canon', 'proverbs', 3, 17, 'free', E'*Her ways are ways of pleasantness, and all her paths are peace.* (Proverbs 3:17). Proverbs paints wisdom''s ways: *ways of pleasantness, and all her paths are peace* — *She is a tree of life to them that lay hold upon her* (Proverbs 3:18). James''s wisdom from above wears the same face: *first pure, then peaceable, gentle... full of mercy and good fruits* (James 3:17), and bears *the fruit of righteousness... sown in peace of them that make peace* (James 3:18). The peace that marks all wisdom''s paths in Proverbs is the peaceableness and the peace-sown fruit of the wisdom James commends.'),
  ('canon', 'james', 3, 13, 'canon', 'job', 28, 28, 'free', E'*And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding.* (Job 28:28). When Job had searched the deep places for wisdom, the answer was *the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding.* James asks who is *a wise man and endued with knowledge* and bids him show it *with meekness of wisdom* (James 3:13), not with *bitter envying and strife* (James 3:14) — for that wisdom is *earthly, sensual, devilish* (James 3:15). To depart from evil, to be pure and peaceable, is the wisdom Job names and James seeks, the wisdom that fears Yahuah (Lord) and comes down from above.'),
  ('canon', 'james', 3, 17, 'apocrypha', 'ecclesiasticus', 1, 1, 'extras', E'*All wisdom comes from Yahuah (God), and is with him for ever.* (Ecclesiasticus 1:1). Sirach opens with the confession James assumes: *all wisdom comes from Yahuah (God).* It is *created before all things* (Sirach 1:4) and given *to them that love him* (Sirach 1:10). This is why James names the heavenly temper *the wisdom that is from above* (James 3:17) — not man''s envious cleverage but the gift descending from Elohim (God), pure and peaceable, full of mercy and good fruits. The wisdom Sirach says comes from Yahuah (God) is the wisdom James says comes down from above.'),
  -- thread: james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10
  ('canon', 'james', 3, 18, 'canon', 'isaiah', 32, 17, 'free', E'*And the work of righteousness shall be peace; and the effect of righteousness quietness and assurance for ever.* (Isaiah 32:17). Isaiah binds righteousness and peace as one: *the work of righteousness shall be peace.* James closes his wisdom-chapter with the same wedding: *the fruit of righteousness is sown in peace of them that make peace* (James 3:18). The wisdom from above, *peaceable... full of mercy and good fruits* (James 3:17), yields the harvest Isaiah foretold — righteousness whose work and effect is peace, sown by peacemakers and reaped in quietness and assurance.'),
  ('canon', 'james', 3, 18, 'canon', 'proverbs', 11, 18, 'free', E'*The wicked worketh a deceitful work: but to him that soweth righteousness shall be a sure reward.* (Proverbs 11:18). Proverbs sets the sowing of righteousness against the deceitful work of the wicked — *to him that soweth righteousness shall be a sure reward.* James names that same sowing the harvest of heavenly wisdom: *the fruit of righteousness is sown in peace of them that make peace* (James 3:18), over against the *confusion and every evil work* where *envying and strife is* (James 3:16). The sure reward Proverbs promises the sower of righteousness is the fruit James says is sown in peace.'),
  ('canon', 'james', 3, 18, 'canon', 'hosea', 10, 12, 'free', E'*Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you.* (Hosea 10:12). Hosea calls Yashar''el (Israel) to the very sowing James commends: *Sow to yourselves in righteousness, reap in mercy.* James says *the fruit of righteousness is sown in peace of them that make peace* (James 3:18), the harvest of wisdom that is *full of mercy and good fruits* (James 3:17). To sow righteousness and reap mercy, to break up the fallow ground and seek Yahuah (LORD), is the peaceable work of the wise — and Yahuah (LORD) rains righteousness on the seed they sow.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s239_j239c3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s239_j239c3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28',
       E'The tongue a fire, an unruly evil full of deadly poison (Proverbs 18, Psalm 39, Sirach 28)',
       E'James turns the whole wisdom of the Hebrew library upon the tongue. *If any man offend not in word, the same is a perfect man, and able also to bridle the whole body* (James 3:2) — and the bridle is David''s own resolve: *I said, I will take heed to my ways, that I sin not with my tongue: I will keep my mouth with a bridle* (Psalm 39:1). As *bits in the horses'' mouths* turn the whole beast (James 3:3), so the bridled tongue governs the whole man. But unbridled it is fire: *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth! And the tongue is a fire, a world of iniquity... and setteth on fire the course of nature; and it is set on fire of hell* (James 3:5-6) — Proverbs had said as much, *in his lips there is as a burning fire* (Proverbs 16:27). It deals in death and life: *Death and life are in the power of the tongue* (Proverbs 18:21). And no man masters it of himself — *the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8); *They have sharpened their tongues like a serpent; adders'' poison is under their lips* (Psalm 140:3). The Second-Temple library said the same with its own force: *an hasty contention kindleth a fire* (Sirach 28:11), *the stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones* (Sirach 28:17), *many have fallen by the edge of the sword: but not so many as have fallen by the tongue* (Sirach 28:18); and so the wise counsel, *weigh your words in a balance, and make a door and bar for your mouth* (Sirach 28:25). James, writing to the twelve tribes scattered abroad, gathers Proverbs, the Psalms, and Sirach into one warning: the little member is a burning, bone-breaking, serpent-poisoned fire, and the doer of the perfect law of liberty must put a bridle on it.',
       sv.verse_id, ev.verse_id, 'extras', 8860
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1',
       E'Blessing and cursing from one mouth: men made after the similitude of Elohim (God) (Genesis 1, 9)',
       E'James names the deepest scandal of the divided tongue: *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God). Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be* (James 3:9-10). The *similitude* is the creation word: *And Elohim (God) said, Let us make man in our image, after our likeness* (Genesis 1:26); *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them* (Genesis 1:27). To curse a man is to revile the very image of the One we bless — the same likeness Genesis names again as the ground of man''s sacredness after the flood: *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). As the shedding of blood violates the image, so does the cursing tongue. The mouth that blesses the Father cannot rightly curse the man who bears the Father''s likeness; *these things ought not so to be.* The wisdom from above honors the image of Elohim (God) in every man made after his similitude.',
       sv.verse_id, ev.verse_id, 'free', 8863
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7',
       E'The fountain and the fig-tree: every tree known by its own fruit (Matthew 7)',
       E'*Doth a fountain send forth at the same place sweet water and bitter? Can the fig tree, my brethren, bear olive berries? either a vine, figs? so can no fountain both yield salt water and fresh* (James 3:11-12). James reasons from nature against the blessing-and-cursing mouth of the verses before: each spring yields one water, each tree its own fruit. This is the Sermon on the Mount, James''s twin, spoken in another key. Yahusha (Jesus) said *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* (Matthew 7:16); *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit* (Matthew 7:17); *A good tree cannot bring forth evil fruit, neither can a corrupt tree bring forth good fruit* (Matthew 7:18). The Master''s rule and the apostle''s figure are one: the heart is known by the fruit of the lips. A mouth that blesses and curses, a fountain sweet and bitter, is the unnatural thing the parable forbids — the good tree and the pure spring bring forth one kind, and by that kind the wise man is known.',
       sv.verse_id, ev.verse_id, 'free', 8866
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7',
       E'The wisdom that is from above: first pure, then peaceable (Proverbs, Job, Wisdom of Solomon, Sirach)',
       E'James sets two wisdoms side by side. The one is *earthly, sensual, devilish,* rising from *bitter envying and strife,* and where it reigns *there is confusion and every evil work* (James 3:15-16). The other comes down from heaven: *But the wisdom that is from above is first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits, without partiality, and without hypocrisy* (James 3:17). Its root is Proverbs'' own confession — *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6) — and its ways are Proverbs'' ways: *Her ways are ways of pleasantness, and all her paths are peace* (Proverbs 3:17). It is the wisdom Job found at the end of his searching: *Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28). And it is the very wisdom the restored library had already hymned in words James echoes almost verbatim: *in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good... ready to do good, Kind to man* (Wisdom of Solomon 7:22-23) — Solomon''s *undefiled* and *kind to man* are James''s *pure* and *gentle... full of mercy.* Its source is *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her* (Wisdom of Solomon 7:25); and as Sirach confessed, *all wisdom comes from Yahuah (God), and is with him for ever* (Ecclesiasticus 1:1). This is why James calls it *from above* — not man''s envious leverage but the gift descending from the Father of lights, pure at its fountainhead and pure in all its fruits, shown not in boasting but in the *good conversation* and *works with meekness of wisdom* of the wise man (James 3:13).',
       sv.verse_id, ev.verse_id, 'extras', 8869
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10',
       E'The fruit of righteousness sown in peace of them that make peace (Isaiah 32, Proverbs 11, Hosea 10)',
       E'James closes the wisdom-chapter on a harvest: *And the fruit of righteousness is sown in peace of them that make peace* (James 3:18). It is the natural yield of the wisdom from above, which is *peaceable... full of mercy and good fruits* (James 3:17), over against the *confusion and every evil work* that envy and strife bring forth (James 3:16). The prophets had already wedded righteousness to peace: *And the work of righteousness shall be peace; and the effect of righteousness quietness and assurance for ever* (Isaiah 32:17). Proverbs had set the sowing of righteousness against the deceit of the wicked: *to him that soweth righteousness shall be a sure reward* (Proverbs 11:18). And Hosea had called Yashar''el (Israel) to that very sowing: *Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you* (Hosea 10:12). The peacemakers who sow in peace reap the sure reward Proverbs promised, the peace Isaiah foretold, the mercy Hosea pledged — Yahuah (LORD) himself raining righteousness on the seed they sow. This is the end of heavenly wisdom: not strife, but a harvest of righteousness in peace.',
       sv.verse_id, ev.verse_id, 'free', 8872
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 39:1 — *I will keep my mouth with a bridle* David''s resolve, the very image of *bridle the whole body* / *bits in the horses'' mouths* (James 3:2-3).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:21 — *Death and life are in the power of the tongue* the gravest weight of the little member that *boasteth great things* (James 3:5).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:27 — *in his lips there is as a burning fire* the mouth a hearth of fire; *the tongue is a fire, a world of iniquity* (James 3:6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 28:17 — *the stroke of the tongue breaks the bones* James''s nearest companion on the burning, bone-breaking tongue; *the tongue is a fire... it defileth the whole body* (James 3:6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 140:3 — *adders'' poison is under their lips* the serpent-venom of the untamed tongue; *an unruly evil, full of deadly poison* (James 3:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=140 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *Let us make man in our image, after our likeness* the *similitude of Elohim (God)* after which men are made (James 3:9).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:27 — *in the image of Elohim (God) created he him* the image the cursing tongue assaults; *these things ought not so to be* (James 3:10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:6 — *for in the image of Elohim (God) made he man* the image the ground of man''s sacredness; as shedding blood violates it, so the cursing tongue (James 3:9-10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:18 — *A good tree cannot bring forth evil fruit* the impossibility set in the fountain: *Doth a fountain send forth... sweet water and bitter?* (James 3:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:16 — *Do men gather grapes of thorns, or figs of thistles?* the twin of *Can the fig tree... bear olive berries? either a vine, figs?* (James 3:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:17 — *every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit* each tree after its own kind, as each fountain (James 3:11-12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 2:6 — *Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge* the root of the wisdom from above; the wise man shown *with meekness of wisdom* (James 3:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 28:28 — *the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* the wisdom Job found, not envy and strife (James 3:13-15).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 7:22 — *an understanding spirit holy... undefiled... loving the thing that is good... ready to do good* the near-verbatim parallel; *first pure... full of mercy and good fruits* (James 3:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 7:23 — *Kind to man... pure* Solomon''s *kind to man* answers James''s *gentle... full of mercy*; the heavenly temper, not the *earthly, sensual, devilish* (James 3:15,17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 7:25 — *the breath of the power of Yahuah (God)... therefore can no defiled thing fall into her* the source that makes it *from above* and *first pure* (James 3:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Proverbs 3:17 — *Her ways are ways of pleasantness, and all her paths are peace* the peace that marks all wisdom''s paths; *peaceable... the fruit of righteousness... sown in peace* (James 3:17-18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Ecclesiasticus/Sirach 1:1 — *All wisdom comes from Yahuah (God), and is with him for ever* the confession James assumes in calling it *from above* (James 3:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 32:17 — *the work of righteousness shall be peace* the prophets'' wedding of righteousness and peace; *the fruit of righteousness is sown in peace* (James 3:18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:18 — *to him that soweth righteousness shall be a sure reward* the sower''s sure reward, over against *every evil work* (James 3:16,18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 10:12 — *Sow to yourselves in righteousness, reap in mercy... till he come and rain righteousness upon you* Yashar''el (Israel) called to the very sowing of the peacemakers (James 3:18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_james_04.sql (S239 James 4) -----
-- =====================================================================
-- S239 minion — JAMES 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: JAMES 4 (17 verses) — the proud resisted and the humble given grace; the
-- friendship of the world refused; the one Lawgiver; the boasting of tomorrow rebuked.
-- Tag: j239c4 (temp view _s239_j239c4_lookup).
-- Sort band: floor 8890, step 3 (8890, 8893, 8896, 8899, 8902, 8905 used; under 8920).
-- Source is ALWAYS the canon James verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (James = the wisdom-of-the-two-house-remnant letter, Proverbs and Sirach
-- made apostolic, written *to the twelve tribes which are scattered abroad*; the Torah in force,
-- the perfect law of liberty kept). Chapter 4 is wisdom-saturated: the wars among the brethren
-- spring from the lusts that war in the members (4:1-3); the friendship of the world is the
-- spiritual adultery the prophets named (4:4); the load-bearing center is the Tanakh quotation
-- *Elohim (God) resisteth the proud, but giveth grace unto the humble* (4:6 = Proverbs 3:34
-- *according to the scripture*), grace flowing to the humble who draw nigh, cleanse their hands,
-- and humble themselves (4:7-10 / Zechariah 1:3); *there is one lawgiver* (4:12) is the one
-- Elohim (God) of Deuteronomy 6:4, Yahuah our lawgiver (Isaiah 33:22), who alone saves and
-- destroys; and the boasting of tomorrow is rebuked by the vapour-life of the wisdom books
-- (4:13-17 / Proverbs 27:1). No replacement theology, no law-vs-grace antithesis: the Lawgiver
-- is honored, the proud abased, the humble lifted. Christology: *humble yourselves in the sight
-- of Yahuah (Lord), and he shall lift you up* (4:10) and *If Yahuah (Lord) will* (4:15) — the
-- pull renders the YHWH-bearing Lord as Yahuah (Lord); preserve it exactly.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   wars and fightings from your lusts; ye ask amiss
--           Tanakh: Psalm 66:18 (if I regard iniquity in my heart, Yahuah will not hear me)
--           Extras: none warranted   NT: none warranted (the ask-amiss root is the Tanakh prayer-bar)
--   v.4     ye adulterers; the friendship of the world is enmity with Elohim
--           Tanakh: Exodus 34:14-16 (a jealous Elohim; go a whoring after their gods),
--                   Deuteronomy 6:14-15 (go not after other gods; a jealous Elohim),
--                   Hosea 2:2 (she is not my wife... her adulteries), Hosea 2:13 (went after her lovers, forgat me)
--           Extras: none warranted   NT: 1 John 2:15 (love not the world... the love of the Father is not in him)
--   v.5-6   the spirit lusteth to envy; Elohim resisteth the proud, giveth grace to the humble [BLESSING]
--           Tanakh: Proverbs 3:34 (he scorneth the scorners: but he giveth grace unto the lowly),
--                   Proverbs 29:23 (a man's pride shall bring him low... honour shall uphold the humble),
--                   Isaiah 57:15 (the high and lofty One... with him that is of a contrite and humble spirit),
--                   Psalm 138:6 (though Yahuah be high, yet hath he respect unto the lowly)
--           Extras: Sirach 10:7 (pride is hateful before Yahuah), Sirach 10:12-15 (the beginning of
--                   pride... Yahuah has cast down the thrones of proud princes, set up the meek)
--           NT: 1 Peter 5:5 (be clothed with humility: for Elohim resisteth the proud, giveth grace to the humble — same Proverbs 3:34)
--   v.7-10  submit; draw nigh and he will draw nigh; cleanse hands, purify hearts; humble yourselves
--           Tanakh: Zechariah 1:3 (turn ye unto me... and I will turn unto you),
--                   Psalm 24:3-4 (he that hath clean hands, and a pure heart),
--                   Isaiah 55:6-7 (seek Yahuah while he may be found... let the wicked forsake his way),
--                   2 Chronicles 7:14 (if my people shall humble themselves, and pray, and seek my face... I will heal their land)
--           Extras: none warranted   NT: none warranted (the draw-nigh/return root is the Tanakh repentance call)
--   v.11-12 speak not evil; there is one lawgiver able to save and to destroy
--           Tanakh: Isaiah 33:22 (Yahuah is our lawgiver... he will save us),
--                   Deuteronomy 32:39 (I kill, and I make alive... neither is there any that can deliver out of my hand),
--                   Leviticus 19:16 (thou shalt not go up and down as a talebearer among thy people)
--           Extras: none warranted   NT: none warranted (the one-Lawgiver root is Deuteronomy 6:4 carried in prose)
--   v.13-17 boast not of tomorrow; your life is a vapour; if the Lord will
--           Tanakh: Proverbs 27:1 (boast not thyself of to morrow), Psalm 39:5-6 (every man at his
--                   best state is altogether vanity... heapeth up riches, knoweth not who shall gather),
--                   Psalm 90:9-10 (the days of our years... soon cut off, and we fly away)
--           Extras: Sirach 11:18-19 (he says, I have found rest... yet knoweth not what time shall come
--                   upon him, and that he must leave those things to others, and die)
--           NT: Luke 12:16-21 (the rich fool: this night thy soul shall be required of thee)
--
-- THREADS (slug -> target libraries):
--   8890 james-4-wars-and-fightings-from-your-lusts-ye-ask-amiss-psalm-66          (Tanakh)
--   8893 james-4-friendship-of-the-world-is-enmity-the-spiritual-adultery-exodus-34-hosea-2  (Tanakh + NT)
--   8896 james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3           (Tanakh + Extras + NT)  [BLESSING]
--   8899 james-4-draw-nigh-to-elohim-cleanse-your-hands-humble-yourselves-zechariah-1  (Tanakh)
--   8902 james-4-there-is-one-lawgiver-able-to-save-and-destroy-isaiah-33          (Tanakh)
--   8905 james-4-boast-not-of-tomorrow-your-life-is-a-vapour-proverbs-27           (Tanakh + Extras + NT)
-- =====================================================================

CREATE TEMP VIEW _s239_j239c4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: james-4-wars-and-fightings-from-your-lusts-ye-ask-amiss-psalm-66
  ('canon', 'james', 4, 3, 'canon', 'psalms', 66, 18, 'free', E'*If I regard iniquity in my heart, Yahuah (Lord) will not hear me:* (Psalm 66:18). James asks whence the wars and fightings come — *come they not hence, even of your lusts that war in your members?* (James 4:1) — and names the prayer that goes unanswered: *Ye ask, and receive not, because ye ask amiss, that ye may consume it upon your lusts* (James 4:3). The Psalmist already knew the bar: the prayer of a heart that cherishes iniquity is not heard. The asking *amiss* is the asking of the lust-driven heart; what is begged to be spent on the cravings that war within is the very iniquity Yahuah (Lord) will not regard. The remedy is not more asking but the cleansed heart of v.8.'),
  -- thread: james-4-friendship-of-the-world-is-enmity-the-spiritual-adultery-exodus-34-hosea-2
  ('canon', 'james', 4, 4, 'canon', 'exodus', 34, 14, 'free', E'*For thou shalt worship no other god: for Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God):* (Exodus 34:14). James calls them *adulterers and adulteresses* and warns that *the friendship of the world is enmity with Elohim (God)* (James 4:4). The charge is covenant-marriage language: Yahuah (LORD) whose very name is Jealous took Yashar''el (Israel) to himself, and the very next words of Exodus warn against going *a whoring after their gods* (Exodus 34:15-16). To befriend the world is to break faith with the jealous Husband; the enmity James names is the adultery the Torah forbids.'),
  ('canon', 'james', 4, 4, 'canon', 'deuteronomy', 6, 15, 'free', E'*(For Yahuah Elohayka (the LORD thy God) is a jealous Elohim (God) among you) lest the anger of Yahuah Elohayka (the LORD thy God) be kindled against thee, and destroy thee from off the face of the earth.* (Deuteronomy 6:15). The command that frames the Shema is *Ye shall not go after other gods* (Deuteronomy 6:14), *for Yahuah Elohayka (the LORD thy God) is a jealous Elohim (God).* James'' *whosoever therefore will be a friend of the world is the enemy of Elohim (God)* (James 4:4) re-speaks this jealousy: the one Elohim (God) of the Shema brooks no rival affection. Friendship with the world is the going-after-other-gods the Torah names, and it kindles the same divine jealousy.'),
  ('canon', 'james', 4, 4, 'canon', 'hosea', 2, 13, 'free', E'*And I will visit upon her the days of Baalim, wherein she burned incense to them, and she decked herself with her earrings and her jewels, and she went after her lovers, and forgat me, saith Yahuah (LORD).* (Hosea 2:13). Hosea drew the whole of Yashar''el (Israel)''s idolatry as a wife who *went after her lovers, and forgat* her Husband — *she is not my wife, neither am I her husband: let her therefore put away her whoredoms* (Hosea 2:2). This is precisely why James names the worldly *adulterers and adulteresses* (James 4:4): to love the world is to play the harlot against Yahuah (LORD), forgetting the One to whom the covenant betrothed her. The prophet''s spiritual-adultery figure is the lens James hands his readers.'),
  ('canon', 'james', 4, 4, 'canon', '1-john', 2, 15, 'free', E'*Love not the world, neither the things that are in the world. If any man love the world, the love of the Father is not in him.* (1 John 2:15). John speaks the same antithesis James does: the love of the world and the love of the Father cannot dwell together. James puts it as enmity — *the friendship of the world is enmity with Elohim (God)... is the enemy of Elohim (God)* (James 4:4); John as exclusion — *the love of the Father is not in him.* Two apostles of the gathered remnant guard the one undivided heart the Shema demands; the affection owed the jealous Father cannot be shared with the world.'),
  -- thread: james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3  [BLESSING]
  ('canon', 'james', 4, 6, 'canon', 'proverbs', 3, 34, 'free', E'*Surely he scorneth the scorners: but he giveth grace unto the lowly.* (Proverbs 3:34). This is the scripture James quotes *according to the scripture* when he writes *Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). The proverb is the very text: Yahuah (LORD) sets himself against the haughty scorner and pours grace upon the lowly. James does not invent a new principle but cites the Tanakh''s own law of the kingdom — the same verse 1 Peter quotes — that grace is given downward, to the humble who submit and draw nigh.'),
  ('canon', 'james', 4, 6, 'canon', 'proverbs', 29, 23, 'free', E'*A man''s pride shall bring him low: but honour shall uphold the humble in spirit.* (Proverbs 29:23). The wisdom of Proverbs is the law James echoes: pride is self-abasement, humility the path to honour. *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6), and *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10) — the lifting up is the *honour* that *shall uphold the humble in spirit.* James gathers the whole Proverbs teaching on the proud and the lowly into his apostolic exhortation.'),
  ('canon', 'james', 4, 6, 'canon', 'isaiah', 57, 15, 'free', E'*For thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble, and to revive the heart of the contrite ones.* (Isaiah 57:15). Where does the grace James promises the humble dwell? Isaiah answers: the high and lofty One himself dwells *with him also that is of a contrite and humble spirit.* The grace James says is given *unto the humble* (James 4:6) is the very presence of the One who inhabits eternity, drawing near to the lowly heart — which is why James can say *Draw nigh to Elohim (God), and he will draw nigh to you* (James 4:8). The humble are the dwelling-place of the high and holy One.'),
  ('canon', 'james', 4, 6, 'canon', 'psalms', 138, 6, 'free', E'*Though Yahuah (LORD) be high, yet hath he respect unto the lowly: but the proud he knoweth afar off.* (Psalm 138:6). The Psalm states James'' principle in two clauses: Yahuah (LORD) *hath respect unto the lowly* — grace to the humble; *but the proud he knoweth afar off* — he resisteth the proud. *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) is this very pattern: the exalted One stoops to the lowly and holds the haughty at a distance. The God who keeps the proud *afar off* is the God the humble may *draw nigh* to (James 4:8).'),
  ('canon', 'james', 4, 6, 'apocrypha', 'ecclesiasticus', 10, 7, 'extras', E'*Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity.* (Sirach 10:7). The wisdom of Sirach stands beside Proverbs as James'' companion: pride is *hateful before Yahuah (God),* *the beginning of sin* (Sirach 10:13). This is why *Elohim (God) resisteth the proud* (James 4:6) — the proud heart is hateful to the One it departs from, *when one departs from Yahuah (God), and his heart is turned away from his Maker* (Sirach 10:12). James'' resisted pride is the very evil Sirach names as the root from which iniquity springs.'),
  ('canon', 'james', 4, 6, 'apocrypha', 'ecclesiasticus', 10, 14, 'extras', E'*Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead.* (Sirach 10:14). Sirach shows the downward law of grace in history: *Yahuah (God) has cast down the thrones of proud princes,* and *plucked up the roots of the proud nations, and planted the lowly in their place* (Sirach 10:14-15). This is *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) enacted — the proud thrown down, the meek and lowly set up. James'' promise that the humble *shall be lifted up* (James 4:10) is the very setting-up of the meek that Sirach traces through the rise and fall of kingdoms.'),
  ('canon', 'james', 4, 6, 'canon', '1-peter', 5, 5, 'free', E'*Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* (1 Peter 5:5). Peter quotes Proverbs 3:34 in the identical words James uses — *Elohim (God) resisteth the proud, and giveth grace to the humble* — two apostles of the scattered remnant citing the one Tanakh text. And Peter draws the same conclusion James does: *Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you* (1 Peter 5:6) is James'' *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10). The downward grace and the upward lifting are the shared teaching of the whole apostolic witness.'),
  -- thread: james-4-draw-nigh-to-elohim-cleanse-your-hands-humble-yourselves-zechariah-1
  ('canon', 'james', 4, 8, 'canon', 'zechariah', 1, 3, 'free', E'*Therefore say thou unto them, Thus saith Yahuah Tseva''ot (LORD of hosts); Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you, saith Yahuah Tseva''ot (LORD of hosts).* (Zechariah 1:3). James'' *Draw nigh to Elohim (God), and he will draw nigh to you* (James 4:8) re-speaks the prophet''s covenant call almost word for word: *Turn ye unto me... and I will turn unto you.* The movement is mutual and the initiative is the people''s repentance — the same drawing-near Zechariah summoned the returning remnant to. James preaches Zechariah''s gospel of return to the scattered twelve tribes: come back to Yahuah (LORD), and he comes back to you.'),
  ('canon', 'james', 4, 8, 'canon', 'psalms', 24, 4, 'free', E'*He that hath clean hands, and a pure heart; who hath not lifted up his soul unto vanity, nor sworn deceitfully.* (Psalm 24:4). James commands the drawing-near with the very terms of the Psalm of ascent: *Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). The Psalm asks *Who shall ascend into the hill of Yahuah (LORD)?* (Psalm 24:3) and answers, *he that hath clean hands, and a pure heart.* To draw nigh to Elohim (God) one must come with the cleansed hands and pure heart the sanctuary required; James puts the temple-entrance demand upon every worshipper who would approach.'),
  ('canon', 'james', 4, 8, 'canon', 'isaiah', 55, 7, 'free', E'*Let the wicked forsake his way, and the unrighteous man his thoughts: and let him return unto Yahuah (LORD), and he will have mercy upon him; and to our Elohim (God), for he will abundantly pardon.* (Isaiah 55:7). Isaiah''s call — *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6) — is James'' *Draw nigh to Elohim (God)* and *Cleanse your hands, ye sinners* (James 4:8). The prophet bids the wicked *forsake his way* and *return,* with the promise of abundant pardon; James bids the sinner cleanse and the double-minded purify, with the promise that Elohim (God) draws nigh. The repentance and the mercy are one and the same.'),
  ('canon', 'james', 4, 10, 'canon', '2-chronicles', 7, 14, 'free', E'*If my people, which are called by my name, shall humble themselves, and pray, and seek my face, and turn from their wicked ways; then will I hear from heaven, and will forgive their sin, and will heal their land.* (2 Chronicles 7:14). The covenant promise to Solomon gathers up every command of this passage: *humble themselves,* *pray,* *seek my face,* *turn from their wicked ways.* James says the same to the dispersed: *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10), having bidden them draw nigh, cleanse, purify, and mourn (James 4:8-9). The lifting-up James promises is the *I will hear... and will heal* of the One who answers the humbled and returning people.'),
  -- thread: james-4-there-is-one-lawgiver-able-to-save-and-destroy-isaiah-33
  ('canon', 'james', 4, 12, 'canon', 'isaiah', 33, 22, 'free', E'*For Yahuah (LORD) is our judge, Yahuah (LORD) is our lawgiver, Yahuah (LORD) is our king; he will save us.* (Isaiah 33:22). James declares *There is one lawgiver, who is able to save and to destroy* (James 4:12), and Isaiah names him: Yahuah (LORD) *is our lawgiver,* and *he will save us.* The one Lawgiver is the one Elohim (God) of the Shema; to set oneself over the law by judging a brother — *speaketh evil of the law, and judgeth the law* (James 4:11) — is to usurp the seat of the only Lawgiver. James guards the Torah''s authority by guarding its single divine Author, the Judge, Lawgiver, and King who alone saves.'),
  ('canon', 'james', 4, 12, 'canon', 'deuteronomy', 32, 39, 'free', E'*See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* (Deuteronomy 32:39). The one Lawgiver James names is *able to save and to destroy* (James 4:12) — the very prerogative the Song of Moses reserves to Yahuah (LORD) alone: *I kill, and I make alive.* There is *no god with me,* and *neither is there any that can deliver out of my hand.* James'' rebuke *who art thou that judgest another?* rests on this: the power over life and death belongs to the one Elohim (God), and the man who judges his brother grasps at a throne that is not his.'),
  ('canon', 'james', 4, 11, 'canon', 'leviticus', 19, 16, 'free', E'*Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* (Leviticus 19:16). James'' *Speak not evil one of another, brethren* (James 4:11) is the Torah''s own command against the talebearer who goes *up and down... among thy people.* The same Leviticus 19 that gives the royal law *thou shalt love thy neighbour as thyself* forbids the evil-speaking that destroys the neighbour. To speak evil of a brother is to break the very law one presumes to judge — and so, James says, *thou art not a doer of the law, but a judge* (James 4:11).'),
  -- thread: james-4-boast-not-of-tomorrow-your-life-is-a-vapour-proverbs-27
  ('canon', 'james', 4, 13, 'canon', 'proverbs', 27, 1, 'free', E'*Boast not thyself of to morrow; for thou knowest not what a day may bring forth.* (Proverbs 27:1). James'' rebuke of the merchants — *Go to now, ye that say, To day or to morrow we will go into such a city... and buy and sell, and get gain: Whereas ye know not what shall be on the morrow* (James 4:13-14) — is Proverbs 27:1 made a sermon. The wisdom-word is exact: *thou knowest not what a day may bring forth.* The presumption James condemns is the boasting of tomorrow the proverb forbids; the cure is *If Yahuah (Lord) will, we shall live, and do this, or that* (James 4:15).'),
  ('canon', 'james', 4, 14, 'canon', 'psalms', 39, 5, 'free', E'*Behold, thou hast made my days as an handbreadth; and mine age is as nothing before thee: verily every man at his best state is altogether vanity. Selah.* (Psalm 39:5). James asks *what is your life? It is even a vapour, that appeareth for a little time, and then vanisheth away* (James 4:14), and the Psalm has already measured it: days *as an handbreadth,* *every man at his best state is altogether vanity.* And the merchant who heaps up gain is the man who *heapeth up riches, and knoweth not who shall gather them* (Psalm 39:6). The vapour-life of James is the handbreadth-life of the Psalm; the boasting of tomorrow is folly because the boaster is himself a passing breath.'),
  ('canon', 'james', 4, 14, 'canon', 'psalms', 90, 10, 'free', E'*The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow; for it is soon cut off, and we fly away.* (Psalm 90:10). The prayer of Moses measures the same brief life James calls *a vapour, that appeareth for a little time, and then vanisheth away* (James 4:14). Our years are *soon cut off, and we fly away* — the vanishing James names. To plan a year of buying and selling as though tomorrow were one''s own is to forget what Moses taught: the days are few and fleeting, and the wise *number our days, and apply our hearts unto wisdom* by saying *If Yahuah (Lord) will* (James 4:15).'),
  ('canon', 'james', 4, 14, 'apocrypha', 'ecclesiasticus', 11, 19, 'extras', E'*Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* (Sirach 11:19). Sirach paints the very man James rebukes: he *waxeth rich by his wariness* (Sirach 11:18) and says *I have found rest, and now will eat continually of my goods* — *yet he knoweth not what time shall come upon him.* James'' merchant who plans *to day or to morrow... and get gain* (James 4:13) is this self-secure rich man, ignorant that *he must leave those things to others, and die.* The wisdom of Sirach is James'' near-twin: the gain-getter who forgets *If Yahuah (Lord) will* is already condemned by the wisdom books.'),
  ('canon', 'james', 4, 14, 'canon', 'luke', 12, 20, 'free', E'*But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). Yahusha (Jesus) told the parable of the rich man who said *I will pull down my barns, and build greater* (Luke 12:18) and *take thine ease, eat, drink, and be merry* (Luke 12:19) — and Elohim (God) called him *Thou fool,* for *this night thy soul shall be required of thee.* This is James'' merchant exactly: planning the year''s gain while *ye know not what shall be on the morrow... It is even a vapour* (James 4:14). The Master''s parable and the brother''s epistle preach one warning — the man rich toward his goods and poor toward Elohim (God) does not own his tomorrow.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s239_j239c4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s239_j239c4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-4-wars-and-fightings-from-your-lusts-ye-ask-amiss-psalm-66',
       E'Whence come wars and fightings — of your lusts; ye ask amiss (Psalm 66)',
       E'James traces the strife among the brethren to its root: *From whence come wars and fightings among you? come they not hence, even of your lusts that war in your members?* (James 4:1). The craving that cannot be satisfied breeds the quarrel — *Ye lust, and have not: ye kill, and desire to have, and cannot obtain: ye fight and war, yet ye have not, because ye ask not* (James 4:2). And when such men do pray, the prayer is barren: *Ye ask, and receive not, because ye ask amiss, that ye may consume it upon your lusts* (James 4:3). The Psalmist named this bar to prayer long before: *If I regard iniquity in my heart, Yahuah (Lord) will not hear me* (Psalm 66:18). The asking *amiss* is the asking of the heart that still cherishes the iniquity it begs to feed; what is sought only to be spent upon the lusts that war within is the very iniquity Yahuah (Lord) will not regard. The remedy is not more asking but the cleansed heart and the humbled spirit James presses in the verses that follow — *Cleanse your hands, ye sinners; and purify your hearts* (James 4:8).',
       sv.verse_id, ev.verse_id, 'free', 8890
  FROM _s239_j239c4_lookup sv, _s239_j239c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-4-friendship-of-the-world-is-enmity-the-spiritual-adultery-exodus-34-hosea-2',
       E'Ye adulterers — the friendship of the world is enmity with Elohim (Exodus 34, Hosea 2)',
       E'*Ye adulterers and adulteresses, know ye not that the friendship of the world is enmity with Elohim (God)? whosoever therefore will be a friend of the world is the enemy of Elohim (God)* (James 4:4). The charge is covenant-marriage language, not metaphor loosely flung. Yahuah (LORD) took Yashar''el (Israel) to himself as a jealous Husband — *thou shalt worship no other god: for Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* (Exodus 34:14) — and the warning at once was against going *a whoring after their gods* (Exodus 34:15-16). The Shema''s frame says the same: *Ye shall not go after other gods... (For Yahuah Elohayka (the LORD thy God) is a jealous Elohim (God) among you)* (Deuteronomy 6:14-15). Hosea drew the whole of the nation''s idolatry as a wife who *went after her lovers, and forgat me, saith Yahuah (LORD)* (Hosea 2:13), *she is not my wife, neither am I her husband: let her therefore put away her whoredoms* (Hosea 2:2). So when James names the worldly *adulterers and adulteresses,* he is preaching the prophets: to love the world is to play the harlot against the jealous Husband, forgetting the One the covenant betrothed her to. John guards the same undivided heart — *Love not the world... If any man love the world, the love of the Father is not in him* (1 John 2:15). The affection owed the one Elohim (God) of the Shema cannot be shared with the world; the friendship James forbids is the going-after-other-gods the Torah forbids.',
       sv.verse_id, ev.verse_id, 'free', 8893
  FROM _s239_j239c4_lookup sv, _s239_j239c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3',
       E'Elohim resisteth the proud, but giveth grace unto the humble (Proverbs 3:34)',
       E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). James quotes *according to the scripture* — the words are Proverbs'' own: *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34). This is the downward law of the kingdom, and James does not invent it but cites the Tanakh''s own teaching, the same verse 1 Peter quotes in the identical words — *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). The wisdom books say it again and again: *A man''s pride shall bring him low: but honour shall uphold the humble in spirit* (Proverbs 29:23); and the Psalm, *Though Yahuah (LORD) be high, yet hath he respect unto the lowly: but the proud he knoweth afar off* (Psalm 138:6) — grace to the lowly, the proud held at a distance. Where does that grace dwell? Isaiah answers: *thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit* (Isaiah 57:15) — the grace given the humble is the very presence of the One who inhabits eternity stooping to the lowly heart. The Hebrew library guards the other side: *Pride is hateful before Yahuah (God) and man* (Sirach 10:7), *the beginning of sin* (Sirach 10:13), the heart *turned away from his Maker* (Sirach 10:12) — and history shows the law enacted, *Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* (Sirach 10:14). So James draws the conclusion the whole library draws: *Submit yourselves therefore to Elohim (God)* (James 4:7), *Draw nigh to Elohim (God), and he will draw nigh to you* (James 4:8), and *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10). The grace is not earned but given, and given downward — to the submitted, the cleansed, the lowly; the proud are resisted, the humble are exalted. This is no law-versus-grace antithesis but the one covenant teaching: the high and holy One pours his grace upon the contrite and casts down the haughty.',
       sv.verse_id, ev.verse_id, 'extras', 8896
  FROM _s239_j239c4_lookup sv, _s239_j239c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-4-draw-nigh-to-elohim-cleanse-your-hands-humble-yourselves-zechariah-1',
       E'Draw nigh to Elohim and he will draw nigh to you; cleanse your hands (Zechariah 1, Psalm 24)',
       E'*Submit yourselves therefore to Elohim (God)... Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:7-8). The drawing-near is the prophet''s covenant call almost word for word: *Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you* (Zechariah 1:3) — the mutual movement whose initiative is the people''s repentance, the gospel of return James preaches to the scattered twelve tribes. And the terms of the approach are the sanctuary''s: the Psalm of ascent asks *Who shall ascend into the hill of Yahuah (LORD)?* and answers, *He that hath clean hands, and a pure heart* (Psalm 24:3-4) — the very cleansing of hands and purifying of hearts James commands. Isaiah issues the same summons: *Seek ye Yahuah (LORD) while he may be found... Let the wicked forsake his way... and let him return unto Yahuah (LORD), and he will have mercy upon him* (Isaiah 55:6-7). And the whole movement — to *humble themselves, and pray, and seek my face, and turn from their wicked ways* — is the covenant promise to Solomon, *then will I hear from heaven, and will forgive their sin, and will heal their land* (2 Chronicles 7:14). So James'' close, *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10), is the lifting-up promised to the humbled and returning people. Draw nigh with cleansed hands and contrite heart, and the One who keeps the proud afar off draws nigh.',
       sv.verse_id, ev.verse_id, 'free', 8899
  FROM _s239_j239c4_lookup sv, _s239_j239c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-4-there-is-one-lawgiver-able-to-save-and-destroy-isaiah-33',
       E'Speak not evil — there is one Lawgiver, able to save and to destroy (Isaiah 33, Deuteronomy 32)',
       E'*Speak not evil one of another, brethren. He that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law: but if thou judge the law, thou art not a doer of the law, but a judge. There is one lawgiver, who is able to save and to destroy: who art thou that judgest another?* (James 4:11-12). The evil-speaking James forbids is the Torah''s own prohibition: *Thou shalt not go up and down as a talebearer among thy people... I am Yahuah (LORD)* (Leviticus 19:16) — the same Leviticus 19 that gives the royal law to love the neighbour forbids the slander that destroys him. To speak evil of a brother is to break the very law one presumes to sit over, and so to make oneself *a judge* of the law rather than *a doer* of it. And there is but *one lawgiver* — Isaiah names him: *Yahuah (LORD) is our judge, Yahuah (LORD) is our lawgiver, Yahuah (LORD) is our king; he will save us* (Isaiah 33:22), the one Elohim (God) of the Shema. He alone is *able to save and to destroy,* the prerogative the Song of Moses reserves to him: *I, even I, am he, and there is no god with me: I kill, and I make alive... neither is there any that can deliver out of my hand* (Deuteronomy 32:39). So James'' rebuke *who art thou that judgest another?* guards the Torah by guarding its single divine Author: the man who judges his brother grasps at the throne of the one Lawgiver and King, whose law is to be done, not judged.',
       sv.verse_id, ev.verse_id, 'free', 8902
  FROM _s239_j239c4_lookup sv, _s239_j239c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-4-boast-not-of-tomorrow-your-life-is-a-vapour-proverbs-27',
       E'Boast not of tomorrow — your life is a vapour; if Yahuah will (Proverbs 27, Psalm 39)',
       E'*Go to now, ye that say, To day or to morrow we will go into such a city, and continue there a year, and buy and sell, and get gain: Whereas ye know not what shall be on the morrow. For what is your life? It is even a vapour, that appeareth for a little time, and then vanisheth away* (James 4:13-14). The rebuke is the wisdom-word made a sermon: *Boast not thyself of to morrow; for thou knowest not what a day may bring forth* (Proverbs 27:1). The Psalms have measured the vapour: *thou hast made my days as an handbreadth... every man at his best state is altogether vanity* (Psalm 39:5), and the gain-getter is the man who *heapeth up riches, and knoweth not who shall gather them* (Psalm 39:6); *the days of our years are threescore years and ten... soon cut off, and we fly away* (Psalm 90:10). The Hebrew library draws the self-secure merchant to the life: he says *I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Sirach 11:19). And Yahusha (Jesus) told the same man''s parable — the rich fool who would *pull down my barns, and build greater,* to whom Elohim (God) said, *Thou fool, this night thy soul shall be required of thee* (Luke 12:18,20). So the boasting of tomorrow is folly because the boaster is himself a passing breath; the cure James gives is the humble submission of the whole chapter: *For that ye ought to say, If Yahuah (Lord) will, we shall live, and do this, or that* (James 4:15). To plan the year''s gain as though tomorrow were one''s own is the very pride the Lawgiver resists; to say *If Yahuah (Lord) will* is the humility he gives grace.',
       sv.verse_id, ev.verse_id, 'extras', 8905
  FROM _s239_j239c4_lookup sv, _s239_j239c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: james-4-wars-and-fightings-from-your-lusts-ye-ask-amiss-psalm-66
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 66:18 — *If I regard iniquity in my heart, Yahuah (Lord) will not hear me* the bar to prayer behind James'' *Ye ask, and receive not, because ye ask amiss, that ye may consume it upon your lusts* (James 4:3).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-wars-and-fightings-from-your-lusts-ye-ask-amiss-psalm-66'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=66 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-4-friendship-of-the-world-is-enmity-the-spiritual-adultery-exodus-34-hosea-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:14 — *Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* the covenant-marriage jealousy behind *the friendship of the world is enmity with Elohim (God)* (James 4:4); the next words warn against going *a whoring after their gods* (Exodus 34:15-16).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-friendship-of-the-world-is-enmity-the-spiritual-adultery-exodus-34-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:15 — *Yahuah Elohayka (the LORD thy God) is a jealous Elohim (God) among you* the Shema''s jealousy: *Ye shall not go after other gods* (Deuteronomy 6:14); friendship with the world is the going-after-other-gods that makes one *the enemy of Elohim (God)* (James 4:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-friendship-of-the-world-is-enmity-the-spiritual-adultery-exodus-34-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 2:13 — *she went after her lovers, and forgat me, saith Yahuah (LORD)* the prophet''s spiritual-adultery figure: to love the world is to play the harlot against the Husband, which is why James names the worldly *adulterers and adulteresses* (James 4:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-friendship-of-the-world-is-enmity-the-spiritual-adultery-exodus-34-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 2:15 — *Love not the world... If any man love the world, the love of the Father is not in him* the same undivided-heart guard James presses: *the friendship of the world is enmity with Elohim (God)* (James 4:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-friendship-of-the-world-is-enmity-the-spiritual-adultery-exodus-34-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly* the scripture James quotes *according to the scripture*: *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6); the same verse 1 Peter 5:5 cites.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 29:23 — *A man''s pride shall bring him low: but honour shall uphold the humble in spirit* the lifting-up of the lowly James promises: *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 57:15 — *the high and lofty One that inhabiteth eternity... I dwell in the high and holy place, with him also that is of a contrite and humble spirit* the dwelling-place of the grace given the humble (James 4:6), whom Elohim (God) draws nigh to (James 4:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 138:6 — *Though Yahuah (LORD) be high, yet hath he respect unto the lowly: but the proud he knoweth afar off* the two clauses of James'' principle: grace to the humble, the proud resisted (James 4:6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=138 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 10:7 — *Pride is hateful before Yahuah (God) and man* the wisdom-library''s root of the resisted pride, *the beginning of sin* (Sirach 10:13), the heart *turned away from his Maker* (Sirach 10:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 10:14 — *Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* the downward law of grace enacted in history; the lifting-up of the humble James promises (James 4:10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Peter 5:5 — *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* Peter quoting Proverbs 3:34 in James'' identical words; *Humble yourselves... that he may exalt you* (1 Peter 5:6) = James 4:10.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-grace-unto-the-humble-he-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-4-draw-nigh-to-elohim-cleanse-your-hands-humble-yourselves-zechariah-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 1:3 — *Turn ye unto me... and I will turn unto you* the prophet''s covenant call James re-speaks: *Draw nigh to Elohim (God), and he will draw nigh to you* (James 4:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-draw-nigh-to-elohim-cleanse-your-hands-humble-yourselves-zechariah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 24:4 — *He that hath clean hands, and a pure heart* the sanctuary-entrance demand James puts on the worshipper: *Cleanse your hands, ye sinners; and purify your hearts* (James 4:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-draw-nigh-to-elohim-cleanse-your-hands-humble-yourselves-zechariah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:7 — *let the wicked forsake his way... and let him return unto Yahuah (LORD), and he will have mercy upon him* the repentance-and-mercy James commands: cleanse, purify, draw nigh (James 4:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-draw-nigh-to-elohim-cleanse-your-hands-humble-yourselves-zechariah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 7:14 — *if my people... shall humble themselves, and pray, and seek my face, and turn from their wicked ways; then will I hear from heaven... and will heal their land* the covenant promise behind *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-draw-nigh-to-elohim-cleanse-your-hands-humble-yourselves-zechariah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-4-there-is-one-lawgiver-able-to-save-and-destroy-isaiah-33
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people* the Torah''s own command behind *Speak not evil one of another, brethren* (James 4:11); the same chapter that gives the royal law forbids the slander.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-there-is-one-lawgiver-able-to-save-and-destroy-isaiah-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 33:22 — *Yahuah (LORD) is our judge, Yahuah (LORD) is our lawgiver, Yahuah (LORD) is our king; he will save us* the one Lawgiver James names: *There is one lawgiver, who is able to save and to destroy* (James 4:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-there-is-one-lawgiver-able-to-save-and-destroy-isaiah-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=33 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:39 — *I kill, and I make alive... neither is there any that can deliver out of my hand* the save-and-destroy prerogative reserved to the one Elohim (God); *who art thou that judgest another?* (James 4:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-there-is-one-lawgiver-able-to-save-and-destroy-isaiah-33'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-4-boast-not-of-tomorrow-your-life-is-a-vapour-proverbs-27
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 27:1 — *Boast not thyself of to morrow; for thou knowest not what a day may bring forth* the wisdom-word James preaches against the merchants'' *To day or to morrow we will go... and get gain* (James 4:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-boast-not-of-tomorrow-your-life-is-a-vapour-proverbs-27'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 39:5 — *every man at his best state is altogether vanity* and *heapeth up riches, and knoweth not who shall gather them* (39:6) the vapour-life behind *what is your life? It is even a vapour* (James 4:14).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-boast-not-of-tomorrow-your-life-is-a-vapour-proverbs-27'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 90:10 — *the days of our years... soon cut off, and we fly away* the vanishing James names: *a vapour, that appeareth for a little time, and then vanisheth away* (James 4:14).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-boast-not-of-tomorrow-your-life-is-a-vapour-proverbs-27'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 11:19 — *I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* the wisdom-library''s self-secure gain-getter, James'' merchant exactly (James 4:13-14).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-boast-not-of-tomorrow-your-life-is-a-vapour-proverbs-27'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 12:20 — *Thou fool, this night thy soul shall be required of thee* Yahusha (Jesus)'' parable of the rich fool who would build greater barns; the man who plans the year''s gain not knowing *what shall be on the morrow* (James 4:14).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c4_lookup sv, _s239_j239c4_lookup tv
 WHERE t.slug='james-4-boast-not-of-tomorrow-your-life-is-a-vapour-proverbs-27'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_james_05.sql (S239 James 5) -----
-- =====================================================================
-- S239 minion — JAMES 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: JAMES 5 (20 verses). Tag: j239c5 (temp view _s239_j239c5_lookup).
-- Sort band: floor 8920, step 3 (8920, 8923, 8926, 8929, 8932, 8935, 8938 — under 8950).
-- Source is ALWAYS the canon James verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (James = the wisdom-of-the-two-house-remnant letter to the twelve tribes scattered
-- abroad; the Torah is in force and being kept). Chapter 5 closes the letter: the rich who defraud the
-- hireling are judged by the very Torah that protects the labourer's wage; the gathered are bidden to
-- patience unto the coming of Yahuah (Lord), husbandmen waiting for the early and latter rain; the
-- patience of Job and the tender mercy of Yahuah (Lord) are held up; the third word is honored — swear
-- not, let your yea be yea; the prayer of faith over the sick, the confession of faults; Elias who prayed
-- and shut and opened heaven; and the one who turns the sinner back from the error of his way. No
-- replacement theology, no law-vs-grace antithesis: ★ 5:12 swear-not guards the Name and the vow (the
-- third word kept), NOT an abolition of the lawful oath. *the coming of Yahuah (Lord)* (5:7-8) is the
-- coming of the Formed Son who bears the Father's Name and glory.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   ye rich men weep and howl; the hire of the labourers kept back by fraud crieth
--           Tanakh: Leviticus 19:13 (the wages of him that is hired shall not abide all night),
--                   Deuteronomy 24:14-15 (give him his hire... lest he cry against thee unto Yahuah),
--                   Malachi 3:5 (a swift witness against those that oppress the hireling), Amos 8:4
--                   (ye that swallow up the needy), Isaiah 5:8-9 (woe... join house to house), Jeremiah
--                   22:13 (woe... that useth his neighbour's service without wages)
--           Extras: Sirach 34:21-22 (the bread of the needy is their life; he that defraudeth the
--                   labourer of his hire is a bloodshedder)
--           NT: none warranted (the cry-of-the-oppressed root is the Tanakh/Sirach weave)
--   v.7-8   be patient unto the coming; the husbandman waiteth for the early and latter rain
--           Tanakh: Deuteronomy 11:14 (the first rain and the latter rain), Joel 2:23 (the former rain
--                   and the latter rain), Hosea 6:3 (he shall come unto us as the rain), Habakkuk 2:3
--                   (the vision... though it tarry, wait for it)
--           Extras: none warranted   NT: none warranted (the coming carried in prose)
--   v.9     the judge standeth before the door
--           Tanakh: none warranted (the coming/judge carried in the patience thread)
--           Extras: none warranted   NT: none warranted
--   v.10-11 the patience of Job; the end of Yahuah; very pitiful and of tender mercy
--           Tanakh: Job 42:10-12 (Yahuah turned the captivity of Job... blessed the latter end), Psalm
--                   103:8 (Yahuah is merciful and gracious, slow to anger), Exodus 34:6 (merciful and
--                   gracious, longsuffering, abundant in goodness and truth)
--           Extras: none warranted   NT: none warranted
--   v.12    swear not... but let your yea be yea; and your nay, nay
--           Tanakh: Leviticus 19:12 (ye shall not swear by my name falsely), Exodus 20:7 (take not the
--                   name in vain), Deuteronomy 23:21-23 (when thou vowest a vow... thou shalt not slack
--                   to pay it), Ecclesiastes 5:4-5 (when thou vowest... defer not to pay it)
--           Extras: Sirach 23:9-10 (accustom not thy mouth to swearing; neither use thyself to the
--                   naming of the Holy One)
--           NT: Matthew 5:34-37 (Swear not at all... let your communication be Yea, yea; Nay, nay)
--   v.13-16 is any sick... the prayer of faith shall save the sick; confess your faults
--           Tanakh: Psalm 30:2 (O Yahuah my Elohim, I cried unto thee, and thou hast healed me),
--                   Psalm 32:5 (I will confess my transgressions... and thou forgavest)
--           Extras: Sirach 38:9 (my son, in thy sickness... pray unto Yahuah, and he will make thee whole)
--           NT: Mark 6:13 (anointed with oil many that were sick, and healed them)
--   v.17-18 Elias prayed... it rained not three years; he prayed again and the heaven gave rain
--           Tanakh: 1 Kings 17:1 (there shall not be dew nor rain these years, but according to my word),
--                   1 Kings 18:1 (I will send rain upon the earth), 1 Kings 18:45 (the heaven was black
--                   with clouds... a great rain), Deuteronomy 11:17 (he shut up the heaven, that there
--                   be no rain)
--           Extras: Sirach 48:1-3 (Elias the prophet as fire... by the word of Yahuah he shut up the heaven)
--           NT: none warranted (the Elias narrative is the 1 Kings root)
--   v.19-20 he which converteth the sinner from the error of his way shall save a soul from death
--           Tanakh: Ezekiel 33:8-9 (warn the wicked... thou hast delivered thy soul), Daniel 12:3 (they
--                   that turn many to righteousness as the stars), Proverbs 10:12 (love covereth all sins)
--           Extras: Tobit 12:9 (alms doth deliver from death, and shall purge away all sin)
--           NT: 1 Peter 4:8 (charity shall cover the multitude of sins)
--
-- THREADS (slug -> target libraries):
--   8920 james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24   (Tanakh + Extras)  [BLESSING]
--   8923 james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2   (Tanakh)
--   8926 james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103   (Tanakh)
--   8929 james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20   (Tanakh + Extras + NT)
--   8932 james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38   (Tanakh + Extras + NT)
--   8935 james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18   (Tanakh + Extras)
--   8938 james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10   (Tanakh + Extras + NT)
-- =====================================================================

CREATE TEMP VIEW _s239_j239c5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24  [BLESSING]
  ('canon', 'james', 5, 4, 'canon', 'leviticus', 19, 13, 'free', E'*Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* (Leviticus 19:13). The Torah forbids the very wrong James indicts: *the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth* (James 5:4). The wage that may not even *abide all night* is the wage the rich have *kept back by fraud* — James holds them to Leviticus 19, the holiness code that protects the hireling, and reads their withheld wages as theft from the neighbour.'),
  ('canon', 'james', 5, 4, 'canon', 'deuteronomy', 24, 15, 'free', E'*At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* (Deuteronomy 24:15). Here is the very cry James hears: the unpaid hireling *cry against thee unto Yahuah (LORD).* James says *the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4) — the Torah already warned that the withheld hire becomes a cry that reaches Yahuah (LORD) and *be sin unto thee.* The defrauded labourer''s wage is a covenant lawsuit, and Yahuah (Lord) of hosts is the one who hears it.'),
  ('canon', 'james', 5, 4, 'canon', 'malachi', 3, 5, 'free', E'*And I will come near to you to judgment; and I will be a swift witness against the sorcerers, and against the adulterers, and against false swearers, and against those that oppress the hireling in his wages, the widow, and the fatherless, and that turn aside the stranger from his right, and fear not me, saith Yahuah Tseva''ot (LORD of hosts).* (Malachi 3:5). Yahuah Tseva''ot (LORD of hosts) names himself a *swift witness against those that oppress the hireling in his wages* — and James addresses the cries of the reapers to *the ears of Yahuah (Lord) of sabaoth* (James 5:4), the same LORD of hosts. The oppressed hireling''s wage stands among the sins Yahuah comes near to judge; James pronounces that judgment already entered into his ears.'),
  ('canon', 'james', 5, 4, 'canon', 'jeremiah', 22, 13, 'free', E'*Woe unto him that buildeth his house by unrighteousness, and his chambers by wrong; that useth his neighbour''s service without wages, and giveth him not for his work;* (Jeremiah 22:13). Jeremiah''s *woe* falls on the man who *useth his neighbour''s service without wages* — the exact charge James lays on the rich whose labourers'' *hire... is of you kept back by fraud* (James 5:4). The prophet and the apostle speak one verdict: to take a man''s work and withhold his pay is *unrighteousness* and *wrong* that builds a house under a curse.'),
  ('canon', 'james', 5, 4, 'canon', 'amos', 8, 4, 'free', E'*Hear this, O ye that swallow up the needy, even to make the poor of the land to fail,* (Amos 8:4). Amos cries against those who *swallow up the needy,* the merchants who falsify the balances and trample the poor — the same oppressing rich James addresses, *ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1), who have *kept back by fraud* the hire of their reapers (James 5:4). The prophetic woe on the devourers of the poor is the woe James renews on the last-days rich who have *heaped treasure together for the last days.*'),
  ('canon', 'james', 5, 1, 'canon', 'isaiah', 5, 8, 'free', E'*Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* (Isaiah 5:8). Isaiah''s *woe* on the land-grasping rich who *join house to house* and *lay field to field* is the woe James renews on the *rich men* whose *riches are corrupted* and whose *gold and silver is cankered* (James 5:1-3). Both prophets answer the hoarding of the powerful with the rust and ruin that shall *be a witness against you* — the vineyard of Yahuah Tseva''ot (LORD of hosts) looked for righteousness and found a cry.'),
  ('canon', 'james', 5, 4, 'apocrypha', 'ecclesiasticus', 34, 22, 'extras', E'*He that takes away his neighbour''s living slayeth him; and he that defraudeth the labourer of his hire is a bloodshedder.* (Sirach 34:22). The Hebrew wisdom-library says it as starkly as James: *the bread of the needy is their life: he that defraudeth him thereof is a man of blood* (Sirach 34:21), and *he that defraudeth the labourer of his hire is a bloodshedder.* This is the very deed James indicts — the hire *kept back by fraud* (James 5:4) — named bloodshed. The withheld wage is not a small thing but the taking of a man''s life-bread; Sirach and James together read the defrauded labourer''s cry as the cry of innocent blood entering the ears of Yahuah (Lord) of sabaoth.'),
  -- thread: james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2
  ('canon', 'james', 5, 7, 'canon', 'deuteronomy', 11, 14, 'free', E'*That I will give you the rain of your land in his due season, the first rain and the latter rain, that thou mayest gather in thy corn, and thy wine, and thine oil.* (Deuteronomy 11:14). The covenant promise of *the first rain and the latter rain* is the very figure James gives the waiting saints: *the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain* (James 5:7). The farmer cannot hasten the harvest; he waits the two seasons of rain Yahuah (LORD) gives *in his due season* — so the gathered are to wait *unto the coming of Yahuah (Lord)* with the husbandman''s patience.'),
  ('canon', 'james', 5, 7, 'canon', 'joel', 2, 23, 'free', E'*Be glad then, ye children of Zion, and rejoice in Yahuah Elohaychem (the LORD your God): for he hath given you the former rain moderately, and he will cause to come down for you the rain, the former rain, and the latter rain in the first month.* (Joel 2:23). Joel bids the children of Zion rejoice in *the former rain, and the latter rain* — the same two rains James sets before the patient husbandman who *waiteth for the precious fruit of the earth... until he receive the early and latter rain* (James 5:7). The rain that ripens the harvest is Yahuah''s gift in his season; the waiting is not idle but glad, for *the coming of Yahuah (Lord) draweth nigh* (James 5:8) as surely as the latter rain.'),
  ('canon', 'james', 5, 8, 'canon', 'hosea', 6, 3, 'free', E'*Then shall we know, if we follow on to know Yahuah (LORD): his going forth is prepared as the morning; and he shall come unto us as the rain, as the latter and former rain unto the earth.* (Hosea 6:3). Hosea makes the coming of Yahuah (LORD) itself the rain: *he shall come unto us as the rain, as the latter and former rain unto the earth.* James joins the same two images — the husbandman who waits *the early and latter rain* and the heart established because *the coming of Yahuah (Lord) draweth nigh* (James 5:7-8). The latter rain and the coming are one expectation; he who comes as surely as the rain is the One the patient await.'),
  ('canon', 'james', 5, 7, 'canon', 'habakkuk', 2, 3, 'free', E'*For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry.* (Habakkuk 2:3). Habakkuk''s word to the waiting is James''s word: *though it tarry, wait for it; because it will surely come.* James bids the brethren *be patient therefore... unto the coming of Yahuah (Lord)* and *stablish your hearts* (James 5:7-8) — the vision at the appointed time that *will surely come* is the coming for which the husbandman has *long patience.* The delay is not failure but the appointed waiting; the One who comes will not tarry past his time.'),
  -- thread: james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103
  ('canon', 'james', 5, 11, 'canon', 'job', 42, 10, 'free', E'*And Yahuah (LORD) turned the captivity of Job, when he prayed for his friends: also Yahuah (LORD) gave Job twice as much as he had before.* (Job 42:10). James points to *the patience of Job, and... the end of Yahuah (Lord)* (James 5:11) — and here is that end: *Yahuah (LORD) turned the captivity of Job... gave Job twice as much as he had before,* and *blessed the latter end of Job more than his beginning* (Job 42:10,12). The endurance James commends is vindicated in Job''s outcome; the One who let Job be tried is the One who restored him double, *very pitiful, and of tender mercy.*'),
  ('canon', 'james', 5, 11, 'canon', 'psalms', 103, 8, 'free', E'*Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy.* (Psalm 103:8). James draws the lesson of Job''s end straight from the Psalter''s confession of Yahuah''s character: *that Yahuah (Lord) is very pitiful, and of tender mercy* (James 5:11). *Merciful and gracious, slow to anger, and plenteous in mercy* — the *end of Yahuah (Lord)* the patient see is no other than the LORD who is plenteous in mercy; the suffering is bounded by the tender mercy that crowns it.'),
  ('canon', 'james', 5, 11, 'canon', 'exodus', 34, 6, 'free', E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* (Exodus 34:6). When James says *Yahuah (Lord) is very pitiful, and of tender mercy* (James 5:11) he speaks the Name Yahuah (LORD) proclaimed of himself at Sinai: *merciful and gracious, longsuffering, and abundant in goodness and truth.* The character revealed to Moses on the mountain is the *end of Yahuah (Lord)* the enduring saints behold — the same merciful and longsuffering LORD who tried and then doubled Job.'),
  -- thread: james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20
  ('canon', 'james', 5, 12, 'canon', 'leviticus', 19, 12, 'free', E'*And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD).* (Leviticus 19:12). James''s *swear not... but let your yea be yea; and your nay, nay* (James 5:12) guards the Torah''s own command: *ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God).* The apostle is not abolishing the lawful oath but honoring the Name and the truth of speech the holiness code requires — the reverence that will not drag the Name into careless or false swearing, but lets a plain word stand as a man''s bond.'),
  ('canon', 'james', 5, 12, 'canon', 'exodus', 20, 7, 'free', E'*Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain.* (Exodus 20:7). The third word of the Decalogue stands behind James''s charge: *swear not, neither by heaven, neither by the earth, neither by any other oath* (James 5:12). To swear lightly is to take the Name *in vain* — and the oaths *by heaven... by the earth* are oaths that invoke Yahuah''s throne and footstool by proxy. James keeps the third word: let the yea be yea, that the Name be not made guiltless-breaking in vain.'),
  ('canon', 'james', 5, 12, 'canon', 'deuteronomy', 23, 21, 'free', E'*When thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it: for Yahuah Elohayka (the LORD thy God) will surely require it of thee; and it would be sin in thee.* (Deuteronomy 23:21). The Torah binds the vow: *thou shalt not slack to pay it... it would be sin in thee.* James''s remedy is to make every word a kept word — *let your yea be yea; and your nay, nay* (James 5:12) — so that a man need not bind himself with oaths he may fail to pay. The honoring of the vow and the honoring of plain speech are one reverence: speech before Yahuah (LORD) that does not trifle and does not fail.'),
  ('canon', 'james', 5, 12, 'canon', 'ecclesiastes', 5, 4, 'free', E'*When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed.* (Ecclesiastes 5:4). The Preacher warns against the rash vow — *defer not to pay it... Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:4-5). James''s *swear not... let your yea be yea* (James 5:12) is the same wisdom drawn to its point: guard the mouth, that no word spoken before Elohim (God) prove a fool''s broken vow. The fear of Elohim teaches few words and faithful ones.'),
  ('canon', 'james', 5, 12, 'apocrypha', 'ecclesiasticus', 23, 9, 'extras', E'*Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One.* (Sirach 23:9). The Hebrew wisdom-library says it almost in James''s own words: *accustom not thy mouth to swearing; neither use thyself to the naming of the Holy One* (Sirach 23:9), for *he that sweareth and nameth Yahuah (God) continually shall not be faultless* (Sirach 23:10). This is the reverence James commands — *swear not... but let your yea be yea* (James 5:12). Not the abolition of the lawful oath, but the refusal to make the Holy Name a habit of the careless tongue.'),
  ('canon', 'james', 5, 12, 'canon', 'matthew', 5, 34, 'free', E'*But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne;* (Matthew 5:34). James re-speaks his brother''s word from the mount almost exactly: *swear not, neither by heaven, neither by the earth* (James 5:12) echoes *Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne; Nor by the earth; for it is his footstool* (Matthew 5:34-35), and James''s *let your yea be yea; and your nay, nay* is the Master''s *let your communication be, Yea, yea; Nay, nay.* The oaths by heaven and earth invoke Yahuah by his throne and footstool; both the Master and his half-brother bid plain truthful speech that needs no oath, the Name honored and the word kept.'),
  -- thread: james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38
  ('canon', 'james', 5, 15, 'canon', 'psalms', 30, 2, 'free', E'*O Yahuah (LORD) my Elohim (God), I cried unto thee, and thou hast healed me.* (Psalm 30:2). David''s testimony is the ground of James''s promise: *I cried unto thee, and thou hast healed me.* James bids the sick *call for the elders... and let them pray over him,* for *the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up* (James 5:14-15). It is Yahuah (Lord) who raises and heals in answer to the cry; the prayer of faith reaches the same LORD who healed the psalmist.'),
  ('canon', 'james', 5, 16, 'canon', 'psalms', 32, 5, 'free', E'*I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin. Selah.* (Psalm 32:5). James joins healing to confession — *Confess your faults one to another, and pray one for another, that ye may be healed* (James 5:16); *if he have committed sins, they shall be forgiven him* (James 5:15). David found the same path: *I acknowledged my sin... I will confess my transgressions unto Yahuah (LORD); and thou forgavest.* The confessing mouth and the forgiving LORD are the wholeness James prays over the sick — body and soul healed together.'),
  ('canon', 'james', 5, 14, 'apocrypha', 'ecclesiasticus', 38, 9, 'extras', E'*My son, in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole.* (Sirach 38:9). The Hebrew wisdom-library already directed the sick to prayer: *in thy sickness... pray unto Yahuah (God), and he will make thee whole,* and *leave off from sin, and order thy hands aright, and cleanse thy heart from all wickedness* (Sirach 38:9-10). James says the same — *Is any sick among you? let him... pray... and if he have committed sins, they shall be forgiven him* (James 5:14-15). Prayer to Yahuah and the leaving of sin are the wisdom-library''s medicine of the soul, which James lays on the assembly.'),
  ('canon', 'james', 5, 14, 'canon', 'mark', 6, 13, 'free', E'*And they cast out many devils, and anointed with oil many that were sick, and healed them.* (Mark 6:13). The twelve, sent out, *anointed with oil many that were sick, and healed them* — the very practice James commands the elders: *let them pray over him, anointing him with oil in the name of Yahuah (Lord)* (James 5:14). The apostolic anointing of the sick that began in the Master''s sending continues in the gathered assembly; the oil is the sign, but *the prayer of faith* in the Name is what saves the sick (James 5:15).'),
  -- thread: james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18
  ('canon', 'james', 5, 17, 'canon', '1-kings', 17, 1, 'free', E'*And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* (1 Kings 17:1). James says *Elias... prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months* (James 5:17) — and here is the word: *there shall not be dew nor rain these years, but according to my word.* The prophet who shut the heaven was *a man subject to like passions as we are,* yet his earnest prayer held back the rain; James offers him as proof that *the effectual fervent prayer of a righteous man availeth much* (James 5:16).'),
  ('canon', 'james', 5, 18, 'canon', '1-kings', 18, 1, 'free', E'*And it came to pass after many days, that the word of Yahuah (LORD) came to Elijah in the third year, saying, Go, shew thyself unto Ahab; and I will send rain upon the earth.* (1 Kings 18:1). After the long drought, *the word of Yahuah (LORD)* came in *the third year* — matching James''s *three years and six months* — *and I will send rain upon the earth.* James says *he prayed again, and the heaven gave rain, and the earth brought forth her fruit* (James 5:18). The shutting and the opening of heaven both answer the prophet''s prayer; the same LORD who held back the rain at his word now sends it.'),
  ('canon', 'james', 5, 18, 'canon', '1-kings', 18, 45, 'free', E'*And it came to pass in the mean while, that the heaven was black with clouds and wind, and there was a great rain. And Ahab rode, and went to Jezreel.* (1 Kings 18:45). Elijah cast himself down upon Carmel and prayed, and at the seventh look a little cloud arose, *and the heaven was black with clouds and wind, and there was a great rain.* This is James''s *he prayed again, and the heaven gave rain, and the earth brought forth her fruit* (James 5:18). The earnest prayer of the righteous man opened the heavens; the great rain is the answer that James sets before the praying assembly.'),
  ('canon', 'james', 5, 17, 'canon', 'deuteronomy', 11, 17, 'free', E'*And then the LORD''S wrath be kindled against you, and he shut up the heaven, that there be no rain, and that the land yield not her fruit; and lest ye perish quickly from off the good land which Yahuah (LORD) giveth you.* (Deuteronomy 11:17). The Torah warned that covenant unfaithfulness would make Yahuah (LORD) *shut up the heaven, that there be no rain* — and Elijah''s drought is that very judgment loosed by prayer: *he prayed earnestly that it might not rain: and it rained not* (James 5:17). The prophet''s prayer aligned with the covenant''s own sanction; the shut heaven was the LORD''s word against Ahab''s house, answered through a righteous man''s earnest plea.'),
  ('canon', 'james', 5, 17, 'apocrypha', 'ecclesiasticus', 48, 1, 'extras', E'*Then stood up Elias the prophet as fire, and his word burned like a lamp.* (Sirach 48:1). The Hebrew library remembers Elias exactly as James invokes him: *Elias the prophet as fire... by the word of Yahuah (God) he shut up the heaven, and also three times brought down fire* (Sirach 48:1,3). James names the same prophet whose prayer *shut up the heaven* — *it rained not on the earth by the space of three years and six months* (James 5:17). The wisdom-library and the apostle both hold up Elias as the man whose word, by the word of Yahuah, governed the rain and the fire of heaven.'),
  -- thread: james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10
  ('canon', 'james', 5, 20, 'canon', 'ezekiel', 33, 8, 'free', E'*When I say unto the wicked, O wicked man, thou shalt surely die; if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand.* (Ezekiel 33:8). The watchman charge stands behind James''s closing word: *if thou warn the wicked of his way to turn from it... thou hast delivered thy soul* (Ezekiel 33:9). James says *he which converteth the sinner from the error of his way shall save a soul from death* (James 5:20). To turn a brother back is the watchman''s deliverance — the soul saved from death is both the sinner''s and, as Ezekiel teaches, the one who warned him.'),
  ('canon', 'james', 5, 20, 'canon', 'daniel', 12, 3, 'free', E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). Daniel sets the glory of the soul-winner: *they that turn many to righteousness as the stars for ever and ever.* James calls the same work blessed — *he which converteth the sinner from the error of his way shall save a soul from death* (James 5:19-20). To convert the erring is to turn one to righteousness; the apostle ends his letter with the labour Daniel crowns with everlasting light.'),
  ('canon', 'james', 5, 20, 'canon', 'proverbs', 10, 12, 'free', E'*Hatred stirreth up strifes: but love covereth all sins.* (Proverbs 10:12). James''s closing phrase is Proverbs'' word: *love covereth all sins.* He says the one who turns the sinner *shall save a soul from death, and shall hide a multitude of sins* (James 5:20). The hiding of sins is no concealment of guilt but the covering love works when it restores the erring — the same love that, drawing a brother back from the error of his way, covers the multitude of his sins before Yahuah (LORD).'),
  ('canon', 'james', 5, 20, 'canon', '1-peter', 4, 8, 'free', E'*And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.* (1 Peter 4:8). Peter speaks James''s own conclusion in the same Proverbs-rooted words: *charity shall cover the multitude of sins.* James says the one who converts the sinner *shall hide a multitude of sins* (James 5:20). Two apostles end on one note — the fervent love that turns and restores the brother covers a multitude of sins, the love that is the perfecting of the royal law James pressed throughout his letter.'),
  ('canon', 'james', 5, 20, 'apocrypha', 'tobit', 12, 9, 'extras', E'*For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* (Tobit 12:9). The Hebrew library held that mercy *doth deliver from death, and shall purge away all sin* — and James says the one who turns the sinner back *shall save a soul from death, and shall hide a multitude of sins* (James 5:20). The deed of righteous love that delivers from death in Tobit is the soul-saving, sin-covering work James crowns at the close of his letter; the merciful act that purges sin is the turning of a brother from the error of his way.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s239_j239c5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s239_j239c5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24',
       E'The hire of the labourers kept back by fraud crieth (Leviticus 19, Deuteronomy 24)',
       E'James closes his letter with a prophetic woe on the oppressing rich: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you... Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:1,4). This is no new ethic but the Torah''s own protection of the hireling, pressed to judgment. The holiness code forbids the very deed: *Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning* (Leviticus 19:13). Deuteronomy makes the unpaid wage a cry that reaches Yahuah himself: *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee* (Deuteronomy 24:15). That is exactly the cry James hears — *entered into the ears of Yahuah (Lord) of sabaoth,* the LORD of hosts who declares himself *a swift witness... against those that oppress the hireling in his wages* (Malachi 3:5). The prophets had already cried the same woe: *Woe unto him... that useth his neighbour''s service without wages, and giveth him not for his work* (Jeremiah 22:13); *Hear this, O ye that swallow up the needy* (Amos 8:4); *Woe unto them that join house to house, that lay field to field* (Isaiah 5:8), against whom the cankered gold *shall be a witness* (James 5:3). And the Hebrew wisdom-library names the deed for what it is: *The bread of the needy is their life: he that defraudeth him thereof is a man of blood... he that defraudeth the labourer of his hire is a bloodshedder* (Sirach 34:21-22). The withheld wage is not a small injustice but the taking of a man''s life-bread — bloodshed whose cry enters the ears of Yahuah (Lord) of sabaoth. James does not abolish the Torah; he wields it, holding the last-days rich to the law that guards the poor man''s hire.',
       sv.verse_id, ev.verse_id, 'extras', 8920
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2',
       E'Patience unto the coming: the husbandman and the early and latter rain (Deuteronomy 11, Joel 2)',
       E'*Be patient therefore, brethren, unto the coming of Yahuah (Lord). Behold, the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain. Be ye also patient; stablish your hearts: for the coming of Yahuah (Lord) draweth nigh* (James 5:7-8). James draws his figure of patience from the covenant rhythm of the land. The two rains are Yahuah''s gift in their seasons: *I will give you the rain of your land in his due season, the first rain and the latter rain, that thou mayest gather in thy corn, and thy wine, and thine oil* (Deuteronomy 11:14); *he will cause to come down for you the rain, the former rain, and the latter rain in the first month* (Joel 2:23). The farmer cannot hasten the harvest — he waits the early rain that sprouts and the latter rain that fills, with long patience. So the gathered wait the coming, for Hosea makes the coming itself the rain: *he shall come unto us as the rain, as the latter and former rain unto the earth* (Hosea 6:3). And the waiting is not doubt but appointed expectation, as Habakkuk taught: *the vision is yet for an appointed time... though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:3). The coming of Yahuah (Lord) — the coming of the Formed Son who bears the Father''s Name and glory — is as certain as the latter rain that ripens the field; the husbandman''s patience is the saint''s, the heart established because the harvest is sure.',
       sv.verse_id, ev.verse_id, 'free', 8923
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103',
       E'The patience of Job and the end of Yahuah: very pitiful, and of tender mercy (Job 42, Psalm 103, Exodus 34)',
       E'*Behold, we count them happy which endure. Ye have heard of the patience of Job, and have seen the end of Yahuah (Lord); that Yahuah (Lord) is very pitiful, and of tender mercy* (James 5:11). James points the suffering saints to Job, not for the trial only but for its outcome — *the end of Yahuah (Lord),* the conclusion the LORD wrote on Job''s endurance: *Yahuah (LORD) turned the captivity of Job, when he prayed for his friends: also Yahuah (LORD) gave Job twice as much as he had before* (Job 42:10), and *blessed the latter end of Job more than his beginning.* The trial was real and the restoration double; the One who let Job be proved is the One who crowned his patience. And James reads that *end* as a revelation of Yahuah''s very character — *very pitiful, and of tender mercy* — which is the Name Yahuah proclaimed of himself: *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8), the Name spoken at Sinai, *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). The patience of the saints rests on the known character of the LORD: the same merciful, longsuffering Yahuah who tried Job and then restored him double is the One whose tender mercy bounds every affliction the enduring bear.',
       sv.verse_id, ev.verse_id, 'free', 8926
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20',
       E'Swear not, but let your yea be yea: the Name and the vow honored (Leviticus 19, Exodus 20, Matthew 5)',
       E'*But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation* (James 5:12). Read through the framework, this is the third word kept, not the lawful oath abolished. The Torah forbids the false and profane oath: *ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12); and the Decalogue itself, *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7). The oaths *by heaven... by the earth* invoke Yahuah''s throne and footstool by proxy; to swear them lightly is to drag the Name into careless speech. The Torah also binds the vow once made — *thou shalt not slack to pay it... it would be sin in thee* (Deuteronomy 23:21) — and the Preacher warns, *When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools* (Ecclesiastes 5:4). The Hebrew wisdom-library says it almost as James does: *Accustom not thy mouth to swearing; neither use thyself to the naming of the Holy One* (Sirach 23:9). And James simply re-speaks his half-brother''s word from the mount: *Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne* (Matthew 5:34), *let your communication be, Yea, yea; Nay, nay.* The remedy is not lawlessness but truthfulness — a plain word that stands as a man''s bond, so the Name need never be invoked to prop up speech that should have been honest all along. The Name and the vow are honored, not the lawful oath cast off.',
       sv.verse_id, ev.verse_id, 'extras', 8929
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38',
       E'The prayer of faith over the sick, the oil, and the confession of faults (Psalm 30, Sirach 38, Mark 6)',
       E'*Is any sick among you? let him call for the elders of the church; and let them pray over him, anointing him with oil in the name of Yahuah (Lord): And the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up; and if he have committed sins, they shall be forgiven him. Confess your faults one to another, and pray one for another, that ye may be healed. The effectual fervent prayer of a righteous man availeth much* (James 5:14-16). The healing is Yahuah''s, sought as David sought it: *O Yahuah (LORD) my Elohim (God), I cried unto thee, and thou hast healed me* (Psalm 30:2). The Hebrew wisdom-library directed the sick to the same prayer: *My son, in thy sickness... pray unto Yahuah (God), and he will make thee whole; leave off from sin, and order thy hands aright* (Sirach 38:9-10) — prayer and the leaving of sin together, as James joins healing to forgiveness. The anointing with oil is the apostolic sign that began in the Master''s sending: the twelve *anointed with oil many that were sick, and healed them* (Mark 6:13). And James weds the body''s healing to the soul''s — *Confess your faults one to another... that ye may be healed* — as David found: *I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* (Psalm 32:5). The oil is the token, but the prayer of faith in the Name of Yahuah (Lord) is what saves and raises; the confessing mouth and the forgiving LORD make the whole man whole.',
       sv.verse_id, ev.verse_id, 'extras', 8932
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18',
       E'Elias prayed, and the heaven was shut and opened (1 Kings 17-18, Sirach 48)',
       E'*Elias was a man subject to like passions as we are, and he prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months. And he prayed again, and the heaven gave rain, and the earth brought forth her fruit* (James 5:17-18). James offers Elias as the living proof of his maxim, *the effectual fervent prayer of a righteous man availeth much* (James 5:16) — not a superhuman but *a man subject to like passions as we are.* The shutting of heaven was his word: *As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word* (1 Kings 17:1) — the very covenant sanction the Torah named, *he shut up the heaven, that there be no rain* (Deuteronomy 11:17). And the opening was the answer to prayer: *the word of Yahuah (LORD) came to Elijah in the third year... I will send rain upon the earth* (1 Kings 18:1); the prophet cast himself down upon Carmel, and *the heaven was black with clouds and wind, and there was a great rain* (1 Kings 18:45). The Hebrew library remembers him just as James does: *Elias the prophet as fire... by the word of Yahuah (God) he shut up the heaven, and also three times brought down fire* (Sirach 48:1,3). The same righteous man''s earnest prayer that bound the rain loosed it again — proof that the prayer of the gathered, men of like passions, avails much with Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'extras', 8935
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10',
       E'He which converteth the sinner shall save a soul and hide a multitude of sins (Ezekiel 33, Daniel 12, Proverbs 10)',
       E'James ends his letter on the turning of the erring brother: *Brethren, if any of you do err from the truth, and one convert him; Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* (James 5:19-20). This is the watchman''s charge of Ezekiel: *if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand* — yet *if thou warn the wicked... thou hast delivered thy soul* (Ezekiel 33:8-9). To turn a brother back is to save a soul from death, the watchman''s own deliverance. Daniel crowns the work with everlasting light: *they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). And the closing phrase is the wisdom of Proverbs — *Hatred stirreth up strifes: but love covereth all sins* (Proverbs 10:12) — the covering not of concealment but of restoring love, which Peter speaks in the same words: *charity shall cover the multitude of sins* (1 Peter 4:8). The Hebrew library held the same of righteous mercy: *alms doth deliver from death, and shall purge away all sin* (Tobit 12:9). So James closes as he began, with the royal law made perfect in deed: the love that turns the wanderer home delivers a soul from death and covers a multitude of sins before Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'extras', 8938
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:13 — *the wages of him that is hired shall not abide with thee all night until the morning* the Torah forbids the very deed; *the hire of the labourers... kept back by fraud, crieth* (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 24:15 — *give him his hire... lest he cry against thee unto Yahuah (LORD), and it be sin unto thee* the unpaid wage becomes a cry; *the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:5 — *a swift witness... against those that oppress the hireling in his wages* Yahuah Tseva''ot (LORD of hosts) the witness; the cry entered into the ears of Yahuah (Lord) of sabaoth (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 22:13 — *woe unto him... that useth his neighbour''s service without wages, and giveth him not for his work* the prophet''s woe on the wage-withholder; the hire kept back by fraud (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Amos 8:4 — *ye that swallow up the needy, even to make the poor of the land to fail* the prophetic woe on the devourers of the poor; the rich men who weep and howl (James 5:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 5:8 — *woe unto them that join house to house, that lay field to field* the woe on the land-grasping rich; the cankered gold a witness against them (James 5:1-3).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Sirach 34:22 — *he that defraudeth the labourer of his hire is a bloodshedder* the Hebrew library names the deed bloodshed; the bread of the needy is their life (Sirach 34:21), the hire kept back by fraud (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 11:14 — *the first rain and the latter rain* the covenant gift of the two rains; the husbandman waits *until he receive the early and latter rain* (James 5:7).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:23 — *the former rain, and the latter rain* the children of Zion bidden rejoice in the two rains; the patient husbandman of James 5:7.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 6:3 — *he shall come unto us as the rain, as the latter and former rain unto the earth* the coming itself made the rain; *the coming of Yahuah (Lord) draweth nigh* (James 5:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Habakkuk 2:3 — *though it tarry, wait for it; because it will surely come, it will not tarry* the appointed waiting; *be patient... unto the coming of Yahuah (Lord)* (James 5:7).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 42:10 — *Yahuah (LORD) turned the captivity of Job... gave Job twice as much as he had before* the end of Yahuah on Job''s endurance; *ye have heard of the patience of Job, and have seen the end of Yahuah (Lord)* (James 5:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=42 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:8 — *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* the Psalter''s confession; *Yahuah (Lord) is very pitiful, and of tender mercy* (James 5:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:6 — *merciful and gracious, longsuffering, and abundant in goodness and truth* the Name Yahuah proclaimed at Sinai; the *end of Yahuah (Lord)* the enduring behold (James 5:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:12 — *ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God)* the holiness code guards the Name; *swear not... let your yea be yea* (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:7 — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain* the third word of the Decalogue; the oaths by heaven and earth invoke the Name by proxy (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 23:21 — *when thou vowest a vow unto Yahuah... thou shalt not slack to pay it* the Torah binds the vow; let the plain word stand so no oath fails (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 5:4 — *when thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools* the Preacher''s warning against the rash vow; guard the mouth (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 23:9 — *accustom not thy mouth to swearing; neither use thyself to the naming of the Holy One* the wisdom-library almost in James''s words; not the oath abolished but the Name honored (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 5:34 — *Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne* the Master''s word from the mount; James re-speaks his half-brother: *let your yea be yea; and your nay, nay* (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 30:2 — *O Yahuah (LORD) my Elohim (God), I cried unto thee, and thou hast healed me* David''s testimony; *the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up* (James 5:15).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 38:9 — *in thy sickness... pray unto Yahuah (God), and he will make thee whole* the wisdom-library''s medicine of the soul; *Is any sick among you? let him... pray* (James 5:14).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=38 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 6:13 — *anointed with oil many that were sick, and healed them* the apostolic anointing from the Master''s sending; *anointing him with oil in the name of Yahuah (Lord)* (James 5:14).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 32:5 — *I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* David''s confession and forgiveness; *Confess your faults one to another... that ye may be healed* (James 5:16).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 17:1 — *there shall not be dew nor rain these years, but according to my word* the prophet''s word shutting heaven; *he prayed earnestly that it might not rain: and it rained not* (James 5:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 18:1 — *the word of Yahuah (LORD) came to Elijah in the third year... I will send rain upon the earth* the opening after the drought; *he prayed again, and the heaven gave rain* (James 5:18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 18:45 — *the heaven was black with clouds and wind, and there was a great rain* the answer to Elijah''s prayer on Carmel; *the earth brought forth her fruit* (James 5:18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 11:17 — *he shut up the heaven, that there be no rain* the covenant sanction loosed by Elijah''s prayer; *it rained not on the earth by the space of three years and six months* (James 5:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 48:1 — *Elias the prophet as fire... he shut up the heaven* (48:1,3) the Hebrew library''s memory of Elias; the prophet whose earnest prayer governed the rain (James 5:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:8 — *warn the wicked from his way... thou hast delivered thy soul* (33:8-9) the watchman''s charge; *he which converteth the sinner from the error of his way shall save a soul from death* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *they that turn many to righteousness as the stars for ever and ever* the soul-winner crowned with light; *converteth the sinner from the error of his way* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 10:12 — *love covereth all sins* the restoring love; *shall hide a multitude of sins* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 4:8 — *charity shall cover the multitude of sins* Peter''s Proverbs-rooted word; two apostles on one note, *shall hide a multitude of sins* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 12:9 — *alms doth deliver from death, and shall purge away all sin* righteous love that delivers from death; *shall save a soul from death* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session239 — James cross-references complete.'
