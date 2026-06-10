-- ----- fragment: minion_revelation_11.sql (S224 Revelation 11) -----
-- =====================================================================
-- S224 minion — REVELATION 11 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 11 (19 verses) — the measured temple, the two witnesses, the seventh trumpet.
-- Tag: rv11 (temp view _s224_rv11_lookup).
-- Sort band: floor 9250, step 3 (9250, 9253, 9256, 9259, 9262, 9265, 9268 used; under 9275).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation is the consummation of the covenant story — the same Yahuah (LORD),
-- the same Torah, the same Yashar'el (Israel) brought to restoration; it is woven entirely out of
-- the prophets and never says "it is written." Chapter 11 re-speaks Ezekiel's measured temple, the
-- two olive trees and the lampstand of Zechariah 4, the fire-mouthed prophets Moses and Elijah, the
-- Spirit-breathed slain of Ezekiel 37, and Daniel's everlasting kingdom given to the saints. The
-- temple measured and the witnesses raised are the restoration in figure: the seventh trumpet
-- declares *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah
-- (Christ); and he shall reign for ever and ever* (11:15), and the ark of the testament — the
-- covenant of Sinai — is seen in the opened temple (11:19). Christology: on the throne sits the One
-- worshipped by the elders (*O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to
-- come*, 11:17), and the kingdom is *of our Lord, and of his Messiah (Christ)* — the Father and the
-- Formed Son distinguished, never collapsed and never made co-equal persons. Preserved as the pull
-- gives.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the reed to measure the temple, the altar, the worshippers; the court given to the nations
--           Tanakh: Ezekiel 40:3 (the measuring reed in the man's hand), Ezekiel 42:20 (the wall to
--                   separate sanctuary from profane), Zechariah 2:1-2 (the measuring line to measure
--                   Jerusalem), Daniel 8:13 (the sanctuary trodden under foot), Isaiah 63:18 (our
--                   adversaries have trodden down thy sanctuary)
--           Extras: 1 Enoch 90:17 (a new house built greater and loftier than the first)
--           NT: none warranted (the temple-restoration root is wholly prophetic)
--   v.3-4   my two witnesses; the two olive trees and the two candlesticks
--           Tanakh: Zechariah 4:3 (two olive trees by the candlestick), Zechariah 4:11 (the two
--                   olive trees on the right and left), Zechariah 4:14 (these are the two anointed
--                   ones that stand by Yahuah (Lord) of the whole earth)
--           Extras: none warranted   NT: none warranted
--   v.5-6   fire from their mouth, power to shut heaven and turn waters to blood — Moses and Elijah
--           Tanakh: Jeremiah 5:14 (I will make my words in thy mouth fire), 1 Kings 17:1 (Elijah:
--                   there shall not be dew nor rain), 2 Kings 1:10 (fire come down and consume),
--                   Exodus 7:17 (smite the waters, turned to blood)
--           Extras: Sirach 48:1 (Elias stood up as fire, his word burned like a lamp), 48:3 (he shut
--                   up the heaven, and three times brought down fire)
--           NT: none warranted (Malachi 4:5 Elijah-return carried in the ascent thread at v.12)
--   v.7-10  the beast from the pit kills them; their bodies in the great city where our Lord crucified
--           Tanakh: Daniel 7:21 (the horn made war with the saints and prevailed), Isaiah 1:9
--                   (we should have been as Sodom), Isaiah 1:10 (ye rulers of Sodom, ye people of
--                   Gomorrah — the great city spiritually called Sodom)
--           Extras: none warranted   NT: none warranted
--   v.11-12 the Spirit of life entered them; they stood on their feet and ascended in a cloud
--           Tanakh: Ezekiel 37:5 (I will cause breath to enter into you, and ye shall live),
--                   Ezekiel 37:10 (the breath came into them, and they stood up upon their feet),
--                   2 Kings 2:11 (Elijah went up by a whirlwind into heaven)
--           Extras: Sirach 48:9 (Elias taken up in a whirlwind of fire), 48:10 (ordained for
--                   reproofs, to turn the heart of the father to the son, and to restore the tribes)
--           NT: none warranted (Malachi 4:5 the Elijah-return woven in prose)
--   v.13    the earthquake, the tenth part fell, seven thousand slain, the remnant gave glory
--           Tanakh: none warranted (the giving-glory motif carried in prose under the trumpet thread)
--           Extras: none warranted   NT: none warranted
--   v.14    the second woe past, the third cometh — narrative hinge
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.15-18 the seventh trumpet; the kingdoms become our Lord's and his Messiah's; he shall reign
--           Tanakh: Daniel 2:44 (Elohim shall set up a kingdom which shall never be destroyed),
--                   Daniel 7:14 (dominion that shall not pass away), Daniel 7:27 (the kingdom given
--                   to the saints, an everlasting kingdom), Psalm 2:8 (the heathen for thine
--                   inheritance), Psalm 2:9 (break them with a rod of iron), Zechariah 14:9 (Yahuah
--                   shall be king over all the earth), Exodus 15:18 (Yahuah shall reign for ever)
--           Extras: none warranted   NT: none warranted
--   v.19    the temple opened, the ark of his testament seen; lightnings and thunderings
--           Tanakh: Exodus 25:21 (put the testimony in the ark), Exodus 25:22 (I will commune with
--                   thee from above the mercy seat), 1 Kings 8:6 (the ark brought into the most holy
--                   place), Exodus 19:16 (thunders and lightnings and a thick cloud upon the mount)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9250 revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40           (Tanakh + Extras)
--   9253 revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4  (Tanakh)
--   9256 revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17    (Tanakh + Extras)
--   9259 revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7    (Tanakh)
--   9262 revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37      (Tanakh + Extras)
--   9265 revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7   (Tanakh)
--   9268 revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25                (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40
  ('canon', 'revelation', 11, 1, 'canon', 'ezekiel', 40, 3, 'free', E'*And he brought me thither, and, behold, there was a man, whose appearance was like the appearance of brass, with a line of flax in his hand, and a measuring reed; and he stood in the gate.* (Ezekiel 40:3). The seer''s reed is Ezekiel''s: *And there was given me a reed like unto a rod: and the angel stood, saying, Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1). The man with the measuring reed who walked the restored temple from gate to gate is the same figure handing John the rod — the measuring is no demolition but a marking-off of what belongs to Yahuah (LORD), the sanctuary set apart and preserved.'),
  ('canon', 'revelation', 11, 1, 'canon', 'ezekiel', 40, 4, 'free', E'*And the man said unto me, Son of Adam, behold with thine eyes, and hear with thine ears, and set thine heart upon all that I shall shew thee; for to the intent that I might shew them unto thee art thou brought hither: declare all that thou seest to the house of Yashar''el (Israel).* (Ezekiel 40:4). As the man charged Ezekiel to measure and *declare all that thou seest to the house of Yashar''el (Israel)*, so the angel charges John to *measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1). The measured house is for the restoration of the whole house of Yashar''el (Israel) — the worshippers numbered and kept, the covenant people marked off as Yahuah''s (LORD''s) own.'),
  ('canon', 'revelation', 11, 1, 'canon', 'zechariah', 2, 1, 'free', E'*I lifted up mine eyes again, and looked, and behold a man with a measuring line in his hand.* (Zechariah 2:1). Zechariah too saw the measurer: *Then said I, Whither goest thou? And he said unto me, To measure Jerusalem* (Zechariah 2:2) — and the word that followed was a promise of restoration, Yahuah (LORD) himself *a wall of fire round about, and... the glory in the midst of her.* So when the angel says *Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1), the measuring marks the holy city kept for blessing, even while the outer court is given to the nations.'),
  ('canon', 'revelation', 11, 2, 'canon', 'ezekiel', 42, 20, 'free', E'*He measured it by the four sides: it had a wall round about, five hundred reeds long, and five hundred broad, to make a separation between the sanctuary and the profane place.* (Ezekiel 42:20). Ezekiel''s measuring ended in a wall *to make a separation between the sanctuary and the profane place* — and that is the very line the angel draws: *But the court which is without the temple leave out, and measure it not; for it is given unto the Gentiles* (Revelation 11:2). The reed divides the holy from the profane; the temple and the worshippers are measured and kept, the outer court left to those who tread it down.'),
  ('canon', 'revelation', 11, 2, 'canon', 'daniel', 8, 13, 'free', E'*Then I heard one saint speaking, and another saint said unto that certain saint which spake, How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot?* (Daniel 8:13). Daniel heard the same treading of the holy place — *the sanctuary and the host to be trodden under foot* — and the same *How long?* So the holy city given over: *the holy city shall they tread under foot forty and two months* (Revelation 11:2). The trampling of the sanctuary by the nations is a measured, appointed time, bounded and brief, and the *How long?* is already answered in the kept temple.'),
  ('canon', 'revelation', 11, 2, 'canon', 'isaiah', 63, 18, 'free', E'*The people of thy holiness have possessed it but a little while: our adversaries have trodden down thy sanctuary.* (Isaiah 63:18). Isaiah''s lament is the same grief — *our adversaries have trodden down thy sanctuary.* *The holy city shall they tread under foot forty and two months* (Revelation 11:2). But the treading is *a little while*; the adversaries hold the outer court only for the appointed season, and the prayer of Isaiah for the *tribes of thine inheritance* is the cry the measured temple answers — the sanctuary trodden now, restored at the trumpet.'),
  ('canon', 'revelation', 11, 1, 'enoch', '1-enoch', 90, 17, 'extras', E'*And a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house.* (1 Enoch 90:17). The restored library saw the end of the measuring — not the old house propped up but *a new house... greater and loftier than the first*, into which the Lord of the sheep gathers all his flock. So the angel''s reed to *measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1) marks off the house being built for the regathered: the worshippers numbered now are the sheep brought home into the greater house, the restoration of all Yashar''el (Israel).'),
  -- thread: revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4
  ('canon', 'revelation', 11, 4, 'canon', 'zechariah', 4, 3, 'free', E'*And two olive trees by it, one upon the right side of the bowl, and the other upon the left side thereof.* (Zechariah 4:3). The two witnesses are named straight out of Zechariah''s lampstand vision: *These are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4). The two olive trees beside the golden candlestick, feeding it oil, are the figure the seer takes up whole — the witnesses are the olive trees that supply the light, standing before the Elohim (God) of all the earth.'),
  ('canon', 'revelation', 11, 4, 'canon', 'zechariah', 4, 11, 'free', E'*Then answered I, and said unto him, What are these two olive trees upon the right side of the candlestick and upon the left side thereof?* (Zechariah 4:11). The prophet''s own question — *What are these two olive trees?* — is answered in the seer''s declaration: *These are the two olive trees, and the two candlesticks* (Revelation 11:4). Zechariah asked and Revelation tells: the two olive trees are the two witnesses, the anointed who stand before Yahuah (LORD) and carry his light into the dark season of the treading-down.'),
  ('canon', 'revelation', 11, 4, 'canon', 'zechariah', 4, 14, 'free', E'*Then said he, These are the two anointed ones, that stand by Yahuah (Lord) of the whole earth.* (Zechariah 4:14). Here is the heart of it: the two olive trees are *the two anointed ones, that stand by Yahuah (Lord) of the whole earth.* So the two witnesses *are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4). The witnesses stand where Zechariah''s anointed stand — before the Lord of the whole earth — bearing his word *Not by might, nor by power, but by my spirit* (Zechariah 4:6) through the days of their prophecy.'),
  -- thread: revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17
  ('canon', 'revelation', 11, 5, 'canon', 'jeremiah', 5, 14, 'free', E'*Wherefore thus saith Yahuah Elohim (the LORD God) of hosts, Because ye speak this word, behold, I will make my words in thy mouth fire, and this people wood, and it shall devour them.* (Jeremiah 5:14). Yahuah (LORD) put fire in the prophet''s mouth to devour: *I will make my words in thy mouth fire, and this people wood.* So of the witnesses: *if any man will hurt them, fire proceedeth out of their mouth, and devoureth their enemies* (Revelation 11:5). The fire is the prophetic word itself, the word of Yahuah (LORD) that consumes those who would silence his messengers — the same fire Jeremiah carried.'),
  ('canon', 'revelation', 11, 6, 'canon', '1-kings', 17, 1, 'free', E'*And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* (1 Kings 17:1). Elijah shut up the heaven by his word — *there shall not be dew nor rain these years, but according to my word.* So the witnesses *have power to shut heaven, that it rain not in the days of their prophecy* (Revelation 11:6). The witnesses carry Elijah''s very gift; one of the two prophets wears the mantle of the Tishbite who stood before Yahuah (LORD) and held back the rain.'),
  ('canon', 'revelation', 11, 5, 'canon', '2-kings', 1, 10, 'free', E'*And Elijah answered and said to the captain of fifty, If I be a man of Elohim (God), then let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven, and consumed him and his fifty.* (2 Kings 1:10). Elijah called fire from heaven on those sent to seize him — *let fire come down from heaven, and consume thee and thy fifty.* So of the two witnesses: *if any man will hurt them, fire proceedeth out of their mouth, and devoureth their enemies* (Revelation 11:5). The fire that guarded Elijah from the king''s captains guards the witnesses; none can lay hold on them before their testimony is finished.'),
  ('canon', 'revelation', 11, 6, 'canon', 'exodus', 7, 17, 'free', E'*Thus saith Yahuah (LORD), In this thou shalt know that I am Yahuah (LORD): behold, I will smite with the rod that is in mine hand upon the waters which are in the river, and they shall be turned to blood.* (Exodus 7:17). Moses turned the river to blood — *I will smite with the rod... and they shall be turned to blood.* So the witnesses *have power over waters to turn them to blood, and to smite the earth with all plagues, as often as they will* (Revelation 11:6). The second witness wears the mantle of Moses, who smote Egypt with plagues; together the two prophets carry the gifts of Moses and Elijah, the law and the prophets standing as the two witnesses of Yahuah (LORD).'),
  ('canon', 'revelation', 11, 5, 'apocrypha', 'ecclesiasticus', 48, 1, 'extras', E'*Then stood up Elias the prophet as fire, and his word burned like a lamp.* (Sirach 48:1). The Hebrew library remembered Elijah as fire itself — *Elias the prophet as fire, and his word burned like a lamp.* So of the witnesses: *fire proceedeth out of their mouth, and devoureth their enemies* (Revelation 11:5). The witness whose mouth burns is cast in the mould of the prophet whose very word *burned like a lamp* — and the two candlesticks of verse 4 are these burning lamps, the prophetic word of Yahuah (LORD) made fire.'),
  ('canon', 'revelation', 11, 6, 'apocrypha', 'ecclesiasticus', 48, 3, 'extras', E'*By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire.* (Sirach 48:3). The library names both gifts the witnesses carry, and joins them in Elijah: *By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire.* So the witnesses *have power to shut heaven, that it rain not* (Revelation 11:6) and *fire proceedeth out of their mouth* (Revelation 11:5). The shut heaven and the called-down fire are Elijah''s twin signs, and the two prophets of the chapter walk in the power of Elijah and of Moses both.'),
  -- thread: revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7
  ('canon', 'revelation', 11, 7, 'canon', 'daniel', 7, 21, 'free', E'*I beheld, and the same horn made war with the saints, and prevailed against them* (Daniel 7:21). Daniel saw the beast-horn make war on the holy ones and overcome them for a season — *the same horn made war with the saints, and prevailed against them.* So the beast and the witnesses: *the beast that ascendeth out of the bottomless pit shall make war against them, and shall overcome them, and kill them* (Revelation 11:7). It is the same war Daniel saw, the same brief prevailing of the beast — *until the Ancient of days came, and judgment was given to the saints* (Daniel 7:22); the killing is not the end of the story.'),
  ('canon', 'revelation', 11, 8, 'canon', 'isaiah', 1, 9, 'free', E'*Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom, and we should have been like unto Gomorrah.* (Isaiah 1:9). Isaiah named the faithless city Sodom — *we should have been as Sodom.* So the bodies of the witnesses lie *in the street of the great city, which spiritually is called Sodom and Egypt, where also our Lord was crucified* (Revelation 11:8). The great city earns the name not by its location but by its deeds: the prophets'' own word made Jerusalem-in-her-rebellion a Sodom, and the seer takes up that very charge.'),
  ('canon', 'revelation', 11, 8, 'canon', 'isaiah', 1, 10, 'free', E'*Hear the word of Yahuah (LORD), ye rulers of Sodom; give ear unto the law of our Elohim (God), ye people of Gomorrah.* (Isaiah 1:10). Isaiah called the rulers of the holy city *rulers of Sodom* and her people *people of Gomorrah* — the prophetic name for the covenant city turned harlot. So the city where the witnesses fall is *spiritually... called Sodom and Egypt, where also our Lord was crucified* (Revelation 11:8). Sodom for her wickedness, Egypt for her bondage; the same city that slew the prophets and crucified the Lord is named by the prophets'' own measure.'),
  -- thread: revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37
  ('canon', 'revelation', 11, 11, 'canon', 'ezekiel', 37, 5, 'free', E'*Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5). Ezekiel''s valley of dry bones is the figure of the raised witnesses: *I will cause breath to enter into you, and ye shall live.* So *after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). The same breath that filled the slain in the valley fills the dead witnesses — the resurrection-power of Yahuah (LORD) that raises the whole house of Yashar''el (Israel) from their graves.'),
  ('canon', 'revelation', 11, 11, 'canon', 'ezekiel', 37, 10, 'free', E'*So I prophesied as he commanded me, and the breath came into them, and they lived, and stood up upon their feet, an exceeding great army.* (Ezekiel 37:10). The words are nearly the same: *the breath came into them, and they lived, and stood up upon their feet.* So of the witnesses: *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). And Ezekiel told what the raising meant — *these bones are the whole house of Yashar''el (Israel)* (Ezekiel 37:11), the graves opened and the people brought home; the standing witnesses are a sign of that great regathering resurrection.'),
  ('canon', 'revelation', 11, 12, 'canon', '2-kings', 2, 11, 'free', E'*And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* (2 Kings 2:11). Elijah was taken up alive — *Elijah went up by a whirlwind into heaven.* So the witnesses: *they heard a great voice from heaven saying unto them, Come up hither. And they ascended up to heaven in a cloud* (Revelation 11:12). The witness who shut the heaven like Elijah ascends as Elijah ascended; the prophet who *was taken up* and was looked for to return (the Elijah of Malachi 4:5, *I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)*) is seen again in the two witnesses caught up.'),
  ('canon', 'revelation', 11, 12, 'apocrypha', 'ecclesiasticus', 48, 9, 'extras', E'*Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* (Sirach 48:9). The library kept the memory of Elijah''s ascent — *taken up in a whirlwind of fire, and in a chariot of fiery horses.* So the witnesses *ascended up to heaven in a cloud; and their enemies beheld them* (Revelation 11:12). The prophet caught up to heaven is the pattern of the witnesses caught up; and the same passage names why he was kept — *ordained for reproofs in their times... and to restore the tribes of Jacob* (Sirach 48:10), the very restoration the witnesses serve.'),
  ('canon', 'revelation', 11, 11, 'apocrypha', 'ecclesiasticus', 48, 10, 'extras', E'*Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God), before it brake forth into fury, and to turn the heart of the father to the son, and to restore the tribes of Jacob.* (Sirach 48:10). The library names the office of the returning Elijah: *ordained for reproofs in their times... to restore the tribes of Jacob.* So the witnesses prophesy and are raised — *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). Their testimony, like Elijah''s, is for the reproof and the regathering — the turning of hearts and the restoration of the scattered tribes that the whole vision moves toward.'),
  -- thread: revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7
  ('canon', 'revelation', 11, 15, 'canon', 'daniel', 2, 44, 'free', E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* (Daniel 2:44). Daniel saw the stone that shatters the image and fills the earth — *a kingdom, which shall never be destroyed... it shall stand for ever.* So at the seventh trumpet: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The everlasting kingdom Daniel foresaw breaking all the kingdoms of men is the kingdom now declared come — *he shall reign for ever and ever.*'),
  ('canon', 'revelation', 11, 15, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). To the one *like the Son of Adam* who came with the clouds was given *an everlasting dominion, which shall not pass away.* So the seventh trumpet sounds the same: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The kingdom *of his Messiah (Christ)* is the dominion given to the Son of Adam in Daniel — the Formed Son receiving from the Father the everlasting reign over all peoples.'),
  ('canon', 'revelation', 11, 18, 'canon', 'daniel', 7, 27, 'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). Daniel saw the kingdom given *to the people of the saints of the El Elyon (most High)* — and reward for the saints. So at the trumpet the time comes *that thou shouldest give reward unto thy servants the prophets, and to the saints, and them that fear thy name, small and great* (Revelation 11:18). The everlasting kingdom is the saints'' inheritance; the trumpet that crowns the Messiah crowns his people with him.'),
  ('canon', 'revelation', 11, 15, 'canon', 'psalms', 2, 8, 'free', E'*Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession.* (Psalm 2:8). The Father said to his anointed, *Ask of me, and I shall give thee the heathen for thine inheritance.* So *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ)* (Revelation 11:15). The nations that raged against Yahuah (LORD) and against his anointed are given over to the Messiah as his inheritance — the kingdoms of the world handed to the Son the Psalm sang.'),
  ('canon', 'revelation', 11, 18, 'canon', 'psalms', 2, 9, 'free', E'*Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* (Psalm 2:9). The anointed breaks the raging nations *with a rod of iron.* So when the trumpet sounds, *the nations were angry, and thy wrath is come... and shouldest destroy them which destroy the earth* (Revelation 11:18). The wrath of the nations meets the wrath of Yahuah (LORD); the Messiah who is given the heathen for his inheritance breaks those who destroy the earth, as the Psalm foretold.'),
  ('canon', 'revelation', 11, 15, 'canon', 'zechariah', 14, 9, 'free', E'*And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one.* (Zechariah 14:9). Zechariah''s day of Yahuah (LORD) ends in his universal reign — *Yahuah (LORD) shall be king over all the earth.* So the seventh trumpet: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The one kingship of Yahuah (LORD) over all the earth is the kingdom now come — *he shall reign for ever and ever* — the whole earth gathered under the one name.'),
  ('canon', 'revelation', 11, 17, 'canon', 'exodus', 15, 18, 'free', E'*Yahuah (LORD) shall reign for ever and ever.* (Exodus 15:18). The song of the sea ended in the cry the trumpet takes up: *Yahuah (LORD) shall reign for ever and ever.* So the elders give thanks: *We give thee thanks, O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to come; because thou hast taken to thee thy great power, and hast reigned* (Revelation 11:17), and *he shall reign for ever and ever* (Revelation 11:15). The reign sung at the Red Sea when Yahuah (LORD) delivered his people is the reign declared at the trumpet — the same everlasting kingship, from the exodus to the consummation.'),
  -- thread: revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25
  ('canon', 'revelation', 11, 19, 'canon', 'exodus', 25, 21, 'free', E'*And thou shalt put the mercy seat above upon the ark; and in the ark thou shalt put the testimony that I shall give thee.* (Exodus 25:21). The ark held *the testimony* — the tables of the covenant. So when *the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament* (Revelation 11:19), it is this ark, the chest of the covenant of Sinai. The opened temple reveals not a covenant abolished but the ark of the testimony kept in heaven — the Torah at the heart of the restoration, the covenant still standing.'),
  ('canon', 'revelation', 11, 19, 'canon', 'exodus', 25, 22, 'free', E'*And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony, of all things which I will give thee in commandment unto the children of Yashar''el (Israel).* (Exodus 25:22). From above the ark Yahuah (LORD) met and communed with his people — *from between the two cherubims which are upon the ark of the testimony.* So the heavenly *ark of his testament* is seen (Revelation 11:19): the very place of meeting between Yahuah (LORD) and the children of Yashar''el (Israel), the mercy seat opened to view — the covenant fellowship restored, Yahuah (LORD) communing again with his gathered people.'),
  ('canon', 'revelation', 11, 19, 'canon', '1-kings', 8, 6, 'free', E'*And the priests brought in the ark of the covenant of Yahuah (LORD) unto his place, into the oracle of the house, to the most holy place, even under the wings of the cherubims.* (1 Kings 8:6). When Solomon''s temple was filled, the ark was set in the most holy place and the cloud of glory filled the house. So the heavenly answer: *the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament* (Revelation 11:19). The ark hidden in the inmost shrine of the earthly house is now seen openly in the heavenly temple — the covenant of Yahuah (LORD) brought into full view at the trumpet of his reign.'),
  ('canon', 'revelation', 11, 19, 'canon', 'exodus', 19, 16, 'free', E'*And it came to pass on the third day in the morning, that there were thunders and lightnings, and a thick cloud upon the mount, and the voice of the trumpet exceeding loud; so that all the people that was in the camp trembled.* (Exodus 19:16). When Yahuah (LORD) came down on Sinai to give the covenant, there were *thunders and lightnings, and a thick cloud... and the voice of the trumpet.* So when the heavenly temple is opened, *there were lightnings, and voices, and thunderings, and an earthquake, and great hail* (Revelation 11:19). The signs that attended the giving of the testimony at Sinai attend the showing of the ark of the testimony in heaven — the same covenant-Elohim (God), the same thunders, from the mountain to the consummation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40',
       E'The reed to measure the temple of Elohim (God), and the altar, and them that worship therein (Ezekiel 40)',
       E'The chapter opens with a measuring: *And there was given me a reed like unto a rod: and the angel stood, saying, Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein* (Revelation 11:1). This is Ezekiel''s reed — *behold, there was a man, whose appearance was like the appearance of brass, with a line of flax in his hand, and a measuring reed* (Ezekiel 40:3), who charged the prophet to *behold with thine eyes... and declare all that thou seest to the house of Yashar''el (Israel)* (Ezekiel 40:4). It is Zechariah''s line too — *behold a man with a measuring line in his hand... To measure Jerusalem* (Zechariah 2:1) — and that measuring ended in restoration, Yahuah (LORD) himself a wall of fire and the glory in her midst. The measuring is no demolition; it is a marking-off of what belongs to Yahuah (LORD), a *separation between the sanctuary and the profane place* (Ezekiel 42:20). For the outer court is left out: *But the court which is without the temple leave out, and measure it not; for it is given unto the Gentiles: and the holy city shall they tread under foot forty and two months* (Revelation 11:2). Daniel heard the same treading and the same cry — *to give both the sanctuary and the host to be trodden under foot* (Daniel 8:13) — and Isaiah grieved it: *our adversaries have trodden down thy sanctuary* (Isaiah 63:18). But the trampling is measured and brief, *forty and two months*, *a little while*; the temple and the worshippers are kept. And the restored library saw where the measuring leads — *a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house* (1 Enoch 90:17). The worshippers numbered now are the sheep being gathered into the greater house: the measuring of the temple is the marking-off of the regathered Yashar''el (Israel) for the restoration.',
       sv.verse_id, ev.verse_id, 'extras', 9250
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4',
       E'The two witnesses, the two olive trees and the two candlesticks standing before the Elohim (God) of the earth (Zechariah 4)',
       E'The two witnesses are named straight out of Zechariah''s lampstand vision: *And I will give power unto my two witnesses, and they shall prophesy a thousand two hundred and threescore days, clothed in sackcloth. These are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:3-4). Zechariah saw the golden candlestick with its seven lamps, and *two olive trees by it, one upon the right side of the bowl, and the other upon the left side thereof* (Zechariah 4:3), feeding it oil. He asked, *What are these two olive trees upon the right side of the candlestick and upon the left side thereof?* (Zechariah 4:11), and the answer is the seer''s own: *These are the two anointed ones, that stand by Yahuah (Lord) of the whole earth* (Zechariah 4:14). The witnesses stand where the anointed stand — before the Lord of the whole earth — and bear his light through the dark season of the treading-down, carrying the word Zechariah heard: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). Two witnesses, for by two the testimony is established; the lamps of Yahuah (LORD) burning in the night, supplied by the oil of his Spirit, prophesying the whole appointed time.',
       sv.verse_id, ev.verse_id, 'free', 9253
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17',
       E'Fire out of their mouth, power to shut heaven and to turn the waters to blood — the gifts of Moses and Elijah (1 Kings 17, Exodus 7)',
       E'The two witnesses carry the gifts of the two greatest prophets — Moses and Elijah, the law and the prophets. *And if any man will hurt them, fire proceedeth out of their mouth, and devoureth their enemies* (Revelation 11:5): this is the word Yahuah (LORD) put in Jeremiah''s mouth — *behold, I will make my words in thy mouth fire, and this people wood, and it shall devour them* (Jeremiah 5:14) — the prophetic word itself made fire. It is Elijah''s fire too, who said to the captains sent to seize him, *let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven, and consumed him and his fifty* (2 Kings 1:10). *These have power to shut heaven, that it rain not in the days of their prophecy* (Revelation 11:6) — the very word of the Tishbite: *there shall not be dew nor rain these years, but according to my word* (1 Kings 17:1). *And have power over waters to turn them to blood, and to smite the earth with all plagues, as often as they will* (Revelation 11:6) — the sign of Moses: *I will smite with the rod that is in mine hand upon the waters which are in the river, and they shall be turned to blood* (Exodus 7:17). The Hebrew library kept the memory of Elijah as fire himself — *Then stood up Elias the prophet as fire, and his word burned like a lamp* (Sirach 48:1), who *by the word of Yahuah (God)... shut up the heaven, and also three times brought down fire* (Sirach 48:3). So the two candlesticks burn: the witness whose mouth is fire wears the mantle of Elijah, the witness who smites the waters wears the mantle of Moses, and together they testify in the power of the law and the prophets through the appointed days.',
       sv.verse_id, ev.verse_id, 'extras', 9256
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7',
       E'The beast from the pit makes war and slays them; their bodies in the great city spiritually called Sodom (Daniel 7, Isaiah 1)',
       E'When the testimony is finished, the beast prevails for a season: *And when they shall have finished their testimony, the beast that ascendeth out of the bottomless pit shall make war against them, and shall overcome them, and kill them* (Revelation 11:7). This is the war Daniel saw the beast-horn wage: *the same horn made war with the saints, and prevailed against them* (Daniel 7:21) — but only *until the Ancient of days came, and judgment was given to the saints* (Daniel 7:22); the prevailing is brief and the verdict is sure. The bodies of the witnesses lie unburied *in the street of the great city, which spiritually is called Sodom and Egypt, where also our Lord was crucified* (Revelation 11:8), while the peoples gaze and the earth-dwellers make merry over them. The name *Sodom* is the prophets'' own charge against the covenant city in her rebellion: Isaiah cried, *Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom, and we should have been like unto Gomorrah* (Isaiah 1:9), and named her rulers outright — *Hear the word of Yahuah (LORD), ye rulers of Sodom; give ear unto the law of our Elohim (God), ye people of Gomorrah* (Isaiah 1:10). Sodom for her wickedness, Egypt for her bondage — the city that slew the prophets and crucified the Lord earns the name not by her place but by her deeds. The witnesses fall where the Master fell; but as with him, the killing is not the end.',
       sv.verse_id, ev.verse_id, 'free', 9259
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37',
       E'The Spirit of life entered them and they stood upon their feet, and ascended in a cloud (Ezekiel 37, 2 Kings 2)',
       E'The slain witnesses are raised, and the raising is Ezekiel''s valley of dry bones: *And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet; and great fear fell upon them which saw them* (Revelation 11:11). Yahuah (LORD) said over the bones, *Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5), and *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* (Ezekiel 37:10) — the very words, *stood up upon their feet.* And Ezekiel told what the raising meant: *these bones are the whole house of Yashar''el (Israel)* (Ezekiel 37:11), the graves opened and the people brought home — so the standing witnesses are a sign of that great regathering resurrection. Then the ascent: *And they heard a great voice from heaven saying unto them, Come up hither. And they ascended up to heaven in a cloud; and their enemies beheld them* (Revelation 11:12). This is Elijah''s going-up — *Elijah went up by a whirlwind into heaven* (2 Kings 2:11) — and the library kept the memory: *Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* (Sirach 48:9). The same passage names why the prophet was kept: he was *ordained for reproofs in their times... and to restore the tribes of Jacob* (Sirach 48:10) — the Elijah whom Malachi promised would come *before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). The witnesses raised and caught up serve that office: the reproof of the rebellious city and the restoration of the scattered tribes, the resurrection-power of Yahuah (LORD) shown in figure before it is shown over all his people.',
       sv.verse_id, ev.verse_id, 'extras', 9262
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7',
       E'The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ) (Daniel 2 and 7, Psalm 2)',
       E'The seventh trumpet sounds the heart of the whole vision: *And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). This is the stone Daniel saw shatter the image of the kingdoms: *in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44). It is the dominion given to the one *like the Son of Adam*: *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14) — the kingdom *of his Messiah (Christ)*, the Formed Son receiving from the Father the everlasting reign. It is Zechariah''s day — *Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9) — and the song of the sea come round at last — *Yahuah (LORD) shall reign for ever and ever* (Exodus 15:18). So the elders fall and give thanks: *We give thee thanks, O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to come; because thou hast taken to thee thy great power, and hast reigned* (Revelation 11:17). The Father gave his anointed *the heathen for thine inheritance* (Psalm 2:8) and the rod to *dash them in pieces* (Psalm 2:9); so *the nations were angry, and thy wrath is come... and shouldest destroy them which destroy the earth* (Revelation 11:18), and the reward is given to the saints — for the kingdom *shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* (Daniel 7:27). The trumpet that crowns the Messiah crowns his people with him, and the everlasting reign foretold from the exodus to Daniel is declared come.',
       sv.verse_id, ev.verse_id, 'free', 9265
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25',
       E'The temple of Elohim (God) opened in heaven, and the ark of his testament seen (Exodus 25, 1 Kings 8)',
       E'The chapter closes where the seventh trumpet leads — the covenant brought into full view: *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament: and there were lightnings, and voices, and thunderings, and an earthquake, and great hail* (Revelation 11:19). The *ark of his testament* is the ark of Sinai, which held *the testimony* — the tables of the covenant: *thou shalt put the mercy seat above upon the ark; and in the ark thou shalt put the testimony that I shall give thee* (Exodus 25:21). It is the place of meeting, where Yahuah (LORD) communed with his people — *there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony... unto the children of Yashar''el (Israel)* (Exodus 25:22). In Solomon''s house the priests *brought in the ark of the covenant of Yahuah (LORD) unto his place, into the oracle of the house, to the most holy place* (1 Kings 8:6), and the glory-cloud filled it. Now the ark hidden in the inmost shrine is seen openly in heaven — the covenant of Yahuah (LORD) not abolished but enthroned, the Torah at the heart of the restoration. And the signs that attended its giving attend its showing: at Sinai there were *thunders and lightnings, and a thick cloud upon the mount, and the voice of the trumpet* (Exodus 19:16), and so in heaven *there were lightnings, and voices, and thunderings, and an earthquake, and great hail* (Revelation 11:19). The same covenant-Elohim (God), the same thunders, from the mountain to the consummation — the ark of the testimony seen, and the covenant kept.',
       sv.verse_id, ev.verse_id, 'free', 9268
  FROM _s224_rv11_lookup sv, _s224_rv11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=11 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 40:3 — *a man, whose appearance was like the appearance of brass, with a line of flax in his hand, and a measuring reed* the measurer of the restored temple, the same figure handing John the reed (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=40 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 40:4 — *declare all that thou seest to the house of Yashar''el (Israel)* the measured house is for the restoration of the whole house, the worshippers numbered and kept (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=40 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 2:1 — *a man with a measuring line in his hand* the measurer of Jerusalem, whose measuring ended in restoration and the glory in her midst (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 42:20 — *a wall round about... to make a separation between the sanctuary and the profane place* the reed divides holy from profane; the outer court left to the nations (Revelation 11:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=42 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 8:13 — *the sanctuary and the host to be trodden under foot* the same treading and the same *How long?*; the holy city trodden a measured time (Revelation 11:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 63:18 — *our adversaries have trodden down thy sanctuary* the prophet''s grief over the trampled holy place, the treading that lasts but a little while (Revelation 11:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Enoch 90:17 — *a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house* the measured worshippers are the regathered sheep, the restoration of all Yashar''el (Israel) (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=90 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 4:3 — *two olive trees by it, one upon the right side of the bowl, and the other upon the left* the olive trees beside the candlestick that feed it oil, named as the two witnesses (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 4:11 — *What are these two olive trees upon the right side of the candlestick and upon the left side thereof?* the prophet''s own question that Revelation answers (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 4:14 — *These are the two anointed ones, that stand by Yahuah (Lord) of the whole earth* the heart of it: the witnesses stand where Zechariah''s anointed stand, before the Lord of all the earth (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 5:14 — *I will make my words in thy mouth fire, and this people wood, and it shall devour them* the prophetic word made fire, the fire that proceeds from the witnesses'' mouth (Revelation 11:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 1:10 — *let fire come down from heaven, and consume thee and thy fifty* Elijah''s fire on those sent to seize him, guarding the witnesses till their testimony is done (Revelation 11:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 17:1 — *there shall not be dew nor rain these years, but according to my word* Elijah shutting the heaven, the witnesses'' power to shut heaven that it rain not (Revelation 11:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 7:17 — *I will smite with the rod that is in mine hand upon the waters which are in the river, and they shall be turned to blood* the sign of Moses, the witnesses'' power over waters to turn them to blood (Revelation 11:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 48:1 — *Then stood up Elias the prophet as fire, and his word burned like a lamp* the library remembered Elijah as fire himself; the two candlesticks are these burning lamps (Revelation 11:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 48:3 — *By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire* the library joins Elijah''s twin signs, the shut heaven and the called-down fire (Revelation 11:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:21 — *the same horn made war with the saints, and prevailed against them* the beast''s war on the witnesses, brief, until the Ancient of days gives judgment to the saints (Revelation 11:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 1:9 — *we should have been as Sodom, and we should have been like unto Gomorrah* the prophet''s name for the faithless city, the great city spiritually called Sodom (Revelation 11:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 1:10 — *ye rulers of Sodom; give ear unto the law of our Elohim (God), ye people of Gomorrah* the city named Sodom by her deeds, that slew the prophets and crucified the Lord (Revelation 11:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:5 — *Behold, I will cause breath to enter into you, and ye shall live* the breath into the dry bones, the Spirit of life that entered the slain witnesses (Revelation 11:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:10 — *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* the same words, *stood up upon their feet*; the raising that is the whole house of Yashar''el (Israel) (Revelation 11:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 2:11 — *Elijah went up by a whirlwind into heaven* the prophet caught up alive, the pattern of the witnesses ascending in a cloud (Revelation 11:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 48:9 — *Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* the library''s memory of Elijah''s ascent, the witnesses caught up to heaven in a cloud (Revelation 11:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 48:10 — *ordained for reproofs in their times... and to restore the tribes of Jacob* the office of the returning Elijah, the reproof and regathering the witnesses serve (Revelation 11:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:44 — *the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall stand for ever* the stone that shatters the kingdoms and fills the earth, the everlasting kingdom now declared come (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion* the dominion given to the Son of Adam, the kingdom of his Messiah (Christ) (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:27 — *the kingdom... shall be given to the people of the saints of the El Elyon (most High)* the everlasting kingdom is the saints'' inheritance; the trumpet rewards the servants and saints (Revelation 11:18).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 2:8 — *Ask of me, and I shall give thee the heathen for thine inheritance* the nations given to the anointed, the kingdoms become his (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 2:9 — *Thou shalt break them with a rod of iron* the anointed breaks the raging nations; the wrath come on them that destroy the earth (Revelation 11:18).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Zechariah 14:9 — *Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* the universal reign of Yahuah (LORD), the kingdom now come (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Exodus 15:18 — *Yahuah (LORD) shall reign for ever and ever* the song of the sea, the reign declared at the trumpet, *he shall reign for ever and ever* (Revelation 11:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 25:21 — *in the ark thou shalt put the testimony that I shall give thee* the ark held the tables of the covenant; the heavenly ark of his testament is the ark of Sinai (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 25:22 — *there I will meet with thee, and I will commune with thee from above the mercy seat* the ark the place of meeting between Yahuah (LORD) and his people, the covenant fellowship restored (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 8:6 — *the priests brought in the ark of the covenant of Yahuah (LORD)... to the most holy place* the ark hidden in the inmost shrine, now seen openly in the heavenly temple (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 19:16 — *there were thunders and lightnings, and a thick cloud upon the mount, and the voice of the trumpet* the signs of Sinai attend the showing of the ark of the testimony in heaven (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv11_lookup sv, _s224_rv11_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
