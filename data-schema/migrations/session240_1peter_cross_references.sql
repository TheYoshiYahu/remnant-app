-- =====================================================================
-- Session 240 — 1 Peter FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session240_1peter_cross_references.sql
-- =====================================================================

\echo 'session240 — 1 Peter cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_1peter_02.sql (S240 1 Peter 2) -----
-- =====================================================================
-- S240 minion — 1 PETER 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 PETER 2 (25 verses) — THE LIVING STONE / THE PECULIAR PEOPLE / THE STRIPES THAT HEAL.
-- Tag: p240c2 (temp view _s240_p240c2_lookup).
-- Sort band: floor 9630, step 3 (9630, 9633, 9636, 9639, 9642 used; under 9660).
-- Migration (header only): session240_1peter_cross_references.sql
-- Source is ALWAYS the canon 1 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 Peter = the letter to the scattered elect, the dispersed two-house remnant
-- called a chosen generation, a royal priesthood, an holy nation, a peculiar people — Israel's own
-- Sinai vocation [Exodus 19:5-6], NOT a new entity replacing Yashar'el. Same Yahuah, same Torah,
-- the holiness commanded from Leviticus, the living stone for both houses, the suffering Servant
-- of Isaiah 53). Chapter 2 is the heart of the book: the milk of the word and the taste that
-- Yahuah is gracious (Psalm 34); the living stone and the rejected stone welded from Isaiah 28,
-- Psalm 118, and Isaiah 8 (the stone of stumbling *to both the houses of Yashar'el*); the chosen
-- generation / royal priesthood / holy nation / peculiar people of Exodus 19 restored to the
-- scattered seed (Hosea's Lo-ammi made Ammi); fear Elohim, honour the king (Proverbs 24); and the
-- stripes that heal, Isaiah 53 woven verbatim around the suffering Servant. Christology: it is the
-- Formed Son who *did no sin* and *bare our sins in his own body on the tree*, the suffering
-- Servant, leaving an example — keep him the One the Father sent and will raise.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   newborn babes desire the sincere milk; tasted that Yahuah is gracious
--           Tanakh: Psalm 34:8 (O taste and see that Yahuah is good)
--           Extras: none warranted   NT: none warranted (the Psalm root carries it)
--   v.4-8   the living stone, the chief corner stone, the rejected head of the corner, the
--           stone of stumbling and rock of offence
--           Tanakh: Isaiah 28:16 (a tried stone, a precious corner stone), Psalm 118:22 (the stone
--                   the builders refused become the head stone of the corner), Isaiah 8:14 (a stone
--                   of stumbling... to both the houses of Yashar'el)
--           Extras: none warranted
--           NT: Romans 9:33 (the stumblingstone in Sion), Ephesians 2:20 (the chief corner stone),
--                   Matthew 21:42 (the stone which the builders rejected)
--   v.5,9   built up a spiritual house, an holy priesthood; a chosen generation, a royal priesthood,
--           an holy nation, a peculiar people (woven into the peculiar-people thread)
--           Tanakh: Exodus 19:5-6 (a peculiar treasure... a kingdom of priests, and an holy nation),
--                   Deuteronomy 7:6 / 14:2 (a peculiar people), Isaiah 43:21 (this people have I
--                   formed... they shall shew forth my praise)
--           Extras: none warranted   NT: none warranted (the Sinai root and Hosea carry it)
--   v.10    in time past were not a people, but are now the people of Elohim; mercy obtained
--           Tanakh: Hosea 1:10 (Ye are the sons of the living Elohim), Hosea 2:23 (I will say to
--                   them which were not my people, Thou art my people)
--           Extras: none warranted   NT: none warranted
--   v.11-16 strangers and pilgrims; honest conversation; submit to ordinances; as free, servants
--           Tanakh: none warranted (the strangers-and-pilgrims weight carried in the ch1 scattered
--                   thread; v.11-16 are exhortation, not a load-bearing quote of one verse)
--           Extras: none warranted   NT: none warranted
--   v.17    Fear Elohim. Honour the king.
--           Tanakh: Proverbs 24:21 (My son, fear thou Yahuah and the king)
--           Extras: none warranted   NT: none warranted
--   v.18-20 servants be subject; thankworthy to endure grief suffering wrongfully
--           Tanakh: none warranted (folded into the example-of-the-Servant weight at 21-25)
--           Extras: none warranted   NT: none warranted
--   v.21-25 Messiah suffered leaving an example; did no sin, no guile in his mouth; bare our sins
--           on the tree; by whose stripes ye were healed; ye were as sheep going astray
--           Tanakh: Isaiah 53:9 (he had done no violence, neither was any deceit in his mouth),
--                   Isaiah 53:5 (with his stripes we are healed), Isaiah 53:4 (he hath borne our
--                   griefs), Isaiah 53:6 (all we like sheep have gone astray), Isaiah 53:7 (he
--                   opened not his mouth, as a lamb to the slaughter)
--           Extras: none warranted   NT: none warranted (the Servant-song root is the whole weave)
--
-- THREADS (slug -> target libraries):
--   9630 1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34          (Tanakh)
--   9633 1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8  (Tanakh + NT)
--   9636 1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea  (Tanakh)  [BLESSING]
--   9639 1-peter-2-fear-elohim-honour-the-king-proverbs-24                          (Tanakh)
--   9642 1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53                        (Tanakh)  [BLESSING]
-- =====================================================================

CREATE TEMP VIEW _s240_p240c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34
  ('canon', '1-peter', 2, 3, 'canon', 'psalms', 34, 8, 'free', E'*O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him.* (Psalm 34:8). Peter bids the newborn babes *desire the sincere milk of the word, that ye may grow thereby: If so be ye have tasted that Yahuah (Lord) is gracious* (1 Peter 2:2-3). The very figure is David''s — *taste and see that Yahuah (LORD) is good* — the experiential knowing of Yahuah''s goodness that grounds trust. Peter takes the Psalm''s invitation and applies it to the word that feeds the gathered: they have tasted, in the milk of the word, that Yahuah (Lord) is gracious, and so they grow. The whole of Psalm 34 stands under this chapter; here its opening invitation is the root of Peter''s call to grow by the word.'),
  -- thread: 1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8
  ('canon', '1-peter', 2, 6, 'canon', 'isaiah', 28, 16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16). Peter quotes this as scripture: *Wherefore also it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6). The *tried stone, a precious corner stone* Yahuah (LORD) lays in Zion is the Messiah, the living stone *chosen of Elohim (God), and precious* (1 Peter 2:4); and the promise *he that believeth shall not make haste* becomes *he that believeth on him shall not be confounded.* The sure foundation of Isaiah is the One Peter names — the elect, precious corner stone laid in Sion.'),
  ('canon', '1-peter', 2, 7, 'canon', 'psalms', 118, 22, 'free', E'*The stone which the builders refused is become the head stone of the corner.* (Psalm 118:22). Peter weaves this straight into his stone-witness: *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7). The rejected stone of the Psalm — refused by the builders, yet exalted by Yahuah (LORD) to be the head of the corner — is the Messiah, *disallowed indeed of men, but chosen of Elohim (God), and precious* (1 Peter 2:4). To them that believe he is precious; to the disobedient he is the disallowed stone now crowned. The reversal David sang is the gospel-pattern Peter preaches: the rejected One is made the chief corner stone.'),
  ('canon', '1-peter', 2, 8, 'canon', 'isaiah', 8, 14, 'free', E'*And he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel), for a gin and for a snare to the inhabitants of Jerusalem.* (Isaiah 8:14). Peter completes the stone-mosaic with Isaiah''s warning: *And a stone of stumbling, and a rock of offence, even to them which stumble at the word, being disobedient* (1 Peter 2:8). Mark Isaiah''s phrase — *a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* — the same stone is sanctuary to those who believe and stumbling to those who refuse, and it stands before *both the houses* of Yashar''el (Israel), Yahudah and Yisra''el alike. The living stone Peter names is precious to the believing and an offence to the disobedient, exactly as Isaiah foretold for the whole house.'),
  ('canon', '1-peter', 2, 8, 'canon', 'romans', 9, 33, 'free', E'*As it is written, Behold, I lay in Sion a stumblingstone and rock of offence: and whosoever believeth on him shall not be ashamed.* (Romans 9:33). Paul welds the same two Isaiah texts Peter welds — *I lay in Sion* (Isaiah 28:16) and *a stumblingstone and rock of offence* (Isaiah 8:14) — into one witness. Peter does likewise: *a chief corner stone, elect, precious* and *a stone of stumbling, and a rock of offence* (1 Peter 2:6,8). Two apostles, reading the same scriptures, name the same stone: precious to the believing, a stumblingstone to the disobedient, yet *whosoever believeth on him shall not be ashamed.* The stone in Sion is the Messiah, and faith in him is the dividing line.'),
  ('canon', '1-peter', 2, 6, 'canon', 'ephesians', 2, 20, 'free', E'*And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* (Ephesians 2:20). Paul names the Messiah *the chief corner stone* upon whom the household is built; Peter calls the gathered *lively stones... built up a spiritual house* (1 Peter 2:5) upon *a chief corner stone, elect, precious* (1 Peter 2:6). The same architecture: the Messiah the corner stone, the people the living stones built into a spiritual house, a holy priesthood. What Paul frames as a building fitly framed together, Peter frames as a living temple of stones — one corner stone, one house of Yahuah (LORD).'),
  ('canon', '1-peter', 2, 7, 'canon', 'matthew', 21, 42, 'free', E'*Yahusha (Jesus) saith unto them, Did ye never read in the scriptures, The stone which the builders rejected, the same is become the head of the corner: this is Yahuah''s (Lord''s) doing, and it is marvellous in our eyes?* (Matthew 21:42). Yahusha (Jesus) himself quoted Psalm 118:22 against the builders who rejected him — *The stone which the builders rejected, the same is become the head of the corner.* Peter, who heard him, now writes the same word: *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7). The Master named himself the rejected-yet-crowned stone; the disciple proclaims it. The builders'' refusal is Yahuah''s (Lord''s) doing, marvellous in the eyes of those who believe.'),
  -- thread: 1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea  [BLESSING]
  ('canon', '1-peter', 2, 9, 'canon', 'exodus', 19, 5, 'free', E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* (Exodus 19:5). At Sinai Yahuah (LORD) named Yashar''el (Israel) *a peculiar treasure unto me above all people.* Peter speaks the same calling over the scattered elect: *ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9). The *peculiar people* is the *peculiar treasure* of Sinai — and note the condition Yahuah (LORD) sets, *if ye will obey my voice indeed, and keep my covenant.* This is not a new people replacing Yashar''el (Israel) but Yashar''el''s (Israel''s) own covenant vocation, the Torah-keeping treasured nation, restored to the gathered seed.'),
  ('canon', '1-peter', 2, 9, 'canon', 'exodus', 19, 6, 'free', E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* (Exodus 19:6). The Sinai charter is exact: *a kingdom of priests, and an holy nation* — and Peter sets it word for word upon the scattered elect, *a royal priesthood, an holy nation* (1 Peter 2:9), even *a spiritual house, an holy priesthood, to offer up spiritual sacrifices* (1 Peter 2:5). What Yahuah (LORD) charged Moses to speak *unto the children of Yashar''el (Israel)* is the very identity Peter declares fulfilled in the gathered. The royal priesthood and holy nation are not a Gentile church displacing Yashar''el (Israel); they are the children of Yashar''el (Israel) restored to the calling spoken at the mountain.'),
  ('canon', '1-peter', 2, 9, 'canon', 'deuteronomy', 14, 2, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations that are upon the earth.* (Deuteronomy 14:2). Moses says it plainly: Yahuah (LORD) *hath chosen thee to be a peculiar people unto himself.* Peter calls the elect *a peculiar people* (1 Peter 2:9) — the very phrase, the chosen and holy nation set apart unto Yahuah (LORD). And mark the chapter Deuteronomy 14 is: the clean-and-unclean dietary law follows immediately upon *thou art an holy people.* The peculiar people are the holy, Torah-set-apart people; Peter''s word is no abolition of that calling but its restoration in the scattered seed.'),
  ('canon', '1-peter', 2, 9, 'canon', 'deuteronomy', 7, 6, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). Again Moses names the calling: *an holy people... a special people unto himself, above all people.* Peter declares the elect *a chosen generation... an holy nation, a peculiar people* (1 Peter 2:9). The chosenness, the holiness, the set-apartness above all peoples — these are Yashar''el''s (Israel''s) own from the Torah, now spoken over the gathered remnant. The covenant identity is not transferred to another nation; it is the covenant people themselves, called *out of darkness into his marvellous light.*'),
  ('canon', '1-peter', 2, 9, 'canon', 'isaiah', 43, 21, 'free', E'*This people have I formed for myself; they shall shew forth my praise.* (Isaiah 43:21). Yahuah (LORD) says of Yashar''el (Israel), *This people have I formed for myself; they shall shew forth my praise.* Peter names the very purpose: *a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9). The people formed to *shew forth my praise* are the people Peter calls to *shew forth the praises* of the One who called them. Isaiah''s formed people and Peter''s peculiar people are one — Yashar''el (Israel) formed for Yahuah''s (LORD''s) own praise, gathered out of darkness.'),
  ('canon', '1-peter', 2, 10, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). Hosea foretold the reversal of Lo-ammi and Lo-ruhamah: *I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people.* Peter writes it fulfilled: *Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10). This is the regathering of scattered Yashar''el (Israel) — the not-my-people made my-people, the not-pitied shown mercy — not a Gentile church but the divorced and scattered house brought home.'),
  ('canon', '1-peter', 2, 10, 'canon', 'hosea', 1, 10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). Hosea names the very people: *the children of Yashar''el (Israel)... in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* Peter declares the word kept: *were not a people, but are now the people of Elohim (God)* (1 Peter 2:10). The Lo-ammi of Hosea, the scattered children of Yashar''el (Israel), are made Ammi again — the sons of the living Elohim (God). Peter''s peculiar people are this regathered seed, not a new entity.'),
  -- thread: 1-peter-2-fear-elohim-honour-the-king-proverbs-24
  ('canon', '1-peter', 2, 17, 'canon', 'proverbs', 24, 21, 'free', E'*My son, fear thou Yahuah (LORD) and the king: and meddle not with them that are given to change:* (Proverbs 24:21). Peter''s fourfold charge — *Honour all men. Love the brotherhood. Fear Elohim (God). Honour the king* (1 Peter 2:17) — distils the wisdom of Proverbs: *fear thou Yahuah (LORD) and the king.* The two stand together, the fear of Yahuah (LORD) and the honour of the king, with the fear of Elohim (God) governing the honour rendered to the throne. Peter sets the order rightly: fear belongs to Elohim (God); honour is given the king under that fear. The proverb''s pairing is the apostle''s rule of submission for the scattered elect among the nations.'),
  -- thread: 1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53  [BLESSING]
  ('canon', '1-peter', 2, 22, 'canon', 'isaiah', 53, 9, 'free', E'*And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* (Isaiah 53:9). Peter quotes the Servant-song nearly word for word: *Who did no sin, neither was guile found in his mouth* (1 Peter 2:22). Isaiah''s *he had done no violence, neither was any deceit in his mouth* is the sinless Servant whose innocence is the ground of his suffering. The Messiah Peter sets before suffering servants as their example is the very Servant of Isaiah 53 — guileless, doing no sin, yet bearing the iniquity of others. The pattern of unjust suffering Peter commends is the Servant''s own.'),
  ('canon', '1-peter', 2, 24, 'canon', 'isaiah', 53, 5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). This is the verse Peter closes upon: *Who his own self bare our sins in his own body on the tree, that we, being dead to sins, should live unto righteousness: by whose stripes ye were healed* (1 Peter 2:24). Isaiah''s *with his stripes we are healed* becomes Peter''s *by whose stripes ye were healed* — the wounding for transgressions, the bruising for iniquities, the chastisement of peace borne by the Servant. The healing is the forgiveness of sins, the dead-to-sins, alive-to-righteousness life purchased on the tree. Isaiah''s stripes are the stripes Peter preaches.'),
  ('canon', '1-peter', 2, 24, 'canon', 'isaiah', 53, 4, 'free', E'*Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted.* (Isaiah 53:4). The Servant *hath borne our griefs, and carried our sorrows* — and Peter says the Messiah *his own self bare our sins in his own body on the tree* (1 Peter 2:24). The bearing-of-our-burden is the heart of both: Isaiah''s Servant carries what was ours, esteemed stricken and smitten though it was for us; Peter''s Messiah bears our sins in his own body. The substitution Isaiah sang — our griefs upon him — is the cross Peter proclaims, the Servant bearing the sin of the scattered that they might live unto righteousness.'),
  ('canon', '1-peter', 2, 25, 'canon', 'isaiah', 53, 6, 'free', E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all.* (Isaiah 53:6). Peter ends the chapter with this exact image: *For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25). Isaiah''s *all we like sheep have gone astray* is Peter''s *ye were as sheep going astray* — and the iniquity Yahuah (LORD) laid on the Servant is the sin the Shepherd bore to bring the straying flock home. The wandering sheep of Isaiah are the returned flock of Peter, gathered to the Shepherd and Bishop of their souls, the suffering Servant himself.'),
  ('canon', '1-peter', 2, 23, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7). Peter describes the Messiah''s silence under reviling: *Who, when he was reviled, reviled not again; when he suffered, he threatened not; but committed himself to him that judgeth righteously* (1 Peter 2:23). Isaiah''s Servant *opened not his mouth... as a sheep before her shearers is dumb* — the silent, non-retaliating sufferer who commits his cause to Yahuah (LORD). The example Peter holds before wronged servants is this Servant''s silence: not threatening, not reviling again, but committing himself to the One who judges righteously.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s240_p240c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s240_p240c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34',
       E'Taste that Yahuah (Lord) is gracious — the sincere milk of the word (Psalm 34)',
       E'Peter calls the gathered to grow: *As newborn babes, desire the sincere milk of the word, that ye may grow thereby: If so be ye have tasted that Yahuah (Lord) is gracious* (1 Peter 2:2-3). The closing phrase is David''s song: *O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him* (Psalm 34:8). The experiential knowing of Yahuah''s (LORD''s) goodness — the *taste and see* — grounds the growth Peter commands; those who have tasted that Yahuah (Lord) is gracious in the milk of the word press on to grow by it. The whole of Psalm 34 stands beneath this chapter (Peter will quote it again at length in chapter 3 — *the eyes of Yahuah are over the righteous*), and here its opening invitation is the root: come, taste, and grow, for Yahuah (Lord) is gracious.',
       sv.verse_id, ev.verse_id, 'free', 9630
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8',
       E'The living stone, the chief corner stone, the stone of stumbling (Psalm 118, Isaiah 28, Isaiah 8)',
       E'Peter welds three Tanakh stone-texts into one witness to the Messiah. The corner stone is Isaiah''s: *it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6) — that is, *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The rejected-yet-crowned stone is David''s: *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7), the very word of *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22) — the song Yahusha (Jesus) himself turned against the builders, *The stone which the builders rejected, the same is become the head of the corner: this is Yahuah''s (Lord''s) doing* (Matthew 21:42). And the stone of stumbling is Isaiah''s: *a stone of stumbling, and a rock of offence, even to them which stumble at the word* (1 Peter 2:8), which is *for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* (Isaiah 8:14) — mark the phrase, *to both the houses,* Yahudah and Yisra''el alike. The same stone is sanctuary to the believing and an offence to the disobedient. Paul read the same scriptures the same way: *Behold, I lay in Sion a stumblingstone and rock of offence: and whosoever believeth on him shall not be ashamed* (Romans 9:33), joining Isaiah 28 to Isaiah 8 as Peter does. And the building rises upon the stone: the elect are *lively stones... built up a spiritual house* (1 Peter 2:5) upon the One Paul calls *the chief corner stone* (Ephesians 2:20). To them that believe he is precious; to the builders who refused him he is the disallowed stone now crowned head of the corner — Yahuah''s (LORD''s) own doing, foretold in Psalm, Isaiah, and Isaiah, fulfilled in the living stone, the Messiah.',
       sv.verse_id, ev.verse_id, 'free', 9633
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea',
       E'A chosen generation, a royal priesthood, an holy nation, a peculiar people (Exodus 19, Deuteronomy 7 & 14, Isaiah 43, Hosea)',
       E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light: Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:9-10). Every phrase is Yashar''el''s (Israel''s) own, spoken at Sinai and by the prophets — this is the covenant people restored to their own calling, NOT a new entity replacing Yashar''el (Israel). The charter is Exodus: *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5), *and ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6) — the *royal priesthood* and *holy nation* word for word, with the condition of obeying Yahuah''s (LORD''s) voice and keeping his covenant. Moses repeats it: *thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations* (Deuteronomy 14:2 — the very chapter of the clean-and-unclean dietary law), and *a special people unto himself, above all people* (Deuteronomy 7:6). The purpose is Isaiah''s: *This people have I formed for myself; they shall shew forth my praise* (Isaiah 43:21) — the formed people that *shew forth my praise* are Peter''s peculiar people that *shew forth the praises* of the One who called them. And the *were not a people, but are now the people of Elohim* is Hosea''s reversal of Lo-ammi: *I will say to them which were not my people, Thou art my people* (Hosea 2:23), *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10) — the divorced and scattered house of Yashar''el (Israel) regathered, the not-pitied shown mercy. This is the exact twin of Titus 2:14, *a peculiar people, zealous of good works.* Do not read it as a Gentile church displacing Yashar''el (Israel): it is the scattered covenant people — the chosen, royal, priestly, holy, peculiar nation of Sinai — gathered out of darkness into his marvellous light and restored to the vocation Yahuah (LORD) gave them at the mountain.',
       sv.verse_id, ev.verse_id, 'free', 9636
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-fear-elohim-honour-the-king-proverbs-24',
       E'Fear Elohim (God), honour the king (Proverbs 24)',
       E'Peter gives a fourfold rule for the scattered elect among the nations: *Honour all men. Love the brotherhood. Fear Elohim (God). Honour the king* (1 Peter 2:17). The pairing of the last two is the wisdom of Proverbs: *My son, fear thou Yahuah (LORD) and the king: and meddle not with them that are given to change* (Proverbs 24:21). The two stand together — the fear of Yahuah (LORD) and the honour of the king — yet rightly ordered: fear belongs to Elohim (God); honour is rendered to the king under that fear. Peter''s call to *submit yourselves to every ordinance of man for Yahuah''s (Lord''s) sake* (1 Peter 2:13) is the proverb lived out: the elect honour the throne, but their fear is reserved for Yahuah (LORD) alone. The wisdom that joined the fear of Yahuah (LORD) to the honour of the king is the apostle''s rule of submission for the dispersed.',
       sv.verse_id, ev.verse_id, 'free', 9639
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53',
       E'By whose stripes ye were healed — the suffering Servant (Isaiah 53)',
       E'Peter closes the chapter by weaving Isaiah''s Servant-song almost verbatim around the suffering Messiah, the example for servants who suffer wrongfully. *Who did no sin, neither was guile found in his mouth* (1 Peter 2:22) is Isaiah''s *he had done no violence, neither was any deceit in his mouth* (Isaiah 53:9) — the sinless, guileless Servant. *Who, when he was reviled, reviled not again; when he suffered, he threatened not; but committed himself to him that judgeth righteously* (1 Peter 2:23) is the silent sufferer, *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb* (Isaiah 53:7). *Who his own self bare our sins in his own body on the tree, that we, being dead to sins, should live unto righteousness: by whose stripes ye were healed* (1 Peter 2:24) gathers up Isaiah''s heart: *Surely he hath borne our griefs, and carried our sorrows* (Isaiah 53:4) and *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5) — the very *stripes that heal,* the wounding for transgressions, the substitution of the Servant. And *For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25) is Isaiah''s *All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). The wandering sheep are gathered home; the iniquity Yahuah (LORD) laid on the Servant is the sin the Shepherd bore to bring the straying flock back. The Christology is the Formed: it is the Son, sent by the Father, who did no sin and bare our sins in his own body, the suffering Servant who committed himself to him that judgeth righteously. Healing is the forgiveness of sins, the dead-to-sins, alive-to-righteousness life purchased on the tree — Isaiah''s Servant, Peter''s Messiah, one and the same.',
       sv.verse_id, ev.verse_id, 'free', 9642
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:8 — *O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him* the experiential knowing of Yahuah''s goodness; *If so be ye have tasted that Yahuah (Lord) is gracious* (1 Peter 2:3), the milk of the word by which they grow.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:16 — *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* the corner stone Yahuah lays in Zion; quoted as scripture, *a chief corner stone, elect, precious* (1 Peter 2:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 118:22 — *The stone which the builders refused is become the head stone of the corner* the rejected-yet-crowned stone; *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 21:42 — *The stone which the builders rejected, the same is become the head of the corner: this is Yahuah''s (Lord''s) doing* Yahusha himself turned Psalm 118:22 against the builders; *the same is made the head of the corner* (1 Peter 2:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 8:14 — *for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* the same stone is sanctuary and stumbling, before both houses; *a stone of stumbling, and a rock of offence... to them which stumble at the word* (1 Peter 2:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 9:33 — *Behold, I lay in Sion a stumblingstone and rock of offence: and whosoever believeth on him shall not be ashamed* Paul welds Isaiah 28 and Isaiah 8 as Peter does; *a chief corner stone... a stone of stumbling, and a rock of offence* (1 Peter 2:6,8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ephesians 2:20 — *Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* the people built upon the corner stone; *lively stones... built up a spiritual house* upon *a chief corner stone, elect, precious* (1 Peter 2:5-6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:5 — *ye shall be a peculiar treasure unto me above all people* the Sinai charter of the peculiar treasure, conditioned on obeying Yahuah''s voice and keeping his covenant; *ye are... a peculiar people* (1 Peter 2:9).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:6 — *ye shall be unto me a kingdom of priests, and an holy nation... unto the children of Yashar''el (Israel)* the royal priesthood and holy nation word for word; *a royal priesthood, an holy nation* (1 Peter 2:9), even *an holy priesthood* (1 Peter 2:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 14:2 — *Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations* the very phrase, in the dietary-law chapter; *a peculiar people* (1 Peter 2:9), the holy set-apart nation.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 7:6 — *an holy people... a special people unto himself, above all people* the chosen, holy, set-apart people; *a chosen generation... an holy nation* (1 Peter 2:9).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 43:21 — *This people have I formed for myself; they shall shew forth my praise* the people formed to shew Yahuah''s praise; *that ye should shew forth the praises of him who hath called you* (1 Peter 2:9).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Hosea 2:23 — *I will say to them which were not my people, Thou art my people* the reversal of Lo-ammi, the scattered house regathered; *were not a people, but are now the people of Elohim (God)* (1 Peter 2:10).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Hosea 1:10 — *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* the children of Yashar''el made sons again; *now have obtained mercy* (1 Peter 2:10).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-2-fear-elohim-honour-the-king-proverbs-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 24:21 — *My son, fear thou Yahuah (LORD) and the king: and meddle not with them that are given to change* the wisdom pairing of fear and honour; *Fear Elohim (God). Honour the king* (1 Peter 2:17), fear to Elohim, honour to the throne under that fear.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-fear-elohim-honour-the-king-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:9 — *because he had done no violence, neither was any deceit in his mouth* the sinless, guileless Servant; *Who did no sin, neither was guile found in his mouth* (1 Peter 2:22).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:7 — *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* the silent sufferer; *when he was reviled, reviled not again; when he suffered, he threatened not* (1 Peter 2:23).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows* the Servant carries what was ours; *Who his own self bare our sins in his own body on the tree* (1 Peter 2:24).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:5 — *he was wounded for our transgressions, he was bruised for our iniquities... and with his stripes we are healed* the stripes that heal; *by whose stripes ye were healed* (1 Peter 2:24).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 53:6 — *All we like sheep have gone astray... and Yahuah (LORD) hath laid on him the iniquity of us all* the straying flock and the laid-on iniquity; *ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1peter_03.sql (S240 1 Peter 3) -----
-- =====================================================================
-- S240 minion — 1 PETER 3 FULL-LIBRARY cross-references
-- Migration (header only): session240_1peter_cross_references.sql
-- =====================================================================
-- Chapter: 1 PETER 3 (22 verses) — THE HIGHEST-WEIGHT CHAPTER: the spirits in
-- prison / the days of Noah / the WATCHERS (the showcase self-link to the live
-- 1 Enoch threads).
-- Tag: p240c3 (temp view _s240_p240c3_lookup).
-- Sort band: floor 9660, step 3 (9660, 9663, 9666, 9669, 9672 used; under 9690).
-- Source is ALWAYS the canon 1 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 Peter = the letter to the scattered elect, the two-house remnant; same
-- Yahuah, same Torah honored, holiness in suffering; NO replacement theology, NO law-vs-grace
-- antithesis). Chapter 3 carries Sarah as the pattern of the holy women (3:6 / Genesis 18:12),
-- Peter's length-quote of Psalm 34 (3:10-12 / Psalm 34:12-16, the eyes of Yahuah over the
-- righteous, refrain the tongue from evil), and the load-bearing center: the Formed Son *put to
-- death in the flesh, but quickened by the Spirit* who *went and preached unto the spirits in
-- prison; Which sometime were disobedient... in the days of Noah* (3:18-20) — the WATCHERS / fallen
-- angels of Genesis 6:1-4, bound and imprisoned exactly as 1 Enoch narrates (10:4-14 the binding of
-- Azazel and Semjaza in the valley till the day of their judgement; 12-13 Enoch sent to declare
-- *ye shall have no peace*; 18:14-16 / 21:1-11 the prison house of the angels), the same Watchers/
-- Flood event Jubilees 5 records, the angels in chains of Jude 6 / 2 Peter 2:4. The flood typology
-- carries into 3:21 (baptism the like figure, Genesis 7, Wisdom 14:6-7 the wood by which
-- righteousness comes), and 3:22 exalts the Formed Son to the right hand of Elohim with angels made
-- subject (Psalm 110:1, Daniel 7:13-14). CHRISTOLOGY: it is the Formed Son, put to death and
-- quickened, who proclaims; the Father is the source/raiser/exalter who set him at his right hand
-- and made the powers subject unto him. No co-equal-persons grammar; no modalist collapse.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   wives in subjection; the hidden man of the heart; the holy women of old
--           Tanakh: carried in the Sarah thread (v.5-6)   Extras: none warranted   NT: none warranted
--   v.6     even as Sara obeyed Abraham, calling him lord; whose daughters ye are
--           Tanakh: Genesis 18:12 (Sarah... my lord being old also?)
--           Extras: none warranted   NT: none warranted
--   v.7     husbands dwell according to knowledge, heirs together of the grace of life
--           Tanakh: none warranted (pastoral, no load-bearing root)
--           Extras: none warranted   NT: none warranted
--   v.8-9   be of one mind; render not evil for evil but blessing
--           Tanakh: none warranted (the Psalm-34 quote at v.10-12 carries the do-good/seek-peace weight)
--           Extras: none warranted   NT: none warranted
--   v.10-12 he that will love life... refrain his tongue... the eyes of Yahuah over the righteous
--           Tanakh: Psalm 34:12-16 (quoted at length by Peter)
--           Extras: none warranted   NT: none warranted
--   v.13-17 suffer for righteousness' sake; sanctify Yahuah Elohim in your hearts
--           Tanakh: none warranted (Isaiah 8:12-13 echo carried in prose; not load-bearing thread here)
--           Extras: none warranted   NT: none warranted
--   v.18-20 quickened by the Spirit; preached to the spirits in prison; the days of Noah [WATCHERS]
--           Tanakh: Genesis 6:1-8 (the sons of Elohim + the Flood)
--           Extras: 1 Enoch 10:4-14 (binding of Azazel/Semjaza), 1 Enoch 12-13 (ye shall have no peace),
--                   1 Enoch 18:14 / 21:5,11 (the prison house of the angels), Jubilees 5:1,6,10
--                   (the Watchers and Flood)
--           NT: Jude 6 (the angels reserved in everlasting chains), 2 Peter 2:4 (the angels that sinned)
--   v.21    the like figure whereunto even baptism doth also now save us; the flood
--           Tanakh: Genesis 7:1,7,23 (Noah and his house saved by water)
--           Extras: Wisdom of Solomon 14:6-7 (the wood by which righteousness comes)
--           NT: Hebrews 11:7 (by faith Noah prepared an ark to the saving of his house)
--   v.22    gone into heaven, on the right hand of Elohim, angels made subject unto him
--           Tanakh: Psalm 110:1 (sit thou at my right hand), Daniel 7:13-14 (dominion given the Son of Adam)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9660 1-peter-3-sarah-obeyed-abraham-calling-him-lord-genesis-18                         (Tanakh)
--   9663 1-peter-3-the-eyes-of-yahuah-are-over-the-righteous-refrain-thy-tongue-psalm-34    (Tanakh)
--   9666 1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees  (Tanakh + Extras + NT)  [SHOWCASE]
--   9669 1-peter-3-baptism-the-like-figure-the-flood-that-saved-noah-genesis-7-wisdom-14    (Tanakh + Extras + NT)
--   9672 1-peter-3-on-the-right-hand-of-elohim-angels-made-subject-psalm-110-daniel-7       (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s240_p240c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-peter-3-sarah-obeyed-abraham-calling-him-lord-genesis-18
  ('canon', '1-peter', 3, 6, 'canon', 'genesis', 18, 12, 'free', E'*Therefore Sarah laughed within herself, saying, After I am waxed old shall I have pleasure, my lord being old also?* (Genesis 18:12). Peter holds up the matriarch as the pattern of the holy women: *Even as Sara obeyed Abraham, calling him lord: whose daughters ye are, as long as ye do well* (1 Peter 3:6). The word he reaches for is Sarah''s own — *my lord* — spoken in the tent at the promise of Yitzhaq (Isaac). The believing wives of the dispersion are *whose daughters,* Sarah''s daughters, *the holy women also, who trusted in Elohim (God)* (1 Peter 3:5); the lineage of faith Peter names runs back through the mother of the covenant seed.'),
  -- thread: 1-peter-3-the-eyes-of-yahuah-are-over-the-righteous-refrain-thy-tongue-psalm-34
  ('canon', '1-peter', 3, 10, 'canon', 'psalms', 34, 12, 'free', E'*What man is he that desireth life, and loveth many days, that he may see good?* (Psalm 34:12). Peter quotes David''s psalm verbatim: *For he that will love life, and see good days, let him refrain his tongue from evil* (1 Peter 3:10). The opening question of the psalm — who desireth life and would see good? — becomes the opening of Peter''s instruction; the whole of the next three verses is the psalm spoken again to the scattered elect, the Tanakh''s own wisdom of the tongue and the way of peace.'),
  ('canon', '1-peter', 3, 10, 'canon', 'psalms', 34, 13, 'free', E'*Keep thy tongue from evil, and thy lips from speaking guile.* (Psalm 34:13). David''s charge is Peter''s charge: *let him refrain his tongue from evil, and his lips that they speak no guile* (1 Peter 3:10). The bridled tongue, the lips kept from guile — the Torah-wisdom of the psalm is laid on the suffering remnant unaltered, the same word *the eyes of Yahuah (LORD)* watch to honor.'),
  ('canon', '1-peter', 3, 11, 'canon', 'psalms', 34, 14, 'free', E'*Depart from evil, and do good; seek peace, and pursue it.* (Psalm 34:14). Peter carries the psalm''s next line straight across: *Let him eschew evil, and do good; let him seek peace, and ensue it* (1 Peter 3:11). To eschew evil, to do good, to seek and pursue peace — the threefold path of the psalmist is the path of the elect under suffering, blessing rendered for railing because *ye are thereunto called, that ye should inherit a blessing* (1 Peter 3:9).'),
  ('canon', '1-peter', 3, 12, 'canon', 'psalms', 34, 15, 'free', E'*The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry.* (Psalm 34:15). This is the ground of the whole counsel, quoted by Peter as the assurance of the suffering: *For the eyes of Yahuah (Lord) are over the righteous, and his ears are open unto their prayers* (1 Peter 3:12). The watching eyes and open ears of Yahuah (LORD) in the psalm are the watching eyes and open ears Peter sets over the elect; mark the NT-Lord rule — where Peter re-speaks the YHWH text the pull renders *Yahuah (Lord),* the same One the psalm names *Yahuah (LORD).*'),
  ('canon', '1-peter', 3, 12, 'canon', 'psalms', 34, 16, 'free', E'*The face of Yahuah (LORD) is against them that do evil, to cut off the remembrance of them from the earth.* (Psalm 34:16). The other half of the psalm''s assurance Peter quotes whole: *but the face of Yahuah (Lord) is against them that do evil* (1 Peter 3:12). The same face that turns toward the righteous in mercy is set against the evildoer — David''s word of judgment becomes Peter''s, the unchanging posture of Yahuah (LORD) toward the two ways.'),
  -- thread: 1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees  [SHOWCASE]
  ('canon', '1-peter', 3, 19, 'canon', 'genesis', 6, 2, 'free', E'*That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:2). The *spirits in prison* who *were disobedient... in the days of Noah* (1 Peter 3:19-20) are the *sons of Elohim (God)* of the days before the Flood, who left their estate and *took them wives of all which they chose.* Peter names the very generation Genesis 6 names; the disobedient spirits to whom the quickened Messiah went and preached are the fallen ones whose transgression filled the earth with violence before the deluge.'),
  ('canon', '1-peter', 3, 20, 'canon', 'genesis', 6, 4, 'free', E'*There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4). The fruit of the Watchers'' transgression — the *giants in the earth in those days,* born when *the sons of Elohim (God) came in unto the daughters of men* — is the corruption that *the longsuffering of Elohim (God) waited* upon *in the days of Noah, while the ark was a preparing* (1 Peter 3:20). The spirits Peter says are now *in prison* are the parents of the giants, the angelic transgressors of Genesis 6 whose works brought on the Flood.'),
  ('canon', '1-peter', 3, 20, 'canon', 'genesis', 6, 5, 'free', E'*And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* (Genesis 6:5). The wickedness the Watchers'' descent loosed on the earth is why *the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing* (1 Peter 3:20). Peter''s *longsuffering... waited* is the patience of Yahuah (LORD) over the very generation Genesis 6 describes as *only evil continually* — the forbearance held out while Noah built, before the imprisonment of the spirits and the cleansing of the deluge.'),
  ('canon', '1-peter', 3, 19, 'enoch', '1-enoch', 10, 4, 'extras', E'*And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4). The Hebrew library narrates exactly the imprisonment Peter assumes: the chief of the Watchers, Azazel, *bound hand and foot* and cast into the darkness. When Peter writes that the quickened Messiah *went and preached unto the spirits in prison* (1 Peter 3:19), this is the prison — the place where the disobedient angels of Noah''s day were bound, the same spirits Genesis 6 names the sons of Elohim (God).'),
  ('canon', '1-peter', 3, 19, 'enoch', '1-enoch', 10, 12, 'extras', E'*And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* (1 Enoch 10:12). The sentence on Semjaza and his associates — *bind them fast... in the valleys of the earth, till the day of their judgement* — is the very confinement Peter calls the *prison* of *the spirits* (1 Peter 3:19). They are held, not destroyed, awaiting *the day of their judgement*; to these bound ones, in their prison, the Formed Son put to death and *quickened by the Spirit* (1 Peter 3:18) went and made proclamation.'),
  ('canon', '1-peter', 3, 19, 'enoch', '1-enoch', 10, 13, 'extras', E'*In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* (1 Enoch 10:13). The library names it outright — *the prison in which they shall be confined* — the same word Peter uses: *the spirits in prison* (1 Peter 3:19). The abyss, the torment, the prison of the bound Watchers is the place the quickened Messiah entered to preach; the consummation Enoch foretells is the judgement still reserved for them.'),
  ('canon', '1-peter', 3, 20, 'enoch', '1-enoch', 12, 4, 'extras', E'*''Enoch, thou scribe of righteousness, go, declare to the Watchers of the heaven who have left the high heaven, the holy eternal place, and have defiled themselves with women, and have done as the children of earth do, and have taken unto themselves wives: "Ye have wrought great destruction on the earth:* (1 Enoch 12:4). Enoch was sent to *declare to the Watchers of the heaven who have left the high heaven... and have taken unto themselves wives* — the very ones Peter says *were disobedient... in the days of Noah* (1 Peter 3:20). The pattern of a righteous messenger sent to proclaim to the imprisoned spirits is the pattern Peter names of the Messiah: as Enoch declared their judgement, so the quickened Son *went and preached unto the spirits in prison* (1 Peter 3:19).'),
  ('canon', '1-peter', 3, 20, 'enoch', '1-enoch', 13, 1, 'extras', E'*And Enoch went and said: ''Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds:* (1 Enoch 13:1). The word carried to the bound Watcher — *Azâzêl, thou shalt have no peace... a severe sentence has gone forth against thee to put thee in bonds* — is the announcement of judgement to the disobedient spirits of Noah''s day (1 Peter 3:20). The proclamation Peter assigns to the quickened Messiah unto *the spirits in prison* (1 Peter 3:19) is a proclamation of the sentence already gone forth, the same *no peace* declared to the imprisoned of old.'),
  ('canon', '1-peter', 3, 19, 'enoch', '1-enoch', 18, 14, 'extras', E'*And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.''* (1 Enoch 18:14). Enoch is shown the fallen host *bound... till the time when their guilt should be consummated* — held in a place of confinement until judgement. This is the *prison* Peter speaks of when the Messiah *went and preached unto the spirits in prison* (1 Peter 3:19): a real holding-place of bound spirits, kept against the appointed day, not annihilated but reserved.'),
  ('canon', '1-peter', 3, 19, 'enoch', '1-enoch', 21, 5, 'extras', E'*''This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 21:5). Enoch is brought to the place the angel names *a prison for the stars and the host of heaven* — the seven stars *which roll over the fire... which have transgressed the commandment of Yahuah (God).* It is the prison house of the angels; *this place is the prison of the angels, and here they will be imprisoned for ever* (1 Enoch 21:11). Peter names this same prison: *the spirits in prison* (1 Peter 3:19), the bound host of the days of Noah to whom the quickened Son proclaimed.'),
  ('canon', '1-peter', 3, 19, 'enoch', '1-enoch', 21, 11, 'extras', E'*And he said unto me: ''This place is the prison of the angels, and here they will be imprisoned for ever.''* (1 Enoch 21:11). The angel''s plainest word — *this place is the prison of the angels* — is the very phrase under Peter''s *the spirits in prison* (1 Peter 3:19). The imprisoned angels of the Watchers narrative are the disobedient spirits of Noah''s day; the place Enoch saw is the place the Formed Son entered to preach, *being put to death in the flesh, but quickened by the Spirit* (1 Peter 3:18).'),
  ('canon', '1-peter', 3, 20, 'jubilees', 'jubilees', 5, 1, 'extras', E'*And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* (Jubilees 5:1). Jubilees tells the same days Peter names — *the days of Noah* (1 Peter 3:20) — when *the angels of Elohim (God)... took themselves wives of all whom they chose, and they bare to them sons and they were giants.* The disobedient spirits of Peter''s prison are these very angels, whose transgression and giant offspring brought the longsuffering of Elohim (God) to the brink of the Flood.'),
  ('canon', '1-peter', 3, 19, 'jubilees', 'jubilees', 5, 6, 'extras', E'*And against the angels whom He had sent upon the earth, He was exceedingly wroth, and He gave commandment to root them out of all their dominion, and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* (Jubilees 5:6). The command — *to bind them in the depths of the earth, and behold they are bound* — is the imprisonment Peter assumes when the Messiah *went and preached unto the spirits in prison* (1 Peter 3:19). Jubilees, like 1 Enoch, holds the fallen angels bound in the depths, *kept separate* against judgement: the very prison and the very spirits of Peter''s word.'),
  ('canon', '1-peter', 3, 20, 'jubilees', 'jubilees', 5, 10, 'extras', E'*And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* (Jubilees 5:10). The Watchers *bound in the depths of the earth... until the day of the great condemnation* are the *spirits in prison; Which sometime were disobedient... in the days of Noah* (1 Peter 3:19-20). Held until the great judgement, exactly as Peter and Jude (the angels *reserved in everlasting chains under darkness unto the judgment of the great day*) both witness, they wait in the prison the quickened Son entered.'),
  ('canon', '1-peter', 3, 19, 'canon', 'jude', 1, 6, 'free', E'*And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 6). Jude names the same bound host — *the angels which kept not their first estate... reserved in everlasting chains under darkness unto the judgment of the great day.* These are Peter''s *spirits in prison* (1 Peter 3:19): the Watchers who left their habitation, chained in darkness, awaiting judgement. The two apostolic witnesses tell one Watchers narrative, rooted in Genesis 6 and the Hebrew library, the same spirits to whom the quickened Messiah proclaimed.'),
  ('canon', '1-peter', 3, 19, 'canon', '2-peter', 2, 4, 'free', E'*For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). Peter''s second letter names the prison plainly: *the angels that sinned... cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* It is the same prison of the same disobedient spirits as 1 Peter 3:19 — *the spirits in prison; Which sometime were disobedient... in the days of Noah* — bound, reserved, awaiting the day; the Watchers of Genesis 6 and 1 Enoch, witnessed across both epistles.'),
  -- thread: 1-peter-3-baptism-the-like-figure-the-flood-that-saved-noah-genesis-7-wisdom-14
  ('canon', '1-peter', 3, 21, 'canon', 'genesis', 7, 1, 'free', E'*And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* (Genesis 7:1). The ark that *Yahuah (LORD)* commanded Noah and *all thy house* to enter is the figure Peter draws on: *the like figure whereunto even baptism doth also now save us* (1 Peter 3:21). The household saved through the waters of the Flood is the type of the saving passage Peter names — *eight souls were saved by water* (1 Peter 3:20), and baptism is *the like figure* of that deliverance.'),
  ('canon', '1-peter', 3, 21, 'canon', 'genesis', 7, 7, 'free', E'*And Noah went in, and his sons, and his wife, and his sons'' wives with him, into the ark, because of the waters of the flood.* (Genesis 7:7). The eight who went into the ark — *Noah, and his sons, and his wife, and his sons'' wives* — are the *eight souls... saved by water* (1 Peter 3:20). Peter makes their passage through the deluge *the like figure* of baptism (1 Peter 3:21): the water that bore up the ark and carried the righteous through to a cleansed earth is the type of the water that now saves *by the resurrection of Yahusha HaMashiach (Jesus Christ).*'),
  ('canon', '1-peter', 3, 21, 'apocrypha', 'the-wisdom-of-solomon', 14, 7, 'extras', E'*For blessed is the wood by which righteousness comes.* (Wisdom of Solomon 14:7). The Hebrew library blesses *the wood by which righteousness comes* — the ark, the *small piece of wood* by which *the hope of the world... escaped in a weak vessel* when *the proud giants perished* (Wisdom 14:5-6). Peter draws on the same Flood-deliverance as *the like figure whereunto even baptism doth also now save us* (1 Peter 3:21). The blessed wood that bore the righteous remnant through the waters is the figure of the saving passage Peter names — and Wisdom, like Genesis, sets the deliverance against the perishing of the giants of the Watchers.'),
  ('canon', '1-peter', 3, 20, 'canon', 'hebrews', 11, 7, 'free', E'*By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* (Hebrews 11:7). Hebrews names the same scene Peter names — Noah *prepared an ark to the saving of his house* while *the longsuffering of Elohim (God) waited... while the ark was a preparing* (1 Peter 3:20). The ark *to the saving of his house* is the deliverance Peter calls *the like figure* of baptism (1 Peter 3:21); both apostolic witnesses read the Flood as the saving of the righteous through the waters by faith.'),
  -- thread: 1-peter-3-on-the-right-hand-of-elohim-angels-made-subject-psalm-110-daniel-7
  ('canon', '1-peter', 3, 22, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). David''s word — *Yahuah (LORD) said unto my Lord, Sit thou at my right hand* — is the enthronement Peter declares: the risen Son *is gone into heaven, and is on the right hand of Elohim (God)* (1 Peter 3:22). It is the Father who speaks and the Father who seats him; the Son is set *at my right hand* by Yahuah (LORD), exalted by the One who raised him, until every enemy is made his footstool.'),
  ('canon', '1-peter', 3, 22, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). To the one like the Son of Adam *there was given... dominion, and glory, and a kingdom* — given by the Ancient of Days. Peter declares the same gift fulfilled: the Son at the right hand of Elohim (God), *angels and authorities and powers being made subject unto him* (1 Peter 3:22). The dominion is given, the powers made subject — the Formed Son exalted and granted rule by the Father, the everlasting kingdom of Daniel''s vision.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s240_p240c3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s240_p240c3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-3-sarah-obeyed-abraham-calling-him-lord-genesis-18',
       E'Even as Sara obeyed Abraham, calling him lord — whose daughters ye are (Genesis 18)',
       E'Peter holds up the matriarch as the pattern for the believing wives of the dispersion: *For after this manner in the old time the holy women also, who trusted in Elohim (God), adorned themselves... Even as Sara obeyed Abraham, calling him lord: whose daughters ye are, as long as ye do well* (1 Peter 3:5-6). The very word he reaches for is Sarah''s own, spoken in the tent at the promise of the covenant son: *Therefore Sarah laughed within herself, saying, After I am waxed old shall I have pleasure, my lord being old also?* (Genesis 18:12). Sarah named Abraham *my lord* in the hour Yahuah (LORD) promised *Sarah shall have a son* — and Peter makes the elect women *whose daughters,* daughters of Sarah, heirs of the mother of the covenant seed. The adorning he commends is *the hidden man of the heart... a meek and quiet spirit, which is in the sight of Elohim (God) of great price* (1 Peter 3:4) — the trust of the holy women of old, running back through Sarah to the faith that bore Yitzhaq (Isaac).',
       sv.verse_id, ev.verse_id, 'free', 9660
  FROM _s240_p240c3_lookup sv, _s240_p240c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-3-the-eyes-of-yahuah-are-over-the-righteous-refrain-thy-tongue-psalm-34',
       E'The eyes of Yahuah are over the righteous — refrain thy tongue from evil (Psalm 34)',
       E'Peter quotes David''s psalm at length, line for line, and lays it on the suffering elect: *For he that will love life, and see good days, let him refrain his tongue from evil, and his lips that they speak no guile: Let him eschew evil, and do good; let him seek peace, and ensue it. For the eyes of Yahuah (Lord) are over the righteous, and his ears are open unto their prayers: but the face of Yahuah (Lord) is against them that do evil* (1 Peter 3:10-12). Every clause is Psalm 34: *What man is he that desireth life, and loveth many days, that he may see good? Keep thy tongue from evil, and thy lips from speaking guile. Depart from evil, and do good; seek peace, and pursue it. The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry. The face of Yahuah (LORD) is against them that do evil* (Psalm 34:12-16). The opening question, the bridled tongue, the lips kept from guile, the threefold path — eschew evil, do good, seek and pursue peace — and the ground of it all: the watching eyes and the open ears of Yahuah (LORD) turned toward the righteous, his face set against the evildoer. Mark the NT-Lord rule the pull keeps: where Peter re-speaks the YHWH text it reads *Yahuah (Lord),* the same One the psalm names *Yahuah (LORD).* The Torah-wisdom of the psalm is given to the scattered remnant unchanged, the assurance under which they render *blessing* for *railing,* called *that ye should inherit a blessing* (1 Peter 3:9).',
       sv.verse_id, ev.verse_id, 'free', 9663
  FROM _s240_p240c3_lookup sv, _s240_p240c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees',
       E'The spirits in prison — the days of Noah — the Watchers (Genesis 6, 1 Enoch, Jubilees, Jude)',
       E'Here is the showcase weave of the epistle. *For Messiah (Christ) also hath once suffered for sins, the just for the unjust, that he might bring us to Elohim (God), being put to death in the flesh, but quickened by the Spirit: By which also he went and preached unto the spirits in prison; Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:18-20). The *spirits in prison* who *were disobedient... in the days of Noah* are the fallen ones of Genesis 6: *the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *there were giants in the earth in those days* (Genesis 6:4), so that *the wickedness of man was great in the earth* (Genesis 6:5) and the longsuffering of Yahuah (LORD) waited while Noah built. The Hebrew library narrates the imprisonment Peter assumes. Yahuah (God) commands Raphael, *Bind Azâzêl hand and foot, and cast him into the darkness* (1 Enoch 10:4), and Michael to bind Semjaza and his associates: *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12), *to the torment and the prison in which they shall be confined for ever* (1 Enoch 10:13). Enoch the scribe is sent to *declare to the Watchers of the heaven who have left the high heaven... and have taken unto themselves wives* (1 Enoch 12:4), saying *Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds* (1 Enoch 13:1) — the pattern of a righteous one sent to proclaim to the bound spirits. Enoch is shown the place itself: the fallen host *bound... till the time when their guilt should be consummated* (1 Enoch 18:14), *a prison for the stars and the host of heaven... which have transgressed the commandment of Yahuah (God)* (1 Enoch 21:5), of which the angel says plainly, *This place is the prison of the angels, and here they will be imprisoned for ever* (1 Enoch 21:11). Jubilees tells the same days: *the angels of Elohim (God)... took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1); Yahuah (God) *bade us to bind them in the depths of the earth, and behold they are bound* (Jubilees 5:6), *bound in the depths of the earth for ever, until the day of the great condemnation* (Jubilees 5:10). The apostolic witnesses confirm the one narrative: *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 6), and *Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). One story runs from Genesis 6 through 1 Enoch and Jubilees to Jude, 2 Peter, and here: the Watchers, the giants, the Flood, the prison of bound spirits reserved unto judgement. CHRISTOLOGY — keep the order the text keeps: it is the Formed Son, *put to death in the flesh, but quickened by the Spirit,* who *went and preached unto the spirits in prison.* The Son is the one put to death and made alive again and sent to proclaim; the Father is the source who quickens and raises him — *the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:21) — and exalts him to his right hand (1 Peter 3:22). The proclamation to the imprisoned spirits is no rescue of the rebel angels but the announcement of the sentence already gone forth, the same *no peace* Enoch carried to the bound Watchers of old.',
       sv.verse_id, ev.verse_id, 'extras', 9666
  FROM _s240_p240c3_lookup sv, _s240_p240c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-3-baptism-the-like-figure-the-flood-that-saved-noah-genesis-7-wisdom-14',
       E'Baptism the like figure — the flood that saved Noah through the water (Genesis 7, Wisdom 14, Hebrews 11)',
       E'The Flood Peter has just named becomes a figure of salvation: *eight souls were saved by water. The like figure whereunto even baptism doth also now save us (not the putting away of the filth of the flesh, but the answer of a good conscience toward Elohim (God),) by the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:20-21). The passage through the deluge is the type. *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation* (Genesis 7:1); *And Noah went in, and his sons, and his wife, and his sons'' wives with him, into the ark, because of the waters of the flood* (Genesis 7:7) — the eight souls borne up through the waters to a cleansed earth. The Hebrew library reads the same deliverance and blesses the very wood that carried it: *For blessed is the wood by which righteousness comes* (Wisdom of Solomon 14:7), the ark by which *the hope of the world... escaped in a weak vessel* when *the proud giants perished* — the deliverance again set against the giants of the Watchers. And Hebrews names the faith of it: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house... and became heir of the righteousness which is by faith* (Hebrews 11:7). The water that bore the righteous through judgement is *the like figure* of the water that now saves — not as a washing of the flesh but as *the answer of a good conscience toward Elohim (God),* and its power is *by the resurrection of Yahusha HaMashiach (Jesus Christ),* the Son whom the Father raised.',
       sv.verse_id, ev.verse_id, 'extras', 9669
  FROM _s240_p240c3_lookup sv, _s240_p240c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=3 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-3-on-the-right-hand-of-elohim-angels-made-subject-psalm-110-daniel-7',
       E'On the right hand of Elohim — angels and authorities made subject unto him (Psalm 110, Daniel 7)',
       E'The chapter ends with the exaltation of the risen Son: *Who is gone into heaven, and is on the right hand of Elohim (God); angels and authorities and powers being made subject unto him* (1 Peter 3:22). This is David''s enthronement word fulfilled: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1) — the Father speaks and the Father seats him; the Son is set *at my right hand* by Yahuah (LORD), the One who raised him. And it is Daniel''s vision granted: to the one like the Son of Adam *there was given... dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away* (Daniel 7:14) — the dominion is given by the Ancient of Days, the powers made subject. Keep the order the texts keep: the Father is the source, the raiser, the exalter, who seats the Son at his right hand and makes *angels and authorities and powers* subject unto him; the Son is the Formed One foreordained, manifested, raised, and granted the everlasting kingdom. No co-equal grammar, no collapse of the two — the exalted Son reigns at the right hand of the Father who set him there.',
       sv.verse_id, ev.verse_id, 'free', 9672
  FROM _s240_p240c3_lookup sv, _s240_p240c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=3 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=3 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread members -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    -- 1-peter-3-sarah-obeyed-abraham-calling-him-lord-genesis-18
    ('1-peter-3-sarah-obeyed-abraham-calling-him-lord-genesis-18', 'canon','1-peter',3,6, 'canon','genesis',18,12, 1, E'*Therefore Sarah laughed within herself, saying... my lord being old also?* (Genesis 18:12) — Sarah''s own word *my lord* is the word Peter names: *Even as Sara obeyed Abraham, calling him lord: whose daughters ye are* (1 Peter 3:6).'),
    -- 1-peter-3-the-eyes-of-yahuah-are-over-the-righteous-refrain-thy-tongue-psalm-34
    ('1-peter-3-the-eyes-of-yahuah-are-over-the-righteous-refrain-thy-tongue-psalm-34', 'canon','1-peter',3,10, 'canon','psalms',34,12, 1, E'*What man is he that desireth life, and loveth many days, that he may see good?* (Psalm 34:12) — the psalm''s opening question becomes Peter''s: *he that will love life, and see good days* (1 Peter 3:10).'),
    ('1-peter-3-the-eyes-of-yahuah-are-over-the-righteous-refrain-thy-tongue-psalm-34', 'canon','1-peter',3,10, 'canon','psalms',34,13, 2, E'*Keep thy tongue from evil, and thy lips from speaking guile.* (Psalm 34:13) — quoted by Peter: *let him refrain his tongue from evil, and his lips that they speak no guile* (1 Peter 3:10).'),
    ('1-peter-3-the-eyes-of-yahuah-are-over-the-righteous-refrain-thy-tongue-psalm-34', 'canon','1-peter',3,11, 'canon','psalms',34,14, 3, E'*Depart from evil, and do good; seek peace, and pursue it.* (Psalm 34:14) — carried straight across: *Let him eschew evil, and do good; let him seek peace, and ensue it* (1 Peter 3:11).'),
    ('1-peter-3-the-eyes-of-yahuah-are-over-the-righteous-refrain-thy-tongue-psalm-34', 'canon','1-peter',3,12, 'canon','psalms',34,15, 4, E'*The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry.* (Psalm 34:15) — the ground of the counsel: *the eyes of Yahuah (Lord) are over the righteous, and his ears are open unto their prayers* (1 Peter 3:12).'),
    ('1-peter-3-the-eyes-of-yahuah-are-over-the-righteous-refrain-thy-tongue-psalm-34', 'canon','1-peter',3,12, 'canon','psalms',34,16, 5, E'*The face of Yahuah (LORD) is against them that do evil...* (Psalm 34:16) — the other half quoted whole: *but the face of Yahuah (Lord) is against them that do evil* (1 Peter 3:12).'),
    -- 1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'canon','genesis',6,2, 1, E'*That the sons of Elohim (God) saw the daughters of men... and they took them wives* (Genesis 6:2) — the disobedient spirits of *the days of Noah* (1 Peter 3:20) are the sons of Elohim of Genesis 6.'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,20, 'canon','genesis',6,4, 2, E'*There were giants in the earth in those days... when the sons of Elohim (God) came in unto the daughters of men* (Genesis 6:4) — the fruit of the Watchers'' descent, the corruption the longsuffering waited upon (1 Peter 3:20).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,20, 'canon','genesis',6,5, 3, E'*And GOD saw that the wickedness of man was great in the earth* (Genesis 6:5) — why *the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing* (1 Peter 3:20).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'enoch','1-enoch',10,4, 4, E'*Bind Azâzêl hand and foot, and cast him into the darkness* (1 Enoch 10:4) — the imprisonment of the chief Watcher, the prison Peter names: *the spirits in prison* (1 Peter 3:19).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'enoch','1-enoch',10,12, 5, E'*bind them fast... in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12) — Semjaza and his associates held, not destroyed, awaiting judgement, the bound spirits of 1 Peter 3:19.'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'enoch','1-enoch',10,13, 6, E'*to the torment and the prison in which they shall be confined for ever* (1 Enoch 10:13) — the library''s own word *prison,* the place the quickened Messiah entered to preach (1 Peter 3:19).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,20, 'enoch','1-enoch',12,4, 7, E'*go, declare to the Watchers of the heaven who have left the high heaven... and have taken unto themselves wives* (1 Enoch 12:4) — Enoch sent to proclaim to the disobedient spirits, the pattern of the Messiah''s preaching (1 Peter 3:19).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,20, 'enoch','1-enoch',13,1, 8, E'*Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee* (1 Enoch 13:1) — the announcement of judgement to the bound, as the quickened Son proclaimed to the spirits in prison (1 Peter 3:19).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'enoch','1-enoch',18,14, 9, E'*He was wroth with them, and bound them till the time when their guilt should be consummated* (1 Enoch 18:14) — the fallen host bound until judgement, the prison Peter names (1 Peter 3:19).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'enoch','1-enoch',21,5, 10, E'*this has become a prison for the stars and the host of heaven* (1 Enoch 21:5) — the prison house of the transgressing angels, the spirits in prison (1 Peter 3:19).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'enoch','1-enoch',21,11, 11, E'*This place is the prison of the angels, and here they will be imprisoned for ever* (1 Enoch 21:11) — the plainest naming of the prison under Peter''s *the spirits in prison* (1 Peter 3:19).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,20, 'jubilees','jubilees',5,1, 12, E'*the angels of Elohim (God)... took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1) — the same days of Noah, the same disobedient angels (1 Peter 3:20).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'jubilees','jubilees',5,6, 13, E'*He bade us to bind them in the depths of the earth, and behold they are bound* (Jubilees 5:6) — the fallen angels bound in the depths, the prison of 1 Peter 3:19.'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,20, 'jubilees','jubilees',5,10, 14, E'*bound in the depths of the earth for ever, until the day of the great condemnation* (Jubilees 5:10) — held until judgement, the disobedient spirits of the days of Noah (1 Peter 3:20).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'canon','jude',1,6, 15, E'*the angels which kept not their first estate... reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 6) — the same bound Watchers, Peter''s spirits in prison (1 Peter 3:19).'),
    ('1-peter-3-the-spirits-in-prison-the-days-of-noah-the-watchers-genesis-6-enoch-jubilees', 'canon','1-peter',3,19, 'canon','2-peter',2,4, 16, E'*the angels that sinned... delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4) — the same prison of the same spirits, witnessed across both epistles (1 Peter 3:19).'),
    -- 1-peter-3-baptism-the-like-figure-the-flood-that-saved-noah-genesis-7-wisdom-14
    ('1-peter-3-baptism-the-like-figure-the-flood-that-saved-noah-genesis-7-wisdom-14', 'canon','1-peter',3,21, 'canon','genesis',7,1, 1, E'*Come thou and all thy house into the ark; for thee have I seen righteous before me* (Genesis 7:1) — the saving of Noah''s house, *the like figure whereunto even baptism doth also now save us* (1 Peter 3:21).'),
    ('1-peter-3-baptism-the-like-figure-the-flood-that-saved-noah-genesis-7-wisdom-14', 'canon','1-peter',3,21, 'canon','genesis',7,7, 2, E'*And Noah went in, and his sons, and his wife, and his sons'' wives... into the ark* (Genesis 7:7) — the *eight souls... saved by water* (1 Peter 3:20), the type of the saving passage.'),
    ('1-peter-3-baptism-the-like-figure-the-flood-that-saved-noah-genesis-7-wisdom-14', 'canon','1-peter',3,21, 'apocrypha','the-wisdom-of-solomon',14,7, 3, E'*For blessed is the wood by which righteousness comes* (Wisdom of Solomon 14:7) — the ark, the wood by which the righteous escaped the Flood, the figure of baptism (1 Peter 3:21).'),
    ('1-peter-3-baptism-the-like-figure-the-flood-that-saved-noah-genesis-7-wisdom-14', 'canon','1-peter',3,20, 'canon','hebrews',11,7, 4, E'*By faith Noah... prepared an ark to the saving of his house* (Hebrews 11:7) — the same scene Peter names, *while the ark was a preparing* (1 Peter 3:20).'),
    -- 1-peter-3-on-the-right-hand-of-elohim-angels-made-subject-psalm-110-daniel-7
    ('1-peter-3-on-the-right-hand-of-elohim-angels-made-subject-psalm-110-daniel-7', 'canon','1-peter',3,22, 'canon','psalms',110,1, 1, E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand* (Psalm 110:1) — the Father seats the Son: *is gone into heaven, and is on the right hand of Elohim (God)* (1 Peter 3:22).'),
    ('1-peter-3-on-the-right-hand-of-elohim-angels-made-subject-psalm-110-daniel-7', 'canon','1-peter',3,22, 'canon','daniel',7,14, 2, E'*And there was given him dominion, and glory, and a kingdom... an everlasting dominion* (Daniel 7:14) — the dominion given the Son of Adam, *angels and authorities and powers being made subject unto him* (1 Peter 3:22).')
  ) AS m(thread_slug, src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN cross_reference_threads t ON t.slug = m.thread_slug
  JOIN _s240_p240c3_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s240_p240c3_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id = sv.verse_id AND cr.target_verse_id = tv.verse_id AND cr.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1peter_04.sql (S240 1 Peter 4) -----
-- =====================================================================
-- S240 minion — 1 PETER (Kepha Aleph) CHAPTER 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 PETER 4 (19 verses).
-- Tag: p240c4 (temp view _s240_p240c4_lookup).
-- Sort band: floor 9690, step 3 (9690, 9693, 9696, 9699, 9702, 9705, 9708 used; under 9720).
-- Source is ALWAYS the canon 1 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 Peter = the letter to the SCATTERED ELECT, the dispersed two-house remnant;
-- holiness in suffering; the Torah in force and honored; NO replacement theology, NO law-vs-grace
-- antithesis). Chapter 4 carries: the gospel preached also to them that are dead (4:6) — which
-- CONTINUES the ch3 proclamation to the spirits in prison, the imprisoned WATCHERS of the days of
-- Noah (Genesis 6 / 1 Enoch 10); ★ charity shall cover the multitude of sins (4:8 = Proverbs 10:12,
-- the James 5:20 twin); the fiery trial that tries you as gold in the furnace (4:12 = Proverbs 17:3 /
-- Sirach 2:5 / Malachi 3:3); rejoicing as partakers of Messiah's sufferings, the Spirit of glory
-- resting on the reproached (4:13-14 = Isaiah 11:2 the Spirit of Yahuah rests on the Branch); ★
-- judgment must begin at the house of Elohim, the righteous scarcely saved (4:17-18 = Ezekiel 9:6
-- begin at my sanctuary / Jeremiah 25:29 / Proverbs 11:31 the righteous recompensed in the earth).
-- Christology: it is the Formed Son who *suffered for us in the flesh* (4:1) and through whom *Elohim
-- in all things may be glorified* (4:11) — the Father is glorified through the Son; the Son the
-- faithful Creator's servant. No co-equal-persons grammar, no modalist collapse.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   Messiah suffered in the flesh, arm yourselves, ceased from sin / will of Elohim
--           Tanakh: none warranted (the suffering-in-the-flesh root carried in ch2/ch3 Isaiah-53
--                   and spirits-in-prison apparatus; the *arm yourselves* is exhortation, not quote)
--           Extras: none warranted   NT: none warranted
--   v.3-5   the will of the Gentiles past; ready to judge the quick and the dead
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.6     for this cause was the gospel preached also to them that are dead
--           Tanakh: Genesis 6:5 (the wickedness in the days of Noah — the Watchers' corruption)
--           Extras: 1 Enoch 10:4,12-13 (Azazel and Semjaza bound, the prison of fire, judgment)
--           NT: none warranted (self-link the ch3 spirits-in-prison Watchers thread when live)
--   v.7-8   ★ above all have fervent charity; charity shall cover the multitude of sins
--           Tanakh: Proverbs 10:12 (love covereth all sins)
--           Extras: none warranted   NT: James 5:20 (shall hide a multitude of sins)
--   v.9-11  use hospitality; minister the gift as good stewards; that Elohim be glorified
--           Tanakh: none warranted (stewardship exhortation; no load-bearing single root)
--           Extras: none warranted   NT: none warranted
--   v.12    think it not strange concerning the fiery trial which is to try you
--           Tanakh: Proverbs 17:3 (the furnace for gold; Yahuah trieth the hearts), Malachi 3:3
--                   (he shall sit as a refiner and purify... as gold and silver)
--           Extras: Sirach (Ecclesiasticus) 2:5 (gold is tried in the fire, acceptable men in the
--                   furnace of adversity)
--           NT: none warranted
--   v.13-14 rejoice partakers of Messiah's sufferings; the spirit of glory resteth upon you
--           Tanakh: Isaiah 11:2 (the spirit of Yahuah shall rest upon him)
--           Extras: none warranted   NT: none warranted
--   v.15-16 suffer not as evildoer; if any suffer as a Christian, glorify Elohim
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.17-18 ★ judgment must begin at the house of Elohim; the righteous scarcely saved
--           Tanakh: Ezekiel 9:6 (begin at my sanctuary), Jeremiah 25:29 (I begin to bring evil on
--                   the city called by my name), Proverbs 11:31 (the righteous shall be recompensed
--                   in the earth: much more the wicked and the sinner)
--           Extras: none warranted   NT: none warranted
--   v.19    commit the keeping of their souls to him in well doing, as unto a faithful Creator
--           Tanakh: none warranted (the faithful-Creator commitment is doxological, not a quote)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9690 1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch   (Tanakh + Extras)
--   9693 1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10                                     (Tanakh + NT)
--   9696 1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2 (Tanakh + Extras)
--   9699 1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11                                            (Tanakh)
--   9702 1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11              (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s240_p240c4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch
  ('canon', '1-peter', 4, 6, 'canon', 'genesis', 6, 5, 'free', E'*And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* (Genesis 6:5). Peter''s *for this cause was the gospel preached also to them that are dead* (1 Peter 4:6) does not float free — it returns to the proclamation he has just described, *he went and preached unto the spirits in prison; Which sometime were disobedient... in the days of Noah* (1 Peter 3:19-20). The days of Noah are the days of Genesis 6, when *the sons of Elohim (God) came in unto the daughters of men* (Genesis 6:4) and the earth was filled with the corruption the Watchers wrought; the wickedness *only evil continually* is the corruption Messiah''s Spirit went to confront. The gospel preached and the dead judged belong to the same Flood-and-judgment frame.'),
  ('canon', '1-peter', 4, 6, 'enoch', '1-enoch', 10, 4, 'extras', E'*And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4). The Hebrew library tells exactly what the days of Noah were and where the disobedient spirits were put: Azazel *bound hand and foot* and cast into darkness, the very *spirits in prison* to whom the proclamation came (1 Peter 3:19). Peter''s *the gospel preached also to them that are dead* (1 Peter 4:6) continues that announcement of judgment to the bound Watchers. The same library that names the imprisonment names also the judgment Peter says they await — *that they might be judged according to men in the flesh* (1 Peter 4:6).'),
  ('canon', '1-peter', 4, 6, 'enoch', '1-enoch', 10, 12, 'extras', E'*And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* (1 Enoch 10:12). Semjaza and his associates are *bound fast... in the valleys of the earth, till the day of their judgement* — the imprisoned spirits Messiah went and *preached unto* (1 Peter 3:19), held until the judgment Peter now invokes when he says the gospel was *preached also to them that are dead, that they might be judged* (1 Peter 4:6). The proclamation is the announcement of that appointed judgment to those bound since the days of Noah. *In those days they shall be led off to the abyss of fire... the prison in which they shall be confined for ever* (1 Enoch 10:13).'),
  -- thread: 1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10
  ('canon', '1-peter', 4, 8, 'canon', 'proverbs', 10, 12, 'free', E'*Hatred stirreth up strifes: but love covereth all sins.* (Proverbs 10:12). Peter quotes the proverb almost word for word: *above all things have fervent charity among yourselves: for charity shall cover the multitude of sins* (1 Peter 4:8). Where Solomon set hatred that stirs up strife against the love that *covereth all sins,* Peter sets fervent charity *above all things* — the love that, instead of exposing and multiplying offence, covers it. The wisdom of the Tanakh is the apostle''s rule; the love that covers is the Torah''s own *thou shalt love thy neighbour as thyself* working among the scattered elect.'),
  ('canon', '1-peter', 4, 8, 'canon', 'james', 5, 20, 'free', E'*Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins.* (James 5:20). James, the twin epistle to the scattered twelve tribes, closes with the same proverb Peter cites: turning a sinner back *shall hide a multitude of sins.* Peter says *charity shall cover the multitude of sins* (1 Peter 4:8); James says love that restores *shall hide a multitude of sins* — both reading Proverbs 10:12 (*love covereth all sins*) as the law of love among the brethren. The two letters to the dispersion speak with one voice: the love that covers, that restores, that hides offence, is the mark of the gathered remnant.'),
  -- thread: 1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2
  ('canon', '1-peter', 4, 12, 'canon', 'proverbs', 17, 3, 'free', E'*The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts.* (Proverbs 17:3). Peter tells the suffering elect, *think it not strange concerning the fiery trial which is to try you, as though some strange thing happened unto you* (1 Peter 4:12). The fiery trial is no strange thing but the ancient furnace of the proverb — as *the furnace for gold,* so Yahuah (LORD) *trieth the hearts.* The fire that tests is the Refiner''s own appointed means; the trial is not the absence of his hand but its working, proving the heart as gold is proved in the furnace.'),
  ('canon', '1-peter', 4, 12, 'canon', 'malachi', 3, 3, 'free', E'*And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* (Malachi 3:3). Malachi sees Yahuah (LORD) coming *like a refiner''s fire* to *sit as a refiner and purifier of silver,* purging his people *as gold and silver.* This is the *fiery trial which is to try you* (1 Peter 4:12) — not destruction but purification, the Refiner sitting over the fire until the offering is brought *in righteousness.* The trial of the scattered elect is the same refining Malachi promised, that the people might be made fit to offer rightly unto Yahuah (LORD).'),
  ('canon', '1-peter', 4, 12, 'apocrypha', 'ecclesiasticus', 2, 5, 'extras', E'*For gold is tried in the fire, and acceptable men in the furnace of adversity.* (Sirach / Ecclesiasticus 2:5). The Hebrew library set the same wisdom that Peter speaks: *if you come to serve Yahuah (God), prepare your soul for temptation* (Sirach 2:1), for *gold is tried in the fire, and acceptable men in the furnace of adversity.* Peter''s counsel — *think it not strange concerning the fiery trial which is to try you* (1 Peter 4:12) — is this very teaching: the furnace of adversity is where the acceptable are proved, as gold in the fire. The scattered elect are not to count the trial strange, for it is the appointed proving of those who come to serve.'),
  -- thread: 1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11
  ('canon', '1-peter', 4, 14, 'canon', 'isaiah', 11, 2, 'free', E'*And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* (Isaiah 11:2). Of the Branch from the stem of Jesse Isaiah says *the spirit of Yahuah (LORD) shall rest upon him.* Peter tells the reproached, *If ye be reproached for the name of Messiah (Christ), happy are ye; for the spirit of glory and of Elohim (God) resteth upon you* (1 Peter 4:14). The same resting Spirit that anointed the Messiah rests now upon those who suffer for his name — the elect made partakers of Messiah''s sufferings are made partakers also of the Spirit that rested on him, the spirit of glory abiding on the reproached.'),
  -- thread: 1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11
  ('canon', '1-peter', 4, 17, 'canon', 'ezekiel', 9, 6, 'free', E'*Slay utterly old and young, both maids, and little children, and women: but come not near any man upon whom is the mark; and begin at my sanctuary. Then they began at the ancient men which were before the house.* (Ezekiel 9:6). When Yahuah (LORD) sent the slaughter through Jerusalem, the command was *begin at my sanctuary* — and they began at the house. Peter speaks the same order of judgment: *the time is come that judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not the gospel of Elohim (God)?* (1 Peter 4:17). Judgment falls first on the house of Elohim (God), upon his own; the visitation that begins at the sanctuary is the pattern Peter sees coming upon the scattered elect, and how much more upon the disobedient.'),
  ('canon', '1-peter', 4, 17, 'canon', 'jeremiah', 25, 29, 'free', E'*For, lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished: for I will call for a sword upon all the inhabitants of the earth, saith Yahuah Tseva''ot (LORD of hosts).* (Jeremiah 25:29). Yahuah (LORD) declares the order of his judgment: *I begin to bring evil on the city which is called by my name* — judgment begins at his own, and from there reaches all the earth. Peter reads the suffering of the elect by this rule: *judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not the gospel* (1 Peter 4:17). If those called by his name are not spared the beginning of judgment, the wicked shall by no means escape its end.'),
  ('canon', '1-peter', 4, 18, 'canon', 'proverbs', 11, 31, 'free', E'*Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner.* (Proverbs 11:31). Peter''s *if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:18) is Proverbs 11:31 spoken aloud — *the righteous shall be recompensed in the earth: much more the wicked and the sinner.* If even the righteous are recompensed, refined, and brought through with difficulty, the ungodly and the sinner have no standing at all. The proverb is the ground of the apostle''s argument from the house of Elohim (God) outward: judgment beginning with the righteous is the surest warning to the wicked.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s240_p240c4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s240_p240c4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch',
       E'For this cause was the gospel preached also to them that are dead — the days of Noah, the Watchers (Genesis 6, 1 Enoch 10)',
       E'*For for this cause was the gospel preached also to them that are dead, that they might be judged according to men in the flesh, but live according to Elohim (God) in the spirit* (1 Peter 4:6). This verse does not stand alone; it returns to what Peter has just declared — that Messiah, *quickened by the Spirit... went and preached unto the spirits in prison; Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing* (1 Peter 3:18-20). The days of Noah are the days of Genesis 6, when *the sons of Elohim (God) came in unto the daughters of men* (Genesis 6:4) and *GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5) — the corruption the Watchers wrought. The Hebrew library names exactly what became of those disobedient spirits and where they are held: *Bind Azâzêl hand and foot, and cast him into the darkness... and cover his face that he may not see light* (1 Enoch 10:4-5), and of Semjaza''s host, *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation... In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever* (1 Enoch 10:12-13). These are the *spirits in prison* to whom the proclamation came — and the gospel *preached also to them that are dead* (1 Peter 4:6) is the announcement of that appointed judgment, *that they might be judged.* The Christology stands clear: it is the Formed Son, put to death in the flesh and *quickened by the Spirit,* who proclaims — and the Father is the One who raised him. The Flood-and-judgment frame of Genesis 6 and the bound Watchers of the restored library are the very furniture of Peter''s words.',
       sv.verse_id, ev.verse_id, 'extras', 9690
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10',
       E'Charity shall cover the multitude of sins (Proverbs 10, James 5)',
       E'*And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins* (1 Peter 4:8). Peter quotes the proverb of Solomon almost word for word: *Hatred stirreth up strifes: but love covereth all sins* (Proverbs 10:12). Where hatred exposes, multiplies, and stirs up strife, love *covereth* — it bears, restores, and hides the offence rather than broadcasting it. This is no soft sentiment but the Torah''s own *thou shalt love thy neighbour as thyself* working among the scattered elect, set *above all things.* And mark the twin: James, the companion letter to the dispersed twelve tribes, closes with the very same proverb — *he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* (James 5:20). Peter says charity *shall cover the multitude of sins*; James says restoring love *shall hide a multitude of sins.* The two letters to the dispersion read Proverbs 10:12 with one voice: the love that covers, that restores, that hides offence, is the mark of the gathered remnant of Yashar''el (Israel).',
       sv.verse_id, ev.verse_id, 'free', 9693
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2',
       E'The fiery trial which is to try you — as gold in the furnace (Proverbs 17, Malachi 3, Sirach 2)',
       E'*Beloved, think it not strange concerning the fiery trial which is to try you, as though some strange thing happened unto you* (1 Peter 4:12). The fiery trial is no strange thing but the ancient furnace of the wisdom of the Tanakh. *The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts* (Proverbs 17:3) — the fire that tests is the Refiner''s own appointed means, proving the heart as gold is proved. Malachi sees the Refiner sitting over that fire: *he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3) — the trial is not destruction but purification, that the people may offer rightly. And the Hebrew library set the same teaching plainly: *if you come to serve Yahuah (God), prepare your soul for temptation* (Sirach 2:1), *for gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). The scattered elect are not to count the trial strange, for the furnace of adversity is the very place where the acceptable are proved — the same fire that refines gold, the Refiner''s hand upon his own.',
       sv.verse_id, ev.verse_id, 'extras', 9696
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11',
       E'The spirit of glory and of Elohim resteth upon you (Isaiah 11)',
       E'*If ye be reproached for the name of Messiah (Christ), happy are ye; for the spirit of glory and of Elohim (God) resteth upon you: on their part he is evil spoken of, but on your part he is glorified* (1 Peter 4:14). Peter takes the very language of Isaiah''s prophecy of the Branch. Of the rod out of the stem of Jesse Isaiah says, *the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD)* (Isaiah 11:2). The same resting Spirit that anointed the Messiah now *resteth upon* those who suffer for his name. To be made *partakers of Messiah''s (Christ''s) sufferings* (1 Peter 4:13) is to be made partakers also of the Spirit that rested on him — the spirit of glory abiding upon the reproached, so that what men speak against is in truth the glory of Elohim (God) resting on his elect.',
       sv.verse_id, ev.verse_id, 'free', 9699
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11',
       E'Judgment must begin at the house of Elohim — the righteous scarcely saved (Ezekiel 9, Jeremiah 25, Proverbs 11)',
       E'*For the time is come that judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not the gospel of Elohim (God)? And if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:17-18). Peter reads the suffering of the scattered elect by an order of judgment written deep in the prophets. When Yahuah (LORD) sent the slaughter through Jerusalem the command was *come not near any man upon whom is the mark; and begin at my sanctuary. Then they began at the ancient men which were before the house* (Ezekiel 9:6) — judgment falls first upon the house of Elohim (God), upon his own. Jeremiah declares the same rule and draws out its consequence for the wicked: *lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished* (Jeremiah 25:29) — if those called by his name are not spared the beginning of judgment, the disobedient shall by no means escape its end. And Peter''s second sentence is Solomon''s proverb spoken aloud: *Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner* (Proverbs 11:31). If even the righteous are recompensed, refined, and brought through with difficulty, the ungodly and the sinner have no standing at all. The visitation that begins at the sanctuary is the warning Peter holds before the elect — and the surest warning to those who obey not the gospel of Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 9702
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *GOD saw that the wickedness of man was great in the earth... every imagination of the thoughts of his heart was only evil continually* the corruption of the days of Noah, the frame of the gospel preached *also to them that are dead* (1 Peter 4:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *Bind Azâzêl hand and foot, and cast him into the darkness* the binding of the disobedient Watcher, the *spirits in prison* to whom the proclamation came (1 Peter 3:19; 4:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:12 — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* the imprisoned Watchers held until the judgment Peter invokes: *that they might be judged* (1 Peter 4:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:12 — *Hatred stirreth up strifes: but love covereth all sins* the proverb Peter quotes: *charity shall cover the multitude of sins* (1 Peter 4:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:20 — *he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* the twin epistle to the dispersion quoting the same Proverbs 10:12 (1 Peter 4:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:3 — *The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts* the furnace of the wisdom of the Tanakh; the *fiery trial which is to try you* (1 Peter 4:12).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:3 — *he shall sit as a refiner and purifier of silver... and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* the trial as purification, not destruction; the Refiner over the *fiery trial* (1 Peter 4:12).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach (Ecclesiasticus) 2:5 — *gold is tried in the fire, and acceptable men in the furnace of adversity* the Hebrew library''s same teaching, *if you come to serve Yahuah (God), prepare your soul for temptation* (Sirach 2:1); think the trial not strange (1 Peter 4:12).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:2 — *the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding* the resting Spirit on the Branch; *the spirit of glory and of Elohim (God) resteth upon you* the reproached (1 Peter 4:14).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 9:6 — *begin at my sanctuary. Then they began at the ancient men which were before the house* judgment falling first on the house; *judgment must begin at the house of Elohim (God)* (1 Peter 4:17).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 25:29 — *I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished?* judgment beginning at his own, the wicked not escaping; *what shall the end be of them that obey not the gospel* (1 Peter 4:17).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 11:31 — *the righteous shall be recompensed in the earth: much more the wicked and the sinner* the proverb behind Peter''s second sentence; *if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:18).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1peter_05.sql (S240 1 Peter 5) -----
-- =====================================================================
-- S240 minion — 1 PETER 5 (Kepha Aleph 5) FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 Peter 5 (14 verses) — the chief Shepherd / grace to the humble / the roaring lion.
-- Tag: p240c5 (temp view _s240_p240c5_lookup).
-- Sort band: floor 9720, step 3 (9720, 9723, 9726, 9729, 9732, 9735 used; under 9750).
-- Source is ALWAYS the canon 1 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 Peter = the letter to the scattered elect — the dispersed two-house remnant,
-- holiness in suffering, the Torah in force and honored; NOT a church replacing Yashar'el (Israel),
-- NOT a law-vs-grace antithesis). Chapter 5 closes the letter with the under-shepherds charged to
-- *feed the flock of Elohim (God)* — the very charge Yahuah (LORD) laid against the false shepherds
-- of Yashar'el (Israel) in Ezekiel 34, where He Himself comes to seek the scattered sheep and sets
-- over them *one shepherd... my servant David.* Peter names that One *the chief Shepherd* who shall
-- appear (5:4). The chapter's keystone is 5:5 — *Elohim (God) resisteth the proud, and giveth grace
-- to the humble* — Proverbs 3:34 quoted as binding scripture, the very verse James 4:6 quotes (the
-- twin). The humbling under the mighty hand (Job 22:29 / Matthew 23:12), the casting of all care
-- (Psalm 55:22), and the adversary as a roaring lion (Job 1:7 / Psalm 22:13) all rest on Tanakh
-- roots. Christology kept exact: *the Elohim (God) of all grace, who hath called us unto his eternal
-- glory by HaMashiach Yahusha (Christ Jesus)* (5:10) — the Father the source and caller, the Son the
-- one through whom; no co-equal-persons grammar, no modalist collapse.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   feed the flock of Elohim, taking the oversight, not as lords but ensamples
--           Tanakh: Ezekiel 34:2 (the shepherds that feed themselves), 34:4 (the lost not sought),
--                   34:10 (I am against the shepherds), 34:15-16 (I will feed my flock)
--           Extras: none warranted   NT: Acts 20:28 (feed the church... over which made you overseers)
--   v.4     the chief Shepherd shall appear / a crown of glory that fadeth not away
--           Tanakh: Ezekiel 34:23 (one shepherd... my servant David), Psalm 23:1 (Yahuah is my shepherd)
--           Extras: none warranted   NT: John 10:11 (I am the good shepherd... giveth his life)
--   v.5     be clothed with humility: Elohim resisteth the proud, giveth grace to the humble [BLESSING]
--           Tanakh: Proverbs 3:34 (he giveth grace unto the lowly), Isaiah 57:15 (with him of a
--                   humble spirit), Proverbs 29:23 (honour shall uphold the humble in spirit)
--           Extras: none warranted   NT: James 4:6 (Elohim resisteth the proud — the twin quotation)
--   v.6     humble yourselves under the mighty hand of Elohim, that he may exalt you
--           Tanakh: Job 22:29 (he shall save the humble person)
--           Extras: none warranted   NT: Matthew 23:12 (he that shall humble himself shall be exalted)
--   v.7     casting all your care upon him; for he careth for you
--           Tanakh: Psalm 55:22 (Cast thy burden upon Yahuah, and he shall sustain thee)
--           Extras: none warranted   NT: none warranted
--   v.8     your adversary the devil, as a roaring lion, walketh about
--           Tanakh: Job 1:7 (Satan from going to and fro in the earth), Psalm 22:13 (as a ravening
--                   and a roaring lion)
--           Extras: none warranted   NT: none warranted
--   v.9-14  resist stedfast / the Elohim of all grace / Babylon / kiss of charity
--           Tanakh: none warranted (the suffering-then-glory carried in the apparatus; greeting verses
--                   have no load-bearing root)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9720 1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34         (Tanakh + NT)
--   9723 1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23  (Tanakh + NT)
--   9726 1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3      (Tanakh + NT)  [BLESSING]
--   9729 1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22         (Tanakh + NT)
--   9732 1-peter-5-casting-all-your-care-upon-him-psalm-55                          (Tanakh)
--   9735 1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22                    (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s240_p240c5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34
  ('canon', '1-peter', 5, 2, 'canon', 'ezekiel', 34, 2, 'free', E'*Son of Adam, prophesy against the shepherds of Yashar''el (Israel), prophesy, and say unto them, Thus saith Adonai Yahuah (the Lord GOD) unto the shepherds; Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2). Yahuah (LORD) charged the shepherds of Yashar''el (Israel) with feeding themselves and not the flock. Peter lays the same charge on the elders: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind* (1 Peter 5:2). The flock is Yahuah''s (LORD''s); the shepherd''s task is to feed it, never to feed off it — *not for filthy lucre* answers Ezekiel''s shepherds who ate the fat and clothed themselves with the wool.'),
  ('canon', '1-peter', 5, 2, 'canon', 'ezekiel', 34, 4, 'free', E'*The diseased have ye not strengthened, neither have ye healed that which was sick, neither have ye bound up that which was broken, neither have ye brought again that which was driven away, neither have ye sought that which was lost; but with force and with cruelty have ye ruled them.* (Ezekiel 34:4). The false shepherds *ruled them* *with force and with cruelty* — and Peter forbids exactly this: *Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock* (1 Peter 5:3). The under-shepherd is not to lord it over the heritage of Elohim (God) as Ezekiel''s shepherds lorded over Yahuah''s (LORD''s) sheep, but to lead by example, gathering the driven-away and the lost.'),
  ('canon', '1-peter', 5, 3, 'canon', 'ezekiel', 34, 10, 'free', E'*Thus saith Adonai Yahuah (the Lord GOD); Behold, I am against the shepherds; and I will require my flock at their hand, and cause them to cease from feeding the flock; neither shall the shepherds feed themselves any more; for I will deliver my flock from their mouth, that they may not be meat for them.* (Ezekiel 34:10). Yahuah (LORD) will *require my flock at their hand* — the shepherds answer to Him for the sheep. Peter writes as one *who am also an elder* (1 Peter 5:1) charging the elders to shepherd *not as being lords over Elohim''s (God''s) heritage* (1 Peter 5:3): the flock belongs to Elohim (God), and those who oversee it are accountable to the One who owns it.'),
  ('canon', '1-peter', 5, 2, 'canon', 'ezekiel', 34, 15, 'free', E'*I will feed my flock, and I will cause them to lie down, saith Adonai Yahuah (the Lord GOD). I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick: but I will destroy the fat and the strong; I will feed them with judgment.* (Ezekiel 34:15-16). Where the false shepherds failed, Yahuah (LORD) Himself comes: *I will feed my flock... I will seek that which was lost.* The elders Peter charges to *feed the flock of Elohim (God)... taking the oversight thereof* (1 Peter 5:2) serve under that true Shepherd; their feeding is His feeding extended, never their own.'),
  ('canon', '1-peter', 5, 2, 'canon', 'acts', 20, 28, 'free', E'*Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God), which he hath purchased with his own blood.* (Acts 20:28). Paul charged the elders of Ephesus in the very words Peter uses — *to feed the church of Elohim (God)* as *overseers.* The same apostolic charge runs through both: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof* (1 Peter 5:2). The flock is purchased and owned by Elohim (God); the overseers are stewards set over what is His.'),
  -- thread: 1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23
  ('canon', '1-peter', 5, 4, 'canon', 'ezekiel', 34, 23, 'free', E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* (Ezekiel 34:23). After the false shepherds are removed, Yahuah (LORD) promises *one shepherd... my servant David* over the regathered flock. Peter names His appearing: *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away* (1 Peter 5:4). The under-shepherds feed the flock until the *chief Shepherd* — the promised one-shepherd, the Branch of David — is revealed; He is the head over all who tend His sheep.'),
  ('canon', '1-peter', 5, 4, 'canon', 'psalms', 23, 1, 'free', E'*Yahuah Ra''ah (The LORD is my shepherd); I shall not want.* (Psalm 23:1). David sang of Yahuah (LORD) as his shepherd who leads, restores, and dwells with His sheep for ever. The chief Shepherd whom Peter awaits — *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away* (1 Peter 5:4) — is that same Shepherd of the flock, the One in whose house the sheep dwell *for ever.* The crown that *fadeth not away* is the abiding goodness and mercy of the Shepherd''s own keeping.'),
  ('canon', '1-peter', 5, 4, 'canon', 'john', 10, 11, 'free', E'*I am the good shepherd: the good shepherd giveth his life for the sheep.* (John 10:11). Yahusha (Jesus) declared Himself the good shepherd who lays down His life — the fulfilment of Ezekiel''s *one shepherd... my servant David* and of Yahuah (LORD) coming to feed His own flock. Peter names His return *the chief Shepherd* who *shall appear* (1 Peter 5:4): the Shepherd who gave His life for the sheep is the One the under-shepherds serve and await, at whose appearing the faithful receive *a crown of glory that fadeth not away.*'),
  -- thread: 1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3  [BLESSING]
  ('canon', '1-peter', 5, 5, 'canon', 'proverbs', 3, 34, 'free', E'*Surely he scorneth the scorners: but he giveth grace unto the lowly.* (Proverbs 3:34). This is the very scripture Peter quotes: *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Yahuah (LORD) scorns the scorners — *resisteth the proud* — but *giveth grace unto the lowly.* The lowly and the humble are one; the grace is given precisely to those who do not exalt themselves. This is the same verse James 4:6 quotes, the two pillars of the scattered citing one proverb as binding scripture.'),
  ('canon', '1-peter', 5, 5, 'canon', 'isaiah', 57, 15, 'free', E'*For thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble, and to revive the heart of the contrite ones.* (Isaiah 57:15). The high and lofty One dwells *with him also that is of a contrite and humble spirit* — He *giveth grace to the humble* (1 Peter 5:5) by dwelling with them and reviving them. Where pride is resisted, the humble spirit is the very place where the Holy One makes His home; Peter''s *be clothed with humility* is the garment that draws near the One who inhabiteth eternity.'),
  ('canon', '1-peter', 5, 5, 'canon', 'proverbs', 29, 23, 'free', E'*A man''s pride shall bring him low: but honour shall uphold the humble in spirit.* (Proverbs 29:23). The proverb states the double law Peter quotes: *a man''s pride shall bring him low* — Elohim (God) *resisteth the proud* — *but honour shall uphold the humble in spirit* — He *giveth grace to the humble* (1 Peter 5:5). Pride is its own undoing; humility is its own exaltation by the hand of Yahuah (LORD). The clothing of humility Peter commands is the way of honour, not of shame.'),
  ('canon', '1-peter', 5, 5, 'canon', 'james', 4, 6, 'free', E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* (James 4:6). James and Peter — both writing to the scattered (James 1:1; 1 Peter 1:1) — quote the same Proverbs 3:34 word for word: *Elohim (God) resisteth the proud, but giveth grace unto the humble.* Peter writes it as *Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). The twin quotation binds the two epistles of the dispersion: one proverb, cited as scripture by both apostles, the standard of the humbled and gathered remnant.'),
  -- thread: 1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22
  ('canon', '1-peter', 5, 6, 'canon', 'job', 22, 29, 'free', E'*When men are cast down, then thou shalt say, There is lifting up; and he shall save the humble person.* (Job 22:29). Job''s counsel holds the same law as Peter''s charge: *he shall save the humble person* — and *Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6). The cast-down who humble themselves are the ones Yahuah (LORD) lifts up; the *lifting up* of Job is the *exalt you in due time* of Peter — exaltation is His to give, in His season, to the lowly.'),
  ('canon', '1-peter', 5, 6, 'canon', 'matthew', 23, 12, 'free', E'*And whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted.* (Matthew 23:12). Yahusha (Jesus) spoke the law of the kingdom that Peter now applies: *he that shall humble himself shall be exalted.* Peter writes *Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6). The one who refuses to exalt himself and bows under the mighty hand is the one Elohim (God) raises; self-exaltation is abasement, self-humbling is the path to glory in due time.'),
  -- thread: 1-peter-5-casting-all-your-care-upon-him-psalm-55
  ('canon', '1-peter', 5, 7, 'canon', 'psalms', 55, 22, 'free', E'*Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved.* (Psalm 55:22). David''s charge is the root of Peter''s: *Cast thy burden upon Yahuah (LORD), and he shall sustain thee* becomes *Casting all your care upon him; for he careth for you* (1 Peter 5:7). The burden cast on Yahuah (LORD) is met by His sustaining; the care cast on Him is answered by His caring. The humbled who bow under the mighty hand (1 Peter 5:6) are the very ones invited to unload every care upon the One who will not let the righteous be moved.'),
  -- thread: 1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22
  ('canon', '1-peter', 5, 8, 'canon', 'job', 1, 7, 'free', E'*And Yahuah (LORD) said unto Satan, Whence comest thou? Then Satan answered Yahuah (LORD), and said, From going to and fro in the earth, and from walking up and down in it.* (Job 1:7). The adversary in Job is the one *going to and fro in the earth,* prowling among men — exactly Peter''s warning: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The Satan who *walketh up and down in it* in Job is the *adversary* who *walketh about* in Peter; the saints are to be sober and watchful against the same prowling enemy.'),
  ('canon', '1-peter', 5, 8, 'canon', 'psalms', 22, 13, 'free', E'*They gaped upon me with their mouths, as a ravening and a roaring lion.* (Psalm 22:13). The psalm of the suffering righteous one likens his attackers to *a ravening and a roaring lion* — the very image Peter gives the devil: *your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The roaring lion that gaped upon David''s anointed is the adversary the scattered saints must *resist stedfast in the faith* (1 Peter 5:9), knowing the same afflictions are accomplished in their brethren in the world.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s240_p240c5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s240_p240c5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34',
       E'Feed the flock of Elohim (God), taking the oversight thereof (Ezekiel 34)',
       E'Peter closes the letter charging the elders: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind; Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock* (1 Peter 5:2-3). Every clause answers the great shepherd-oracle of Ezekiel 34, where Yahuah (LORD) indicted the shepherds of Yashar''el (Israel): *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2). They ate the fat and clothed themselves with the wool; *the diseased have ye not strengthened... neither have ye sought that which was lost; but with force and with cruelty have ye ruled them* (Ezekiel 34:4) — the very lording Peter forbids. So Yahuah (LORD) declared, *Behold, I am against the shepherds; and I will require my flock at their hand* (Ezekiel 34:10): the flock is His, and its overseers answer to Him. And He pledged to do Himself what they would not: *I will feed my flock... I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken* (Ezekiel 34:15-16). The under-shepherds Peter charges serve under that true Shepherd; their feeding is His feeding extended, never their own profit. Paul gave the identical charge at Ephesus — *feed the church of Elohim (God), which he hath purchased with his own blood* (Acts 20:28). The flock is purchased and owned by Elohim (God); to oversee it is to steward what is His, gathering the lost and the driven-away as He commanded, not feeding off the sheep but feeding them.',
       sv.verse_id, ev.verse_id, 'free', 9720
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23',
       E'When the chief Shepherd shall appear, a crown of glory (Ezekiel 34, Psalm 23)',
       E'*And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away* (1 Peter 5:4). The under-shepherds feed the flock until the *chief Shepherd* is revealed — and that one Shepherd is the promise of Ezekiel 34. After Yahuah (LORD) removes the false shepherds and gathers the scattered, He vows: *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The *chief Shepherd* is that promised one-shepherd, the Branch of David set over the regathered flock. He is the Shepherd David himself sang of: *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1) — the One who leads, restores, and keeps His sheep in His house *for ever.* And He is the One who named Himself in the flesh: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). The good shepherd who laid down His life, the *one shepherd... my servant David,* and *Yahuah Ra''ah (The LORD is my shepherd)* are the same chief Shepherd whose appearing the faithful await. The *crown of glory that fadeth not away* is the abiding portion of those whom He keeps — goodness and mercy that follow His sheep all their days, the unfading inheritance of the flock at the Shepherd''s appearing.',
       sv.verse_id, ev.verse_id, 'free', 9723
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3',
       E'Elohim (God) resisteth the proud, and giveth grace to the humble (Proverbs 3)',
       E'*Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Peter quotes the proverb *according to the scripture* — the very verse James cites: *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34). Yahuah (LORD) scorns the scorners — *resisteth the proud* — but pours grace on the lowly. James, writing like Peter to the scattered, quotes the same word for word: *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). Two apostles of the dispersion, one proverb, cited as binding scripture — the standard of the humbled and gathered remnant. The Tanakh holds the double law throughout: *A man''s pride shall bring him low: but honour shall uphold the humble in spirit* (Proverbs 29:23) — pride is its own undoing, humility its own exaltation by the hand of Yahuah (LORD). And the place where grace is given is the humble spirit itself: *thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble, and to revive the heart of the contrite ones* (Isaiah 57:15). The Holy One makes His home with the contrite; to *be clothed with humility* is to put on the garment that draws near the One who inhabiteth eternity. Pride He resists; the lowly He revives, upholds with honour, and crowns with grace.',
       sv.verse_id, ev.verse_id, 'free', 9726
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22',
       E'Humble yourselves under the mighty hand of Elohim (God) (Job 22, Matthew 23)',
       E'*Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6). The grace given to the humble (1 Peter 5:5) flows straight into this charge: bow low, and Elohim (God) Himself will lift you up in His season. Job''s counsel holds the same law: *When men are cast down, then thou shalt say, There is lifting up; and he shall save the humble person* (Job 22:29). The cast-down who humble themselves are the ones Yahuah (LORD) lifts; the *lifting up* of Job is Peter''s *exalt you in due time* — exaltation is His to give, never self-seized. Yahusha (Jesus) spoke the same law of the kingdom: *whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted* (Matthew 23:12). Self-exaltation ends in abasement; self-humbling under the mighty hand ends in glory. The mighty hand that humbles is the same hand that exalts, in due time, the one who waits low beneath it.',
       sv.verse_id, ev.verse_id, 'free', 9729
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-casting-all-your-care-upon-him-psalm-55',
       E'Casting all your care upon him; for he careth for you (Psalm 55)',
       E'*Casting all your care upon him; for he careth for you* (1 Peter 5:7). Peter draws this directly from David''s psalm of distress: *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved* (Psalm 55:22). The burden cast on Yahuah (LORD) is met by His sustaining; the care cast on Him is answered by His caring. The two charges belong together: those who *humble yourselves... under the mighty hand of Elohim (God)* (1 Peter 5:6) are the very ones invited to unload every care upon Him — for the humbling and the casting are one act of trust, the bowing-low that lets go of all anxiety into the hands of the One who *shall never suffer the righteous to be moved.* He who careth for His own bears the weight His sheep cannot.',
       sv.verse_id, ev.verse_id, 'free', 9732
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22',
       E'Your adversary the devil, as a roaring lion, walketh about (Job 1, Psalm 22)',
       E'*Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The adversary who *walketh about* is the very Satan of Job: *Yahuah (LORD) said unto Satan, Whence comest thou? Then Satan answered Yahuah (LORD), and said, From going to and fro in the earth, and from walking up and down in it* (Job 1:7). The one *going to and fro in the earth,* prowling among men, is the *adversary* who *walketh about* — and the saints are to be sober and watchful against him. His likeness as a *roaring lion* is the image of the psalm of the suffering righteous one: *They gaped upon me with their mouths, as a ravening and a roaring lion* (Psalm 22:13). The lion that gaped upon David''s anointed is the adversary the scattered must *resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world* (1 Peter 5:9). The enemy roars and prowls, but he is a defeated prowler before Yahuah (LORD); the watchful and steadfast withstand him, and the Elohim (God) of all grace stablishes them after they have suffered a while.',
       sv.verse_id, ev.verse_id, 'free', 9735
  FROM _s240_p240c5_lookup sv, _s240_p240c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:2 — *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* the charge against the false shepherds; *Feed the flock of Elohim (God)... not for filthy lucre* (1 Peter 5:2).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 34:4 — *with force and with cruelty have ye ruled them* the lording over the sheep; *Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock* (1 Peter 5:3).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 34:10 — *I will require my flock at their hand* the shepherds accountable for the sheep; *not as being lords over Elohim''s (God''s) heritage* (1 Peter 5:3) — the flock belongs to Elohim (God).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 34:15 — *I will feed my flock... I will seek that which was lost* Yahuah (LORD) the true Shepherd; the elders'' *Feed the flock of Elohim (God)... taking the oversight* (1 Peter 5:2) is His feeding extended.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 20:28 — *to feed the church of Elohim (God), which he hath purchased with his own blood* Paul''s identical charge to the Ephesian elders; *Feed the flock of Elohim (God)... taking the oversight thereof* (1 Peter 5:2).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-feed-the-flock-of-elohim-taking-the-oversight-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:23 — *I will set up one shepherd over them... even my servant David... he shall be their shepherd* the promised one-shepherd; *when the chief Shepherd shall appear* (1 Peter 5:4).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 23:1 — *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* the Shepherd in whose house the sheep dwell for ever; *a crown of glory that fadeth not away* (1 Peter 5:4).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 10:11 — *I am the good shepherd: the good shepherd giveth his life for the sheep* Yahusha (Jesus) the good shepherd; the chief Shepherd who *shall appear* (1 Peter 5:4).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-chief-shepherd-shall-appear-and-a-crown-of-glory-ezekiel-34-psalm-23'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:34 — *he scorneth the scorners: but he giveth grace unto the lowly* the scripture Peter quotes; *Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:6 — *Elohim (God) resisteth the proud, but giveth grace unto the humble* the twin quotation of Proverbs 3:34 by the other apostle of the dispersion; *giveth grace to the humble* (1 Peter 5:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 29:23 — *A man''s pride shall bring him low: but honour shall uphold the humble in spirit* the double law of pride and humility; *Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 57:15 — *I dwell in the high and holy place, with him also that is of a contrite and humble spirit* the Holy One dwells with the humble; *giveth grace to the humble... be clothed with humility* (1 Peter 5:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-grace-unto-the-humble-elohim-resisteth-the-proud-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 22:29 — *There is lifting up; and he shall save the humble person* the cast-down lifted; *Humble yourselves... under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=22 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:12 — *he that shall humble himself shall be exalted* the law of the kingdom; *Humble yourselves... that he may exalt you in due time* (1 Peter 5:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-humble-yourselves-under-the-mighty-hand-of-elohim-job-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-casting-all-your-care-upon-him-psalm-55
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 55:22 — *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved* the root of Peter''s charge; *Casting all your care upon him; for he careth for you* (1 Peter 5:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-casting-all-your-care-upon-him-psalm-55'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 1:7 — *Satan... From going to and fro in the earth, and from walking up and down in it* the prowling adversary; *your adversary the devil, as a roaring lion, walketh about* (1 Peter 5:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:13 — *They gaped upon me with their mouths, as a ravening and a roaring lion* the lion against the suffering righteous one; *your adversary the devil, as a roaring lion* (1 Peter 5:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c5_lookup sv, _s240_p240c5_lookup tv
 WHERE t.slug='1-peter-5-the-adversary-as-a-roaring-lion-job-1-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session240 — 1 Peter cross-references complete.'
