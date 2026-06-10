-- ----- fragment: minion_revelation_17.sql (S224 Revelation 17) -----
-- =====================================================================
-- S224 minion — REVELATION 17 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 17 (18 verses) — the great harlot on the scarlet beast, MYSTERY BABYLON.
-- Tag: rv17 (temp view _s224_rv17_lookup).
-- Sort band: floor 9400, step 3 (9400, 9403, 9406, 9409, 9412, 9415, 9418 used; under 9425).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: the great whore is read as the prophets read the unfaithful city/system — the
-- harlot-city that committed spiritual fornication and shed the blood of the faithful (Ezekiel 16/23
-- the unfaithful Yerushalayim/Samaria, Isaiah 47 the daughter of Babylon, Jeremiah 51 Babylon the
-- golden cup, Nahum 3 Nineveh the well-favoured harlot, Isaiah 23 Tyre the harlot). She is the
-- COUNTERFEIT of the faithful bride — the great city that reigns over the kings of the earth, set
-- against the new Jerusalem that comes down as a bride adorned (ch 21). No modern sectarian
-- identification is imported; the Tanakh harlot-city texts carry the reading. Christology preserved
-- exactly as the pull gives: *the Lamb shall overcome them: for he is Lord of lords, and King of
-- kings* (17:14) — Yahusha the Formed who bears the divine title Yahuah Elohaychem holds in
-- Deuteronomy 10:17 (*Lord of lords*) and Daniel 2:47 (*a Yahuah (Lord) of kings*). The title-pair
-- *Lord of lords, and King of kings* is preserved in English per the NT-Lord governing rule.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the great whore upon many waters, the kings drunk with the wine of her fornication
--           Tanakh: Jeremiah 51:7 (Babylon a golden cup making the earth drunken), Jeremiah 51:13
--                   (thou that dwellest upon many waters), Isaiah 23:17 (Tyre the harlot committing
--                   fornication with all kingdoms), Nahum 3:4 (the wellfavoured harlot that selleth nations)
--           Extras: none warranted here (carried into the Mystery-Babylon thread at v.5-6)
--           NT: none warranted (Revelation-internal echo carried at v.5 via 14:8)
--   v.3     the woman on the scarlet beast, seven heads and ten horns
--           Tanakh: Daniel 7:7 (the fourth beast with ten horns), Daniel 7:3 (four beasts from the sea)
--           Extras: none warranted   NT: none warranted
--   v.4     arrayed in purple and scarlet, a golden cup full of abominations
--           Tanakh: Jeremiah 51:7 (the golden cup), Ezekiel 28:13 (the precious stones and gold of the covering)
--           Extras: none warranted   NT: none warranted
--   v.5-6   MYSTERY BABYLON THE GREAT, the mother of harlots; drunken with the blood of the saints
--           Tanakh: Isaiah 47:5 (the lady of kingdoms, daughter of Babylon), Ezekiel 16:38 (the
--                   unfaithful city judged as women that break wedlock and shed blood)
--           Extras: 2 Esdras 15:47 (Asia made like Babylon, decked her daughters in whoredom),
--                   2 Esdras 15:53 (slaying my chosen when you were drunken)
--           NT: Revelation 14:8 (Babylon is fallen, made all nations drink the wine of her fornication),
--               Revelation 18:24 (in her was found the blood of prophets and saints)
--   v.7-11  the beast that was and is not, the seven heads and seven kings
--           Tanakh: Daniel 7:11 (the beast slain and given to the burning flame) — carried in prose
--           Extras: none warranted   NT: Revelation 13:8 (names not written in the book of life from
--                   the foundation of the world) — the book-of-life root for 17:8
--   v.12-14 the ten horns are ten kings; they make war with the Lamb, and the Lamb overcomes them
--           Tanakh: Daniel 7:24 (the ten horns are ten kings), Deuteronomy 10:17 (Yahuah is Lord of
--                   lords), Daniel 2:47 (a Yahuah of kings), Psalm 136:3 (the Lord of lords)
--           Extras: none warranted   NT: Revelation 19:16 (KING OF KINGS, AND LORD OF LORDS — the
--                   same title on the rider's vesture), 1 Timothy 6:15 (the King of kings, and Lord of lords)
--   v.15    the waters are peoples, and multitudes, and nations, and tongues
--           Tanakh: Isaiah 8:7 (the waters of the river, the king of Assyria and all his glory —
--                   nations as floodwaters), Jeremiah 47:2 (waters rise up out of the north, an overflowing flood)
--           Extras: none warranted   NT: none warranted
--   v.16-18 the ten horns hate the whore, make her desolate and burn her with fire; she is the great city
--           Tanakh: Ezekiel 16:37 (I will gather all thy lovers... against thee), Ezekiel 16:41 (they
--                   shall burn thine houses with fire), Ezekiel 23:29 (they shall deal hatefully...
--                   leave thee naked and bare), Jeremiah 50:41 (a people from the north against Babylon)
--           Extras: 2 Esdras 15:55 (the reward of your whoredom in your bosom, recompence),
--                   2 Esdras 15:61 (they shall be to you as fire and consume you)
--           NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9400 revelation-17-the-great-whore-upon-many-waters-babylon-the-golden-cup-jeremiah-51          (Tanakh)
--   9403 revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7            (Tanakh)
--   9406 revelation-17-arrayed-in-purple-and-scarlet-the-golden-cup-of-abominations-jeremiah-51-ezekiel-28  (Tanakh)
--   9409 revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16  (Tanakh + Extras + NT)
--   9412 revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2  (Tanakh + NT)
--   9415 revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47           (Tanakh)
--   9418 revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23   (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s224_rv17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-17-the-great-whore-upon-many-waters-babylon-the-golden-cup-jeremiah-51
  ('canon', 'revelation', 17, 1, 'canon', 'jeremiah', 51, 13, 'free', E'*O thou that dwellest upon many waters, abundant in treasures, thine end is come, and the measure of thy covetousness.* (Jeremiah 51:13). The seer is shown *the judgment of the great whore that sitteth upon many waters* (Revelation 17:1), and Jeremiah''s word over Babylon is in his ear: she too *dwellest upon many waters,* and to her too the verdict comes — *thine end is come.* The harlot-city of the Apocalypse is the old Babylon re-spoken; the same waters that fed her wealth and reach become the sign of the judgment that has now overtaken her.'),
  ('canon', 'revelation', 17, 2, 'canon', 'jeremiah', 51, 7, 'free', E'*Babylon hath been a golden cup in the LORD’S hand, that made all the earth drunken: the nations have drunken of her wine; therefore the nations are mad.* (Jeremiah 51:7). This is the root of the charge against the whore: *the inhabitants of the earth have been made drunk with the wine of her fornication* (Revelation 17:2). Babylon was the cup that *made all the earth drunken* until *the nations are mad;* the woman of Revelation pours the same intoxication, and *the kings of the earth have committed fornication* with her — the spiritual harlotry of a city that draws the peoples into her madness.'),
  ('canon', 'revelation', 17, 2, 'canon', 'isaiah', 23, 17, 'free', E'*And it shall come to pass after the end of seventy years, that Yahuah (LORD) will visit Tyre, and she shall turn to her hire, and shall commit fornication with all the kingdoms of the world upon the face of the earth.* (Isaiah 23:17). Tyre the merchant-city is named a harlot who *shall commit fornication with all the kingdoms of the world* — exactly the indictment laid on the woman with whom *the kings of the earth have committed fornication* (Revelation 17:2). The prophets read the trading, seducing world-city as a harlot selling herself to every kingdom; the Apocalypse gathers Tyre and Babylon into the one great whore who reigns over the kings.'),
  ('canon', 'revelation', 17, 1, 'canon', 'nahum', 3, 4, 'free', E'*Because of the multitude of the whoredoms of the wellfavoured harlot, the mistress of witchcrafts, that selleth nations through her whoredoms, and families through her witchcrafts.* (Nahum 3:4). Nineveh, like Babylon and Tyre, is read as a *wellfavoured harlot* who *selleth nations through her whoredoms* — the world-power that seduces and traffics in the peoples. The *great whore that sitteth upon many waters* (Revelation 17:1) is the same figure brought to her final judgment: the seducing city that sold the nations into her witchcrafts now stands to be judged for them.'),
  -- thread: revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7
  ('canon', 'revelation', 17, 3, 'canon', 'daniel', 7, 7, 'free', E'*After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* (Daniel 7:7). The beast the woman sits upon — *full of names of blasphemy, having seven heads and ten horns* (Revelation 17:3) — is Daniel''s fourth beast re-spoken: the dreadful devouring power that *had ten horns.* The seer has Daniel''s night-vision in his eye; the scarlet beast that carries the harlot is the same blaspheming, world-trampling kingdom Daniel saw rise.'),
  ('canon', 'revelation', 17, 3, 'canon', 'daniel', 7, 3, 'free', E'*And four great beasts came up from the sea, diverse one from another.* (Daniel 7:3). Daniel''s beasts *came up from the sea;* the beast that carries the woman *shall ascend out of the bottomless pit* (Revelation 17:8), and the waters where the whore sits are *peoples, and multitudes, and nations* (17:15) — the same churning deep out of which the beast-kingdoms rise. The woman *sit upon a scarlet coloured beast* (Revelation 17:3); the vision draws on Daniel''s sea-born beasts to show the harlot riding the brute power of the nations.'),
  -- thread: revelation-17-arrayed-in-purple-and-scarlet-the-golden-cup-of-abominations-jeremiah-51-ezekiel-28
  ('canon', 'revelation', 17, 4, 'canon', 'jeremiah', 51, 7, 'free', E'*Babylon hath been a golden cup in the LORD’S hand, that made all the earth drunken: the nations have drunken of her wine; therefore the nations are mad.* (Jeremiah 51:7). The woman is *decked with gold and precious stones and pearls, having a golden cup in her hand full of abominations and filthiness of her fornication* (Revelation 17:4). The golden cup is Babylon''s own — the very vessel of Jeremiah''s oracle, the cup that *made all the earth drunken.* What glittered as gold pours out *abominations;* the splendour of the harlot-city is the lure, and the draught within it is her fornication.'),
  ('canon', 'revelation', 17, 4, 'canon', 'ezekiel', 28, 13, 'free', E'*Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond, the beryl, the onyx, and the jasper, the sapphire, the emerald, and the carbuncle, and gold: the workmanship of thy tabrets and of thy pipes was prepared in thee in the day that thou wast created.* (Ezekiel 28:13). The prince of Tyre is clothed in *every precious stone* and *gold* — the same dazzling adornment heaped on the harlot *decked with gold and precious stones and pearls* (Revelation 17:4). Ezekiel''s figure is the proud, fallen splendour that counterfeits Eden''s glory; the woman wears that borrowed brilliance over a cup full of abominations, beauty turned to the service of fornication.'),
  -- thread: revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16
  ('canon', 'revelation', 17, 5, 'canon', 'isaiah', 47, 5, 'free', E'*Sit thou silent, and get thee into darkness, O daughter of the Chaldeans: for thou shalt no more be called, The lady of kingdoms.* (Isaiah 47:5). Upon the woman''s forehead is written *MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS AND ABOMINATIONS OF THE EARTH* (Revelation 17:5). Isaiah had already drawn her — the *daughter of the Chaldeans,* the *lady of kingdoms* who said in her heart *I am, and none else beside me* (Isaiah 47:8), now sent silent into darkness. The great city that reigns over the kings is the daughter of Babylon brought to her reckoning; her self-exalting boast is the very pride the Apocalypse names and judges.'),
  ('canon', 'revelation', 17, 6, 'canon', 'ezekiel', 16, 38, 'free', E'*And I will judge thee, as women that break wedlock and shed blood are judged; and I will give thee blood in fury and jealousy.* (Ezekiel 16:38). The seer beholds *the woman drunken with the blood of the saints, and with the blood of the martyrs of Yahusha (Jesus)* (Revelation 17:6). Ezekiel had arraigned the unfaithful city as one of *women that break wedlock and shed blood* — adultery and bloodshed together, the two crimes of the harlot-city. The whore of the Apocalypse is judged on the same double charge: she has played the harlot with the kings and she has shed the blood of the faithful, and the blood she is drunk on is the witness against her.'),
  ('canon', 'revelation', 17, 5, 'apocrypha', '2-esdras', 15, 47, 'extras', E'*Woe be to you, you wretch, because you have made thyself like to her; and have decked your daughters in whoredom, that they might please and glory in your lovers, which have always desired to commit whoredom with you.* (2 Esdras 15:47). The Hebrew library speaks the same harlot-city idiom: a people *made thyself like to her* — like Babylon — *decked your daughters in whoredom* to glory in *your lovers.* This is the *MOTHER OF HARLOTS* of Revelation 17:5, the city whose daughters and lovers are the nations she draws into her fornication. The whore on the beast is the archetype this woe already named: whoredom with the lovers, the decking that allures, the judgment that follows.'),
  ('canon', 'revelation', 17, 6, 'apocrypha', '2-esdras', 15, 53, 'extras', E'*If you had not always slain my chosen, exalting the stroke of yours hands, and saying over their dead, when you were drunken,* (2 Esdras 15:53). The judgment falls because the harlot-city *slain my chosen* and gloated *over their dead, when you were drunken* — and the seer sees the very thing: *the woman drunken with the blood of the saints, and with the blood of the martyrs of Yahusha (Jesus)* (Revelation 17:6). The drunkenness is not wine alone but blood; the slaying of the chosen and the drunken triumph over their dead is the harlot''s signature crime, and Yahuah (God) marks it for recompence.'),
  ('canon', 'revelation', 17, 5, 'canon', 'revelation', 14, 8, 'free', E'*And there followed another angel, saying, Babylon is fallen, is fallen, that great city, because she made all nations drink of the wine of the wrath of her fornication.* (Revelation 14:8). The fall announced earlier is now unveiled in full: the angel had cried *Babylon is fallen, is fallen, that great city, because she made all nations drink of the wine of her fornication,* and here the woman herself is shown — *MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS* (Revelation 17:5), *that great city, which reigneth over the kings of the earth* (17:18). The proclamation of ch 14 and the vision of ch 17 are one Babylon: the seducing city judged for the wine she made the nations drink.'),
  ('canon', 'revelation', 17, 6, 'canon', 'revelation', 18, 24, 'free', E'*And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* (Revelation 18:24). The blood the woman is drunken with in ch 17 is named again in the dirge of ch 18: *in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* The harlot *drunken with the blood of the saints, and with the blood of the martyrs of Yahusha (Jesus)* (Revelation 17:6) is the city in whose streets the blood of the faithful was found — one charge across the two chapters, the persecuting city held to account for every righteous one she slew.'),
  -- thread: revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2
  ('canon', 'revelation', 17, 12, 'canon', 'daniel', 7, 24, 'free', E'*And the ten horns out of this kingdom are ten kings that shall arise: and another shall rise after them; and he shall be diverse from the first, and he shall subdue three kings.* (Daniel 7:24). The angel interprets: *the ten horns which thou sawest are ten kings, which have received no kingdom as yet; but receive power as kings one hour with the beast* (Revelation 17:12). Daniel had already told what the ten horns are — *ten kings that shall arise* out of the fourth kingdom. The Apocalypse takes Daniel''s own interpretation as its key: the horns are kings, given a brief hour of power, who lend their strength to the beast.'),
  ('canon', 'revelation', 17, 14, 'canon', 'deuteronomy', 10, 17, 'free', E'*For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward:* (Deuteronomy 10:17). When the kings make war, *the Lamb shall overcome them: for he is Lord of lords, and King of kings* (Revelation 17:14). The title is Yahuah''s own from the Torah — *Yahuah Elohaychem (the LORD your God)... Lord of lords* — and it is borne here by the Lamb. The slain Lamb who overcomes the kings carries the divine name and rank: the Formed who is *Lord of lords* wears the very title the LORD bears in Moses'' charge to Yashar''el (Israel).'),
  ('canon', 'revelation', 17, 14, 'canon', 'daniel', 2, 47, 'free', E'*The king answered unto Daniel, and said, Of a truth it is, that your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings, and a revealer of secrets, seeing thou couldest reveal this secret.* (Daniel 2:47). Even the king of Babylon confessed that the Elohim (God) of Daniel is *a Yahuah (Lord) of kings* — sovereign over every earthly throne. So the Lamb is *Lord of lords, and King of kings* (Revelation 17:14): the ten kings give their power to the beast for one hour, but above them stands the *Lord of kings* whom Nebuchadnezzar named, and the Lamb who overcomes them is that Lord.'),
  ('canon', 'revelation', 17, 14, 'canon', 'psalms', 136, 3, 'free', E'*O give thanks to the Lord of lords: for his mercy endureth for ever.* (Psalm 136:3). The psalm of the great Hallel gives thanks *to the Lord of lords,* whose mercy endures for ever; and the Apocalypse sets that title on the Lamb who overcomes the kings — *for he is Lord of lords, and King of kings* (Revelation 17:14). The One the psalmist praised above all powers is the One who now stands against the gathered kings and prevails, *and they that are with him are called, and chosen, and faithful.*'),
  ('canon', 'revelation', 17, 14, 'canon', 'revelation', 19, 16, 'free', E'*And he hath on his vesture and on his thigh a name written, KING OF KINGS, AND LORD OF LORDS.* (Revelation 19:16). The title the Lamb bears in ch 17 is written on the rider''s vesture in ch 19: *KING OF KINGS, AND LORD OF LORDS.* *He is Lord of lords, and King of kings* (Revelation 17:14) and he comes forth to make war in righteousness — the same Formed One, the Lamb who overcomes the kings here and the Faithful and True who treads the winepress there, wearing one name across both visions.'),
  ('canon', 'revelation', 17, 14, 'canon', '1-timothy', 6, 15, 'free', E'*Which in his times he shall shew, who is the blessed and only Potentate, the King of kings, and Lord of lords;* (1 Timothy 6:15). Paul names him *the blessed and only Potentate, the King of kings, and Lord of lords* — the very title the Lamb bears as *he is Lord of lords, and King of kings* (Revelation 17:14). The kings of the earth give their power to the beast for one hour, but there is one *only Potentate* above them all; the Lamb who overcomes them is that sole Sovereign, shown in his time.'),
  -- thread: revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47
  ('canon', 'revelation', 17, 15, 'canon', 'isaiah', 8, 7, 'free', E'*Now therefore, behold, Yahuah (Lord) bringeth up upon them the waters of the river, strong and many, even the king of Assyria, and all his glory: and he shall come up over all his channels, and go over all his banks:* (Isaiah 8:7). The angel reads the vision: *The waters which thou sawest, where the whore sitteth, are peoples, and multitudes, and nations, and tongues* (Revelation 17:15). Isaiah had already made the nations into floodwaters — the *waters of the river, strong and many, even the king of Assyria,* rising over every bank. The seer''s many waters are the peoples in just this prophetic idiom: the massed nations the harlot rides, the same overflowing flood Isaiah saw.'),
  ('canon', 'revelation', 17, 15, 'canon', 'jeremiah', 47, 2, 'free', E'*Thus saith Yahuah (LORD); Behold, waters rise up out of the north, and shall be an overflowing flood, and shall overflow the land, and all that is therein; the city, and them that dwell therein: then the men shall cry, and all the inhabitants of the land shall howl.* (Jeremiah 47:2). Jeremiah too speaks of nations as *waters* — an *overflowing flood* that overruns city and land. *The waters which thou sawest... are peoples, and multitudes, and nations, and tongues* (Revelation 17:15). The harlot sits upon these waters, ruling the swarming peoples; but the prophets have shown that such waters can themselves become the flood of judgment, and the city that rode them is overflowed in turn.'),
  -- thread: revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23
  ('canon', 'revelation', 17, 16, 'canon', 'ezekiel', 16, 37, 'free', E'*Behold, therefore I will gather all thy lovers, with whom thou hast taken pleasure, and all them that thou hast loved, with all them that thou hast hated; I will even gather them round about against thee, and will discover thy nakedness unto them, that they may see all thy nakedness.* (Ezekiel 16:37). This is the very turn the Apocalypse shows: *the ten horns which thou sawest upon the beast, these shall hate the whore, and shall make her desolate and naked* (Revelation 17:16). Ezekiel had spoken it over the unfaithful city — her own lovers gathered *against thee* to *discover thy nakedness.* The harlot''s paramours become her executioners; the kings who fornicated with her turn and strip her bare, exactly as the prophet foretold of the harlot-city.'),
  ('canon', 'revelation', 17, 16, 'canon', 'ezekiel', 16, 41, 'free', E'*And they shall burn thine houses with fire, and execute judgments upon thee in the sight of many women: and I will cause thee to cease from playing the harlot, and thou also shalt give no hire any more.* (Ezekiel 16:41). The horns *shall eat her flesh, and burn her with fire* (Revelation 17:16) — and Ezekiel had already sentenced the harlot-city: *they shall burn thine houses with fire... and I will cause thee to cease from playing the harlot.* The fire that ends her is the prophet''s own judgment on the unfaithful city; the burning is how her harlotry is finally made to cease.'),
  ('canon', 'revelation', 17, 16, 'canon', 'ezekiel', 23, 29, 'free', E'*And they shall deal with thee hatefully, and shall take away all thy labour, and shall leave thee naked and bare: and the nakedness of thy whoredoms shall be discovered, both thy lewdness and thy whoredoms.* (Ezekiel 23:29). Ezekiel''s second harlot-city is handed to those *whom thou hatest* (23:28), who *deal with thee hatefully* and *leave thee naked and bare.* The ten horns *shall hate the whore, and shall make her desolate and naked* (Revelation 17:16) — the same dealing, the same nakedness uncovered. The lovers-turned-haters of Ezekiel 23 are the pattern for the kings who strip and burn the great whore.'),
  ('canon', 'revelation', 17, 16, 'canon', 'jeremiah', 50, 41, 'free', E'*Behold, a people shall come from the north, and a great nation, and many kings shall be raised up from the coasts of the earth.* (Jeremiah 50:41). Against Babylon Jeremiah summons *a people... from the north, and a great nation, and many kings... from the coasts of the earth* — the gathered powers that bring her down. So *the ten horns... shall hate the whore, and shall make her desolate* (Revelation 17:16): for *Elohim (God) hath put in their hearts to fulfil his will* (17:17). The many kings raised against Babylon are the instrument of judgment, their hatred bent by the hand of Elohim (God) to accomplish his word against the harlot-city.'),
  ('canon', 'revelation', 17, 16, 'apocrypha', '2-esdras', 15, 55, 'extras', E'*The reward of your whoredom shall be in your bosom, therefore shall you receive recompence.* (2 Esdras 15:55). The Hebrew library names the law of the harlot''s end: *the reward of your whoredom shall be in your bosom... you receive recompence.* The ten horns that *hate the whore, and shall make her desolate and naked, and shall eat her flesh, and burn her with fire* (Revelation 17:16) are that recompence falling — the wages of her whoredom paid back into her own bosom, the judgment her fornication earned coming home upon her.'),
  ('canon', 'revelation', 17, 16, 'apocrypha', '2-esdras', 15, 61, 'extras', E'*And you shall be cast down by them as stubble, and they shall be to you as fire;* (2 Esdras 15:61). The instruments of judgment *shall be to you as fire,* casting the harlot-city *down... as stubble* — and the horns *shall eat her flesh, and burn her with fire* (Revelation 17:16). The same image carries: the powers Yahuah (God) raises become fire to the whore, and what seemed a mighty city is consumed as stubble in the flame of the recompence she had stored up.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-17-the-great-whore-upon-many-waters-babylon-the-golden-cup-jeremiah-51',
       E'The great whore upon many waters — Babylon the golden cup making the earth drunken (Jeremiah 51)',
       E'The seer is brought to see *the judgment of the great whore that sitteth upon many waters* (Revelation 17:1), *with whom the kings of the earth have committed fornication, and the inhabitants of the earth have been made drunk with the wine of her fornication* (17:2). Every line of the charge is the old prophets'' word over the harlot-city re-spoken. Jeremiah had cried over Babylon, *O thou that dwellest upon many waters, abundant in treasures, thine end is come* (Jeremiah 51:13) — the same waters, the same end. And he named the cup: *Babylon hath been a golden cup in the LORD’S hand, that made all the earth drunken: the nations have drunken of her wine; therefore the nations are mad* (Jeremiah 51:7) — the very draught the whore pours, *the wine of her fornication.* The prophets read the seducing world-city as a harlot who sells herself to every kingdom: *Yahuah (LORD) will visit Tyre, and she shall turn to her hire, and shall commit fornication with all the kingdoms of the world upon the face of the earth* (Isaiah 23:17); and Nineveh, *the wellfavoured harlot, the mistress of witchcrafts, that selleth nations through her whoredoms, and families through her witchcrafts* (Nahum 3:4). This is not a new figure but the consummation of an old one — Babylon and Tyre and Nineveh gathered into the one great whore who reigns over the kings of the earth and makes the nations mad with her wine. She is the counterfeit of the faithful bride: the city that draws the peoples into spiritual fornication, set against the new Jerusalem that comes down adorned for her husband.',
       sv.verse_id, ev.verse_id, 'free', 9400
  FROM _s224_rv17_lookup sv, _s224_rv17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=17 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7',
       E'The woman on the scarlet beast, seven heads and ten horns — Daniel''s fourth beast (Daniel 7)',
       E'*I saw a woman sit upon a scarlet coloured beast, full of names of blasphemy, having seven heads and ten horns* (Revelation 17:3). The beast is Daniel''s, drawn straight from the night-vision. Daniel saw *four great beasts came up from the sea, diverse one from another* (Daniel 7:3), and then *a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces... and it had ten horns* (Daniel 7:7). The harlot rides this same brute power — the blaspheming, world-trampling kingdom with its ten horns. And the kinship runs deeper: as Daniel''s beasts rose *from the sea,* the beast of the Apocalypse *shall ascend out of the bottomless pit* (Revelation 17:8), and the waters where the whore sits are *peoples, and multitudes, and nations, and tongues* (17:15) — the same churning deep of the nations out of which the beast-kingdoms rise. The woman does not stand on her own strength; she sits upon the beast, the seducing city carried by the devouring power of the world, until the very horns she rode turn against her.',
       sv.verse_id, ev.verse_id, 'free', 9403
  FROM _s224_rv17_lookup sv, _s224_rv17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=17 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-17-arrayed-in-purple-and-scarlet-the-golden-cup-of-abominations-jeremiah-51-ezekiel-28',
       E'Arrayed in purple and scarlet — the golden cup full of abominations (Jeremiah 51, Ezekiel 28)',
       E'*And the woman was arrayed in purple and scarlet colour, and decked with gold and precious stones and pearls, having a golden cup in her hand full of abominations and filthiness of her fornication* (Revelation 17:4). The splendour is the lure; the draught within is the ruin. The golden cup is Babylon''s own — *Babylon hath been a golden cup in the LORD’S hand, that made all the earth drunken: the nations have drunken of her wine; therefore the nations are mad* (Jeremiah 51:7). What glitters as gold in the harlot''s hand is the vessel Jeremiah named, and it pours not wine only but *abominations.* And the heaped adornment — *gold and precious stones and pearls* — echoes the dazzling covering of Ezekiel''s fallen prince: *every precious stone was thy covering, the sardius, topaz, and the diamond, the beryl, the onyx, and the jasper, the sapphire, the emerald, and the carbuncle, and gold* (Ezekiel 28:13). That is the proud splendour that counterfeits Eden''s glory and falls; the woman wears the same borrowed brilliance, beauty turned to the service of fornication, the outward dazzle masking the cup full of filthiness within.',
       sv.verse_id, ev.verse_id, 'free', 9406
  FROM _s224_rv17_lookup sv, _s224_rv17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16',
       E'MYSTERY BABYLON, the mother of harlots, drunken with the blood of the saints — the unfaithful city (Isaiah 47, Ezekiel 16)',
       E'*And upon her forehead was a name written, MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS AND ABOMINATIONS OF THE EARTH* (Revelation 17:5); *And I saw the woman drunken with the blood of the saints, and with the blood of the martyrs of Yahusha (Jesus)* (17:6). The prophets had drawn her long before. Isaiah named the *daughter of the Chaldeans,* the self-exalting world-city: *Sit thou silent, and get thee into darkness, O daughter of the Chaldeans: for thou shalt no more be called, The lady of kingdoms* (Isaiah 47:5) — she who boasted *I am, and none else beside me.* And Ezekiel arraigned the unfaithful city on the harlot''s double charge — adultery and bloodshed together: *I will judge thee, as women that break wedlock and shed blood are judged; and I will give thee blood in fury and jealousy* (Ezekiel 16:38). The whore of the Apocalypse is judged on exactly that double count: she has played the harlot with the kings, and she has shed the blood of the faithful, and the blood she is drunk on is the witness against her. The restored library speaks the same idiom — a people who *made thyself like to her; and have decked your daughters in whoredom, that they might please and glory in your lovers* (2 Esdras 15:47), and whose doom is fixed because *you had... always slain my chosen, exalting the stroke of yours hands, and saying over their dead, when you were drunken* (2 Esdras 15:53): the slaying of the chosen and the drunken triumph over their dead is the harlot''s very signature. And the Apocalypse itself has announced her twice over — *Babylon is fallen, is fallen, that great city, because she made all nations drink of the wine of the wrath of her fornication* (Revelation 14:8) — and in her dirge declares the verdict, *in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24). One Babylon across the whole vision: the persecuting harlot-city, mother of every abomination, held to account for every righteous one she slew. She is the dark counterfeit of the bride — the great city set against the holy city, the harlot drunk with blood against the new Jerusalem clothed in the righteousness of the saints.',
       sv.verse_id, ev.verse_id, 'extras', 9409
  FROM _s224_rv17_lookup sv, _s224_rv17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2',
       E'The ten horns make war with the Lamb, and the Lamb shall overcome them — Lord of lords and King of kings (Deuteronomy 10, Daniel 2)',
       E'*The ten horns which thou sawest are ten kings, which have received no kingdom as yet; but receive power as kings one hour with the beast* (Revelation 17:12); *These have one mind, and shall give their power and strength unto the beast. These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings: and they that are with him are called, and chosen, and faithful* (17:13-14). The angel''s reading of the horns is Daniel''s own: *the ten horns out of this kingdom are ten kings that shall arise* (Daniel 7:24) — kings given a brief hour, lending their strength to the beast. But against them stands the Lamb, and the title he bears is the divine name from the Torah itself: *For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible* (Deuteronomy 10:17). The slain Lamb who overcomes the kings is *Lord of lords* — the Formed who wears the very title the LORD bears in Moses'' charge to Yashar''el (Israel). Even Babylon''s king confessed it: *your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47); and the great Hallel sang it, *O give thanks to the Lord of lords: for his mercy endureth for ever* (Psalm 136:3). The same name is written on the rider''s vesture — *KING OF KINGS, AND LORD OF LORDS* (Revelation 19:16) — and Paul names him *the blessed and only Potentate, the King of kings, and Lord of lords* (1 Timothy 6:15). The ten kings hold power one hour; the Lamb holds it for ever. They make war and are overcome, for he is the one only Sovereign above every throne, and they that are with him are *called, and chosen, and faithful.*',
       sv.verse_id, ev.verse_id, 'free', 9412
  FROM _s224_rv17_lookup sv, _s224_rv17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=17 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47',
       E'The waters are peoples, and multitudes, and nations, and tongues (Isaiah 8, Jeremiah 47)',
       E'*And he saith unto me, The waters which thou sawest, where the whore sitteth, are peoples, and multitudes, and nations, and tongues* (Revelation 17:15). The angel''s own interpretation rests on a settled prophetic idiom: the massed nations are floodwaters. Isaiah had said it of Assyria — *behold, Yahuah (Lord) bringeth up upon them the waters of the river, strong and many, even the king of Assyria, and all his glory: and he shall come up over all his channels, and go over all his banks* (Isaiah 8:7) — the nation as an overflowing flood rising over every bank. And Jeremiah said it of the invaders from the north: *Behold, waters rise up out of the north, and shall be an overflowing flood, and shall overflow the land, and all that is therein; the city, and them that dwell therein* (Jeremiah 47:2). The many waters the whore sits upon are the peoples in just this sense — the swarming nations she rides and rules. Yet the prophets'' own image carries the warning: such waters become the flood of judgment, and the city that rode the peoples is in the end overflowed by them, the very horns and nations turning to make her desolate.',
       sv.verse_id, ev.verse_id, 'free', 9415
  FROM _s224_rv17_lookup sv, _s224_rv17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=17 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23',
       E'The ten horns shall hate the whore and burn her with fire — the lovers turned against the harlot (Ezekiel 16 and 23)',
       E'*And the ten horns which thou sawest upon the beast, these shall hate the whore, and shall make her desolate and naked, and shall eat her flesh, and burn her with fire* (Revelation 17:16); *For Elohim (God) hath put in their hearts to fulfil his will* (17:17). The harlot''s own paramours become her executioners — and this exact turn is the prophets'' sentence on the unfaithful city. Ezekiel spoke it twice. *Behold, therefore I will gather all thy lovers, with whom thou hast taken pleasure... I will even gather them round about against thee, and will discover thy nakedness unto them* (Ezekiel 16:37) — the lovers gathered against her to strip her bare; *and they shall burn thine houses with fire, and execute judgments upon thee... and I will cause thee to cease from playing the harlot* (Ezekiel 16:41) — the fire that ends her harlotry. And of the second harlot-city: *they shall deal with thee hatefully, and shall take away all thy labour, and shall leave thee naked and bare* (Ezekiel 23:29), delivered into the hand of *them whom thou hatest.* The kings who fornicated with the whore turn and hate her, strip her, and burn her — exactly as the prophet foretold of the harlot-city, the lovers become haters. Against Babylon, Jeremiah summoned the instrument: *a people shall come from the north, and a great nation, and many kings shall be raised up from the coasts of the earth* (Jeremiah 50:41). And the restored library names the law of her end: *The reward of your whoredom shall be in your bosom, therefore shall you receive recompence* (2 Esdras 15:55); *And you shall be cast down by them as stubble, and they shall be to you as fire* (2 Esdras 15:61). The wages of her whoredom are paid back into her own bosom; the powers Yahuah (God) raises become fire to her, and *the woman which thou sawest is that great city, which reigneth over the kings of the earth* (Revelation 17:18) is consumed as stubble — the counterfeit city fallen, that the holy city may come down in her place.',
       sv.verse_id, ev.verse_id, 'extras', 9418
  FROM _s224_rv17_lookup sv, _s224_rv17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=17 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-17-the-great-whore-upon-many-waters-babylon-the-golden-cup-jeremiah-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 51:13 — *O thou that dwellest upon many waters... thine end is come* Babylon dwells on the many waters and meets her end; the great whore *sitteth upon many waters* and is judged (Revelation 17:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-great-whore-upon-many-waters-babylon-the-golden-cup-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 51:7 — *Babylon hath been a golden cup... that made all the earth drunken... the nations are mad* the cup of Babylon that intoxicates the nations; the inhabitants made drunk *with the wine of her fornication* (Revelation 17:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-great-whore-upon-many-waters-babylon-the-golden-cup-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 23:17 — *she shall... commit fornication with all the kingdoms of the world* Tyre the harlot-city fornicating with every kingdom; the whore with whom *the kings of the earth have committed fornication* (Revelation 17:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-great-whore-upon-many-waters-babylon-the-golden-cup-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Nahum 3:4 — *the wellfavoured harlot, the mistress of witchcrafts, that selleth nations through her whoredoms* Nineveh the seducing harlot trafficking the nations; the same figure as the *great whore* judged (Revelation 17:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-great-whore-upon-many-waters-babylon-the-golden-cup-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:7 — *a fourth beast, dreadful and terrible... and it had ten horns* Daniel''s devouring fourth beast with ten horns; the scarlet beast *having seven heads and ten horns* that carries the woman (Revelation 17:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:3 — *four great beasts came up from the sea* the beast-kingdoms rise from the sea; the beast *shall ascend out of the bottomless pit* and the waters are the nations (Revelation 17:3,8,15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-17-arrayed-in-purple-and-scarlet-the-golden-cup-of-abominations-jeremiah-51-ezekiel-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 51:7 — *Babylon hath been a golden cup in the LORD’S hand, that made all the earth drunken* the golden cup of Babylon; the woman holds *a golden cup in her hand full of abominations* (Revelation 17:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-arrayed-in-purple-and-scarlet-the-golden-cup-of-abominations-jeremiah-51-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 28:13 — *every precious stone was thy covering... and gold* the dazzling covering of the fallen prince of Tyre; the harlot *decked with gold and precious stones and pearls* (Revelation 17:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-arrayed-in-purple-and-scarlet-the-golden-cup-of-abominations-jeremiah-51-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 47:5 — *O daughter of the Chaldeans: for thou shalt no more be called, The lady of kingdoms* the self-exalting daughter of Babylon sent into darkness; *MYSTERY, BABYLON THE GREAT* on the woman''s forehead (Revelation 17:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 16:38 — *I will judge thee, as women that break wedlock and shed blood are judged* the unfaithful city judged for adultery and bloodshed together; the woman *drunken with the blood of the saints* (Revelation 17:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 15:47 — *made thyself like to her; and have decked your daughters in whoredom... your lovers* the harlot-city idiom in the restored library; the *MOTHER OF HARLOTS* who draws the nations into fornication (Revelation 17:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=15 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 15:53 — *you had... always slain my chosen... saying over their dead, when you were drunken* the slaying of the chosen and drunken triumph over their dead; the woman drunk with the blood of the martyrs (Revelation 17:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=15 AND tv.verse_number=53
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 14:8 — *Babylon is fallen, is fallen, that great city, because she made all nations drink of the wine... of her fornication* the earlier proclamation unveiled in the woman *MYSTERY, BABYLON THE GREAT* (Revelation 17:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Revelation 18:24 — *in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* the verdict of the dirge; the woman *drunken with the blood of the saints* held to account (Revelation 17:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:24 — *the ten horns out of this kingdom are ten kings that shall arise* Daniel''s own interpretation of the horns; *the ten horns... are ten kings... receive power as kings one hour* (Revelation 17:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 10:17 — *Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords* the divine title from the Torah; the Lamb *is Lord of lords, and King of kings* (Revelation 17:14), the Formed bearing the LORD''s own name.'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 2:47 — *your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings* Babylon''s king confesses the Lord of kings above every throne; the Lamb *Lord of lords, and King of kings* overcomes them (Revelation 17:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 136:3 — *O give thanks to the Lord of lords: for his mercy endureth for ever* the great Hallel''s title above all powers; the Lamb who overcomes the kings is that *Lord of lords* (Revelation 17:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=136 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 19:16 — *KING OF KINGS, AND LORD OF LORDS* the same title on the rider''s vesture; the Lamb who *is Lord of lords, and King of kings* comes forth to make war in righteousness (Revelation 17:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Timothy 6:15 — *the blessed and only Potentate, the King of kings, and Lord of lords* Paul names the one only Sovereign above every throne; the Lamb who overcomes the ten kings is he (Revelation 17:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 8:7 — *the waters of the river, strong and many, even the king of Assyria... go over all his banks* the nation as an overflowing flood; *the waters... are peoples, and multitudes, and nations, and tongues* (Revelation 17:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 47:2 — *waters rise up out of the north, and shall be an overflowing flood, and shall overflow the land* invading nations as floodwaters; the many waters the whore rides are the peoples (Revelation 17:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=47 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 16:37 — *I will gather all thy lovers... against thee, and will discover thy nakedness* the lovers gathered to strip the harlot-city; the horns *shall make her desolate and naked* (Revelation 17:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 16:41 — *they shall burn thine houses with fire... and I will cause thee to cease from playing the harlot* the fire that ends the harlotry; the horns *shall... burn her with fire* (Revelation 17:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 23:29 — *they shall deal with thee hatefully... and shall leave thee naked and bare* the lovers-turned-haters of the second harlot-city; the horns *shall hate the whore, and shall make her desolate and naked* (Revelation 17:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=23 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 50:41 — *a people shall come from the north, and a great nation, and many kings shall be raised up* the powers raised against Babylon; the ten horns made the instrument of judgment on the whore (Revelation 17:16-17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=50 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 15:55 — *The reward of your whoredom shall be in your bosom, therefore shall you receive recompence* the law of the harlot''s end; her wages paid back as the horns make her desolate (Revelation 17:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=15 AND tv.verse_number=55
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 15:61 — *you shall be cast down by them as stubble, and they shall be to you as fire* the powers become fire to the harlot-city; the horns *shall... burn her with fire* (Revelation 17:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv17_lookup sv, _s224_rv17_lookup tv
 WHERE t.slug='revelation-17-the-ten-horns-shall-hate-the-whore-and-burn-her-with-fire-ezekiel-16-and-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=15 AND tv.verse_number=61
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
