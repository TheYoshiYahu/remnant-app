-- =====================================================================
-- Session 217 — Acts of the Apostles FULL-LIBRARY cross-references
-- =====================================================================
-- Greenfield Acts apparatus (Acts had no prior xref migration). Built per
-- S217_ACTS_ORCHESTRATION_PLAN.md: per-chapter-range minions, each authoring
-- ALL THREE library layers (Tanakh + extra-canonical + New Testament) for its
-- chapters on the edition-aware FULL-LIBRARY schema, with a per-chapter
-- library-coverage checklist. Come-and-See posture: every target verse quoted
-- IN FULL in stand-alone italics; sacred names restored; son-of-man -> Son of
-- Adam (kaph preserved at Daniel 7:13); English book-name slug fragments.
--
-- Tiers per-row: canon targets (Tanakh + NT) = 'free'; extra-canonical
-- targets = 'extras'. Thread tier = 'extras' if any member is extras.
-- Sort band: 5000+ (Acts), Acts 1-2 pilot in 5000-5099.
--
-- This migration: ACTS 1-2 pilot (fragment minion_acts_01_02.sql)
--                 + ACTS 3-5      (fragment minion_acts_03_05.sql)
--                 + ACTS 6-7      (fragment minion_acts_06_07.sql).
-- Every target tuple verified verbatim against the parsed editions
-- (scratch_xref_acts/verify_fidelity.py). Idempotent: ON CONFLICT DO NOTHING.
-- Apply (from Yoshi's Mac Terminal):
--   python3 api/apply_migration.py data-schema/migrations/session217_acts_cross_references.sql
-- =====================================================================

\echo 'Session 217 — Acts 1-7 full-library cross-references starting...'
BEGIN;

-- ----- fragment: minion_acts_01_02.sql (S217 Acts 1-2 pilot) -----
-- =====================================================================
-- S217 minion — ACTS 1-2 (the proving range) FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 1-2.  Tag: a0102 (temp view _s217_a0102_lookup).  Sort band: 5000-5099.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 1:
--   v.6-8  restore-the-kingdom  Tanakh: Ezekiel 37:21-22, Amos 9:11, Isaiah 11:12
--          Extras: Tobit 14:5, 2 Esdras 13:40, Ecclesiasticus 48:10  NT: Matthew 19:28, Acts 15:16
--   v.9-12 ascension/return     Tanakh: Daniel 7:13, Zechariah 14:4  Extras: 1 Enoch 1:9  NT: Revelation 1:7
--   v.13-15 upper-room/120      Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative roster)
--   v.16-20 Judas/the psalms    Tanakh: Psalm 69:25, 109:8, 41:9  Extras: none warranted  NT: John 13:18
--   v.21-26 lots/Matthias       Tanakh: (Proverbs 16:33 weighed) none added  Extras: none warranted  NT: none warranted
--  ACTS 2:
--   v.1-4  Pentecost/Shavuot     Tanakh: Exodus 19:18, Jeremiah 31:33, Ezekiel 36:27
--          Extras: Jubilees 6:17,21  NT: 2 Corinthians 3:3, Hebrews 8:10
--   v.5-13 tongues/nations       Tanakh: (Genesis 11 Babel weighed) none added  Extras: none warranted  NT: none warranted
--   v.16-21 Joel outpouring       Tanakh: Joel 2:28,32, Ezekiel 39:29, Isaiah 44:3, Numbers 11:29
--          Extras: (Testaments XII Levi/Judah outpouring weighed; cleanest witnesses canon) none added  NT: Romans 10:13, Titus 3:6
--   v.22-32 resurrection/Psalm 16 Tanakh: Psalm 16:10-11  Extras: none warranted  NT: Acts 13:35
--   v.33-36 Psalm 110 enthroned   Tanakh: Psalm 110:1, Daniel 7:14  Extras: 1 Enoch 62:1,7  NT: Matthew 22:44, Philippians 2:11, Hebrews 1:13
--   v.37-39 afar-off called       Tanakh: Isaiah 57:19, Deuteronomy 30:4, Joel 2:32  Extras: (Tobit 13:5 weighed; threaded above) none added  NT: Ephesians 2:13,17
--   v.40-47 firstfruits commune   Tanakh: none added (Shavuot/firstfruits carried in v.1-4 thread)  Extras/NT: none warranted
-- =====================================================================

CREATE TEMP VIEW _s217_a0102_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering
  ('canon', 'acts', 1, 6, 'canon', 'ezekiel', 37, 21, 'free', E'*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21). The disciples'' question in Acts 1:6 is the prophet''s own. Ezekiel names the gathering that restores the kingdom: the scattered taken from among the heathen and brought into their own land.'),
  ('canon', 'acts', 1, 6, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). The restored kingdom is the two houses made one — one nation, one king, the divided kingdom of Ephraim and Yahudah (Judah) ended. That is the restoration the disciples ask after in Acts 1:6.'),
  ('canon', 'acts', 1, 6, 'canon', 'amos', 9, 11, 'free', E'*In that day will I raise up the tabernacle of David that is fallen, and close up the breaches thereof; and I will raise up his ruins, and I will build it as in the days of old:* (Amos 9:11). The restored kingdom is the raised tabernacle of David — the very prophecy James will quote over the gathering at the council (Acts 15:16). Acts 1:6''s restoration and Amos''s fallen-tabernacle-raised are one hope.'),
  ('canon', 'acts', 1, 6, 'canon', 'isaiah', 11, 12, 'free', E'*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12). The restoration is the assembling of the outcasts and the dispersed from the four corners of the earth. *Restore again the kingdom to Yashar''el* (Acts 1:6) is Isaiah''s ensign for the nations and the scattered seed gathered home.'),
  ('canon', 'acts', 1, 6, 'apocrypha', 'tobit', 14, 5, 'extras', E'*And that again Yahuah (God) will have mercy on them, and bring them again into the land, where they shall build a temple, but not like to the first, until the time of that age be fulfilled; and afterward they shall return from all places of their captivity, and build up Jerusalem gloriously, and the house of Yahuah (God) shall be built in it for ever with a glorious building, as the prophets have spoken thereof.* (Tobit 14:5). The Hebrew library confessed the same gathering-hope from inside the dispersion. Tobit, a captive of the Assyrian exile, names the mercy that brings the scattered back into the land — the restoration Acts 1:6 asks after, spoken by one of the northern scattered.'),
  ('canon', 'acts', 1, 6, 'apocrypha', '2-esdras', 13, 40, 'extras', E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land.* (2 Esdras 13:40). 2 Esdras names the very tribes in question — the ten tribes carried away by Assyria, kept for the latter time. The kingdom restored to Yashar''el (Acts 1:6) is these named, traced, scattered tribes brought home, not a spiritualized remnant.'),
  ('canon', 'acts', 1, 6, 'apocrypha', 'ecclesiasticus', 48, 10, 'extras', E'*Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God), before it brake forth into fury, and to turn the heart of the father to the son, and to restore the tribes of Jacob.* (Ecclesiasticus 48:10). The library names the forerunner''s charge: *to restore the tribes of Jacob.* The restoration the disciples ask about in Acts 1:6 is the tribes of Jacob restored — the work of the spirit of Elijah, the turning of hearts before the great day.'),
  ('canon', 'acts', 1, 8, 'canon', 'matthew', 19, 28, 'free', E'*And Yahusha (Jesus) said unto them, Verily I say unto you, That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* (Matthew 19:28). Yahusha (Jesus) had already shown the shape of the restored kingdom — twelve thrones judging the twelve tribes of Yashar''el (Israel). The power received in Acts 1:8 is witness to that gathering, the regeneration when the Son of Adam sits on the throne of his glory.'),
  ('canon', 'acts', 1, 8, 'canon', 'acts', 15, 16, 'free', E'*After this I will return, and will build again the tabernacle of David, which is fallen down; and I will build again the ruins thereof, and I will set it up:* (Acts 15:16). When the council later weighs the gathering, James answers with Amos — *I will … build again the tabernacle of David, which is fallen down.* The restoration of Acts 1:6 and the rebuilt tabernacle of Acts 15:16 are one hope: the twelve-tribe kingdom raised, not replaced.'),
  -- thread: acts-1-the-cloud-received-him-and-his-return-on-the-clouds
  ('canon', 'acts', 1, 9, 'canon', 'daniel', 7, 13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). *A cloud received him out of their sight* (Acts 1:9). Daniel saw the same figure on the same clouds — *one like the Son of Adam* — the kaph honoring the incarnation: he resembled mortal-man because he took on flesh, while remaining the Formed cloud-rider brought before the Ancient of days to receive the everlasting kingdom.'),
  ('canon', 'acts', 1, 11, 'canon', 'revelation', 1, 7, 'free', E'*Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen.* (Revelation 1:7). *Shall so come in like manner as ye have seen him go* (Acts 1:11). The Revelation names the manner of the return — he comes with clouds, and every eye sees him. He went up in a cloud; he comes again on the clouds.'),
  ('canon', 'acts', 1, 12, 'canon', 'zechariah', 14, 4, 'free', E'*And his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east, and the mount of Olives shall cleave in the midst thereof toward the east and toward the west, and there shall be a very great valley; and half of the mountain shall remove toward the north, and half of it toward the south.* (Zechariah 14:4). They watched him go from the mount called Olivet (Acts 1:12), and Zechariah names where his feet return — upon the mount of Olives. He ascended from Olivet; to Olivet he descends. The same-manner return is mapped to the same mountain.'),
  ('canon', 'acts', 1, 11, 'enoch', '1-enoch', 1, 9, 'extras', E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* (1 Enoch 1:9). The Hebrew library named the coming the angels promise — *He cometh with ten thousands of His set-apart ones, to execute judgement upon all.* The same-manner return of Acts 1:11 is the Enochic coming-with-the-holy-myriads that Jude quoted; the One taken up returns with the hosts of heaven.'),
  -- thread: acts-1-the-betrayer-and-the-psalms-of-the-familiar-friend
  ('canon', 'acts', 1, 20, 'canon', 'psalms', 69, 25, 'free', E'*Let their habitation be desolate; and let none dwell in their tents.* (Psalm 69:25). Peter reads Judas''s desolation out of the Psalms — *let their habitation be desolate.* Psalm 69, the psalm of the persecuted righteous one, names the desolation that falls on the betrayer of the innocent sufferer.'),
  ('canon', 'acts', 1, 20, 'canon', 'psalms', 109, 8, 'free', E'*Let his days be few; and let another take his office.* (Psalm 109:8). *And his bishoprick let another take* (Acts 1:20) is Psalm 109''s *let another take his office.* The office is not left empty; the lot will fall on Matthias. The psalm of the betrayed righteous one supplies the very pattern of the vacancy filled.'),
  ('canon', 'acts', 1, 16, 'canon', 'psalms', 41, 9, 'free', E'*Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* (Psalm 41:9). *This scripture must needs have been fulfilled … concerning Judas* (Acts 1:16). David, the persecuted king, had named the wound: the familiar friend who ate his bread and lifted up his heel. The betrayer at the table is the ancient pattern.'),
  ('canon', 'acts', 1, 16, 'canon', 'john', 13, 18, 'free', E'*I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* (John 13:18). Yahusha (Jesus) himself had quoted that psalm over Judas at the supper — *he that eateth bread with me hath lifted up his heel against me.* What the Ruach HaKodesh (Holy Spirit) spoke by the mouth of David (Acts 1:16), the Messiah applied to the one dipping in the dish.'),
  -- thread: acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart
  ('canon', 'acts', 2, 1, 'jubilees', 'jubilees', 6, 17, 'extras', E'*For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year. And this whole festival was celebrated in heaven from the day of creation till the days of Noah-twenty-six jubilees and five weeks of years: and Noah and his sons observed it for seven jubilees and one week of years, till the day of Noah’s death, and from the day of Noah’s death his sons did away with (it) until the days of Abraham, and they ate blood.* (Jubilees 6:17). *When the day of Pentecost was fully come* (Acts 2:1) — the day was the feast of weeks, Shavuot. The Hebrew library names what the feast is for: to renew the covenant every year. The Spirit falls on the covenant-renewal feast, not on a day that abolishes the covenant.'),
  ('canon', 'acts', 2, 1, 'jubilees', 'jubilees', 6, 21, 'extras', E'*For it is the feast of weeks and the feast of first-fruits: this feast is twofold and of a double nature: according to what is written and engraven concerning it celebrate it.* (Jubilees 6:21). Shavuot is the feast of weeks and the feast of firstfruits. Pentecost is the firstfruits day — and the three thousand added that day (Acts 2:41) are the firstfruits of the gathering harvest, the down-payment of the Spirit on the feast of firstfruits.'),
  ('canon', 'acts', 2, 3, 'canon', 'exodus', 19, 18, 'free', E'*And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly.* (Exodus 19:18). *Cloven tongues like as of fire* (Acts 2:3) fall as the fire fell on Sinai — the mountain altogether on smoke because Yahuah (LORD) descended on it in fire. The fire that gave the Torah on the mountain is the fire that writes it on the heart at Pentecost.'),
  ('canon', 'acts', 2, 4, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The Spirit poured at Pentecost is the new-covenant Spirit Jeremiah named — *I will put my law in their inward parts, and write it in their hearts.* The Spirit does not lead away from the Torah; he writes it within. Pentecost is the law on the heart, not the law undone.'),
  ('canon', 'acts', 2, 4, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). Ezekiel names the same gift in the same breath as the Spirit — *I will put my spirit within you, and cause you to walk in my statutes.* The filling of Acts 2:4 is the Spirit who causes the walk in the statutes; Spirit and Torah are one motion.'),
  ('canon', 'acts', 2, 4, 'canon', '2-corinthians', 3, 3, 'free', E'*Forasmuch as ye are manifestly declared to be the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart.* (2 Corinthians 3:3). Paul names the Pentecost writing — written not with ink but with the Spirit of the living Elohim (God), not in tables of stone but in fleshy tables of the heart. The Spirit given at Pentecost is the finger that moves the Sinai-writing from stone to heart.'),
  ('canon', 'acts', 2, 4, 'canon', 'hebrews', 8, 10, 'free', E'*For this is the covenant that I will make with the house of Yashar''el (Israel) after those days, saith Yahuah (Lord); I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people:* (Hebrews 8:10). Hebrews quotes the same Jeremiah promise as fulfilled — *I will put my laws into their mind, and write them in their hearts.* The covenant Pentecost inaugurates is the Torah internalized, the statutes set in the mind by the Spirit.'),
  -- thread: acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain
  ('canon', 'acts', 2, 17, 'canon', 'joel', 2, 28, 'free', E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions:* (Joel 2:28). Peter names the prophet — *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy.* Pentecost is the beginning of Joel''s latter-day outpouring, the Spirit falling on Yah''s people as the gathering of the scattered seed opens.'),
  ('canon', 'acts', 2, 21, 'canon', 'joel', 2, 32, 'free', E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* (Joel 2:32). *Whosoever shall call on the name of Yahuah (Lord) shall be saved* (Acts 2:21) is Joel''s *whosoever shall call on the name of Yahuah (LORD) shall be delivered … in the remnant whom Yahuah (LORD) shall call.* The calling is the remnant''s; the saved are the called — those who hear because they were his before the foundation of the world.'),
  ('canon', 'acts', 2, 17, 'canon', 'ezekiel', 39, 29, 'free', E'*Neither will I hide my face any more from them: for I have poured out my spirit upon the house of Yashar''el (Israel), saith Adonai Yahuah (the Lord GOD).* (Ezekiel 39:29). Ezekiel names the same outpouring as the seal on the gathering — *I have poured out my spirit upon the house of Yashar''el (Israel).* The Spirit poured at Pentecost is the Spirit poured on the house of Yashar''el, the down-payment of the ingathering.'),
  ('canon', 'acts', 2, 18, 'canon', 'isaiah', 44, 3, 'free', E'*For I will pour water upon him that is thirsty, and floods upon the dry ground: I will pour my spirit upon thy seed, and my blessing upon thine offspring:* (Isaiah 44:3). Isaiah names whose the poured Spirit is — *I will pour my spirit upon thy seed, and my blessing upon thine offspring.* The servants and handmaidens of Acts 2:18 on whom the Spirit falls are the seed and the offspring, the covenant lineage, not a self-selected company.'),
  ('canon', 'acts', 2, 18, 'canon', 'numbers', 11, 29, 'free', E'*And Moses said unto him, Enviest thou for my sake? would Elohim (God) that all the LORD’S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29). Moses had longed for the very day — *would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* Pentecost answers the longing: the Spirit once on the seventy elders now poured on sons and daughters, servants and handmaids.'),
  ('canon', 'acts', 2, 21, 'canon', 'romans', 10, 13, 'free', E'*For whosoever shall call upon the name of Yahuah (Lord) shall be saved.* (Romans 10:13). Paul quotes the same Joel line over the same gathering — *whosoever shall call upon the name of Yahuah (Lord) shall be saved.* The name called upon is the name of Yahuah; the Formed-one Yahusha (Jesus) and the name of Yahuah are not two saviours but one.'),
  ('canon', 'acts', 2, 17, 'canon', 'titus', 3, 6, 'free', E'*Which he shed on us abundantly through Yahusha HaMashiach (Jesus Christ) our Saviour;* (Titus 3:6). The poured Spirit of Pentecost is the Spirit shed on us abundantly through Yahusha HaMashiach (Jesus Christ) — and the sentence does not end at grace: it runs on to the good works the Spirit enables (Titus 3:8), the walk in the statutes. The outpouring is for the renewed walk, not its abolition.'),
  -- thread: acts-2-david-foresaw-the-resurrection-the-holy-one-not-left-to-corruption
  ('canon', 'acts', 2, 27, 'canon', 'psalms', 16, 10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). Peter reads the resurrection out of David — *for thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* David, dead and buried (Acts 2:29), spoke not of himself but of the Holy One whose flesh would not see corruption.'),
  ('canon', 'acts', 2, 28, 'canon', 'psalms', 16, 11, 'free', E'*Thou wilt shew me the path of life: in thy presence is fulness of joy; at thy right hand there are pleasures for evermore.* (Psalm 16:11). *Thou hast made known to me the ways of life* (Acts 2:28) is David''s *thou wilt shew me the path of life: in thy presence is fulness of joy.* The path of life through death is the resurrection road the Holy One walked and opened.'),
  ('canon', 'acts', 2, 31, 'canon', 'acts', 13, 35, 'free', E'*Wherefore he saith also in another psalm, Thou shalt not suffer thine Holy One to see corruption.* (Acts 13:35). Paul preaches the same psalm to the same end at Antioch — *thou shalt not suffer thine Holy One to see corruption.* David saw corruption (Acts 13:36); the One raised saw none. The two sermons read one psalm to one resurrection.'),
  -- thread: acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand
  ('canon', 'acts', 2, 34, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). *Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Acts 2:34) is David''s own psalm — Yahuah the Father speaks to the Lord at his right hand, the Formed drawn from the Formless, seated in power. David''s Lord is the Messiah David called Lord.'),
  ('canon', 'acts', 2, 36, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). *Made … both Lord and Messiah (Lord and Christ)* (Acts 2:36) is the dominion Daniel saw given to the Son of Adam — dominion, glory, and an everlasting kingdom. The enthronement at the right hand is the everlasting dominion granted to the one like the Son of Adam.'),
  ('canon', 'acts', 2, 34, 'enoch', '1-enoch', 62, 1, 'extras', E'*And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* (1 Enoch 62:1). The Hebrew library saw the same enthronement — *Yahuah (God) of Spirits named the Elect One, and seated him on the throne of His glory.* The right-hand seat of Acts 2:34 is the throne of glory the Parables gave the Elect One, the chosen Son of Adam set to judge.'),
  ('canon', 'acts', 2, 36, 'enoch', '1-enoch', 62, 7, 'extras', E'*And Yahuah (God) of Spirits said: ‘This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.’* (1 Enoch 62:7). The Parables name him — *this is the Son of Adam who is born unto righteousness … the righteousness of the Head of Days forsakes him not.* The Yahusha (Jesus) made both Lord and Messiah (Acts 2:36) is the named Son of Adam of the Hebrew library, the Chosen One before Yahuah (God) of Spirits.'),
  ('canon', 'acts', 2, 34, 'canon', 'matthew', 22, 44, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou on my right hand, till I make thine enemies thy footstool?* (Matthew 22:44). Yahusha (Jesus) had pressed the Pharisees with the same verse — *Yahuah (LORD) said unto my Lord, Sit thou on my right hand* — how does David call his own son Lord? The riddle Acts 2:34-36 answers: the Messiah is David''s son in the flesh and David''s Lord as the Formed Yahuah.'),
  ('canon', 'acts', 2, 36, 'canon', 'philippians', 2, 11, 'free', E'*And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* (Philippians 2:11). The making of Acts 2:36 is the exaltation of Philippians — *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The kyrios title is his by exaltation; he is Lord, and the Father is glorified in it — the Formed and the Formless, never collapsed.'),
  ('canon', 'acts', 2, 36, 'canon', 'hebrews', 1, 13, 'free', E'*But to which of the angels said he at any time, Sit on my right hand, until I make thine enemies thy footstool?* (Hebrews 1:13). Hebrews seals the right-hand session — *Sit on my right hand, until I make thine enemies thy footstool* — said to the Son, not to any angel. The enthronement Peter proclaims at Pentecost is the Son seated above the angelic host.'),
  -- thread: acts-2-the-promise-to-them-that-are-afar-off-the-scattered-called-home
  ('canon', 'acts', 2, 39, 'canon', 'isaiah', 57, 19, 'free', E'*I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him.* (Isaiah 57:19). *The promise is unto you … and to all that are afar off* (Acts 2:39). Isaiah names the far and the near as one healing — *Peace, peace to him that is far off, and to him that is near.* The afar-off are the dispersed of Yahuah''s own, scattered far and brought near.'),
  ('canon', 'acts', 2, 39, 'canon', 'deuteronomy', 30, 4, 'free', E'*If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee:* (Deuteronomy 30:4). The afar-off are the driven-out Moses promised to gather — *if any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee.* The promise to them afar off (Acts 2:39) is the gathering of the scattered seed from the ends of the earth.'),
  ('canon', 'acts', 2, 39, 'canon', 'joel', 2, 32, 'free', E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* (Joel 2:32). *Even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts 2:39) is Joel''s *the remnant whom Yahuah (LORD) shall call.* The calling is the Father''s; those afar off who answer are the remnant he calls — hearing reveals what election made true before they heard, no name added after the foundation of the world.'),
  ('canon', 'acts', 2, 39, 'canon', 'ephesians', 2, 13, 'free', E'*But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ).* (Ephesians 2:13). Paul names the afar-off made nigh — *ye who sometimes were far off are made nigh by the blood of Messiah (Christ).* These are the aliens from the commonwealth of Yashar''el (Israel) (Ephesians 2:12) — the scattered house estranged from its own covenant by exile, the Lo-Ammi brought home, not strangers spliced into a people they were never of.'),
  ('canon', 'acts', 2, 39, 'canon', 'ephesians', 2, 17, 'free', E'*And came and preached peace to you which were afar off, and to them that were nigh.* (Ephesians 2:17). *Came and preached peace to you which were afar off, and to them that were nigh* (Ephesians 2:17). The far and the near are the two houses — the scattered of Yashar''el (Israel) far off in the nations and the near of Yahudah (Judah) — made one in the Messiah, the dividing wall of the exile broken down.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a0102_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a0102_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering',
       E'Restore again the kingdom to Yashar''el — the twelve-tribe gathering',
       E'When the disciples ask the risen Messiah *wilt thou at this time restore again the kingdom to Yashar''el (Israel)?* (Acts 1:6), he does not correct the hope — he tells them the timing belongs to the Father (Acts 1:7) and turns them to witness *unto the uttermost part of the earth* (Acts 1:8), out where the scattered are. The restoration they ask after is the prophets'' own. Ezekiel names it: *I will take the children of Yashar''el (Israel) from among the heathen … and bring them into their own land* (Ezekiel 37:21), made *one nation … and one king … no more two nations* (Ezekiel 37:22). Amos names it: *in that day will I raise up the tabernacle of David that is fallen* (Amos 9:11). Isaiah names it: *he shall … assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The Hebrew library carried the same gathering-hope from inside the exile: Tobit, captive of the Assyrian dispersion, says *again Yahuah (God) will have mercy on them, and bring them again into the land* (Tobit 14:5); 2 Esdras names the very tribes — *those are the ten tribes, which were carried away prisoners out of their own land* (2 Esdras 13:40); Ecclesiasticus names the forerunner''s charge, *to restore the tribes of Jacob* (Ecclesiasticus 48:10). And Yahusha (Jesus) had already shown the shape of the restored kingdom — *ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel)* (Matthew 19:28) — the same gathering the Yerushalayim (Jerusalem) council will later confess from Amos: *I will return, and will build again the tabernacle of David, which is fallen down* (Acts 15:16). The kingdom restored to Yashar''el is the twelve-tribe gathering the whole library promised — not a new people put in its place.',
       sv.verse_id, ev.verse_id, 'extras', 5000
  FROM _s217_a0102_lookup sv, _s217_a0102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-1-the-cloud-received-him-and-his-return-on-the-clouds',
       E'A cloud received him — the Son of Adam taken up and returning on the clouds',
       E'*A cloud received him out of their sight* (Acts 1:9), and two men in white promise *this same Yahusha (Jesus) … shall so come in like manner as ye have seen him go* (Acts 1:11). The cloud is the Formed-one''s own chariot. Daniel saw the same figure on the same clouds — *one like the Son of Adam came with the clouds of heaven* (Daniel 7:13) — the kaph honoring the incarnation: he resembled mortal-man because he took on flesh, while remaining the cloud-rider brought before the Ancient of days to receive the everlasting kingdom. The Revelation names the manner of the return: *behold, he cometh with clouds; and every eye shall see him* (Revelation 1:7). And Zechariah names the place: they watched him go from the mount of Olives (Acts 1:12), and *his feet shall stand in that day upon the mount of Olives* (Zechariah 14:4) — he ascended from Olivet and to Olivet he returns. The Hebrew library already named the coming the angels promise: *behold! He cometh with ten thousands of His set-apart ones, to execute judgement upon all* (1 Enoch 1:9) — the same coming Jude quoted. The One taken up in a cloud returns on the clouds with the hosts of heaven.',
       sv.verse_id, ev.verse_id, 'extras', 5010
  FROM _s217_a0102_lookup sv, _s217_a0102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-1-the-betrayer-and-the-psalms-of-the-familiar-friend',
       E'The betrayer''s place — the psalms of the familiar friend who lifted up his heel',
       E'Peter reads Judas''s end out of the Psalms — *this scripture must needs have been fulfilled, which the Ruach HaKodesh (Holy Spirit) by the mouth of David spake before concerning Judas* (Acts 1:16) — and quotes two of them over the vacant place: *let his habitation be desolate* (Psalm 69:25) and *his bishoprick let another take* (Psalm 109:8). These are the psalms of the persecuted righteous one, and behind them stands the wound David named directly: *mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9) — the very verse Yahusha (Jesus) had applied to Judas at the supper: *he that eateth bread with me hath lifted up his heel against me* (John 13:18). The betrayer at the table is the ancient pattern of the friend who eats the bread and turns; the office he forfeits does not stay empty, for the lot will fall on Matthias (Acts 1:26).',
       sv.verse_id, ev.verse_id, 'free', 5018
  FROM _s217_a0102_lookup sv, _s217_a0102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart',
       E'Pentecost is Shavuot — the fire of Sinai and the Torah written on the heart',
       E'*When the day of Pentecost was fully come* (Acts 2:1) — the day was Shavuot, the feast of weeks. The Hebrew library names what the feast is for: it is celebrated *to renew the covenant every year* (Jubilees 6:17), *the feast of weeks and the feast of first-fruits* (Jubilees 6:21). The Spirit falls on the covenant-renewal feast, not on a day that abolishes the covenant. And the fire that falls — *cloven tongues like as of fire* (Acts 2:3) — is the fire of Sinai, where *Yahuah (LORD) descended upon it in fire* (Exodus 19:18) to give the Torah on the mountain. What the fire wrote on stone, the Spirit now writes on the heart: *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33); *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27). The Spirit and the Torah are one motion, never rivals. Paul names the same writing — *written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3) — and Hebrews seals it: *I will put my laws into their mind, and write them in their hearts* (Hebrews 8:10). Pentecost is the law moved from the mountain to the heart, the covenant renewed, not undone.',
       sv.verse_id, ev.verse_id, 'extras', 5024
  FROM _s217_a0102_lookup sv, _s217_a0102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain',
       E'The outpouring of the Spirit on all flesh — the latter-rain on the gathering',
       E'Peter names the prophet over Pentecost — *this is that which was spoken by the prophet Joel* (Acts 2:16): *I will pour out of my Spirit upon all flesh* (Acts 2:17), the very words of Joel — *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28). Pentecost is the beginning of Joel''s latter-day outpouring, the Spirit falling as the gathering of the scattered seed opens. The other prophets name the same poured Spirit and whose it is: *I have poured out my spirit upon the house of Yashar''el (Israel)* (Ezekiel 39:29); *I will pour my spirit upon thy seed, and my blessing upon thine offspring* (Isaiah 44:3). Moses had longed for the very day — *would Elohim (God) that all the LORD''S people were prophets* (Numbers 11:29). And the promise closes where Joel closes: *whosoever shall call on the name of Yahuah (Lord) shall be saved* (Acts 2:21), Joel''s *whosoever shall call on the name of Yahuah (LORD) shall be delivered … in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). Paul reads it the same — *whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13) — and names the Spirit *shed on us abundantly through Yahusha HaMashiach (Jesus Christ)* (Titus 3:6), poured not to end the walk but to enable it, the sentence running on to the good works the Spirit makes possible. The calling is the Father''s, the saved are the called, and the called are the remnant he was always gathering home.',
       sv.verse_id, ev.verse_id, 'free', 5032
  FROM _s217_a0102_lookup sv, _s217_a0102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=2 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-2-david-foresaw-the-resurrection-the-holy-one-not-left-to-corruption',
       E'David foresaw the resurrection — the Holy One not left to see corruption',
       E'Peter reads the resurrection out of David — *thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption* (Acts 2:27), quoting David''s own psalm: *for thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). David is dead and buried, his sepulchre still with them (Acts 2:29); he spoke not of himself but of the Holy One whose flesh would not see corruption. *Thou hast made known to me the ways of life* (Acts 2:28) is David''s *thou wilt shew me the path of life* (Psalm 16:11) — the path through death the Holy One walked and opened. Paul preaches the same psalm to the same end at Antioch: *thou shalt not suffer thine Holy One to see corruption* (Acts 13:35) — David saw corruption, but the One raised saw none. Two sermons, one psalm, one resurrection.',
       sv.verse_id, ev.verse_id, 'free', 5040
  FROM _s217_a0102_lookup sv, _s217_a0102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=2 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand',
       E'Yahuah said unto my Lord — the Formed enthroned at the right hand',
       E'Peter ends the sermon at the enthronement — *Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Acts 2:34), David''s own psalm where Yahuah the Father speaks to the Lord at his right hand: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand* (Psalm 110:1). The Lord David calls Lord is the Formed drawn from the Formless, seated in power — and *made … both Lord and Messiah (Lord and Christ)* (Acts 2:36) is the dominion Daniel saw given to the Son of Adam: *there was given him dominion, and glory, and a kingdom … an everlasting dominion* (Daniel 7:14). The Hebrew library saw the same enthronement: *Yahuah (God) of Spirits named the Elect One, and seated him on the throne of His glory* (1 Enoch 62:1); *this is the Son of Adam who is born unto righteousness* (1 Enoch 62:7). Yahusha (Jesus) had pressed the Pharisees with the same psalm — *Yahuah (LORD) said unto my Lord* (Matthew 22:44) — how is the Messiah David''s son and David''s Lord at once? The riddle Pentecost answers: he is David''s son in the flesh and David''s Lord as the Formed Yahuah. The making of Acts 2:36 is the exaltation Paul names — *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11) — and Hebrews seals the session said to the Son, not to any angel: *Sit on my right hand, until I make thine enemies thy footstool* (Hebrews 1:13). The Formed and the Formless, never collapsed, never two gods.',
       sv.verse_id, ev.verse_id, 'extras', 5046
  FROM _s217_a0102_lookup sv, _s217_a0102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=2 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-2-the-promise-to-them-that-are-afar-off-the-scattered-called-home',
       E'The promise to them that are afar off — the scattered called home',
       E'Peter closes the call — *the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts 2:39). The afar-off are not other peoples; they are the dispersed of Yahuah''s own. Isaiah names the far and the near as one healing — *Peace, peace to him that is far off, and to him that is near* (Isaiah 57:19). Moses names the gathering of the driven-out — *if any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* (Deuteronomy 30:4). And the calling is the Father''s, as Joel said — *the remnant whom Yahuah (LORD) shall call* (Joel 2:32). Paul names the afar-off made nigh: *ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) — the *aliens from the commonwealth of Yashar''el (Israel)* (Ephesians 2:12), the scattered house estranged from its own covenant by exile, the Lo-Ammi brought home — and the two houses made one: *came and preached peace to you which were afar off, and to them that were nigh* (Ephesians 2:17). These are not strangers spliced into a people they were never of; they are the seed scattered far and called near, hearing because election made them his before they heard.',
       sv.verse_id, ev.verse_id, 'free', 5052
  FROM _s217_a0102_lookup sv, _s217_a0102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=38
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=2 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:21 — *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side* — the scattered gathered home, the kingdom of Acts 1:6 restored.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:22 — *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* Ephraim and Yahudah (Judah) one kingdom under one king.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 9:11 — *In that day will I raise up the tabernacle of David that is fallen* the restored kingdom James quotes at Acts 15:16.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:12 — *assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* the dispersed gathered from the four corners — the restoration of Acts 1:6.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 14:5 — *again Yahuah (God) will have mercy on them, and bring them again into the land* the exile''s own gathering-hope — the kingdom restored.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 13:40 — *Those are the ten tribes, which were carried away prisoners out of their own land* the named tribes kept for the latter time, restored.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Ecclesiasticus 48:10 — *to turn the heart of the father to the son, and to restore the tribes of Jacob* the forerunner''s charge — the tribes restored, the hearts turned.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Matthew 19:28 — *ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel)* the shape of the restored kingdom Acts 1:6 asks after.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Acts 15:16 — *I will return, and will build again the tabernacle of David, which is fallen down* Amos''s prophecy over the gathering — the kingdom raised, not replaced.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-1-the-cloud-received-him-and-his-return-on-the-clouds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* the kaph honoring the incarnation — the Formed cloud-rider taken up (Acts 1:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-the-cloud-received-him-and-his-return-on-the-clouds'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 1:7 — *Behold, he cometh with clouds; and every eye shall see him* the same-manner return promised in Acts 1:11.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-the-cloud-received-him-and-his-return-on-the-clouds'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 14:4 — *his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east* he ascended from Olivet (Acts 1:12); to Olivet he returns.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-the-cloud-received-him-and-his-return-on-the-clouds'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 1:9 — *He cometh with ten thousands of His set-apart ones To execute judgement upon all* the coming-with-the-myriads Jude quoted — the One taken up returns with the hosts.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-the-cloud-received-him-and-his-return-on-the-clouds'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-1-the-betrayer-and-the-psalms-of-the-familiar-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 69:25 — *Let their habitation be desolate; and let none dwell in their tents* the betrayer''s desolation Peter reads over Judas (Acts 1:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-the-betrayer-and-the-psalms-of-the-familiar-friend'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 109:8 — *Let his days be few; and let another take his office* the vacant office filled — the lot on Matthias.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-the-betrayer-and-the-psalms-of-the-familiar-friend'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=109 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 41:9 — *mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* the table-friend who turns — the ancient pattern of Judas.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-the-betrayer-and-the-psalms-of-the-familiar-friend'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 13:18 — *He that eateth bread with me hath lifted up his heel against me* Yahusha (Jesus) applied the psalm to Judas at the supper.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-1-the-betrayer-and-the-psalms-of-the-familiar-friend'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 6:17 — *they should celebrate the feast of weeks in this month once a year, to renew the covenant every year* Shavuot is covenant-renewal — the day the Spirit falls (Acts 2:1).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:21 — *For it is the feast of weeks and the feast of first-fruits* Pentecost the firstfruits day — the three thousand the firstfruits harvest.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 19:18 — *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire* the Sinai fire that gave Torah is the Pentecost fire that writes it (Acts 2:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the new-covenant Spirit writes the Torah within, not away.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* Spirit and Torah one motion — the filling of Acts 2:4.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Corinthians 3:3 — *written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* the Sinai-writing moved from stone to heart.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Hebrews 8:10 — *I will put my laws into their mind, and write them in their hearts* the covenant Pentecost inaugurates — Torah internalized.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:28 — *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* the latter-day outpouring begun at Pentecost (Acts 2:17).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:32 — *whosoever shall call on the name of Yahuah (LORD) shall be delivered* the remnant whom Yahuah calls — the saved are the called.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 39:29 — *I have poured out my spirit upon the house of Yashar''el (Israel)* the outpouring sealing the ingathering.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=39 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 44:3 — *I will pour my spirit upon thy seed, and my blessing upon thine offspring* the Spirit on the seed and offspring — the covenant lineage.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Numbers 11:29 — *would Elohim (God) that all the LORD’S people were prophets* Moses''s longing answered at Pentecost.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 10:13 — *whosoever shall call upon the name of Yahuah (Lord) shall be saved* the name called is the name of Yahuah — one Saviour.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Titus 3:6 — *Which he shed on us abundantly through Yahusha HaMashiach (Jesus Christ) our Saviour* the poured Spirit — for the renewed walk, the sentence ending in good works.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-2-david-foresaw-the-resurrection-the-holy-one-not-left-to-corruption
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 16:10 — *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* David spoke of the Holy One''s uncorrupted flesh (Acts 2:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-david-foresaw-the-resurrection-the-holy-one-not-left-to-corruption'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 16:11 — *Thou wilt shew me the path of life: in thy presence is fulness of joy* the resurrection road — made known to me the ways of life (Acts 2:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-david-foresaw-the-resurrection-the-holy-one-not-left-to-corruption'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 13:35 — *Thou shalt not suffer thine Holy One to see corruption* the same psalm to the same resurrection at Antioch.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-david-foresaw-the-resurrection-the-holy-one-not-left-to-corruption'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Yahuah (LORD) said unto my Lord, Sit thou at my right hand* the Father speaks to the Lord at his right hand (Acts 2:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom* the everlasting kingdom to the Son of Adam — both Lord and Messiah (Acts 2:36).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 62:1 — *named the Elect One, And seated him on the throne of His glory* the throne of glory of Acts 2:34''s right-hand seat.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=34
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 62:7 — *This is the Son of Adam who is born unto righteousness* the named Son of Adam — the Yahusha made Lord and Messiah.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=36
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 22:44 — *Yahuah (LORD) said unto my Lord, Sit thou on my right hand, till I make thine enemies thy footstool* the riddle Acts 2:34-36 answers — David''s son and David''s Lord.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Philippians 2:11 — *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* the kyrios title by exaltation — Lord, to the Father''s glory.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Hebrews 1:13 — *Sit on my right hand, until I make thine enemies thy footstool* said to the Son, not the angels — the Pentecost enthronement.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-2-the-promise-to-them-that-are-afar-off-the-scattered-called-home
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 57:19 — *Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD)* the far and near one healing — the dispersed brought near (Acts 2:39).'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-promise-to-them-that-are-afar-off-the-scattered-called-home'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:4 — *from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee* the driven-out gathered from the ends — them afar off.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-promise-to-them-that-are-afar-off-the-scattered-called-home'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:32 — *in the remnant whom Yahuah (LORD) shall call* as many as Yahuah shall call (Acts 2:39) — the called remnant.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-promise-to-them-that-are-afar-off-the-scattered-called-home'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 2:13 — *ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* the estranged house brought home — not strangers spliced in.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-promise-to-them-that-are-afar-off-the-scattered-called-home'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ephesians 2:17 — *came and preached peace to you which were afar off, and to them that were nigh* the two houses made one — scattered Yashar''el and near Yahudah.'
  FROM cross_reference_threads t, cross_references x, _s217_a0102_lookup sv, _s217_a0102_lookup tv
 WHERE t.slug='acts-2-the-promise-to-them-that-are-afar-off-the-scattered-called-home'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=2 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- ----- fragment: minion_acts_03_05.sql (S217 Acts 3-5) -----
-- =====================================================================
-- S217 minion — ACTS 3-5 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 3-5.  Tag: a0305 (temp view _s217_a0305_lookup).  Sort band: 5100-5199.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 3:
--   v.1-5   temple-gate setup      Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.6-8   lame man leaps         Tanakh: Isaiah 35:5-6  Extras: none warranted  NT: Matthew 11:5
--   v.12-15 God of fathers/Servant Tanakh: Exodus 3:6,15, Isaiah 52:13  Extras: none warranted  NT: none added (resurrection witness carried)
--   v.16-18 name/Messiah suffer    Tanakh: (Isaiah 53 / Psalm 22 weighed; suffering carried in v.13 servant thread) none added  Extras: none  NT: none added
--   v.19-21 times of restitution   Tanakh: Malachi 4:5-6  Extras: Ecclesiasticus 48:10  NT: Acts 1:6 (Acts<->Acts)
--   v.22-23 prophet like Moses     Tanakh: Deuteronomy 18:15,18,19  Extras: 1 Maccabees 14:41  NT: Matthew 17:5, John 5:46
--   v.24-26 covenant/in thy seed   Tanakh: Genesis 22:18, 28:14  Extras: Ecclesiasticus 44:21  NT: Galatians 3:16
--  ACTS 4:
--   v.1-10  arrest/by what name    Tanakh: none added  Extras: none  NT: none warranted
--   v.11    the rejected stone     Tanakh: Psalm 118:22, Isaiah 28:16  Extras: none warranted  NT: Matthew 21:42, 1 Peter 2:6-7
--   v.12    none other name        Tanakh: (Joel 2:32 weighed; carried in Acts 2:21 thread) none added  Extras: none  NT: none added
--   v.13-22 boldness/threatening   Tanakh: none warranted  Extras: none  NT: none warranted
--   v.24-28 prayer: Maker + Ps 2   Tanakh: Exodus 20:11, Nehemiah 9:6, Psalm 2:1-2  Extras: none warranted  NT: none added
--   v.29-31 Spirit/boldness        Tanakh: none added  Extras: none  NT: none warranted
--   v.32-35 none that lacked       Tanakh: Deuteronomy 15:4  Extras: none warranted  NT: 2 Corinthians 8:15
--   v.36-37 Barnabas               Tanakh/Extras/NT: none warranted (narrative)
--  ACTS 5:
--   v.1-11  Ananias kept back      Tanakh: Joshua 7:1,11  Extras: none warranted  NT: none added
--   v.12-16 signs/shadow           Tanakh: none warranted  Extras: none  NT: none warranted
--   v.17-28 prison/angel/temple    Tanakh: (angelic deliverance weighed) none added  Extras: none  NT: none warranted
--   v.29-32 obey God rather men    Tanakh: Daniel 3:18, Exodus 1:17  Extras: 2 Maccabees 7:2  NT: none added
--   v.30-31 hanged on a tree       Tanakh: Deuteronomy 21:23  Extras: none warranted  NT: Galatians 3:13
--   v.33-42 Gamaliel/Theudas       Tanakh: none warranted  Extras: (1 Macc revolt-history weighed) none added  NT: none warranted (failed-revolt scattering, not the prophetic dispersion)
--
-- THREADS (slug -> target libraries):
--   5100 acts-3-the-lame-man-leaps-the-sign-of-the-age-of-healing            (Tanakh + NT)
--   5108 acts-3-the-god-of-abraham-isaac-and-jacob-glorified-his-servant     (Tanakh)
--   5116 acts-3-the-times-of-restitution-of-all-things-the-restoration       (Tanakh + Extras + NT)
--   5124 acts-3-a-prophet-like-unto-moses-him-shall-ye-hear                  (Tanakh + Extras + NT)
--   5132 acts-3-in-thy-seed-shall-all-the-kindreds-of-the-earth-be-blessed   (Tanakh + Extras + NT)
--   5140 acts-4-the-stone-which-the-builders-rejected-the-head-of-the-corner (Tanakh + NT)
--   5148 acts-4-the-maker-of-heaven-and-earth-and-the-kings-that-rage        (Tanakh)
--   5156 acts-4-neither-was-there-any-that-lacked-the-community-with-no-poor (Tanakh + NT)
--   5164 acts-5-ananias-kept-back-the-price-achan-and-the-accursed-thing     (Tanakh)
--   5172 acts-5-we-ought-to-obey-elohim-rather-than-men                      (Tanakh + Extras)
--   5180 acts-5-raised-and-hanged-on-a-tree-redeemed-from-the-curse          (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a0305_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-3-the-lame-man-leaps-the-sign-of-the-age-of-healing
  ('canon', 'acts', 3, 6, 'canon', 'isaiah', 35, 6, 'free', E'*Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert.* (Isaiah 35:6). When Peter says *In the name of Yahusha HaMashiach (Jesus Christ) of Nazareth rise up and walk* (Acts 3:6) and the man goes *walking, and leaping, and praising Elohim (God)* (Acts 3:8), it is Isaiah''s sign of the age of healing breaking in — *the lame man leap as an hart.* The healing is a token that the promised restoration has dawned.'),
  ('canon', 'acts', 3, 8, 'canon', 'isaiah', 35, 5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5). Isaiah set the lame man''s leaping among the signs of Elohim (God) coming to save — *the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The man leaping up at the Beautiful gate (Acts 3:8) is that promised day in miniature.'),
  ('canon', 'acts', 3, 8, 'canon', 'matthew', 11, 5, 'free', E'*The blind receive their sight, and the lame walk, the lepers are cleansed, and the deaf hear, the dead are raised up, and the poor have the gospel preached to them.* (Matthew 11:5). Yahusha (Jesus) had answered Yochanan''s (John''s) question with the same Isaiah signs — *the lame walk … the deaf hear.* The lame man walking into the temple (Acts 3:8) is the continuing witness that the One who did these works is risen and reigning.'),
  -- thread: acts-3-the-god-of-abraham-isaac-and-jacob-glorified-his-servant
  ('canon', 'acts', 3, 13, 'canon', 'exodus', 3, 6, 'free', E'*Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob. And Moses hid his face; for he was afraid to look upon Elohim (God).* (Exodus 3:6). Peter names the very Elohim (God) who spoke from the bush — *the Elohim (God) of Abraham, and of Isaac, and of Jacob, the Elohim (God) of our fathers, hath glorified his Son Yahusha (Jesus)* (Acts 3:13). The covenant Elohim of the fathers and the risen Yahusha are one continuous story.'),
  ('canon', 'acts', 3, 13, 'canon', 'exodus', 3, 15, 'free', E'*And Elohim (God) said moreover unto Moses, Thus shalt thou say unto the children of Yashar''el (Israel), Yahuah Elohim (The LORD God) of your fathers, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob, hath sent me unto you: this is my name for ever, and this is my memorial unto all generations.* (Exodus 3:15). This is Yahuah''s name *for ever* — the Elohim (God) of the fathers — and it is this same God who *hath glorified his Son Yahusha (Jesus)* (Acts 3:13). Peter preaches no new deity; the God of the fathers has vindicated his Servant.'),
  ('canon', 'acts', 3, 13, 'canon', 'isaiah', 52, 13, 'free', E'*Behold, my servant shall deal prudently, he shall be exalted and extolled, and be very high.* (Isaiah 52:13). The glorifying of Acts 3:13 is the exalting of Isaiah''s servant — *he shall be exalted and extolled, and be very high* — the verse that opens the song of the suffering servant whom *ye delivered up, and denied … in the presence of Pilate* (Acts 3:13). The despised servant is the glorified servant.'),
  -- thread: acts-3-the-times-of-restitution-of-all-things-the-restoration
  ('canon', 'acts', 3, 21, 'canon', 'malachi', 4, 5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* (Malachi 4:5). The *times of restitution of all things, which Elohim (God) hath spoken by the mouth of all his holy prophets* (Acts 3:21) are the restoration Malachi sealed the prophets with — Elijah sent before the great day to set things in order.'),
  ('canon', 'acts', 3, 21, 'canon', 'malachi', 4, 6, 'free', E'*And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* (Malachi 4:6). The restitution is a restoring of what was broken — *he shall turn the heart of the fathers to the children.* The restoration of all things Peter preaches (Acts 3:21) is the prophets'' own promise of hearts turned back.'),
  ('canon', 'acts', 3, 21, 'apocrypha', 'ecclesiasticus', 48, 10, 'extras', E'*Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God), before it brake forth into fury, and to turn the heart of the father to the son, and to restore the tribes of Jacob.* (Ecclesiasticus 48:10). The Hebrew library read Malachi''s Elijah exactly so — his charge is *to restore the tribes of Jacob.* The *restitution of all things* (Acts 3:21) is the restoration of the scattered twelve tribes the whole library awaited.'),
  ('canon', 'acts', 3, 19, 'canon', 'acts', 1, 6, 'free', E'*When they therefore were come together, they asked of him, saying, Yahuah (Lord), wilt thou at this time restore again the kingdom to Yashar''el (Israel)?* (Acts 1:6). The *times of refreshing* and the *restitution of all things* (Acts 3:19-21) are the same restoration the disciples asked after — *wilt thou … restore again the kingdom to Yashar''el (Israel)?* The kingdom restored and the restitution of all things are one hope, timed to the Father.'),
  -- thread: acts-3-a-prophet-like-unto-moses-him-shall-ye-hear
  ('canon', 'acts', 3, 22, 'canon', 'deuteronomy', 18, 15, 'free', E'*Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken;* (Deuteronomy 18:15). Peter quotes Moses straight — *A prophet shall Yahuah Elohaychem (the Lord your God) raise up unto you of your brethren, like unto me; him shall ye hear* (Acts 3:22). The Prophet like Moses is Yahusha (Jesus); Moses pointed forward to him.'),
  ('canon', 'acts', 3, 22, 'canon', 'deuteronomy', 18, 18, 'free', E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him.* (Deuteronomy 18:18). Yahuah promised a Prophet with his own words in his mouth — *I … will put my words in his mouth.* The One the fathers must *hear in all things* (Acts 3:22) speaks the Father''s words, not his own.'),
  ('canon', 'acts', 3, 23, 'canon', 'deuteronomy', 18, 19, 'free', E'*And it shall come to pass, that whosoever will not hearken unto my words which he shall speak in my name, I will require it of him.* (Deuteronomy 18:19). The warning Peter presses — *every soul, which will not hear that prophet, shall be destroyed from among the people* (Acts 3:23) — is Moses''s own: *whosoever will not hearken unto my words … I will require it of him.* To refuse the Prophet is to be cut off.'),
  ('canon', 'acts', 3, 22, 'canon', 'matthew', 17, 5, 'free', E'*While he yet spake, behold, a bright cloud overshadowed them: and behold a voice out of the cloud, which said, This is my beloved Son, in whom I am well pleased; hear ye him.* (Matthew 17:5). On the mount the Father sealed the Deuteronomy charge over the Son — *hear ye him* — with Moses himself standing by. The Prophet like Moses (Acts 3:22) is the beloved Son the Father commands the fathers to hear.'),
  ('canon', 'acts', 3, 22, 'canon', 'john', 5, 46, 'free', E'*For had ye believed Moses, ye would have believed me: for he wrote of me.* (John 5:46). Yahusha (Jesus) named himself the one Moses wrote of — *he wrote of me.* The Prophet of Deuteronomy 18 that Peter preaches (Acts 3:22) is the very Prophet Moses foretold; to honour Moses is to hear him.'),
  ('canon', 'acts', 3, 22, 'apocrypha', '1-maccabees', 14, 41, 'extras', E'*Also that the Yahudim (Jews) and priests were well pleased that Simon should be their governor and high priest for ever, until there should arise a faithful prophet;* (1 Maccabees 14:41). The Hebrew library shows the people still waiting — every arrangement held *until there should arise a faithful prophet.* The Prophet like Moses Peter announces (Acts 3:22) is the long-awaited one the library kept watch for.'),
  -- thread: acts-3-in-thy-seed-shall-all-the-kindreds-of-the-earth-be-blessed
  ('canon', 'acts', 3, 25, 'canon', 'genesis', 22, 18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). Peter reminds the men of Yashar''el (Israel) they are *the children … of the covenant … saying unto Abraham, And in thy seed shall all the kindreds of the earth be blessed* (Acts 3:25). The promise is to Abraham''s seed; the blessing flows out to the families of the earth through that seed, not by erasing it.'),
  ('canon', 'acts', 3, 25, 'canon', 'genesis', 28, 14, 'free', E'*And thy seed shall be as the dust of the earth, and thou shalt spread abroad to the west, and to the east, and to the north, and to the south: and in thee and in thy seed shall all the families of the earth be blessed.* (Genesis 28:14). The same oath passed to Jacob — *in thee and in thy seed shall all the families of the earth be blessed* — the seed spreading to the four winds is the scattered seed of Yashar''el (Israel), and through it the families of the earth are blessed.'),
  ('canon', 'acts', 3, 25, 'apocrypha', 'ecclesiasticus', 44, 21, 'extras', E'*Therefore he assured him by an oath, that he would bless the nations in his seed, and that he would multiply him as the dust of the earth, and exalt his seed as the stars, and cause them to inherit from sea to sea, and from the river to the utmost part of the land.* (Ecclesiasticus 44:21). The library held the same oath — Yahuah (God) would *bless the nations in his seed.* The blessing of the kindreds (Acts 3:25) comes through Abraham''s multiplied seed, the covenant lineage, not a people put in its place.'),
  ('canon', 'acts', 3, 25, 'canon', 'galatians', 3, 16, 'free', E'*Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* (Galatians 3:16). Paul reads the promise to its point — *to thy seed, which is Messiah (Christ).* The seed in whom all the kindreds are blessed (Acts 3:25) is the one Seed, Yahusha (Jesus); the blessing reaches the families of the earth in him, the head of the covenant line.'),
  -- thread: acts-4-the-stone-which-the-builders-rejected-the-head-of-the-corner
  ('canon', 'acts', 4, 11, 'canon', 'psalms', 118, 22, 'free', E'*The stone which the builders refused is become the head stone of the corner.* (Psalm 118:22). Peter throws the psalm in the builders'' faces — *this is the stone which was set at nought of you builders, which is become the head of the corner* (Acts 4:11). The rulers of Yashar''el (Israel) are the builders; the One they rejected is the cornerstone Yahuah set.'),
  ('canon', 'acts', 4, 11, 'canon', 'isaiah', 28, 16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16). The cornerstone is Yahuah''s own laying — *Behold, I lay in Zion … a precious corner stone, a sure foundation.* The stone the builders disallowed (Acts 4:11) is the tried foundation-stone of Zion; salvation rests on no other (Acts 4:12).'),
  ('canon', 'acts', 4, 11, 'canon', 'matthew', 21, 42, 'free', E'*Yahusha (Jesus) saith unto them, Did ye never read in the scriptures, The stone which the builders rejected, the same is become the head of the corner: this is Yahuah''s (Lord''s) doing, and it is marvellous in our eyes?* (Matthew 21:42). Yahusha (Jesus) had already turned the psalm on the chief priests — *the stone which the builders rejected.* Peter, before that same council, preaches what the Master told the builders to their faces.'),
  ('canon', 'acts', 4, 11, 'canon', '1-peter', 2, 6, 'free', E'*Wherefore also it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded.* (1 Peter 2:6). Peter writes later what he preaches here — Isaiah''s *chief corner stone, elect, precious.* The rejected stone (Acts 4:11) is the chosen foundation; those who build on him are not confounded.'),
  ('canon', 'acts', 4, 11, 'canon', '1-peter', 2, 7, 'free', E'*Unto you therefore which believe he is precious: but unto them which be disobedient, the stone which the builders disallowed, the same is made the head of the corner,* (1 Peter 2:7). The same apostle joins both stone-scriptures — *the stone which the builders disallowed, the same is made the head of the corner.* What the council disallowed (Acts 4:11), Yahuah (God) made the head of the corner.'),
  -- thread: acts-4-the-maker-of-heaven-and-earth-and-the-kings-that-rage
  ('canon', 'acts', 4, 24, 'canon', 'exodus', 20, 11, 'free', E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* (Exodus 20:11). The believers ground their prayer in the Maker — *Yahuah (Lord), thou art Elohim (God), which hast made heaven, and earth, and the sea, and all that in them is* (Acts 4:24) — the very words of the fourth commandment. The One who set his King on Zion is the Creator of all; the threats of men are nothing before him.'),
  ('canon', 'acts', 4, 24, 'canon', 'nehemiah', 9, 6, 'free', E'*Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* (Nehemiah 9:6). The assembly''s confession echoes the Levites'' — *thou hast made heaven … the earth … the seas.* They pray to the sovereign Maker (Acts 4:24), and so the raging of rulers cannot overthrow his counsel.'),
  ('canon', 'acts', 4, 25, 'canon', 'psalms', 2, 1, 'free', E'*Why do the heathen rage, and the people imagine a vain thing?* (Psalm 2:1). The believers quote David — *Why did the heathen rage, and the people imagine vain things?* (Acts 4:25). The raging of the nations against Yahuah''s anointed is no surprise; the psalm foretold it.'),
  ('canon', 'acts', 4, 26, 'canon', 'psalms', 2, 2, 'free', E'*The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* (Psalm 2:2). *The kings of the earth stood up, and the rulers were gathered together against Yahuah (Lord), and against his Messiah (Christ)* (Acts 4:26) is Psalm 2 fulfilled — *Herod, and Pontius Pilate, with the Gentiles, and the people of Yashar''el (Israel)* (Acts 4:27) gathered against the Anointed, doing only *whatsoever thy hand and thy counsel determined before* (Acts 4:28).'),
  -- thread: acts-4-neither-was-there-any-that-lacked-the-community-with-no-poor
  ('canon', 'acts', 4, 34, 'canon', 'deuteronomy', 15, 4, 'free', E'*Save when there shall be no poor among you; for Yahuah (LORD) shall greatly bless thee in the land which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance to possess it:* (Deuteronomy 15:4). Of the believers it is written *neither was there any among them that lacked* (Acts 4:34) — the Torah''s own vision of the blessed community where *there shall be no poor among you.* The Spirit-filled assembly lives the covenant ideal, not a novelty.'),
  ('canon', 'acts', 4, 34, 'canon', '2-corinthians', 8, 15, 'free', E'*As it is written, He that had gathered much had nothing over; and he that had gathered little had no lack.* (2 Corinthians 8:15). Paul names the same equality from the manna — *he that had gathered little had no lack.* The sharing that left none lacking (Acts 4:34) is the manna-pattern: enough for all, none in want.'),
  -- thread: acts-5-ananias-kept-back-the-price-achan-and-the-accursed-thing
  ('canon', 'acts', 5, 2, 'canon', 'joshua', 7, 1, 'free', E'*But the children of Yashar''el (Israel) committed a trespass in the accursed thing: for Achan, the son of Carmi, the son of Zabdi, the son of Zerah, of the tribe of Yahudah (Judah), took of the accursed thing: and the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel).* (Joshua 7:1). Ananias *kept back part of the price* (Acts 5:2) as Achan kept back the devoted thing — a secret theft against the holy assembly that brought death where there should have been blessing.'),
  ('canon', 'acts', 5, 3, 'canon', 'joshua', 7, 11, 'free', E'*Yashar''el (Israel) hath sinned, and they have also transgressed my covenant which I commanded them: for they have even taken of the accursed thing, and have also stolen, and dissembled also, and they have put it even among their own stuff.* (Joshua 7:11). The sin is the same shape — *stolen, and dissembled also.* Ananias lied *to the Ruach HaKodesh (Holy Spirit)* (Acts 5:3) as Achan dissembled before Yahuah; the holiness of the gathered people is not mocked, and *great fear* falls on all (Acts 5:11) as it did at Achor.'),
  -- thread: acts-5-we-ought-to-obey-elohim-rather-than-men
  ('canon', 'acts', 5, 29, 'canon', 'daniel', 3, 18, 'free', E'*But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* (Daniel 3:18). The three before the furnace answered as the apostles answer the council — *we ought to obey Elohim (God) rather than men* (Acts 5:29). When the ruler''s command and Yahuah''s collide, the servants of Yah obey heaven, whatever the cost.'),
  ('canon', 'acts', 5, 29, 'canon', 'exodus', 1, 17, 'free', E'*But the midwives feared Elohim (God), and did not as the king of Egypt commanded them, but saved the men children alive.* (Exodus 1:17). The Hebrew midwives chose the same — they *feared Elohim (God), and did not as the king of Egypt commanded.* To obey Elohim (God) rather than men (Acts 5:29) is the oldest faithfulness, blessed by Yahuah from Egypt onward.'),
  ('canon', 'acts', 5, 29, 'apocrypha', '2-maccabees', 7, 2, 'extras', E'*But one of them that spoke first said thus, What wouldest you ask or learn of us? we are ready to die, rather than to transgress the laws of our fathers.* (2 Maccabees 7:2). The library remembers the seven brothers who would not transgress the Torah at the king''s command — *we are ready to die, rather than to transgress the laws of our fathers.* The apostles'' stand (Acts 5:29) is that same obedience to Elohim (God) above the ruler.'),
  -- thread: acts-5-raised-and-hanged-on-a-tree-redeemed-from-the-curse
  ('canon', 'acts', 5, 30, 'canon', 'deuteronomy', 21, 23, 'free', E'*His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* (Deuteronomy 21:23). Peter says *whom ye slew and hanged on a tree* (Acts 5:30) — and the Torah says *he that is hanged is accursed of Elohim (God).* The Messiah took the place of the accursed, hung on the tree, bearing the curse that fell on the covenant-breakers.'),
  ('canon', 'acts', 5, 30, 'canon', 'galatians', 3, 13, 'free', E'*Messiah (Christ) hath redeemed us from the curse of the law, being made a curse for us: for it is written, Cursed is every one that hangeth on a tree:* (Galatians 3:13). Paul names what the tree accomplished — *Messiah (Christ) hath redeemed us … being made a curse for us.* The curse is the Deuteronomy 28 exile-judgment that fell on Yashar''el (Israel) for covenant-breaking, not the Torah itself; hanged on the tree (Acts 5:30), he bore the exile-curse to bring the scattered home, *to give repentance to Yashar''el (Israel)* (Acts 5:31).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a0305_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a0305_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-3-the-lame-man-leaps-the-sign-of-the-age-of-healing',
       E'The lame man leaps — the sign of the age of healing',
       E'Peter has no silver or gold, but he has the name: *In the name of Yahusha HaMashiach (Jesus Christ) of Nazareth rise up and walk* (Acts 3:6), and the man lame from his mother''s womb goes *walking, and leaping, and praising Elohim (God)* (Acts 3:8). The leaping is a sign — Isaiah set it among the marks of the day Elohim (God) comes to save: *the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5), *then shall the lame man leap as an hart, and the tongue of the dumb sing* (Isaiah 35:6). Yahusha (Jesus) had pointed to the very signs when Yochanan (John) sent to ask if he was the coming one — *the blind receive their sight, and the lame walk … the deaf hear, the dead are raised up* (Matthew 11:5). The lame man walking into the temple is the witness continuing: the One who opened blind eyes and made the lame leap is risen, and his name still does the works of the promised age.',
       sv.verse_id, ev.verse_id, 'free', 5100
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-3-the-god-of-abraham-isaac-and-jacob-glorified-his-servant',
       E'The Elohim (God) of Abraham, Isaac, and Jacob glorified his Servant',
       E'Peter will not take the credit for the healing — he names the One who acted: *the Elohim (God) of Abraham, and of Isaac, and of Jacob, the Elohim (God) of our fathers, hath glorified his Son Yahusha (Jesus); whom ye delivered up, and denied him in the presence of Pilate* (Acts 3:13). This is the God of the bush, who told Moses *I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Exodus 3:6), whose name *for ever* is the Elohim (God) of the fathers (Exodus 3:15). And the glorifying is the lifting up of Isaiah''s servant — *behold, my servant shall deal prudently, he shall be exalted and extolled, and be very high* (Isaiah 52:13) — the verse that opens the song of the despised and rejected one. The God of the fathers has vindicated his Servant: the One they *denied* and *killed* (Acts 3:14-15), Elohim (God) raised and exalted. There is no new deity in Peter''s sermon; the covenant Elohim and the risen Yahusha are one continuous story.',
       sv.verse_id, ev.verse_id, 'free', 5108
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-3-the-times-of-restitution-of-all-things-the-restoration',
       E'The times of restitution of all things — the restoration the prophets foretold',
       E'Peter calls them to repent *that your sins may be blotted out, when the times of refreshing shall come from the presence of Yahuah (Lord)* (Acts 3:19), and names the future plainly: the heaven must receive the Messiah *until the times of restitution of all things, which Elohim (God) hath spoken by the mouth of all his holy prophets since the world began* (Acts 3:21). The restitution is no new idea — it is the restoration the prophets ended on. Malachi sealed them with it: *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5), *and he shall turn the heart of the fathers to the children, and the heart of the children to their fathers* (Malachi 4:6). The Hebrew library read that Elijah-charge exactly so — *to turn the heart of the father to the son, and to restore the tribes of Jacob* (Ecclesiasticus 48:10). And it is the very hope the disciples raised at the ascension: *Yahuah (Lord), wilt thou at this time restore again the kingdom to Yashar''el (Israel)?* (Acts 1:6). The restitution of all things, the refreshing, the restored kingdom, the gathered tribes — one restoration, spoken by all the prophets, timed to the Father.',
       sv.verse_id, ev.verse_id, 'extras', 5116
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-3-a-prophet-like-unto-moses-him-shall-ye-hear',
       E'A Prophet like unto Moses — him shall ye hear in all things',
       E'Peter grounds the call in Moses himself: *A prophet shall Yahuah Elohaychem (the Lord your God) raise up unto you of your brethren, like unto me; him shall ye hear in all things whatsoever he shall say unto you* (Acts 3:22), and the warning, *every soul, which will not hear that prophet, shall be destroyed from among the people* (Acts 3:23). The words are Deuteronomy''s: *Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet … like unto me; unto him ye shall hearken* (Deuteronomy 18:15); *I … will put my words in his mouth* (Deuteronomy 18:18); *whosoever will not hearken unto my words … I will require it of him* (Deuteronomy 18:19). The Father sealed that charge over the Son on the mount — *This is my beloved Son … hear ye him* (Matthew 17:5) — Moses standing there. And Yahusha (Jesus) named himself the one Moses wrote of: *had ye believed Moses, ye would have believed me: for he wrote of me* (John 5:46). The library shows the people still waiting for him — every arrangement held *until there should arise a faithful prophet* (1 Maccabees 14:41). The long-awaited Prophet like Moses has come; to honour Moses is to hear him.',
       sv.verse_id, ev.verse_id, 'extras', 5124
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=3 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-3-in-thy-seed-shall-all-the-kindreds-of-the-earth-be-blessed',
       E'In thy seed shall all the kindreds of the earth be blessed',
       E'Peter tells the men of Yashar''el (Israel) who they are: *Ye are the children of the prophets, and of the covenant which Elohim (God) made with our fathers, saying unto Abraham, And in thy seed shall all the kindreds of the earth be blessed* (Acts 3:25), and *Unto you first Elohim (God), having raised up his Son Yahusha (Jesus), sent him to bless you* (Acts 3:26). The promise is the Abrahamic oath — *in thy seed shall all the nations of the earth be blessed* (Genesis 22:18) — passed to Jacob, *in thee and in thy seed shall all the families of the earth be blessed* (Genesis 28:14), the seed spreading to the four winds. The library held the same oath: Yahuah (God) *would bless the nations in his seed* (Ecclesiasticus 44:21). And Paul reads the promise to its single point: *to thy seed, which is Messiah (Christ)* (Galatians 3:16). The blessing of the kindreds is not the nations spliced into the covenant; it is the blessing carried by the one Seed, Yahusha (Jesus), the head of the covenant line — to the children of the covenant *first,* and through the seed to the families of the earth.',
       sv.verse_id, ev.verse_id, 'extras', 5132
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=3 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-4-the-stone-which-the-builders-rejected-the-head-of-the-corner',
       E'The stone which the builders rejected — become the head of the corner',
       E'Hauled before the rulers and elders, Peter answers their *by what power, or by what name* (Acts 4:7) with the psalm: *This is the stone which was set at nought of you builders, which is become the head of the corner* (Acts 4:11), *neither is there salvation in any other* (Acts 4:12). David sang it — *the stone which the builders refused is become the head stone of the corner* (Psalm 118:22) — and Isaiah named the laying of it: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation* (Isaiah 28:16). Yahusha (Jesus) had already turned the verse on the chief priests — *the stone which the builders rejected, the same is become the head of the corner: this is Yahuah''s (Lord''s) doing* (Matthew 21:42) — and Peter writes it again in his letter, joining both stone-scriptures: *a chief corner stone, elect, precious* (1 Peter 2:6), *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7). The builders are the rulers of Yashar''el (Israel); the One they disallowed is the cornerstone Yahuah set, and there is no other foundation for salvation.',
       sv.verse_id, ev.verse_id, 'free', 5140
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-4-the-maker-of-heaven-and-earth-and-the-kings-that-rage',
       E'The Maker of heaven and earth — and the kings that rage against the Anointed',
       E'Let go from the council, the believers lift their voice with one accord and ground their prayer in the Creator: *Yahuah (Lord), thou art Elohim (God), which hast made heaven, and earth, and the sea, and all that in them is* (Acts 4:24) — the very confession of the fourth commandment, *in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is* (Exodus 20:11), and of the Levites'' prayer, *thou hast made heaven … the earth … the seas, and all that is therein* (Nehemiah 9:6). Then they read their own moment out of David: *Why did the heathen rage … The kings of the earth stood up, and the rulers were gathered together against Yahuah (Lord), and against his Messiah (Christ)* (Acts 4:25-26) — Psalm 2''s *why do the heathen rage* (Psalm 2:1), *the kings of the earth set themselves … against Yahuah (LORD), and against his anointed* (Psalm 2:2). And the fulfilment they name: *Herod, and Pontius Pilate, with the Gentiles, and the people of Yashar''el (Israel)* gathered against the holy child (Acts 4:27), accomplishing only *whatsoever thy hand and thy counsel determined before to be done* (Acts 4:28). The rulers rage; the Maker of all reigns, and their rage serves his counsel.',
       sv.verse_id, ev.verse_id, 'free', 5148
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=4 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-4-neither-was-there-any-that-lacked-the-community-with-no-poor',
       E'Neither was there any that lacked — the covenant community with no poor',
       E'Of the multitude of believers it is written: *neither was there any among them that lacked: for as many as were possessors of lands or houses sold them … and distribution was made unto every man according as he had need* (Acts 4:34-35). This is not a novelty invented in Jerusalem; it is the Torah''s own vision of the blessed land: *Save when there shall be no poor among you; for Yahuah (LORD) shall greatly bless thee in the land* (Deuteronomy 15:4). And it is the manna-pattern Paul names — *He that had gathered much had nothing over; and he that had gathered little had no lack* (2 Corinthians 8:15) — enough for all, none in want. The Spirit-filled assembly lives the covenant ideal the Torah set: open hands, a brother''s need met, no poor among the people of Yah.',
       sv.verse_id, ev.verse_id, 'free', 5156
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=4 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-5-ananias-kept-back-the-price-achan-and-the-accursed-thing',
       E'Ananias kept back the price — Achan and the accursed thing in the camp',
       E'A man sells a possession and *kept back part of the price, his wife also being privy to it* (Acts 5:2), and Peter names it for what it is: *why hath Satan filled thine heart to lie to the Ruach HaKodesh (Holy Spirit)* — *thou hast not lied unto men, but unto Elohim (God)* (Acts 5:3-4). The pattern is Achan''s at Jericho: *the children of Yashar''el (Israel) committed a trespass in the accursed thing: for Achan … took of the accursed thing: and the anger of Yahuah (LORD) was kindled* (Joshua 7:1) — *they have even taken of the accursed thing, and have also stolen, and dissembled also, and they have put it even among their own stuff* (Joshua 7:11). A secret theft against the holy assembly, a dissembling before Yahuah, and death falls where there should have been blessing. *Great fear came upon all the church* (Acts 5:11) as it came upon Yashar''el (Israel) at the valley of Achor. The gathered people of Yah is holy ground; its holiness is not mocked.',
       sv.verse_id, ev.verse_id, 'free', 5164
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-5-we-ought-to-obey-elohim-rather-than-men',
       E'We ought to obey Elohim (God) rather than men',
       E'Forbidden again to speak the name, Peter and the apostles answer plainly: *We ought to obey Elohim (God) rather than men* (Acts 5:29). It is the oldest faithfulness. The Hebrew midwives in Egypt *feared Elohim (God), and did not as the king of Egypt commanded them, but saved the men children alive* (Exodus 1:17). The three before Nebuchadnezzar''s furnace would not bow: *be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:18). And the library remembers the seven brothers who would not transgress the Torah at the king''s command — *we are ready to die, rather than to transgress the laws of our fathers* (2 Maccabees 7:2). When the ruler''s word and Yahuah''s word collide, the servants of Yah obey heaven, and they count it joy *that they were counted worthy to suffer shame for his name* (Acts 5:41).',
       sv.verse_id, ev.verse_id, 'extras', 5172
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=5 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-5-raised-and-hanged-on-a-tree-redeemed-from-the-curse',
       E'Raised, and hanged on a tree — redeemed from the curse of the exile',
       E'Peter sets the death and the exaltation side by side: *The Elohim (God) of our fathers raised up Yahusha (Jesus), whom ye slew and hanged on a tree. Him hath Elohim (God) exalted with his right hand to be a Prince and a Saviour, for to give repentance to Yashar''el (Israel), and forgiveness of sins* (Acts 5:30-31). The tree is the Torah''s own mark of the curse: *he that is hanged is accursed of Elohim (God)* (Deuteronomy 21:23). Paul names what the tree accomplished — *Messiah (Christ) hath redeemed us from the curse of the law, being made a curse for us: for it is written, Cursed is every one that hangeth on a tree* (Galatians 3:13). The curse is not the Torah; it is the Deuteronomy 28 exile-judgment that fell on Yashar''el (Israel) for covenant-breaking. Hung on the tree, the Messiah bore that exile-curse — and was exalted *to give repentance to Yashar''el (Israel),* to turn the scattered home. The cross is the door home, and the One who hung accursed is the Prince and Saviour who gathers the broken-off back.',
       sv.verse_id, ev.verse_id, 'free', 5180
  FROM _s217_a0305_lookup sv, _s217_a0305_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=5 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-3-the-lame-man-leaps-the-sign-of-the-age-of-healing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:6 — *Then shall the lame man leap as an hart, and the tongue of the dumb sing* the healing-age sign, fulfilled as the man goes leaping (Acts 3:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-lame-man-leaps-the-sign-of-the-age-of-healing'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:5 — *the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* the signs of the day Elohim (God) comes to save.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-lame-man-leaps-the-sign-of-the-age-of-healing'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 11:5 — *the blind receive their sight, and the lame walk … the deaf hear, the dead are raised up* Yahusha''s (Jesus''s) own Isaiah-signs, still working in his name.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-lame-man-leaps-the-sign-of-the-age-of-healing'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-3-the-god-of-abraham-isaac-and-jacob-glorified-his-servant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 3:6 — *I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* the God of the bush is the God who glorified his Servant (Acts 3:13).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-god-of-abraham-isaac-and-jacob-glorified-his-servant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:15 — *this is my name for ever, and this is my memorial unto all generations* the Elohim (God) of the fathers, who has now vindicated his Son.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-god-of-abraham-isaac-and-jacob-glorified-his-servant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 52:13 — *behold, my servant … he shall be exalted and extolled, and be very high* the opening of the suffering-servant song; the glorified Servant of Acts 3:13.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-god-of-abraham-isaac-and-jacob-glorified-his-servant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-3-the-times-of-restitution-of-all-things-the-restoration
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 1:6 — *wilt thou at this time restore again the kingdom to Yashar''el (Israel)?* the restored kingdom and the restitution of all things are one hope (Acts 3:19-21).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-times-of-restitution-of-all-things-the-restoration'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* the restoration the prophets ended on.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-times-of-restitution-of-all-things-the-restoration'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:6 — *he shall turn the heart of the fathers to the children* the restoring of what was broken, the restitution Peter preaches.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-times-of-restitution-of-all-things-the-restoration'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 48:10 — *to turn the heart of the father to the son, and to restore the tribes of Jacob* the library reads Malachi''s Elijah as the restorer of the twelve tribes.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-the-times-of-restitution-of-all-things-the-restoration'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-3-a-prophet-like-unto-moses-him-shall-ye-hear
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:15 — *a Prophet … like unto me; unto him ye shall hearken* the verse Peter quotes; the Prophet like Moses is Yahusha (Jesus).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-a-prophet-like-unto-moses-him-shall-ye-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:18 — *I … will put my words in his mouth* the Prophet speaks the Father''s words, not his own.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-a-prophet-like-unto-moses-him-shall-ye-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 18:19 — *whosoever will not hearken unto my words … I will require it of him* Peter''s warning that every soul that will not hear is cut off (Acts 3:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-a-prophet-like-unto-moses-him-shall-ye-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 17:5 — *This is my beloved Son … hear ye him* the Father seals the Deuteronomy charge over the Son on the mount, Moses standing by.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-a-prophet-like-unto-moses-him-shall-ye-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 5:46 — *had ye believed Moses, ye would have believed me: for he wrote of me* Yahusha (Jesus) is the Prophet Moses foretold; to honour Moses is to hear him.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-a-prophet-like-unto-moses-him-shall-ye-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Maccabees 14:41 — *until there should arise a faithful prophet* the library keeps watch for the awaited Prophet Peter announces has come.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-a-prophet-like-unto-moses-him-shall-ye-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=14 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-3-in-thy-seed-shall-all-the-kindreds-of-the-earth-be-blessed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed* the Abrahamic oath Peter cites; the promise is to the seed.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-in-thy-seed-shall-all-the-kindreds-of-the-earth-be-blessed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:14 — *in thee and in thy seed shall all the families of the earth be blessed* the seed spread to the four winds — the scattered seed of Yashar''el (Israel).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-in-thy-seed-shall-all-the-kindreds-of-the-earth-be-blessed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 44:21 — *that he would bless the nations in his seed … exalt his seed as the stars* the library''s witness to the same oath through Abraham''s lineage.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-in-thy-seed-shall-all-the-kindreds-of-the-earth-be-blessed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:16 — *to thy seed, which is Messiah (Christ)* the one Seed who carries the blessing to the families of the earth — not the nations spliced in.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-3-in-thy-seed-shall-all-the-kindreds-of-the-earth-be-blessed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-4-the-stone-which-the-builders-rejected-the-head-of-the-corner
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 118:22 — *The stone which the builders refused is become the head stone of the corner* the psalm Peter throws in the builders'' faces (Acts 4:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-the-stone-which-the-builders-rejected-the-head-of-the-corner'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 28:16 — *Behold, I lay in Zion … a precious corner stone, a sure foundation* the cornerstone is Yahuah''s own laying; salvation rests on no other.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-the-stone-which-the-builders-rejected-the-head-of-the-corner'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 21:42 — *The stone which the builders rejected, the same is become the head of the corner* Yahusha (Jesus) had turned the psalm on the chief priests.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-the-stone-which-the-builders-rejected-the-head-of-the-corner'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 2:6 — *Behold, I lay in Sion a chief corner stone, elect, precious* Peter writes later what he preaches here; the rejected stone is the chosen foundation.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-the-stone-which-the-builders-rejected-the-head-of-the-corner'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 2:7 — *the stone which the builders disallowed, the same is made the head of the corner* what the council disallowed, Yahuah (God) made the head of the corner.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-the-stone-which-the-builders-rejected-the-head-of-the-corner'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-4-the-maker-of-heaven-and-earth-and-the-kings-that-rage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:11 — *in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is* the fourth-commandment confession the believers pray (Acts 4:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-the-maker-of-heaven-and-earth-and-the-kings-that-rage'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:6 — *thou hast made heaven … the earth … the seas, and all that is therein* the Levites'' confession of the sovereign Maker.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-the-maker-of-heaven-and-earth-and-the-kings-that-rage'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 2:1 — *Why do the heathen rage, and the people imagine a vain thing?* the believers read their own moment out of David (Acts 4:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-the-maker-of-heaven-and-earth-and-the-kings-that-rage'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 2:2 — *the kings of the earth set themselves … against Yahuah (LORD), and against his anointed* fulfilled in Herod, Pilate, the Gentiles, and Yashar''el (Israel) (Acts 4:26-27).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-the-maker-of-heaven-and-earth-and-the-kings-that-rage'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-4-neither-was-there-any-that-lacked-the-community-with-no-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:4 — *Save when there shall be no poor among you; for Yahuah (LORD) shall greatly bless thee in the land* the Torah''s vision of the community with no poor.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-neither-was-there-any-that-lacked-the-community-with-no-poor'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 8:15 — *he that had gathered little had no lack* the manna-pattern of equality; enough for all, none in want.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-4-neither-was-there-any-that-lacked-the-community-with-no-poor'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=4 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-5-ananias-kept-back-the-price-achan-and-the-accursed-thing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 7:1 — *Achan … took of the accursed thing: and the anger of Yahuah (LORD) was kindled* the secret theft against the holy camp; Ananias kept back the price (Acts 5:2).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-5-ananias-kept-back-the-price-achan-and-the-accursed-thing'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 7:11 — *they have … stolen, and dissembled also* the same shape of sin; Ananias dissembled before the Ruach HaKodesh (Holy Spirit), and great fear fell (Acts 5:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-5-ananias-kept-back-the-price-achan-and-the-accursed-thing'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-5-we-ought-to-obey-elohim-rather-than-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:18 — *we will not serve thy gods, nor worship the golden image which thou hast set up* the three before the furnace; obey Elohim (God) rather than men.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-5-we-ought-to-obey-elohim-rather-than-men'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:17 — *the midwives feared Elohim (God), and did not as the king of Egypt commanded them* the oldest faithfulness, blessed by Yahuah.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-5-we-ought-to-obey-elohim-rather-than-men'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:2 — *we are ready to die, rather than to transgress the laws of our fathers* the library''s martyrs who obeyed the Torah above the king.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-5-we-ought-to-obey-elohim-rather-than-men'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-5-raised-and-hanged-on-a-tree-redeemed-from-the-curse
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 21:23 — *he that is hanged is accursed of Elohim (God)* the Torah''s mark of the curse; the Messiah hung on the tree (Acts 5:30).'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-5-raised-and-hanged-on-a-tree-redeemed-from-the-curse'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 3:13 — *redeemed us from the curse … being made a curse for us* the curse is the Deuteronomy 28 exile-judgment, not the Torah; he bore it to bring the scattered home.'
  FROM cross_reference_threads t, cross_references x, _s217_a0305_lookup sv, _s217_a0305_lookup tv
 WHERE t.slug='acts-5-raised-and-hanged-on-a-tree-redeemed-from-the-curse'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=5 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- ----- fragment: minion_acts_06_07.sql (S217 Acts 6-7) -----
-- =====================================================================
-- S217 minion — ACTS 6-7 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 6-7.  Tag: a0607 (temp view _s217_a0607_lookup).  Sort band: 5200-5270.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINT (Checklist 9): Stephen's speech climaxes in the prophets' own charge against a
-- faithless generation WITHIN the covenant (stiffnecked, uncircumcised in heart, resisting the
-- Spirit, persecuting the sent ones). It is covenant-internal rebuke of CONDUCT — the same
-- charge Moses and the prophets made of the same people — never ethnic condemnation of the
-- Yahudim (Jews) / the seed of Yashar'el (Israel). Framed accordingly in thread acts-7-stiffnecked.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 6:
--   v.1-7   the seven appointed   Tanakh: Numbers 11:16-17 (Exodus 18:21 weighed; no Spirit element, not added)  Extras: none warranted  NT: none warranted (narrative)
--   v.8-10  wisdom none resisted  Tanakh: none added  Extras: none warranted  NT: Luke 21:15
--   v.11-14 false witnesses       Tanakh: none added  Extras: none warranted  NT: Matthew 26:60-61
--   v.15    face as an angel      Tanakh: Exodus 34:29-30  Extras: none warranted  NT: none warranted
--  ACTS 7:
--   v.2-7   God of glory/Abraham  Tanakh: Genesis 12:1, 15:13-14  Extras: 1 Maccabees 2:52  NT: none warranted
--   v.8     circumcision/12 patr  Tanakh: (Genesis 17:10 weighed) none added  Extras: none  NT: none (carried in promise thread)
--   v.9-19  Joseph sold to Egypt  Tanakh: Genesis 37:28, 45:5  Extras: 1 Maccabees 2:53  NT: none added
--   v.20-37 Moses refused->sent   Tanakh: Exodus 2:14 (Exodus 3 bush + Deut 18:15 quoted in 7:32-37 carried in Acts 3 threads, not re-added)  Extras: none  NT: none
--   v.38-43 calf / host of heaven Tanakh: Exodus 32:1, Amos 5:25-27  Extras: (Jubilees 1:8-10, 1 Enoch 99:7 weighed; cleanest witnesses carry apparatus/parentheticals, not added)  NT: none
--   v.44-50 temple/Most High      Tanakh: Isaiah 66:1-2, 1 Kings 8:27  Extras: none warranted  NT: none ("Gentiles" of 7:45 = nations dispossessed, narrative; 7:45 "Yahusha"=Joshua parse artifact, not threaded)
--   v.51-53 stiffnecked/prophets  Tanakh: Exodus 33:5, Deuteronomy 10:16, Isaiah 63:10  Extras: Jubilees 1:12  NT: none added
--   v.55-60 Son of Adam/forgive   Tanakh: Daniel 7:13  Extras: (1 Enoch 62/69 enthroned Son of Adam carried in Acts 2 thread, not re-added)  NT: Luke 22:69, Luke 23:34
--
-- THREADS (slug -> target libraries):
--   5200 acts-6-the-seven-chosen-and-the-spirit-of-the-seventy                (Tanakh)
--   5210 acts-6-tried-like-his-master-the-wisdom-none-could-resist            (Tanakh + NT)
--   5220 acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed             (Tanakh + Extras)
--   5230 acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent (Tanakh + Extras)
--   5240 acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos            (Tanakh)
--   5250 acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands         (Tanakh)
--   5260 acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge    (Tanakh + Extras)
--   5270 acts-7-the-son-of-adam-standing-at-the-right-hand                    (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a0607_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-6-the-seven-chosen-and-the-spirit-of-the-seventy
  ('canon', 'acts', 6, 3, 'canon', 'numbers', 11, 16, 'free', E'*And Yahuah (LORD) said unto Moses, Gather unto me seventy men of the elders of Yashar''el (Israel), whom thou knowest to be the elders of the people, and officers over them; and bring them unto the tabernacle of the congregation, that they may stand there with thee.* (Numbers 11:16). When the apostles say *look ye out among you seven men of honest report, full of the Ruach HaKodesh (Holy Spirit) and wisdom* (Acts 6:3), they do what Moses did — gather Spirit-bearing men to share the burden of the people, so the word is not left for serving tables.'),
  ('canon', 'acts', 6, 3, 'canon', 'numbers', 11, 17, 'free', E'*And I will come down and talk with thee there: and I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone.* (Numbers 11:17). The seventy bore the burden with Moses by the same Spirit that was on him; the seven of Acts 6:3, *full of the Ruach HaKodesh (Holy Spirit),* bear the burden with the twelve. The Spirit distributes the load so the ministry of the word is not abandoned.'),
  -- thread: acts-6-tried-like-his-master-the-wisdom-none-could-resist
  ('canon', 'acts', 6, 10, 'canon', 'luke', 21, 15, 'free', E'*For I will give you a mouth and wisdom, which all your adversaries shall not be able to gainsay nor resist.* (Luke 21:15). *They were not able to resist the wisdom and the spirit by which he spake* (Acts 6:10) — the Master''s promise kept in his servant. Yahusha (Jesus) said the wisdom he gave would be unanswerable, and Stephen''s accusers could not withstand it.'),
  ('canon', 'acts', 6, 13, 'canon', 'matthew', 26, 61, 'free', E'*And said, This fellow said, I am able to destroy the temple of Elohim (God), and to build it in three days.* (Matthew 26:61). The charge against Stephen is the charge they laid on his Master — *this Yahusha (Jesus) of Nazareth shall destroy this place* (Acts 6:14). False witnesses brought the temple-accusation against the Messiah; false witnesses bring it now against the one who follows him.'),
  ('canon', 'acts', 6, 15, 'canon', 'exodus', 34, 29, 'free', E'*And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses'' hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* (Exodus 34:29). They accuse Stephen of blaspheming Moses, yet *all that sat in the council … saw his face as it had been the face of an angel* (Acts 6:15) — the very shining Moses bore when he came down from speaking with Yahuah. The man they charge wears the mark of one who has been with Elohim (God).'),
  -- thread: acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed
  ('canon', 'acts', 7, 3, 'canon', 'genesis', 12, 1, 'free', E'*Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* (Genesis 12:1). Stephen begins where the covenant began — *The Elohim (God) of glory appeared unto our father Abraham … Get thee out of thy country* (Acts 7:2-3). The call that started the seed-line is the foundation of the whole history he is about to recite.'),
  ('canon', 'acts', 7, 6, 'canon', 'genesis', 15, 13, 'free', E'*And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* (Genesis 15:13). *His seed should sojourn in a strange land … four hundred years* (Acts 7:6) is the word spoken to Abraham — the bondage foretold to the seed before ever there was a child, the promise running ahead of the people who would carry it.'),
  ('canon', 'acts', 7, 7, 'canon', 'genesis', 15, 14, 'free', E'*And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* (Genesis 15:14). *The nation to whom they shall be in bondage will I judge, said Elohim (God): and after that shall they come forth* (Acts 7:7). The judgment on Egypt and the coming-out were sworn to Abraham generations before the exodus; the deliverer comes because the promise was first.'),
  ('canon', 'acts', 7, 2, 'apocrypha', '1-maccabees', 2, 52, 'extras', E'*Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). The Hebrew library rehearses the fathers as Stephen does — Mattathias, dying, names *Abraham found faithful.* The God of glory who called Abraham (Acts 7:2) is the One the library''s own deathbed recital begins with.'),
  -- thread: acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent
  ('canon', 'acts', 7, 9, 'canon', 'genesis', 37, 28, 'free', E'*Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* (Genesis 37:28). *The patriarchs, moved with envy, sold Joseph into Egypt* (Acts 7:9). Stephen sets the pattern: the deliverer rejected by his own brethren, sold for silver, sent ahead by Elohim (God) into the place of saving.'),
  ('canon', 'acts', 7, 9, 'canon', 'genesis', 45, 5, 'free', E'*Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* (Genesis 45:5). *But Elohim (God) was with him* (Acts 7:9) — the rejected brother becomes the saver of the brethren who sold him: *Elohim (God) did send me before you to preserve life.* The one cast out is the one through whom the house lives.'),
  ('canon', 'acts', 7, 27, 'canon', 'exodus', 2, 14, 'free', E'*And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian? And Moses feared, and said, Surely this thing is known.* (Exodus 2:14). *Who made thee a ruler and a judge over us?* (Acts 7:27) is the same refusal — and *this Moses whom they refused … the same did Elohim (God) send to be a ruler and a deliverer* (Acts 7:35). Twice rejected, then sent: the pattern Joseph began and the Just One completes.'),
  ('canon', 'acts', 7, 9, 'apocrypha', '1-maccabees', 2, 53, 'extras', E'*Joseph in the time of his distress kept the commandment and was made lord of Egypt.* (1 Maccabees 2:53). The library remembers Joseph as Stephen does — distressed, sold, yet faithful, and *made lord of Egypt.* The rejected deliverer kept the commandment in the pit and the prison, and was lifted to save; the pattern of the One the fathers refused.'),
  -- thread: acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos
  ('canon', 'acts', 7, 40, 'canon', 'exodus', 32, 1, 'free', E'*And when the people saw that Moses delayed to come down out of the mount, the people gathered themselves together unto Aaron, and said unto him, Up, make us gods, which shall go before us; for as for this Moses, the man that brought us up out of the land of Egypt, we wot not what is become of him.* (Exodus 32:1). *Saying unto Aaron, Make us gods to go before us* (Acts 7:40). While Moses received the lively oracles on the mount, the fathers turned to the calf — the rejection of the deliverer and his words shown in the same hour they were given.'),
  ('canon', 'acts', 7, 42, 'canon', 'amos', 5, 25, 'free', E'*Have ye offered unto me sacrifices and offerings in the wilderness forty years, O house of Yashar''el (Israel)?* (Amos 5:25). Stephen reads the wilderness idolatry out of Amos — *O ye house of Yashar''el (Israel), have ye offered to me slain beasts and sacrifices by the space of forty years in the wilderness?* (Acts 7:42). The forty years of sacrifice were shadowed by the worship of the host of heaven the people carried in their hearts.'),
  ('canon', 'acts', 7, 43, 'canon', 'amos', 5, 26, 'free', E'*But ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god, which ye made to yourselves.* (Amos 5:26). *Ye took up the tabernacle of Moloch, and the star of your god Remphan* (Acts 7:43) is Amos''s charge — the star-god carried alongside the tabernacle of witness, the host of heaven worshipped in the place of the One who made it.'),
  ('canon', 'acts', 7, 43, 'canon', 'amos', 5, 27, 'free', E'*Therefore will I cause you to go into captivity beyond Damascus, saith Yahuah (LORD), whose name is The Elohim (God) of hosts.* (Amos 5:27). Amos says *beyond Damascus*; Stephen says *I will carry you away beyond Babylon* (Acts 7:43) — the exile-judgment for the idolatry, the scattering that the star-worship earned. The host-of-heaven worship and the carrying-away are one sentence.'),
  -- thread: acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands
  ('canon', 'acts', 7, 49, 'canon', 'isaiah', 66, 1, 'free', E'*Thus saith Yahuah (LORD), The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me? and where is the place of my rest?* (Isaiah 66:1). Stephen quotes the prophet against the trust in the building — *Heaven is my throne, and earth is my footstool: what house will ye build me?* (Acts 7:49). The El Elyon (most High) is not housed in walls; the temple was never the thing the people made it.'),
  ('canon', 'acts', 7, 50, 'canon', 'isaiah', 66, 2, 'free', E'*For all those things hath mine hand made, and all those things have been, saith Yahuah (LORD): but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* (Isaiah 66:2). *Hath not my hand made all these things?* (Acts 7:50). The Maker of all looks not to the house of stone but to the contrite heart that trembles at his word — the temple he seeks is not made with hands.'),
  ('canon', 'acts', 7, 48, 'canon', '1-kings', 8, 27, 'free', E'*But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). Even Solomon, dedicating the house, confessed it could not contain Elohim (God) — *the heaven and heaven of heavens cannot contain thee.* *The El Elyon (most High) dwelleth not in temples made with hands* (Acts 7:48); the builder of the temple said so first.'),
  -- thread: acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge
  ('canon', 'acts', 7, 51, 'canon', 'exodus', 33, 5, 'free', E'*For Yahuah (LORD) had said unto Moses, Say unto the children of Yashar''el (Israel), Ye are a stiffnecked people: I will come up into the midst of thee in a moment, and consume thee: therefore now put off thy ornaments from thee, that I may know what to do unto thee.* (Exodus 33:5). *Ye stiffnecked … as your fathers did, so do ye* (Acts 7:51) is Moses'' own word for the same covenant people — *ye are a stiffnecked people.* Stephen levels no new accusation; he speaks the charge the Torah already named over the fathers.'),
  ('canon', 'acts', 7, 51, 'canon', 'deuteronomy', 10, 16, 'free', E'*Circumcise therefore the foreskin of your heart, and be no more stiffnecked.* (Deuteronomy 10:16). *Uncircumcised in heart and ears* (Acts 7:51) is Moses'' own diagnosis and Moses'' own remedy — *circumcise … the foreskin of your heart, and be no more stiffnecked.* The charge is about the heart that resists, not the flesh; it is the call to return that Moses first gave.'),
  ('canon', 'acts', 7, 51, 'canon', 'isaiah', 63, 10, 'free', E'*But they rebelled, and vexed his holy Spirit: therefore he was turned to be their enemy, and he fought against them.* (Isaiah 63:10). *Ye do always resist the Ruach HaKodesh (Holy Spirit)* (Acts 7:51) is Isaiah''s lament of the wilderness generation — *they rebelled, and vexed his holy Spirit.* The resisting of the Spirit is the recurring sin in every generation that turns, the one Stephen names in his own.'),
  ('canon', 'acts', 7, 52, 'jubilees', 'jubilees', 1, 12, 'extras', E'*And I will send witnesses to them, that I may witness against them, but they will not hear, and will slay the witnesses also, and they will persecute those who seek the law, and they will abrogate and change everything so as to work evil before My eyes.* (Jubilees 1:12). The Hebrew library foretold the very thing Stephen names — *which of the prophets have not your fathers persecuted? and they have slain them* (Acts 7:52). Yahuah (God) said the sent witnesses would be slain and the seekers of the law persecuted; the pattern is the conduct of the faithless in every age, not the mark of a people.'),
  -- thread: acts-7-the-son-of-adam-standing-at-the-right-hand
  ('canon', 'acts', 7, 56, 'canon', 'daniel', 7, 13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). *I see the heavens opened, and the Son of Adam standing on the right hand of Elohim (God)* (Acts 7:56). The figure Daniel saw — *one like the Son of Adam,* the kaph honoring the incarnation of the Formed cloud-rider — is the One Stephen now beholds glorified at the right hand, risen to receive his witness.'),
  ('canon', 'acts', 7, 56, 'canon', 'luke', 22, 69, 'free', E'*Hereafter shall the Son of Adam sit on the right hand of the power of Elohim (God).* (Luke 22:69). Before the same council Yahusha (Jesus) had said it — *the Son of Adam … on the right hand of the power of Elohim (God)* — and they condemned him for it. Stephen now sees the word made sight: *the Son of Adam standing on the right hand of Elohim (God)* (Acts 7:56), and they stop their ears at the same testimony.'),
  ('canon', 'acts', 7, 60, 'canon', 'luke', 23, 34, 'free', E'*Then said Yahusha (Jesus), Father, forgive them; for they know not what they do. And they parted his raiment, and cast lots.* (Luke 23:34). Stephen dies as his Master died — *Yahuah (Lord), lay not this sin to their charge* (Acts 7:60) echoes *Father, forgive them; for they know not what they do.* The witness follows the One he witnessed to, even into the prayer for those who stone him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a0607_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a0607_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-6-the-seven-chosen-and-the-spirit-of-the-seventy',
       E'The seven chosen — the Spirit shared as with the seventy',
       E'When a murmuring arises and the widows are neglected, the twelve do not abandon the word to serve tables; they say *look ye out among you seven men of honest report, full of the Ruach HaKodesh (Holy Spirit) and wisdom, whom we may appoint over this business* (Acts 6:3). It is Moses'' own pattern. When the burden of the people was too heavy, Yahuah (LORD) told Moses, *Gather unto me seventy men of the elders of Yashar''el (Israel) … that they may stand there with thee* (Numbers 11:16), *and I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone* (Numbers 11:17). The seventy bore the burden by the same Spirit that rested on Moses; the seven bear it by the same Spirit that fills the twelve. The ministry of the word is guarded, and the Spirit distributes the load.',
       sv.verse_id, ev.verse_id, 'free', 5200
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-6-tried-like-his-master-the-wisdom-none-could-resist',
       E'Tried like his Master — the wisdom none could resist, the false witnesses, the shining face',
       E'Stephen, *full of faith and power,* does great wonders, and *they were not able to resist the wisdom and the spirit by which he spake* (Acts 6:8-10). This is the Master''s own promise kept: *I will give you a mouth and wisdom, which all your adversaries shall not be able to gainsay nor resist* (Luke 21:15). Unable to answer him, they suborn false witnesses — *this man ceaseth not to speak … against this holy place, and the law … this Yahusha (Jesus) of Nazareth shall destroy this place* (Acts 6:13-14) — the very charge false witnesses laid on the Messiah himself: *This fellow said, I am able to destroy the temple of Elohim (God)* (Matthew 26:61). And while they accuse him of blaspheming Moses, his face shines as Moses'' did: *all that sat in the council … saw his face as it had been the face of an angel* (Acts 6:15), as *the skin of his face shone* when Moses came down from the mount (Exodus 34:29). The servant is tried as his Master was tried, and bears the mark of one who has been with Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 5210
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed',
       E'The Elohim (God) of glory appeared to Abraham — the promise to the seed before the land',
       E'Stephen begins the whole history where the covenant began: *The Elohim (God) of glory appeared unto our father Abraham … Get thee out of thy country* (Acts 7:2-3) — the call of *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). And he was given *none inheritance in it … yet he promised that he would give it to him … and to his seed after him, when as yet he had no child* (Acts 7:5) — the promise running ahead of the people who would carry it. The bondage was foretold to the seed before there was a seed: *thy seed shall be a stranger in a land that is not theirs … they shall afflict them four hundred years* (Genesis 15:13), *and also that nation, whom they shall serve, will I judge: and afterward shall they come out* (Genesis 15:14). The Hebrew library rehearses the fathers as Stephen does — Mattathias, dying, begins, *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). The God of glory who called Abraham is the One the whole recital hangs on.',
       sv.verse_id, ev.verse_id, 'extras', 5220
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent',
       E'The rejected deliverer — Joseph sold, Moses refused, then sent to save',
       E'Stephen builds the pattern beat by beat. *The patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* (Acts 7:9) — *they drew and lifted up Joseph out of the pit, and sold Joseph … for twenty pieces of silver* (Genesis 37:28), and the brother they rejected became their saver: *be not grieved … that ye sold me hither: for Elohim (God) did send me before you to preserve life* (Genesis 45:5). The library tells it the same way: *Joseph in the time of his distress kept the commandment and was made lord of Egypt* (1 Maccabees 2:53). Then Moses, the same: *Who made thee a prince and a judge over us?* (Exodus 2:14) — *this Moses whom they refused … the same did Elohim (God) send to be a ruler and a deliverer* (Acts 7:35). Twice the deliverer is cast out by his own and twice Elohim (God) sends him back to save. Stephen is laying the rail to the last and greatest instance: *the Just One; of whom ye have been now the betrayers and murderers* (Acts 7:52) — the rejected deliverer the fathers'' whole story foreshadowed.',
       sv.verse_id, ev.verse_id, 'extras', 5230
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos',
       E'The calf and the host of heaven — the charge of Amos',
       E'While Moses was on the mount receiving *the lively oracles to give unto us* (Acts 7:38), the fathers turned: *Make us gods to go before us: for as for this Moses … we wot not what is become of him* (Exodus 32:1), and *they made a calf … and rejoiced in the works of their own hands* (Acts 7:41). The calf was only the beginning; the deeper idolatry was the worship of the host of heaven, and Stephen reads it out of Amos. *O ye house of Yashar''el (Israel), have ye offered to me slain beasts and sacrifices by the space of forty years in the wilderness?* (Acts 7:42) is Amos''s *Have ye offered unto me sacrifices and offerings in the wilderness forty years, O house of Yashar''el (Israel)?* (Amos 5:25), and the star-god carried alongside the tabernacle: *ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god* (Amos 5:26). The sentence on it is exile — Amos says *captivity beyond Damascus* (Amos 5:27), Stephen says *I will carry you away beyond Babylon* (Acts 7:43). The host-of-heaven worship and the scattering are one judgment: the rejection of the One who made the host, and the carrying-away that follows.',
       sv.verse_id, ev.verse_id, 'free', 5240
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=39
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands',
       E'The Most High dwelleth not in temples made with hands',
       E'Stephen turns to the trust in the building itself: *Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet, Heaven is my throne, and earth is my footstool: what house will ye build me? … or what is the place of my rest? Hath not my hand made all these things?* (Acts 7:48-50). It is Isaiah, word for word: *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* (Isaiah 66:1), and *all those things hath mine hand made … but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2). Even Solomon, the day he dedicated the house, had confessed it: *behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). The Maker of heaven and earth is not housed in walls, and he looks not to the stone but to the trembling heart. The temple was never the thing the people had made it — a possession to guard against the Word that judges it.',
       sv.verse_id, ev.verse_id, 'free', 5250
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=48
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge',
       E'Stiffnecked and uncircumcised in heart — the prophets'' own charge',
       E'Stephen ends not with an attack on a people but with the prophets'' own charge against a faithless generation: *Ye stiffnecked and uncircumcised in heart and ears, ye do always resist the Ruach HaKodesh (Holy Spirit): as your fathers did, so do ye* (Acts 7:51). Every word is Moses'' and the prophets'' own, spoken of the same covenant people. Moses called them *a stiffnecked people* (Exodus 33:5) and gave them the remedy — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). Isaiah named the wilderness rebellion: *they rebelled, and vexed his holy Spirit* (Isaiah 63:10). And the Hebrew library foretold the very pattern Stephen names — *Which of the prophets have not your fathers persecuted? and they have slain them* (Acts 7:52) — for Yahuah (God) had said, *I will send witnesses to them … but they will not hear, and will slay the witnesses also, and they will persecute those who seek the law* (Jubilees 1:12). The charge is against the conduct of the heart that resists the Spirit and persecutes the sent ones — the recurring sin in every generation that turns from the covenant, *as your fathers did, so do ye.* It is not a verdict on the seed of Yashar''el (Israel) as a people; it is the prophet''s grief over his own, the lament of one calling his kin home.',
       sv.verse_id, ev.verse_id, 'extras', 5260
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=51
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-son-of-adam-standing-at-the-right-hand',
       E'The Son of Adam standing at the right hand',
       E'As they gnash on him, Stephen, *full of the Ruach HaKodesh (Holy Spirit),* looks up: *Behold, I see the heavens opened, and the Son of Adam standing on the right hand of Elohim (God)* (Acts 7:56). This is the figure Daniel saw — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13) — the kaph honoring the incarnation of the Formed cloud-rider, now beheld glorified at the right hand. It is the very testimony for which Yahusha (Jesus) had been condemned before this same council: *Hereafter shall the Son of Adam sit on the right hand of the power of Elohim (God)* (Luke 22:69). What the Master said, the witness now sees — and they stop their ears at the same word, and stone him. And Stephen dies as his Master died, praying for the ones who kill him: *Yahuah (Lord), lay not this sin to their charge* (Acts 7:60) is *Father, forgive them; for they know not what they do* (Luke 23:34). The Son of Adam stands to receive his witness home.',
       sv.verse_id, ev.verse_id, 'free', 5270
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=55
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=60
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-6-the-seven-chosen-and-the-spirit-of-the-seventy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 11:16 — *Gather unto me seventy men of the elders of Yashar''el (Israel) … that they may stand there with thee* Moses gathers Spirit-bearers to share the burden, as the twelve gather the seven (Acts 6:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-the-seven-chosen-and-the-spirit-of-the-seventy'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 11:17 — *I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden … with thee* the Spirit distributes the load so the word is not left (Acts 6:2-4).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-the-seven-chosen-and-the-spirit-of-the-seventy'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-6-tried-like-his-master-the-wisdom-none-could-resist
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 21:15 — *I will give you a mouth and wisdom, which all your adversaries shall not be able to gainsay nor resist* the Master''s promise kept in Stephen (Acts 6:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-tried-like-his-master-the-wisdom-none-could-resist'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 26:61 — *I am able to destroy the temple of Elohim (God)* the false-witness temple-charge laid on the Master, now laid on Stephen (Acts 6:13-14).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-tried-like-his-master-the-wisdom-none-could-resist'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=61
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:29 — *the skin of his face shone while he talked with him* they accuse him of blaspheming Moses while his face shines like Moses'' (Acts 6:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-tried-like-his-master-the-wisdom-none-could-resist'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Get thee out of thy country … unto a land that I will shew thee* the call that began the seed-line, where Stephen begins (Acts 7:2-3).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:13 — *thy seed shall be a stranger in a land that is not theirs … four hundred years* the bondage foretold to the seed before there was a child (Acts 7:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:14 — *that nation … will I judge: and afterward shall they come out with great substance* the judgment on Egypt and the coming-out sworn to Abraham (Acts 7:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 2:52 — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* the library''s own deathbed recital of the fathers begins, like Stephen, with Abraham (Acts 7:2).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:28 — *sold Joseph to the Ishmeelites for twenty pieces of silver* the deliverer rejected by his brethren, sold for silver (Acts 7:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 45:5 — *Elohim (God) did send me before you to preserve life* the rejected brother becomes the saver of those who sold him (Acts 7:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:14 — *Who made thee a prince and a judge over us?* Moses refused, as the fathers refused every deliverer, then was sent (Acts 7:27,35).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 2:53 — *Joseph in the time of his distress kept the commandment and was made lord of Egypt* the library remembers the rejected deliverer lifted to save (Acts 7:9-10).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=53
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:1 — *Make us gods, which shall go before us; for as for this Moses … we wot not what is become of him* the calf made while Moses received the oracles (Acts 7:40-41).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 5:25 — *Have ye offered unto me sacrifices and offerings in the wilderness forty years, O house of Yashar''el (Israel)?* the prophet Stephen reads over the forty years (Acts 7:42).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 5:26 — *ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god* the host-of-heaven worship Stephen names as Moloch and Remphan (Acts 7:43).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 5:27 — *I cause you to go into captivity beyond Damascus* the exile-sentence on the idolatry; Stephen intensifies it to *beyond Babylon* (Acts 7:43).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:1 — *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* the prophet Stephen quotes against trust in the building (Acts 7:49).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:2 — *all those things hath mine hand made … but to this man will I look … that trembleth at my word* the Maker looks to the contrite heart, not the house of stone (Acts 7:50).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 8:27 — *the heaven and heaven of heavens cannot contain thee; how much less this house* Solomon confessed it the day he dedicated the temple (Acts 7:48).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 33:5 — *Ye are a stiffnecked people* Moses'' own word for the same covenant people; Stephen levels no new charge (Acts 7:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 10:16 — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* Moses'' diagnosis and remedy; the charge is the heart that resists (Acts 7:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 63:10 — *they rebelled, and vexed his holy Spirit* the wilderness resisting Stephen names as still operating (Acts 7:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 1:12 — *I will send witnesses to them … but they will not hear, and will slay the witnesses also, and they will persecute those who seek the law* the library foretold the persecuting of the prophets Stephen names (Acts 7:52).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=52
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-son-of-adam-standing-at-the-right-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* the kaph-honored figure Stephen now beholds glorified at the right hand (Acts 7:56).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-son-of-adam-standing-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 22:69 — *Hereafter shall the Son of Adam sit on the right hand of the power of Elohim (God)* the testimony for which the Master was condemned, now seen by his witness (Acts 7:56).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-son-of-adam-standing-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=69
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 23:34 — *Father, forgive them; for they know not what they do* Stephen dies as his Master died, praying for the ones who stone him (Acts 7:60).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-son-of-adam-standing-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_08_09.sql (S217 Acts 8-9) -----
-- =====================================================================
-- S217 minion — ACTS 8-9 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 8-9.  Tag: a0809 (temp view _s217_a0809_lookup).  Sort band: 5300-5360.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #7/#11, Christology, son-of-Adam):
--  * Philip in Samaria (8:5-25): the Samaritans are the remnant of the half-house of the
--    north — the lost sheep of the house of Yashar'el (Israel), the scattered seed being
--    gathered as the dispersion preaches the word. NEVER a graft of non-seed by confession;
--    the harvest the Master named at the well (John 4) is the same field now reaped.
--  * The eunuch (8:26-39): the suffering-servant Lamb of Isaiah 53:7-8 (load-bearing, quoted
--    verbatim) read by one who came to Yerushalayim to worship — the estranged brought into
--    the house, given a name better than sons (Isaiah 56:3-5,8), the OUTCASTS OF YASHAR'EL
--    gathered. Read as the scattered/estranged seed gathered home, NOT false-inclusion of
--    non-seed by confession.
--  * Saul's call (9:3-6): the Formed appearing — the light from heaven and the voice
--    *I am Yahusha (Jesus) whom thou persecutest.* The God of the OT interactions, the Formed
--    drawn from the Formless, who came in flesh, now glorified, appears and calls. The chosen
--    vessel formed from the womb (Jeremiah 1:5) and called by grace (Galatians 1:15-16) — and
--    grace as the means of his being SENT, not a freedom-from-Torah formula (Red Line #10).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 8:
--   v.1-4   scattered abroad preach Tanakh: Genesis 50:20 (the meant-for-evil/turned-to-good of dispersion); Ezekiel 11:16 weighed (sanctuary in scattering — carried thematically, not added)  Extras: none warranted  NT: none warranted (narrative)
--   v.5-13  Philip in Samaria        Tanakh: none added (the northern-house gathering carried in John 4 NT target)  Extras: none warranted  NT: John 4:22, John 4:35, John 4:39
--   v.9-11  Simon the sorcerer       Tanakh: none added  Extras: none warranted  NT: none warranted (narrative; rebuke threaded at v.20-23)
--   v.14-17 Peter/John, the Spirit   Tanakh: none warranted  Extras: none warranted  NT: none added (the Shavuot outpouring carried in Acts 2 threads, not re-added)
--   v.18-24 buy the gift / gall      Tanakh: Deuteronomy 29:18 (root that beareth gall and wormwood)  Extras: none warranted  NT: none added
--   v.26-33 eunuch reads Isaiah 53   Tanakh: Isaiah 53:7, Isaiah 53:8  Extras: none warranted  NT: none added (Lamb-of-Elohim carried in John 1 threads)
--   v.27,38-39 the eunuch himself    Tanakh: Isaiah 56:3, Isaiah 56:5, Isaiah 56:8  Extras: none warranted  NT: none warranted
--   v.40    Philip at Azotus/Caesarea Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--  ACTS 9:
--   v.3-6   the light and the voice  Tanakh: none added (the Formed appearing carried by NT Acts-retellings)  Extras: none warranted  NT: Acts 22:8, Acts 26:14
--   v.10-16 chosen vessel           Tanakh: Jeremiah 1:5  Extras: none warranted  NT: Galatians 1:15, Galatians 1:16
--   v.17-19 scales fall / baptized   Tanakh: none warranted  Extras: none warranted  NT: Acts 26:18 weighed (open-eyes/turn-from-darkness — carried thematically in chosen-vessel thread, not added)
--   v.20-31 preaches/confounds       Tanakh: none warranted  Extras: none warranted  NT: none added (Galatians 1:23 weighed; narrative re-tell, not load-bearing)
--   v.32-43 Aeneas / Tabitha raised  Tanakh: 1 Kings 17:21 weighed (Elijah raises the widow's son); 2 Kings 4:34-35 weighed (Elisha) — narrative-parallel, framework weight thin, not added  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   5300 acts-8-scattered-abroad-they-went-everywhere-preaching-the-word     (Tanakh)
--   5310 acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped (NT)
--   5320 acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall (Tanakh)
--   5330 acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah     (Tanakh)
--   5340 acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house (Tanakh)
--   5350 acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest   (NT, Acts<->Acts)
--   5360 acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace     (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a0809_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-8-scattered-abroad-they-went-everywhere-preaching-the-word
  ('canon', 'acts', 8, 4, 'canon', 'genesis', 50, 20, 'free', E'*But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* (Genesis 50:20). The persecution scatters the assembly — *they were all scattered abroad throughout the regions of Judæa and Samaria* (Acts 8:1) — yet *they that were scattered abroad went every where preaching the word* (Acts 8:4). What was meant to break the assembly Elohim (God) means unto good, as he did with Joseph: the scattering itself becomes the sowing, the dispersed seed carrying the word into the regions where the lost sheep are.'),
  -- thread: acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped
  ('canon', 'acts', 8, 5, 'canon', 'john', 4, 39, 'free', E'*And many of the Samaritans of that city believed on him for the saying of the woman, which testified, He told me all that ever I did.* (John 4:39). *Then Philip went down to the city of Samaria, and preached Messiah (Christ) unto them* (Acts 8:5), and *the people with one accord gave heed* (Acts 8:6). The Master had already begun the harvest in Samaria — the half-house of the north, the lost sheep of the house of Yashar''el (Israel) — and Philip now reaps the field the Master sowed. These are not strangers added; they are the scattered of Yashar''el receiving back the word.'),
  ('canon', 'acts', 8, 6, 'canon', 'john', 4, 35, 'free', E'*Say not ye, There are yet four months, and then cometh harvest? behold, I say unto you, Lift up your eyes, and look on the fields; for they are white already to harvest.* (John 4:35). At the well in Samaria the Master told the disciples the fields were *white already to harvest;* now in the same Samaria *the people with one accord gave heed unto those things which Philip spake* (Acts 8:6). The field the Master named white is the field now reaped — the gathering of the northern house begun.'),
  ('canon', 'acts', 8, 14, 'canon', 'john', 4, 22, 'free', E'*Ye worship ye know not what: we know what we worship: for salvation is of the Yahudim (Jews).* (John 4:22). *Now when the apostles which were at Jerusalem heard that Samaria had received the word of Elohim (God), they sent unto them Peter and John* (Acts 8:14). The Master told the Samaritan woman *salvation is of the Yahudim (Jews)* — the deliverance comes through the house of Yahudah; and now the two houses are knit, the apostles from Yerushalayim laying hands on the believing remnant of the north. Yahudah and Yosef joined, the two sticks made one.'),
  -- thread: acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall
  ('canon', 'acts', 8, 23, 'canon', 'deuteronomy', 29, 18, 'free', E'*Lest there should be among you man, or woman, or family, or tribe, whose heart turneth away this day from Yahuah Eloheinu (the LORD our God), to go and serve the gods of these nations; lest there should be among you a root that beareth gall and wormwood;* (Deuteronomy 29:18). Peter sees in Simon the very thing Moses warned of within the covenant assembly: *I perceive that thou art in the gall of bitterness, and in the bond of iniquity* (Acts 8:23). The sorcerer who thought *the gift of Elohim (God) may be purchased with money* (Acts 8:20) is the root of gall springing up among the gathered — a heart not right, called to repent, not a people condemned.'),
  -- thread: acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah
  ('canon', 'acts', 8, 32, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7). The very place the eunuch read was this: *He was led as a sheep to the slaughter; and like a lamb dumb before his shearer, so opened he not his mouth* (Acts 8:32). The suffering servant of Isaiah is the Lamb led silent to the slaughter — and *Philip … began at the same scripture, and preached unto him Yahusha (Jesus)* (Acts 8:35), naming the Lamb the prophet saw.'),
  ('canon', 'acts', 8, 33, 'canon', 'isaiah', 53, 8, 'free', E'*He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* (Isaiah 53:8). *In his humiliation his judgment was taken away: and who shall declare his generation? for his life is taken from the earth* (Acts 8:33). The eunuch asks *of whom speaketh the prophet this?* (Acts 8:34), and the answer is the One *cut off out of the land of the living* for the transgression of his people — the servant who poured out his soul, of whom Philip preaches Yahusha (Jesus).'),
  -- thread: acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house
  ('canon', 'acts', 8, 27, 'canon', 'isaiah', 56, 3, 'free', E'*Neither let the son of the stranger, that hath joined himself to Yahuah (LORD), speak, saying, Yahuah (LORD) hath utterly separated me from his people: neither let the eunuch say, Behold, I am a dry tree.* (Isaiah 56:3). *A man of Ethiopia, an eunuch … had come to Jerusalem for to worship* (Acts 8:27) — one who feared he was cut off, a dry tree, separated from the people. Isaiah forbade that fear: the eunuch joined to Yahuah (LORD) is not separated. The estranged who comes to worship is being brought back, not kept out.'),
  ('canon', 'acts', 8, 38, 'canon', 'isaiah', 56, 5, 'free', E'*Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* (Isaiah 56:5). The eunuch comes to the water — *they went down both into the water … and he baptized him* (Acts 8:38) — and *went on his way rejoicing* (Acts 8:39). The one who feared he was a dry tree, cut off, receives the very thing Isaiah promised the eunuchs who take hold of the covenant: a place and a name in the house, an everlasting name that shall not be cut off.'),
  ('canon', 'acts', 8, 39, 'canon', 'isaiah', 56, 8, 'free', E'*Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him.* (Isaiah 56:8). The eunuch *went on his way rejoicing* (Acts 8:39) — gathered. This is the work Isaiah named: Adonai Yahuah (The Lord GOD) who *gathereth the outcasts of Yashar''el (Israel),* still gathering others beside those already gathered. The estranged of the scattered seed brought home, the joy of the outcast made nigh.'),
  -- thread: acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest
  ('canon', 'acts', 9, 5, 'canon', 'acts', 26, 14, 'free', E'*And when we were all fallen to the earth, I heard a voice speaking unto me, and saying in the Hebrew tongue, Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks.* (Acts 26:14). *And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:4). Saul retells it before Agrippa in the Hebrew tongue — the Formed himself, the One drawn from the Formless who appeared and spoke through all the history of the fathers, now glorified, speaks Saul''s name from the light.'),
  ('canon', 'acts', 9, 5, 'canon', 'acts', 22, 8, 'free', E'*And I answered, Who art thou, Yahuah (Lord)? And he said unto me, I am Yahusha (Jesus) of Nazareth, whom thou persecutest.* (Acts 22:8). *And he said, Who art thou, Yahuah (Lord)? And Yahuah (Lord) said, I am Yahusha (Jesus) whom thou persecutest* (Acts 9:5). The One in the light answers to the name Saul cried — *Who art thou, Yahuah (Lord)?* — with *I am Yahusha (Jesus).* The Formed who is Yahuah, who came in the flesh as Yahusha of Nazareth, is the One persecuted in his disciples and the One who now calls.'),
  -- thread: acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace
  ('canon', 'acts', 9, 15, 'canon', 'jeremiah', 1, 5, 'free', E'*Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations.* (Jeremiah 1:5). *He is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel)* (Acts 9:15). As Yahuah (LORD) formed and ordained Jeremiah before the womb and sent him to the nations, so the chosen vessel is set apart before he knew it — the calling precedes the man, the ordaining runs ahead of the response.'),
  ('canon', 'acts', 9, 15, 'canon', 'galatians', 1, 15, 'free', E'*But when it pleased Elohim (God), who separated me from my mother''s womb, and called me by his grace,* (Galatians 1:15). Saul, made the chosen vessel *to bear my name* (Acts 9:15), tells it himself: he was *separated from my mother''s womb, and called by his grace.* The grace is not a release from the commandments but the means by which the persecutor is set apart and sent — the calling reaching back before the womb, revealing what was already true.'),
  ('canon', 'acts', 9, 15, 'canon', 'galatians', 1, 16, 'free', E'*To reveal his Son in me, that I might preach him among the heathen; immediately I conferred not with flesh and blood:* (Galatians 1:16). The chosen vessel is set apart *to bear my name before the Gentiles* (Acts 9:15) — and Saul names the purpose: Elohim (God) was pleased *to reveal his Son in me, that I might preach him.* The vessel is chosen to carry the name to the scattered among the nations; grace is the sending, the revealing of the Son its whole content.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a0809_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a0809_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-scattered-abroad-they-went-everywhere-preaching-the-word',
       E'Scattered abroad — they went every where preaching the word',
       E'The death of Stephen breaks open a great persecution, and *they were all scattered abroad throughout the regions of Judæa and Samaria, except the apostles* (Acts 8:1). The enemy means to break the assembly; instead the scattering becomes the sowing: *therefore they that were scattered abroad went every where preaching the word* (Acts 8:4). It is the pattern Joseph named to the brothers who sold him — *ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). What is meant to scatter the seed sows it, and the word goes into the very regions — Samaria, the half-house of the north — where the lost sheep are. The dispersion is not the defeat of the gathering; it is its means.',
       sv.verse_id, ev.verse_id, 'free', 5300
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped',
       E'Philip in Samaria — the lost sheep of the northern house reaped',
       E'*Then Philip went down to the city of Samaria, and preached Messiah (Christ) unto them* (Acts 8:5), and *the people with one accord gave heed unto those things which Philip spake* (Acts 8:6). Samaria is the remnant of the half-house of the north — the lost sheep of the house of Yashar''el (Israel), the scattered seed of the ten tribes who were divorced and dispersed. The Master had already begun this harvest at the well: *behold, I say unto you, Lift up your eyes, and look on the fields; for they are white already to harvest* (John 4:35), and *many of the Samaritans of that city believed on him for the saying of the woman* (John 4:39). What the Master sowed in Samaria, Philip now reaps. And the two houses are knit: the Master had told the woman *salvation is of the Yahudim (Jews)* (John 4:22), and now *when the apostles which were at Jerusalem heard that Samaria had received the word of Elohim (God), they sent unto them Peter and John* (Acts 8:14). Yahudah and Yosef joined — the deliverance through the house of Yahudah received by the remnant of the north. These are not strangers added; they are the scattered of Yashar''el receiving back the word that was always theirs.',
       sv.verse_id, ev.verse_id, 'free', 5310
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall',
       E'Thy money perish with thee — the gift of Elohim (God) and the root of gall',
       E'Simon the sorcerer believes and is baptized, yet when he sees the Spirit given through the laying on of hands he offers money: *Give me also this power, that on whomsoever I lay hands, he may receive the Ruach HaKodesh (Holy Spirit)* (Acts 8:19). Peter''s answer is sharp: *Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money* (Acts 8:20), *for I perceive that thou art in the gall of bitterness, and in the bond of iniquity* (Acts 8:23). This is the very thing Moses warned could spring up within the covenant assembly itself — *lest there should be among you a root that beareth gall and wormwood* (Deuteronomy 29:18), a heart that turns away to serve other gods. Simon is that root of gall among the gathered, a heart not right in the sight of Elohim (God). And yet the word to him is not a verdict but a call: *Repent therefore of this thy wickedness, and pray Elohim (God), if perhaps the thought of thine heart may be forgiven thee* (Acts 8:22).',
       sv.verse_id, ev.verse_id, 'free', 5320
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah',
       E'Led as a lamb to the slaughter — the eunuch reading Isaiah',
       E'The angel of Yahuah (Lord) sends Philip to the desert road, and there he finds the Ethiopian eunuch *sitting in his chariot* reading the prophet (Acts 8:28). The place of the scripture he read was the suffering servant: *He was led as a sheep to the slaughter; and like a lamb dumb before his shearer, so opened he not his mouth* (Acts 8:32), and *in his humiliation his judgment was taken away: and who shall declare his generation? for his life is taken from the earth* (Acts 8:33). It is Isaiah, word for word: *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7), *he was taken from prison and from judgment … for he was cut off out of the land of the living: for the transgression of my people was he stricken* (Isaiah 53:8). The eunuch asks *of whom speaketh the prophet this? of himself, or of some other man?* (Acts 8:34), and *Philip opened his mouth, and began at the same scripture, and preached unto him Yahusha (Jesus)* (Acts 8:35). The silent Lamb the prophet saw, cut off for the transgression of his people, is Yahusha (Jesus) — the servant who opened not his mouth.',
       sv.verse_id, ev.verse_id, 'free', 5330
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house',
       E'A name better than sons — the estranged gathered into the house',
       E'The eunuch *had come to Jerusalem for to worship* (Acts 8:27) — one who, under the old reckoning, might fear he was cut off, a dry tree, separated from the people. But Isaiah had forbidden that fear long before: *Neither let the son of the stranger, that hath joined himself to Yahuah (LORD), speak, saying, Yahuah (LORD) hath utterly separated me from his people: neither let the eunuch say, Behold, I am a dry tree* (Isaiah 56:3). To the eunuch who takes hold of the covenant the promise is *a place and a name better than of sons and of daughters … an everlasting name, that shall not be cut off* (Isaiah 56:5). And so when *they went down both into the water … and he baptized him* (Acts 8:38), and the eunuch *went on his way rejoicing* (Acts 8:39), he receives the very thing Isaiah promised — for it is Adonai Yahuah (The Lord GOD) *which gathereth the outcasts of Yashar''el (Israel)* who saith *Yet will I gather others to him, beside those that are gathered unto him* (Isaiah 56:8). The estranged who came to worship is gathered, not kept out: the scattered and the cut-off brought home and given a name that shall not be cut off.',
       sv.verse_id, ev.verse_id, 'free', 5340
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest',
       E'The light and the voice — I am Yahusha (Jesus) whom thou persecutest',
       E'Saul, breathing out threatenings, journeys toward Damascus, and *suddenly there shined round about him a light from heaven: and he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:3-4). He cries *Who art thou, Yahuah (Lord)? And Yahuah (Lord) said, I am Yahusha (Jesus) whom thou persecutest* (Acts 9:5). This is the Formed himself — the One drawn from the Formless who appeared and spoke through all the history of the fathers, now risen and glorified — appearing in light and naming himself. Saul retells it twice more: before the people, *I am Yahusha (Jesus) of Nazareth, whom thou persecutest* (Acts 22:8); and before Agrippa, the voice *in the Hebrew tongue, Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks* (Acts 26:14). The One in the light answers to the name Saul cried — *Who art thou, Yahuah (Lord)?* — with *I am Yahusha (Jesus).* He who is Yahuah and came in the flesh as Yahusha of Nazareth is the One persecuted in his disciples and the One who now calls.',
       sv.verse_id, ev.verse_id, 'free', 5350
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace',
       E'A chosen vessel — formed from the womb and called by grace',
       E'When Ananias fears the persecutor, Yahuah (Lord) answers, *Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel)* (Acts 9:15). The choosing reaches back before the man knew it — as Yahuah (LORD) said to Jeremiah, *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations* (Jeremiah 1:5). Saul tells it the same way: it pleased Elohim (God) *who separated me from my mother''s womb, and called me by his grace* (Galatians 1:15), *to reveal his Son in me, that I might preach him among the heathen* (Galatians 1:16). The grace is not a release from the commandments but the means by which the persecutor is set apart and sent — the calling running ahead of the womb, the chosen vessel made to carry the name to the scattered among the nations and to the children of Yashar''el (Israel). The choosing precedes the man; the grace is the sending.',
       sv.verse_id, ev.verse_id, 'free', 5360
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=9 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-8-scattered-abroad-they-went-everywhere-preaching-the-word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:20 — *ye thought evil against me; but Elohim (God) meant it unto good … to save much people alive* the scattering meant to break the assembly becomes the sowing of the word (Acts 8:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-scattered-abroad-they-went-everywhere-preaching-the-word'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 4:39 — *many of the Samaritans of that city believed on him for the saying of the woman* the Master''s harvest in Samaria, now reaped by Philip (Acts 8:5-6).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 4:35 — *Lift up your eyes, and look on the fields; for they are white already to harvest* the field the Master named white is the field Philip now reaps (Acts 8:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 4:22 — *salvation is of the Yahudim (Jews)* the deliverance through the house of Yahudah received by the remnant of the north; the two sticks joined (Acts 8:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 29:18 — *lest there should be among you a root that beareth gall and wormwood* Moses'' warning of the heart that turns within the assembly; Peter sees it in Simon (Acts 8:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:7 — *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb* the exact place the eunuch read, the silent suffering servant (Acts 8:32).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:8 — *he was cut off out of the land of the living: for the transgression of my people was he stricken* the One of whom the prophet speaks, whom Philip names Yahusha (Jesus) (Acts 8:33-35).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 56:3 — *neither let the eunuch say, Behold, I am a dry tree* the fear Isaiah forbids; the eunuch who came to worship is not separated (Acts 8:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 56:5 — *a place and a name better than of sons and of daughters … an everlasting name, that shall not be cut off* the promise the baptized eunuch receives (Acts 8:38).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 56:8 — *Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel)* the eunuch goes rejoicing, an outcast gathered home (Acts 8:39).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 26:14 — *Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks* the voice in the Hebrew tongue, the Formed speaking from the light (Acts 9:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 22:8 — *I am Yahusha (Jesus) of Nazareth, whom thou persecutest* the One in the light names himself; he who is Yahuah came in the flesh as Yahusha (Acts 9:5).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 1:5 — *Before I formed thee in the belly I knew thee … I ordained thee a prophet unto the nations* the choosing reaching back before the womb, as with the chosen vessel (Acts 9:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 1:15 — *who separated me from my mother''s womb, and called me by his grace* Saul''s own telling; grace is the means of his being set apart and sent (Acts 9:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 1:16 — *To reveal his Son in me, that I might preach him among the heathen* the vessel chosen to carry the name to the scattered among the nations (Acts 9:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_10_12.sql (S217 Acts 10-12) -----
-- =====================================================================
-- S217 minion — ACTS 10-12 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 10-12.  Tag: a1012 (temp view _s217_a1012_lookup).  Sort band: 5400-5470.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- HIGH-VOICE-RISK WATCHPOINT (Red Lines #7 / #11 — the heart of this range):
-- The "Gentiles" of Acts 10-11 (Cornelius, his household, the Spirit falling, "to the Gentiles
-- also granted repentance unto life") are NOT the false-inclusion of the nations into Yashar'el
-- (Israel) by faith-confession. They are the scattered seed / the lost sheep of the dispersion
-- being gathered — the Lo-Ammi of Hosea 1 made nigh, the "afar off" made near. Cornelius is a
-- God-fearer already devout, alms-giving, praying — sought BECAUSE he was already of the sheep,
-- not made a son by responding. Election precedes hearing; the hearing reveals what was true
-- before the foundation of the world; no name is added after the foundation. "Elohim is no
-- respecter of persons" (10:34) = he does not pick by the visible Yahudah (Judah)/dispersion
-- divide, because the seed is scattered through all nations and not known by sight — NOT that
-- the nations-as-such are grafted in by belief. The sheet vision's immediate point is "call not
-- thou common ... any man" (10:28) — the dispersed seed among the nations are not unclean to
-- approach; it is NOT the abolition of the dietary Torah (the Spirit does not lead away from
-- Torah, Red Line #6). Framed accordingly in every Acts-10/11 thread below.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 10:
--   v.1-8   Cornelius the devout God-fearer   Tanakh: Psalms 34:15  Extras: (Tobit 13 weighed; carries the gathering, placed at Acts 11)  NT: John 10:27
--   v.9-16  the sheet / call not common       Tanakh: Hosea 2:23  Extras: none warranted (sheet is the seed-among-nations not unclean; no clean extras witness)  NT: (1 Peter 2:10 weighed; placed at Acts 11 Lo-Ammi thread)
--   v.17-33 Peter goes / kinsmen gathered      Tanakh: none added (narrative; framework carried in sheet + no-respecter threads)  Extras: none warranted  NT: none warranted
--   v.34-35 no respecter of persons            Tanakh: Deuteronomy 10:17, 2 Chronicles 19:7  Extras: Ecclesiasticus 35:12  NT: none added (Romans 2:11 weighed; OT witnesses carry it)
--   v.36    preaching peace, Lord of all       Tanakh: Isaiah 57:19  Extras: none warranted  NT: Ephesians 2:17
--   v.37-42 the witness / Judge of quick&dead  Tanakh: none added (carried in Acts 2/3/10 enthronement; not re-added)  Extras: none warranted  NT: none added
--   v.43-44 prophets witness / Spirit fell     Tanakh: (carried in peace-afar-off thread)  Extras: none warranted  NT: (Spirit-fell tied to gathering at Acts 11)
--   v.45-48 Spirit poured on the Gentiles      Tanakh: (Hosea, carried at Acts 11:18)  Extras: none warranted  NT: (carried at Acts 11:18 gathering thread)
--  ACTS 11:
--   v.1-14  Peter rehearses the vision         Tanakh: none added (re-tells Acts 10; framework carried there)  Extras: none warranted  NT: none added
--   v.15-18 to the Gentiles also granted rep.  Tanakh: Hosea 1:10, Hosea 2:23  Extras: Tobit 13:5  NT: 1 Peter 2:10
--   v.19-21 scattered preach / Antioch         Tanakh: Hosea 2:23 (the sow clause)  Extras: (Baruch 2:34 weighed; gathering-to-land, placed nowhere — sow clause cleaner)  NT: none warranted
--   v.22-26 Barnabas / grace / disciples named Tanakh: none warranted  Extras: none warranted  NT: none added (grace here is the favor seen on the work, narrative; no sola-fide target)
--   v.27-30 Agabus / the dearth / relief        Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--  ACTS 12:
--   v.1-2   James killed with the sword        Tanakh: none added (martyr-cup carried in gospels, not re-threaded here)  Extras: none warranted  NT: none warranted
--   v.3-6   Peter imprisoned / unleavened bread Tanakh: none added  Extras: none warranted  NT: none warranted (narrative)
--   v.7-11  the angel delivers Peter            Tanakh: Psalms 34:7, Daniel 6:22  Extras: none warranted  NT: none added
--   v.12-19 Rhoda / Peter at the door           Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.20-23 Herod takes the glory / smitten     Tanakh: Daniel 4:30, Daniel 4:32, Daniel 4:37  Extras: none warranted  NT: none added
--   v.24-25 the word grew / return from Jerus.  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5400 acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear            (Tanakh + NT)
--   5410 acts-10-elohim-is-no-respecter-of-persons                             (Tanakh + Extras)
--   5420 acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach (Tanakh)
--   5430 acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh       (Tanakh + NT)
--   5440 acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh (Tanakh + Extras + NT)
--   5450 acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch      (Tanakh)
--   5460 acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him             (Tanakh)
--   5470 acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased         (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s217_a1012_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear
  ('canon', 'acts', 10, 4, 'canon', 'psalms', 34, 15, 'free', E'*The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry.* (Psalm 34:15). Cornelius is *a devout man, and one that feared Elohim (God) with all his house, which gave much alms to the people, and prayed to Elohim (God) alway* (Acts 10:2) — and the angel tells him *thy prayers and thine alms are come up for a memorial before Elohim (God)* (Acts 10:4). The ears of Yahuah were already open to this man''s cry before ever Peter was sent; the hearing that is coming reveals what was already true of him, it does not make it true.'),
  ('canon', 'acts', 10, 35, 'canon', 'john', 10, 27, 'free', E'*My sheep hear my voice, and I know them, and they follow me:* (John 10:27). *In every nation he that feareth him, and worketh righteousness, is accepted with him* (Acts 10:35). Cornelius hears because he is a sheep; he is not made a sheep by hearing. The word goes out to the nations because the sheep are scattered through them and not known by sight — and those who are his hear his voice when it comes.'),
  -- thread: acts-10-elohim-is-no-respecter-of-persons
  ('canon', 'acts', 10, 34, 'canon', 'deuteronomy', 10, 17, 'free', E'*For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward:* (Deuteronomy 10:17). *Of a truth I perceive that Elohim (God) is no respecter of persons* (Acts 10:34) is Moses'' own word: he *regardeth not persons.* Peter sees that Yahuah does not pick by the visible divide of Yahudah (Judah) and dispersion — the seed is scattered through all nations, and he knows his own where men cannot.'),
  ('canon', 'acts', 10, 34, 'canon', '2-chronicles', 19, 7, 'free', E'*Wherefore now let the fear of Yahuah (LORD) be upon you; take heed and do it: for there is no iniquity with Yahuah Eloheinu (the LORD our God), nor respect of persons, nor taking of gifts.* (2 Chronicles 19:7). Jehoshaphat charged the judges that *there is no respect of persons* with Yahuah — and Peter perceives the same of the gathering: *Elohim (God) is no respecter of persons* (Acts 10:34). The One who judges without partiality gathers his scattered seed without partiality, out of every nation they were sown into.'),
  ('canon', 'acts', 10, 34, 'apocrypha', 'ecclesiasticus', 35, 12, 'extras', E'*Do not think to corrupt with gifts; for such he will not receive: and trust not to unrighteous sacrifices; for Yahuah (God) is judge, and with him is no respect of persons.* (Ecclesiasticus 35:12). The Hebrew library says it as Moses and the Chronicler said it — *with him is no respect of persons.* Peter''s *Elohim (God) is no respecter of persons* (Acts 10:34) stands on the whole witness of the library: the Judge of all does not regard the face, and gathers his own from every nation.'),
  -- thread: acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach
  ('canon', 'acts', 10, 28, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). The sheet shows Peter that *Elohim (God) hath shewed me that I should not call any man common or unclean* (Acts 10:28). The lesson is of men, not of meats — the scattered seed living among the nations, the *not my people* whom Yahuah sowed into the earth to call *my people,* are not common to approach. What Elohim hath cleansed by his own promise to gather them, Peter is not to call common.'),
  -- thread: acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh
  ('canon', 'acts', 10, 36, 'canon', 'isaiah', 57, 19, 'free', E'*I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him.* (Isaiah 57:19). *The word which Elohim (God) sent unto the children of Yashar''el (Israel), preaching peace by Yahusha HaMashiach (Jesus Christ)* (Acts 10:36) is the peace Isaiah promised *to him that is far off, and to him that is near.* The far-off are the dispersed of the house scattered among the nations; the peace preached in Cornelius'' house is the healing-word reaching the afar-off seed.'),
  ('canon', 'acts', 10, 36, 'canon', 'ephesians', 2, 17, 'free', E'*And came and preached peace to you which were afar off, and to them that were nigh.* (Ephesians 2:17). Peter, *preaching peace by Yahusha HaMashiach (Jesus Christ)* in the centurion''s house (Acts 10:36), does the very thing — the peace *preached ... to you which were afar off, and to them that were nigh.* The afar-off made nigh are the scattered seed brought home, not a stranger-people made into the seed; the same gathering Isaiah named, now reaching the dispersion.'),
  -- thread: acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh
  ('canon', 'acts', 11, 18, 'canon', 'hosea', 1, 10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). *Then hath Elohim (God) also to the Gentiles granted repentance unto life* (Acts 11:18). This is Hosea''s promise breaking open: in the very place where the scattered house was told *ye are not my people,* there they are called *the sons of the living Elohim (God).* The repentance granted is the Lo-Ammi made nigh — the dispersed seed of Yashar''el among the nations gathered, not a new people grafted in.'),
  ('canon', 'acts', 11, 18, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). When the brethren glorify Elohim saying *also to the Gentiles granted repentance unto life* (Acts 11:18), it is the mercy on *her that had not obtained mercy* — the scattered house Yahuah *sowed ... in the earth.* The ones told *not my people* are now *my people*; the gathering of the sown seed, not the inclusion of a stranger-people by confession.'),
  ('canon', 'acts', 11, 18, 'apocrypha', 'tobit', 13, 5, 'extras', E'*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* (Tobit 13:5). Tobit, in the captivity, names the hope the brethren see fulfilled: Yahuah *will gather us out of all nations, among whom he has scattered us.* *To the Gentiles also granted repentance unto life* (Acts 11:18) is that gathering begun — the scattered of the house found among the nations, not the nations made the seed.'),
  ('canon', 'acts', 11, 18, 'canon', '1-peter', 2, 10, 'free', E'*Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy.* (1 Peter 2:10). Peter himself — the very apostle of the house of Cornelius — writes Hosea''s word to those gathered: *in time past were not a people, but are now the people of Elohim (God).* What he glorified Elohim for in Acts 11:18, *to the Gentiles also granted repentance unto life,* he names by Hosea: the *not my people* made the people, the scattered house brought home.'),
  -- thread: acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch
  ('canon', 'acts', 11, 19, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). *They which were scattered abroad upon the persecution ... travelled as far as Phenice, and Cyprus, and Antioch, preaching the word* (Acts 11:19). The scattering is the sowing: Yahuah said *I will sow her unto me in the earth,* and the persecution that scatters the witnesses is the very hand that sows the seed and the word together among the nations where the lost sheep are.'),
  -- thread: acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him
  ('canon', 'acts', 12, 7, 'canon', 'psalms', 34, 7, 'free', E'*The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* (Psalm 34:7). *Behold, the angel of Yahuah (Lord) came upon him, and a light shined in the prison ... and his chains fell off from his hands* (Acts 12:7). The deliverance is the psalm made sight: *the angel of Yahuah encampeth round about them that fear him, and delivereth them.* The church prays without ceasing, and the angel comes.'),
  ('canon', 'acts', 12, 11, 'canon', 'daniel', 6, 22, 'free', E'*My Elohim (God) hath sent his angel, and hath shut the lions’ mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* (Daniel 6:22). Peter, come to himself, says *Now I know of a surety, that Yahuah (Lord) hath sent his angel, and hath delivered me out of the hand of Herod* (Acts 12:11) — Daniel''s own confession: *My Elohim (God) hath sent his angel.* The God who shut the lions'' mouths for the servant in the den opens the prison for the servant in chains; the deliverance of the faithful is one work across the ages.'),
  -- thread: acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased
  ('canon', 'acts', 12, 22, 'canon', 'daniel', 4, 30, 'free', E'*The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* (Daniel 4:30). When the people shout *It is the voice of a god, and not of a man* (Acts 12:22) and Herod takes it, he stands where Nebuchadnezzar stood — *the honour of my majesty.* The man who receives the glory due to Elohim alone is the man on the very edge of the sentence.'),
  ('canon', 'acts', 12, 23, 'canon', 'daniel', 4, 32, 'free', E'*And they shall drive thee from men, and thy dwelling shall be with the beasts of the field: they shall make thee to eat grass as oxen, and seven times shall pass over thee, until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will.* (Daniel 4:32). *Immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms* (Acts 12:23). The lesson Nebuchadnezzar was driven among the beasts to learn — *that the El Elyon (most High) ruleth in the kingdom of men* — Herod is struck down for refusing. The same angel that delivered Peter smites the king who steals the glory of Elohim.'),
  ('canon', 'acts', 12, 23, 'canon', 'daniel', 4, 37, 'free', E'*Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* (Daniel 4:37). Nebuchadnezzar, restored, confesses the rule Herod would not — *those that walk in pride he is able to abase.* Herod *gave not Elohim (God) the glory* (Acts 12:23) and was abased to the worms; the proud king who learned and the proud king who would not learn stand as the two ends of one truth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a1012_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a1012_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear',
       E'Cornelius the devout God-fearer — the sheep that hear his voice',
       E'Before Peter is ever sent, Cornelius is already *a devout man, and one that feared Elohim (God) with all his house, which gave much alms to the people, and prayed to Elohim (God) alway* (Acts 10:2), and the angel tells him *Thy prayers and thine alms are come up for a memorial before Elohim (God)* (Acts 10:4). The ears of Yahuah were open to him already: *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry* (Psalm 34:15). And Peter perceives the rule of it — *in every nation he that feareth him, and worketh righteousness, is accepted with him* (Acts 10:35). This is not a man made a son by responding to a message. He is sought because he is already of the sheep: *My sheep hear my voice, and I know them, and they follow me* (John 10:27). The hearing that comes through Peter reveals what election made true of him before the foundation of the world; it does not create it. The word goes out to the nations because the scattered seed are sown through them and cannot be picked out by sight — and those who are his hear his voice when it comes.',
       sv.verse_id, ev.verse_id, 'free', 5400
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-10-elohim-is-no-respecter-of-persons',
       E'Elohim (God) is no respecter of persons',
       E'Peter opens his mouth in the centurion''s house and says *Of a truth I perceive that Elohim (God) is no respecter of persons: but in every nation he that feareth him, and worketh righteousness, is accepted with him* (Acts 10:34-35). It is no new doctrine — it is the standing word of the Torah, the histories, and the library. Moses said it of Yahuah: *which regardeth not persons, nor taketh reward* (Deuteronomy 10:17). Jehoshaphat charged the judges by it: *there is no iniquity with Yahuah Eloheinu (the LORD our God), nor respect of persons, nor taking of gifts* (2 Chronicles 19:7). The Hebrew library repeats it: *Yahuah (God) is judge, and with him is no respect of persons* (Ecclesiasticus 35:12). What Peter sees is that Yahuah does not gather his own by the visible divide of Yahudah (Judah) and dispersion — he does not regard the face. The seed of the house is scattered through all nations, and the Shepherd knows his own where men cannot tell them apart. The Judge who never regarded the face gathers his scattered seed the same way: not by sight, but by the voice they hear.',
       sv.verse_id, ev.verse_id, 'extras', 5410
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=10 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach',
       E'Call not any man common — the scattered seed not unclean to approach',
       E'Peter on the housetop sees the sheet let down with all manner of beasts, and the voice says *Rise, Peter; kill, and eat ... What Elohim (God) hath cleansed, that call not thou common* (Acts 10:13,15). He does not eat — and the vision is not finally about meat. Peter himself gives the interpretation when he reaches the house: *Elohim (God) hath shewed me that I should not call any man common or unclean* (Acts 10:28). The lesson is of men. The scattered seed of the house living among the nations — the *not my people* of whom Yahuah said *I will sow her unto me in the earth ... and I will say to them which were not my people, Thou art my people* (Hosea 2:23) — are not common to approach. The Spirit does not lead Peter away from the Torah of clean and unclean; he leads him to the dispersed of his own people, whom Elohim has cleansed by his own promise to gather. What Elohim hath cleansed by that promise, Peter is not to call common — and so he goes, *without gainsaying* (Acts 10:29), into the house of the afar-off seed.',
       sv.verse_id, ev.verse_id, 'free', 5420
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=10 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh',
       E'Preaching peace — to them afar off and to them that are nigh',
       E'In the house of Cornelius, Peter names what the word is: *The word which Elohim (God) sent unto the children of Yashar''el (Israel), preaching peace by Yahusha HaMashiach (Jesus Christ): (he is Yahuah (Lord) of all:)* (Acts 10:36). This is the peace Isaiah promised: *I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* (Isaiah 57:19). The far-off are the dispersed of the house, scattered among the nations; the peace reaching the centurion''s house is the healing-word reaching the afar-off seed. It is the same gathering the apostles preach elsewhere: *And came and preached peace to you which were afar off, and to them that were nigh* (Ephesians 2:17). The afar-off made nigh are the scattered brought home, not a stranger-people made into the seed. And as Peter speaks, the proof of it falls: *While Peter yet spake these words, the Ruach HaKodesh (Holy Spirit) fell on all them which heard the word* (Acts 10:44) — the peace received, the gathering owned by the Spirit himself.',
       sv.verse_id, ev.verse_id, 'free', 5430
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=36
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=10 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh',
       E'To the Gentiles also granted repentance — the Lo-Ammi made nigh',
       E'When Peter has rehearsed the whole matter, the brethren in Jerusalem hold their peace and glorify Elohim, saying *Then hath Elohim (God) also to the Gentiles granted repentance unto life* (Acts 11:18). This is Hosea''s promise breaking open. Yahuah had named the scattered northern house *Lo-ammi* — *for ye are not my people* (Hosea 1:9) — and in the same breath swore the turning: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10), *and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people* (Hosea 2:23). The hope was kept in the captivity too: *he ... will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). And Peter himself, the apostle of this very house, later writes it to the gathered: *Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10). The repentance granted is the Lo-Ammi made nigh — the dispersed seed of the house, scattered through the nations and unknown by sight, called home and revealed as sons. It is not a stranger-people grafted in by confession; it is the gathering Hosea sang.',
       sv.verse_id, ev.verse_id, 'extras', 5440
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=11 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch',
       E'The scattered sown among the nations — the word to Antioch',
       E'*Now they which were scattered abroad upon the persecution that arose about Stephen travelled as far as Phenice, and Cyprus, and Antioch, preaching the word* (Acts 11:19), and *a great number believed, and turned unto Yahuah (Lord)* (Acts 11:21). The scattering is the sowing. Yahuah said of the divorced house, *I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people* (Hosea 2:23). The hand that scatters the witnesses under persecution is the hand that sows the seed and the word together into the very nations where the lost sheep already are. The dispersion was never an accident of the enemy''s rage; it is the means of the gathering. The word reaches Antioch because the scattered carry it, and the great number that turns is the sown seed of the house hearing the voice of its Shepherd in the place where it was sown.',
       sv.verse_id, ev.verse_id, 'free', 5450
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=11 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him',
       E'The angel of Yahuah delivereth them that fear him',
       E'Herod has killed James with the sword and taken Peter, bound with two chains between two soldiers, the keepers before the door — but *prayer was made without ceasing of the church unto Elohim (God) for him* (Acts 12:5). And in the night *the angel of Yahuah (Lord) came upon him, and a light shined in the prison ... and his chains fell off from his hands* (Acts 12:7). It is the psalm made sight: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7). When Peter comes to himself he confesses it in the very words of Daniel: *Now I know of a surety, that Yahuah (Lord) hath sent his angel, and hath delivered me out of the hand of Herod* (Acts 12:11) — for Daniel, brought up unhurt from the lions, had said *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me* (Daniel 6:22). The God who shut the lions'' mouths for the servant in the den opens the iron gate for the servant in chains. The deliverance of the faithful is one work across the ages, and it answers the prayer of the gathered.',
       sv.verse_id, ev.verse_id, 'free', 5460
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased',
       E'He gave not Elohim the glory — the pride that is abased',
       E'Herod, arrayed in royal apparel upon his throne, makes his oration, and the people shout *It is the voice of a god, and not of a man* (Acts 12:22) — and he takes it. *And immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost* (Acts 12:23). He stands where Nebuchadnezzar stood: *Is not this great Babylon, that I have built ... for the honour of my majesty?* (Daniel 4:30). And the sentence Nebuchadnezzar was driven among the beasts to learn is the very lesson Herod refuses: *they shall make thee to eat grass as oxen ... until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will* (Daniel 4:32). Restored, Nebuchadnezzar confessed it — *those that walk in pride he is able to abase* (Daniel 4:37). Herod walked in pride and was abased to the worms. The same angel that delivered Peter from the prison smote the king who stole the glory of Elohim; the One who rules in the kingdom of men gives it to whomsoever he will, and takes it from the proud.',
       sv.verse_id, ev.verse_id, 'free', 5470
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=12 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:15 — *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry* the ears of Yahuah were open to Cornelius before Peter was sent (Acts 10:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:27 — *My sheep hear my voice, and I know them, and they follow me* Cornelius hears because he is a sheep; he is not made one by hearing (Acts 10:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-10-elohim-is-no-respecter-of-persons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 10:17 — *which regardeth not persons, nor taketh reward* Moses'' own word for Yahuah; Peter perceives it of the gathering (Acts 10:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-elohim-is-no-respecter-of-persons'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 19:7 — *there is no iniquity with Yahuah Eloheinu (the LORD our God), nor respect of persons* Jehoshaphat''s charge to the judges; the Judge gathers without partiality (Acts 10:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-elohim-is-no-respecter-of-persons'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 35:12 — *Yahuah (God) is judge, and with him is no respect of persons* the Hebrew library repeats the Torah''s witness Peter stands on (Acts 10:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-elohim-is-no-respecter-of-persons'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 2:23 — *I will sow her unto me in the earth ... and I will say to them which were not my people, Thou art my people* the sheet is of men: the scattered seed among the nations are not common to approach (Acts 10:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 57:19 — *Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* the peace preached in Cornelius'' house reaching the afar-off seed (Acts 10:36).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 2:17 — *preached peace to you which were afar off, and to them that were nigh* the afar-off made nigh are the scattered brought home, not a stranger-people made the seed (Acts 10:36).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 1:10 — *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* the Lo-Ammi made nigh — the dispersed house called sons (Acts 11:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 2:23 — *I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people* the mercy on the scattered house Yahuah sowed in the earth (Acts 11:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:5 — *will gather us out of all nations, among whom he has scattered us* the captivity''s hope: the scattered of the house gathered, begun in the repentance granted (Acts 11:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 2:10 — *which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* Peter himself names Acts 11:18 by Hosea — the not-my-people made the people (Acts 11:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 2:23 — *I will sow her unto me in the earth* the persecution-scattering is the sowing of the seed and the word among the nations (Acts 11:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* the prison-deliverance is the psalm made sight (Acts 12:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions’ mouths* Peter''s confession is Daniel''s; the God of the den opens the prison (Acts 12:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 4:30 — *Is not this great Babylon, that I have built ... for the honour of my majesty?* Herod takes the shout of the people where Nebuchadnezzar took the honour (Acts 12:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:32 — *until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will* the lesson Herod refused and was smitten for (Acts 12:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:37 — *those that walk in pride he is able to abase* Nebuchadnezzar restored confessed it; Herod walked in pride and was abased to the worms (Acts 12:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_13.sql (S217 Acts 13) -----
-- =====================================================================
-- S217 minion — ACTS 13 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 13 (Antioch of Pisidia; Paul's synagogue sermon reciting the covenant history
--         and proclaiming the risen Messiah; the turn to the nations at the end).
-- Tag: a13 (temp view _s217_a13_lookup).  Sort band: 5500-5599.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINT (Red Lines #7/#11, the light-to-the-nations risk): Paul's *we turn to the Gentiles*
-- (Acts 13:46) and *I have set thee to be a light of the Gentiles* (Acts 13:47, quoting Isaiah
-- 49:6) are read as the proclamation going out to where the scattered seed live among the
-- nations — the dispersed of Yashar'el (Israel) reached, the lost sheep gathered. NOT the
-- false-inclusion of the nations-as-such into the covenant by faith-confession. Isaiah 49:6 in
-- its own context pairs the light-to-the-nations with *to raise up the tribes of Jacob, and to
-- restore the preserved of Yashar'el (Israel)* — the restoration framing governs the thread, and
-- Simeon's Luke 2:32 holds the same pairing (*a light to lighten the Gentiles, and the glory of
-- thy people Yashar'el*). Framed accordingly in thread acts-13-light-to-the-nations.
--
-- WATCHPOINT (Red Line #10 + Christology): Acts 13:33's *Thou art my Son, this day have I
-- begotten thee* (Psalm 2:7) is the begetting = the resurrection / right-hand enthronement of
-- the Formed — NO Trinitarian co-equal-persons grammar, NO modalist collapse. Yahusha (Jesus)
-- is the Formed drawn from the Formless, who is God and has a Father. Acts 13:38-39's
-- justification language is left as narration (no standalone sola-fide formula authored into a
-- note). Framed accordingly in thread acts-13-the-begetting.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 13:
--   v.1-12  Antioch sending / Cyprus / Elymas  Tanakh: none warranted (narrative)  Extras: none warranted  NT: none warranted
--   v.16-22 recital: fathers, exodus, judges, Saul, David  Tanakh: 1 Samuel 13:14, Psalm 89:20 (2 Samuel 7:12 weighed -> carried in begetting/Saviour beat)  Extras: 1 Maccabees 2 weighed; faith-recital of patriarchs, not the national history Paul recites -> none added  NT: none warranted
--   v.23-25 the Saviour of David's seed / John's witness  Tanakh: none added  Extras: none warranted  NT: Luke 3:16, John 1:27
--   v.26-31 condemned, slain, taken from the tree, raised  Tanakh: none added (Acts 2 carried Psalm 16)  Extras: none warranted  NT: none warranted (carried in resurrection threads)
--   v.32-33 the begetting / Psalm 2:7  Tanakh: Psalm 2:7  Extras: none warranted  NT: Hebrews 1:5, Hebrews 5:5
--   v.34-37 the sure mercies of David / the Holy One not to see corruption  Tanakh: Isaiah 55:3, Psalm 16:10  Extras: none warranted  NT: Acts 2:27 (Acts<->Acts re-walk)
--   v.38-39 forgiveness / justified  Tanakh: none warranted  Extras: none warranted  NT: none warranted (left as narration; no sola-fide formula authored)
--   v.40-41 beware the despisers / Habakkuk  Tanakh: Habakkuk 1:5  Extras: none warranted  NT: none warranted
--   v.42-45 the next sabbath / envy  Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.46-47 we turn to the nations / a light of the nations  Tanakh: Isaiah 49:6  Extras: none warranted  NT: Luke 2:32
--   v.48-50 ordained to life believed / persecution  Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.51-52 shook off the dust  Tanakh: none warranted  Extras: none warranted  NT: Matthew 10:14, Luke 9:5
--
-- THREADS (slug -> target libraries):
--   5500 acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david       (Tanakh)
--   5510 acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me             (NT)
--   5520 acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed      (Tanakh + NT)
--   5530 acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption    (Tanakh + NT)
--   5540 acts-13-beware-ye-despisers-i-work-a-work-in-your-days                  (Tanakh)
--   5550 acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes        (Tanakh + NT)
--   5560 acts-13-they-shook-off-the-dust-of-their-feet                          (NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david
  ('canon', 'acts', 13, 22, 'canon', '1-samuel', 13, 14, 'free', E'*But now thy kingdom shall not continue: Yahuah (LORD) hath sought him a man after his own heart, and Yahuah (LORD) hath commanded him to be captain over his people, because thou hast not kept that which Yahuah (LORD) commanded thee.* (1 Samuel 13:14). When Paul says *he raised up unto them David to be their king; to whom also he gave testimony, and said, I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22), he is reaching back to the word Samuel spoke when Saul''s kingdom was torn away — *Yahuah (LORD) hath sought him a man after his own heart.* The throne passes from the king the people desired to the king Yahuah (LORD) chose.'),
  ('canon', 'acts', 13, 22, 'canon', 'psalms', 89, 20, 'free', E'*I have found David my servant; with my holy oil have I anointed him:* (Psalm 89:20). Paul''s *I have found David the son of Jesse, a man after mine own heart* (Acts 13:22) is the very language of the covenant-song — *I have found David my servant.* The David whom Yahuah (LORD) found and anointed is the head of the line through whom the sworn mercy runs to the Saviour Paul is about to name.'),
  -- thread: acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me
  ('canon', 'acts', 13, 25, 'canon', 'luke', 3, 16, 'free', E'*John answered, saying unto them all, I indeed baptize you with water; but one mightier than I cometh, the latchet of whose shoes I am not worthy to unloose: he shall baptize you with the Ruach HaKodesh (Holy Spirit) and with fire:* (Luke 3:16). Paul rehearses John''s own confession — *as John fulfilled his course, he said, Whom think ye that I am? I am not he. But, behold, there cometh one after me, whose shoes of his feet I am not worthy to loose* (Acts 13:25). The forerunner steps aside for the One he prepared the way for, the same testimony Luke records from John''s mouth.'),
  ('canon', 'acts', 13, 25, 'canon', 'john', 1, 27, 'free', E'*He it is, who coming after me is preferred before me, whose shoe''s latchet I am not worthy to unloose.* (John 1:27). The phrase Paul puts in John''s mouth — *whose shoes of his feet I am not worthy to loose* (Acts 13:25) — is John''s own word at the Jordan: *whose shoe''s latchet I am not worthy to unloose.* The witness who came before disowns the title and points past himself to the One who comes after.'),
  -- thread: acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed
  ('canon', 'acts', 13, 33, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). Paul reads the resurrection out of the second psalm — *Elohim (God) hath fulfilled the same unto us their children, in that he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee* (Acts 13:33). The *this day* is the day of the raising-up — the enthronement of the Formed, declared Son in power by the rising from the dead. He who is the Son begotten of the Father is set on the throne; the begetting names the day he was raised, not a beginning of his being.'),
  ('canon', 'acts', 13, 33, 'canon', 'hebrews', 1, 5, 'free', E'*For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). The same decree Paul preaches at Antioch is the word Hebrews sets above the angels — *Thou art my Son, this day have I begotten thee.* It is spoken to the Son alone, the heir of all things, raised and seated *on the right hand of the Majesty on high;* he is Son to a Father, and the throne is his.'),
  ('canon', 'acts', 13, 33, 'canon', 'hebrews', 5, 5, 'free', E'*So also Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee.* (Hebrews 5:5). The begetting Paul ties to the resurrection (Acts 13:33) Hebrews ties to the glorifying of the Messiah (Christ) as high priest — *he that said unto him, Thou art my Son, to day have I begotten thee.* The Son does not seize the honour; the Father confers it, raising and enthroning the One he calls Son.'),
  -- thread: acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption
  ('canon', 'acts', 13, 34, 'canon', 'isaiah', 55, 3, 'free', E'*Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David.* (Isaiah 55:3). Paul grounds the resurrection-*no more to return to corruption* in the prophet''s pledge — *I will give you the sure mercies of David* (Acts 13:34). The mercies sworn to David are *sure* — they cannot fail — and they are made sure precisely because the One of David''s seed is raised never to see corruption again; the everlasting covenant stands on a living head.'),
  ('canon', 'acts', 13, 35, 'canon', 'psalms', 16, 10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). Paul says *he saith also in another psalm, Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35), then makes the argument plain: *David … fell on sleep … and saw corruption: But he, whom Elohim (God) raised again, saw no corruption* (Acts 13:36-37). The psalm could not be of David, who lies in his tomb; it is of the Holy One whom Elohim (God) raised, whose flesh saw no decay.'),
  ('canon', 'acts', 13, 35, 'canon', 'acts', 2, 27, 'free', E'*Because thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption.* (Acts 2:27). At Pentecost Peter had already opened the same psalm to the same end — *thou wilt not … suffer thine Holy One to see corruption* — and reasoned that David *is both dead and buried* while the Holy One was raised. Paul at Antioch re-walks the very argument: *Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35), David saw corruption, but the One Elohim (God) raised saw none. Two witnesses, one psalm, one risen Holy One.'),
  -- thread: acts-13-beware-ye-despisers-i-work-a-work-in-your-days
  ('canon', 'acts', 13, 41, 'canon', 'habakkuk', 1, 5, 'free', E'*Behold ye among the heathen, and regard, and wonder marvellously: for I will work a work in your days, which ye will not believe, though it be told you.* (Habakkuk 1:5). Paul closes the sermon with the prophet''s warning — *Behold, ye despisers, and wonder, and perish: for I work a work in your days, a work which ye shall in no wise believe, though a man declare it unto you* (Acts 13:41). The work Yahuah (LORD) declared through Habakkuk that the hearers would not believe is set before this generation again: the raising-up of the Saviour, declared and disbelieved, the same hardness the prophet foretold.'),
  -- thread: acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes
  ('canon', 'acts', 13, 47, 'canon', 'isaiah', 49, 6, 'free', E'*And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* (Isaiah 49:6). Paul takes his commission from this verse — *I have set thee to be a light of the Gentiles, that thou shouldest be for salvation unto the ends of the earth* (Acts 13:47). The prophet binds the two together in one breath: the light that goes to the nations is the same servant''s work that raises up *the tribes of Jacob* and restores *the preserved of Yashar''el (Israel).* The light goes out among the nations because that is where the scattered of the house are dispersed — the salvation reaching to the ends of the earth is the gathering of the lost sheep, not a new people put in their place.'),
  ('canon', 'acts', 13, 47, 'canon', 'luke', 2, 32, 'free', E'*A light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel).* (Luke 2:32). When Paul calls himself *a light of the Gentiles* (Acts 13:47), he speaks the word Simeon spoke over the child in the temple — and Simeon holds both halves together: the light that lightens the nations is *the glory of thy people Yashar''el (Israel).* The light among the nations and the glory of the people are one salvation; the proclamation reaches the dispersed of the house wherever they are scattered.'),
  -- thread: acts-13-they-shook-off-the-dust-of-their-feet
  ('canon', 'acts', 13, 51, 'canon', 'matthew', 10, 14, 'free', E'*And whosoever shall not receive you, nor hear your words, when ye depart out of that house or city, shake off the dust of your feet.* (Matthew 10:14). When Paul and Barnabas *shook off the dust of their feet against them, and came unto Iconium* (Acts 13:51), they do exactly what the Master charged the sent ones to do where the word is refused — *shake off the dust of your feet.* The pursuit ends where the rejection lands; the messengers move on to where the word will be heard.'),
  ('canon', 'acts', 13, 51, 'canon', 'luke', 9, 5, 'free', E'*And whosoever will not receive you, when ye go out of that city, shake off the very dust from your feet for a testimony against them.* (Luke 9:5). The act of Acts 13:51 — *they shook off the dust of their feet against them* — is the Master''s own instruction to the twelve: *shake off the very dust from your feet for a testimony against them.* It is not vengeance but witness; the dust left behind testifies that the word was brought and refused.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david',
       E'The Elohim (God) of Yashar''el (Israel) chose the fathers and raised up David',
       E'Standing in the synagogue at Antioch, Paul recites the covenant history of one people: *The Elohim (God) of this people of Yashar''el (Israel) chose our fathers, and exalted the people when they dwelt as strangers in the land of Egypt … and with an high arm brought he them out of it* (Acts 13:17), through the wilderness, the conquest, the judges, *until Samuel the prophet* (Acts 13:20). When they desired a king, Elohim (God) gave them Saul of the tribe of Benjamin; *and when he had removed him, he raised up unto them David to be their king; to whom also he gave testimony, and said, I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22). The testimony is Samuel''s own word when Saul''s kingdom was torn away: *Yahuah (LORD) hath sought him a man after his own heart, and Yahuah (LORD) hath commanded him to be captain over his people* (1 Samuel 13:14), and the covenant-song confirms it: *I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20). The throne passes to the king Yahuah (LORD) found and anointed — the head of the line through whom the sworn mercy will run to the Saviour Paul is about to name.',
       sv.verse_id, ev.verse_id, 'free', 5500
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me',
       E'John''s witness — I am not he; there cometh one after me',
       E'Before he reaches the cross and the empty tomb, Paul names the forerunner: *When John had first preached before his coming the baptism of repentance to all the people of Yashar''el (Israel)* (Acts 13:24). And he gives John''s own confession: *as John fulfilled his course, he said, Whom think ye that I am? I am not he. But, behold, there cometh one after me, whose shoes of his feet I am not worthy to loose* (Acts 13:25). It is the word John spoke at the Jordan — *one mightier than I cometh, the latchet of whose shoes I am not worthy to unloose: he shall baptize you with the Ruach HaKodesh (Holy Spirit) and with fire* (Luke 3:16), *He it is, who coming after me is preferred before me, whose shoe''s latchet I am not worthy to unloose* (John 1:27). The witness who came first disowns the title the people pressed on him and points past himself to the One who comes after. The preparer of the way steps aside for the Saviour of David''s seed.',
       sv.verse_id, ev.verse_id, 'free', 5510
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed',
       E'The begetting — Thou art my Son; the raising-up of the Formed',
       E'Paul brings the recital to its center: *we declare unto you glad tidings, how that the promise which was made unto the fathers, Elohim (God) hath fulfilled the same unto us their children, in that he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee* (Acts 13:32-33). The decree he quotes is *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The *this day* is the day of the raising-up — the resurrection that declares the Son in power, the enthronement of the Formed at the right hand. He who is Son to a Father is set upon the throne; the begetting names the day he was raised and seated, not a beginning of his being. Hebrews sets the same decree above the angels — *unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee?* (Hebrews 1:5) — and ties it to his glorifying as high priest — *Messiah (Christ) glorified not himself … but he that said unto him, Thou art my Son, to day have I begotten thee* (Hebrews 5:5). The Son does not seize the honour; the Father confers it, raising and enthroning the One he calls Son.',
       sv.verse_id, ev.verse_id, 'free', 5520
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption',
       E'The sure mercies of David — the Holy One not to see corruption',
       E'The resurrection is *no more to return to corruption,* and Paul anchors it in two psalms and the prophet. *I will give you the sure mercies of David* (Acts 13:34) is Isaiah''s everlasting-covenant pledge — *Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David* (Isaiah 55:3). The mercies are *sure* — they cannot fail — because the One of David''s seed is raised never to decay again; the everlasting covenant stands on a living head. Then Paul opens the sixteenth psalm: *Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35), which is *thou wilt not … suffer thine Holy One to see corruption* (Psalm 16:10), and he reasons it cannot be of David: *David, after he had served his own generation … fell on sleep … and saw corruption: But he, whom Elohim (God) raised again, saw no corruption* (Acts 13:36-37). At Pentecost Peter had already opened the same psalm to the same end — *thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption* (Acts 2:27) — David is dead and buried, but the Holy One was raised. Two witnesses, one psalm, one risen Holy One whose flesh saw no decay.',
       sv.verse_id, ev.verse_id, 'free', 5530
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-beware-ye-despisers-i-work-a-work-in-your-days',
       E'Beware, ye despisers — I work a work in your days',
       E'Paul closes the synagogue sermon not with comfort but with the prophet''s warning: *Beware therefore, lest that come upon you, which is spoken of in the prophets; Behold, ye despisers, and wonder, and perish: for I work a work in your days, a work which ye shall in no wise believe, though a man declare it unto you* (Acts 13:40-41). It is Habakkuk''s word — *Behold ye among the heathen, and regard, and wonder marvellously: for I will work a work in your days, which ye will not believe, though it be told you* (Habakkuk 1:5). The work Yahuah (LORD) declared through the prophet, that the hearers would marvel at and refuse, is set before this generation again: the raising-up of the Saviour, declared and disbelieved. The warning is mercy held out before the door closes — wonder at the work, but do not perish despising it.',
       sv.verse_id, ev.verse_id, 'free', 5540
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=40
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes',
       E'A light to the nations — and the restoration of the tribes',
       E'When the leaders contradict and blaspheme, Paul and Barnabas wax bold: *It was necessary that the word of Elohim (God) should first have been spoken to you: but seeing ye put it from you … lo, we turn to the Gentiles. For so hath Yahuah (Lord) commanded us, saying, I have set thee to be a light of the Gentiles, that thou shouldest be for salvation unto the ends of the earth* (Acts 13:46-47). The verse they take their commission from is Isaiah''s, and the prophet binds two works into one breath: *It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* (Isaiah 49:6). The light goes out to the nations because that is where the scattered of the house are dispersed; the salvation reaching to the ends of the earth is the raising-up of the tribes of Jacob and the restoring of the preserved of Yashar''el (Israel) — the lost sheep gathered from where they were sown, not a new people set in their place. Simeon held the same two halves together over the child in the temple: *A light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel)* (Luke 2:32). The light among the nations and the glory of the people are one salvation; the proclamation reaches the dispersed of the house wherever they are scattered, and *as many as were ordained to eternal life believed* (Acts 13:48) — the hearing revealing those who were already his.',
       sv.verse_id, ev.verse_id, 'free', 5550
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=46
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-13-they-shook-off-the-dust-of-their-feet',
       E'They shook off the dust of their feet',
       E'When persecution is stirred up and they are expelled from the coasts, the messengers do what the Master charged: *they shook off the dust of their feet against them, and came unto Iconium. And the disciples were filled with joy, and with the Ruach HaKodesh (Holy Spirit)* (Acts 13:51-52). Yahusha (Jesus) had given the instruction to the sent ones: *whosoever shall not receive you, nor hear your words, when ye depart out of that house or city, shake off the dust of your feet* (Matthew 10:14), *shake off the very dust from your feet for a testimony against them* (Luke 9:5). It is not vengeance but witness — the dust left behind testifies that the word was brought and refused. The pursuit ends where the rejection lands; the messengers move on, *filled with joy,* to where the word will be heard. The sheep hear the Shepherd''s voice; where it is put away, the dust is shaken off and the proclamation goes forward.',
       sv.verse_id, ev.verse_id, 'free', 5560
  FROM _s217_a13_lookup sv, _s217_a13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=51
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=13 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 13:14 — *Yahuah (LORD) hath sought him a man after his own heart* Samuel''s word when Saul''s kingdom was torn away, which Paul quotes of David (Acts 13:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 89:20 — *I have found David my servant; with my holy oil have I anointed him* the covenant-song''s found-and-anointed David, the head of the line of the sworn mercy (Acts 13:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-god-of-yasharel-chose-the-fathers-and-raised-up-david'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 3:16 — *one mightier than I cometh, the latchet of whose shoes I am not worthy to unloose* John''s confession at the Jordan, which Paul rehearses (Acts 13:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:27 — *whose shoe''s latchet I am not worthy to unloose* John''s own word, the very phrase Paul puts in his mouth (Acts 13:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-johns-witness-i-am-not-he-there-cometh-one-after-me'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee* the decree Paul reads of the resurrection; the *this day* is the day of the raising-up and enthronement (Acts 13:33).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:5 — *Thou art my Son, this day have I begotten thee* the same decree spoken to the Son alone, set above the angels (Acts 13:33).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 5:5 — *he that said unto him, Thou art my Son, to day have I begotten thee* the begetting tied to the Father glorifying the Son as high priest (Acts 13:33).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-begetting-thou-art-my-son-the-raising-up-of-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:3 — *I will make an everlasting covenant with you, even the sure mercies of David* the pledge Paul ties to the resurrection-no-more-to-corruption (Acts 13:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 16:10 — *neither wilt thou suffer thine Holy One to see corruption* the psalm Paul shows cannot be of David, who saw corruption, but of the One raised (Acts 13:35-37).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 2:27 — *neither wilt thou suffer thine Holy One to see corruption* Peter at Pentecost opened the same psalm to the same end; Paul re-walks the argument (Acts 13:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-the-sure-mercies-of-david-the-holy-one-not-to-see-corruption'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-beware-ye-despisers-i-work-a-work-in-your-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 1:5 — *I will work a work in your days, which ye will not believe, though it be told you* the prophet''s warning Paul sets before this generation (Acts 13:41).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-beware-ye-despisers-i-work-a-work-in-your-days'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:6 — *to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* the prophet binds the light-to-the-nations to the restoration of the tribes in one breath (Acts 13:47).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 2:32 — *A light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel)* Simeon holds the light-to-the-nations and the glory of the people together as one salvation (Acts 13:47).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-a-light-to-the-nations-and-the-restoration-of-the-tribes'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-13-they-shook-off-the-dust-of-their-feet
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:14 — *when ye depart out of that house or city, shake off the dust of your feet* the Master''s charge to the sent ones, done at Antioch (Acts 13:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-they-shook-off-the-dust-of-their-feet'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 9:5 — *shake off the very dust from your feet for a testimony against them* the same charge to the twelve; not vengeance but witness (Acts 13:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a13_lookup sv, _s217_a13_lookup tv
 WHERE t.slug='acts-13-they-shook-off-the-dust-of-their-feet'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=13 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'Session 217 — Acts 1-7 cross-references complete.'
