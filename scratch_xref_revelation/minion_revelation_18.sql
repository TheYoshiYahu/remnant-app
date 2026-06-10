-- ----- fragment: minion_revelation_18.sql (S224 Revelation 18) -----
-- =====================================================================
-- S224 minion — REVELATION 18 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 18 (24 verses) — the fall of Babylon the great, the lament of the kings
-- and the merchants and the shipmasters, the call to come out of her, the millstone cast into
-- the sea, the blood of prophets and saints found in her.
-- Tag: rv18 (temp view _s224_rv18_lookup).
-- Sort band: floor 9425, step 3 (9425, 9428, 9431, 9434, 9437, 9440, 9443 used; under 9450).
-- Source is ALWAYS the canon Revelation 18 verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation 18 is woven entirely out of the prophets' Babylon-dirges — Isaiah
-- 13/21/47, Jeremiah 50-51, the Tyre-lament of Ezekiel 26-27. The seer re-speaks them on the
-- doomed world-system. The voice note: *Come out of her, my people* (18:4) is the prophets' own
-- summons (Jeremiah 51:6,45; Isaiah 48:20, 52:11; Numbers 16:26) to the GATHERED — the covenant
-- people, the lost sheep among the nations — to separate from the system before its plagues fall.
-- It is the regathering theme: the same call by which Yahuah (LORD) brought the seed out of the
-- literal Babylon, now spoken to the scattered seed. NOT a church-vs-Israel separation. The kings
-- and merchants weeping (18:9-19) re-speak the lament over Tyre (Ezekiel 27); the millstone
-- (18:21) re-speaks Seraiah's stone cast into Euphrates (Jeremiah 51:63-64); *Elohim hath avenged
-- you* (18:20) re-speaks Jeremiah 51:48 and Deuteronomy 32:43; *the blood of prophets, and of
-- saints* (18:24) re-speaks Jeremiah 51:49 and Matthew 23:35. Christology: the One who judges her
-- is *Yahuah Elohim (the Lord God) who judgeth her* (18:8) — the Father's avenging on the system,
-- the prophets' Yahuah of recompences.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   Babylon the great is fallen, is fallen; the habitation of devils; the nations drunk
--           Tanakh: Isaiah 21:9 (Babylon is fallen, is fallen), Isaiah 13:19-21 (the desolation,
--                   the wild beasts), Jeremiah 50:39 (the dwellingplace for wild beasts), Jeremiah
--                   51:8 (Babylon suddenly fallen), Jeremiah 51:7 (the golden cup, the nations drunken)
--           Extras: none warranted (carried into the lament/millstone threads)   NT: none warranted
--   v.4-5   Come out of her, my people; her sins reached unto heaven
--           Tanakh: Jeremiah 51:45 (My people, go ye out of the midst of her), Jeremiah 51:6 (Flee
--                   out of the midst of Babylon), Isaiah 48:20 (Go ye forth of Babylon), Isaiah
--                   52:11 (Depart, go ye out, touch no unclean thing), Numbers 16:26 (Depart from
--                   the tents of these wicked men), Jeremiah 51:9 (her judgment reacheth unto heaven)
--           Extras: none warranted   NT: none warranted
--   v.6-8   Reward her double; the cup she filled; I sit a queen and am no widow
--           Tanakh: Jeremiah 50:29 (recompense her according to her work), Jeremiah 50:15 (as she
--                   hath done, do unto her), Psalm 137:8 (rewardeth thee as thou hast served us),
--                   Isaiah 47:8-9 (I shall not sit as a widow, the loss in one day), Zephaniah 2:15
--                   (the rejoicing city, I am, and there is none beside me)
--           Extras: none warranted   NT: none warranted
--   v.9-19  The kings, merchants, shipmasters weep and wail over her; the merchandise undone
--           Tanakh: Ezekiel 27:30-31 (cast dust on their heads, wail), Ezekiel 27:32 (What city is
--                   like Tyrus), Ezekiel 27:33 (thou didst enrich the kings of the earth), Isaiah
--                   47:15 (thy merchants shall wander, none shall save thee)
--           Extras: 2 Esdras 16:41-42 (he that selleth as he that fleeth, the merchant as he that
--                   has no profit — the merchandise made nothing in the day of trouble)
--           NT: none warranted
--   v.20    Rejoice over her, thou heaven; Elohim hath avenged you on her
--           Tanakh: Jeremiah 51:48 (the heaven and earth shall sing for Babylon), Deuteronomy 32:43
--                   (Rejoice, ye nations; he will avenge the blood of his servants)
--           Extras: none warranted   NT: none warranted
--   v.21-23 The millstone cast into the sea; thrown down, found no more
--           Tanakh: Jeremiah 51:63-64 (bind a stone to it, cast it into Euphrates, Thus shall
--                   Babylon sink), Jeremiah 51:42 (the sea is come up upon Babylon), Isaiah 47:2
--                   (Take the millstones, and grind meal)
--           Extras: Baruch 4:35 (fire shall come upon her, she shall be inhabited of devils)
--           NT: none warranted
--   v.24    In her was found the blood of prophets, and of saints
--           Tanakh: Jeremiah 51:49 (at Babylon shall fall the slain of all the earth)
--           Extras: none warranted   NT: Matthew 23:35 (upon you may come all the righteous blood
--                   shed upon the earth — the same reckoning of shed blood)
--
-- THREADS (slug -> target libraries):
--   9425 revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51              (Tanakh)
--   9428 revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51    (Tanakh)
--   9431 revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137               (Tanakh)
--   9434 revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre                  (Tanakh + Extras)
--   9437 revelation-18-rejoice-over-her-thou-heaven-elohim-hath-avenged-you-jeremiah-51         (Tanakh)
--   9440 revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51          (Tanakh + Extras)
--   9443 revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23     (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s224_rv18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51
  ('canon', 'revelation', 18, 2, 'canon', 'isaiah', 21, 9, 'free', E'*And, behold, here cometh a chariot of men, with a couple of horsemen. And he answered and said, Babylon is fallen, is fallen; and all the graven images of her gods he hath broken unto the ground.* (Isaiah 21:9). The angel''s cry is the watchman''s cry made cosmic: *Babylon the great is fallen, is fallen, and is become the habitation of devils* (Revelation 18:2). The doubled *is fallen, is fallen* comes straight from the watchtower of Isaiah, where the seer set a watchman to declare what he saw, and the word came back that the proud city and her graven gods were thrown down. The seer of the Apocalypse stands in that same watchtower and sees the doomed world-system fall.'),
  ('canon', 'revelation', 18, 2, 'canon', 'isaiah', 13, 21, 'free', E'*But wild beasts of the desert shall lie there; and their houses shall be full of doleful creatures; and owls shall dwell there, and satyrs shall dance there.* (Isaiah 13:21). When the city falls she becomes a haunt of unclean things — *the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird* (Revelation 18:2). Isaiah had already seen the glory of kingdoms become a desolate den where only wild beasts and doleful creatures dwell; the seer re-speaks that ruin, the proud city emptied of men and filled with foul spirits.'),
  ('canon', 'revelation', 18, 2, 'canon', 'jeremiah', 50, 39, 'free', E'*Therefore the wild beasts of the desert with the wild beasts of the islands shall dwell there, and the owls shall dwell therein: and it shall be no more inhabited for ever; neither shall it be dwelt in from generation to generation.* (Jeremiah 50:39). Jeremiah saw the same desolation Isaiah saw: Babylon become a dwelling for wild beasts and owls, never inhabited again. *Babylon the great is fallen, is fallen, and is become the habitation of devils* (Revelation 18:2) — the city of man''s pride handed over forever to the unclean, no longer a city but a cage.'),
  ('canon', 'revelation', 18, 2, 'canon', 'jeremiah', 51, 8, 'free', E'*Babylon is suddenly fallen and destroyed: howl for her; take balm for her pain, if so be she may be healed.* (Jeremiah 51:8). The suddenness of the fall is Jeremiah''s: Babylon *suddenly fallen and destroyed* — and the seer takes up the doubled word, *Babylon the great is fallen, is fallen* (Revelation 18:2). What the prophet spoke against the river-city by the Euphrates the Apocalypse speaks against the whole proud system she stands for: one announcement, one sudden ruin.'),
  ('canon', 'revelation', 18, 3, 'canon', 'jeremiah', 51, 7, 'free', E'*Babylon hath been a golden cup in the LORD''S hand, that made all the earth drunken: the nations have drunken of her wine; therefore the nations are mad.* (Jeremiah 51:7). The wine that maddens the nations is Jeremiah''s figure: Babylon a golden cup that made all the earth drunk. *For all nations have drunk of the wine of the wrath of her fornication* (Revelation 18:3) — the same intoxication, the kings of the earth committing fornication with her and the merchants waxing rich on her delicacies, the whole world drunk on the cup she pours.'),
  -- thread: revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51
  ('canon', 'revelation', 18, 4, 'canon', 'jeremiah', 51, 45, 'free', E'*My people, go ye out of the midst of her, and deliver ye every man his soul from the fierce anger of Yahuah (LORD).* (Jeremiah 51:45). This is the very word the voice from heaven re-speaks: *Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues* (Revelation 18:4). It is the prophet''s summons to the covenant people — *my people* — to come out of the doomed city and deliver their souls before the fierce anger falls. The gathered seed, scattered among the nations, are called to separate from the system before its judgment.'),
  ('canon', 'revelation', 18, 4, 'canon', 'jeremiah', 51, 6, 'free', E'*Flee out of the midst of Babylon, and deliver every man his soul: be not cut off in her iniquity; for this is the time of the LORD''S vengeance; he will render unto her a recompence.* (Jeremiah 51:6). Jeremiah twice cries the same summons — flee, deliver every man his soul, be not cut off in her iniquity. *Come out of her, my people, that ye be not partakers of her sins* (Revelation 18:4) carries both halves: come out, and so be not cut off when the recompence is rendered. To stay is to share her sins and her plagues; to come out is to be delivered.'),
  ('canon', 'revelation', 18, 4, 'canon', 'isaiah', 48, 20, 'free', E'*Go ye forth of Babylon, flee ye from the Chaldeans, with a voice of singing declare ye, tell this, utter it even to the end of the earth; say ye, Yahuah (LORD) hath redeemed his servant Jacob.* (Isaiah 48:20). The call to come out of Babylon is also a call to redemption: go forth, and declare to the end of the earth that Yahuah (LORD) hath redeemed his servant Jacob. *Come out of her, my people* (Revelation 18:4) is the same gathering word — the scattered seed brought out of the doomed city, redeemed and singing, the same summons by which Yahuah (LORD) led his people out of the literal Babylon.'),
  ('canon', 'revelation', 18, 4, 'canon', 'isaiah', 52, 11, 'free', E'*Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD).* (Isaiah 52:11). The doubled *depart ye, depart ye* and the charge *touch no unclean thing* stand behind the heavenly voice: *Come out of her, my people, that ye be not partakers of her sins* (Revelation 18:4). Those who bear the vessels of Yahuah (LORD) are to go out clean from the midst of her — not partaking of her uncleanness, separated unto holiness as they leave the doomed city behind.'),
  ('canon', 'revelation', 18, 4, 'canon', 'numbers', 16, 26, 'free', E'*And he spake unto the congregation, saying, Depart, I pray you, from the tents of these wicked men, and touch nothing of theirs, lest ye be consumed in all their sins.* (Numbers 16:26). The principle is as old as the wilderness: when judgment is about to fall on the wicked, the people are told to depart from their tents and touch nothing of theirs, lest they be consumed in their sins. *Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues* (Revelation 18:4) — the same separation, that those who are Yahuah''s (LORD''s) be not swept away with the rebels when the ground opens.'),
  ('canon', 'revelation', 18, 5, 'canon', 'jeremiah', 51, 9, 'free', E'*We would have healed Babylon, but she is not healed: forsake her, and let us go every one into his own country: for her judgment reacheth unto heaven, and is lifted up even to the skies.* (Jeremiah 51:9). The measure of her guilt is Jeremiah''s figure: her judgment reaching unto heaven, lifted up to the skies. *For her sins have reached unto heaven, and Elohim (God) hath remembered her iniquities* (Revelation 18:5) — and so the call follows to forsake her and go out, every man delivered, before the heaped-up sins bring down the heaped-up judgment.'),
  -- thread: revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137
  ('canon', 'revelation', 18, 6, 'canon', 'jeremiah', 50, 29, 'free', E'*Call together the archers against Babylon: all ye that bend the bow, camp against it round about; let none thereof escape: recompense her according to her work; according to all that she hath done, do unto her: for she hath been proud against Yahuah (LORD), against the Holy One of Yashar''el (Israel).* (Jeremiah 50:29). The law of recompense is Jeremiah''s: do unto her according to all she hath done, for her pride against the Holy One. *Reward her even as she rewarded you, and double unto her double according to her works* (Revelation 18:6) — the same measure-for-measure justice, her own works returned upon her head.'),
  ('canon', 'revelation', 18, 6, 'canon', 'jeremiah', 50, 15, 'free', E'*Shout against her round about: she hath given her hand: her foundations are fallen, her walls are thrown down: for it is the vengeance of Yahuah (LORD): take vengeance upon her; as she hath done, do unto her.* (Jeremiah 50:15). *As she hath done, do unto her* — the vengeance of Yahuah (LORD) rendered in her own coin. *In the cup which she hath filled fill to her double* (Revelation 18:6): the cup she poured for the nations is filled back to her, the recompense of the prophet''s word doubled upon the proud city.'),
  ('canon', 'revelation', 18, 6, 'canon', 'psalms', 137, 8, 'free', E'*O daughter of Babylon, who art to be destroyed; happy shall he be, that rewardeth thee as thou hast served us.* (Psalm 137:8). The captives by the rivers of Babylon sang of the day the daughter of Babylon would be rewarded as she had served them. *Reward her even as she rewarded you* (Revelation 18:6) — the longing of the exiles answered, the city that wasted Yahuah''s (LORD''s) people repaid in full for what she did to them.'),
  ('canon', 'revelation', 18, 7, 'canon', 'isaiah', 47, 8, 'free', E'*Therefore hear now this, thou that art given to pleasures, that dwellest carelessly, that sayest in thine heart, I am, and none else beside me; I shall not sit as a widow, neither shall I know the loss of children:* (Isaiah 47:8). The proud boast is the daughter of Babylon''s own, from Isaiah: *I shall not sit as a widow.* *For she saith in her heart, I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7) — the same self-secure pride, the city that thinks herself untouchable, certain she will never know widowhood or loss.'),
  ('canon', 'revelation', 18, 8, 'canon', 'isaiah', 47, 9, 'free', E'*But these two things shall come to thee in a moment in one day, the loss of children, and widowhood: they shall come upon thee in their perfection for the multitude of thy sorceries, and for the great abundance of thine enchantments.* (Isaiah 47:9). The boast *I shall not sit as a widow* is answered by Isaiah: the loss of children and widowhood come *in one day.* *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire* (Revelation 18:8) — the very suddenness Isaiah named, the proud security undone in a single day for the multitude of her sorceries.'),
  ('canon', 'revelation', 18, 7, 'canon', 'zephaniah', 2, 15, 'free', E'*This is the rejoicing city that dwelt carelessly, that said in her heart, I am, and there is none beside me: how is she become a desolation, a place for beasts to lie down in! every one that passeth by her shall hiss, and wag his hand.* (Zephaniah 2:15). The careless boast *I am, and there is none beside me* is the proud city''s creed in Zephaniah too — the word that belongs to Yahuah (LORD) alone seized by the city that glorifies herself. *For she saith in her heart, I sit a queen* (Revelation 18:7); *how much she hath glorified herself, and lived deliciously, so much torment and sorrow give her* — the rejoicing city made a desolation, hissed at by all who pass.'),
  -- thread: revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre
  ('canon', 'revelation', 18, 19, 'canon', 'ezekiel', 27, 30, 'free', E'*And shall cause their voice to be heard against thee, and shall cry bitterly, and shall cast up dust upon their heads, they shall wallow themselves in the ashes:* (Ezekiel 27:30). The mariners'' mourning over the fall of the merchant-city is Ezekiel''s lament over Tyre: they cast dust on their heads and wail. *And they cast dust on their heads, and cried, weeping and wailing* (Revelation 18:19) — the shipmasters and sailors of the Apocalypse mourn exactly as the pilots of Tyre mourned, the same dust, the same bitter cry over a glory sunk in the sea.'),
  ('canon', 'revelation', 18, 18, 'canon', 'ezekiel', 27, 32, 'free', E'*And in their wailing they shall take up a lamentation for thee, and lament over thee, saying, What city is like Tyrus, like the destroyed in the midst of the sea?* (Ezekiel 27:32). The cry *What city is like Tyrus* is taken up word for word by the seer: *And cried when they saw the smoke of her burning, saying, What city is like unto this great city!* (Revelation 18:18). The lament over Tyre, the merchant of the peoples, becomes the lament over Babylon the great — the same astonished question over a city no one thought could fall.'),
  ('canon', 'revelation', 18, 19, 'canon', 'ezekiel', 27, 33, 'free', E'*When thy wares went forth out of the seas, thou filledst many people; thou didst enrich the kings of the earth with the multitude of thy riches and of thy merchandise.* (Ezekiel 27:33). Tyre enriched the kings of the earth with her merchandise — and so did Babylon: *wherein were made rich all that had ships in the sea by reason of her costliness* (Revelation 18:19). The merchants who grew rich by her now stand afar off and weep, for the source of their wealth is made desolate in one hour; the trade that fattened the kings is undone.'),
  ('canon', 'revelation', 18, 15, 'canon', 'isaiah', 47, 15, 'free', E'*Thus shall they be unto thee with whom thou hast laboured, even thy merchants, from thy youth: they shall wander every one to his quarter; none shall save thee.* (Isaiah 47:15). Isaiah foretold that Babylon''s merchants, with whom she had trafficked from her youth, would scatter and none would save her. *The merchants of these things, which were made rich by her, shall stand afar off for the fear of her torment, weeping and wailing* (Revelation 18:15) — the merchants who profited by her keeping their distance in her ruin, none able to deliver her.'),
  ('canon', 'revelation', 18, 11, 'apocrypha', '2-esdras', 16, 41, 'extras', E'*He that selleth, let him be as he that fleeth away: and he that buyeth, as one that will lose:* (2 Esdras 16:41). The Hebrew library knew the day when all buying and selling is overturned, when the merchant''s trade is worth nothing in the hour of judgment. *And the merchants of the earth shall weep and mourn over her; for no man buyeth their merchandise any more* (Revelation 18:11) — the seller as one who flees, the buyer as one who will lose, the whole commerce of the doomed system rendered void when the plagues draw nigh.'),
  ('canon', 'revelation', 18, 11, 'apocrypha', '2-esdras', 16, 42, 'extras', E'*He that occupieth merchandise, as he that has no profit by it: and he that buildeth, as he that shall not dwell in it:* (2 Esdras 16:42). The merchant who handles merchandise is to count it as bringing no profit, for the day of trouble swallows all gain. *For no man buyeth their merchandise any more* (Revelation 18:11) — the very condition the seer beholds, the traders of gold and silk and souls of men weeping because their wares are made nothing, no profit left in the city that made them rich.'),
  -- thread: revelation-18-rejoice-over-her-thou-heaven-elohim-hath-avenged-you-jeremiah-51
  ('canon', 'revelation', 18, 20, 'canon', 'jeremiah', 51, 48, 'free', E'*Then the heaven and the earth, and all that is therein, shall sing for Babylon: for the spoilers shall come unto her from the north, saith Yahuah (LORD).* (Jeremiah 51:48). When Babylon falls, Jeremiah saw the heaven and the earth break into song over her. *Rejoice over her, thou heaven, and ye holy apostles and prophets; for Elohim (God) hath avenged you on her* (Revelation 18:20) — the heavens called to rejoice exactly as the prophet foretold, the fall of the oppressor turned into the praise of the delivered.'),
  ('canon', 'revelation', 18, 20, 'canon', 'deuteronomy', 32, 43, 'free', E'*Rejoice, O ye nations, with his people: for he will avenge the blood of his servants, and will render vengeance to his adversaries, and will be merciful unto his land, and to his people.* (Deuteronomy 32:43). The Song of Moses ends with the call to rejoice because Yahuah (LORD) will avenge the blood of his servants. *Rejoice over her, thou heaven... for Elohim (God) hath avenged you on her* (Revelation 18:20) — the ancient promise come to pass: the blood of the servants avenged, vengeance rendered to the adversaries, the doomed city''s fall the vindication of the long-waiting saints.'),
  -- thread: revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51
  ('canon', 'revelation', 18, 21, 'canon', 'jeremiah', 51, 63, 'free', E'*And it shall be, when thou hast made an end of reading this book, that thou shalt bind a stone to it, and cast it into the midst of Euphrates:* (Jeremiah 51:63). Jeremiah commanded Seraiah to bind a stone to the book of Babylon''s doom and cast it into the Euphrates — an enacted sign of her sinking. *And a mighty angel took up a stone like a great millstone, and cast it into the sea, saying, Thus with violence shall that great city Babylon be thrown down* (Revelation 18:21). The seer''s angel does in the great what Seraiah did at the river: the stone cast into the water, the city that will not rise again.'),
  ('canon', 'revelation', 18, 21, 'canon', 'jeremiah', 51, 64, 'free', E'*And thou shalt say, Thus shall Babylon sink, and shall not rise from the evil that I will bring upon her: and they shall be weary. Thus far are the words of Jeremiah.* (Jeremiah 51:64). The word over Seraiah''s stone is the word over the angel''s millstone: *Thus shall Babylon sink, and shall not rise.* *Thus with violence shall that great city Babylon be thrown down, and shall be found no more at all* (Revelation 18:21) — the same finality, the city sunk like a stone in the deep, never to come up again.'),
  ('canon', 'revelation', 18, 21, 'canon', 'jeremiah', 51, 42, 'free', E'*The sea is come up upon Babylon: she is covered with the multitude of the waves thereof.* (Jeremiah 51:42). Jeremiah saw the sea come up over Babylon, the proud city covered with waves. *A mighty angel took up a stone like a great millstone, and cast it into the sea... and shall be found no more at all* (Revelation 18:21) — the waters closing over her as the prophet foretold, the city swallowed in the deep and lost from sight.'),
  ('canon', 'revelation', 18, 22, 'canon', 'isaiah', 47, 2, 'free', E'*Take the millstones, and grind meal: uncover thy locks, make bare the leg, uncover the thigh, pass over the rivers.* (Isaiah 47:2). Isaiah set the daughter of Babylon to the millstones, brought down from her throne to the grinding of the captive. The seer takes the same millstone and silences it forever: *and the sound of a millstone shall be heard no more at all in thee* (Revelation 18:22). The mill that ground for the proud city falls silent; the music, the craftsman, the bridegroom''s voice, all heard no more.'),
  ('canon', 'revelation', 18, 23, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 35, 'extras', E'*For fire shall come upon her from the Everlasting, long to endure; and she shall be inhabited of devils for a great time.* (Baruch 4:35). The Hebrew library names the doom of the city that afflicted Yahuah''s (LORD''s) people: fire from the Everlasting, and her habitation given over to devils. *And the light of a candle shall shine no more at all in thee... for by thy sorceries were all nations deceived* (Revelation 18:23) — the lamp put out, the city of sorceries burned and left desolate, the haunt of foul spirits Baruch foresaw.'),
  -- thread: revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23
  ('canon', 'revelation', 18, 24, 'canon', 'jeremiah', 51, 49, 'free', E'*As Babylon hath caused the slain of Yashar''el (Israel) to fall, so at Babylon shall fall the slain of all the earth.* (Jeremiah 51:49). Jeremiah names Babylon as guilty both of the slain of Yashar''el (Israel) and of the slain of all the earth. *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24) — the same double reckoning, the system that shed the blood of Yahuah''s (LORD''s) servants and of all the earth''s slain, called to account for every life she took.'),
  ('canon', 'revelation', 18, 24, 'canon', 'matthew', 23, 35, 'free', E'*That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* (Matthew 23:35). Yahusha (Jesus) named the gathering of all righteous blood upon the system that killed the prophets. *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24) — the same reckoning, all the shed blood of the righteous found in the doomed city and avenged, from Abel onward, the long account of the prophets'' blood closed at last.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51',
       E'Babylon the great is fallen, is fallen — the habitation of devils (Isaiah 21, Jeremiah 50-51)',
       E'The chapter opens with another angel come down from heaven, the earth lightened with his glory, crying *Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird* (Revelation 18:2). Every phrase is the prophets'' own. The doubled cry is the watchman''s on the tower of Isaiah: *And he answered and said, Babylon is fallen, is fallen; and all the graven images of her gods he hath broken unto the ground* (Isaiah 21:9). The desolation — a haunt of unclean creatures — is Isaiah''s and Jeremiah''s: *But wild beasts of the desert shall lie there; and their houses shall be full of doleful creatures; and owls shall dwell there, and satyrs shall dance there* (Isaiah 13:21); *Therefore the wild beasts of the desert with the wild beasts of the islands shall dwell there, and the owls shall dwell therein: and it shall be no more inhabited for ever* (Jeremiah 50:39). The suddenness is Jeremiah''s: *Babylon is suddenly fallen and destroyed: howl for her* (Jeremiah 51:8). And the maddening cup is his too: *For all nations have drunk of the wine of the wrath of her fornication* (Revelation 18:3), echoing *Babylon hath been a golden cup in the LORD''S hand, that made all the earth drunken: the nations have drunken of her wine; therefore the nations are mad* (Jeremiah 51:7). The seer stands in the prophets'' watchtower and sees the doomed world-system fall as the river-city by the Euphrates fell — the proud glory of kingdoms emptied of men and given over to foul spirits, never to be inhabited again.',
       sv.verse_id, ev.verse_id, 'free', 9425
  FROM _s224_rv18_lookup sv, _s224_rv18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=18 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51',
       E'Come out of her, my people — the gathered seed called to separate (Jeremiah 51, Isaiah 52, Numbers 16)',
       E'*And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues* (Revelation 18:4). This is the prophets'' own summons to the covenant people — *my people* — to separate from the doomed system before the judgment falls, and it is the regathering call: the same word by which Yahuah (LORD) brought the seed out of the literal Babylon, now spoken to the scattered seed living among the nations. Jeremiah cries it twice: *Flee out of the midst of Babylon, and deliver every man his soul: be not cut off in her iniquity* (Jeremiah 51:6), and *My people, go ye out of the midst of her, and deliver ye every man his soul from the fierce anger of Yahuah (LORD)* (Jeremiah 51:45). Isaiah binds the coming-out to redemption and to cleanness: *Go ye forth of Babylon, flee ye from the Chaldeans, with a voice of singing declare ye... Yahuah (LORD) hath redeemed his servant Jacob* (Isaiah 48:20); *Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* (Isaiah 52:11). The pattern is as old as the wilderness, when judgment was about to swallow the rebels: *Depart, I pray you, from the tents of these wicked men, and touch nothing of theirs, lest ye be consumed in all their sins* (Numbers 16:26). And the reason the call is so urgent is the heaped-up guilt: *For her sins have reached unto heaven, and Elohim (God) hath remembered her iniquities* (Revelation 18:5), as Jeremiah said — *her judgment reacheth unto heaven, and is lifted up even to the skies* (Jeremiah 51:9). To stay is to share her sins and her plagues; to come out is to be delivered, redeemed, and made clean — the lost sheep brought home out of the system before its ruin.',
       sv.verse_id, ev.verse_id, 'free', 9428
  FROM _s224_rv18_lookup sv, _s224_rv18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=18 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137',
       E'Reward her double, the cup she filled — I sit a queen and am no widow (Jeremiah 50, Psalm 137, Isaiah 47)',
       E'*Reward her even as she rewarded you, and double unto her double according to her works: in the cup which she hath filled fill to her double* (Revelation 18:6). The law of recompense is the prophets'': measure for measure, her own works returned upon her head. Jeremiah twice pronounces it: *recompense her according to her work; according to all that she hath done, do unto her: for she hath been proud against Yahuah (LORD), against the Holy One of Yashar''el (Israel)* (Jeremiah 50:29), and *as she hath done, do unto her* (Jeremiah 50:15). The captives by the rivers sang for the day: *O daughter of Babylon, who art to be destroyed; happy shall he be, that rewardeth thee as thou hast served us* (Psalm 137:8). And the proud security that invites the doom is the daughter of Babylon''s own boast in Isaiah: *for she saith in her heart, I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7), echoing *thou that... sayest in thine heart, I am, and none else beside me; I shall not sit as a widow, neither shall I know the loss of children* (Isaiah 47:8) — the same word *I am, and there is none beside me* that the rejoicing city speaks in Zephaniah, *how is she become a desolation* (Zephaniah 2:15). The boast is answered in the suddenness Isaiah named: *these two things shall come to thee in a moment in one day, the loss of children, and widowhood* (Isaiah 47:9), which the seer re-speaks — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her* (Revelation 18:8). The city that thought herself untouchable is undone in a single day, repaid in full in her own cup.',
       sv.verse_id, ev.verse_id, 'free', 9431
  FROM _s224_rv18_lookup sv, _s224_rv18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=18 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre',
       E'The kings and merchants and shipmasters lament over her — the dirge over Tyre (Ezekiel 27)',
       E'The long lament of the kings, the merchants, and the shipmasters weeping over the burning city (Revelation 18:9-19) is the seer re-speaking Ezekiel''s dirge over Tyre, the merchant of the peoples. The mariners'' mourning is taken straight from the prophet: *And they cast dust on their heads, and cried, weeping and wailing* (Revelation 18:19), echoing *they shall cast up dust upon their heads, they shall wallow themselves in the ashes* (Ezekiel 27:30). The astonished cry is word for word: *And cried when they saw the smoke of her burning, saying, What city is like unto this great city!* (Revelation 18:18), from *they shall... lament over thee, saying, What city is like Tyrus, like the destroyed in the midst of the sea?* (Ezekiel 27:32). And the wealth she poured into the kings'' laps is Ezekiel''s too: *wherein were made rich all that had ships in the sea by reason of her costliness* (Revelation 18:19), from *thou didst enrich the kings of the earth with the multitude of thy riches and of thy merchandise* (Ezekiel 27:33). Isaiah had already foretold the merchants'' scattering: *thy merchants, from thy youth: they shall wander every one to his quarter; none shall save thee* (Isaiah 47:15) — and so *the merchants of these things, which were made rich by her, shall stand afar off for the fear of her torment, weeping and wailing* (Revelation 18:15). The Hebrew library knew this overturning of all commerce in the day of trouble: *He that selleth, let him be as he that fleeth away: and he that buyeth, as one that will lose* (2 Esdras 16:41); *He that occupieth merchandise, as he that has no profit by it* (2 Esdras 16:42) — the very void the seer beholds, *for no man buyeth their merchandise any more* (Revelation 18:11). The trade that fattened the kings, the gold and silk and the souls of men, is made nothing in one hour, and those who grew rich by her keep their distance and weep.',
       sv.verse_id, ev.verse_id, 'extras', 9434
  FROM _s224_rv18_lookup sv, _s224_rv18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=18 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-18-rejoice-over-her-thou-heaven-elohim-hath-avenged-you-jeremiah-51',
       E'Rejoice over her, thou heaven — Elohim (God) hath avenged you on her (Jeremiah 51, Deuteronomy 32)',
       E'Against the weeping of the kings and merchants, heaven is called to rejoice: *Rejoice over her, thou heaven, and ye holy apostles and prophets; for Elohim (God) hath avenged you on her* (Revelation 18:20). The summons is Jeremiah''s: when Babylon falls, *Then the heaven and the earth, and all that is therein, shall sing for Babylon: for the spoilers shall come unto her from the north, saith Yahuah (LORD)* (Jeremiah 51:48). And the ground of the rejoicing — the avenging of the servants'' blood — is the close of the Song of Moses: *Rejoice, O ye nations, with his people: for he will avenge the blood of his servants, and will render vengeance to his adversaries, and will be merciful unto his land, and to his people* (Deuteronomy 32:43). The fall of the oppressor is the vindication of the long-waiting saints, the apostles and prophets whose blood the system shed — the ancient promise of Moses come to pass, the heavens singing because Yahuah (LORD) has at last avenged his own.',
       sv.verse_id, ev.verse_id, 'free', 9437
  FROM _s224_rv18_lookup sv, _s224_rv18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=18 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51',
       E'The millstone cast into the sea — thus shall Babylon be thrown down (Jeremiah 51, Isaiah 47)',
       E'*And a mighty angel took up a stone like a great millstone, and cast it into the sea, saying, Thus with violence shall that great city Babylon be thrown down, and shall be found no more at all* (Revelation 18:21). The enacted sign is Jeremiah''s: he commanded Seraiah, when he came to Babylon and finished reading the book of her doom, to *bind a stone to it, and cast it into the midst of Euphrates* (Jeremiah 51:63), and to say *Thus shall Babylon sink, and shall not rise from the evil that I will bring upon her* (Jeremiah 51:64). The angel of the Apocalypse does in the great what Seraiah did at the river: the stone cast into the water, the city sunk and never to rise. Jeremiah had seen the waters close over her — *The sea is come up upon Babylon: she is covered with the multitude of the waves thereof* (Jeremiah 51:42). And the silencing of the city follows: the mill that ground for proud Babylon — to which Isaiah had brought her down, *Take the millstones, and grind meal* (Isaiah 47:2) — falls forever quiet, *and the sound of a millstone shall be heard no more at all in thee* (Revelation 18:22), the music and the craftsman and the bridegroom''s voice all heard no more, *and the light of a candle shall shine no more at all in thee... for by thy sorceries were all nations deceived* (Revelation 18:23). The Hebrew library named the same end for the city that afflicted Yahuah''s (LORD''s) people: *For fire shall come upon her from the Everlasting, long to endure; and she shall be inhabited of devils for a great time* (Baruch 4:35) — the lamp put out, the city of sorceries burned and given over to the foul spirits.',
       sv.verse_id, ev.verse_id, 'extras', 9440
  FROM _s224_rv18_lookup sv, _s224_rv18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=18 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23',
       E'In her was found the blood of prophets and of saints (Jeremiah 51, Matthew 23)',
       E'The last word over Babylon names the reason for her doom: *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24). Jeremiah had charged her with the same double guilt — the slain of the covenant people and the slain of all the earth: *As Babylon hath caused the slain of Yashar''el (Israel) to fall, so at Babylon shall fall the slain of all the earth* (Jeremiah 51:49). And Yahusha (Jesus) had named the gathering of all righteous blood upon the system that kills the prophets: *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). The doomed city is the long account of shed blood closed at last — from Abel onward, the prophets and the saints and all the slain of the earth avenged in her fall. The Babylon-system that drank the blood of Yahuah''s (LORD''s) servants is brought to reckoning, and the cry of the souls under the altar is answered.',
       sv.verse_id, ev.verse_id, 'free', 9443
  FROM _s224_rv18_lookup sv, _s224_rv18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=18 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 21:9 — *Babylon is fallen, is fallen; and all the graven images of her gods he hath broken unto the ground* the watchman''s doubled cry the angel re-speaks over the world-system (Revelation 18:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 13:21 — *wild beasts of the desert shall lie there... and owls shall dwell there, and satyrs shall dance there* the fallen city become a haunt of unclean creatures (Revelation 18:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 50:39 — *the wild beasts of the desert... shall dwell there... it shall be no more inhabited for ever* the proud city handed forever to the unclean (Revelation 18:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=50 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 51:8 — *Babylon is suddenly fallen and destroyed: howl for her* the suddenness behind the doubled *is fallen, is fallen* (Revelation 18:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 51:7 — *Babylon hath been a golden cup in the LORD''S hand, that made all the earth drunken* the maddening cup behind *all nations have drunk of the wine of the wrath of her fornication* (Revelation 18:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 51:45 — *My people, go ye out of the midst of her, and deliver ye every man his soul from the fierce anger of Yahuah (LORD)* the prophet''s summons to the covenant people the heavenly voice re-speaks (Revelation 18:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 51:6 — *Flee out of the midst of Babylon, and deliver every man his soul: be not cut off in her iniquity* come out and so be not cut off when the recompence falls (Revelation 18:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 48:20 — *Go ye forth of Babylon, flee ye from the Chaldeans... Yahuah (LORD) hath redeemed his servant Jacob* the coming-out bound to redemption, the scattered seed gathered (Revelation 18:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 52:11 — *Depart ye, depart ye, go ye out from thence, touch no unclean thing... be ye clean, that bear the vessels of Yahuah (LORD)* the coming-out unto cleanness, not partaking of her sins (Revelation 18:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Numbers 16:26 — *Depart, I pray you, from the tents of these wicked men... lest ye be consumed in all their sins* the wilderness pattern of separation before the judgment swallows the rebels (Revelation 18:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jeremiah 51:9 — *her judgment reacheth unto heaven, and is lifted up even to the skies* the heaped-up guilt behind *her sins have reached unto heaven* (Revelation 18:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-come-out-of-her-my-people-the-gathered-called-to-separate-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 50:29 — *recompense her according to her work; according to all that she hath done, do unto her: for she hath been proud against Yahuah (LORD)* the law of recompense behind *double unto her double according to her works* (Revelation 18:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=50 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 50:15 — *take vengeance upon her; as she hath done, do unto her* the cup filled back to her in her own measure (Revelation 18:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=50 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 137:8 — *O daughter of Babylon... happy shall he be, that rewardeth thee as thou hast served us* the exiles'' longing answered, the city repaid for what she did to Yahuah''s people (Revelation 18:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 47:8 — *thou that... sayest in thine heart, I am, and none else beside me; I shall not sit as a widow* the daughter of Babylon''s boast behind *I sit a queen, and am no widow* (Revelation 18:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Zephaniah 2:15 — *the rejoicing city... that said in her heart, I am, and there is none beside me: how is she become a desolation* the same proud creed, the city made a desolation (Revelation 18:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 47:9 — *these two things shall come to thee in a moment in one day, the loss of children, and widowhood* the boast answered in the suddenness behind *her plagues come in one day* (Revelation 18:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 27:30 — *shall cast up dust upon their heads, they shall wallow themselves in the ashes* the mariners'' mourning over Tyre behind *they cast dust on their heads* (Revelation 18:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=27 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 27:32 — *What city is like Tyrus, like the destroyed in the midst of the sea?* the lament-cry taken up word for word in *What city is like unto this great city!* (Revelation 18:18).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=27 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 27:33 — *thou didst enrich the kings of the earth with the multitude of thy riches and of thy merchandise* the wealth poured into the kings behind *made rich all that had ships in the sea* (Revelation 18:19).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=27 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 47:15 — *thy merchants, from thy youth: they shall wander every one to his quarter; none shall save thee* the merchants scattered, standing afar off in her ruin (Revelation 18:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 16:41 — *He that selleth, let him be as he that fleeth away: and he that buyeth, as one that will lose* the Hebrew library''s overturning of all commerce behind *no man buyeth their merchandise any more* (Revelation 18:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=16 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 16:42 — *He that occupieth merchandise, as he that has no profit by it: and he that buildeth, as he that shall not dwell in it* the merchant''s trade made nothing in the day of trouble (Revelation 18:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=16 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-18-rejoice-over-her-thou-heaven-elohim-hath-avenged-you-jeremiah-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 51:48 — *Then the heaven and the earth, and all that is therein, shall sing for Babylon* the heavens called to rejoice at her fall (Revelation 18:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-rejoice-over-her-thou-heaven-elohim-hath-avenged-you-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:43 — *Rejoice, O ye nations, with his people: for he will avenge the blood of his servants* the close of the Song of Moses, the avenging of the servants behind *Elohim hath avenged you on her* (Revelation 18:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-rejoice-over-her-thou-heaven-elohim-hath-avenged-you-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 51:63 — *thou shalt bind a stone to it, and cast it into the midst of Euphrates* Seraiah''s enacted sign behind the angel''s millstone cast into the sea (Revelation 18:21).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=63
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 51:64 — *Thus shall Babylon sink, and shall not rise from the evil that I will bring upon her* the word over Seraiah''s stone, the city sunk and never to rise (Revelation 18:21).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 51:42 — *The sea is come up upon Babylon: she is covered with the multitude of the waves thereof* the waters closing over her as the stone sinks (Revelation 18:21).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 47:2 — *Take the millstones, and grind meal* the mill to which Babylon was brought down, now silenced — *the sound of a millstone shall be heard no more at all in thee* (Revelation 18:22).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Baruch 4:35 — *For fire shall come upon her from the Everlasting... and she shall be inhabited of devils for a great time* the Hebrew library''s doom of the city behind *the light of a candle shall shine no more at all in thee* (Revelation 18:23).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 51:49 — *As Babylon hath caused the slain of Yashar''el (Israel) to fall, so at Babylon shall fall the slain of all the earth* the double guilt — the covenant people and all the earth — behind *the blood of prophets, and of saints* (Revelation 18:24).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel* the gathering of all shed blood upon the system that kills the prophets (Revelation 18:24).'
  FROM cross_reference_threads t, cross_references x, _s224_rv18_lookup sv, _s224_rv18_lookup tv
 WHERE t.slug='revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
