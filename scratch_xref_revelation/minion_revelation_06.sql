-- ----- fragment: minion_revelation_06.sql (S224 Revelation 6) -----
-- =====================================================================
-- S224 minion — REVELATION 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 6 (17 verses) — THE SIX SEALS opened by the Lamb.
-- Tag: rv06 (temp view _s224_rv06_lookup).
-- Sort band: floor 9125, step 3 (9125, 9128, 9131, 9134, 9137 used; under 9150).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation never says "it is written" — it is woven of allusion. Chapter 6 re-speaks
-- Zechariah's horsemen, the Leviticus-26 / Ezekiel-14 covenant judgments, the prophets' "how long,"
-- and the prophets' day-of-Yahuah cosmic-darkness. The seals are the consummation of the covenant
-- story — the same Yahuah (LORD), the same covenant sanctions the prophets named, the same cry of the
-- slain for vindication, the same dreadful day of his wrath — NOT a dispensational escape-clock. The
-- One on the throne (the Father) and the Lamb (the Formed Son) are distinguished throughout (6:16,
-- *the face of him that sitteth on the throne, and... the wrath of the Lamb*); preserved as the pull
-- gives. The slain *for the word of Elohim (God), and for the testimony which they held* (6:9) are the
-- saints whose blood the covenant-God avenges, the same cry as Psalm 79 and Zechariah 1.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every meaningful verse-block):
--   v.1-8   the four horsemen — white/red/black/pale; sword, famine, death, beasts
--           Tanakh: Zechariah 1:8-11 (the red/speckled/white horses sent to walk to and fro),
--                   Zechariah 6:1-6 (the four chariots, the four spirits of the heavens going forth),
--                   Ezekiel 14:21 (the four sore judgments: sword, famine, noisome beast, pestilence),
--                   Leviticus 26:25-26 (the sword avenging the covenant, the broken staff of bread)
--           Extras: none warranted (the horsemen weave is wholly the prophets' chariot-vision)
--           NT:     none warranted (carried into the day-of-Yahuah cosmic thread at v.12)
--   v.9-11  the souls under the altar slain for the word, crying How long, and given rest
--           Tanakh: Psalm 79:5 + 79:10 (How long... the revenging of the blood of thy servants),
--                   Zechariah 1:12 (O Yahuah of hosts, how long wilt thou not have mercy)
--           Extras: 1 Enoch 47:1-4 (the blood of the righteous, the prayer ascending, the books of
--                   the living, the number of the righteous offered), 2 Esdras 4:35-36 (the souls of
--                   the righteous: How long... until the number of seeds is filled)
--           NT:     none warranted
--   v.12-14 the sun black as sackcloth, the moon as blood, the stars falling, heaven as a scroll
--           Tanakh: Joel 2:31 (sun to darkness, moon to blood before the day of Yahuah), Isaiah 13:10
--                   (the stars... shall not give their light, the sun darkened), Isaiah 34:4 (the host
--                   of heaven dissolved, the heavens rolled as a scroll, the fig falling), Ezekiel 32:7
--                   (I will cover the heaven, the stars dark, the sun covered)
--           Extras: none warranted   NT: Matthew 24:29 (the sun darkened, the moon, the stars fall)
--   v.15-16 the kings and bondmen hide; Fall on us, hide us from the face... and the wrath of the Lamb
--           Tanakh: Hosea 10:8 (say to the mountains, Cover us; and to the hills, Fall on us),
--                   Isaiah 2:19 (into the holes of the rocks for fear of Yahuah and the glory of his majesty)
--           Extras: none warranted   NT: none warranted
--   v.17    the great day of his wrath is come; and who shall be able to stand?
--           Tanakh: Joel 2:11 (the day of Yahuah is great and very terrible; who can abide it),
--                   Zephaniah 1:14-15 (the great day of Yahuah... a day of wrath), Malachi 3:2 (who may
--                   abide the day of his coming? who shall stand when he appeareth?)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9125 revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments  (Tanakh)
--   9128 revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79           (Tanakh + Extras)
--   9131 revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34         (Tanakh + NT)
--   9134 revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2               (Tanakh)
--   9137 revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1        (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments
  ('canon', 'revelation', 6, 2, 'canon', 'zechariah', 1, 8, 'free', E'*I saw by night, and behold a man riding upon a red horse, and he stood among the myrtle trees that were in the bottom; and behind him were there red horses, speckled, and white.* (Zechariah 1:8). The seer of the Apocalypse has Zechariah''s night-vision in his ear: when the Lamb opens the seals and *behold a white horse* goes forth (Revelation 6:2), the coloured horses are the prophet''s own — red, speckled, and white, the riders Yahuah (LORD) appoints to walk through the earth. The horsemen of the seals are no new symbol minted out of nowhere; they re-speak the chariot-vision the covenant-God gave Zechariah of the powers he sends out over the nations.'),
  ('canon', 'revelation', 6, 4, 'canon', 'zechariah', 1, 10, 'free', E'*And the man that stood among the myrtle trees answered and said, These are they whom Yahuah (LORD) hath sent to walk to and fro through the earth.* (Zechariah 1:10). The horses of Zechariah are *they whom Yahuah (LORD) hath sent* — they go forth only at his sending. So when the red horse goes out and *power was given to him that sat thereon to take peace from the earth* (Revelation 6:4), the passive *was given* names the same hand: the rider takes peace because the One on the throne loosed him to do it. The seals are opened by the Lamb; the riders ride by grant; nothing goes forth in the earth but that Yahuah (LORD) has sent it.'),
  ('canon', 'revelation', 6, 5, 'canon', 'zechariah', 6, 1, 'free', E'*And I turned, and lifted up mine eyes, and looked, and, behold, there came four chariots out from between two mountains; and the mountains were mountains of brass.* (Zechariah 6:1). Zechariah''s second horse-vision sets out four chariots, and Revelation''s four seals loose four horses — white, red, black, and pale. When the third seal opens and *lo a black horse* appears (Revelation 6:5), it answers the black horses of the second chariot. The fourfold pattern is the prophet''s: four chariots, four spirits, four winds of judgment going out over the whole earth from before its Master.'),
  ('canon', 'revelation', 6, 5, 'canon', 'zechariah', 6, 5, 'free', E'*And the angel answered and said unto me, These are the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth.* (Zechariah 6:5). The four chariots are *the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* — they stand before him and depart at his word. The four horses of the seals go forth on the same authority: *Yahuah (Lord) of all the earth* sends them out, the powers of judgment loosed from before his throne. The black horse with *a pair of balances in his hand* (Revelation 6:5), weighing out bread by measure, rides as one of these heaven-sent spirits, not as a power that has slipped his Master''s hand.'),
  ('canon', 'revelation', 6, 8, 'canon', 'ezekiel', 14, 21, 'free', E'*For thus saith Adonai Yahuah (the Lord GOD); How much more when I send my four sore judgments upon Jerusalem, the sword, and the famine, and the noisome beast, and the pestilence, to cut off from it man and beast?* (Ezekiel 14:21). The pale horse gathers the four into one: *power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8). These are Ezekiel''s *four sore judgments* — *the sword, and the famine, and the noisome beast, and the pestilence* — the covenant-sanctions Yahuah (LORD) said he would *send.* Death and Hell ride on the warrant of the same God who told Ezekiel these are mine to send; the seal does not invent the judgments, it looses the ones the prophets had already named.'),
  ('canon', 'revelation', 6, 4, 'canon', 'leviticus', 26, 25, 'free', E'*And I will bring a sword upon you, that shall avenge the quarrel of my covenant: and when ye are gathered together within your cities, I will send the pestilence among you; and ye shall be delivered into the hand of the enemy.* (Leviticus 26:25). The great sword given to the red rider (Revelation 6:4) and the famine of the black rider are the covenant''s own sanctions. *I will bring a sword upon you, that shall avenge the quarrel of my covenant* — the sword is not random violence but the covenant-God''s answer to covenant-breaking, and the pestilence rides with it, the very *death* that follows the pale horse. The seals loose the judgments Leviticus 26 had warned would come.'),
  ('canon', 'revelation', 6, 6, 'canon', 'leviticus', 26, 26, 'free', E'*And when I have broken the staff of your bread, ten women shall bake your bread in one oven, and they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied.* (Leviticus 26:26). The black horse''s voice cries *A measure of wheat for a penny, and three measures of barley for a penny* (Revelation 6:6) — bread doled out by weight at a famine-price, a day''s wage for a day''s grain. This is the broken *staff of bread* of the covenant curse: *they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied.* The scarcity the third seal opens is the famine-sanction Leviticus named, measured bread that cannot fill.'),
  -- thread: revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79
  ('canon', 'revelation', 6, 10, 'canon', 'psalms', 79, 5, 'free', E'*How long, Yahuah (LORD)? wilt thou be angry for ever? shall thy jealousy burn like fire?* (Psalm 79:5). The souls under the altar cry the psalmist''s own cry: *How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). The slain of Psalm 79, whose blood was *shed like water round about Jerusalem,* asked *how long?* — and the martyrs under the altar take up the same words. The cry is not for private revenge but for the holy and true God to vindicate his covenant and his slain, the prayer the prophets and psalmists had always prayed.'),
  ('canon', 'revelation', 6, 10, 'canon', 'psalms', 79, 10, 'free', E'*Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* (Psalm 79:10). The psalm asks Yahuah (LORD) for *the revenging of the blood of thy servants which is shed* — the exact plea of the souls who cry *dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). The blood of the servants crying for vindication is one continuous cry from the psalm to the seal: the covenant-God will not leave the blood of his slain unanswered, nor let the nations say *Where is their Elohim (God)?* for ever.'),
  ('canon', 'revelation', 6, 10, 'canon', 'zechariah', 1, 12, 'free', E'*Then the angel of Yahuah (LORD) answered and said, O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem and on the cities of Yahudah (Judah), against which thou hast had indignation these threescore and ten years?* (Zechariah 1:12). In the same horse-vision Revelation 6 re-speaks, the angel of Yahuah (LORD) cries *how long wilt thou not have mercy* — and the souls under the altar cry *How long, O Yahuah (Lord), holy and true* (Revelation 6:10). The *how long?* of the heavenly intercessor and the *how long?* of the martyrs are the same plea: that the God who has long held back would now arise and vindicate his people and his covenant.'),
  ('canon', 'revelation', 6, 9, 'enoch', '1-enoch', 47, 1, 'extras', E'*And in those days shall have ascended the prayer of the righteous, And the blood of the righteous from the earth before Yahuah (God) of Spirits.* (1 Enoch 47:1). Enoch saw the same altar-scene: the blood of the righteous ascending from the earth before the throne. Under the altar John sees *the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9). The slain do not lie silent — their blood and their prayer go up together before Yahuah (God) of Spirits, the cry of the martyrs reaching the throne, exactly as the Hebrew library had pictured it.'),
  ('canon', 'revelation', 6, 10, 'enoch', '1-enoch', 47, 4, 'extras', E'*And the hearts of the holy were filled with joy; Because the number of the righteous had been offered, And the prayer of the righteous had been heard, And the blood of the righteous been required before Yahuah (God) of Spirits.* (1 Enoch 47:4). Enoch hears the answer the souls under the altar are waiting for: the blood of the righteous *required* — that is, avenged and accounted for — once *the number of the righteous had been offered.* The martyrs cry *dost thou not judge and avenge our blood* (Revelation 6:10), and are told to *rest yet for a little season, until... their brethren, that should be killed as they were, should be fulfilled* (Revelation 6:11). The rest and the full number are the same answer Enoch already records: the blood is required once the number is complete.'),
  ('canon', 'revelation', 6, 11, 'apocrypha', '2-esdras', 4, 35, 'extras', E'*Did not the souls also of the righteous ask question of these things in their chambers, saying, How long shall I hope on this fashion? when comes the fruit of the floor of our reward?* (2 Esdras 4:35). Ezra is shown the very scene of the fifth seal: *the souls of the righteous* in their chambers asking *How long?* — the same cry as the souls under the altar (Revelation 6:10), and the answer is the same as theirs. They are told to *rest yet for a little season, until... their brethren... should be fulfilled* (Revelation 6:11); Ezra is told the reward waits *even when the number of seeds is filled.* The waiting-souls and the appointed number are one teaching across the library.'),
  ('canon', 'revelation', 6, 11, 'apocrypha', '2-esdras', 4, 36, 'extras', E'*And to these things Uriel the archangel gave them answer, and said, Even when the number of seeds is filled in you: for he has weighed the world in the balance.* (2 Esdras 4:36). The answer given to the souls in Esdras is the answer given under the altar: the vindication comes *when the number of seeds is filled.* The martyrs must *rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled* (Revelation 6:11). The filling of the appointed number — the full harvest of the righteous and the martyred — is the hinge on which the judgment turns in both witnesses; the season of rest is measured, not endless.'),
  -- thread: revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34
  ('canon', 'revelation', 6, 12, 'canon', 'joel', 2, 31, 'free', E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* (Joel 2:31). The sixth seal is Joel''s day spoken almost word for word: *the sun became black as sackcloth of hair, and the moon became as blood* (Revelation 6:12). Joel had said *the sun... into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD).* The seal does not announce a strange new portent; it brings to pass the day-of-Yahuah signs the prophet named, the heavens themselves darkened and bloodied before the dread day breaks.'),
  ('canon', 'revelation', 6, 13, 'canon', 'isaiah', 13, 10, 'free', E'*For the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened in his going forth, and the moon shall not cause her light to shine.* (Isaiah 13:10). Isaiah''s day-of-Yahuah oracle darkens the same lights: *the stars of heaven... shall not give their light: the sun shall be darkened.* So at the sixth seal *the stars of heaven fell unto the earth* (Revelation 6:13). The cosmic darkening that runs through Isaiah''s and Joel''s day-of-Yahuah is gathered into the opening of the seal — the same heavens, the same shaking, the same dread day announced by the prophets.'),
  ('canon', 'revelation', 6, 14, 'canon', 'isaiah', 34, 4, 'free', E'*And all the host of heaven shall be dissolved, and the heavens shall be rolled together as a scroll: and all their host shall fall down, as the leaf falleth off from the vine, and as a falling fig from the fig tree.* (Isaiah 34:4). Two of Isaiah''s images stand together in one verse of the seal: *the heaven departed as a scroll when it is rolled together* and the stars fell *even as a fig tree casteth her untimely figs* (Revelation 6:13-14). Isaiah had said *the heavens shall be rolled together as a scroll,* their host falling *as a falling fig from the fig tree.* The seer is reading Isaiah''s day-of-Yahuah straight onto the page: the sky rolled up, the stars dropping like late figs in the wind.'),
  ('canon', 'revelation', 6, 12, 'canon', 'ezekiel', 32, 7, 'free', E'*And when I shall put thee out, I will cover the heaven, and make the stars thereof dark; I will cover the sun with a cloud, and the moon shall not give her light.* (Ezekiel 32:7). Ezekiel''s lament over the fall of a great power darkens the very same heavens: *I will cover the heaven, and make the stars thereof dark; I will cover the sun.* At the sixth seal *the sun became black as sackcloth of hair, and the moon became as blood* (Revelation 6:12). The covenant-God who darkened the heavens over the proud in Ezekiel''s day darkens them again at the seal — the day-of-Yahuah register the prophets share, the lights of heaven veiled when he arises to judge.'),
  ('canon', 'revelation', 6, 12, 'canon', 'matthew', 24, 29, 'free', E'*Immediately after the tribulation of those days shall the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven, and the powers of the heavens shall be shaken:* (Matthew 24:29). The Master himself gathered Joel and Isaiah into one saying: *the sun be darkened... the moon... the stars shall fall from heaven.* The sixth seal speaks his words back — *the sun became black as sackcloth... and the moon became as blood; and the stars of heaven fell unto the earth* (Revelation 6:12-13). The same cosmic signs the prophets foretold and Yahusha (Jesus) re-spoke now open before John; the seal, the olivet-word, and the prophets witness to one dreadful day.'),
  -- thread: revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2
  ('canon', 'revelation', 6, 16, 'canon', 'hosea', 10, 8, 'free', E'*The high places also of Aven, the sin of Yashar''el (Israel), shall be destroyed: the thorn and the thistle shall come up on their altars; and they shall say to the mountains, Cover us; and to the hills, Fall on us.* (Hosea 10:8). The cry of the terrified at the sixth seal is Hosea''s word: they *said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne* (Revelation 6:16). Hosea''s guilty *shall say to the mountains, Cover us; and to the hills, Fall on us* — the men who would sooner be crushed by a mountain than face the throne. The prophet had given the very words the kings and bondmen now scream when the day of wrath breaks.'),
  ('canon', 'revelation', 6, 15, 'canon', 'isaiah', 2, 19, 'free', E'*And they shall go into the holes of the rocks, and into the caves of the earth, for fear of Yahuah (LORD), and for the glory of his majesty, when he ariseth to shake terribly the earth.* (Isaiah 2:19). Isaiah saw the proud flee to the rocks: *into the holes of the rocks, and into the caves of the earth, for fear of Yahuah (LORD).* So at the seal *the kings of the earth, and the great men... hid themselves in the dens and in the rocks of the mountains* (Revelation 6:15). The great earthquake of the seal is Isaiah''s *when he ariseth to shake terribly the earth* — and the mighty who would not bow now hide in the rocks before the face of the One on the throne and the wrath of the Lamb.'),
  -- thread: revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1
  ('canon', 'revelation', 6, 17, 'canon', 'joel', 2, 11, 'free', E'*And Yahuah (LORD) shall utter his voice before his army: for his camp is very great: for he is strong that executeth his word: for the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). The seal closes with Joel''s own question: *For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Joel had asked of *the day of Yahuah (LORD)* — *great and very terrible* — *and who can abide it?* The unanswered question hangs over both: the day of wrath has come, and no power of man, from the kings to the bondmen, can stand against the face of the One who sits on the throne.'),
  ('canon', 'revelation', 6, 17, 'canon', 'zephaniah', 1, 14, 'free', E'*The great day of Yahuah (LORD) is near, it is near, and hasteth greatly, even the voice of the day of Yahuah (LORD): the mighty man shall cry there bitterly.* (Zephaniah 1:14). The seal''s *great day of his wrath* (Revelation 6:17) is Zephaniah''s *great day of Yahuah (LORD)* — near, hastening, when *the mighty man shall cry there bitterly.* And it is precisely the mighty who cry at the seal: the *great men, and the rich men, and the chief captains, and the mighty men* hiding in the rocks (Revelation 6:15). The prophet named the day and named who would wail in it; the seal brings it to pass.'),
  ('canon', 'revelation', 6, 17, 'canon', 'zephaniah', 1, 15, 'free', E'*That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness,* (Zephaniah 1:15). Zephaniah calls it outright *a day of wrath* — the very name the seal gives: *the great day of his wrath is come* (Revelation 6:17). The darkness and thick clouds the prophet heaps up are the darkened sun and bloodied moon of the sixth seal; the seal is the day Zephaniah saw, the wrath-day of Yahuah (LORD) breaking on a world that cannot stand before it.'),
  ('canon', 'revelation', 6, 17, 'canon', 'malachi', 3, 2, 'free', E'*But who may abide the day of his coming? and who shall stand when he appeareth? for he is like a refiner''s fire, and like fullers'' soap:* (Malachi 3:2). Malachi asks the seal''s closing question word for word: *who shall stand when he appeareth?* — and the seal answers, *who shall be able to stand?* (Revelation 6:17). The day of his coming, the refiner''s fire, is the day of wrath; none can abide it of themselves. The question the prophet left ringing is the question the seal leaves ringing, and only those refined and held by him will stand when he appears.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments',
       E'The four horsemen of the seals — Zechariah''s chariots and the covenant judgments (Zechariah 1 and 6, Ezekiel 14, Leviticus 26)',
       E'When the Lamb opens the first four seals, four horses go forth — *behold a white horse* (Revelation 6:2), *another horse that was red* (6:4), *a black horse* with *a pair of balances* (6:5), and *a pale horse: and his name that sat on him was Death, and Hell followed with him* (6:8). The seer is not minting a new symbol; he has Zechariah''s night-visions in his ear. Zechariah saw *a man riding upon a red horse... and behind him were there red horses, speckled, and white* (Zechariah 1:8), and was told *These are they whom Yahuah (LORD) hath sent to walk to and fro through the earth* (Zechariah 1:10) — the horses go forth only at the sending of the covenant-God. And he saw *four chariots* (Zechariah 6:1), named *the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* (Zechariah 6:5). The fourfold horse-pattern, the colours, the going-forth from before the throne — all of it is the prophet''s. So the passive *power was given* over each rider (6:4, 6:8) names the same hand: nothing rides in the earth but that *Yahuah (Lord) of all the earth* has loosed it. And the judgments themselves are the covenant''s own. The pale horse kills *with sword, and with hunger, and with death, and with the beasts of the earth* (6:8) — Ezekiel''s *four sore judgments... the sword, and the famine, and the noisome beast, and the pestilence* (Ezekiel 14:21), the very things Yahuah (LORD) said *I send.* The great sword given the red rider is the covenant-sword: *I will bring a sword upon you, that shall avenge the quarrel of my covenant* (Leviticus 26:25). The black rider''s cry *A measure of wheat for a penny* (6:6) is the broken staff of bread — *they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied* (Leviticus 26:26). The seals do not invent the judgments; they loose the covenant-sanctions the Torah and the prophets had long since named, sent out from before the throne of the Master of all the earth.',
       sv.verse_id, ev.verse_id, 'free', 9125
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79',
       E'The souls under the altar crying How long, and the rest given (Psalm 79, Zechariah 1, 1 Enoch 47, 2 Esdras 4)',
       E'The fifth seal opens on an altar-scene the Hebrew library had already seen. *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held: And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:9-10). The cry is the psalmist''s: *How long, Yahuah (LORD)? wilt thou be angry for ever?* (Psalm 79:5), and the plea for *the revenging of the blood of thy servants which is shed* (Psalm 79:10) — not a cry for private vengeance but for the holy and true God to vindicate his covenant and his slain. It is the angel''s cry in the very horse-vision this chapter re-speaks: *O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy?* (Zechariah 1:12). And the restored library pictures the same altar: *the blood of the righteous from the earth before Yahuah (God) of Spirits* (1 Enoch 47:1), the prayer of the slain ascending — and the answer, that the blood of the righteous is *required* once *the number of the righteous had been offered* (1 Enoch 47:4). So too Ezra: *the souls... of the righteous ask question... saying, How long shall I hope on this fashion?* (2 Esdras 4:35), and are told the reward comes *even when the number of seeds is filled* (2 Esdras 4:36). This is exactly the answer given under the altar: *white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled* (Revelation 6:11). The martyrs are not silenced and not forgotten; they are robed, given rest, and told the day waits only on the filling of the appointed number. The blood will be required; the season is measured, not endless.',
       sv.verse_id, ev.verse_id, 'extras', 9128
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34',
       E'The sun black, the moon as blood, the heaven rolled as a scroll — the day of Yahuah (LORD) (Joel 2, Isaiah 13 and 34, Ezekiel 32, Matthew 24)',
       E'The sixth seal is the prophets'' day-of-Yahuah spoken almost word for word. *The sun became black as sackcloth of hair, and the moon became as blood; And the stars of heaven fell unto the earth, even as a fig tree casteth her untimely figs, when she is shaken of a mighty wind; And the heaven departed as a scroll when it is rolled together* (Revelation 6:12-14). Joel had said it: *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31). Isaiah had said it: *the stars of heaven and the constellations thereof shall not give their light: the sun shall be darkened* (Isaiah 13:10), and *the heavens shall be rolled together as a scroll: and all their host shall fall down... as a falling fig from the fig tree* (Isaiah 34:4) — the seer reads Isaiah''s scroll and Isaiah''s falling fig straight onto the page. Ezekiel had said it over the fall of a proud power: *I will cover the heaven, and make the stars thereof dark; I will cover the sun* (Ezekiel 32:7). And the Master himself gathered them all into one saying: *the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven, and the powers of the heavens shall be shaken* (Matthew 24:29). The seal does not announce a strange new portent — it brings to pass the cosmic signs Joel, Isaiah, and Ezekiel named and Yahusha (Jesus) re-spoke: the heavens veiled and shaken when Yahuah (LORD) arises to judge, the dreadful day of his coming breaking over the whole earth.',
       sv.verse_id, ev.verse_id, 'free', 9131
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2',
       E'Fall on us, hide us from the face of him on the throne and the wrath of the Lamb (Hosea 10, Isaiah 2)',
       E'When the sixth seal breaks, the great of the earth flee to the rocks, and the words on their lips are the prophets''. *The kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains; And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb* (Revelation 6:15-16). Hosea had given them the cry: the guilty *shall say to the mountains, Cover us; and to the hills, Fall on us* (Hosea 10:8) — men who would sooner be buried under a mountain than face the throne. Isaiah had given them the hiding-place: *they shall go into the holes of the rocks, and into the caves of the earth, for fear of Yahuah (LORD), and for the glory of his majesty, when he ariseth to shake terribly the earth* (Isaiah 2:19) — and the great earthquake of the seal is precisely that shaking. Mark what they flee: *the face of him that sitteth on the throne, and... the wrath of the Lamb.* The One on the throne and the Lamb are named together and distinguished — the Father who sits, and the Formed Son whose wrath is now revealed, the slain Lamb who is also the Lion. The proud who would not bow to him now beg the rocks to fall on them rather than meet his face. The prophets put the words in their mouths long before the seal was opened.',
       sv.verse_id, ev.verse_id, 'free', 9134
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1',
       E'The great day of his wrath is come, and who shall be able to stand? (Joel 2, Zephaniah 1, Malachi 3)',
       E'The seal closes on a question the prophets had left ringing for centuries: *For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Joel had asked it of the day of Yahuah (LORD): *the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). Zephaniah had named the day by the very name the seal gives it — *The great day of Yahuah (LORD) is near, it is near, and hasteth greatly... the mighty man shall cry there bitterly* (Zephaniah 1:14), *That day is a day of wrath, a day of trouble and distress... a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15). And it is precisely the mighty who cry at the seal, the *great men, and the rich men, and the chief captains, and the mighty men* hiding in the rocks (Revelation 6:15); the darkness Zephaniah heaped up is the darkened sun and bloodied moon of the sixth seal. Malachi had asked the closing question almost word for word: *who may abide the day of his coming? and who shall stand when he appeareth? for he is like a refiner''s fire* (Malachi 3:2). The seal answers his question with the same question — *who shall be able to stand?* No power of man can abide the day of wrath of itself; the refiner''s fire is upon the whole earth, and only those refined and held by him will be left standing when he appears.',
       sv.verse_id, ev.verse_id, 'free', 9137
  FROM _s224_rv06_lookup sv, _s224_rv06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 1:8 — *a man riding upon a red horse... and behind him were there red horses, speckled, and white* the night-vision the seer re-speaks; the coloured horses of the seals are the prophet''s own (Revelation 6:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 1:10 — *These are they whom Yahuah (LORD) hath sent to walk to and fro through the earth* the horses go forth only at his sending; the rider takes peace because the throne loosed him (Revelation 6:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 6:1 — *there came four chariots out from between two mountains* the fourfold horse-pattern of the seals is the prophet''s four chariots (Revelation 6:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 6:5 — *the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* the horses ride from before the throne, sent by the Master of all the earth (Revelation 6:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 14:21 — *my four sore judgments... the sword, and the famine, and the noisome beast, and the pestilence* the pale horse gathers the four covenant-judgments Yahuah (LORD) said he would send (Revelation 6:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Leviticus 26:25 — *I will bring a sword upon you, that shall avenge the quarrel of my covenant* the red rider''s great sword is the covenant-sword answering covenant-breaking (Revelation 6:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Leviticus 26:26 — *they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied* the black rider''s measured famine-bread is the broken staff of bread of the covenant curse (Revelation 6:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 79:5 — *How long, Yahuah (LORD)? wilt thou be angry for ever?* the psalmist''s cry, the very words of the souls under the altar (Revelation 6:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 79:10 — *the revenging of the blood of thy servants which is shed* the exact plea of the martyrs, that the covenant-God avenge his slain (Revelation 6:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 1:12 — *O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy* the angel''s how-long in the same horse-vision; one continuous cry with the martyrs'' (Revelation 6:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 47:1 — *the blood of the righteous from the earth before Yahuah (God) of Spirits* the same altar-scene, the blood and prayer of the slain ascending to the throne (Revelation 6:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 47:4 — *the blood of the righteous been required... Because the number of the righteous had been offered* the answer the martyrs await: the blood is avenged once the number is complete (Revelation 6:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 4:35 — *the souls also of the righteous... saying, How long shall I hope on this fashion?* the same waiting-souls asking how long, given the same answer of a measured season (Revelation 6:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'2 Esdras 4:36 — *Even when the number of seeds is filled in you* the vindication waits on the filling of the appointed number, exactly as the martyrs are told to rest until their brethren be fulfilled (Revelation 6:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-souls-under-the-altar-crying-how-long-and-the-rest-given-psalm-79'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=4 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:31 — *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD)* the sixth seal speaks Joel''s day almost word for word (Revelation 6:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 13:10 — *the stars of heaven... shall not give their light: the sun shall be darkened* Isaiah''s day-of-Yahuah darkening, gathered into the seal as the stars fall (Revelation 6:13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 34:4 — *the heavens shall be rolled together as a scroll... as a falling fig from the fig tree* the seer reads Isaiah''s scroll and falling fig straight onto the page (Revelation 6:13-14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 32:7 — *I will cover the heaven, and make the stars thereof dark; I will cover the sun* the covenant-God darkens the heavens over the proud, the same day-of-Yahuah register (Revelation 6:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=32 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 24:29 — *the sun be darkened... the stars shall fall from heaven, and the powers of the heavens shall be shaken* the Master gathered Joel and Isaiah into one saying the seal speaks back (Revelation 6:12-13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 10:8 — *they shall say to the mountains, Cover us; and to the hills, Fall on us* the prophet''s cry on the lips of the terrified at the seal (Revelation 6:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 2:19 — *into the holes of the rocks... for fear of Yahuah (LORD)... when he ariseth to shake terribly the earth* the great earthquake of the seal is Isaiah''s shaking; the proud flee to the rocks (Revelation 6:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:11 — *the day of Yahuah (LORD) is great and very terrible; and who can abide it?* the unanswered question Joel left ringing, now closing the seal (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zephaniah 1:14 — *The great day of Yahuah (LORD) is near... the mighty man shall cry there bitterly* the prophet names the day and names who would wail; the mighty cry at the seal (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zephaniah 1:15 — *That day is a day of wrath... a day of darkness and gloominess, a day of clouds and thick darkness* the seal''s day of wrath is Zephaniah''s, the darkness of the sixth seal (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:2 — *who may abide the day of his coming? and who shall stand when he appeareth?* the prophet''s question the seal answers with the same question (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv06_lookup sv, _s224_rv06_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
