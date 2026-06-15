-- ----- fragment: minion_1peter_01.sql (S240 1 Peter 1) -----
-- =====================================================================
-- S240 minion — 1 PETER (Kepha Aleph) 1 FULL-LIBRARY cross-references
-- migration: session240_1peter_cross_references.sql
-- =====================================================================
-- Chapter: 1 PETER 1 (25 verses) — the letter to the scattered elect opens.
-- Tag: p240c1 (temp view _s240_p240c1_lookup).
-- Sort band: floor 9600, step 3 (9600, 9603, 9606, 9609, 9612, 9615 used).
-- Source is ALWAYS the canon 1 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME — 1 Peter is the LETTER TO THE SCATTERED ELECT, the dispersed two-house remnant of
-- Yashar'el (Israel) being re-gathered to one olive tree (1:1, the twin of James 1:1). It is a letter of
-- holiness in suffering. Chapter 1: the strangers scattered = the two-house dispersion (1:1); the trial of
-- faith tried as gold in the furnace (1:6-7); the prophets foretold the suffering Messiah (1:10-11); BE YE
-- HOLY FOR I AM HOLY = Leviticus 11:44 the dietary-law chapter — holiness commanded from the Torah, NOT
-- freedom from it (1:15-16); the lamb without blemish (1:18-19); all flesh is grass (1:24-25). Christology:
-- the Son foreordained before the foundation of the world and manifest in these last times (1:20); the
-- Father raised him up from the dead and gave him glory (1:21) — the Father is the source and the raiser.
-- No replacement theology, no law-vs-grace antithesis.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     the strangers scattered throughout Pontus, Galatia... [the two-house dispersion]
--           Tanakh: Deuteronomy 30:3-4 (gather thee from all the nations whither he hath scattered thee),
--                   Ezekiel 37:21-22 (the two sticks made one nation), Isaiah 11:11-12 (the outcasts of
--                   Yashar'el and the dispersed of Yahudah gathered)
--           Extras: none warranted   NT: James 1:1 (the twelve tribes which are scattered abroad — the twin)
--   v.2-5   elect... begotten again unto a lively hope... inheritance reserved in heaven
--           Tanakh: none warranted (carried in prose; salvation language not a single load-bearing root)
--           Extras: none warranted   NT: none warranted
--   v.6-7   the trial of your faith more precious than gold, tried with fire
--           Tanakh: Proverbs 17:3 (the furnace for gold, but Yahuah trieth the hearts), Job 23:10 (tried,
--                   I shall come forth as gold), Zechariah 13:9 (try them as gold is tried), Malachi 3:3
--                   (purge them as gold and silver)
--           Extras: Sirach 2:1,5 (if thou come to serve Yahuah, prepare for temptation; gold is tried in
--                   the fire), Wisdom of Solomon 3:5-6 (as gold in the furnace has he tried them)
--           NT: none warranted (the trial-as-gold root is the Tanakh + Hebrew library)
--   v.8-9   whom having not seen ye love... the salvation of your souls
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.10-12 the prophets enquired... the Spirit of Messiah testified the sufferings of Messiah
--           Tanakh: Isaiah 53:7 (brought as a lamb to the slaughter), Daniel 9:24-26 (Messiah cut off),
--                   Psalm 22:16 (they pierced my hands and my feet)
--           Extras: none warranted   NT: none warranted (the prophets' word is the Tanakh root)
--   v.13-14 gird up the loins of your mind, as obedient children
--           Tanakh: none warranted (exhortation; loins-girt carried in prose)   Extras/NT: none warranted
--   v.15-16 BE YE HOLY; FOR I AM HOLY [Torah affirmed — Leviticus 11, the dietary-law chapter]
--           Tanakh: Leviticus 11:44-45 (ye shall be holy; for I am holy), Leviticus 19:2 (ye shall be
--                   holy: for I Yahuah am holy), Leviticus 20:7,26 (be ye holy: for I Yahuah am holy)
--           Extras: none warranted   NT: none warranted (Peter quotes the Torah AS binding scripture)
--   v.17    if ye call on the Father, who judgeth according to every man's work
--           Tanakh: none warranted (carried in prose)   Extras/NT: none warranted
--   v.18-19 redeemed with the precious blood of Messiah, as of a lamb without blemish
--           Tanakh: Exodus 12:5 (your lamb shall be without blemish), Leviticus 22:19-20 (a male without
--                   blemish), Isaiah 53:7 (brought as a lamb to the slaughter)
--           Extras: none warranted   NT: none warranted
--   v.20-23 foreordained before the foundation of the world... born again by the word of Elohim
--           Tanakh: none warranted (Christology carried in prose; born-again carried elsewhere)
--           Extras: none warranted   NT: none warranted
--   v.24-25 all flesh is as grass... but the word of Yahuah endureth for ever
--           Tanakh: Isaiah 40:6-8 (all flesh is grass... but the word of our Elohim shall stand for ever),
--                   Psalm 103:15-16 (man's days are as grass)
--           Extras: none warranted   NT: James 1:10-11 (as the flower of the grass he shall pass away)
--
-- THREADS (slug -> target libraries):
--   9600 1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37  (Tanakh + NT)
--   9603 1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2   (Tanakh + Extras)
--   9606 1-peter-1-the-prophets-foretold-the-sufferings-of-messiah-isaiah-53-daniel-9          (Tanakh)
--   9609 1-peter-1-be-ye-holy-for-i-am-holy-leviticus-11                                       (Tanakh) [BLESSING]
--   9612 1-peter-1-a-lamb-without-blemish-the-precious-blood-exodus-12-isaiah-53               (Tanakh)
--   9615 1-peter-1-all-flesh-is-grass-but-the-word-endureth-for-ever-isaiah-40                 (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s240_p240c1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37
  ('canon', '1-peter', 1, 1, 'canon', 'deuteronomy', 30, 3, 'free', E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* (Deuteronomy 30:3). Moses promised that the scattered people would be gathered from all the nations whither Yahuah (LORD) had scattered them. Peter writes *to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia* (1 Peter 1:1) — the dispersed seed of Yashar''el (Israel) named as the *elect according to the foreknowledge of Elohim (God) the Father* (1 Peter 1:2). The strangers scattered are not a new people but the covenant remnant Yahuah (LORD) swore to gather; the letter is addressed to the dispersion being re-gathered to its own land and calling.'),
  ('canon', '1-peter', 1, 1, 'canon', 'deuteronomy', 30, 4, 'free', E'*If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee:* (Deuteronomy 30:4). Though they be *driven out unto the outmost parts of heaven,* Yahuah (LORD) would fetch them home. The *strangers scattered* of 1 Peter 1:1 — the dispersion across Pontus, Galatia, Cappadocia, Asia, and Bithynia — are the very outcasts of this promise, the elect of the dispersion whom the Father foreknew and is gathering. The scattering is the prelude to the gathering, not a casting-off.'),
  ('canon', '1-peter', 1, 1, 'canon', 'ezekiel', 37, 21, 'free', E'*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21). In the vision of the two sticks Yahuah (LORD) declares he will take the children of Yashar''el (Israel) from among the heathen and *gather them on every side.* Peter''s *strangers scattered* (1 Peter 1:1) are those very children scattered among the nations — the two-house remnant being made one again. The address of the letter is the address of the gathering promise.'),
  ('canon', '1-peter', 1, 1, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). The two houses — Yahudah (Judah) and Yashar''el (Israel) — are to be made *one nation,* no more divided into two kingdoms. The scattered elect Peter addresses (1 Peter 1:1) are that two-house remnant in dispersion, gathered toward the one nation under one king; this is the restoration of Yashar''el (Israel), not a new entity replacing her.'),
  ('canon', '1-peter', 1, 1, 'canon', 'isaiah', 11, 12, 'free', E'*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12). Isaiah names the gathering of both houses by their names: *the outcasts of Yashar''el (Israel)* and *the dispersed of Yahudah (Judah).* These are precisely Peter''s *strangers scattered* (1 Peter 1:1) — the dispersion (the diaspora) of the elect, gathered from the four corners of the earth. The letter is written to the people of this prophecy, the covenant remnant being assembled to the one olive tree.'),
  ('canon', '1-peter', 1, 1, 'canon', 'james', 1, 1, 'free', E'*James, a servant of Elohim (God) and of the Lord Yahusha HaMashiach (Lord Jesus Christ), to the twelve tribes which are scattered abroad, greeting.* (James 1:1). James addresses *the twelve tribes which are scattered abroad* — the exact twin of Peter''s greeting *to the strangers scattered throughout Pontus, Galatia* (1 Peter 1:1). Both letters are written to the dispersed elect of Yashar''el (Israel), the two-house remnant in diaspora. The shared address marks the same audience and the same framework: the scattered covenant people, not a Gentile church displacing them.'),
  -- thread: 1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2
  ('canon', '1-peter', 1, 7, 'canon', 'proverbs', 17, 3, 'free', E'*The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts.* (Proverbs 17:3). As the furnace tries gold, so Yahuah (LORD) tries the hearts. Peter says *the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire* (1 Peter 1:7). The fire that proves gold is the figure of the testing that proves faith — and faith is the more precious metal, the heart-trial Yahuah (LORD) himself conducts in the furnace of affliction.'),
  ('canon', '1-peter', 1, 7, 'canon', 'job', 23, 10, 'free', E'*But he knoweth the way that I take: when he hath tried me, I shall come forth as gold.* (Job 23:10). Job, in his suffering, trusts that when Yahuah (LORD) has tried him *I shall come forth as gold.* This is the very confidence Peter sets before the scattered elect *in heaviness through manifold temptations* (1 Peter 1:6): *the trial of your faith... though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:7). The fiery trial does not destroy but refines; the tried one comes forth as gold at the appearing.'),
  ('canon', '1-peter', 1, 7, 'canon', 'zechariah', 13, 9, 'free', E'*And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* (Zechariah 13:9). Yahuah (LORD) brings the remnant *through the fire,* refining and trying them *as gold is tried,* and they emerge as his people. This is the refining Peter names — *the trial of your faith... tried with fire* (1 Peter 1:7) — the fire that purifies the scattered remnant and proves them to be the people of Yahuah (LORD), more precious than perishing gold.'),
  ('canon', '1-peter', 1, 7, 'canon', 'malachi', 3, 3, 'free', E'*And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* (Malachi 3:3). Yahuah (LORD) sits *as a refiner and purifier,* purging his people *as gold and silver.* Peter speaks of the same refining fire: *the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire* (1 Peter 1:7). The trial is the Refiner''s work, purifying the faith of the elect that they might be found unto praise and honour and glory.'),
  ('canon', '1-peter', 1, 7, 'apocrypha', 'ecclesiasticus', 2, 1, 'extras', E'*My son, if you come to serve Yahuah (God), prepare your soul for temptation.* (Sirach 2:1). The Hebrew wisdom of Ben Sira sets the rule of the faithful life: to come to serve Yahuah (God) is to prepare the soul for testing. Peter writes to those who *are in heaviness through manifold temptations* (1 Peter 1:6), where *the trial of your faith* is being proved (1 Peter 1:7). The trial is not strange to the servant of Yahuah (God) but expected — the soul made ready beforehand for the furnace.'),
  ('canon', '1-peter', 1, 7, 'apocrypha', 'ecclesiasticus', 2, 5, 'extras', E'*For gold is tried in the fire, and acceptable men in the furnace of adversity.* (Sirach 2:5). Ben Sira gives the very image Peter uses: *gold is tried in the fire, and acceptable men in the furnace of adversity.* Peter writes *the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire* (1 Peter 1:7). The furnace of adversity is the proving-ground of the acceptable; the faith refined in it is more precious than the gold the same fire tries.'),
  ('canon', '1-peter', 1, 7, 'apocrypha', 'the-wisdom-of-solomon', 3, 5, 'extras', E'*And having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them, and found them worthy for himself.* (Wisdom of Solomon 3:5). Wisdom teaches that the righteous, *a little chastised,* are proved by Yahuah (God) and *found... worthy for himself.* Peter writes that the trial, *though now for a season* (1 Peter 1:6), proves the faith *much more precious than of gold... that it be tried with fire, might be found unto praise and honour and glory* (1 Peter 1:7). The little season of chastening yields the great reward; the proving makes the elect worthy at the appearing.'),
  ('canon', '1-peter', 1, 7, 'apocrypha', 'the-wisdom-of-solomon', 3, 6, 'extras', E'*As gold in the furnace has he tried them, and received them as a burnt offering.* (Wisdom of Solomon 3:6). The Hebrew library makes the figure explicit: *as gold in the furnace has he tried them.* This is the exact image of 1 Peter 1:7 — *the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire.* The furnace that tries gold tries the faithful, and they are received as an offering; the fiery trial is the proving and the consecration of the elect.'),
  -- thread: 1-peter-1-the-prophets-foretold-the-sufferings-of-messiah-isaiah-53-daniel-9
  ('canon', '1-peter', 1, 11, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7). Isaiah foretold the suffering servant *brought as a lamb to the slaughter.* Peter says the prophets, by *the Spirit of Messiah (Christ) which was in them,* *testified beforehand the sufferings of Messiah (Christ), and the glory that should follow* (1 Peter 1:11). Isaiah 53 is the foremost of those testimonies — the Spirit of Messiah (Christ) speaking through the prophet of the very suffering that was to come, the lamb afflicted and silent.'),
  ('canon', '1-peter', 1, 11, 'canon', 'daniel', 9, 26, 'free', E'*And after threescore and two weeks shall Messiah be cut off, but not for himself: and the people of the prince that shall come shall destroy the city and the sanctuary; and the end thereof shall be with a flood, and unto the end of the war desolations are determined.* (Daniel 9:26). Daniel was shown that *Messiah be cut off, but not for himself* — the appointed suffering of the Anointed. Peter says the prophets *enquired and searched diligently* (1 Peter 1:10) into the time the Spirit of Messiah (Christ) signified *when it testified beforehand the sufferings of Messiah (Christ)* (1 Peter 1:11). Daniel is one such searching prophet, given the very sequence of the cutting-off and the glory that should follow.'),
  ('canon', '1-peter', 1, 11, 'canon', 'psalms', 22, 16, 'free', E'*For dogs have compassed me: the assembly of the wicked have inclosed me: they pierced my hands and my feet.* (Psalm 22:16). David, by the Spirit, foretold the piercing of the sufferer''s hands and feet. Peter says the Spirit of Messiah (Christ) in the prophets *testified beforehand the sufferings of Messiah (Christ)* (1 Peter 1:11). Psalm 22 is among those Spirit-borne testimonies — the prophet enquiring into a grace and a suffering not yet come, the pierced hands and feet of the Messiah foreshown long before.'),
  -- thread: 1-peter-1-be-ye-holy-for-i-am-holy-leviticus-11  [BLESSING]
  ('canon', '1-peter', 1, 16, 'canon', 'leviticus', 11, 44, 'free', E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth.* (Leviticus 11:44). When Peter writes *Be ye holy; for I am holy* (1 Peter 1:16), he quotes *because it is written* (1 Peter 1:15-16) — and what is written is Leviticus 11:44. Mark the chapter: Leviticus 11 is the law of clean and unclean meats, the dietary Torah. Peter grounds the believer''s whole holy walk in the very chapter the antinomian reading claims was abolished — *ye shall be holy; for I am holy* spoken in the same breath as *neither shall ye defile yourselves.* The Torah is the standard of holiness, quoted as binding scripture, not the thing left behind.'),
  ('canon', '1-peter', 1, 16, 'canon', 'leviticus', 11, 45, 'free', E'*For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy.* (Leviticus 11:45). The command Peter cites is repeated in the redemption-clause: Yahuah (LORD) who brought them up out of Egypt says *ye shall therefore be holy, for I am holy.* Peter writes *as he which hath called you is holy, so be ye holy in all manner of conversation* (1 Peter 1:15) — holiness flowing from redemption, exactly as in Leviticus: the redeemed people called to be holy as their Redeemer is holy. The pattern of Exodus and the call to holiness are one, then and now.'),
  ('canon', '1-peter', 1, 16, 'canon', 'leviticus', 19, 2, 'free', E'*Speak unto all the congregation of the children of Yashar''el (Israel), and say unto them, Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy.* (Leviticus 19:2). The same command opens the Holiness Code: *Ye shall be holy: for I Yahuah (LORD)... am holy.* Peter''s *Be ye holy; for I am holy* (1 Peter 1:16) is this refrain of the Torah, addressed to the congregation of the children of Yashar''el (Israel) and now to the scattered elect. The standard of the holy life is unchanged — the holiness of Yahuah (LORD) himself, made the measure of his people''s walk.'),
  ('canon', '1-peter', 1, 16, 'canon', 'leviticus', 20, 7, 'free', E'*Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God).* (Leviticus 20:7). Again the Torah commands *be ye holy: for I am Yahuah (LORD)...* — the third repetition of the refrain Peter cites. Peter says *as obedient children, not fashioning yourselves according to the former lusts... but as he which hath called you is holy, so be ye holy* (1 Peter 1:14-15). The sanctification of oneself unto the holiness of Yahuah (LORD), commanded throughout Leviticus, is the very walk Peter calls the elect to keep.'),
  -- thread: 1-peter-1-a-lamb-without-blemish-the-precious-blood-exodus-12-isaiah-53
  ('canon', '1-peter', 1, 19, 'canon', 'exodus', 12, 5, 'free', E'*Your lamb shall be without blemish, a male of the first year: ye shall take it out from the sheep, or from the goats:* (Exodus 12:5). The Passover lamb of the Exodus *shall be without blemish.* Peter says the elect were *redeemed... with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:18-19). The unblemished lamb whose blood delivered Yashar''el (Israel) from Egypt is the figure of the Messiah whose precious blood redeems the scattered elect — the same pattern of the spotless lamb and the blood that delivers.'),
  ('canon', '1-peter', 1, 19, 'canon', 'leviticus', 22, 19, 'free', E'*Ye shall offer at your own will a male without blemish, of the beeves, of the sheep, or of the goats.* (Leviticus 22:19). The Torah of offerings requires *a male without blemish* — nothing defective is acceptable to Yahuah (LORD). Peter applies the standard to the Messiah: *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). The acceptable offering of the sanctuary, flawless and unspotted, is fulfilled in the unblemished Lamb whose blood is the redemption price, not corruptible silver and gold.'),
  ('canon', '1-peter', 1, 19, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7). The suffering servant is *brought as a lamb to the slaughter.* Peter names the Messiah *a lamb without blemish and without spot* whose *precious blood* redeems (1 Peter 1:19). Isaiah''s silent lamb led to slaughter and Peter''s unblemished, spotless Lamb are one — the servant-Lamb whose offering is the redemption of the people, foreshown in the prophet and fulfilled in the blood.'),
  -- thread: 1-peter-1-all-flesh-is-grass-but-the-word-endureth-for-ever-isaiah-40
  ('canon', '1-peter', 1, 24, 'canon', 'isaiah', 40, 6, 'free', E'*The voice said, Cry. And he said, What shall I cry? All flesh is grass, and all the goodliness thereof is as the flower of the field:* (Isaiah 40:6). Peter quotes Isaiah almost word for word: *For all flesh is as grass, and all the glory of man as the flower of grass* (1 Peter 1:24). The voice that cried *All flesh is grass* in Isaiah is the word Peter sets against the perishing of man — the frailty of flesh contrasted with the imperishable seed by which the elect are born again (1 Peter 1:23).'),
  ('canon', '1-peter', 1, 25, 'canon', 'isaiah', 40, 8, 'free', E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever.* (Isaiah 40:8). Isaiah''s contrast is exact: the grass withers, the flower fades, *but the word of our Elohim (God) shall stand for ever.* Peter closes the quotation in the same words: *But the word of Yahuah (Lord) endureth for ever. And this is the word which by the gospel is preached unto you* (1 Peter 1:25). The enduring word of Isaiah is the incorruptible seed of the new birth — the gospel-word preached to the scattered elect, standing for ever while all flesh fades like grass.'),
  ('canon', '1-peter', 1, 24, 'canon', 'psalms', 103, 15, 'free', E'*As for man, his days are as grass: as a flower of the field, so he flourisheth.* (Psalm 103:15). David sings the same frailty: *man, his days are as grass: as a flower of the field.* Peter writes *all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away* (1 Peter 1:24). The grass-and-flower image of the Psalm underlies Peter''s contrast — the fleeting flesh against the everlasting word by which the elect are born anew.'),
  ('canon', '1-peter', 1, 24, 'canon', 'james', 1, 10, 'free', E'*But the rich, in that he is made low: because as the flower of the grass he shall pass away.* (James 1:10). James, the twin epistle to the scattered, uses the same figure: *as the flower of the grass he shall pass away,* and *the grass withereth, and the flower thereof falleth* (James 1:10-11). Peter writes *all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away* (1 Peter 1:24). The two letters to the dispersion draw the same Isaiah-image of fading flesh; in both the perishing flower sets off the enduring word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s240_p240c1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s240_p240c1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37',
       E'The strangers scattered — the two-house dispersion (Deuteronomy 30, Ezekiel 37, Isaiah 11)',
       E'Peter opens *to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia* (1 Peter 1:1), the *elect according to the foreknowledge of Elohim (God) the Father* (1 Peter 1:2). Read through the framework, the *strangers scattered* — the dispersion — are the scattered seed of Yashar''el (Israel), the two-house remnant Yahuah (LORD) promised to gather, not a new people displacing them. Moses foretold it: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity... and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3), and though they be *driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* (Deuteronomy 30:4). Ezekiel saw the two sticks made one: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side* (Ezekiel 37:21), so that *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Isaiah named both houses by name: Yahuah (LORD) *shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). And the twin letter of James carries the identical address: *to the twelve tribes which are scattered abroad* (James 1:1). The strangers scattered are the covenant remnant being re-gathered to the one olive tree — the elect of the dispersion, foreknown by the Father, addressed by the apostle as Yashar''el (Israel) restored.',
       sv.verse_id, ev.verse_id, 'free', 9600
  FROM _s240_p240c1_lookup sv, _s240_p240c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2',
       E'The trial of your faith, tried as gold in the furnace (Proverbs 17, Job 23, Sirach 2, Wisdom 3)',
       E'Peter tells the scattered elect that though *now for a season... ye are in heaviness through manifold temptations: That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:6-7). The figure runs the length of the restored library. Solomon: *The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts* (Proverbs 17:3). Job, in the fire of his suffering, trusts: *when he hath tried me, I shall come forth as gold* (Job 23:10). Zechariah: Yahuah (LORD) brings the remnant *through the fire, and will refine them as silver is refined, and will try them as gold is tried... and they shall say, Yahuah (LORD) is my Elohim (God)* (Zechariah 13:9). Malachi: *he shall sit as a refiner and purifier of silver... and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). The Hebrew wisdom-books say the same: *My son, if you come to serve Yahuah (God), prepare your soul for temptation* (Sirach 2:1), for *gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5); and the righteous, *having been a little chastised... shall be greatly rewarded: for Yahuah (God) proved them... As gold in the furnace has he tried them* (Wisdom of Solomon 3:5-6). The fiery trial is not the enemy of faith but its refining; the tried faith of the elect comes forth more precious than perishing gold, found unto praise and honour and glory at the appearing.',
       sv.verse_id, ev.verse_id, 'extras', 9603
  FROM _s240_p240c1_lookup sv, _s240_p240c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-1-the-prophets-foretold-the-sufferings-of-messiah-isaiah-53-daniel-9',
       E'The prophets foretold the sufferings of Messiah (Isaiah 53, Daniel 9, Psalm 22)',
       E'Peter says that *of which salvation the prophets have enquired and searched diligently, who prophesied of the grace that should come unto you: Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow* (1 Peter 1:10-11). The prophets, by the Spirit of Messiah (Christ), foretold the suffering and the glory before they came. Isaiah saw the servant-Lamb: *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7). Daniel was shown the cutting-off and its appointed time: *after threescore and two weeks shall Messiah be cut off, but not for himself* (Daniel 9:26) — the very time the diligent prophet searched. And David, by the Spirit, foreshowed the piercing: *they pierced my hands and my feet* (Psalm 22:16). These are the testimonies Peter means — the Spirit of Messiah (Christ) speaking through Isaiah, Daniel, and David of the sufferings to come and the glory that should follow, the prophetic word that now finds its fulfilment in the One the scattered elect believe though they have not seen.',
       sv.verse_id, ev.verse_id, 'free', 9606
  FROM _s240_p240c1_lookup sv, _s240_p240c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-1-be-ye-holy-for-i-am-holy-leviticus-11',
       E'Be ye holy; for I am holy — the holiness of the Torah (Leviticus 11, 19, 20)',
       E'Peter commands the scattered elect: *as he which hath called you is holy, so be ye holy in all manner of conversation; Because it is written, Be ye holy; for I am holy* (1 Peter 1:15-16). He quotes *because it is written* — and what is written is the Torah. The text is Leviticus 11:44: *For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth* (Leviticus 11:44), repeated in the redemption-clause: *For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy* (Leviticus 11:45). Mark the chapter: Leviticus 11 is the law of clean and unclean meats, the dietary Torah. Peter grounds the believer''s whole holy walk in the very chapter the antinomian reading claims was abolished — *ye shall be holy; for I am holy* spoken in the same breath as *neither shall ye defile yourselves.* The refrain runs through the Holiness Code: *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2), and *Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God)* (Leviticus 20:7). Peter does not treat holiness as freedom from the Torah; he cites the Torah as the standard of holiness, quoted as binding scripture. The call is what it always was — the redeemed people made holy as their Redeemer is holy.',
       sv.verse_id, ev.verse_id, 'free', 9609
  FROM _s240_p240c1_lookup sv, _s240_p240c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-1-a-lamb-without-blemish-the-precious-blood-exodus-12-isaiah-53',
       E'A lamb without blemish — the precious blood that redeems (Exodus 12, Leviticus 22, Isaiah 53)',
       E'Peter tells the elect *ye were not redeemed with corruptible things, as silver and gold... But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:18-19). The unblemished lamb is the Torah''s lamb. The Passover lamb of the Exodus, whose blood delivered Yashar''el (Israel) from Egypt, *shall be without blemish, a male of the first year* (Exodus 12:5). The law of offerings requires the same flawlessness: *Ye shall offer at your own will a male without blemish, of the beeves, of the sheep, or of the goats* (Leviticus 22:19) — nothing defective is acceptable to Yahuah (LORD). And Isaiah saw the servant himself as the lamb: *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7). The spotless Passover lamb whose blood delivered the people, the unblemished offering of the sanctuary, and the silent servant-Lamb of Isaiah are gathered up into the Messiah, *a lamb without blemish and without spot,* whose precious blood — not corruptible silver and gold — is the redemption of the scattered elect.',
       sv.verse_id, ev.verse_id, 'free', 9612
  FROM _s240_p240c1_lookup sv, _s240_p240c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=1 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-1-all-flesh-is-grass-but-the-word-endureth-for-ever-isaiah-40',
       E'All flesh is grass, but the word endureth for ever (Isaiah 40, Psalm 103, James 1)',
       E'Peter sets the new birth *not of corruptible seed, but of incorruptible, by the word of Elohim (God), which liveth and abideth for ever* (1 Peter 1:23) against the frailty of flesh, and closes with Isaiah quoted nearly verbatim: *For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away: But the word of Yahuah (Lord) endureth for ever. And this is the word which by the gospel is preached unto you* (1 Peter 1:24-25). The root is Isaiah: *The voice said, Cry... All flesh is grass, and all the goodliness thereof is as the flower of the field* (Isaiah 40:6); *The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). David sang the same: *As for man, his days are as grass: as a flower of the field, so he flourisheth* (Psalm 103:15). And the twin letter to the scattered uses the identical image: *as the flower of the grass he shall pass away... the grass withereth, and the flower thereof falleth* (James 1:10-11). The fleeting flesh, withering like grass, sets off the everlasting word — and that enduring word is the incorruptible seed of the new birth, the gospel preached to the dispersion, standing for ever while all flesh fades.',
       sv.verse_id, ev.verse_id, 'free', 9615
  FROM _s240_p240c1_lookup sv, _s240_p240c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=1 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *Yahuah Elohayka (the LORD thy God) will turn thy captivity... and will return and gather thee from all the nations, whither... hath scattered thee* the gathering promise behind the *strangers scattered* (1 Peter 1:1).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* the scattered fetched home; the dispersion of 1 Peter 1:1.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:21 — *I will take the children of Yashar''el (Israel) from among the heathen... and will gather them on every side* the two-stick gathering; Peter''s scattered children of Yashar''el (Israel) (1 Peter 1:1).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:22 — *I will make them one nation... they shall be no more two nations, neither shall they be divided into two kingdoms* the two houses made one; the two-house remnant of 1 Peter 1:1.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 11:12 — *shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* both houses named; the dispersion Peter addresses (1 Peter 1:1).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'James 1:1 — *to the twelve tribes which are scattered abroad* the exact twin of Peter''s address to *the strangers scattered* (1 Peter 1:1); the same dispersed elect.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-strangers-scattered-the-two-house-dispersion-deuteronomy-30-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:3 — *The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts* the furnace that proves gold the figure of the heart-trial; *the trial of your faith... tried with fire* (1 Peter 1:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 23:10 — *when he hath tried me, I shall come forth as gold* the sufferer''s confidence in the refining; *the trial of your faith... found unto praise and honour and glory* (1 Peter 1:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=23 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 13:9 — *I will... try them as gold is tried: they shall call on my name... It is my people* the remnant brought through the fire; the trial of faith tried with fire (1 Peter 1:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:3 — *he shall sit as a refiner and purifier of silver... and purge them as gold and silver* the Refiner''s work; the trial that proves faith more precious than gold (1 Peter 1:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 2:1 — *if you come to serve Yahuah (God), prepare your soul for temptation* the servant readied for testing; Peter''s elect *in heaviness through manifold temptations* (1 Peter 1:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 2:5 — *gold is tried in the fire, and acceptable men in the furnace of adversity* the exact image of the trial of faith *much more precious than of gold... tried with fire* (1 Peter 1:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Wisdom of Solomon 3:5 — *having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them* the little season of testing yielding the great reward; *though now for a season* (1 Peter 1:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Wisdom of Solomon 3:6 — *As gold in the furnace has he tried them, and received them as a burnt offering* the figure made explicit; the trial of faith tried with fire (1 Peter 1:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-trial-of-your-faith-tried-as-gold-in-the-furnace-proverbs-17-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-1-the-prophets-foretold-the-sufferings-of-messiah-isaiah-53-daniel-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:7 — *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb* the foremost testimony of the suffering servant; *the sufferings of Messiah (Christ)* foretold (1 Peter 1:11).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-prophets-foretold-the-sufferings-of-messiah-isaiah-53-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:26 — *after threescore and two weeks shall Messiah be cut off, but not for himself* the appointed cutting-off the prophet searched; *what manner of time the Spirit of Messiah (Christ)... did signify* (1 Peter 1:11).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-prophets-foretold-the-sufferings-of-messiah-isaiah-53-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:16 — *they pierced my hands and my feet* David''s Spirit-borne foreshowing of the piercing; the prophets *testified beforehand the sufferings of Messiah (Christ)* (1 Peter 1:11).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-the-prophets-foretold-the-sufferings-of-messiah-isaiah-53-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-1-be-ye-holy-for-i-am-holy-leviticus-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:44 — *ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing* the very text Peter quotes *because it is written* — the dietary-law chapter, holiness from the Torah (1 Peter 1:16).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-be-ye-holy-for-i-am-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:45 — *I am Yahuah (LORD) that bringeth you up out of the land of Egypt... ye shall therefore be holy, for I am holy* holiness flowing from redemption, as Peter''s call from the One who hath called them (1 Peter 1:15).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-be-ye-holy-for-i-am-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:2 — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* the Holiness Code refrain Peter cites; the standard of the holy walk (1 Peter 1:15-16).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-be-ye-holy-for-i-am-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 20:7 — *Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God)* the sanctification commanded throughout the Torah; *as obedient children... so be ye holy* (1 Peter 1:14-15).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-be-ye-holy-for-i-am-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-1-a-lamb-without-blemish-the-precious-blood-exodus-12-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:5 — *Your lamb shall be without blemish, a male of the first year* the Passover lamb whose blood delivered Yashar''el (Israel); *a lamb without blemish and without spot* (1 Peter 1:19).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-a-lamb-without-blemish-the-precious-blood-exodus-12-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 22:19 — *Ye shall offer at your own will a male without blemish* the flawless offering acceptable to Yahuah (LORD); the unblemished Lamb whose precious blood redeems (1 Peter 1:19).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-a-lamb-without-blemish-the-precious-blood-exodus-12-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=22 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:7 — *he is brought as a lamb to the slaughter* the silent servant-Lamb of the prophet; the Messiah *as of a lamb without blemish and without spot* (1 Peter 1:19).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-a-lamb-without-blemish-the-precious-blood-exodus-12-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-1-all-flesh-is-grass-but-the-word-endureth-for-ever-isaiah-40
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:6 — *All flesh is grass, and all the goodliness thereof is as the flower of the field* quoted nearly verbatim; *all flesh is as grass, and all the glory of man as the flower of grass* (1 Peter 1:24).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-all-flesh-is-grass-but-the-word-endureth-for-ever-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:8 — *The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* the enduring word; *but the word of Yahuah (Lord) endureth for ever* (1 Peter 1:25).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-all-flesh-is-grass-but-the-word-endureth-for-ever-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 103:15 — *As for man, his days are as grass: as a flower of the field, so he flourisheth* the same frailty of flesh; *all flesh is as grass... the flower thereof falleth away* (1 Peter 1:24).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-all-flesh-is-grass-but-the-word-endureth-for-ever-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:10 — *as the flower of the grass he shall pass away* the twin letter''s same Isaiah-image of fading flesh; *all the glory of man as the flower of grass* (1 Peter 1:24).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c1_lookup sv, _s240_p240c1_lookup tv
 WHERE t.slug='1-peter-1-all-flesh-is-grass-but-the-word-endureth-for-ever-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
