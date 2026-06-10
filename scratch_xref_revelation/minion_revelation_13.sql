-- ----- fragment: minion_revelation_13.sql (S224 Revelation 13) -----
-- =====================================================================
-- S224 minion — REVELATION 13 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 13 (18 verses) — the beast from the sea, the beast from the earth, the mark.
-- Tag: rv13 (temp view _s224_rv13_lookup).
-- Sort band: floor 9300, step 3 (9300, 9303, 9306, 9309, 9312, 9315, 9318 used; under 9325).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Revelation = consummation of the covenant story; same Yahuah, same Torah, same
-- Yashar'el): chapter 13 is the beast-system and its counterfeit. The seer re-speaks Daniel 7 — the
-- four beasts (lion, bear, leopard, the dreadful fourth with ten horns) gathered into ONE composite
-- beast; the mouth speaking great things and the forty-and-two months are Daniel's *time, times, and
-- the dividing of time* and the horn that *think[s] to change times and laws*. The worship of the
-- image is Daniel 3 re-spoken (the golden image all must worship on pain of the furnace). And the
-- MARK in the right hand or forehead (13:16) is read as the deliberate COUNTERFEIT of the sign of
-- covenant loyalty: the seal of Yahuah set on the forehead of those who grieve over abomination
-- (Ezekiel 9:4) and the binding of the commandments *for a sign upon thine hand* and *as frontlets
-- between thine eyes* (Deuteronomy 6:8). The beast-system parodies the sign of belonging to Yahuah
-- and keeping his commandments; the faithful are those SEALED with Yahuah's own mark (ch7, ch14), the
-- commandment-keepers — *Here is the patience and the faith of the saints* (13:10).
-- Christology: the Lamb *slain from the foundation of the world* (13:8) is the Formed, the slain-yet-
-- reigning One whose book of life holds the names; preserved as the pull gives.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the beast from the sea, leopard/bear/lion, seven heads and ten horns
--           Tanakh: Daniel 7:3 (four beasts from the sea), 7:4-6 (lion/bear/leopard), 7:7 (the
--                   dreadful fourth with ten horns), 7:8 (the little horn), 7:23-24 (the fourth
--                   kingdom and ten kings) — the four beasts gathered into one composite
--           Extras: 2 Esdras 11:1 (an eagle from the sea, twelve wings and three heads, reigning),
--                   2 Esdras 12:11 (the eagle IS Daniel's fourth-kingdom beast — explicit)
--           NT: none warranted (the Daniel root carries it)
--   v.3-4   the wounded head healed; all the world wondered and worshipped the dragon and the beast
--           Tanakh: Daniel 3:5 (worship the image at the sound of music), 3:6-7 (all fall down and
--                   worship on pain of the furnace) — the compelled worship of the image
--           Extras: none warranted   NT: none warranted
--   v.5-7   a mouth speaking great things and blasphemies; forty and two months; war with the saints
--           Tanakh: Daniel 7:8 (a mouth speaking great things), 7:25 (great words against the Most
--                   High, wear out the saints, change times and laws, a time and times and dividing
--                   of time = the 42 months), 7:21 (the horn made war with the saints and prevailed),
--                   Daniel 11:36 (the king magnifies himself, speaks marvellous things against Elohim)
--           Extras: none warranted   NT: none warranted
--   v.8     all worship him whose names are NOT written in the book of life of the Lamb slain
--           Tanakh: Exodus 32:32 (blot me out of thy book), Psalm 69:28 (blotted out of the book of
--                   the living), Daniel 12:1 (delivered, every one found written in the book)
--           Extras: 1 Enoch 90:12 (the Lord of the sheep opened the books of the living and the books
--                   of the sinners) — the two books at the judgment
--           NT: none warranted (book-of-life echoes carried by the Tanakh roots)
--   v.9-10  he that leadeth into captivity; the patience and faith of the saints
--           Tanakh: Jeremiah 15:2 (such as are for the sword, to the sword; for the captivity, to the
--                   captivity), Jeremiah 43:11 (such as are for captivity to captivity, for the sword
--                   to the sword) — the measured judgment the saints endure
--           Extras: none warranted   NT: none warranted
--   v.11-15 the second beast like a lamb but speaking as a dragon; fire from heaven; the image
--           Tanakh: Deuteronomy 13:1-3 (the prophet who gives a sign or wonder to draw after other
--                   gods — Yahuah proving you), 1 Kings 18:24 (the Elohim that answereth by fire — the
--                   TRUE fire contrasted with the false prophet's counterfeit), Daniel 3:5-6 (the
--                   image all must worship or be slain)
--           Extras: 1 Enoch 90:14 (the beasts cast into the fiery abyss — the false-prophet beast's end)
--           NT: none warranted
--   v.16-18 the mark in the right hand or forehead; none may buy or sell; the number of the beast
--           Tanakh: Ezekiel 9:4 (the seal of Yahuah on the foreheads of those who sigh for the
--                   abominations — the TRUE mark the beast counterfeits), Deuteronomy 6:8 (bind the
--                   commandments for a sign upon thine hand and as frontlets between thine eyes — the
--                   sign of covenant loyalty the mark parodies)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9300 revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one   (Tanakh + Extras)
--   9303 revelation-13-the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped  (Tanakh)
--   9306 revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months   (Tanakh)
--   9309 revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain              (Tanakh + Extras)
--   9312 revelation-13-he-that-leadeth-into-captivity-the-patience-and-faith-of-the-saints  (Tanakh)
--   9315 revelation-13-the-second-beast-like-a-lamb-the-false-prophet-and-the-fire          (Tanakh + Extras)
--   9318 revelation-13-the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal            (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one
  ('canon', 'revelation', 13, 1, 'canon', 'daniel', 7, 3, 'free', E'*And four great beasts came up from the sea, diverse one from another.* (Daniel 7:3). The seer stands on the sand and sees *a beast rise up out of the sea, having seven heads and ten horns* (Revelation 13:1) — and Daniel''s four beasts come up *from the sea* before him. The waters are the seething nations, and out of them the kingdoms rise; what Daniel saw as four, John sees gathered into one. The sea-beast of Revelation is the long succession of beast-empires brought to its head in a single composite.'),
  ('canon', 'revelation', 13, 2, 'canon', 'daniel', 7, 4, 'free', E'*The first was like a lion, and had eagle''s wings: I beheld till the wings thereof were plucked, and it was lifted up from the earth, and made stand upon the feet as a man, and a man''s heart was given to it.* (Daniel 7:4). Daniel''s first beast was *like a lion*; John''s beast has *his mouth as the mouth of a lion* (Revelation 13:2). The features Daniel saw spread across four beasts are folded into the one beast of Revelation — the lion''s mouth is the first of the three borrowed limbs, the empires of old gathered into the last.'),
  ('canon', 'revelation', 13, 2, 'canon', 'daniel', 7, 5, 'free', E'*And behold another beast, a second, like to a bear, and it raised up itself on one side, and it had three ribs in the mouth of it between the teeth of it: and they said thus unto it, Arise, devour much flesh.* (Daniel 7:5). Daniel''s second beast was *like to a bear*; John''s beast has *his feet as the feet of a bear* (Revelation 13:2). The devouring strength of the bear becomes the feet of the composite — the second of the three limbs Revelation draws from Daniel''s vision, the kingdoms of the past standing up again in the beast of the end.'),
  ('canon', 'revelation', 13, 2, 'canon', 'daniel', 7, 6, 'free', E'*After this I beheld, and lo another, like a leopard, which had upon the back of it four wings of a fowl; the beast had also four heads; and dominion was given to it.* (Daniel 7:6). Daniel''s third beast was *like a leopard*; John says *the beast which I saw was like unto a leopard* (Revelation 13:2). And as Daniel''s leopard had *dominion... given to it*, so the dragon *gave him his power, and his seat, and great authority* (Revelation 13:2). The body of the composite beast is the leopard''s; the three beasts of Daniel — lion, bear, leopard — are gathered into the one, and the dragon hands it the authority that was given to the kingdoms before.'),
  ('canon', 'revelation', 13, 1, 'canon', 'daniel', 7, 7, 'free', E'*After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* (Daniel 7:7). Daniel''s dreadful fourth beast *had ten horns*; John''s beast has *ten horns, and upon his horns ten crowns* (Revelation 13:1). The ten horns are the mark that binds the two visions: the composite of Revelation carries the ten-horned terror of Daniel''s fourth kingdom, the last and worst of the beast-empires.'),
  ('canon', 'revelation', 13, 1, 'canon', 'daniel', 7, 23, 'free', E'*Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* (Daniel 7:23). The angel told Daniel the fourth beast is *the fourth kingdom upon earth* that shall *devour the whole earth*; John sees that devouring reach completed — *power was given him over all kindreds, and tongues, and nations* (Revelation 13:7), the world-wide dominion of the one beast rising *out of the sea* (Revelation 13:1) with *seven heads and ten horns*.'),
  ('canon', 'revelation', 13, 1, 'apocrypha', '2-esdras', 11, 1, 'extras', E'*Then saw I a dream, and, behold, there came up from the sea an eagle, which had twelve feathered wings, and three heads.* (2 Esdras 11:1). Ezra too saw a beast come up *from the sea* and reign *upon earth, and over them that dwelt in it* (2 Esdras 11:5), heads and wings and many crowns — the same seer''s grammar John speaks when *a beast rise[s] up out of the sea, having seven heads and ten horns* (Revelation 13:1). The restored library keeps the same vision: a sea-beast of many heads and horns, given dominion over all the earth, the empire that bestrides the nations until the Most High judges it.'),
  ('canon', 'revelation', 13, 1, 'apocrypha', '2-esdras', 12, 11, 'extras', E'*The eagle, whom you sawest come up from the sea, is the kingdom which was seen in the vision of your brother Daniel.* (2 Esdras 12:11). The interpreting voice tells Ezra plainly that his sea-eagle IS the fourth kingdom of Daniel''s vision — the very beast John re-speaks when his own sea-beast rises *having seven heads and ten horns* (Revelation 13:1). All three seers are looking at one thing: the last beast-empire of Daniel 7, the dreadful fourth kingdom, shown again to Ezra as the eagle and to John as the composite beast. The library bears one witness across its books.'),
  -- thread: revelation-13-the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped
  ('canon', 'revelation', 13, 4, 'canon', 'daniel', 3, 5, 'free', E'*That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up* (Daniel 3:5). The compelled worship John sees — *they worshipped the beast, saying, Who is like unto the beast?* (Revelation 13:4) — is Nebuchadnezzar''s decree grown to fill the earth. There the herald commanded all to *fall down and worship the golden image*; here *all the world wondered after the beast* (Revelation 13:3). The beast-system has always demanded the worship that belongs to Yahuah (LORD) alone, and dressed its idol in music and majesty to win it.'),
  ('canon', 'revelation', 13, 3, 'canon', 'daniel', 3, 7, 'free', E'*Therefore at that time, when all the people heard the sound of the cornet, flute, harp, sackbut, psaltery, and all kinds of musick, all the people, the nations, and the languages, fell down and worshipped the golden image that Nebuchadnezzar the king had set up.* (Daniel 3:7). *All the people, the nations, and the languages* fell down before the image on the plain of Dura; *all the world wondered after the beast* (Revelation 13:3) on the stage of the whole earth. The same words — peoples, nations, languages — measure the reach of the false worship in both visions. What was one image in one province becomes the worship of the beast over all kindreds; and as three men would not bow then, the saints will not bow now.'),
  -- thread: revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months
  ('canon', 'revelation', 13, 5, 'canon', 'daniel', 7, 8, 'free', E'*I considered the horns, and, behold, there came up among them another little horn, before whom there were three of the first horns plucked up by the roots: and, behold, in this horn were eyes like the eyes of man, and a mouth speaking great things.* (Daniel 7:8). The beast is *given... a mouth speaking great things and blasphemies* (Revelation 13:5) — the very *mouth speaking great things* of Daniel''s little horn. John sees the horn''s arrogant mouth become the beast''s; the boasting power Daniel watched rise among the ten horns is the power that now opens its mouth *in blasphemy against Elohim (God)* (Revelation 13:6).'),
  ('canon', 'revelation', 13, 5, 'canon', 'daniel', 7, 25, 'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). Here is the measure of the beast''s season: *power was given unto him to continue forty and two months* (Revelation 13:5) — Daniel''s *time, times, and the dividing of time.* And here is its character: it *speak[s] great words against the El Elyon (most High)* and *think[s] to change times and laws.* The beast-system makes war on the commandments of Yahuah (LORD), reaching to alter the very times and laws he appointed; that is the blasphemy John names, and the saints are *given into his hand* for the appointed season — but only the season.'),
  ('canon', 'revelation', 13, 7, 'canon', 'daniel', 7, 21, 'free', E'*I beheld, and the same horn made war with the saints, and prevailed against them* (Daniel 7:21). *It was given unto him to make war with the saints, and to overcome them* (Revelation 13:7) — word for word the war Daniel saw the horn wage, and for a season win. But Daniel saw the end of it too: *until the Ancient of days came, and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom* (Daniel 7:22). The overcoming is real and it is bounded; the patience of the saints holds because the verdict has already been given in their favour.'),
  ('canon', 'revelation', 13, 6, 'canon', 'daniel', 11, 36, 'free', E'*And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods, and shall prosper till the indignation be accomplished: for that that is determined shall be done.* (Daniel 11:36). The self-exalting king who *speak[s] marvellous things against the Elohim (God) of gods* is of one spirit with the beast that *opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* (Revelation 13:6). And the same limit is set on both: he prospers only *till the indignation be accomplished*, only for the *forty and two months* (Revelation 13:5). The mouth is loud, but the clock is the Father''s.'),
  -- thread: revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain
  ('canon', 'revelation', 13, 8, 'canon', 'exodus', 32, 32, 'free', E'*Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* (Exodus 32:32). The book John names — *the book of life of the Lamb slain* (Revelation 13:8) — is the book Moses pled over at Sinai, the register of Yahuah (LORD)''s own people written from of old. To have a name in it is to belong to the covenant from the first; those who *worship the beast* are *they whose names are not written* there. The book is no afterthought of belief — it was *written* before, and Moses knew its weight when he offered his own place in it for his people.'),
  ('canon', 'revelation', 13, 8, 'canon', 'psalms', 69, 28, 'free', E'*Let them be blotted out of the book of the living, and not be written with the righteous.* (Psalm 69:28). The psalmist knew the same *book of the living* and the dreadful possibility of being *blotted out* of it — set over against being *written with the righteous.* John sees its reverse: *all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world* (Revelation 13:8). The names of the faithful were written from the foundation; the worshippers of the beast are those not found there, and the patience of the saints rests on the surety of that writing.'),
  ('canon', 'revelation', 13, 8, 'canon', 'daniel', 12, 1, 'free', E'*And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). Daniel''s deliverance is by the book: *every one that shall be found written in the book* is delivered through the time of trouble. John''s beast holds sway over all *whose names are not written in the book of life of the Lamb slain* (Revelation 13:8). One book runs through the visions — the register of Yahuah (LORD)''s people — and to be found in it is to be kept; the war of the beast cannot touch the name that is written.'),
  ('canon', 'revelation', 13, 8, 'enoch', '1-enoch', 90, 12, 'extras', E'*And after that I saw in the vision that the Lord of the sheep opened the books of the living, and the books of the sinners were opened.* (1 Enoch 90:12). The restored library keeps the same two books — *the books of the living* and *the books of the sinners* — opened at the judgment by the Lord of the sheep. John sees the worshippers of the beast as those *whose names are not written in the book of life of the Lamb slain* (Revelation 13:8): they stand in the books of the sinners, not the books of the living. The Lamb who opens the book is the Lord of the sheep who gathers his own; the writing of the name is the gathering, settled before the beast ever rose.'),
  -- thread: revelation-13-he-that-leadeth-into-captivity-the-patience-and-faith-of-the-saints
  ('canon', 'revelation', 13, 10, 'canon', 'jeremiah', 15, 2, 'free', E'*And it shall come to pass, if they say unto thee, Whither shall we go forth? then thou shalt tell them, Thus saith Yahuah (LORD); Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity.* (Jeremiah 15:2). John''s words *He that leadeth into captivity shall go into captivity: he that killeth with the sword must be killed with the sword* (Revelation 13:10) are spoken in the cadence of Jeremiah''s oracle — *such as are for the sword, to the sword... such as are for the captivity, to the captivity.* The measured, sovereign appointing of each to his portion is the frame in which the saints endure: the sword and the captivity are not chaos but a reckoning ordered by Yahuah (LORD), and so *here is the patience and the faith of the saints* (Revelation 13:10).'),
  ('canon', 'revelation', 13, 10, 'canon', 'jeremiah', 43, 11, 'free', E'*And when he cometh, he shall smite the land of Egypt, and deliver such as are for death to death; and such as are for captivity to captivity; and such as are for the sword to the sword.* (Jeremiah 43:11). Jeremiah speaks it a second time over Egypt — *such as are for captivity to captivity; and such as are for the sword to the sword* — the same fixed apportioning John echoes: *He that leadeth into captivity shall go into captivity: he that killeth with the sword must be killed with the sword* (Revelation 13:10). The saints are not promised escape from the captivity or the sword in the beast''s season; they are given the assurance that every portion is measured by Yahuah (LORD), and the captor and the killer come under the same reckoning in their turn. That is where *the patience and the faith of the saints* is forged.'),
  -- thread: revelation-13-the-second-beast-like-a-lamb-the-false-prophet-and-the-fire
  ('canon', 'revelation', 13, 14, 'canon', 'deuteronomy', 13, 1, 'free', E'*If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder* (Deuteronomy 13:1). The second beast *had two horns like a lamb, and he spake as a dragon* (Revelation 13:11) and *deceiveth them that dwell on the earth by the means of those miracles which he had power to do* (Revelation 13:14) — exactly the prophet of Deuteronomy who *giveth thee a sign or a wonder.* The Torah warned that a true-seeming sign is no proof of a true prophet; *Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart* (Deuteronomy 13:3). The false prophet of Revelation is the sign-worker the Torah taught the people to refuse, and his wonders are the proving of the saints'' loyalty.'),
  ('canon', 'revelation', 13, 13, 'canon', '1-kings', 18, 24, 'free', E'*And call ye on the name of your gods, and I will call on the name of Yahuah (LORD): and the Elohim (God) that answereth by fire, let him be Elohim (God). And all the people answered and said, It is well spoken.* (1 Kings 18:24). At Carmel the test was fire from heaven, and *the Elohim (God) that answereth by fire* was shown to be Yahuah (LORD) alone, when the false prophets'' altar stayed cold. The second beast counterfeits that very sign — he *maketh fire come down from heaven on the earth in the sight of men* (Revelation 13:13) — to claim the proof that belonged to the true Elohim (God). The false prophet apes Elijah''s sign to draw the worship Elijah turned back to Yahuah (LORD); the fire from heaven is now the deceiver''s costume, not the verdict of heaven.'),
  ('canon', 'revelation', 13, 15, 'canon', 'daniel', 3, 6, 'free', E'*And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* (Daniel 3:6). The image of the beast carries the same decree as Nebuchadnezzar''s golden image — *as many as would not worship the image of the beast should be killed* (Revelation 13:15), as on the plain of Dura *whoso falleth not down and worshippeth* was cast into the furnace. The beast-system always ends at the same edict: worship the image or die. And the three who would not bow stand as the type of the saints who will not worship the beast, trusting the Elohim (God) who is able to deliver, and faithful whether he delivers or not.'),
  ('canon', 'revelation', 13, 15, 'enoch', '1-enoch', 90, 14, 'extras', E'*And the beasts and the birds began to tremble, and the Lord of the sheep cast them all into a fiery abyss.* (1 Enoch 90:14). The restored library shows the end appointed for the beasts: *the Lord of the sheep cast them all into a fiery abyss.* The second beast that compels worship of the image, *that... as many as would not worship the image of the beast should be killed* (Revelation 13:15), is heading to that abyss — the false prophet and the beast cast living into the fire (Revelation 19:20). The fire the false prophet calls down to deceive is not the fire that has the last word; the Lord of the sheep''s fire is, and into it the beasts go.'),
  -- thread: revelation-13-the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal
  ('canon', 'revelation', 13, 16, 'canon', 'ezekiel', 9, 4, 'free', E'*And Yahuah (LORD) said unto him, Go through the midst of the city, through the midst of Jerusalem, and set a mark upon the foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof.* (Ezekiel 9:4). Here is the true mark the beast counterfeits: Yahuah (LORD) sets *a mark upon the foreheads* of those who grieve over abomination, and that mark is what spares them in the day of slaughter. The beast inverts it — he *causeth all... to receive a mark in their right hand, or in their foreheads* (Revelation 13:16), a forced mark of allegiance to the system, on the very forehead where Yahuah (LORD) seals his own. The faithful bear the seal of belonging to Yahuah (LORD); the beast brands the rest with the parody of it.'),
  ('canon', 'revelation', 13, 16, 'canon', 'deuteronomy', 6, 8, 'free', E'*And thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes.* (Deuteronomy 6:8). The commandments of Yahuah (LORD) are to be bound *for a sign upon thine hand* and *as frontlets between thine eyes* — the sign of covenant loyalty worn on the hand and the forehead, the love of Yahuah (LORD) and the keeping of his words made visible. The beast''s mark *in their right hand, or in their foreheads* (Revelation 13:16) is the deliberate counterfeit of that sign: where the faithful bind the Torah on hand and brow as the token of belonging to Yahuah (LORD), the beast-system stamps its own name on hand and brow as the token of belonging to it. The mark is the anti-Torah parody of the sign of the commandments; the saints are *they that keep the commandments of Elohim (God)* (Revelation 14:12), sealed with the Father''s name, not the beast''s.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one',
       E'The beast from the sea — Daniel''s four beasts gathered into one (Daniel 7)',
       E'John stands on the sand and sees *a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy* (Revelation 13:1), and the whole vision is Daniel 7 re-spoken. There *four great beasts came up from the sea, diverse one from another* (Daniel 7:3) — but where Daniel saw four, John sees them folded into one composite: *the beast which I saw was like unto a leopard, and his feet were as the feet of a bear, and his mouth as the mouth of a lion* (Revelation 13:2). The leopard is Daniel''s third beast (*lo another, like a leopard*, Daniel 7:6), the bear his second (*like to a bear*, Daniel 7:5), the lion his first (*the first was like a lion*, Daniel 7:4) — three kingdoms of old gathered into the body, feet, and mouth of the last beast. And the ten horns are the dreadful fourth: *a fourth beast, dreadful and terrible... and it had ten horns* (Daniel 7:7), *the fourth kingdom upon earth... [that] shall devour the whole earth* (Daniel 7:23). That world-wide reach John sees completed — *power was given him over all kindreds, and tongues, and nations* (Revelation 13:7). The restored library keeps the same vision: Ezra too saw *come up from the sea an eagle, which had twelve feathered wings, and three heads* (2 Esdras 11:1), reigning over all the earth, and the interpreting voice told him plainly, *The eagle, whom you sawest come up from the sea, is the kingdom which was seen in the vision of your brother Daniel* (2 Esdras 12:11). Three seers, one beast: the last and worst of the kingdoms that rise from the troubled sea of the nations, and *the dragon gave him his power, and his seat, and great authority* (Revelation 13:2). This is no new thing under the sun — it is the old beast-empire come to its head, and its end is already written in the same vision that named it.',
       sv.verse_id, ev.verse_id, 'extras', 9300
  FROM _s224_rv13_lookup sv, _s224_rv13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-13-the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped',
       E'All the world wondered and worshipped — the image all must worship (Daniel 3)',
       E'The wounded head is healed, *and all the world wondered after the beast. And they worshipped the dragon which gave power unto the beast: and they worshipped the beast, saying, Who is like unto the beast? who is able to make war with him?* (Revelation 13:3-4). The compelled worship of the whole earth is Nebuchadnezzar''s decree grown to fill the world. On the plain of Dura the herald commanded *that at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up* (Daniel 3:5), and *all the people, the nations, and the languages, fell down and worshipped the golden image* (Daniel 3:7). The same peoples, nations, and languages that bowed at Dura are the world that wonders after the beast; the same demand stands — fall down and worship the image, or die. The beast-system has always coveted the worship that belongs to Yahuah (LORD) alone and dressed its idol in music and majesty to win it. And as three men would not bow before the golden image then, trusting the Elohim (God) who was able to deliver them and faithful whether he delivered or not, so the saints will not worship the beast now. *Who is like unto the beast?* the world cries — but the cry mocks the song of the redeemed, *Who is like unto thee, O Yahuah (LORD), among the gods?* The beast is a counterfeit even in the worship it demands.',
       sv.verse_id, ev.verse_id, 'free', 9303
  FROM _s224_rv13_lookup sv, _s224_rv13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=13 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months',
       E'A mouth speaking great things, forty and two months, war with the saints (Daniel 7)',
       E'*And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months* (Revelation 13:5). Every phrase here is Daniel 7. The *mouth speaking great things* is the little horn''s — *in this horn were eyes like the eyes of man, and a mouth speaking great things* (Daniel 7:8). The *forty and two months* is Daniel''s *time, times, and the dividing of time* (Daniel 7:25). And that same verse names the beast''s deepest crime: *he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws.* This is the heart of it — the beast-system makes war on the commandments of Yahuah (LORD), reaching to alter the very times and laws he appointed, and that is the blasphemy John names when the beast *opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* (Revelation 13:6). The self-exalting king of Daniel 11 is of the same spirit: he *shall magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36). And the war is real — *it was given unto him to make war with the saints, and to overcome them* (Revelation 13:7), word for word *the same horn made war with the saints, and prevailed against them* (Daniel 7:21). But the overcoming is bounded twice over: bounded in time to the forty-and-two months, the season *till the indignation be accomplished* (Daniel 11:36); and bounded in outcome, for Daniel saw past it — *until the Ancient of days came, and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom* (Daniel 7:22). The mouth is loud, but the clock is the Father''s, and the verdict is already given for the saints.',
       sv.verse_id, ev.verse_id, 'free', 9306
  FROM _s224_rv13_lookup sv, _s224_rv13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=13 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain',
       E'Names not written in the book of life of the Lamb slain (Exodus 32, Psalm 69, Daniel 12)',
       E'*And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world* (Revelation 13:8). The worshippers of the beast are marked by a book — and it is no new register opened on the day belief begins. It is the book *written* of old, the one Moses pled over at Sinai: *if not, blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32). It is the *book of the living* the psalmist knew, set over against the company of the saved — *let them be blotted out of the book of the living, and not be written with the righteous* (Psalm 69:28). It is the book that delivers Daniel''s people through the worst trouble — *at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). One book runs through all of it: the register of Yahuah (LORD)''s own, the names *written... from the foundation of the world.* And the restored library keeps the same two books opened at the judgment — *the Lord of the sheep opened the books of the living, and the books of the sinners were opened* (1 Enoch 90:12). To worship the beast is to be found not in the books of the living but in the books of the sinners; to belong to the Lamb is to have a name written in his book before ever the beast rose. This is the framework''s order, against every gospel that makes the name a thing earned by the right confession: the Lamb who opens the book is the Lord of the sheep who gathers his own, and the writing of the name is the gathering, settled before the foundation of the world. The patience of the saints rests on the surety of that writing — the beast can make war on the body, but it cannot reach the name that is written.',
       sv.verse_id, ev.verse_id, 'extras', 9309
  FROM _s224_rv13_lookup sv, _s224_rv13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-13-he-that-leadeth-into-captivity-the-patience-and-faith-of-the-saints',
       E'He that leadeth into captivity — the patience and faith of the saints (Jeremiah 15, 43)',
       E'*He that leadeth into captivity shall go into captivity: he that killeth with the sword must be killed with the sword. Here is the patience and the faith of the saints* (Revelation 13:10). The words are spoken in the cadence of Jeremiah''s oracle, where Yahuah (LORD) apportions each to his measured portion: *Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity* (Jeremiah 15:2). He speaks it again over Egypt — *such as are for captivity to captivity; and such as are for the sword to the sword* (Jeremiah 43:11). The saints in the beast''s season are not promised escape from the sword or the captivity; what they are given is the assurance that none of it is chaos. Every portion is measured by Yahuah (LORD), and the captor and the killer come under the very same reckoning in their turn — *he that leadeth into captivity shall go into captivity.* That is where *the patience and the faith of the saints* is forged: not in deliverance from the suffering, but in the certainty that the One who measures the portions has already weighed the beast''s, and that endurance under it is the faithfulness that holds to the end. *If any man have an ear, let him hear* (Revelation 13:9).',
       sv.verse_id, ev.verse_id, 'free', 9312
  FROM _s224_rv13_lookup sv, _s224_rv13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-13-the-second-beast-like-a-lamb-the-false-prophet-and-the-fire',
       E'The second beast like a lamb, the false prophet and the fire (Deuteronomy 13, 1 Kings 18, Daniel 3)',
       E'*And I beheld another beast coming up out of the earth; and he had two horns like a lamb, and he spake as a dragon* (Revelation 13:11). The second beast wears the costume of a lamb and speaks with the dragon''s voice — the false prophet, and the Torah named his kind long before. *If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder* (Deuteronomy 13:1), and the sign comes to pass, yet he draws you after other gods — *thou shalt not hearken*, for *Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart* (Deuteronomy 13:3). A true-seeming sign is no proof of a true prophet; it is the proving of your loyalty. So when this beast *doeth great wonders, so that he maketh fire come down from heaven on the earth in the sight of men* (Revelation 13:13) and *deceiveth them that dwell on the earth by the means of those miracles* (Revelation 13:14), he is the sign-worker the Torah taught the people to refuse. And the sign he chooses is the very one the true Elohim (God) once owned: at Carmel the test was *the Elohim (God) that answereth by fire, let him be Elohim (God)* (1 Kings 18:24), and Yahuah (LORD) alone answered while the false prophets'' altar stayed cold. Now the false prophet apes that fire from heaven to claim the proof that was Yahuah (LORD)''s — the deceiver''s costume, not the verdict of heaven. His end is to make an image and an edict: *as many as would not worship the image of the beast should be killed* (Revelation 13:15), the same decree as Nebuchadnezzar''s — *whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace* (Daniel 3:6). But the fire he calls down to deceive does not have the last word. The restored library shows the end appointed for the beasts: *the Lord of the sheep cast them all into a fiery abyss* (1 Enoch 90:14). The false prophet who calls fire from heaven is himself cast into the fire; the saints who refuse his sign, like the three who would not bow, are kept by the Elohim (God) who is faithful whether he delivers or not.',
       sv.verse_id, ev.verse_id, 'extras', 9315
  FROM _s224_rv13_lookup sv, _s224_rv13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-13-the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal',
       E'The mark in the hand and forehead — counterfeit of the seal of covenant loyalty (Ezekiel 9, Deuteronomy 6)',
       E'*And he causeth all, both small and great, rich and poor, free and bond, to receive a mark in their right hand, or in their foreheads: and that no man might buy or sell, save he that had the mark, or the name of the beast, or the number of his name* (Revelation 13:16-17). The mark is no random brand — it is the deliberate counterfeit of the sign of belonging to Yahuah (LORD). For Yahuah (LORD) sets his own mark *upon the foreheads*: *Go through the midst of the city... and set a mark upon the foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof* (Ezekiel 9:4) — and that mark is what spares them in the day of slaughter, the seal of the faithful who grieve over the abomination the beast-system loves. And the sign is on the hand and the brow because that is where the covenant binds its loyalty: *thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8) — the commandments of Yahuah (LORD) worn on hand and forehead, the love of him and the keeping of his words made visible. The beast inverts exactly this. Where the faithful bind the Torah on hand and brow as the token of belonging to Yahuah (LORD), the beast stamps its own name on hand and brow as the token of belonging to it; the mark is the anti-Torah parody of the sign of the commandments, the system''s mockery of covenant loyalty. This is why the saints are defined over against it: *Here is the patience of the saints: here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus)* (Revelation 14:12). The two seals divide the whole earth — the Father''s name written in the foreheads of his own (Revelation 14:1), or the beast''s mark forced on the rest. *Here is wisdom. Let him that hath understanding count the number of the beast: for it is the number of a man; and his number is Six hundred threescore and six* (Revelation 13:18). The number is a man''s number; the seal of Yahuah (LORD) is the mark of those who are his, the commandment-keepers, sealed before the beast ever raised its mark.',
       sv.verse_id, ev.verse_id, 'free', 9318
  FROM _s224_rv13_lookup sv, _s224_rv13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:3 — *four great beasts came up from the sea, diverse one from another* the kingdoms rise from the troubled sea of the nations; John sees them gathered into one beast (Revelation 13:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:4 — *The first was like a lion* the lion''s mouth folded into the composite, *his mouth as the mouth of a lion* (Revelation 13:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:5 — *like to a bear... Arise, devour much flesh* the bear''s feet folded into the composite, *his feet were as the feet of a bear* (Revelation 13:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:6 — *another, like a leopard... dominion was given to it* the leopard''s body and given dominion, *like unto a leopard... the dragon gave him his power* (Revelation 13:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 7:7 — *a fourth beast, dreadful and terrible... and it had ten horns* the ten horns bind the visions, *seven heads and ten horns, and upon his horns ten crowns* (Revelation 13:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Daniel 7:23 — *the fourth kingdom... shall devour the whole earth* the world-wide reach John sees completed, *power... over all kindreds, and tongues, and nations* (Revelation 13:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'2 Esdras 11:1 — *there came up from the sea an eagle, which had twelve feathered wings, and three heads* the restored library''s sea-beast of many heads, reigning over all the earth (Revelation 13:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'2 Esdras 12:11 — *The eagle... is the kingdom which was seen in the vision of your brother Daniel* the interpreting voice ties the sea-eagle to Daniel''s fourth kingdom — the very beast John re-speaks (Revelation 13:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=12 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-13-the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:5 — *ye fall down and worship the golden image that Nebuchadnezzar the king hath set up* the compelled worship of the image, grown to fill the earth, *they worshipped the beast* (Revelation 13:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:7 — *all the people, the nations, and the languages, fell down and worshipped the golden image* the same peoples, nations, languages that bowed at Dura, *all the world wondered after the beast* (Revelation 13:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:8 — *in this horn were eyes like the eyes of man, and a mouth speaking great things* the little horn''s arrogant mouth becomes the beast''s, *a mouth speaking great things and blasphemies* (Revelation 13:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:25 — *think to change times and laws... a time and times and the dividing of time* the 42 months and the war on the commandments; the beast reaches to alter Yahuah (LORD)''s appointed times and laws (Revelation 13:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:21 — *the same horn made war with the saints, and prevailed against them* the war John re-speaks, bounded by the Ancient of days'' judgment for the saints, *to make war with the saints, and to overcome them* (Revelation 13:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 11:36 — *he shall... speak marvellous things against the Elohim (God) of gods... till the indignation be accomplished* the self-exalting king of the same spirit, bounded to the appointed season, *opened his mouth in blasphemy against Elohim (God)* (Revelation 13:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:32 — *blot me, I pray thee, out of thy book which thou hast written* the book written of old that Moses pled over; the names are written, not earned (Revelation 13:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 69:28 — *let them be blotted out of the book of the living, and not be written with the righteous* the book of the living, set over against the saved; the beast''s worshippers are not written there (Revelation 13:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *thy people shall be delivered, every one that shall be found written in the book* the book that delivers through the worst trouble; to be found in it is to be kept (Revelation 13:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 90:12 — *the Lord of the sheep opened the books of the living, and the books of the sinners were opened* the two books at the judgment; the beast''s worshippers stand in the books of the sinners (Revelation 13:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=90 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-13-he-that-leadeth-into-captivity-the-patience-and-faith-of-the-saints
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 15:2 — *such as are for the sword, to the sword... such as are for the captivity, to the captivity* the measured apportioning by Yahuah (LORD); the frame in which the saints endure (Revelation 13:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-he-that-leadeth-into-captivity-the-patience-and-faith-of-the-saints'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 43:11 — *such as are for captivity to captivity; and such as are for the sword to the sword* the same fixed apportioning; the captor and killer come under the same reckoning in their turn (Revelation 13:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-he-that-leadeth-into-captivity-the-patience-and-faith-of-the-saints'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=43 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-13-the-second-beast-like-a-lamb-the-false-prophet-and-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:1 — *a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder* the Torah''s false prophet whose sign proves loyalty, not truth; the second beast deceives by miracles (Revelation 13:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-second-beast-like-a-lamb-the-false-prophet-and-the-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 18:24 — *the Elohim (God) that answereth by fire, let him be Elohim (God)* the true fire at Carmel that was Yahuah (LORD)''s alone; the false prophet apes it, *maketh fire come down from heaven* (Revelation 13:13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-second-beast-like-a-lamb-the-false-prophet-and-the-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:6 — *whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace* the same edict the image carries, *as many as would not worship the image of the beast should be killed* (Revelation 13:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-second-beast-like-a-lamb-the-false-prophet-and-the-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 90:14 — *the Lord of the sheep cast them all into a fiery abyss* the end appointed for the beasts; the false prophet''s fire is not the fire that has the last word (Revelation 13:15).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-second-beast-like-a-lamb-the-false-prophet-and-the-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=90 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-13-the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 9:4 — *set a mark upon the foreheads of the men that sigh and that cry for all the abominations* the true seal of Yahuah (LORD) on the forehead that spares; the beast brands the parody of it (Revelation 13:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:8 — *bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* the commandments on hand and brow as the sign of covenant loyalty; the mark is its anti-Torah parody (Revelation 13:16).'
  FROM cross_reference_threads t, cross_references x, _s224_rv13_lookup sv, _s224_rv13_lookup tv
 WHERE t.slug='revelation-13-the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
