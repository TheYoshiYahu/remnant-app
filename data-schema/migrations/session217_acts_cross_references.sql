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

-- ----- fragment: minion_acts_14.sql (S217 Acts 14) -----
-- =====================================================================
-- S217 minion — ACTS 14 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 14 (single anchor chapter).  Tag: a14 (temp view _s217_a14_lookup).
-- Sort band: 5600-5612 (5600, 5603, 5606, 5609, 5612; step 3, <= 5624).
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #7/#11, Christology, son-of-Adam, no sola-fide truncation):
--  * Lystra healing (8-10): *he leaped and walked* is the sign Isaiah named of Elohim (God)
--    coming to save — *then shall the lame man leap as an hart* (Isaiah 35:6). The same sign
--    that opened the gospel at the Beautiful Gate (Acts 3) here opens it in Lycaonia: the
--    Saviour-who-comes-with-recompence at work through his sent ones, not the power of men
--    (the crowd's Zeus/Hermes error is the very thing Paul rends his clothes to deny).
--  * Turn from vanities to the living Elohim (15-17): the creation-testimony is the Tanakh's
--    own polemic against the idols — *the gods that have not made the heavens and the earth …
--    shall perish* (Jeremiah 10:11); *which made heaven, and earth* (Psalm 146:6). Wisdom 13
--    names the Lystrans' exact error: taking the lights of heaven for gods, not knowing the
--    workmaster. Read as the one living Elohim's witness to all, NOT a graft-the-nations move;
--    *suffered all nations to walk in their own ways* (v.16) is the times-past condition, the
--    witness left in rain and fruitful seasons preparing the turning.
--  * Through much tribulation enter the kingdom (22): tribulation is the road INTO the kingdom,
--    not abolished by grace (no sola-fide truncation, Red Line #10) — *in the world ye shall
--    have tribulation* (John 16:33); *all that will live godly … shall suffer persecution*
--    (2 Timothy 3:12, naming Antioch/Iconium/Lystra by name). The kingdom entered is the
--    everlasting kingdom given to the saints (Daniel 7:18,27).
--  * The door of faith (27): *how he had opened the door of faith unto the Gentiles* read as
--    the gathering of the scattered seed, the tabernacle of David raised again (Amos 9:11), the
--    captives gathered out of all nations (Tobit 13:5) — NOT false-inclusion of non-seed by
--    confession; hearing reveals what was already true (Red Lines #7/#11).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 14:
--   v.1-4   Iconium, the city divided   Tanakh: none warranted  Extras: none warranted  NT: Luke 12:51 weighed (the division the word brings — thematic, carried in narrative, not added)
--   v.3     word of his grace, signs    Tanakh: none warranted  Extras: none warranted  NT: none added (signs-and-wonders confirmation carried by the Lystra-healing thread)
--   v.5-7   fled to Lystra, preached    Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.8-10  the cripple healed, leaped  Tanakh: Isaiah 35:6  Extras: none warranted  NT: Acts 3:6, Acts 3:8 (Acts<->Acts, the Beautiful-Gate lame man)
--   v.11-14 Zeus/Hermes, clothes rent   Tanakh: none added (idol-rebuke carried in v.15 vanities thread)  Extras: none warranted  NT: none warranted (narrative)
--   v.15    turn from vanities          Tanakh: Jeremiah 10:11, Psalms 146:6  Extras: Wisdom of Solomon 13:1  NT: none warranted
--   v.16-17 witness in rain/seasons     Tanakh: Psalms 19:1  Extras: none warranted  NT: none warranted
--   v.18    scarce restrained           Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.19-21 stoned, rose, returned      Tanakh: none added (the suffering carried in v.22 tribulation thread)  Extras: none warranted  NT: 2 Timothy 3:11 (Paul names Lystra's stoning) — placed in v.22 thread where it belongs
--   v.22    much tribulation -> kingdom Tanakh: Daniel 7:18, Daniel 7:27  Extras: none warranted  NT: John 16:33, 2 Timothy 3:11, 2 Timothy 3:12
--   v.23-26 elders ordained, returned   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; commended to the grace of Elohim, carried thematically)
--   v.27    door of faith / gathering   Tanakh: Amos 9:11  Extras: Tobit 13:5  NT: none warranted
--   v.28    abode long time             Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5600 acts-14-then-shall-the-lame-man-leap-as-an-hart-the-cripple-at-lystra-healed (Tanakh + NT/Acts<->Acts)
--   5603 acts-14-turn-from-these-vanities-unto-the-living-god-which-made-heaven-and-earth (Tanakh + extras)
--   5606 acts-14-he-left-not-himself-without-witness-the-heavens-declare-his-glory (Tanakh)
--   5609 acts-14-through-much-tribulation-enter-into-the-kingdom-of-god (Tanakh + NT)
--   5612 acts-14-the-door-of-faith-and-the-tabernacle-of-david-the-gathering (Tanakh + extras)
-- =====================================================================

CREATE TEMP VIEW _s217_a14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-14-then-shall-the-lame-man-leap-as-an-hart-the-cripple-at-lystra-healed
  ('canon', 'acts', 14, 10, 'canon', 'isaiah', 35, 6, 'free', E'*Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert.* (Isaiah 35:6). At Lystra Paul sees a man *impotent in his feet, being a cripple from his mother''s womb, who never had walked* (Acts 14:8), and says *with a loud voice, Stand upright on thy feet. And he leaped and walked* (Acts 14:10). This is the very sign Isaiah named of the coming of Elohim (God) to save — *behold, your Elohim (God) will come with vengeance … he will come and save you* (Isaiah 35:4), and then *the lame man leap as an hart.* The leaping feet are the announcement that the Saviour has come.'),
  ('canon', 'acts', 14, 10, 'canon', 'acts', 3, 6, 'free', E'*Then Peter said, Silver and gold have I none; but such as I have give I thee: In the name of Yahusha HaMashiach (Jesus Christ) of Nazareth rise up and walk.* (Acts 3:6). What opened the gospel at the Beautiful Gate opens it again in Lycaonia: there a man *lame from his mother''s womb* (Acts 3:2) is bidden to *rise up and walk;* here a man *a cripple from his mother''s womb* (Acts 14:8) is told *Stand upright on thy feet. And he leaped and walked* (Acts 14:10). The same word, the same lifting, the same Name working — and Peter''s disclaimer is Paul''s also: not *by our own power or holiness* (Acts 3:12) but the Name of the risen One.'),
  ('canon', 'acts', 14, 10, 'canon', 'acts', 3, 8, 'free', E'*And he leaping up stood, and walked, and entered with them into the temple, walking, and leaping, and praising Elohim (God).* (Acts 3:8). The lame man at the temple gate *leaping up stood, and walked;* the cripple at Lystra, hearing *Stand upright on thy feet,* likewise *leaped and walked* (Acts 14:10). Twice the leaping feet of Isaiah''s prophecy break out — once in Yerushalayim, once among the Lystrans — the same sign that *the lame man leap as an hart* (Isaiah 35:6), witnessing that Elohim (God) has come to save.'),
  -- thread: acts-14-turn-from-these-vanities-unto-the-living-god-which-made-heaven-and-earth
  ('canon', 'acts', 14, 15, 'canon', 'jeremiah', 10, 11, 'free', E'*Thus shall ye say unto them, The gods that have not made the heavens and the earth, even they shall perish from the earth, and from under these heavens.* (Jeremiah 10:11). When the crowd would sacrifice to them as Zeus and Hermes, Paul and Barnabas rend their clothes and cry, *turn from these vanities unto the living Elohim (God), which made heaven, and earth, and the sea, and all things that are therein* (Acts 14:15). It is Jeremiah''s own test set against the idols: the gods that did not make the heavens and earth are vanities that perish; the living Elohim (God) is known because he is the Maker. The made-thing is not the god; the Maker alone is.'),
  ('canon', 'acts', 14, 15, 'canon', 'psalms', 146, 6, 'free', E'*Which made heaven, and earth, the sea, and all that therein is: which keepeth truth for ever:* (Psalms 146:6). Paul preaches *the living Elohim (God), which made heaven, and earth, and the sea, and all things that are therein* (Acts 14:15) — word for word the psalm''s confession of the one in whom there is help: *Happy is he that hath the Elohim (God) of Jacob for his help* (Psalms 146:5). The psalm sets the Maker of heaven and earth against *the son of Adam, in whom there is no help* (Psalms 146:3) — exactly what Paul tells the crowd: *We also are men of like passions with you* (Acts 14:15), not gods. Look past the men to the One who made the sea and all that is therein.'),
  ('canon', 'acts', 14, 15, 'apocrypha', 'the-wisdom-of-solomon', 13, 1, 'extras', E'*Surely vain are all men by nature, who are ignorant of Yahuah (God), and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* (Wisdom of Solomon 13:1). The Lystrans'' error is named precisely here: they *deemed either fire, or wind … or the lights of heaven, to be the gods which govern the world* (Wisdom of Solomon 13:2), not knowing the workmaster. Paul calls them off it — *turn from these vanities unto the living Elohim (God), which made heaven, and earth, and the sea* (Acts 14:15) — back from the made things to the One who made them, *the first author of beauty* who *has created them* (Wisdom of Solomon 13:3).'),
  -- thread: acts-14-he-left-not-himself-without-witness-the-heavens-declare-his-glory
  ('canon', 'acts', 14, 17, 'canon', 'psalms', 19, 1, 'free', E'*The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalms 19:1). Paul tells the Lystrans that the living Elohim (God) *left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness* (Acts 14:17). The witness Paul names is the psalm''s witness: the heavens that *declare the glory of Elohim (God),* the day-and-night speech that goes out to all — *there is no speech nor language, where their voice is not heard* (Psalms 19:3). The rain and the fruitful seasons are that same testimony in the soil, the Maker''s witness left for every nation to read.'),
  -- thread: acts-14-through-much-tribulation-enter-into-the-kingdom-of-god
  ('canon', 'acts', 14, 22, 'canon', 'john', 16, 33, 'free', E'*These things I have spoken unto you, that in me ye might have peace. In the world ye shall have tribulation: but be of good cheer; I have overcome the world.* (John 16:33). Paul and Barnabas return *confirming the souls of the disciples, and exhorting them to continue in the faith, and that we must through much tribulation enter into the kingdom of Elohim (God)* (Acts 14:22). It is the Master''s own word made the road map: *in the world ye shall have tribulation* is not the abolition of the kingdom but the way into it — the tribulation borne and the kingdom entered together, *be of good cheer; I have overcome the world.*'),
  ('canon', 'acts', 14, 22, 'canon', '2-timothy', 3, 11, 'free', E'*Persecutions, afflictions, which came unto me at Antioch, at Iconium, at Lystra; what persecutions I endured: but out of them all Yahuah (Lord) delivered me.* (2 Timothy 3:11). Paul names the very cities of this chapter — Antioch, Iconium, Lystra, where *having stoned Paul, drew him out of the city, supposing he had been dead* (Acts 14:19) — as the persecutions out of which Yahuah (Lord) delivered him. The man who rose up from the stoning and went on to preach is the man teaching the disciples *that we must through much tribulation enter into the kingdom of Elohim (God)* (Acts 14:22); he had walked the road he names.'),
  ('canon', 'acts', 14, 22, 'canon', '2-timothy', 3, 12, 'free', E'*Yea, and all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution.* (2 Timothy 3:12). The exhortation at Lystra is no special hardship but the common road: *we must through much tribulation enter into the kingdom of Elohim (God)* (Acts 14:22), for *all that will live godly … shall suffer persecution.* The tribulation is not a sign the kingdom has failed; it is the path the godly walk into it — the stoning at Lystra and the rising the next day are the pattern, not the exception.'),
  ('canon', 'acts', 14, 22, 'canon', 'daniel', 7, 18, 'free', E'*But the saints of the most High shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* (Daniel 7:18). The kingdom the disciples are told they must *through much tribulation enter into* (Acts 14:22) is the kingdom Daniel saw given after the beasts and the war of the horn: *the saints of the most High shall take the kingdom, and possess the kingdom for ever.* The tribulation precedes the possessing — *the same horn made war with the saints, and prevailed against them* (Daniel 7:21) — yet the everlasting kingdom is theirs in the end.'),
  ('canon', 'acts', 14, 22, 'canon', 'daniel', 7, 27, 'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the most High, whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). The *kingdom of Elohim (God)* the disciples enter through much tribulation (Acts 14:22) is this everlasting kingdom *given to the people of the saints of the most High.* The much tribulation is the road through the night of the beasts; the destination is the kingdom that *shall not be destroyed,* where *all dominions shall serve and obey him.*'),
  -- thread: acts-14-the-door-of-faith-and-the-tabernacle-of-david-the-gathering
  ('canon', 'acts', 14, 27, 'canon', 'amos', 9, 11, 'free', E'*In that day will I raise up the tabernacle of David that is fallen, and close up the breaches thereof; and I will raise up his ruins, and I will build it as in the days of old:* (Amos 9:11). When Paul and Barnabas rehearse *how he had opened the door of faith unto the Gentiles* (Acts 14:27), the door is the one Amos named: the raising again of the fallen tabernacle of David, the gathering of the scattered house. The opened door is not a new people spliced in but the breaches of David''s house closed up — the dispersed seed living among the nations brought back through the door of faith into the building Elohim (God) is raising as in the days of old.'),
  ('canon', 'acts', 14, 27, 'apocrypha', 'tobit', 13, 5, 'extras', E'*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* (Tobit 13:5). The *door of faith* opened *unto the Gentiles* (Acts 14:27) is the door of this gathering: the Elohim (God) who *has scattered us among them* (Tobit 13:3) is the same who *will gather us out of all nations.* The ones coming in through the door are the scattered being gathered home — the captives among the nations made nigh, *if you turn to him with your whole heart … then will he turn to you* (Tobit 13:6), the hearing revealing the seed that was always his.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-14-then-shall-the-lame-man-leap-as-an-hart-the-cripple-at-lystra-healed',
       E'Then shall the lame man leap as an hart — the cripple at Lystra healed',
       E'At Lystra Paul sees *a certain man … impotent in his feet, being a cripple from his mother''s womb, who never had walked* (Acts 14:8), and *perceiving that he had faith to be healed* (Acts 14:9), says *with a loud voice, Stand upright on thy feet. And he leaped and walked* (Acts 14:10). The leaping feet are the sign Isaiah named of the coming of the Saviour: *behold, your Elohim (God) will come with vengeance … he will come and save you* (Isaiah 35:4), and *then shall the lame man leap as an hart, and the tongue of the dumb sing* (Isaiah 35:6). The same sign had opened the gospel at the temple gate, where a man *lame from his mother''s womb* was told *In the name of Yahusha HaMashiach (Jesus Christ) of Nazareth rise up and walk* (Acts 3:6), and *he leaping up stood, and walked … praising Elohim (God)* (Acts 3:8). Twice the lame leap as Isaiah foretold — once in Yerushalayim, once in Lycaonia — and twice the disclaimer is the same: not *by our own power or holiness* (Acts 3:12). The crowd at Lystra would make the men into gods; the sign was never about the men, but about the One who came to save, working through his sent ones.',
       sv.verse_id, ev.verse_id, 'free', 5600
  FROM _s217_a14_lookup sv, _s217_a14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-14-turn-from-these-vanities-unto-the-living-god-which-made-heaven-and-earth',
       E'Turn from these vanities unto the living Elohim (God), which made heaven and earth',
       E'When the priest of Jupiter brings oxen and garlands to sacrifice to them, Barnabas and Paul *rent their clothes, and ran in among the people, crying out* (Acts 14:14), *Sirs, why do ye these things? We also are men of like passions with you, and preach unto you that ye should turn from these vanities unto the living Elohim (God), which made heaven, and earth, and the sea, and all things that are therein* (Acts 14:15). This is the Tanakh''s own polemic against the idols, set in Paul''s mouth. Jeremiah gave the test plainly: *the gods that have not made the heavens and the earth, even they shall perish from the earth* (Jeremiah 10:11) — the made-thing is not the god; the Maker alone is the living Elohim (God). The psalm gives the same confession Paul preaches almost word for word — the help is not in *the son of Adam, in whom there is no help* (Psalms 146:3) but in the One *which made heaven, and earth, the sea, and all that therein is* (Psalms 146:6). And Wisdom names the Lystrans'' very error: those *who … could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster* (Wisdom of Solomon 13:1), taking *the lights of heaven, to be the gods which govern the world* (Wisdom of Solomon 13:2). Paul calls them back from the made things to the Maker — not to worship men or stars, but the living Elohim (God) who made them all.',
       sv.verse_id, ev.verse_id, 'extras', 5603
  FROM _s217_a14_lookup sv, _s217_a14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=14 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-14-he-left-not-himself-without-witness-the-heavens-declare-his-glory',
       E'He left not himself without witness — the heavens declare his glory',
       E'Paul tells the Lystrans that the living Elohim (God) *in times past suffered all nations to walk in their own ways* (Acts 14:16) — yet *he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness* (Acts 14:17). The witness was never silent. It is the witness the psalm sings: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalms 19:1), the day-and-night speech that reaches every nation — *there is no speech nor language, where their voice is not heard* (Psalms 19:3). The rain on the field and the fruitful seasons are that same testimony written into the soil and the sky, the Maker''s good gift left for all to read, so that none of the nations he suffered to walk their own ways was ever without his witness pointing them home to the One who made and feeds them.',
       sv.verse_id, ev.verse_id, 'free', 5606
  FROM _s217_a14_lookup sv, _s217_a14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=14 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-14-through-much-tribulation-enter-into-the-kingdom-of-god',
       E'Through much tribulation enter into the kingdom of Elohim (God)',
       E'Paul is stoned at Lystra and drawn out *supposing he had been dead* (Acts 14:19), yet *as the disciples stood round about him, he rose up, and came into the city* (Acts 14:20). Then he and Barnabas return through the same hostile cities, *confirming the souls of the disciples, and exhorting them to continue in the faith, and that we must through much tribulation enter into the kingdom of Elohim (God)* (Acts 14:22). The man who says it had just walked it. He names these very cities later: *Persecutions, afflictions, which came unto me at Antioch, at Iconium, at Lystra … but out of them all Yahuah (Lord) delivered me* (2 Timothy 3:11), and gives the rule plainly — *all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution* (2 Timothy 3:12). It is the Master''s own word: *in the world ye shall have tribulation: but be of good cheer; I have overcome the world* (John 16:33). The tribulation is not the failure of the kingdom but the road into it. And the kingdom entered is the everlasting one Daniel saw given after the night of the beasts and the war of the horn: *the saints of the most High shall take the kingdom, and possess the kingdom for ever* (Daniel 7:18), the kingdom *given to the people of the saints of the most High, whose kingdom is an everlasting kingdom* (Daniel 7:27). Much tribulation now; the everlasting kingdom at the end of the road.',
       sv.verse_id, ev.verse_id, 'free', 5609
  FROM _s217_a14_lookup sv, _s217_a14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=14 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-14-the-door-of-faith-and-the-tabernacle-of-david-the-gathering',
       E'The door of faith and the tabernacle of David — the gathering',
       E'Come back to Antioch, Paul and Barnabas *gathered the church together* and *rehearsed all that Elohim (God) had done with them, and how he had opened the door of faith unto the Gentiles* (Acts 14:27). The door is the one the prophets named — not a new people spliced into Yashar''el (Israel) by confession, but the raising again of the fallen house: *In that day will I raise up the tabernacle of David that is fallen, and close up the breaches thereof … and I will build it as in the days of old* (Amos 9:11). The breaches of David''s house are the scattered seed dispersed among the nations; the opened door is their way home. Tobit, praying out of captivity, named the same gathering: the Elohim (God) who *has scattered us among them* (Tobit 13:3) is the One who *will gather us out of all nations, among whom he has scattered us* (Tobit 13:5) — *if you turn to him with your whole heart … then will he turn to you* (Tobit 13:6). The door of faith is the door of the gathering: the dispersed of Yashar''el (Israel), living as the nations, hearing and turning and coming home — the hearing revealing the seed that was his from the days of old.',
       sv.verse_id, ev.verse_id, 'extras', 5612
  FROM _s217_a14_lookup sv, _s217_a14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=14 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-14-then-shall-the-lame-man-leap-as-an-hart-the-cripple-at-lystra-healed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:6 — *then shall the lame man leap as an hart* the sign of the Saviour''s coming, fulfilled as the cripple *leaped and walked* (Acts 14:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-then-shall-the-lame-man-leap-as-an-hart-the-cripple-at-lystra-healed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 3:6 — *In the name of Yahusha HaMashiach (Jesus Christ) of Nazareth rise up and walk* the Beautiful-Gate word that the Lystra healing re-walks (Acts 14:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-then-shall-the-lame-man-leap-as-an-hart-the-cripple-at-lystra-healed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 3:8 — *he leaping up stood, and walked … praising Elohim (God)* the lame man''s leap at the temple gate, echoed in the cripple at Lystra (Acts 14:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-then-shall-the-lame-man-leap-as-an-hart-the-cripple-at-lystra-healed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-14-turn-from-these-vanities-unto-the-living-god-which-made-heaven-and-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:11 — *the gods that have not made the heavens and the earth … shall perish* the test against the idols Paul sets before the crowd (Acts 14:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-turn-from-these-vanities-unto-the-living-god-which-made-heaven-and-earth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 146:6 — *which made heaven, and earth, the sea, and all that therein is* the psalm''s confession Paul preaches near word for word (Acts 14:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-turn-from-these-vanities-unto-the-living-god-which-made-heaven-and-earth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:1 — *neither by considering the works did they acknowledge the workmaster* the Lystrans'' exact error, naming the stars and lights as gods (Acts 14:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-turn-from-these-vanities-unto-the-living-god-which-made-heaven-and-earth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-14-he-left-not-himself-without-witness-the-heavens-declare-his-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 19:1 — *The heavens declare the glory of Elohim (God)* the creation-witness Paul names in the rain and fruitful seasons (Acts 14:17).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-he-left-not-himself-without-witness-the-heavens-declare-his-glory'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-14-through-much-tribulation-enter-into-the-kingdom-of-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 16:33 — *in the world ye shall have tribulation: but be of good cheer; I have overcome the world* the Master''s word made the road into the kingdom (Acts 14:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-through-much-tribulation-enter-into-the-kingdom-of-god'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 3:11 — *Persecutions … at Antioch, at Iconium, at Lystra … but out of them all Yahuah (Lord) delivered me* Paul names this chapter''s own cities (Acts 14:19,22).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-through-much-tribulation-enter-into-the-kingdom-of-god'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 3:12 — *all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution* the common road, not the exception (Acts 14:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-through-much-tribulation-enter-into-the-kingdom-of-god'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:18 — *the saints of the most High shall take the kingdom, and possess the kingdom for ever* the kingdom entered through much tribulation (Acts 14:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-through-much-tribulation-enter-into-the-kingdom-of-god'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 7:27 — *the kingdom … given to the people of the saints of the most High, whose kingdom is an everlasting kingdom* the destination at the road''s end (Acts 14:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-through-much-tribulation-enter-into-the-kingdom-of-god'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-14-the-door-of-faith-and-the-tabernacle-of-david-the-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 9:11 — *I will raise up the tabernacle of David that is fallen, and close up the breaches thereof* the door of faith as the raising of David''s fallen house (Acts 14:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-the-door-of-faith-and-the-tabernacle-of-david-the-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 13:5 — *will gather us out of all nations, among whom he has scattered us* the door of faith as the gathering of the scattered home (Acts 14:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a14_lookup sv, _s217_a14_lookup tv
 WHERE t.slug='acts-14-the-door-of-faith-and-the-tabernacle-of-david-the-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=14 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_15.sql (S217 Acts 15) -----
-- =====================================================================
-- S217 minion — ACTS 15 FULL-LIBRARY cross-references (the Jerusalem Council)
-- =====================================================================
-- Anchor chapter: ACTS 15.  Tag: a15 (temp view _s217_a15_lookup).  Sort band: 5625-5646.
-- Source is ALWAYS the canon Acts 15 verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- VOICE GOVERNANCE (HIGH-RISK CHAPTER — audited hard at the voice gate):
--  * The "Gentiles" the council receives are the SCATTERED SEED / the lost sheep of the
--    house of Yashar'el (Israel) being GATHERED — the Lo-Ammi of Hosea 1 made Ammi, the
--    dispersed already named. NEVER the false-inclusion of the nations into Yashar'el by
--    faith-confession (Red Lines #7/#11).
--  * James's verdict (Acts 15:16-17) quotes Amos 9:11-12 — *I will build again the tabernacle
--    of David, which is fallen down* — read as the TWELVE-TRIBE RESTORATION, the rebuilding of
--    the fallen booth of David over BOTH houses (Hosea 1:11 — Yahudah and Yashar'el gathered,
--    one head), NOT a new-people graft. The "residue of men" / "all the Gentiles upon whom my
--    name is called" = the dispersed seed already named, sifted among all nations yet not one
--    grain lost (Amos 9:9), the scattered He gathers (Jeremiah 31:10).
--  * Acts 15:11 *we shall be saved, even as they* — grace is the means of RETURN to him and
--    his ways (the yoke of v.10 is the burden of the added fence / the failure to keep, the
--    bullock unaccustomed to the yoke who cries *turn thou me* — Jeremiah 31:18), NEVER a
--    standalone freedom-from-Torah / sola-fide formula (Red Line #10). The sentence is
--    completed: grace returns the scattered to the Torah written on the heart (Jeremiah 31:33).
--  * The four prohibitions (15:20,29) tie to the Torah's ger-among-Yashar'el statutes
--    (Leviticus 17-18 — blood, things strangled/torn, idol-pollution, fornication), the
--    covenant terms for the gathered, NOT a minimal new-covenant ethic replacing Torah. Moses
--    is still read in the synagogues every sabbath (15:21) — the rest of the Torah is taught,
--    not cancelled (Leviticus 18:5 — *which if a man do, he shall live in them*). Jubilees 6
--    witnesses the blood-prohibition as the everlasting Noahic-Sinai covenant term, not a new
--    rule (extras layer).
--  * The Judaizer error is NAMED at the council: *Except ye be circumcised … ye cannot be
--    saved* (15:1), *Ye must be circumcised, and keep the law* (15:24) — the flesh-credential
--    gospel Paul withstood at Antioch (Galatians 2:3-4,14). The yoke cast off is the added
--    fence, not the Torah.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three libraries weighed for every block):
--  ACTS 15:
--   v.1,5,24  circumcised-or-not-saved / ye must keep the law
--             Tanakh: none warranted (the error is NT-named; the Torah is its abuse, not its source)
--             Extras: none warranted
--             NT:     Galatians 2:3, Galatians 2:4, Galatians 2:14  (Paul's own account of the same fight)
--   v.7-9     Peter: no difference, purifying their hearts by faith
--             Tanakh: Ezekiel 36:25, Ezekiel 36:26  (sprinkle clean water / new heart — the cleansing of the scattered)
--             Extras: none warranted
--             NT:     Acts 10:34  (no respecter of persons — Peter's earlier seeing)
--   v.10-11   the yoke our fathers could not bear / grace, saved even as they
--             Tanakh: Jeremiah 31:18 (Ephraim, the bullock unaccustomed to the yoke, *turn thou me*); Jeremiah 31:33 (Torah written on the heart — the destination of the return)
--             Extras: none warranted
--             NT:     none added (the no-sola-fide completion carried in the prose + Jeremiah targets)
--   v.14      to take out of them a people for his name
--             Tanakh: Hosea 1:10 (Lo-Ammi made *sons of the living Elohim*); Hosea 2:23 (*Thou art my people*)
--             Extras: none warranted
--             NT:     none added (Romans 9:25-26 weighed — Paul's quotation of the same Hosea; carried thematically, the Hosea targets are load-bearing)
--   v.16-17   the tabernacle of David rebuilt / residue of men / all the Gentiles called by my name
--             Tanakh: Amos 9:11, Amos 9:12 (the verbatim quotation — the twelve-tribe restoration); Hosea 1:11 (two houses gathered, one head); Amos 9:9 (sifted among all nations, not one grain lost); Jeremiah 31:10 (He that scattered will gather)
--             Extras: none warranted
--             NT:     none added (the restoration is Tanakh-anchored)
--   v.18-19   known unto Elohim from the beginning / turned to Elohim
--             Tanakh: none added (carried in the Amos/Hosea threads — the works known from the beginning = the gathering foretold)
--             Extras: none warranted
--             NT:     none warranted
--   v.20,29   the four prohibitions (idols, fornication, things strangled, blood)
--             Tanakh: Leviticus 17:7 (no more offer to devils); Leviticus 17:10, Leviticus 17:12 (blood — the stranger among you); Leviticus 17:15 (that which died of itself / torn — things strangled); Leviticus 18:26 (abominations / fornication — the stranger that sojourneth)
--             Extras: Jubilees 6:10, Jubilees 6:13 (the everlasting blood-covenant — Noahic to Sinai, not a new rule)
--             NT:     Acts 21:25 weighed (the same decree restated) — carried thematically, the Torah/Jubilees witnesses are load-bearing
--   v.21      Moses read in the synagogues every sabbath day
--             Tanakh: Leviticus 18:5 (*which if a man do, he shall live in them* — the Torah still taught, still life)
--             Extras: none warranted
--             NT:     none warranted
--   v.22-41   the letter sent / Paul and Barnabas part
--             Tanakh: none warranted (narrative)
--             Extras: none warranted
--             NT:     none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5625 acts-15-except-ye-be-circumcised-ye-cannot-be-saved-the-judaizer-error-named  (NT)
--   5628 acts-15-put-no-difference-purifying-their-hearts-the-new-heart-of-the-scattered (Tanakh + NT)
--   5631 acts-15-the-yoke-and-the-grace-the-means-of-return-not-freedom-from-torah       (Tanakh)
--   5634 acts-15-to-take-out-a-people-for-his-name-the-lo-ammi-made-ammi                 (Tanakh)
--   5637 acts-15-the-tabernacle-of-david-fallen-rebuilt-the-twelve-tribe-restoration     (Tanakh)
--   5640 acts-15-the-residue-of-men-the-scattered-sifted-among-the-nations-gathered      (Tanakh)
--   5643 acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger  (Tanakh + Extras)
--   5646 acts-15-moses-read-every-sabbath-the-torah-still-taught-not-cancelled           (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s217_a15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-15-except-ye-be-circumcised-ye-cannot-be-saved-the-judaizer-error-named
  ('canon', 'acts', 15, 1, 'canon', 'galatians', 2, 4, 'free', E'*And that because of false brethren unawares brought in, who came in privily to spy out our liberty which we have in HaMashiach Yahusha (Christ Jesus), that they might bring us into bondage:* (Galatians 2:4). The men who *came down from Judæa* and taught *Except ye be circumcised after the manner of Moses, ye cannot be saved* (Acts 15:1) are the same false brethren Paul names — the circumcision party adding a flesh-credential as the price of salvation. The bondage is not the Torah; it is the fence built around it and made the gate of life.'),
  ('canon', 'acts', 15, 5, 'canon', 'galatians', 2, 3, 'free', E'*But neither Titus, who was with me, being a Greek, was compelled to be circumcised:* (Galatians 2:3). When *there rose up certain of the sect of the Pharisees which believed, saying, That it was needful to circumcise them, and to command them to keep the law of Moses* (Acts 15:5), the demand is exactly the one Paul refused for Titus. The gathered are not made covenant by the knife; the knife was never the door of return.'),
  ('canon', 'acts', 15, 24, 'canon', 'galatians', 2, 14, 'free', E'*But when I saw that they walked not uprightly according to the truth of the gospel, I said unto Peter before them all, If thou, being a Yahudi (Jew), livest after the manner of Gentiles, and not as do the Yahudim (Jews), why compellest thou the Gentiles to live as do the Yahudim (Jews)?* (Galatians 2:14). The council''s letter disowns the agitators: *certain which went out from us have troubled you with words, subverting your souls, saying, Ye must be circumcised, and keep the law: to whom we gave no such commandment* (Acts 15:24). The thing Paul withstood Peter to the face over is the thing the apostles now repudiate in writing — the compelling, the flesh-credential gospel, never given as commandment.'),
  -- thread: acts-15-put-no-difference-purifying-their-hearts-the-new-heart-of-the-scattered
  ('canon', 'acts', 15, 9, 'canon', 'ezekiel', 36, 25, 'free', E'*Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* (Ezekiel 36:25). Peter says Elohim (God) *put no difference between us and them, purifying their hearts by faith* (Acts 15:9). The purifying is the very cleansing Yahuah (LORD) promised the scattered house — the sprinkling of clean water on those gathered *from among the heathen* (Ezekiel 36:24). The hearts cleansed are the hearts of the dispersed seed being brought home, not strangers made covenant by confession.'),
  ('canon', 'acts', 15, 9, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). The heart *purif[ied] … by faith* (Acts 15:9) is the new heart Yahuah (LORD) swore to give the house of Yashar''el (Israel) — and the new spirit that comes with it does not lead away from the Torah but *cause[s] you to walk in my statutes* (Ezekiel 36:27). The faith and the new heart are the means of the return, not its replacement.'),
  ('canon', 'acts', 15, 8, 'canon', 'acts', 10, 34, 'free', E'*Then Peter opened his mouth, and said, Of a truth I perceive that Elohim (God) is no respecter of persons:* (Acts 10:34). Peter testifies that Elohim (God), *which knoweth the hearts, bare them witness, giving them the Ruach HaKodesh (Holy Spirit), even as he did unto us* (Acts 15:8). He had already seen it in the house of Cornelius: the Spirit fell on the gathered of the dispersion as it fell at the first, for the Father reads hearts and knows his own scattered sheep wherever they were sown.'),
  -- thread: acts-15-the-yoke-and-the-grace-the-means-of-return-not-freedom-from-torah
  ('canon', 'acts', 15, 10, 'canon', 'jeremiah', 31, 18, 'free', E'*I have surely heard Ephraim bemoaning himself thus; Thou hast chastised me, and I was chastised, as a bullock unaccustomed to the yoke: turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God).* (Jeremiah 31:18). Peter asks *why tempt ye Elohim (God), to put a yoke upon the neck of the disciples, which neither our fathers nor we were able to bear?* (Acts 15:10). The yoke none could bear is the burden of the added fence and the failure to keep — not the Torah itself; for Ephraim, the scattered northern house, is the very son who cries *turn thou me, and I shall be turned.* The cry of the bullock unaccustomed to the yoke is the cry of the gathering, and the answer is grace that turns him home.'),
  ('canon', 'acts', 15, 11, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). *We believe that through the grace of the Lord Yahusha HaMashiach (Lord Jesus Christ) we shall be saved, even as they* (Acts 15:11) — and the grace is the means by which the Torah is written on the inward parts, not a release from it. Saved even as they: the scattered and the near alike returned to the covenant law set in the heart. The sentence the council speaks is completed in the prophet — grace is the homecoming to his ways.'),
  -- thread: acts-15-to-take-out-a-people-for-his-name-the-lo-ammi-made-ammi
  ('canon', 'acts', 15, 14, 'canon', 'hosea', 1, 10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). James says Elohim (God) *did visit the Gentiles, to take out of them a people for his name* (Acts 15:14). The people taken out are the Lo-Ammi — those to whom it was said *ye are not my people* — now in the very place of their scattering called *the sons of the living Elohim (God).* Not a new people named, but the named-and-forgotten seed made to hear what was always true.'),
  ('canon', 'acts', 15, 14, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). To *take out of them a people for his name* (Acts 15:14) is to do what Yahuah (LORD) sowed and swore — *I will say to them which were not my people, Thou art my people.* The dispersed seed sown into the earth among the nations is reaped back as Ammi, the people of his name, the mercy given to her that had not obtained mercy.'),
  -- thread: acts-15-the-tabernacle-of-david-fallen-rebuilt-the-twelve-tribe-restoration
  ('canon', 'acts', 15, 16, 'canon', 'amos', 9, 11, 'free', E'*In that day will I raise up the tabernacle of David that is fallen, and close up the breaches thereof; and I will raise up his ruins, and I will build it as in the days of old:* (Amos 9:11). James reads the prophets: *After this I will return, and will build again the tabernacle of David, which is fallen down; and I will build again the ruins thereof, and I will set it up* (Acts 15:16). The fallen booth of David is the broken kingdom of the twelve tribes, torn in two at Jeroboam; its rebuilding is the restoration of both houses under David''s greater Son — built again *as in the days of old,* before the breach. This is the twelve-tribe gathering, not a new house raised in Yashar''el''s place.'),
  ('canon', 'acts', 15, 17, 'canon', 'amos', 9, 12, 'free', E'*That they may possess the remnant of Edom, and of all the heathen, which are called by my name, saith Yahuah (LORD) that doeth this.* (Amos 9:12). James continues: *That the residue of men might seek after Yahuah (Lord), and all the Gentiles, upon whom my name is called, saith Yahuah (Lord), who doeth all these things* (Acts 15:17). The ones *upon whom my name is called* are not the nations made covenant by belief; they are the dispersed already named — sown among the heathen, scattered into the lands of Edom and beyond, yet bearing his name still, now possessed back into the rebuilt house of David.'),
  ('canon', 'acts', 15, 16, 'canon', 'hosea', 1, 11, 'free', E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* (Hosea 1:11). The rebuilt *tabernacle of David, which is fallen down* (Acts 15:16) is the two houses made one again — *the children of Yahudah (Judah) and the children of Yashar''el (Israel)* gathered together under one head. The booth of David fell when the kingdom split; it is raised when the split is healed and Yahudah and Yosef appoint themselves one head, David''s Son, and come up together.'),
  -- thread: acts-15-the-residue-of-men-the-scattered-sifted-among-the-nations-gathered
  ('canon', 'acts', 15, 17, 'canon', 'amos', 9, 9, 'free', E'*For, lo, I will command, and I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve, yet shall not the least grain fall upon the earth.* (Amos 9:9). The same prophet whose tabernacle-of-David verse James quotes also names how the *residue of men* (Acts 15:17) came to be scattered *among all the Gentiles:* Yahuah (LORD) sifted the house of Yashar''el (Israel) among all nations like corn in a sieve — yet not the least grain lost. The scattering was a sifting, not an abandoning; every grain of the seed is kept, and James sees them now sought after and possessed back.'),
  ('canon', 'acts', 15, 17, 'canon', 'jeremiah', 31, 10, 'free', E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* (Jeremiah 31:10). That *all the Gentiles, upon whom my name is called* should *seek after Yahuah (Lord)* (Acts 15:17) is the gathering Jeremiah declared to the nations and the isles afar off: *He that scattered Yashar''el (Israel) will gather him.* The One who scattered the seed among the nations is the Shepherd who gathers it; the council is watching the scattered flock answer the Shepherd''s voice.'),
  -- thread: acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger
  ('canon', 'acts', 15, 20, 'canon', 'leviticus', 17, 7, 'free', E'*And they shall no more offer their sacrifices unto devils, after whom they have gone a whoring. This shall be a statute for ever unto them throughout their generations.* (Leviticus 17:7). The first of the four — *that they abstain from pollutions of idols* (Acts 15:20) — is no new ethic but the *statute for ever* given in the Torah: turn from the sacrifices offered to devils. The gathered are bound to the same covenant terms the Torah set for all who dwell in the house, the foundation on which the rest of the instruction is built.'),
  ('canon', 'acts', 15, 29, 'canon', 'leviticus', 17, 10, 'free', E'*And whatsoever man there be of the house of Yashar''el (Israel), or of the strangers that sojourn among you, that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people.* (Leviticus 17:10). *That ye abstain from … blood* (Acts 15:29) is the Torah''s own statute, spoken expressly over *the house of Yashar''el (Israel)* and *the strangers that sojourn among you* alike. The council lays no new burden; it names the ancient covenant term that binds the native-born and the sojourner together in one house.'),
  ('canon', 'acts', 15, 29, 'canon', 'leviticus', 17, 12, 'free', E'*Therefore I said unto the children of Yashar''el (Israel), No soul of you shall eat blood, neither shall any stranger that sojourneth among you eat blood.* (Leviticus 17:12). The decree *that ye abstain from … blood* (Acts 15:29) repeats word for the Torah''s word: *No soul of you shall eat blood, neither shall any stranger that sojourneth among you eat blood.* One law for the home-born and the stranger — the same one-house statute the apostles set over the gathered.'),
  ('canon', 'acts', 15, 29, 'canon', 'leviticus', 17, 15, 'free', E'*And every soul that eateth that which died of itself, or that which was torn with beasts, whether it be one of your own country, or a stranger, he shall both wash his clothes, and bathe himself in water, and be unclean until the even: then shall he be clean.* (Leviticus 17:15). *Things strangled* (Acts 15:29) — flesh whose blood was never poured out — falls under the Torah''s statute of that which *died of itself, or … was torn with beasts,* binding *one of your own country, or a stranger* alike. The prohibition is the Torah''s, given for the home-born and the sojourner in the one congregation.'),
  ('canon', 'acts', 15, 20, 'canon', 'leviticus', 18, 26, 'free', E'*Ye shall therefore keep my statutes and my judgments, and shall not commit any of these abominations; neither any of your own nation, nor any stranger that sojourneth among you:* (Leviticus 18:26). *Fornication* (Acts 15:20) heads the list of *these abominations* the Torah forbids to *any of your own nation, nor any stranger that sojourneth among you.* The four prohibitions are drawn straight from the statutes the Torah lays equally on the native-born and the ger — the covenant terms of the one house into which the scattered are gathered.'),
  ('canon', 'acts', 15, 29, 'jubilees', 'jubilees', 6, 10, 'extras', E'*And Noah and his sons swore that they would not eat any blood that was in any flesh, and he made a covenant before Yahuah Elohim (the LORD God) for ever throughout all the generations of the earth in this month.* (Jubilees 6:10). When the council writes *that ye abstain from … blood* (Acts 15:29), it stands on a covenant older than Sinai itself — the oath Noah and his sons swore *for ever throughout all the generations of the earth.* The blood-statute is no apostolic invention; it is the everlasting term of the covenant, carried from Noah to Sinai to the gathered.'),
  ('canon', 'acts', 15, 29, 'jubilees', 'jubilees', 6, 13, 'extras', E'*And do you command the children of Yashar''el (Israel) to eat no blood, so that their names and their seed may be before Yahuah our Elohim (the LORD our God) continually.* (Jubilees 6:13). The abstaining from blood (Acts 15:29) keeps the *names and … seed* of Yashar''el (Israel) *before Yahuah our Elohim (the LORD our God) continually* — the very purpose the everlasting statute names. The decree over the gathered is the keeping of the seed before the Father, the covenant term that holds the scattered in their lineage and their name.'),
  -- thread: acts-15-moses-read-every-sabbath-the-torah-still-taught-not-cancelled
  ('canon', 'acts', 15, 21, 'canon', 'leviticus', 18, 5, 'free', E'*Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* (Leviticus 18:5). The four prohibitions are not the whole of the walk — *For Moses of old time hath in every city them that preach him, being read in the synagogues every sabbath day* (Acts 15:21). The rest of the Torah is not cancelled but taught, Sabbath by Sabbath, the statutes and judgments *which if a man do, he shall live in them.* The gathered begin with the covenant''s threshold terms and learn the whole instruction where it has always been read.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-15-except-ye-be-circumcised-ye-cannot-be-saved-the-judaizer-error-named',
       E'Except ye be circumcised, ye cannot be saved — the Judaizer error named',
       E'The council opens with the lie laid bare: *certain men which came down from Judæa taught the brethren, and said, Except ye be circumcised after the manner of Moses, ye cannot be saved* (Acts 15:1), and *there rose up certain of the sect of the Pharisees which believed, saying, That it was needful to circumcise them, and to command them to keep the law of Moses* (Acts 15:5). This is the flesh-credential gospel — be cut, perform the works of the circumcision party, and then you are counted in. It is the same fight Paul had already fought: *neither Titus, who was with me, being a Greek, was compelled to be circumcised* (Galatians 2:3), against *false brethren unawares brought in, who came in privily to spy out our liberty which we have in HaMashiach Yahusha (Christ Jesus), that they might bring us into bondage* (Galatians 2:4), and Paul withstood Peter to the face: *why compellest thou the Gentiles to live as do the Yahudim (Jews)?* (Galatians 2:14). The council ends by disowning the agitators in writing: *certain which went out from us have troubled you with words, subverting your souls, saying, Ye must be circumcised, and keep the law: to whom we gave no such commandment* (Acts 15:24). The bondage was never the Torah; it was the fence built around it and set up as the gate of salvation. The knife was never the door of return.',
       sv.verse_id, ev.verse_id, 'free', 5625
  FROM _s217_a15_lookup sv, _s217_a15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=15 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-15-put-no-difference-purifying-their-hearts-the-new-heart-of-the-scattered',
       E'Put no difference, purifying their hearts — the new heart of the scattered',
       E'Peter rises and tells how Elohim (God), *which knoweth the hearts, bare them witness, giving them the Ruach HaKodesh (Holy Spirit), even as he did unto us; and put no difference between us and them, purifying their hearts by faith* (Acts 15:8-9). He had already perceived it in the house of Cornelius: *Of a truth I perceive that Elohim (God) is no respecter of persons* (Acts 10:34). The Father reads hearts, and he knows his own scattered sheep wherever they were sown. And the purifying Peter names is the very cleansing Yahuah (LORD) swore to the dispersed house: *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25), *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). The new heart is not given against the Torah — the new spirit comes precisely to *cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The hearts purified by faith are the hearts of the scattered seed gathered home, cleansed and given the heart of flesh that keeps the covenant, not strangers made covenant by a confession.',
       sv.verse_id, ev.verse_id, 'free', 5628
  FROM _s217_a15_lookup sv, _s217_a15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-15-the-yoke-and-the-grace-the-means-of-return-not-freedom-from-torah',
       E'The yoke and the grace — the means of return, not freedom from Torah',
       E'Peter asks, *Now therefore why tempt ye Elohim (God), to put a yoke upon the neck of the disciples, which neither our fathers nor we were able to bear?* (Acts 15:10), and concludes, *But we believe that through the grace of the Lord Yahusha HaMashiach (Lord Jesus Christ) we shall be saved, even as they* (Acts 15:11). The yoke none could bear is not the Torah of Yahuah (LORD) — it is the burden of the added fence and the unbearable weight of the failure to keep, the exile-broken condition of a people who could not turn themselves. Hear it in Ephraim, the scattered northern house: *Thou hast chastised me, and I was chastised, as a bullock unaccustomed to the yoke: turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God)* (Jeremiah 31:18). The cry of the bullock unaccustomed to the yoke is the cry of the gathering — *turn thou me* — and grace is the answer that turns him. Saved *even as they:* the scattered and the near alike returned by grace to the covenant. And the destination of that return is not lawlessness but the Torah set in the heart: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Grace is the means of the homecoming to his ways — never a release from them.',
       sv.verse_id, ev.verse_id, 'free', 5631
  FROM _s217_a15_lookup sv, _s217_a15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=15 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-15-to-take-out-a-people-for-his-name-the-lo-ammi-made-ammi',
       E'To take out a people for his name — the Lo-Ammi made Ammi',
       E'James begins his verdict: *Simeon hath declared how Elohim (God) at the first did visit the Gentiles, to take out of them a people for his name* (Acts 15:14). The people taken out are not a people newly made; they are a people long named and long forgotten — the Lo-Ammi of Hosea. To Hosea''s third child Yahuah (LORD) said *Call his name Lo-ammi: for ye are not my people* (Hosea 1:9), and then, in the same breath, the promise: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). It is sworn again: *I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). To *take out … a people for his name* is to reap back the seed that was sown among the nations — Ammi, the people of his name, the mercy given to her that had not obtained mercy. Not a new people installed in Yashar''el''s place, but the named-and-scattered seed made at last to hear what was always true of them.',
       sv.verse_id, ev.verse_id, 'free', 5634
  FROM _s217_a15_lookup sv, _s217_a15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=15 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-15-the-tabernacle-of-david-fallen-rebuilt-the-twelve-tribe-restoration',
       E'The tabernacle of David, fallen, rebuilt — the twelve-tribe restoration',
       E'James grounds the whole verdict in the prophets: *And to this agree the words of the prophets; as it is written, After this I will return, and will build again the tabernacle of David, which is fallen down; and I will build again the ruins thereof, and I will set it up* (Acts 15:16). He is quoting Amos: *In that day will I raise up the tabernacle of David that is fallen, and close up the breaches thereof; and I will raise up his ruins, and I will build it as in the days of old* (Amos 9:11). The fallen booth of David is the kingdom of the twelve tribes, torn in two when the north broke from the south; its rebuilding *as in the days of old* is the healing of that breach — both houses raised again under David''s greater Son. Hosea names the same day: *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land* (Hosea 1:11). And James reads on: *That the residue of men might seek after Yahuah (Lord), and all the Gentiles, upon whom my name is called* (Acts 15:17) — Amos''s *remnant of Edom, and of all the heathen, which are called by my name* (Amos 9:12). The ones upon whom his name is called are not the nations made covenant by belief; they are the dispersed already named — sown among the heathen, scattered into far lands, yet bearing his name still — now possessed back into the rebuilt house of David. This is the twelve-tribe gathering, the restoration the prophets swore, never a new house raised in Yashar''el''s place.',
       sv.verse_id, ev.verse_id, 'free', 5637
  FROM _s217_a15_lookup sv, _s217_a15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=15 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-15-the-residue-of-men-the-scattered-sifted-among-the-nations-gathered',
       E'The residue of men — the scattered sifted among the nations, gathered',
       E'When James says *That the residue of men might seek after Yahuah (Lord), and all the Gentiles, upon whom my name is called, saith Yahuah (Lord), who doeth all these things* (Acts 15:17), he names a residue that exists because of a scattering already prophesied. The same Amos whose tabernacle-of-David verse James quotes had said how the seed came to be among all nations: *For, lo, I will command, and I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve, yet shall not the least grain fall upon the earth* (Amos 9:9). The dispersion was a sifting, not an abandoning — every grain of the seed kept, not one lost. And the gathering was sworn to the nations and the isles afar off where that seed was sown: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). The One who sifted the house among the nations is the Shepherd who gathers it; the *residue of men … upon whom my name is called* are the scattered grain answering the Shepherd''s voice, sought after and possessed back into the house being rebuilt.',
       sv.verse_id, ev.verse_id, 'free', 5640
  FROM _s217_a15_lookup sv, _s217_a15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=15 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger',
       E'Abstain from blood and things strangled — the covenant terms for the ger',
       E'The council''s four prohibitions are no minimal new-covenant ethic replacing the Torah — they are the Torah''s own statutes for all who dwell in the one house, native-born and sojourner alike. *That they abstain from pollutions of idols* (Acts 15:20) is the statute for ever: *they shall no more offer their sacrifices unto devils, after whom they have gone a whoring. This shall be a statute for ever unto them throughout their generations* (Leviticus 17:7). *Fornication* heads the abominations the Torah forbids to *any of your own nation, nor any stranger that sojourneth among you* (Leviticus 18:26). *Blood* is the Torah''s express statute over *the house of Yashar''el (Israel), or … the strangers that sojourn among you* alike: *No soul of you shall eat blood, neither shall any stranger that sojourneth among you eat blood* (Leviticus 17:12; cf. 17:10). And *things strangled* — flesh whose blood was never poured out — falls under the statute of *that which died of itself, or … was torn with beasts, whether it be one of your own country, or a stranger* (Leviticus 17:15). The blood-term is older even than Sinai: *Noah and his sons swore that they would not eat any blood that was in any flesh, and he made a covenant before Yahuah Elohim (the LORD God) for ever throughout all the generations of the earth* (Jubilees 6:10), *that their names and their seed may be before Yahuah our Elohim (the LORD our God) continually* (Jubilees 6:13). The apostles lay no new burden; they name the ancient covenant terms — Noahic to Sinai to the gathered — that bind the home-born and the sojourner together in one congregation, the threshold of the one house into which the scattered are received.',
       sv.verse_id, ev.verse_id, 'extras', 5643
  FROM _s217_a15_lookup sv, _s217_a15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=15 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-15-moses-read-every-sabbath-the-torah-still-taught-not-cancelled',
       E'Moses read every sabbath — the Torah still taught, not cancelled',
       E'The council does not end the four prohibitions with a closed list, as if the rest of the Torah were now void. James adds the reason the letter need name only the threshold terms: *For Moses of old time hath in every city them that preach him, being read in the synagogues every sabbath day* (Acts 15:21). The whole instruction is not cancelled but taught — Sabbath after Sabbath, in every city, where it has always been read. And what is read there is life, not bondage: *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5). The gathered begin at the covenant''s threshold — turn from idols, from blood, from things strangled, from fornication — and then learn the rest of the Father''s instruction in its appointed place, on the day he hallowed. The decree opens the door; the synagogue Sabbath keeps teaching the way home.',
       sv.verse_id, ev.verse_id, 'free', 5646
  FROM _s217_a15_lookup sv, _s217_a15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=15 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-15-except-ye-be-circumcised-ye-cannot-be-saved-the-judaizer-error-named
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 2:4 — *false brethren … came in privily to spy out our liberty … that they might bring us into bondage* the same circumcision party Paul names, demanding the flesh-credential at the council (Acts 15:1).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-except-ye-be-circumcised-ye-cannot-be-saved-the-judaizer-error-named'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 2:3 — *neither Titus … being a Greek, was compelled to be circumcised* the demand Paul refused, now raised by the Pharisee party at the council (Acts 15:5).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-except-ye-be-circumcised-ye-cannot-be-saved-the-judaizer-error-named'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 2:14 — *why compellest thou the Gentiles to live as do the Yahudim (Jews)?* the compelling the council repudiates in writing: *to whom we gave no such commandment* (Acts 15:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-except-ye-be-circumcised-ye-cannot-be-saved-the-judaizer-error-named'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-15-put-no-difference-purifying-their-hearts-the-new-heart-of-the-scattered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 10:34 — *Of a truth I perceive that Elohim (God) is no respecter of persons* Peter''s earlier seeing; the Father reads hearts and knows his scattered (Acts 15:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-put-no-difference-purifying-their-hearts-the-new-heart-of-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:25 — *Then will I sprinkle clean water upon you, and ye shall be clean* the cleansing of the scattered gathered from among the heathen, the purifying Peter names (Acts 15:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-put-no-difference-purifying-their-hearts-the-new-heart-of-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *A new heart also will I give you … and I will give you an heart of flesh* the heart purified by faith is the new heart of the gathered, which keeps the statutes (Ezekiel 36:27; Acts 15:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-put-no-difference-purifying-their-hearts-the-new-heart-of-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-15-the-yoke-and-the-grace-the-means-of-return-not-freedom-from-torah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:18 — *as a bullock unaccustomed to the yoke: turn thou me, and I shall be turned* Ephraim, the scattered north; the yoke none could bear and the cry grace answers (Acts 15:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-the-yoke-and-the-grace-the-means-of-return-not-freedom-from-torah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the destination of the return; grace saves *even as they* unto the Torah on the heart (Acts 15:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-the-yoke-and-the-grace-the-means-of-return-not-freedom-from-torah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-15-to-take-out-a-people-for-his-name-the-lo-ammi-made-ammi
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 1:10 — *in the place where it was said … Ye are not my people, there … Ye are the sons of the living Elohim (God)* the Lo-Ammi made the people for his name (Acts 15:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-to-take-out-a-people-for-his-name-the-lo-ammi-made-ammi'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 2:23 — *I will say to them which were not my people, Thou art my people* the dispersed seed sown among the nations reaped back as Ammi (Acts 15:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-to-take-out-a-people-for-his-name-the-lo-ammi-made-ammi'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-15-the-tabernacle-of-david-fallen-rebuilt-the-twelve-tribe-restoration
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 9:11 — *In that day will I raise up the tabernacle of David that is fallen, and close up the breaches thereof* the verse James quotes; the booth of David torn in two, rebuilt as in the days of old (Acts 15:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-the-tabernacle-of-david-fallen-rebuilt-the-twelve-tribe-restoration'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 1:11 — *the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* the rebuilt booth is the two houses made one (Acts 15:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-the-tabernacle-of-david-fallen-rebuilt-the-twelve-tribe-restoration'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 9:12 — *the remnant of Edom, and of all the heathen, which are called by my name* the residue upon whom his name is called: the dispersed already named, possessed back (Acts 15:17).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-the-tabernacle-of-david-fallen-rebuilt-the-twelve-tribe-restoration'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-15-the-residue-of-men-the-scattered-sifted-among-the-nations-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 9:9 — *I will sift the house of Yashar''el (Israel) among all nations … yet shall not the least grain fall* the scattering of the residue was a sifting, not an abandoning (Acts 15:17).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-the-residue-of-men-the-scattered-sifted-among-the-nations-gathered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:10 — *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* the residue seeking him is the scattered grain answering the Shepherd (Acts 15:17).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-the-residue-of-men-the-scattered-sifted-among-the-nations-gathered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 17:7 — *they shall no more offer their sacrifices unto devils … a statute for ever* the pollutions of idols: the Torah''s own everlasting statute (Acts 15:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 18:26 — *neither any of your own nation, nor any stranger that sojourneth among you* fornication heads the abominations forbidden to home-born and ger alike (Acts 15:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 17:10 — *that eateth any manner of blood; I will even set my face against that soul* the blood-statute over Yashar''el and the sojourner alike (Acts 15:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 17:12 — *No soul of you shall eat blood, neither shall any stranger that sojourneth among you eat blood* one law for the home-born and the stranger (Acts 15:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Leviticus 17:15 — *that which died of itself, or … was torn with beasts, whether it be one of your own country, or a stranger* the statute behind *things strangled* (Acts 15:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 6:10 — *Noah and his sons swore that they would not eat any blood … a covenant before Yahuah Elohim (the LORD God) for ever* the blood-term older than Sinai (Acts 15:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=29
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Jubilees 6:13 — *command the children of Yashar''el (Israel) to eat no blood, so that their names and their seed may be before Yahuah our Elohim (the LORD our God) continually* the blood-statute keeps the seed before the Father (Acts 15:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=29
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-15-moses-read-every-sabbath-the-torah-still-taught-not-cancelled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:5 — *keep my statutes, and my judgments: which if a man do, he shall live in them* what is read in the synagogues every sabbath is life, not bondage (Acts 15:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a15_lookup sv, _s217_a15_lookup tv
 WHERE t.slug='acts-15-moses-read-every-sabbath-the-torah-still-taught-not-cancelled'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=15 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_16.sql (S217 Acts 16) -----
-- =====================================================================
-- S217 minion — ACTS 16 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ACTS 16.  Tag: a16 (temp view _s217_a16_lookup).  Sort band: 5650-5665 (step 3).
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #6/#7/#11, Christology, dropped-Paul, son-of-Adam):
--  * Timothy circumcised (16:1-3): NOT hypocrisy but covenant fidelity. Paul, the Torah-
--    observant Israelite of Benjamin, circumcises Timothy and walks orderly, keeping the law
--    (Acts 21:24) — the dropped-Paul correction. The Paul who abolished Torah does not exist;
--    he keeps Torah for the sake of the gathering among the Yahudim (Jews).
--  * The Spirit forbidding Asia / the Macedonian call (16:6-10): the Ruach HaKodesh (Holy
--    Spirit) governs the path of the gathering as the cloud led Yashar'el (Israel). The word
--    is steered to the dispersed — Yahuah directeth the steps; his ways are higher.
--  * Lydia, heart opened (16:14): the FATHER opens the heart. This is the circumcised heart of
--    Deuteronomy 30:6 and the new heart / indwelling Spirit of Ezekiel 36:26-27 — the Spirit
--    inseparable from the statutes (Red Line #6), the hearing revealing what the Father works,
--    never a self-generated belief that creates covenant.
--  * The spirit of divination silenced (16:16-18): the soothsaying spirit is the watcher-taught
--    enchantment (1 Enoch 8:2; forbidden, Deuteronomy 18:10), silenced as Yahusha (Jesus)
--    silenced the devils who confessed him (Luke 4:41) — a true confession from an unclean
--    mouth is still commanded to hold its peace.
--  * Midnight singing / earthquake / bands loosed (16:25-26): songs in the night (Job 35:10;
--    Psalm 119:62), and Yahuah breaking the bands and the gates of brass (Psalm 107:14,16).
--  * Believe and thy house (16:31-34): the HOUSEHOLD covenant — the Passover house under the
--    blood (Exodus 12:23), Joshua's house (Joshua 24:15), Noah's house in the ark (Genesis 7:1),
--    the promise to you and your children and all afar off (Acts 2:39). The seed of the
--    household gathered in the head of the house; NOT a faith-confession that grafts non-seed,
--    but the covenant running through the house as it always did.
--
-- PER-VERSE LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  v.1-3   Timothy circumcised        Tanakh: none added (Paul-keeps-Torah carried by NT Acts 21 target)  Extras: none warranted  NT: Acts 21:24
--  v.4-5   the decrees delivered       Tanakh: none warranted  Extras: none warranted  NT: none added (Acts 15 council carried in the 13-15 range, not re-added)
--  v.6-10  Spirit forbids Asia / Macedonian call  Tanakh: Exodus 13:21 (cloud leads the way), Proverbs 16:9 (Yahuah directeth his steps)  Extras: none warranted  NT: none added (Isaiah 55:8-9 weighed — higher ways — carried thematically, not added)
--  v.11-13 Philippi / by the riverside sabbath  Tanakh: Isaiah 56:6-7 weighed (sabbath-keeper joined, house of prayer) — carried in the eunuch's Isaiah-56 thread already built; not re-added here  Extras: none warranted  NT: none warranted (narrative)
--  v.14-15 Lydia, heart opened          Tanakh: Deuteronomy 30:6 (circumcise thine heart), Ezekiel 36:26, Ezekiel 36:27 (new heart / Spirit causes to walk in statutes)  Extras: none warranted  NT: none added
--  v.16-18 spirit of divination silenced  Tanakh: Deuteronomy 18:10 (divination forbidden)  Extras: 1 Enoch 8:2 (watcher-taught enchantments)  NT: Luke 4:41 (devils suffered not to speak)
--  v.19-24 dragged, beaten, imprisoned  Tanakh: none added  Extras: none warranted  NT: none warranted (narrative; the praise answer threaded at v.25)
--  v.25-26 midnight singing / earthquake / bands loosed  Tanakh: Job 35:10 (songs in the night), Psalm 119:62 (at midnight I rise to give thanks), Psalm 107:14, Psalm 107:16 (brake their bands, broken the gates of brass)  Extras: none warranted  NT: none warranted
--  v.27-34 the keeper saved / believe and thy house  Tanakh: Exodus 12:23 (Passover house), Joshua 24:15 (me and my house), Genesis 7:1 (Noah's house into the ark)  Extras: none warranted  NT: Acts 2:39 (the promise to you, your children, all afar off)
--  v.35-40 Roman citizenship / released  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5650 acts-16-circumcised-him-paul-keeping-torah-for-the-gathering            (NT)
--   5653 acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path             (Tanakh)
--   5656 acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit (Tanakh)
--   5659 acts-16-the-spirit-of-divination-silenced                              (Tanakh + Extras + NT)
--   5662 acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken  (Tanakh)
--   5665 acts-16-believe-and-thy-house-the-household-covenant                    (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-16-circumcised-him-paul-keeping-torah-for-the-gathering
  ('canon', 'acts', 16, 3, 'canon', 'acts', 21, 24, 'free', E'*Them take, and purify thyself with them, and be at charges with them, that they may shave their heads: and all may know that those things, whereof they were informed concerning thee, are nothing; but that thou thyself also walkest orderly, and keepest the law.* (Acts 21:24). *Him would Paul have to go forth with him; and took and circumcised him because of the Yahudim (Jews) which were in those quarters* (Acts 16:3). This is no hypocrisy and no contradiction: Paul is the Torah-observant Yahudi (Jew) who *walkest orderly, and keepest the law,* and circumcises Timothy for the sake of the gathering among the Yahudim (Jews). The Paul who abolished the Torah does not exist; the same hand that wrote the letters keeps the covenant.'),
  -- thread: acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path
  ('canon', 'acts', 16, 6, 'canon', 'exodus', 13, 21, 'free', E'*And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night:* (Exodus 13:21). As Yahuah (LORD) went before Yashar''el (Israel) in the cloud to lead the way, so the Spirit now leads the way of the gathering: *they had gone throughout Phrygia and the region of Galatia, and were forbidden of the Ruach HaKodesh (Holy Spirit) to preach the word in Asia* (Acts 16:6), and *the Spirit suffered them not* to go into Bithynia (Acts 16:7). The same hand that led the camp leads the word — every closed door a turning of the pillar.'),
  ('canon', 'acts', 16, 9, 'canon', 'proverbs', 16, 9, 'free', E'*A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps.* (Proverbs 16:9). Paul devised to go into Asia and Bithynia, but the Spirit turned him; then *a vision appeared to Paul in the night; There stood a man of Macedonia, and prayed him, saying, Come over into Macedonia, and help us* (Acts 16:9). The man''s heart devised the way, but Yahuah (LORD) directed the steps — the Macedonian call is the Father steering the word to the dispersed, the path chosen not by the apostle but by the One who gathers.'),
  -- thread: acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit
  ('canon', 'acts', 16, 14, 'canon', 'deuteronomy', 30, 6, 'free', E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6). Lydia *worshipped Elohim (God),* and *whose heart Yahuah (Lord) opened, that she attended unto the things which were spoken of Paul* (Acts 16:14). It is the very work Moses promised: Yahuah (LORD) himself circumcising the heart. The opening is his, not hers — the hearing reveals the heart he opened, the love he put there, never a belief she generated to make herself his.'),
  ('canon', 'acts', 16, 14, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). When *Yahuah (Lord) opened* Lydia''s heart (Acts 16:14), this is the promise being kept: the stony heart taken away, the heart of flesh given. The attending to the word is the new heart of flesh responding — the Father doing in her what he swore to do for the gathered.'),
  ('canon', 'acts', 16, 14, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The heart Yahuah (Lord) opens he opens for this end: *I will put my spirit within you, and cause you to walk in my statutes.* The Spirit and the statutes are one motion, never opposed — the heart opened to *the things which were spoken* (Acts 16:14) is the heart made able to walk in his ways. Lydia opens her house straightway; the opened heart bears the obedience the Spirit causes.'),
  -- thread: acts-16-the-spirit-of-divination-silenced
  ('canon', 'acts', 16, 16, 'canon', 'deuteronomy', 18, 10, 'free', E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* (Deuteronomy 18:10). *A certain damsel possessed with a spirit of divination met us, which brought her masters much gain by soothsaying* (Acts 16:16). The very thing Moses forbade in the covenant — divination, the soothsayer''s gain — stands now in the marketplace and is cast out: the abomination the Torah named is the thing Paul commands to come out.'),
  ('canon', 'acts', 16, 16, 'enoch', '1-enoch', 8, 2, 'extras', E'*And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* (1 Enoch 8:2). The *spirit of divination* (Acts 16:16) is no neutral gift: enchantment and soothsaying are the watcher-taught corruptions, the arts the fallen ones handed to men. Paul commands the spirit out in the name of Yahusha HaMashiach (Jesus Christ) (Acts 16:18) — the One above the watchers undoing what they taught.'),
  ('canon', 'acts', 16, 17, 'canon', 'luke', 4, 41, 'free', E'*And devils also came out of many, crying out, and saying, Thou art Messiah (Christ) the Son of Elohim (God). And he rebuking them suffered them not to speak: for they knew that he was Messiah (Christ).* (Luke 4:41). The spirit cried after Paul, *These men are the servants of the El Elyon (most high God), which shew unto us the way of salvation* (Acts 16:17) — a true word from an unclean mouth. As Yahusha (Jesus) *suffered them not to speak,* so Paul, grieved, commands it silent (Acts 16:18): the confession of devils is not the witness the Father wants, and the unclean spirit is given no platform even when it speaks truth.'),
  -- thread: acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken
  ('canon', 'acts', 16, 25, 'canon', 'job', 35, 10, 'free', E'*But none saith, Where is Elohim (God) my maker, who giveth songs in the night;* (Job 35:10). *And at midnight Paul and Silas prayed, and sang praises unto Elohim (God): and the prisoners heard them* (Acts 16:25). In the inner prison, feet fast in the stocks, they sing — for it is Elohim (God) their maker *who giveth songs in the night.* The song in the darkest place is not their strength but his gift, and the prisoners hear it.'),
  ('canon', 'acts', 16, 25, 'canon', 'psalms', 119, 62, 'free', E'*At midnight I will rise to give thanks unto thee because of thy righteous judgments.* (Psalm 119:62). The psalmist''s vow is fulfilled in the prison: *at midnight Paul and Silas prayed, and sang praises unto Elohim (God)* (Acts 16:25). At the hour of deepest dark they rise to give thanks — the praise of the bound rising before the deliverance comes, thanksgiving rooted in his righteous judgments, not in their circumstance.'),
  ('canon', 'acts', 16, 26, 'canon', 'psalms', 107, 14, 'free', E'*He brought them out of darkness and the shadow of death, and brake their bands in sunder.* (Psalm 107:14). *Suddenly there was a great earthquake, so that the foundations of the prison were shaken: and immediately all the doors were opened, and every one''s bands were loosed* (Acts 16:26). The psalm names the deliverer of the prisoner: Yahuah (LORD) who *brake their bands in sunder.* The loosing of every band in the Philippian jail is his hand doing the very thing the psalm sang — the bound brought out of darkness.'),
  ('canon', 'acts', 16, 26, 'canon', 'psalms', 107, 16, 'free', E'*For he hath broken the gates of brass, and cut the bars of iron in sunder.* (Psalm 107:16). The doors of the prison fly open and the bands fall (Acts 16:26) because it is Yahuah (LORD) who *hath broken the gates of brass, and cut the bars of iron in sunder.* No bar of iron holds against him; the earthquake that opens the inner prison is the same power the psalm declared, the gates of the captor broken by the One who frees.'),
  -- thread: acts-16-believe-and-thy-house-the-household-covenant
  ('canon', 'acts', 16, 31, 'canon', 'exodus', 12, 23, 'free', E'*For Yahuah (LORD) will pass through to smite the Egyptians; and when he seeth the blood upon the lintel, and on the two side posts, Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses to smite you.* (Exodus 12:23). *Believe on the Lord Yahusha HaMashiach (Lord Jesus Christ), and thou shalt be saved, and thy house* (Acts 16:31). The covenant has always run through the house: in Egypt the blood on the door covered all within, the destroyer passing over the whole household. So the keeper believes, *and was baptized, he and all his, straightway* (Acts 16:33) — the head of the house and the seed of the house under one covering.'),
  ('canon', 'acts', 16, 31, 'canon', 'joshua', 24, 15, 'free', E'*And if it seem evil unto you to serve Yahuah (LORD), choose you this day whom ye will serve … but as for me and my house, we will serve Yahuah (LORD).* (Joshua 24:15). *Believe on the Lord Yahusha HaMashiach (Lord Jesus Christ), and thou shalt be saved, and thy house* (Acts 16:31). The keeper''s turning is Joshua''s vow renewed — *me and my house* — for *he set meat before them, and rejoiced, believing in Elohim (God) with all his house* (Acts 16:34). The head of the house turns and the house turns with him; the covenant gathers the household in its head.'),
  ('canon', 'acts', 16, 31, 'canon', 'genesis', 7, 1, 'free', E'*And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* (Genesis 7:1). The word *thy house* (Acts 16:31) is the old pattern: Noah and *all thy house* brought into the ark, the household carried through the judgment in the one found righteous. So the keeper and *all his* are washed and saved the same hour (Acts 16:33) — the house gathered into safety in the head of the house, as the household was gathered into the ark.'),
  ('canon', 'acts', 16, 31, 'canon', 'acts', 2, 39, 'free', E'*For the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call.* (Acts 2:39). *Believe on the Lord Yahusha HaMashiach (Lord Jesus Christ), and thou shalt be saved, and thy house* (Acts 16:31). Peter named it at the first: the promise reaches *you, and your children, and all that are afar off* — the dispersed of the house made nigh. The keeper''s household is that promise landing on a house far off, the children included with the father, *as many as Yahuah Eloheinu (the Lord our God) shall call.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-circumcised-him-paul-keeping-torah-for-the-gathering',
       E'Circumcised him — Paul keeping Torah for the gathering',
       E'At Lystra Paul finds Timothy, *the son of a certain woman, which was a Yahudi (Jewess), and believed; but his father was a Greek* (Acts 16:1), and *him would Paul have to go forth with him; and took and circumcised him because of the Yahudim (Jews) which were in those quarters* (Acts 16:3). The inherited reading hears a contradiction here — the Paul who supposedly abolished circumcision now circumcising his companion. There is no contradiction, because that Paul does not exist. This is the Torah-observant Yahudi (Jew) of the tribe of Benjamin who never left the covenant, keeping it for the sake of the gathering. Years later the elders at Jerusalem name him plainly: *that thou thyself also walkest orderly, and keepest the law* (Acts 21:24). The same hand that wrote the letters circumcises Timothy and keeps the Torah; the persecutor-made-vessel carries the name to the scattered without ever forsaking Moses. The circumcision is covenant fidelity, not compromise — Paul walking orderly so the Yahudim (Jews) might receive the word.',
       sv.verse_id, ev.verse_id, 'free', 5650
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path',
       E'Forbidden of the Spirit — the Shepherd leads the path',
       E'The apostles move through Phrygia and Galatia *and were forbidden of the Ruach HaKodesh (Holy Spirit) to preach the word in Asia* (Acts 16:6); they assay to enter Bithynia, *but the Spirit suffered them not* (Acts 16:7). Then in the night a man of Macedonia stands and pleads, *Come over into Macedonia, and help us* (Acts 16:9). This is not the apostles charting their own mission — it is the Spirit steering the path of the gathering, as Yahuah (LORD) once steered the camp: *Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light* (Exodus 13:21). Every closed door is a turning of the pillar. *A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* (Proverbs 16:9) — Paul devised Asia and Bithynia, but the One who gathers directed the steps toward Macedonia, toward the dispersed waiting for the word. The path is not the apostle''s; it is the Shepherd''s, leading the word to the lost sheep he means to reach.',
       sv.verse_id, ev.verse_id, 'free', 5653
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit',
       E'Whose heart Yahuah (Lord) opened — the circumcised heart and the new spirit',
       E'By the riverside on the sabbath, where prayer was wont to be made, a woman named Lydia *which worshipped Elohim (God), heard us: whose heart Yahuah (Lord) opened, that she attended unto the things which were spoken of Paul* (Acts 16:14). The opening is the Father''s work, not hers. It is the promise Moses spoke at the edge of the land: *Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deuteronomy 30:6). It is the new covenant Ezekiel saw: *a new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). And it does not stop at sentiment — *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit and the statutes are one motion, never opposed. Lydia''s opened heart attends to the word and at once opens her house; the hearing reveals the heart the Father opened, the love he put there, the obedience the Spirit causes — not a belief she manufactured to make herself his, but the Father doing in her what he swore to do.',
       sv.verse_id, ev.verse_id, 'free', 5656
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-the-spirit-of-divination-silenced',
       E'The spirit of divination silenced',
       E'A damsel *possessed with a spirit of divination* meets them, *which brought her masters much gain by soothsaying* (Acts 16:16), and follows them crying, *These men are the servants of the El Elyon (most high God), which shew unto us the way of salvation* (Acts 16:17). The words are true, yet Paul, grieved, commands the spirit out in the name of Yahusha HaMashiach (Jesus Christ) (Acts 16:18). Two things stand together here. First, divination is no neutral art: the Torah forbade it within the covenant — *there shall not be found among you … one that useth divination, or an observer of times, or an enchanter* (Deuteronomy 18:10) — and the older witness names its source, the fallen watchers who *taught enchantments, and root-cuttings … astrology … the constellations* (1 Enoch 8:2), corruptions handed to men. Second, a true confession from an unclean mouth is still silenced. As Yahusha (Jesus) cast out devils who cried *Thou art Messiah (Christ) the Son of Elohim (God)* and *rebuking them suffered them not to speak* (Luke 4:41), so Paul gives the divining spirit no platform. The witness the Father wants does not come from the mouth of the watcher-taught spirit; the way of salvation is not proclaimed by the thing that must be cast out.',
       sv.verse_id, ev.verse_id, 'extras', 5659
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken',
       E'Songs in the night — the bands loosed, the gates of brass broken',
       E'Beaten, thrust into the inner prison, their feet fast in the stocks, *at midnight Paul and Silas prayed, and sang praises unto Elohim (God): and the prisoners heard them* (Acts 16:25). The song in the darkest place is not their strength but a gift — for it is Elohim (God) their maker *who giveth songs in the night* (Job 35:10), and the psalmist''s vow is theirs: *at midnight I will rise to give thanks unto thee because of thy righteous judgments* (Psalm 119:62). Thanksgiving rises before the deliverance comes. Then *suddenly there was a great earthquake, so that the foundations of the prison were shaken: and immediately all the doors were opened, and every one''s bands were loosed* (Acts 16:26). This is the deliverer the psalms sang long before: Yahuah (LORD) who *brought them out of darkness and the shadow of death, and brake their bands in sunder* (Psalm 107:14), who *hath broken the gates of brass, and cut the bars of iron in sunder* (Psalm 107:16). No bar of iron holds against him. The praise of the bound and the breaking of their bands are one story — the One who gives the song in the night is the One who opens the door.',
       sv.verse_id, ev.verse_id, 'free', 5662
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-16-believe-and-thy-house-the-household-covenant',
       E'Believe and thy house — the household covenant',
       E'The keeper of the prison, trembling, falls before Paul and Silas and asks, *Sirs, what must I do to be saved?* (Acts 16:30). The answer is *Believe on the Lord Yahusha HaMashiach (Lord Jesus Christ), and thou shalt be saved, and thy house* (Acts 16:31) — and *he was baptized, he and all his, straightway,* and *rejoiced, believing in Elohim (God) with all his house* (Acts 16:33-34). *And thy house* is no afterthought; it is the oldest pattern of the covenant. In Egypt the blood on the door covered everyone within: *when he seeth the blood upon the lintel … Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses to smite you* (Exodus 12:23). Noah and *all thy house* were brought into the ark, carried through the judgment in the one found righteous (Genesis 7:1). Joshua set his vow for the whole household: *as for me and my house, we will serve Yahuah (LORD)* (Joshua 24:15). And Peter had named the reach of the promise at the first: *the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts 2:39). The keeper''s household is that promise landing on a house far off — the head of the house turning and the seed of the house gathered with him, the covenant running through the household as it always has.',
       sv.verse_id, ev.verse_id, 'free', 5665
  FROM _s217_a16_lookup sv, _s217_a16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=16 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-16-circumcised-him-paul-keeping-torah-for-the-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 21:24 — *that thou thyself also walkest orderly, and keepest the law* the elders name Paul Torah-keeping; the same hand circumcises Timothy (Acts 16:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-circumcised-him-paul-keeping-torah-for-the-gathering'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 13:21 — *Yahuah (LORD) went before them … in a pillar of a cloud, to lead them the way* the Spirit forbidding Asia is the pillar turning the path of the gathering (Acts 16:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:9 — *A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* the Macedonian call is the Father steering the steps Paul did not choose (Acts 16:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-forbidden-of-the-spirit-the-shepherd-leads-the-path'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:6 — *Yahuah Elohayka (the LORD thy God) will circumcise thine heart* the heart-opening is the Father''s circumcising work, not Lydia''s own (Acts 16:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:26 — *a new heart … and a new spirit will I put within you … an heart of flesh* the stony heart taken away; Lydia''s opened heart is the promise kept (Acts 16:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit and the statutes one motion; the opened heart bears obedience (Acts 16:14-15).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-whose-heart-yahuah-opened-the-circumcised-heart-and-the-new-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-the-spirit-of-divination-silenced
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:10 — *one that useth divination, or an observer of times, or an enchanter* the very abomination the Torah forbade now cast out of the soothsaying damsel (Acts 16:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-the-spirit-of-divination-silenced'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 8:2 — *Semjâzâ taught enchantments, and root-cuttings … Barâqîjâl taught astrology* the watcher-source of the divining art Paul commands out (Acts 16:16,18).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-the-spirit-of-divination-silenced'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 4:41 — *he rebuking them suffered them not to speak* a true confession from an unclean mouth is silenced, as Paul silences the divining spirit (Acts 16:17-18).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-the-spirit-of-divination-silenced'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 35:10 — *Elohim (God) my maker, who giveth songs in the night* the midnight praise of Paul and Silas is his gift, not their strength (Acts 16:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:62 — *At midnight I will rise to give thanks unto thee* the psalmist''s vow fulfilled in the prison, thanks before deliverance (Acts 16:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=62
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 107:14 — *He brought them out of darkness … and brake their bands in sunder* the deliverer of the prisoner; every band loosed in the quake (Acts 16:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 107:16 — *he hath broken the gates of brass, and cut the bars of iron in sunder* no bar holds against him; the prison doors fly open (Acts 16:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-songs-in-the-night-the-bands-loosed-the-gates-of-brass-broken'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-16-believe-and-thy-house-the-household-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:23 — *Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses* the Passover blood covers the whole house, as the keeper''s house is saved (Acts 16:31,33).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-believe-and-thy-house-the-household-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:15 — *as for me and my house, we will serve Yahuah (LORD)* the head of the house turns and the house turns with him (Acts 16:31,34).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-believe-and-thy-house-the-household-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:1 — *Come thou and all thy house into the ark* the household carried through judgment in the one found righteous (Acts 16:31,33).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-believe-and-thy-house-the-household-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 2:39 — *the promise is unto you, and to your children, and to all that are afar off* the keeper''s house is the promise landing on a house far off (Acts 16:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a16_lookup sv, _s217_a16_lookup tv
 WHERE t.slug='acts-16-believe-and-thy-house-the-household-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=16 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_17.sql (S217 Acts 17) -----
-- =====================================================================
-- S217 minion — ACTS 17 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 17.  Tag: a17 (temp view _s217_a17_lookup).  Sort band: 5675-5699 (step 3).
-- Source is ALWAYS the canon Acts 17 verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #7/#11/#12, Christology, son-of-Adam):
--  * Thessalonica (17:2-3): Paul reasons OUT OF THE SCRIPTURES three sabbaths — Messiah
--    must SUFFER and RISE. The Tanakh is the test, not a new revelation: Isaiah 53 (the
--    smitten servant), Psalm 16:10 (the Holy One who sees no corruption), and the Master's
--    own *thus it behoved Messiah (Christ) to suffer, and to rise* (Luke 24:46). The
--    suffering-then-glory is read FROM Moses and the prophets, never against them.
--  * "Turned the world upside down" / "another king, one Yahusha (Jesus)" (17:6-7): the
--    kingdom that shall never be destroyed (Daniel 2:44) on the throne of David (Isaiah 9:7)
--    — the everlasting dominion of the Formed, not a sedition against Torah.
--  * The Bereans (17:11): *searched the scriptures daily, whether those things were so* — the
--    noble standard is the Tanakh as the test (Isaiah 8:20 *to the law and to the testimony*;
--    John 5:39 the scriptures testify of him). The 1234-filter posture in narrative form.
--  * THE AREOPAGUS (17:22-31) — read as the CREATOR's claim on the nations within his ordering
--    of the earth, NOT a natural-theology inclusion gospel. The Maker of heaven and earth who
--    *dwelleth not in temples made with hands* (1 Kings 8:27; Isaiah 66:1-2), who *giveth to
--    all life, and breath* (Isaiah 42:5; Genesis 2:7), who *made of one blood all nations …
--    and the bounds of their habitation* (Deuteronomy 32:8 — the nations apportioned around
--    the children of Yashar'el), summoning *that they should seek Yahuah (Lord)* (Isaiah 45:18-22;
--    Wisdom 13:6). The idols are nothing (Isaiah 45:20; Wisdom 13:10). NOT the nations grafted
--    into the seed by confession — the Maker summoning the formed within his ordering.
--  * The appointed Man / day of judgment (17:31): *he will judge the world in righteousness*
--    (Psalm 96:13) by the Man he ordained — the one *like the Son of Adam* given everlasting
--    dominion and committed all judgment (Daniel 7:13-14; John 5:27, *because he is the Son of
--    Adam*). The kaph at Daniel 7:13 is preserved in the pull and is incarnation-honoring:
--    Yahusha himself, the Formed cloud-rider who took on flesh. The assurance is the
--    resurrection — the firstfruits raised (Psalm 16:10; 1 Corinthians 15:20-23).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 17:
--   v.1-2   Thessalonica synagogue       Tanakh: none added (narrative; the scriptures-reasoned carried at v.3)  Extras: none warranted  NT: none warranted
--   v.2-3   Messiah must suffer and rise Tanakh: Isaiah 53:5, Isaiah 53:8, Psalm 16:10  Extras: none warranted  NT: Luke 24:26, Luke 24:46
--   v.4     some believed / devout Greeks Tanakh: none added (the gathering carried elsewhere)  Extras: none warranted  NT: none warranted
--   v.5-9   envy / uproar / Jason        Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.6-7   world upside down / another king Tanakh: Daniel 2:44, Isaiah 9:6, Isaiah 9:7  Extras: none warranted  NT: none added (kingdom carried by Daniel/Isaiah)
--   v.10    sent to Berea                Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.11    Bereans searched daily       Tanakh: Isaiah 8:20  Extras: none warranted  NT: John 5:39
--   v.12-15 many believed / to Athens    Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.16-21 stirred at idolatry / Areopagus Tanakh: none added (idolatry carried at v.29 thread)  Extras: none warranted  NT: none warranted (narrative setup)
--   v.23-25 UNKNOWN GOD / made the world / no temple Tanakh: 1 Kings 8:27, Isaiah 66:1, Isaiah 66:2, Isaiah 42:5  Extras: Wisdom of Solomon 13:5  NT: none added
--   v.26    of one blood / bounds of habitation Tanakh: Deuteronomy 32:8  Extras: none warranted (Jubilees 8 weighed — apparatus-heavy place-names, not quoted)  NT: none warranted
--   v.27-29 seek Yahuah / not gold or silver Tanakh: Isaiah 45:18, Isaiah 45:20, Isaiah 45:22  Extras: Wisdom of Solomon 13:6, Wisdom of Solomon 13:10  NT: none added
--   v.30-31 appointed Man / judge in righteousness Tanakh: Psalm 96:13, Daniel 7:13, Daniel 7:14  Extras: none warranted  NT: John 5:27
--   v.31-32 raised from the dead / assurance Tanakh: Psalm 16:10  Extras: none warranted  NT: 1 Corinthians 15:20, 1 Corinthians 15:23
--   v.33-34 Dionysius / Damaris believe   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5675 acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise        (Tanakh + NT)
--   5678 acts-17-these-that-have-turned-the-world-upside-down-another-king          (Tanakh)
--   5681 acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so (Tanakh + NT)
--   5684 acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands          (Tanakh + Extras)
--   5687 acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation        (Tanakh)
--   5690 acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations        (Tanakh + Extras)
--   5693 acts-17-the-appointed-man-the-day-of-judgment-in-righteousness             (Tanakh + NT)
--   5696 acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given        (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise
  ('canon', 'acts', 17, 3, 'canon', 'isaiah', 53, 5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). For three sabbath days Paul *reasoned with them out of the scriptures, opening and alleging, that Messiah (Christ) must needs have suffered* (Acts 17:2-3). This is the scripture he opened: the servant wounded for transgressions, bruised for iniquities. The suffering of the Messiah is not a stumbling-block read against the prophets but the very thing the prophet wrote — read out of the scriptures, not against them.'),
  ('canon', 'acts', 17, 3, 'canon', 'isaiah', 53, 8, 'free', E'*He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* (Isaiah 53:8). Paul alleges *that Messiah (Christ) must needs have suffered, and risen again from the dead* (Acts 17:3). The servant *cut off out of the land of the living* for the transgression of the people is the suffering the prophet foretold; the rising again answers the cutting-off, the One stricken not held by death.'),
  ('canon', 'acts', 17, 3, 'canon', 'psalms', 16, 10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). Paul reasons that Messiah (Christ) *must needs have suffered, and risen again from the dead* (Acts 17:3). The rising is written in the Psalm David sang: the Holy One whose soul is not left in the grave, whose flesh sees no corruption. The resurrection Paul preaches is the scripture opened, not a new doctrine — *whom I preach unto you, is Messiah (Christ)* (Acts 17:3).'),
  ('canon', 'acts', 17, 3, 'canon', 'luke', 24, 26, 'free', E'*Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26). What Paul reasons three sabbaths in Thessalonica is what the risen Master taught on the Emmaus road: the suffering came first, then the glory. *That Messiah (Christ) must needs have suffered, and risen again from the dead* (Acts 17:3) is the same opening of the same scriptures — suffering then glory, the pattern the prophets wrote.'),
  ('canon', 'acts', 17, 3, 'canon', 'luke', 24, 46, 'free', E'*And said unto them, Thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day:* (Luke 24:46). The Master said *thus it is written* — and Paul, *as his manner was,* goes into the synagogue and out of those same writings shows *that Messiah (Christ) must needs have suffered, and risen again from the dead* (Acts 17:2-3). The apostle preaches what the Master opened: the written word, that the Messiah suffer and rise.'),
  -- thread: acts-17-these-that-have-turned-the-world-upside-down-another-king
  ('canon', 'acts', 17, 7, 'canon', 'daniel', 2, 44, 'free', E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* (Daniel 2:44). The accusation rings out: *these all do contrary to the decrees of Cæsar, saying that there is another king, one Yahusha (Jesus)* (Acts 17:7). The other king is no rival to Rome''s order but the King of the kingdom Daniel saw — the kingdom of the Elohim (God) of heaven that shall never be destroyed, set up in the days of the kings of the earth and standing for ever.'),
  ('canon', 'acts', 17, 7, 'canon', 'isaiah', 9, 7, 'free', E'*Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this.* (Isaiah 9:7). The city is troubled that there is *another king, one Yahusha (Jesus)* (Acts 17:7). The prophet named the throne of that king long before Caesar: the government upon his shoulder, the throne of David, the kingdom established with judgment and justice for ever. The King the rulers fear is the King the zeal of Yahuah Tseva''ot (LORD of hosts) was always going to seat.'),
  -- thread: acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so
  ('canon', 'acts', 17, 11, 'canon', 'isaiah', 8, 20, 'free', E'*To the law and to the testimony: if they speak not according to this word, it is because there is no light in them.* (Isaiah 8:20). The Bereans *received the word with all readiness of mind, and searched the scriptures daily, whether those things were so* (Acts 17:11). This is the test Isaiah set: bring every word to the law and to the testimony. The noble Berean does not believe Paul because Paul is eloquent; he weighs the preaching against the written word — and what speaks according to that word has the light in it.'),
  ('canon', 'acts', 17, 11, 'canon', 'john', 5, 39, 'free', E'*Search the scriptures; for in them ye think ye have eternal life: and they are they which testify of me.* (John 5:39). The Master commanded the very searching the Bereans practised — *searched the scriptures daily, whether those things were so* (Acts 17:11). And the searching finds what the Master said it would find: the scriptures testify of him. The Bereans search the writings to test the preaching, and the writings bear witness to the One preached.'),
  -- thread: acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands
  ('canon', 'acts', 17, 24, 'canon', '1-kings', 8, 27, 'free', E'*But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). On Mars'' hill Paul declares the unknown God: *Elohim (God) that made the world and all things therein … dwelleth not in temples made with hands* (Acts 17:24). It is the word Solomon spoke at the dedication of the temple itself — the heaven of heavens cannot contain him, how much less a house of hands. The Maker is not housed by what he made.'),
  ('canon', 'acts', 17, 24, 'canon', 'isaiah', 66, 1, 'free', E'*Thus saith Yahuah (LORD), The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me? and where is the place of my rest?* (Isaiah 66:1). Paul preaches the One who *dwelleth not in temples made with hands* (Acts 17:24). Isaiah set the question to the temple-builders centuries before: the heaven is his throne, the earth his footstool — what house could men build for the One who fills both? The unknown God of the altar is the Maker the prophet declared.'),
  ('canon', 'acts', 17, 24, 'canon', 'isaiah', 66, 2, 'free', E'*For all those things hath mine hand made, and all those things have been, saith Yahuah (LORD): but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* (Isaiah 66:2). *Elohim (God) that made the world and all things therein* (Acts 17:24) needs no house of hands, for *all those things hath mine hand made.* The God who needs nothing looks not to the temple men build but to the contrite heart that trembles at his word — the seeking he calls for on the Areopagus.'),
  ('canon', 'acts', 17, 25, 'canon', 'isaiah', 42, 5, 'free', E'*Thus saith Elohim (God) Yahuah (LORD), he that created the heavens, and stretched them out; he that spread forth the earth, and that which cometh out of it; he that giveth breath unto the people upon it, and spirit to them that walk therein:* (Isaiah 42:5). Paul says the Maker is not *worshipped with men''s hands, as though he needed any thing, seeing he giveth to all life, and breath, and all things* (Acts 17:25). Isaiah named him just so: the One who created the heavens and *giveth breath unto the people upon it.* He is not served as one in need; he is the giver of the breath of every man who would serve him.'),
  ('canon', 'acts', 17, 25, 'apocrypha', 'the-wisdom-of-solomon', 13, 5, 'extras', E'*For by the greatness and beauty of the creatures proportionably the maker of them is seen.* (Wisdom of Solomon 13:5). Paul stands among men who worship they know not what, and declares *Elohim (God) that made the world and all things therein* (Acts 17:24), who *giveth to all life, and breath* (Acts 17:25). The wisdom of the fathers had said the same: the maker is seen by the greatness and beauty of the creatures — the works point past themselves to the One who made them, the unknown God whom the Athenians ignorantly worship.'),
  -- thread: acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation
  ('canon', 'acts', 17, 26, 'canon', 'deuteronomy', 32, 8, 'free', E'*When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* (Deuteronomy 32:8). Paul says the Maker *hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). Moses had already sung it: the El Elyon (most High) who separated the sons of Adam and *set the bounds of the people* — the nations apportioned and ordered around the children of Yashar''el (Israel). The bounds of the Areopagus are the bounds of the Song of Moses: the Maker''s ordering of the earth he made.'),
  -- thread: acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations
  ('canon', 'acts', 17, 27, 'canon', 'isaiah', 45, 18, 'free', E'*For thus saith Yahuah (LORD) that created the heavens; Elohim (God) himself that formed the earth and made it; he hath established it, he created it not in vain, he formed it to be inhabited: I am Yahuah (LORD); and there is none else.* (Isaiah 45:18). The Maker set the bounds of habitation *that they should seek Yahuah (Lord), if haply they might feel after him, and find him* (Acts 17:27). Isaiah declares the same Maker and the same end: the One who *formed the earth … to be inhabited,* beside whom there is none else. He made the earth to be dwelt in so that those who dwell in it would seek the One who is.'),
  ('canon', 'acts', 17, 27, 'apocrypha', 'the-wisdom-of-solomon', 13, 6, 'extras', E'*But yet for this they are the less to be blamed: for they perhaps err, seeking Yahuah (God), and desirous to find him.* (Wisdom of Solomon 13:6). Paul names the appointed end of the bounded habitation: *that they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us* (Acts 17:27). The wisdom of the fathers had named the same groping after the Maker — men *seeking Yahuah (God), and desirous to find him,* feeling after the One who set them in their place. The seeking is the Maker''s summons, the finding never far off.'),
  ('canon', 'acts', 17, 29, 'canon', 'isaiah', 45, 20, 'free', E'*Assemble yourselves and come; draw near together, ye that are escaped of the nations: they have no knowledge that set up the wood of their graven image, and pray unto a god that cannot save.* (Isaiah 45:20). Paul says *we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device* (Acts 17:29). Isaiah had already exposed the graven image: the wood set up, the prayer to a god that cannot save, the no-knowledge of those who carry it. The city wholly given to idolatry (Acts 17:16) is the city Isaiah called to draw near to the One who can save.'),
  ('canon', 'acts', 17, 29, 'apocrypha', 'the-wisdom-of-solomon', 13, 10, 'extras', E'*But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* (Wisdom of Solomon 13:10). Paul says *we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device* (Acts 17:29). The wisdom of the fathers named the misery already: hope set in dead things, gods of gold and silver and stone, the works of men''s hands. The offspring of the living Maker are not to fashion him after the dead works of their own art.'),
  -- thread: acts-17-the-appointed-man-the-day-of-judgment-in-righteousness
  ('canon', 'acts', 17, 31, 'canon', 'psalms', 96, 13, 'free', E'*Before Yahuah (LORD): for he cometh, for he cometh to judge the earth: he shall judge the world with righteousness, and the people with his truth.* (Psalm 96:13). Paul declares that the Maker *hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained* (Acts 17:31). The Psalm sang the coming judgment: he cometh to *judge the world with righteousness.* The appointed day of the Areopagus is the day the Psalmist saw — the Maker who summons the nations is the Judge who comes to try them in righteousness.'),
  ('canon', 'acts', 17, 31, 'canon', 'daniel', 7, 13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). The world will be judged *by that man whom he hath ordained* (Acts 17:31). Daniel saw the ordaining: one *like the Son of Adam* brought near before the Ancient of days — the Formed who took on flesh, resembling mortal-man, coming with the clouds to receive what is given. The appointed Man is the One the night vision brought before the throne.'),
  ('canon', 'acts', 17, 31, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). Paul preaches *that man whom he hath ordained* to judge the world (Acts 17:31). To the One like the Son of Adam was given dominion over *all people, nations, and languages* — the nations Paul says were made of one blood and set in their bounds (Acts 17:26) are the nations given to serve the ordained Man. The Judge of the appointed day holds the everlasting dominion that shall not pass away.'),
  ('canon', 'acts', 17, 31, 'canon', 'john', 5, 27, 'free', E'*And hath given him authority to execute judgment also, because he is the Son of Adam.* (John 5:27). The Maker will judge the world *by that man whom he hath ordained* (Acts 17:31). The Master named the ground of his authority to judge: *because he is the Son of Adam* — the seed of Adam come in flesh, to whom the Father committed all judgment. The appointed Man of the Areopagus is the Son of Adam to whom the executing of judgment is given.'),
  -- thread: acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given
  ('canon', 'acts', 17, 31, 'canon', 'psalms', 16, 10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). The Maker *hath given assurance unto all men, in that he hath raised him from the dead* (Acts 17:31). The raising was written in the Psalm: the Holy One whose soul is not left in the grave, whose flesh sees no corruption. The assurance of the appointed day is the resurrection the Psalmist foresaw — the Judge already raised, the pledge already given.'),
  ('canon', 'acts', 17, 32, 'canon', '1-corinthians', 15, 20, 'free', E'*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* (1 Corinthians 15:20). When the Athenians *heard of the resurrection of the dead, some mocked* (Acts 17:32) — yet the resurrection is the firstfruits of a harvest. Messiah (Christ) is *risen from the dead, and become the firstfruits of them that slept;* the One raised is not the only one to rise but the first sheaf of the gathering, the assurance that the dead the appointed Man will judge are the dead who shall be raised.'),
  ('canon', 'acts', 17, 32, 'canon', '1-corinthians', 15, 23, 'free', E'*But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* (1 Corinthians 15:23). The resurrection the philosophers mocked (Acts 17:32) has an order: *Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The raising that is the assurance of the appointed day (Acts 17:31) is the first of the order — the firstfruits gone before, the harvest of his own to follow at his coming.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise',
       E'Reasoning out of the scriptures — Messiah (Christ) must suffer and rise',
       E'In the synagogue at Thessalonica Paul, *as his manner was, went in unto them, and three sabbath days reasoned with them out of the scriptures, opening and alleging, that Messiah (Christ) must needs have suffered, and risen again from the dead* (Acts 17:2-3). The suffering and the rising are not preached against the prophets but out of them. The wounding is Isaiah''s: *he was wounded for our transgressions, he was bruised for our iniquities … and with his stripes we are healed* (Isaiah 53:5), the servant *cut off out of the land of the living: for the transgression of my people was he stricken* (Isaiah 53:8). The rising is David''s: *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). And it is the very pattern the risen Master opened on the Emmaus road — *Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26), *thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day* (Luke 24:46). Suffering then glory, written in Moses and the prophets and the psalms, reasoned three sabbaths from the scriptures the Yahudim (Jews) already held.',
       sv.verse_id, ev.verse_id, 'free', 5675
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-these-that-have-turned-the-world-upside-down-another-king',
       E'These that have turned the world upside down — another king, one Yahusha (Jesus)',
       E'The mob drags Jason before the rulers, crying *These that have turned the world upside down are come hither also* (Acts 17:6), and the charge is sedition: *these all do contrary to the decrees of Cæsar, saying that there is another king, one Yahusha (Jesus)* (Acts 17:7). The accusation is truer than the accusers know — but the other king is no rival pretender to Caesar''s throne. He is the King of the kingdom Daniel saw rise in the days of the kings of the earth: *in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed … and it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44). The prophet had named that king''s throne long before Caesar reigned: *the government shall be upon his shoulder … upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* (Isaiah 9:7). The world is indeed turned upside down — the kingdoms of men give way to the everlasting dominion of the King the zeal of Yahuah was always going to seat.',
       sv.verse_id, ev.verse_id, 'free', 5678
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so',
       E'The Bereans searched the scriptures daily, whether those things were so',
       E'The brethren send Paul and Silas by night to Berea, and there the synagogue does the noble thing: *these were more noble than those in Thessalonica, in that they received the word with all readiness of mind, and searched the scriptures daily, whether those things were so* (Acts 17:11). They do not believe Paul because he is persuasive; they weigh his preaching against the written word. It is the test Isaiah set for every word that claims to be from above: *to the law and to the testimony: if they speak not according to this word, it is because there is no light in them* (Isaiah 8:20). And the searching finds exactly what the Master promised it would find — *Search the scriptures; for in them ye think ye have eternal life: and they are they which testify of me* (John 5:39). The Bereans search the writings to test the preaching, and the writings bear witness to the One preached. *Therefore many of them believed* (Acts 17:12) — not against the scriptures, but because the scriptures, searched daily, said the things were so.',
       sv.verse_id, ev.verse_id, 'free', 5681
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands',
       E'The unknown God — the Maker needs no temple made with hands',
       E'On Mars'' hill Paul finds an altar inscribed TO THE UNKNOWN GOD, and declares *Whom therefore ye ignorantly worship, him declare I unto you* (Acts 17:23): *Elohim (God) that made the world and all things therein, seeing that he is Yahuah (Lord) of heaven and earth, dwelleth not in temples made with hands; neither is worshipped with men''s hands, as though he needed any thing, seeing he giveth to all life, and breath, and all things* (Acts 17:24-25). This is no new god of the philosophers but the Maker the prophets and the fathers already declared. Solomon said it at the dedication of the temple itself: *behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). Isaiah set the question to the temple-builders: *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* (Isaiah 66:1) — *for all those things hath mine hand made* (Isaiah 66:2). He needs nothing from men''s hands, for he is the giver: *Thus saith Elohim (God) Yahuah (LORD), he that created the heavens … he that giveth breath unto the people upon it* (Isaiah 42:5). And the wisdom of the fathers had taught the same seeing: *by the greatness and beauty of the creatures proportionably the maker of them is seen* (Wisdom of Solomon 13:5). The unknown God is the Maker of heaven and earth, housed by nothing he made, the giver of the very breath of every man who would worship him.',
       sv.verse_id, ev.verse_id, 'extras', 5684
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation',
       E'Of one blood all nations — and the bounds of their habitation',
       E'Paul presses the Maker''s claim further: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). This is the Song of Moses set in the mouth of the apostle. Moses sang of the same apportioning of the same nations by the same Maker: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The bounds of the Areopagus are the bounds of the Song: the El Elyon (most High) who separated the sons of Adam and set every people in its place — the nations ordered around the children of Yashar''el (Israel), the times and the borders determined by the One who made of one blood all nations of men. The Maker''s claim on the nations is his ordering of the earth he made, not a flattening of the seed he set at the centre of it.',
       sv.verse_id, ev.verse_id, 'free', 5687
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations',
       E'That they should seek Yahuah (Lord) — the Maker summoning the nations',
       E'The Maker set the times and the bounds *that they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us* (Acts 17:27). The end of the ordering is the seeking. Isaiah declared the same Maker for the same purpose: *he formed the earth … he created it not in vain, he formed it to be inhabited: I am Yahuah (LORD); and there is none else* (Isaiah 45:18) — and to the ends of the earth he calls, *Look unto me, and be ye saved, all the ends of the earth: for I am Elohim (God), and there is none else* (Isaiah 45:22). The wisdom of the fathers named the groping itself: men *seeking Yahuah (God), and desirous to find him* (Wisdom of Solomon 13:6), feeling after the One who set them in their place. But the seeking is no warrant for the idol — *we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device* (Acts 17:29). Isaiah exposed the graven image: *they have no knowledge that set up the wood of their graven image, and pray unto a god that cannot save* (Isaiah 45:20); and the fathers'' wisdom: *in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver* (Wisdom of Solomon 13:10). The Maker summons the nations he formed to seek him — not to fashion him after the dead works of their own hands, but to find the living One who is not far off.',
       sv.verse_id, ev.verse_id, 'extras', 5690
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-the-appointed-man-the-day-of-judgment-in-righteousness',
       E'The appointed Man — the day of judgment in righteousness',
       E'Paul brings the Areopagus to its edge: *the times of this ignorance Elohim (God) winked at; but now commandeth all men every where to repent: Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained* (Acts 17:30-31). The appointed day is the day the Psalmist sang: *he cometh to judge the earth: he shall judge the world with righteousness, and the people with his truth* (Psalm 96:13). And the ordained Man is the One Daniel saw in the night vision: *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13) — the Formed who took on flesh, resembling mortal-man, brought near before the throne — *and there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14). The nations made of one blood and set in their bounds (Acts 17:26) are the nations given to serve the ordained Man. And the Master named the ground of his right to judge them: *hath given him authority to execute judgment also, because he is the Son of Adam* (John 5:27). The Judge of the appointed day is the Son of Adam, the seed of Adam come in flesh, to whom the Father committed all judgment — the Maker who summons the nations is the One who will try them by the Man he ordained.',
       sv.verse_id, ev.verse_id, 'free', 5693
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given',
       E'Raised from the dead — the firstfruits and the assurance given',
       E'The assurance of the appointed day is not a sign yet to come but one already given: *whereof he hath given assurance unto all men, in that he hath raised him from the dead* (Acts 17:31). The raising was written in the Psalm David sang: *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). When the Athenians *heard of the resurrection of the dead, some mocked* (Acts 17:32) — yet the resurrection they mocked is the firstfruits of a harvest, not a single isolated wonder. *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* (1 Corinthians 15:20); and the harvest has its order — *Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* (1 Corinthians 15:23). The One raised is the first sheaf gone before; the dead whom the appointed Man will judge are the dead who shall be raised. The resurrection is the pledge the Maker has already laid down that the day is fixed and the Judge is seated — the firstfruits the assurance of the gathering to come.',
       sv.verse_id, ev.verse_id, 'free', 5696
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:5 — *he was wounded for our transgressions … with his stripes we are healed* the suffering Paul reasons out of the scriptures (Acts 17:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:8 — *he was cut off out of the land of the living: for the transgression of my people was he stricken* the servant whose cutting-off the rising answers (Acts 17:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 16:10 — *neither wilt thou suffer thine Holy One to see corruption* the rising written in the Psalm, the resurrection Paul preaches (Acts 17:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 24:26 — *Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* the suffering-then-glory the Master opened (Acts 17:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 24:46 — *thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day* the written word Paul shows in the synagogue (Acts 17:2-3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-these-that-have-turned-the-world-upside-down-another-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:44 — *the Elohim (God) of heaven set up a kingdom, which shall never be destroyed … it shall stand for ever* the kingdom of the other King (Acts 17:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-these-that-have-turned-the-world-upside-down-another-king'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:7 — *upon the throne of David, and upon his kingdom … for ever* the throne of the King the rulers fear (Acts 17:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-these-that-have-turned-the-world-upside-down-another-king'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 8:20 — *to the law and to the testimony: if they speak not according to this word … there is no light in them* the test the Bereans applied (Acts 17:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:39 — *Search the scriptures … they are they which testify of me* the searching the Bereans practised, the witness they found (Acts 17:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 8:27 — *the heaven and heaven of heavens cannot contain thee; how much less this house* Solomon''s word at the temple itself, that the Maker is not housed by hands (Acts 17:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:1 — *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* the Maker who dwells not in temples made with hands (Acts 17:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 66:2 — *all those things hath mine hand made … but to this man will I look … that trembleth at my word* the Maker who looks to the contrite heart, not the house (Acts 17:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 42:5 — *he that giveth breath unto the people upon it, and spirit to them that walk therein* the Maker who needs nothing and gives all life and breath (Acts 17:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 13:5 — *by the greatness and beauty of the creatures proportionably the maker of them is seen* the works pointing past themselves to the unknown God (Acts 17:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:8 — *when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* the Song of Moses behind the bounds of habitation (Acts 17:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 45:18 — *he formed the earth … he formed it to be inhabited: I am Yahuah (LORD); and there is none else* the Maker who formed the earth to be dwelt in, that men might seek him (Acts 17:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 13:6 — *they perhaps err, seeking Yahuah (God), and desirous to find him* the groping after the Maker, the seeking that is his summons (Acts 17:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 45:20 — *they have no knowledge that set up the wood of their graven image, and pray unto a god that cannot save* the idol Paul says the offspring of Elohim (God) must not fashion (Acts 17:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 13:10 — *in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver* the dead works the living Maker is not to be likened to (Acts 17:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-the-appointed-man-the-day-of-judgment-in-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 96:13 — *he cometh to judge the earth: he shall judge the world with righteousness* the appointed day of judgment the Psalmist sang (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-appointed-man-the-day-of-judgment-in-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* the ordained Man brought before the throne; the kaph honours the Formed who took on flesh (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-appointed-man-the-day-of-judgment-in-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *there was given him dominion … all people, nations, and languages, should serve him* the nations of one blood given to serve the ordained Man (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-appointed-man-the-day-of-judgment-in-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 5:27 — *hath given him authority to execute judgment also, because he is the Son of Adam* the ground of the ordained Man''s right to judge (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-appointed-man-the-day-of-judgment-in-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 16:10 — *neither wilt thou suffer thine Holy One to see corruption* the raising written in the Psalm, the assurance given (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:20 — *now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* the resurrection the Athenians mocked is the firstfruits of a harvest (Acts 17:32).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:23 — *Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* the order of the harvest the first sheaf assures (Acts 17:32).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_18.sql (S217 Acts 18) -----
-- =====================================================================
-- S217 minion — ACTS 18 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 18.  Tag: a18 (temp view _s217_a18_lookup).  Sort band: 5700-5712.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #4/#7/#11, Christology, son-of-Adam, dropped-Paul):
--  * "Your blood be upon your own heads; I am clean" (18:6): this is Ezekiel's watchman
--    (Ezekiel 33:7-9; 3:18-19) — the watchman who blows the trumpet and warns is clean of
--    the blood; the blood is required at the hand of the watchman who fails to warn. Paul
--    has warned; the blood is now on their own heads, not his. NEVER read as a verdict
--    casting off a people — it is the watchman cleared, the warning delivered, the call
--    still standing (cf. Ezekiel 33:11, no pleasure in the death of the wicked).
--  * "I have much people in this city" (18:9-10): the remnant Yahuah (Lord) keeps and
--    gathers — the much-people already his in Corinth, his sheep who will hear (the hearing
--    revealing what was already true, never names added after the foundation). The night
--    vision *Be not afraid … for I am with thee* is the same comfort given Jeremiah and the
--    servant of Isaiah (Jeremiah 1:8; Isaiah 41:10; 43:5 — the gathering of the seed from
--    east and west). Read as the remnant kept, NOT false-inclusion of non-seed by confession.
--  * The vow / shorn head at Cenchrea (18:18): a Nazarite-style vow (Numbers 6) — Paul
--    Torah-observant, separating himself unto Yahuah (LORD). This is the dropped-Paul
--    correction: the Paul who abolished the Torah does not exist; here he takes a vow, and
--    in Acts 21:24 pays the charges for four men's vows precisely so all may know *that thou
--    thyself also walkest orderly, and keepest the law.* Never let the vow read as residue
--    of a system Paul left behind.
--  * Apollos / "the way more perfectly" / "the baptism of John" (18:24-26): Apollos mighty
--    in the scriptures, knowing only John's baptism, is shown the way more perfectly — the
--    same gap Paul fills for the Ephesian disciples in Acts 19:1-6 (John's baptism of
--    repentance completed in the name of the Lord Yahusha (Lord Jesus) and the Ruach
--    HaKodesh (Holy Spirit)). The come-and-see: the way is unfolded more perfectly, not a
--    new religion installed.
--  * "Watered … helped them much which had believed through grace" (18:27-28): the
--    planted/watered of 1 Corinthians 3:6 (Paul planted, Apollos watered, Elohim (God) gave
--    the increase) and the rain-and-the-word of Isaiah 55:10-11 (the word that goeth forth
--    shall not return void). "Through grace" is the means by which the increase is given —
--    NOT a standalone freedom-from-Torah formula (Red Line #10); grace waters the seed home.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 18:
--   v.1-3   Aquila/Priscilla, tentmakers   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; Paul the laborer with his hands carried elsewhere)
--   v.4-5   reasoned/testified Yahusha is Messiah  Tanakh: none added (the scriptures-prove carried in v.28 thread)  Extras: none warranted  NT: none warranted (narrative)
--   v.6     blood on your own heads; I am clean  Tanakh: Ezekiel 33:7, Ezekiel 33:8, Ezekiel 3:18  Extras: none warranted  NT: none warranted
--   v.7-8   Justus/Crispus believe, baptized  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.9-10  night vision: be not afraid, I am with thee, much people  Tanakh: Jeremiah 1:8, Isaiah 41:10, Isaiah 43:5  Extras: none warranted  NT: none warranted
--   v.11    continued teaching the word  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.12-17 Gallio refuses to judge        Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; "question of words and names, and of your law")
--   v.18    shorn head in Cenchrea, a vow  Tanakh: Numbers 6:5, Numbers 6:18  Extras: none warranted  NT: Acts 21:24
--   v.19-23 Ephesus/Antioch/Galatia, keep the feast  Tanakh: none added (feast-keeping carried thematically by the vow/Torah thread)  Extras: none warranted  NT: none warranted (narrative; "I must by all means keep this feast")
--   v.24-26 Apollos, the way more perfectly, John's baptism  Tanakh: none warranted  Extras: none warranted  NT: Acts 19:4, Acts 19:5, Acts 19:6
--   v.27-28 watered / believed through grace / scriptures prove  Tanakh: Isaiah 55:10, Isaiah 55:11  Extras: none warranted  NT: 1 Corinthians 3:6, 1 Corinthians 3:9
--
-- THREADS (slug -> target libraries):
--   5700 acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared  (Tanakh)
--   5703 acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept      (Tanakh)
--   5706 acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law  (Tanakh + NT)
--   5709 acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john               (NT)
--   5712 acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers        (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared
  ('canon', 'acts', 18, 6, 'canon', 'ezekiel', 33, 7, 'free', E'*So thou, O son of Adam, I have set thee a watchman unto the house of Yashar''el (Israel); therefore thou shalt hear the word at my mouth, and warn them from me.* (Ezekiel 33:7). When they opposed and blasphemed, *he shook his raiment, and said unto them, Your blood be upon your own heads; I am clean* (Acts 18:6). This is the watchman of Ezekiel: the one set to hear the word at Yahuah''s (LORD''s) mouth and warn the house. Paul has warned; he stands in the watchman''s office, and his raiment shaken is the trumpet blown.'),
  ('canon', 'acts', 18, 6, 'canon', 'ezekiel', 33, 8, 'free', E'*When I say unto the wicked, O wicked man, thou shalt surely die; if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand.* (Ezekiel 33:8). The watchman who fails to warn carries the blood at his own hand; the watchman who warns is cleared. *Your blood be upon your own heads; I am clean* (Acts 18:6) is exactly this acquittal — the warning delivered, the blood now upon those who would not hear, the watchman''s hand washed of it.'),
  ('canon', 'acts', 18, 6, 'canon', 'ezekiel', 3, 18, 'free', E'*When I say unto the wicked, Thou shalt surely die; and thou givest him not warning, nor speakest to warn the wicked from his wicked way, to save his life; the same wicked man shall die in his iniquity; but his blood will I require at thine hand.* (Ezekiel 3:18). From the first the watchman''s charge was the same: warn, and *thou hast delivered thy soul* (Ezekiel 3:19). Paul, having testified that Yahusha (Jesus) was Messiah (Christ) and met only blasphemy, declares himself clean — the soul delivered, the warning given, the blood upon their own heads, not his.'),
  -- thread: acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept
  ('canon', 'acts', 18, 9, 'canon', 'jeremiah', 1, 8, 'free', E'*Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD).* (Jeremiah 1:8). In the night vision *spake Yahuah (Lord) to Paul … Be not afraid, but speak, and hold not thy peace* (Acts 18:9). It is the very word Yahuah (LORD) gave Jeremiah at his sending — *be not afraid … for I am with thee.* The One who steadied the prophet against the faces of the people steadies Paul in Corinth: speak, hold not thy peace, for I am with thee.'),
  ('canon', 'acts', 18, 10, 'canon', 'isaiah', 41, 10, 'free', E'*Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* (Isaiah 41:10). *For I am with thee, and no man shall set on thee to hurt thee* (Acts 18:10). The promise spoken to the servant — *fear thou not; for I am with thee* — is spoken again over Paul: the same presence that upholds with the right hand of righteousness guards him that none shall hurt him in that city.'),
  ('canon', 'acts', 18, 10, 'canon', 'isaiah', 43, 5, 'free', E'*Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* (Isaiah 43:5). *For I have much people in this city* (Acts 18:10). The much-people Yahuah (Lord) names as already his in Corinth are the seed he gathers from east and west — his sheep who will hear because they are his, the scattered remnant kept and called home. *Fear not: for I am with thee* is the word over the gathering: the people are already his before the word reaches them; the hearing reveals what was already true.'),
  -- thread: acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law
  ('canon', 'acts', 18, 18, 'canon', 'numbers', 6, 5, 'free', E'*All the days of the vow of his separation there shall no razor come upon his head: until the days be fulfilled, in the which he separateth himself unto Yahuah (LORD), he shall be holy, and shall let the locks of the hair of his head grow.* (Numbers 6:5). Paul *took his leave of the brethren … having shorn his head in Cenchrea: for he had a vow* (Acts 18:18). The vow is the Nazarite''s: the hair let grow through the days of separation unto Yahuah (LORD), then shorn when the days are fulfilled. This is no relic of an abandoned system — it is Paul separating himself unto Yahuah (LORD) by the very law of the Nazarite.'),
  ('canon', 'acts', 18, 18, 'canon', 'numbers', 6, 18, 'free', E'*And the Nazarite shall shave the head of his separation at the door of the tabernacle of the congregation, and shall take the hair of the head of his separation, and put it in the fire which is under the sacrifice of the peace offerings.* (Numbers 6:18). The shorn head at Cenchrea — *having shorn his head … for he had a vow* (Acts 18:18) — is the close of the Nazarite''s separation, the hair brought to the fire of the peace offering. Paul keeps the law of the vow he took, walking orderly in the Torah he never left.'),
  ('canon', 'acts', 18, 18, 'canon', 'acts', 21, 24, 'free', E'*Them take, and purify thyself with them, and be at charges with them, that they may shave their heads: and all may know that those things, whereof they were informed concerning thee, are nothing; but that thou thyself also walkest orderly, and keepest the law.* (Acts 21:24). The vow at Cenchrea is no isolated act: in Yerushalayim (Jerusalem) Paul pays the charges for four men under a vow that all may see *thou thyself also walkest orderly, and keepest the law.* The shorn head of Acts 18:18 and the four men''s vows of Acts 21:24 testify to one man — Torah-observant, keeping the vow, keeping the law.'),
  -- thread: acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john
  ('canon', 'acts', 18, 25, 'canon', 'acts', 19, 4, 'free', E'*Then said Paul, John verily baptized with the baptism of repentance, saying unto the people, that they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus).* (Acts 19:4). Apollos *taught diligently the things of Yahuah (Lord), knowing only the baptism of John* (Acts 18:25). The gap is the very one Paul names to the disciples at Ephesus: John''s baptism was the baptism of repentance pointing forward to the One coming after — *that is, on HaMashiach Yahusha (Christ Jesus).* The baptism of John is true and points home; it is completed, not discarded, by the One it pointed to.'),
  ('canon', 'acts', 18, 26, 'canon', 'acts', 19, 5, 'free', E'*When they heard this, they were baptized in the name of the Lord Yahusha (Lord Jesus).* (Acts 19:5). When Aquila and Priscilla heard Apollos, *they took him unto them, and expounded unto him the way of Elohim (God) more perfectly* (Acts 18:26). The same completing happens at Ephesus: those who knew only John''s baptism are now *baptized in the name of the Lord Yahusha (Lord Jesus).* The way of Elohim (God) is unfolded more perfectly — the repentance of John carried through to the Lord Yahusha (Lord Jesus) it always pointed toward.'),
  ('canon', 'acts', 18, 26, 'canon', 'acts', 19, 6, 'free', E'*And when Paul had laid his hands upon them, the Ruach HaKodesh (Holy Spirit) came on them; and they spake with tongues, and prophesied.* (Acts 19:6). Apollos, fervent in the spirit yet knowing only John''s baptism, is shown *the way of Elohim (God) more perfectly* (Acts 18:26); and at Ephesus the disciples who knew only John''s baptism receive the Ruach HaKodesh (Holy Spirit) when Paul lays hands upon them. The more-perfect way is the way completed in the Spirit — the repentance of John brought home to the outpouring promised.'),
  -- thread: acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers
  ('canon', 'acts', 18, 27, 'canon', '1-corinthians', 3, 6, 'free', E'*I have planted, Apollos watered; but Elohim (God) gave the increase.* (1 Corinthians 3:6). Apollos passes into Achaia and *helped them much which had believed through grace* (Acts 18:27). Paul names the labor exactly: he himself planted at Corinth, and Apollos — coming after — watered; but the increase is Elohim''s (God''s). The helping much is the watering of a seed already planted, and the grace through which they believed is the means by which Elohim (God) gives the increase.'),
  ('canon', 'acts', 18, 27, 'canon', 'isaiah', 55, 10, 'free', E'*For as the rain cometh down, and the snow from heaven, and returneth not thither, but watereth the earth, and maketh it bring forth and bud, that it may give seed to the sower, and bread to the eater:* (Isaiah 55:10). Apollos *watered* those who had believed (Acts 18:27) as the rain waters the earth — coming down to make the ground bring forth and bud. The watering is not the increase; it is the rain over the seed, that Elohim (God) may give the bringing-forth.'),
  ('canon', 'acts', 18, 28, 'canon', 'isaiah', 55, 11, 'free', E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* (Isaiah 55:11). Apollos *mightily convinced the Yahudim (Jews), and that publickly, shewing by the scriptures that Yahusha (Jesus) was Messiah (Christ)* (Acts 18:28). The word goeth forth out of the mouth and does not return void: shown by the scriptures, it accomplishes what Yahuah (LORD) pleases and prospers in the thing whereto he sent it — the scriptures themselves witnessing the Messiah (Christ) they foretold.'),
  ('canon', 'acts', 18, 27, 'canon', '1-corinthians', 3, 9, 'free', E'*For we are labourers together with Elohim (God): ye are Elohim''s (God''s) husbandry, ye are Elohim''s (God''s) building.* (1 Corinthians 3:9). The brethren wrote exhorting the disciples to receive Apollos, who *helped them much which had believed through grace* (Acts 18:27). Planter and waterer are one work — *labourers together with Elohim (God)* — and the believers are Elohim''s (God''s) husbandry, the field he tends. The grace through which they believed is Elohim (God) giving the increase upon the labor of his servants.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared',
       E'Your blood be upon your own heads — the watchman of Yashar''el (Israel) cleared',
       E'Paul testifies in the synagogue at Corinth *that Yahusha (Jesus) was Messiah (Christ)* (Acts 18:5); and *when they opposed themselves, and blasphemed, he shook his raiment, and said unto them, Your blood be upon your own heads; I am clean* (Acts 18:6). This is the watchman of Ezekiel, word for word in office. Yahuah (LORD) had set the prophet *a watchman unto the house of Yashar''el (Israel); therefore thou shalt hear the word at my mouth, and warn them from me* (Ezekiel 33:7), and the charge was exact: *if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand* (Ezekiel 33:8). From the first the same word stood — *thou givest him not warning … his blood will I require at thine hand* (Ezekiel 3:18) — and the watchman who warns *hath delivered his soul.* Paul has blown the trumpet; the warning is delivered; the watchman''s hand is washed of the blood. This is not a verdict casting off a people but the watchman cleared — and the call still stands, for Yahuah (LORD) saith *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11).',
       sv.verse_id, ev.verse_id, 'free', 5700
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept',
       E'I am with thee, I have much people in this city — the remnant kept',
       E'In the night Yahuah (Lord) speaks to Paul by a vision: *Be not afraid, but speak, and hold not thy peace: For I am with thee, and no man shall set on thee to hurt thee: for I have much people in this city* (Acts 18:9-10). The comfort is the prophets'' own. To Jeremiah at his sending: *Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD)* (Jeremiah 1:8). To the servant: *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee* (Isaiah 41:10). The same presence that steadied the prophets against the faces of the people now guards Paul, that none shall hurt him. And the ground of the comfort is the much-people already his: *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west* (Isaiah 43:5). The much-people in Corinth are the seed Yahuah (Lord) gathers from east and west — his sheep who will hear because they are already his. They are not made his people by responding; they respond because they are his people. The hearing reveals what was already true; the remnant is kept and called home.',
       sv.verse_id, ev.verse_id, 'free', 5703
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law',
       E'Having shorn his head in Cenchrea — Paul the Nazarite, keeping the law',
       E'Paul *took his leave of the brethren, and sailed thence into Syria, and with him Priscilla and Aquila; having shorn his head in Cenchrea: for he had a vow* (Acts 18:18). The vow is the Nazarite''s, by the law of Numbers 6. Through the days of separation *there shall no razor come upon his head … he shall be holy, and shall let the locks of the hair of his head grow* (Numbers 6:5); and when the days are fulfilled, *the Nazarite shall shave the head of his separation … and put it in the fire which is under the sacrifice of the peace offerings* (Numbers 6:18). The shorn head at Cenchrea is the close of a separation unto Yahuah (LORD) — Paul keeping the very law of the vow he took. This is no residue of a system he had left behind: in Yerushalayim (Jerusalem) he pays the charges for four men under a vow precisely *that all may know … that thou thyself also walkest orderly, and keepest the law* (Acts 21:24). The Paul who abolished the Torah does not exist. Here is the Paul who is — separating himself unto Yahuah (LORD), keeping the vow, keeping the law.',
       sv.verse_id, ev.verse_id, 'free', 5706
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john',
       E'The way more perfectly — Apollos and the baptism of John',
       E'Apollos comes to Ephesus *an eloquent man, and mighty in the scriptures … instructed in the way of Yahuah (Lord); and being fervent in the spirit, he spake and taught diligently the things of Yahuah (Lord), knowing only the baptism of John* (Acts 18:24-25). When Aquila and Priscilla hear him, *they took him unto them, and expounded unto him the way of Elohim (God) more perfectly* (Acts 18:26). The gap is named exactly when Paul meets the Ephesian disciples who also knew only John''s baptism: *John verily baptized with the baptism of repentance, saying unto the people, that they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus)* (Acts 19:4). The baptism of John is true and points forward; it is not discarded but carried home to the One it pointed to. *When they heard this, they were baptized in the name of the Lord Yahusha (Lord Jesus)* (Acts 19:5), and *when Paul had laid his hands upon them, the Ruach HaKodesh (Holy Spirit) came on them* (Acts 19:6). The more-perfect way is the way completed in the Lord Yahusha (Lord Jesus) and in the Spirit — the repentance of John brought through to the outpouring it always promised.',
       sv.verse_id, ev.verse_id, 'free', 5709
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers',
       E'I planted, Apollos watered — the rain and the word that prospers',
       E'Apollos passes into Achaia and *helped them much which had believed through grace* (Acts 18:27), and *mightily convinced the Yahudim (Jews), and that publickly, shewing by the scriptures that Yahusha (Jesus) was Messiah (Christ)* (Acts 18:28). Paul names the labor exactly: *I have planted, Apollos watered; but Elohim (God) gave the increase* (1 Corinthians 3:6). Paul planted the seed at Corinth; Apollos, coming after, watered; and the increase is Elohim''s (God''s). It is the rain of Isaiah: *as the rain cometh down, and the snow from heaven, and returneth not thither, but watereth the earth, and maketh it bring forth and bud* (Isaiah 55:10) — the watering is not the increase but the rain over the seed, that the ground may bring forth. And the scriptures by which Apollos convinces are themselves the word that does not return void: *so shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). Planter and waterer are one work — *labourers together with Elohim (God): ye are Elohim''s (God''s) husbandry* (1 Corinthians 3:9). The grace through which they believed is the means by which Elohim (God) gives the increase — grace watering the seed home, not a freedom standing apart from his ways.',
       sv.verse_id, ev.verse_id, 'free', 5712
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:7 — *I have set thee a watchman unto the house of Yashar''el (Israel) … warn them from me* the watchman''s office Paul stands in, the trumpet blown (Acts 18:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 33:8 — *his blood will I require at thine hand* the watchman who warns is cleared; *I am clean* (Acts 18:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 3:18 — *thou givest him not warning … his blood will I require at thine hand* the watchman''s charge from the first; warn, and the soul is delivered (Acts 18:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 1:8 — *Be not afraid of their faces: for I am with thee to deliver thee* the prophet''s sending-word now over Paul (Acts 18:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:10 — *Fear thou not; for I am with thee … I will uphold thee with the right hand of my righteousness* the servant''s comfort; none shall set on Paul to hurt him (Acts 18:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 43:5 — *I will bring thy seed from the east, and gather thee from the west* the much-people already his, the seed gathered; they hear because they are his (Acts 18:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 6:5 — *there shall no razor come upon his head … he shall let the locks of the hair of his head grow* the Nazarite''s separation unto Yahuah (LORD), the vow Paul took (Acts 18:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 6:18 — *the Nazarite shall shave the head of his separation* the shorn head at Cenchrea, the close of the vow (Acts 18:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 21:24 — *that thou thyself also walkest orderly, and keepest the law* the same Paul pays the charges for four men''s vows in Yerushalayim (Jerusalem); the vow at Cenchrea is no isolated act (Acts 18:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 19:4 — *John verily baptized with the baptism of repentance … that they should believe on him which should come after him* the gap Apollos had, knowing only John''s baptism (Acts 18:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 19:5 — *they were baptized in the name of the Lord Yahusha (Lord Jesus)* the way of Elohim (God) expounded more perfectly, John''s baptism carried home (Acts 18:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 19:6 — *the Ruach HaKodesh (Holy Spirit) came on them* the more-perfect way completed in the Spirit (Acts 18:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 3:6 — *I have planted, Apollos watered; but Elohim (God) gave the increase* Paul names the labor; Apollos helps much those who believed (Acts 18:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 55:10 — *as the rain cometh down … and watereth the earth* the watering of the seed, the rain over the ground (Acts 18:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 3:9 — *labourers together with Elohim (God): ye are Elohim''s (God''s) husbandry* planter and waterer one work; grace gives the increase (Acts 18:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 55:11 — *my word … shall not return unto me void, but it shall accomplish that which I please* the scriptures by which Apollos convinces, the word that prospers (Acts 18:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_19.sql (S217 Acts 19) -----
-- =====================================================================
-- S217 minion — ACTS 19 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 19.  Tag: a19 (temp view _s217_a19_lookup).  Sort band: 5725-5740.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines, Christology, son-of-Adam, sola-fide):
--  * The twelve disciples / John's baptism (19:1-7): John's baptism is COMPLETED, not
--    repudiated — John baptized unto repentance and pointed forward to the One coming after
--    him (Acts 13:24; Matthew 3:11; John 1:26-27), and the Spirit poured at the laying on of
--    hands (Acts 1:5) is the baptism John always pointed to. The Spirit and the word/way are
--    inseparable (Red Line #6) — the Spirit is the seal of the One John preached, not a thing
--    apart. Twelve men, the number of the tribes: the down-payment of the gathering at Ephesus.
--  * The name not a formula for the unsent (19:13-17, the sons of Sceva): *Yahusha (Jesus) I
--    know, and Paul I know; but who are ye?* The name is not a power-tool wielded by the
--    unsent. Matthew 7:22-23's *I never knew you* is spoken to those who used the name without
--    being known by him — the post-harvest sifting of the unfruitful (Red Line #11), NOT a
--    verdict on tares. Luke 10:17's seventy were SENT; the devils were subject through the name
--    to the sent. Read as the name's authority belonging to the sent and the known, never as a
--    formula or technique.
--  * The idol polemic (19:26-27, *they be no gods, which are made with hands*): the Tanakh's
--    own polemic against the work of men's hands (Isaiah 44, Jeremiah 10, Psalm 115, Habakkuk
--    2) and Wisdom of Solomon's *that which is made with hands is cursed.* The living Elohim
--    (God) who made the heavens against the dumb idol that cannot speak — the Formed-one's own
--    word through the prophets, now preached by Paul against Diana.
--  * The books burned (19:18-19): turning from the abominations of divination (Deuteronomy
--    18:10-12) — the price counted, the curious arts renounced. Repentance unto the way, the
--    homecoming that turns from what Yahuah (LORD) calls abomination. Not a how-to of practice
--    but the dismantling of the divination the nations hearkened to.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 19:
--   v.1-7   the twelve disciples / John's baptism completed
--           Tanakh: none warranted (the forward-pointing of John carried in the NT targets)
--           Extras: none warranted
--           NT: Acts 13:24, Matthew 3:11, John 1:26, John 1:27, Acts 1:5
--   v.8-10  synagogue / school of Tyrannus / all Asia heard the word
--           Tanakh: Isaiah 55:11 (the word that goeth forth shall not return void; carried in the v.20 grew-and-prevailed thread)
--           Extras: none warranted   NT: none warranted (narrative)
--   v.11-12 special miracles / handkerchiefs   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.13-17 the seven sons of Sceva / the name  Tanakh: none warranted (the name-over-spirits carried in NT)  Extras: none warranted
--           NT: Matthew 7:22, Matthew 7:23, Luke 10:17, Mark 9:39, Acts 16:17
--   v.18-19 confessed deeds / burned the books   Tanakh: Deuteronomy 18:10, Deuteronomy 18:12  Extras: none warranted  NT: none warranted
--   v.20    so mightily grew the word and prevailed  Tanakh: Isaiah 55:11  Extras: none warranted  NT: none warranted
--   v.21-22 Paul purposed ... I must also see Rome   Tanakh: none warranted  Extras: none warranted  NT: Acts 23:11 (Acts<->Acts: the Lord confirms the witness at Rome)
--   v.23-34 the riot of Demetrius / Diana / no gods made with hands
--           Tanakh: Isaiah 44:9, Jeremiah 10:5, Jeremiah 10:11, Psalm 115:4, Habakkuk 2:18
--           Extras: Wisdom of Solomon 14:8 (that which is made with hands is cursed)   NT: none warranted
--   v.35-41 the townclerk appeases the assembly   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5725 acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit  (NT)
--   5728 acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva       (NT)
--   5731 acts-19-they-burned-their-books-turning-from-the-abominations           (Tanakh)
--   5734 acts-19-so-mightily-grew-the-word-of-god-and-prevailed                  (Tanakh)
--   5737 acts-19-i-must-also-see-rome-the-witness-the-lord-confirms              (NT, Acts<->Acts)
--   5740 acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic      (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s217_a19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit
  ('canon', 'acts', 19, 3, 'canon', 'acts', 13, 24, 'free', E'*When John had first preached before his coming the baptism of repentance to all the people of Yashar''el (Israel).* (Acts 13:24). The twelve at Ephesus had received *John''s baptism* (Acts 19:3) — and John''s baptism was never an end in itself. It was *the baptism of repentance* preached *before his coming,* turning the people toward the One who was to come. The Ephesian disciples are not being told John was wrong; they are being shown what John''s baptism always pointed to and is now fulfilled in.'),
  ('canon', 'acts', 19, 4, 'canon', 'matthew', 3, 11, 'free', E'*I indeed baptize you with water unto repentance: but he that cometh after me is mightier than I, whose shoes I am not worthy to bear: he shall baptize you with the Ruach HaKodesh (Holy Spirit), and with fire:* (Matthew 3:11). Paul tells the Ephesians the very thing John himself said: *John verily baptized with the baptism of repentance, saying unto the people, that they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus)* (Acts 19:4). John baptized with water and pointed forward; the One coming after baptizes with the Ruach HaKodesh (Holy Spirit). The water-baptism was the pointing; the Spirit is the One pointed to.'),
  ('canon', 'acts', 19, 4, 'canon', 'john', 1, 26, 'free', E'*John answered them, saying, I baptize with water: but there standeth one among you, whom ye know not;* (John 1:26). John''s own testimony was that his water-baptism stood in the shadow of Another *whom ye know not* — the One *which should come after him* (Acts 19:4). The Ephesian twelve had John''s water and not yet the One John named; Paul brings them the One who was always standing just beyond the water.'),
  ('canon', 'acts', 19, 4, 'canon', 'john', 1, 27, 'free', E'*He it is, who coming after me is preferred before me, whose shoe''s latchet I am not worthy to unloose.* (John 1:27). John pointed past himself to the One *coming after* — the same word Paul puts in John''s mouth at Ephesus: *they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus)* (Acts 19:4). The forerunner''s whole office was the finger pointing forward; the believing the twelve are brought to is belief in the One the finger named.'),
  ('canon', 'acts', 19, 6, 'canon', 'acts', 1, 5, 'free', E'*For John truly baptized with water; but ye shall be baptized with the Ruach HaKodesh (Holy Spirit) not many days hence.* (Acts 1:5). The Master''s own word divides the water of John from the Spirit to come — and at Ephesus the division is closed: *when Paul had laid his hands upon them, the Ruach HaKodesh (Holy Spirit) came on them; and they spake with tongues, and prophesied* (Acts 19:6). The baptism John always pointed to falls on the twelve. The Spirit is not a thing apart from the way they believed; he is the seal of the One John preached.'),
  -- thread: acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva
  ('canon', 'acts', 19, 13, 'canon', 'matthew', 7, 22, 'free', E'*Many will say to me in that day, Yahuah (Lord), Yahuah (Lord), have we not prophesied in thy name? and in thy name have cast out devils? and in thy name done many wonderful works?* (Matthew 7:22). The vagabond exorcists *took upon them to call over them which had evil spirits the name of the Lord Yahusha (Lord Jesus), saying, We adjure you by Yahusha (Jesus) whom Paul preacheth* (Acts 19:13). The name is not a tool in the hand of the unsent. Those who use the name without being known by him are the ones to whom the word *I never knew you* is spoken — the name borrowed, the man unknown.'),
  ('canon', 'acts', 19, 15, 'canon', 'matthew', 7, 23, 'free', E'*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.* (Matthew 7:23). The evil spirit makes the same distinction the Master makes: *Yahusha (Jesus) I know, and Paul I know; but who are ye?* (Acts 19:15). Even the demon knows the difference between the sent and the borrower. The name carries no power for the man the One it names *never knew* — the sons of Sceva flee naked and wounded, exposed as the unknown who handled what was not theirs.'),
  ('canon', 'acts', 19, 13, 'canon', 'luke', 10, 17, 'free', E'*And the seventy returned again with joy, saying, Yahuah (Lord), even the devils are subject unto us through thy name.* (Luke 10:17). The seventy were SENT, and to the sent the devils were subject through the name. The sons of Sceva were not sent — they *took upon them* (Acts 19:13) a name they had no commission to wield. The same name that bows the spirits for those the Master sends does nothing for those who snatch it up as a formula.'),
  ('canon', 'acts', 19, 15, 'canon', 'mark', 9, 39, 'free', E'*But Yahusha (Jesus) said, Forbid him not: for there is no man which shall do a miracle in my name, that can lightly speak evil of me.* (Mark 9:39). A true work in the name binds a man to the One named. But the sons of Sceva do no work at all — the spirit answers *Yahusha (Jesus) I know, and Paul I know; but who are ye?* (Acts 19:15) and overcomes them. The name does not honour the borrower; it exposes him. The contrast is sharp: the one casting out in his name truly cannot speak evil of him, while the one merely invoking the name is left naked.'),
  ('canon', 'acts', 19, 13, 'canon', 'acts', 16, 17, 'free', E'*The same followed Paul and us, and cried, saying, These men are the servants of the El Elyon (most high God), which shew unto us the way of salvation.* (Acts 16:17). Even the spirit of divination at Philippi confessed who the sent men were — *the servants of the El Elyon (most high God).* So too at Ephesus the evil spirit knows Paul and knows Yahusha (Jesus), but not the seven who borrow the name (Acts 19:13,15). The spirits recognize the sent; what they will not yield to is the unsent mouthing the name as an incantation.'),
  -- thread: acts-19-they-burned-their-books-turning-from-the-abominations
  ('canon', 'acts', 19, 19, 'canon', 'deuteronomy', 18, 10, 'free', E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* (Deuteronomy 18:10). *Many of them also which used curious arts brought their books together, and burned them before all men* (Acts 19:19). The curious arts are the very divination Moses forbade — the enchantments, the observing of times, the wizardry the nations practiced. The burning of the books is the turning Moses called for: the abomination renounced, cast into the fire, the price of it counted and let go.'),
  ('canon', 'acts', 19, 19, 'canon', 'deuteronomy', 18, 12, 'free', E'*For all that do these things are an abomination unto Yahuah (LORD): and because of these abominations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee.* (Deuteronomy 18:12). The divination that made the nations an abomination — and drove them from the land — is what the Ephesian believers now burn from their own hands: they *counted the price of them, and found it fifty thousand pieces of silver* (Acts 19:19). The homecoming turns from what Yahuah (LORD) calls abomination; the books go into the fire and the word of Elohim (God) grows.'),
  -- thread: acts-19-so-mightily-grew-the-word-of-god-and-prevailed
  ('canon', 'acts', 19, 20, 'canon', 'isaiah', 55, 11, 'free', E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* (Isaiah 55:11). *So mightily grew the word of Elohim (God) and prevailed* (Acts 19:20), so that *all they which dwelt in Asia heard the word of the Lord Yahusha (Lord Jesus), both Yahudim (Jews) and Greeks* (Acts 19:10). The word that goeth forth from his mouth does not return void; it accomplishes and prospers in the thing whereto he sent it. Two years in the school of Tyrannus and all Asia hearing — the word prospering, exactly as the prophet said it would.'),
  -- thread: acts-19-i-must-also-see-rome-the-witness-the-lord-confirms
  ('canon', 'acts', 19, 21, 'canon', 'acts', 23, 11, 'free', E'*And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome.* (Acts 23:11). At Ephesus Paul *purposed in the spirit … to go to Jerusalem, saying, After I have been there, I must also see Rome* (Acts 19:21). What he purposed in the spirit, the Lord himself stands by him in the night to confirm: the witness at Jerusalem and then at Rome. The purpose was not Paul''s ambition; it was the Lord''s sending, spoken back to him as comfort when the road grew dark.'),
  -- thread: acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic
  ('canon', 'acts', 19, 26, 'canon', 'isaiah', 44, 9, 'free', E'*They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* (Isaiah 44:9). Demetrius rages that Paul *hath persuaded and turned away much people, saying that they be no gods, which are made with hands* (Acts 19:26). But Paul preaches nothing new: Isaiah long since named the makers of graven images vanity, the idol no god at all. The silversmith''s shrines for Diana are the very delectable things that shall not profit — the work of hands that see not, nor know.'),
  ('canon', 'acts', 19, 26, 'canon', 'jeremiah', 10, 5, 'free', E'*They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* (Jeremiah 10:5). The idols *which are made with hands* (Acts 19:26) cannot speak, cannot walk, cannot do evil or good — they must be carried. Jeremiah''s polemic stands behind Paul''s preaching at Ephesus: the great goddess Diana, for all her magnificence, is a thing that must be borne, no god to be feared.'),
  ('canon', 'acts', 19, 27, 'canon', 'jeremiah', 10, 11, 'free', E'*Thus shall ye say unto them, The gods that have not made the heavens and the earth, even they shall perish from the earth, and from under these heavens.* (Jeremiah 10:11). The craftsmen fear *that the temple of the great goddess Diana should be despised, and her magnificence should be destroyed* (Acts 19:27). Jeremiah pronounced the sentence already: the gods that did not make the heavens and the earth shall perish. Diana''s magnificence is the magnificence of a god that made nothing — and what made nothing shall be unmade.'),
  ('canon', 'acts', 19, 26, 'canon', 'psalms', 115, 4, 'free', E'*Their idols are silver and gold, the work of men''s hands.* (Psalm 115:4). Demetrius is a *silversmith, which made silver shrines for Diana* (Acts 19:24) — and the psalm names exactly that: idols of silver and gold, the work of men''s hands. Paul''s charge that *they be no gods, which are made with hands* (Acts 19:26) is the psalm''s own verdict on the silversmith''s trade. The hands that fashion the god prove it is no god.'),
  ('canon', 'acts', 19, 26, 'canon', 'habakkuk', 2, 18, 'free', E'*What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* (Habakkuk 2:18). The molten image is *a teacher of lies* — and the lie the craftsmen of Ephesus defend is that Diana, made with hands, is a god (Acts 19:26). Habakkuk asks what such an image profits its maker; Paul has turned away much people from trusting the dumb idol. The maker trusts the work of his own hands, and the work cannot speak.'),
  ('canon', 'acts', 19, 26, 'apocrypha', 'the-wisdom-of-solomon', 14, 8, 'extras', E'*But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* (Wisdom of Solomon 14:8). Paul''s phrase is exact — *they be no gods, which are made with hands* (Acts 19:26) — and the wisdom of the fathers had already said it: that which is made with hands is cursed, both the idol and its maker. The corruptible thing called god, and the man who called it so, fall under one verdict. The idol of Diana and the silversmith who shaped her share it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit',
       E'John''s baptism completed — the One who comes after, and the Spirit',
       E'At Ephesus Paul finds *certain disciples* who had received *John''s baptism* (Acts 19:3) and had *not so much as heard whether there be any Ruach HaKodesh (Holy Spirit)* (Acts 19:2). John''s baptism is not repudiated; it is completed. *John verily baptized with the baptism of repentance, saying unto the people, that they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus)* (Acts 19:4). This was John''s own testimony from the first: *I baptize with water: but there standeth one among you, whom ye know not* (John 1:26), *He it is, who coming after me is preferred before me, whose shoe''s latchet I am not worthy to unloose* (John 1:27), and *he that cometh after me is mightier than I … he shall baptize you with the Ruach HaKodesh (Holy Spirit), and with fire* (Matthew 3:11). The forerunner''s whole office was the finger pointing forward; he had *first preached before his coming the baptism of repentance to all the people of Yashar''el (Israel)* (Acts 13:24). And the Master had divided the water from the Spirit by his own word: *John truly baptized with water; but ye shall be baptized with the Ruach HaKodesh (Holy Spirit) not many days hence* (Acts 1:5). So at Ephesus the division is closed — *when Paul had laid his hands upon them, the Ruach HaKodesh (Holy Spirit) came on them; and they spake with tongues, and prophesied* (Acts 19:6). The Spirit is not a thing apart from the way they believed; he is the seal of the One John always pointed to. *And all the men were about twelve* (Acts 19:7) — the number of the tribes, the down-payment of the gathering at Ephesus.',
       sv.verse_id, ev.verse_id, 'free', 5725
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva',
       E'The name is not a formula for the unsent — the sons of Sceva',
       E'*Then certain of the vagabond Yahudim (Jews), exorcists, took upon them to call over them which had evil spirits the name of the Lord Yahusha (Lord Jesus), saying, We adjure you by Yahusha (Jesus) whom Paul preacheth* (Acts 19:13). The seven sons of Sceva treat the name as a technique — a power-word to be wielded by anyone who hears it work. But the name carries no power for the unsent. *And the evil spirit answered and said, Yahusha (Jesus) I know, and Paul I know; but who are ye?* (Acts 19:15) — and the man in whom the spirit was leaped on them and overcame them, so they fled naked and wounded. Even the demon makes the distinction the Master makes. To those who used the name without being known by him, the word is *Many will say to me in that day, Yahuah (Lord), Yahuah (Lord), have we not prophesied in thy name? and in thy name have cast out devils?* (Matthew 7:22) — *and then will I profess unto them, I never knew you: depart from me, ye that work iniquity* (Matthew 7:23). The name does not honour the borrower; it exposes him. To the SENT it is otherwise: *the seventy returned again with joy, saying, Yahuah (Lord), even the devils are subject unto us through thy name* (Luke 10:17), for *there is no man which shall do a miracle in my name, that can lightly speak evil of me* (Mark 9:39). The spirits recognize the sent — even the divination spirit at Philippi confessed *these men are the servants of the El Elyon (most high God)* (Acts 16:17). What they will not yield to is the unsent mouthing the name as an incantation. The name belongs to the known and the sent, never to the one who snatches it up as a formula.',
       sv.verse_id, ev.verse_id, 'free', 5728
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-they-burned-their-books-turning-from-the-abominations',
       E'They burned their books — turning from the abominations',
       E'*And many that believed came, and confessed, and shewed their deeds. Many of them also which used curious arts brought their books together, and burned them before all men: and they counted the price of them, and found it fifty thousand pieces of silver* (Acts 19:18-19). The curious arts are the divination Moses forbade in the land: *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10). These are the very things that made the nations an abomination — *for all that do these things are an abomination unto Yahuah (LORD): and because of these abominations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee* (Deuteronomy 18:12). The burning of the books is the turning Moses called for: the abomination renounced, the price of it counted and let go, cast into the fire before all men. This is the homecoming — not a new rulebook handed to the Ephesians but the dismantling of the divination the nations hearkened to, and the word of Elohim (God) growing where the books once stood.',
       sv.verse_id, ev.verse_id, 'free', 5731
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-so-mightily-grew-the-word-of-god-and-prevailed',
       E'So mightily grew the word of Elohim (God) and prevailed',
       E'Two years in the school of Tyrannus, *so that all they which dwelt in Asia heard the word of the Lord Yahusha (Lord Jesus), both Yahudim (Jews) and Greeks* (Acts 19:10); and after the books were burned, *so mightily grew the word of Elohim (God) and prevailed* (Acts 19:20). This is the prophet''s own promise at work: *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). The word that goeth forth from his mouth does not return void — it accomplishes and prospers in the thing whereto he sent it. All Asia hearing, the word growing and prevailing where divination once held the city: the proclamation of the kingdom prospering exactly as Isaiah said it would, gathering the hearers the Father sends it to.',
       sv.verse_id, ev.verse_id, 'free', 5734
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-i-must-also-see-rome-the-witness-the-lord-confirms',
       E'I must also see Rome — the witness the Lord confirms',
       E'*After these things were ended, Paul purposed in the spirit, when he had passed through Macedonia and Achaia, to go to Jerusalem, saying, After I have been there, I must also see Rome* (Acts 19:21). What Paul purposed in the spirit at Ephesus the Lord himself stands by him to confirm when the road has grown dark in Jerusalem: *And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). The purpose was not Paul''s ambition spun out of his own plans; it was the Lord''s sending, spoken first as a stirring in the spirit and then spoken back to him as comfort in the night. Jerusalem first, then Rome — the witness the Lord intended, confirmed by the One who stood by him.',
       sv.verse_id, ev.verse_id, 'free', 5737
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic',
       E'They be no gods, which are made with hands — the idol polemic',
       E'Demetrius the silversmith, *which made silver shrines for Diana* (Acts 19:24), gathers the craftsmen and rages: *not alone at Ephesus, but almost throughout all Asia, this Paul hath persuaded and turned away much people, saying that they be no gods, which are made with hands* (Acts 19:26) — and the fear is *that the temple of the great goddess Diana should be despised, and her magnificence should be destroyed* (Acts 19:27). But Paul preaches nothing new under the sun; the Tanakh''s own polemic against the work of men''s hands stands behind every word. *They that make a graven image are all of them vanity … they see not, nor know* (Isaiah 44:9). *Their idols are silver and gold, the work of men''s hands* (Psalm 115:4) — the silversmith''s very trade named. *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go … for they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5). The molten image is *a teacher of lies … to make dumb idols* (Habakkuk 2:18). And the sentence is already pronounced: *The gods that have not made the heavens and the earth, even they shall perish from the earth, and from under these heavens* (Jeremiah 10:11). The wisdom of the fathers said it plainly too: *that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god* (Wisdom of Solomon 14:8). Diana''s magnificence is the magnificence of a god that made nothing — and what made nothing, what is made with hands, shall be unmade. The living Elohim (God) who stretched out the heavens against the dumb idol that cannot speak: this is what Paul preached, and all Asia heard.',
       sv.verse_id, ev.verse_id, 'extras', 5740
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 13:24 — *When John had first preached before his coming the baptism of repentance* John''s baptism preached before the One coming, never an end in itself (Acts 19:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 3:11 — *he that cometh after me is mightier than I … he shall baptize you with the Ruach HaKodesh (Holy Spirit)* John''s own word: water points to the One who baptizes with the Spirit (Acts 19:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:26 — *I baptize with water: but there standeth one among you, whom ye know not* the One standing just beyond the water, whom the twelve had not yet known (Acts 19:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:27 — *who coming after me is preferred before me* the *coming after* John pointed to, the One the twelve are brought to believe (Acts 19:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 1:5 — *John truly baptized with water; but ye shall be baptized with the Ruach HaKodesh (Holy Spirit)* the division closed when the Spirit falls on the twelve (Acts 19:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:22 — *have we not … in thy name have cast out devils?* the name borrowed by those not known by him, as the exorcists took it up (Acts 19:13).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:23 — *I never knew you: depart from me* the same distinction the demon makes: *who are ye?* — the unknown exposed (Acts 19:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 10:17 — *the devils are subject unto us through thy name* but to the SENT seventy; the sons of Sceva were not sent (Acts 19:13).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 9:39 — *no man which shall do a miracle in my name, that can lightly speak evil of me* a true work binds a man to him; the borrower does no work and is overcome (Acts 19:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 16:17 — *These men are the servants of the El Elyon (most high God)* even the divination spirit confesses the sent; the spirits know Paul, not the borrowers (Acts 19:13).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=16 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-they-burned-their-books-turning-from-the-abominations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:10 — *or that useth divination, or an observer of times, or an enchanter, or a witch* the curious arts Moses forbade, now brought together and burned (Acts 19:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-burned-their-books-turning-from-the-abominations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:12 — *all that do these things are an abomination unto Yahuah (LORD)* the abomination renounced, the price counted and let go (Acts 19:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-burned-their-books-turning-from-the-abominations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-so-mightily-grew-the-word-of-god-and-prevailed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:11 — *it shall not return unto me void … it shall prosper in the thing whereto I sent it* all Asia hearing, the word growing and prevailing as the prophet promised (Acts 19:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-so-mightily-grew-the-word-of-god-and-prevailed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-i-must-also-see-rome-the-witness-the-lord-confirms
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 23:11 — *so must thou bear witness also at Rome* the Lord stands by Paul in the night and confirms what he purposed in the spirit (Acts 19:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-i-must-also-see-rome-the-witness-the-lord-confirms'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=23 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:9 — *They that make a graven image are all of them vanity … they see not, nor know* the makers of idols named vanity, behind Paul''s *no gods, made with hands* (Acts 19:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands* the silversmith''s very trade, named no god by the psalm (Acts 19:24,26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:5 — *they … speak not … cannot do evil, neither also is it in them to do good* the idol that must be borne, no god to be feared (Acts 19:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Habakkuk 2:18 — *the molten image, and a teacher of lies … to make dumb idols* the lie the craftsmen defend, that Diana made with hands is a god (Acts 19:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 10:11 — *The gods that have not made the heavens and the earth … shall perish* Diana''s magnificence is a god that made nothing, and shall be unmade (Acts 19:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 14:8 — *that which is made with hands is cursed, as well it, as he that made it* the idol and its maker under one verdict — Diana and the silversmith (Acts 19:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_20.sql (S217 Acts 20) -----
-- =====================================================================
-- S217 minion — ACTS 20 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 20.  Tag: a20 (temp view _s217_a20_lookup).  Sort band: 5750-5765.
-- Source is ALWAYS the canon Acts 20 verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #6/#7/#10/#11, Christology, son-of-Adam, shepherd architecture):
--  * Eutychus raised (20:9-12): Paul falls on the dead young man and embraces him — *his life
--    is in him* — the same posture as Elijah stretching on the widow's son (1 Kings 17:21) and
--    Elisha on the Shunammite's son (2 Kings 4:34-35). The Formed-one's power to raise running
--    through his servants; a sign within the breaking-of-bread on the first day, not a new cultus.
--  * Watchman cleared (20:26-27): *I am pure from the blood of all men, for I have not shunned
--    to declare all the counsel of Elohim (God)* — the watchman of Ezekiel 33 who blew the
--    trumpet and so delivered his own soul; the blood-guilt requirement of Ezekiel 33:6,8 lifted
--    because the warning was given. Acts 18:6 is the same clearing in Paul's own mouth.
--  * Feed the flock (20:28): *feed the church of Elohim (God) which he hath purchased with his
--    own blood* — the true shepherd over the scattered flock (Ezekiel 34, Isaiah 40:11), the
--    charge the risen Master gave Peter (John 21:15-16) and Peter passed to the elders (1 Peter
--    5:2). The flock is the gathered seed; the overseers feed, they do not devour. The blood that
--    purchased is the Formed-one's own — Yahusha is Yahuah who came in the flesh.
--  * Grievous wolves (20:29-30): the false shepherds of Ezekiel 34:5 and Jeremiah 23:1 who
--    scattered the flock, and the ravening wolves in sheep's clothing the Master warned of
--    (Matthew 7:15). System-level — the shepherds who feed themselves — never an ethnic charge.
--  * Coveted no man's silver (20:33-34): *these hands have ministered unto my necessities* — the
--    shepherd not for filthy lucre; the Levite whose portion is Yahuah himself (Numbers 18:20),
--    the gospel preached without charge (1 Corinthians 9:18). NOT a freedom-from-Torah grace;
--    *the word of his grace* (20:32) builds up and gives the inheritance among the sanctified —
--    grace as the means of return and of the inheritance, never sola-fide truncation (Red Line #10).
--  * More blessed to give (20:35): the liberal soul made fat (Proverbs 11:25), the open hand of
--    Deuteronomy 15:10 — the Torah's own generosity, which the Lord Yahusha (Lord Jesus) names.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 20:
--   v.1-6   Macedonia/Greece/Troas travel  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative/itinerary)
--   v.7     break bread, first day          Tanakh: none added (the sign at v.9-12 carries the block)  Extras: none warranted  NT: Acts 2:42 weighed (breaking of bread/doctrine) — narrative-echo, framework weight thin, not added
--   v.9-12  Eutychus falls, raised          Tanakh: 1 Kings 17:21, 2 Kings 4:34, 2 Kings 4:35  Extras: none warranted  NT: none warranted (the prophetic raisings carry it)
--   v.13-16 Assos/Miletus/haste to Pentecost Tanakh: none warranted  Extras: none warranted  NT: none warranted (itinerary; Shavuot carried in Acts 2 threads)
--   v.17-21 kept back nothing profitable    Tanakh: none warranted  Extras: none warranted  NT: none added (Acts 18:6/26:22 weighed; the clearing carried in the watchman thread)
--   v.22-25 bound in the spirit / no more   Tanakh: none warranted  Extras: none warranted  NT: none warranted (the gospel of the grace of Elohim carried at v.32)
--   v.26-27 pure from the blood of all men  Tanakh: Ezekiel 33:6, Ezekiel 33:8  Extras: none warranted  NT: Acts 18:6 (Acts<->Acts)
--   v.28    feed the flock, purchased blood Tanakh: Ezekiel 34:4, Isaiah 40:11  Extras: none warranted  NT: John 21:15, John 21:16, 1 Peter 5:2
--   v.29-31 grievous wolves enter in        Tanakh: Ezekiel 34:5, Jeremiah 23:1  Extras: none warranted  NT: Matthew 7:15
--   v.32    word of his grace / inheritance Tanakh: none added (Levite-inheritance carried in the silver thread)  Extras: none warranted  NT: none added (grace-as-means carried in prose, not a standalone target)
--   v.33-34 coveted no man's silver         Tanakh: Numbers 18:20  Extras: none warranted  NT: 1 Corinthians 9:18
--   v.35    more blessed to give            Tanakh: Proverbs 11:25, Deuteronomy 15:10  Extras: none warranted  NT: none added (the Master's saying is the Acts source itself)
--   v.36-38 kneeled, wept, accompanied      Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative farewell)
--
-- THREADS (slug -> target libraries):
--   5750 acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised (Tanakh)
--   5753 acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared           (Tanakh + NT, Acts<->Acts)
--   5756 acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered          (Tanakh + NT)
--   5759 acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter     (Tanakh + NT)
--   5762 acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre     (Tanakh + NT)
--   5765 acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul         (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s217_a20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised
  ('canon', 'acts', 20, 10, 'canon', '1-kings', 17, 21, 'free', E'*And he stretched himself upon the child three times, and cried unto Yahuah (LORD), and said, O Yahuah (LORD) my Elohim (God), I pray thee, let this child''s soul come into him again.* (1 Kings 17:21). When the young man Eutychus falls from the third loft and is taken up dead, *Paul went down, and fell on him, and embracing him said, Trouble not yourselves; for his life is in him* (Acts 20:10). It is Elijah''s very posture over the widow''s son — the prophet stretching himself upon the dead child and crying for the soul to return. The power that raised through Elijah raises through Paul, and the young man is brought alive.'),
  ('canon', 'acts', 20, 10, 'canon', '2-kings', 4, 34, 'free', E'*And he went up, and lay upon the child, and put his mouth upon his mouth, and his eyes upon his eyes, and his hands upon his hands: and he stretched himself upon the child; and the flesh of the child waxed warm.* (2 Kings 4:34). Paul *fell on him, and embracing him* (Acts 20:10) — the same close embrace Elisha laid upon the Shunammite''s dead son, body upon body, until the warmth of life returned. The prophets of old and the apostle now move in the one power of the Formed, who is the resurrection and the life.'),
  ('canon', 'acts', 20, 12, 'canon', '2-kings', 4, 35, 'free', E'*Then he returned, and walked in the house to and fro; and went up, and stretched himself upon him: and the child sneezed seven times, and the child opened his eyes.* (2 Kings 4:35). *And they brought the young man alive, and were not a little comforted* (Acts 20:12). As the Shunammite''s son opened his eyes and was given back to his mother, so the young man fallen from the loft is brought alive to the gathered assembly — the sign of life sealing the first-day breaking of bread.'),
  -- thread: acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared
  ('canon', 'acts', 20, 26, 'canon', 'ezekiel', 33, 6, 'free', E'*But if the watchman see the sword come, and blow not the trumpet, and the people be not warned; if the sword come, and take any person from among them, he is taken away in his iniquity; but his blood will I require at the watchman''s hand.* (Ezekiel 33:6). Paul declares to the elders, *I take you to record this day, that I am pure from the blood of all men* (Acts 20:26). This is the watchman''s clearing: the trumpet was blown, the warning given, and so the blood is not required at his hand. The watchman who speaks delivers his own soul.'),
  ('canon', 'acts', 20, 27, 'canon', 'ezekiel', 33, 8, 'free', E'*When I say unto the wicked, O wicked man, thou shalt surely die; if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand.* (Ezekiel 33:8). Paul gives the ground of his being pure from all blood: *For I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:27). The watchman of Ezekiel is charged to speak and warn; the one who does not shun to declare the whole counsel has met the charge and is clean of the blood Ezekiel''s watchman would otherwise bear.'),
  ('canon', 'acts', 20, 26, 'canon', 'acts', 18, 6, 'free', E'*And when they opposed themselves, and blasphemed, he shook his raiment, and said unto them, Your blood be upon your own heads; I am clean: from henceforth I will go unto the Gentiles.* (Acts 18:6). The same watchman''s clearing sounds twice in Paul''s mouth: at Corinth, *I am clean;* and now to the Ephesian elders, *I am pure from the blood of all men* (Acts 20:26). The trumpet was blown to the house of Yahudah (Judah) and to the scattered among the nations alike; where the warning is given and refused, the blood returns upon the hearers'' own heads, and the watchman is delivered.'),
  -- thread: acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered
  ('canon', 'acts', 20, 28, 'canon', 'ezekiel', 34, 4, 'free', E'*The diseased have ye not strengthened, neither have ye healed that which was sick, neither have ye bound up that which was broken, neither have ye brought again that which was driven away, neither have ye sought that which was lost; but with force and with cruelty have ye ruled them.* (Ezekiel 34:4). Paul charges the elders, *Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God)* (Acts 20:28). Ezekiel arraigned the shepherds who would not strengthen, heal, or seek the lost; the overseers Paul appoints are charged to be the opposite — to feed the flock, to seek what was driven away, the scattered seed of the house of Yashar''el (Israel).'),
  ('canon', 'acts', 20, 28, 'canon', 'isaiah', 40, 11, 'free', E'*He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom, and shall gently lead those that are with young.* (Isaiah 40:11). The overseers are made to *feed the church of Elohim (God), which he hath purchased with his own blood* (Acts 20:28). The pattern of all true feeding is the Shepherd of Isaiah who gathers the lambs in his arm and carries them in his bosom — the Formed-one who feeds his flock gently, whose own blood purchased them, the One the elders are to under-shepherd.'),
  ('canon', 'acts', 20, 28, 'canon', 'john', 21, 15, 'free', E'*So when they had dined, Yahusha (Jesus) saith to Simon Peter, Simon, son of Jonas, lovest thou me more than these? He saith unto him, Yea, Yahuah (Lord); thou knowest that I love thee. He saith unto him, Feed my lambs.* (John 21:15). The charge to *feed the church of Elohim (God)* (Acts 20:28) is the charge the risen Master first laid on Peter by the sea — *Feed my lambs.* The flock is the Master''s own, purchased with his own blood; the shepherds feed what is his, not what is theirs.'),
  ('canon', 'acts', 20, 28, 'canon', 'john', 21, 16, 'free', E'*He saith to him again the second time, Simon, son of Jonas, lovest thou me? He saith unto him, Yea, Yahuah (Lord); thou knowest that I love thee. He saith unto him, Feed my sheep.* (John 21:16). *Feed my sheep* the Master said to Peter; *feed the church of Elohim (God)* Paul now says to the elders (Acts 20:28). The one command passes from the Master to Peter to the overseers of every flock — to feed, never to devour, the sheep that are his by the price of his own blood.'),
  ('canon', 'acts', 20, 28, 'canon', '1-peter', 5, 2, 'free', E'*Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind;* (1 Peter 5:2). Peter, who received *Feed my sheep* from the Master, writes the same charge to the elders that Paul gives at Miletus: *feed the church of Elohim (God)* (Acts 20:28). The oversight is willing, not for filthy lucre — the true shepherd over the gathered flock, set against the hireling who feeds himself.'),
  -- thread: acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter
  ('canon', 'acts', 20, 29, 'canon', 'ezekiel', 34, 5, 'free', E'*And they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered.* (Ezekiel 34:5). Paul warns, *after my departing shall grievous wolves enter in among you, not sparing the flock* (Acts 20:29). It is the very danger Ezekiel named — the flock without a true shepherd becomes meat to the beasts of the field, scattered. The grievous wolves are the false shepherds and the beasts in one; the warning is the watchman''s, that the gathered not be torn and scattered again.'),
  ('canon', 'acts', 20, 30, 'canon', 'jeremiah', 23, 1, 'free', E'*Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD).* (Jeremiah 23:1). *Also of your own selves shall men arise, speaking perverse things, to draw away disciples after them* (Acts 20:30). Jeremiah pronounced woe on the pastors who scatter the sheep of Yahuah''s (LORD''s) pasture; Paul foresees the same rising from within — shepherds who draw the flock after themselves rather than after the Master, the destroyers Jeremiah cried woe upon.'),
  ('canon', 'acts', 20, 29, 'canon', 'matthew', 7, 15, 'free', E'*Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves.* (Matthew 7:15). *Grievous wolves enter in among you, not sparing the flock* (Acts 20:29) — the Master had warned of exactly these, the wolves in sheep''s clothing whose inward nature is to ravage. Paul tells the elders to watch, for the wolves come disguised among the sheep, and the shepherd''s charge is to know them and guard the flock.'),
  -- thread: acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre
  ('canon', 'acts', 20, 33, 'canon', 'numbers', 18, 20, 'free', E'*And Yahuah (LORD) spake unto Aaron, Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel).* (Numbers 18:20). *I have coveted no man''s silver, or gold, or apparel* (Acts 20:33), Paul says, for *these hands have ministered unto my necessities* (Acts 20:34). It is the Levite''s portion: the one who serves the house takes no inheritance of silver and gold among the people, because Yahuah (LORD) himself is his part. The true shepherd''s reward is not lucre but the One he serves.'),
  ('canon', 'acts', 20, 34, 'canon', '1-corinthians', 9, 18, 'free', E'*What is my reward then? Verily that, when I preach the gospel, I may make the gospel of Messiah (Christ) without charge, that I abuse not my power in the gospel.* (1 Corinthians 9:18). *These hands have ministered unto my necessities, and to them that were with me* (Acts 20:34). Paul names elsewhere what his laboring hands declare here: the gospel preached without charge, no silver coveted, no power abused — the shepherd who will not make merchandise of the flock, set against the wolves who do not spare it.'),
  -- thread: acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul
  ('canon', 'acts', 20, 35, 'canon', 'proverbs', 11, 25, 'free', E'*The liberal soul shall be made fat: and he that watereth shall be watered also himself.* (Proverbs 11:25). Paul closes with the Master''s own saying: *I have shewed you all things, how that so labouring ye ought to support the weak, and to remember the words of the Lord Yahusha (Lord Jesus), how he said, It is more blessed to give than to receive* (Acts 20:35). The proverb already taught it — the open, liberal soul is itself made fat, and the one who waters is watered. The Lord Yahusha (Lord Jesus) names the Torah''s own wisdom: the blessing falls on the giving hand.'),
  ('canon', 'acts', 20, 35, 'canon', 'deuteronomy', 15, 10, 'free', E'*Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto.* (Deuteronomy 15:10). *It is more blessed to give than to receive* (Acts 20:35). The Master''s word is no new thing but the Torah''s own: Moses commanded the open hand to the poor brother and bound the blessing of Yahuah Elohayka (the LORD thy God) to the giving. To give is to be blessed in all the works of the hand — the very thing the Lord Yahusha (Lord Jesus) declares.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised',
       E'His life is in him — the young man raised as Elijah and Elisha raised',
       E'On the first day of the week the disciples gather at Troas to break bread, and Paul preaches until midnight. A young man named Eutychus, *being fallen into a deep sleep … fell down from the third loft, and was taken up dead* (Acts 20:9). Then *Paul went down, and fell on him, and embracing him said, Trouble not yourselves; for his life is in him* (Acts 20:10). The posture is the prophets'' own. Elijah, over the widow''s dead son, *stretched himself upon the child three times, and cried unto Yahuah (LORD) … let this child''s soul come into him again* (1 Kings 17:21). Elisha, over the Shunammite''s dead son, *went up, and lay upon the child, and put his mouth upon his mouth … and the flesh of the child waxed warm* (2 Kings 4:34), until *the child sneezed seven times, and the child opened his eyes* (2 Kings 4:35). The same power that raised through Elijah and Elisha raises through the apostle: *they brought the young man alive, and were not a little comforted* (Acts 20:12). The sign of life seals the breaking of bread — the Formed-one, who is the resurrection, moving through his servants as he moved through the prophets of old.',
       sv.verse_id, ev.verse_id, 'free', 5750
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared',
       E'I am pure from the blood of all men — the watchman cleared',
       E'Paul takes the Ephesian elders to record: *I am pure from the blood of all men. For I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:26-27). This is the watchman''s clearing, spoken in the very terms Yahuah (LORD) gave Ezekiel. The watchman is set over the house of Yashar''el (Israel) to blow the trumpet; *if the watchman see the sword come, and blow not the trumpet … his blood will I require at the watchman''s hand* (Ezekiel 33:6), and *if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand* (Ezekiel 33:8). The one who warns delivers his own soul; the one who stays silent bears the blood. Paul has blown the trumpet — declared the whole counsel, shunned nothing — and so he is clean. He had said it once before, at Corinth: *Your blood be upon your own heads; I am clean* (Acts 18:6). The warning was given to the house of Yahudah (Judah) and to the scattered among the nations alike; where it is refused, the blood returns upon the hearers'' own heads, and the watchman is delivered.',
       sv.verse_id, ev.verse_id, 'free', 5753
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered',
       E'Feed the flock of Elohim (God) — the true shepherd over the scattered',
       E'*Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God), which he hath purchased with his own blood* (Acts 20:28). The charge stands against the long arraignment of the false shepherds. Ezekiel indicted those who *have ye not strengthened … neither have ye brought again that which was driven away, neither have ye sought that which was lost* (Ezekiel 34:4); the overseers Paul appoints are to be their opposite, to seek the driven-away and feed the lost — the scattered seed of the house of Yashar''el (Israel). The pattern of all true feeding is the Shepherd himself: *He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom* (Isaiah 40:11). And the charge is the one the risen Master first laid on Peter by the sea — *Feed my lambs* (John 21:15), *Feed my sheep* (John 21:16) — which Peter then passed to the elders: *Feed the flock of Elohim (God) which is among you … not for filthy lucre, but of a ready mind* (1 Peter 5:2). The flock is the Master''s own, *purchased with his own blood* — the Formed-one who is Yahuah come in the flesh — and the shepherds feed what is his, never devour it.',
       sv.verse_id, ev.verse_id, 'free', 5756
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter',
       E'Grievous wolves shall enter in — the false shepherds that scatter',
       E'*For I know this, that after my departing shall grievous wolves enter in among you, not sparing the flock. Also of your own selves shall men arise, speaking perverse things, to draw away disciples after them* (Acts 20:29-30). Paul names the danger the prophets named. Ezekiel saw the flock left without a true shepherd: *they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered* (Ezekiel 34:5). Jeremiah cried woe upon them: *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD)* (Jeremiah 23:1). And the Master had warned of the very disguise the wolves wear: *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15). The threat is not the flock''s ethnicity but the shepherds'' heart — those who feed themselves, who draw the sheep after themselves rather than after the Master, who scatter what was gathered. The watchman''s charge is to know them and guard the flock, that the gathered seed not be torn and scattered again.',
       sv.verse_id, ev.verse_id, 'free', 5759
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre',
       E'I have coveted no man''s silver — the shepherd not for filthy lucre',
       E'*I have coveted no man''s silver, or gold, or apparel. Yea, ye yourselves know, that these hands have ministered unto my necessities, and to them that were with me* (Acts 20:33-34). The shepherd who feeds the flock takes nothing of it for lucre — and the ground of it is the Levite''s portion. Yahuah (LORD) said to Aaron, *Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20). The one who serves the house has no silver-and-gold inheritance among the people, because Yahuah (LORD) himself is his part. So Paul, who could have claimed support, labored with his own hands: *when I preach the gospel, I may make the gospel of Messiah (Christ) without charge, that I abuse not my power in the gospel* (1 Corinthians 9:18). This is the seam where the grace Paul commends is rightly read — *I commend you to Elohim (God), and to the word of his grace, which is able to build you up, and to give you an inheritance among all them which are sanctified* (Acts 20:32). The grace is the means of the building-up and of the inheritance among the sanctified — never a release from the commandments, and never a cloak for the wolves who do not spare the flock. The true shepherd''s reward is not lucre but the One he serves.',
       sv.verse_id, ev.verse_id, 'free', 5762
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul',
       E'It is more blessed to give than to receive — the liberal soul',
       E'Paul closes the charge with the Master''s own word: *I have shewed you all things, how that so labouring ye ought to support the weak, and to remember the words of the Lord Yahusha (Lord Jesus), how he said, It is more blessed to give than to receive* (Acts 20:35). The saying is no new thing — it is the Torah''s own wisdom and the proverb''s. *The liberal soul shall be made fat: and he that watereth shall be watered also himself* (Proverbs 11:25): the open hand is itself the hand that is filled. And Moses bound the blessing to the giving long before: *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto* (Deuteronomy 15:10). The Lord Yahusha (Lord Jesus) speaks the heart of the commandment: the blessing falls on the giving hand, not the grasping one. The shepherd who coveted no man''s silver lives the very word he leaves them — to labor, to support the weak, and to find that it is more blessed to give.',
       sv.verse_id, ev.verse_id, 'free', 5765
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 17:21 — *he stretched himself upon the child three times … let this child''s soul come into him again* Elijah''s posture over the widow''s son, the same as Paul falling on Eutychus (Acts 20:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 4:34 — *he … lay upon the child … and the flesh of the child waxed warm* Elisha''s close embrace over the Shunammite''s son, mirrored in Paul embracing Eutychus (Acts 20:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 4:35 — *the child sneezed seven times, and the child opened his eyes* the Shunammite''s son given back alive, as the young man is brought alive (Acts 20:12).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:6 — *if the watchman … blow not the trumpet … his blood will I require at the watchman''s hand* the blood-guilt Paul is cleared of by warning (Acts 20:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 33:8 — *if thou dost not speak to warn the wicked … his blood will I require at thine hand* the watchman delivered by declaring the whole counsel (Acts 20:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 18:6 — *Your blood be upon your own heads; I am clean* the same watchman''s clearing in Paul''s mouth at Corinth (Acts 20:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:4 — *neither have ye brought again that which was driven away, neither have ye sought that which was lost* the false shepherds the overseers must be the opposite of (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:11 — *He shall feed his flock like a shepherd: he shall gather the lambs with his arm* the Shepherd whose feeding the overseers under-shepherd (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 21:15 — *Feed my lambs* the charge the risen Master first laid on Peter, now given to the elders (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=21 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 21:16 — *Feed my sheep* the Master''s command passing to the overseers of the flock (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=21 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 5:2 — *Feed the flock of Elohim (God) … not for filthy lucre, but of a ready mind* Peter passing the Master''s charge to the elders, as Paul does (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:5 — *they were scattered, because there is no shepherd: and they became meat to all the beasts of the field* the flock torn when the wolves enter (Acts 20:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 23:1 — *Woe be unto the pastors that destroy and scatter the sheep of my pasture* the men arising from within who draw disciples after them (Acts 20:30).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:15 — *false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* the disguise of the grievous wolves Paul warns of (Acts 20:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 18:20 — *I am thy part and thine inheritance among the children of Yashar''el (Israel)* the Levite''s portion; the shepherd who covets no silver because Yahuah is his part (Acts 20:33).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 9:18 — *I may make the gospel of Messiah (Christ) without charge* the laboring hands that abuse no power, ministering to his own necessities (Acts 20:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:25 — *The liberal soul shall be made fat: and he that watereth shall be watered also himself* the proverb behind the Master''s saying that giving is blessed (Acts 20:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:10 — *Thou shalt surely give him … Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works* the Torah''s open hand the Master''s word expresses (Acts 20:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_21.sql (S217 Acts 21) -----
-- =====================================================================
-- S217 minion — ACTS 21 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 21 (single chapter).  Tag: a21 (temp view _s217_a21_lookup).  Sort band: 5775-5799 (step 3).
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- ***DROPPED-PAUL / KEEPS-THE-LAW CORRECTION — THE LOAD-BEARING WORK OF THIS CHAPTER***
--  Acts 21 is the chapter that REFUTES the antinomian Paul. The false rumor (21:21) — that Paul
--  teaches the Yahudim (Jews) among the nations *to forsake Moses, saying that they ought not to
--  circumcise their children, neither to walk after the customs* — is named by the elders as a
--  thing *whereof they were informed concerning thee, are nothing* (21:24). James's remedy is not
--  a defense of antinomianism but its opposite: Paul JOINS FOUR MEN UNDER A NAZARITE VOW
--  (Numbers 6), pays their charges, purifies himself in the temple, *that all may know … that thou
--  thyself also walkest orderly, and keepest the law* (21:24). Paul's own temple act denies the
--  rumor. The riot's charge (21:28) — *against the people, and the law, and this place* — is the
--  SAME false charge laid against Stephen by false witnesses (Acts 6:13). Throughout: the Paul who
--  abolished Torah does not exist; he is a Torah-observant Yahudi (Jew) keeping a Nazarite vow in
--  the temple, and the rumor is named as false by the text itself. Voice-care: moderate — frame
--  the vow/purification as Paul KEEPING the law, the false report as false, never let the inherited
--  antinomian reading surface.
--
-- WATCHPOINTS (Red Lines #2/#4/#5/#6, Christology, son-of-Adam, NT-Lord):
--  * Christology of 21:13-14: *the will of Yahuah (Lord) be done* — the same surrender the Master
--    spoke in Gethsemane (*not my will, but thine, be done*). The Formed who prayed in the garden;
--    Paul ready to die *for the name of the Lord Yahusha (Lord Jesus)* — *Lord* here is Yahusha
--    titular, preserved as the pull gives it.
--  * Agabus's girdle-sign (21:11): the enacted-sign prophets — Jeremiah's linen girdle (Jeremiah
--    13), Ezekiel's bands (Ezekiel 4:8) — the prophetic word performed in the body, the Ruach
--    HaKodesh (Holy Spirit) speaking through the sign.
--  * 21:20 *zealous of the law* — read as covenant fidelity (Numbers 6, 1 Maccabees 2:27), the
--    thousands of believing Yahudim who keep Torah; NEVER a flesh-credential works-righteousness.
--
-- PER-VERSE LIBRARY-COVERAGE CHECKLIST (all three weighed for every meaningful block):
--  ACTS 21:
--   v.1-3   the voyage to Tyre          Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative itinerary)
--   v.4     said through the Spirit not to go up  Tanakh: none warranted (carried in the bound-in-the-spirit NT thread)  Extras: none warranted  NT: none added (Acts 20:22-23 carried under v.11 girdle thread by theme)
--   v.5-9   prayer on the shore / Philip's daughters prophesy  Tanakh: none warranted  Extras: none warranted  NT: none warranted (Joel-2 daughters-prophesy carried in Acts 2 threads, not re-added)
--   v.10-11 Agabus binds his own hands/feet with Paul's girdle  Tanakh: Jeremiah 13:1, Ezekiel 4:8 (enacted-sign prophets)  Extras: none warranted  NT: Acts 20:23 weighed (bonds abide — carried thematically, not added as separate row)
--   v.12-14 the will of the Lord be done  Tanakh: none warranted  Extras: none warranted  NT: Luke 22:42, Matthew 26:39 (Gethsemane surrender)
--   v.15-19 up to Jerusalem; declares what God wrought among the Gentiles  Tanakh: none warranted  Extras: none warranted  NT: none warranted (the gathering carried in Acts 15 threads, not re-added)
--   v.20    thousands of believing Yahudim, zealous of the law  Tanakh: none added (Numbers 6 carried under v.24)  Extras: 1 Maccabees 2:27 (zealous of the law)  NT: none warranted
--   v.21    the FALSE RUMOR — forsake Moses / not circumcise  Tanakh: none warranted  Extras: none warranted  NT: none added (named false at v.24, carried in keeps-the-law thread)
--   v.23-24 the Nazarite-vow remedy — keepeth the law  Tanakh: Numbers 6:2, Numbers 6:18  Extras: none warranted  NT: Acts 24:14, Acts 24:18, Acts 25:8, Acts 28:17 (Paul's own Torah-observant defense)
--   v.25    the believing Gentiles' four-point letter  Tanakh: none added  Extras: none warranted  NT: none warranted (Acts 15 council verdict carried in Acts 15 threads, not re-added)
--   v.26    Paul purifies, enters the temple, the offering  Tanakh: none added (Numbers 6 carried at v.24)  Extras: none warranted  NT: Acts 24:18 (found purified in the temple — carried at v.24 thread)
--   v.27-29 the riot — stirred up, laid hands  Tanakh: none warranted  Extras: none warranted  NT: none added (the false charge carried at v.28)
--   v.28    the false charge — against the people, the law, this place  Tanakh: none warranted  Extras: none warranted  NT: Acts 6:13 (the same false charge against Stephen)
--   v.30-40 seized, bound, the chief captain, Hebrew tongue  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5775 acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets        (Tanakh)
--   5778 acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender           (NT)
--   5781 acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant (Extras)
--   5784 acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense (Tanakh + NT, Acts<->Acts)
--   5787 acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen (NT, Acts<->Acts)
-- =====================================================================

CREATE TEMP VIEW _s217_a21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets
  ('canon', 'acts', 21, 11, 'canon', 'jeremiah', 13, 1, 'free', E'*Thus saith Yahuah (LORD) unto me, Go and get thee a linen girdle, and put it upon thy loins, and put it not in water.* (Jeremiah 13:1). When Agabus comes down from Judæa, *he took Paul''s girdle, and bound his own hands and feet, and said, Thus saith the Ruach HaKodesh (Holy Spirit), So shall the Yahudim (Jews) at Jerusalem bind the man that owneth this girdle, and shall deliver him into the hands of the Gentiles* (Acts 21:11). It is the old prophetic manner — the word performed in the body before it is spoken in words. As Yahuah (LORD) sent Jeremiah to take a girdle and enact the marring of Yahudah''s pride, so the Spirit moves Agabus to take Paul''s girdle and bind himself with it, the sign speaking what the words then declare: the man that owneth this girdle will be bound.'),
  ('canon', 'acts', 21, 11, 'canon', 'ezekiel', 4, 8, 'free', E'*And, behold, I will lay bands upon thee, and thou shalt not turn thee from one side to another, till thou hast ended the days of thy siege.* (Ezekiel 4:8). Ezekiel is bound with bands and made to bear the iniquity of the house in his own body — the prophecy enacted, not merely spoken. So Agabus *bound his own hands and feet* with Paul''s girdle (Acts 21:11), the bonds upon the prophet''s own body declaring the bonds to come upon Paul. The Ruach HaKodesh (Holy Spirit) speaks through the sign performed in the flesh, the same manner of prophecy Ezekiel was given.'),
  -- thread: acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender
  ('canon', 'acts', 21, 14, 'canon', 'luke', 22, 42, 'free', E'*Saying, Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done.* (Luke 22:42). When Paul will not be turned from going up to die, the company ceases, *saying, The will of Yahuah (Lord) be done* (Acts 21:14). It is the very surrender the Master prayed in the garden before his own binding and death — *not my will, but thine, be done.* The disciples who would have held Paul back lay down their will as the Master laid down his; the cup is not removed, and the will of Yahuah (Lord) is done.'),
  ('canon', 'acts', 21, 13, 'canon', 'matthew', 26, 39, 'free', E'*And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* (Matthew 26:39). Paul answers the weeping company, *I am ready not to be bound only, but also to die at Jerusalem for the name of the Lord Yahusha (Lord Jesus)* (Acts 21:13). He goes up as the Master went up — set toward Jerusalem, ready for the binding and the death, the cup not passing but drunk. *Not as I will, but as thou wilt* is the heart Paul carries into the city that will bind him.'),
  -- thread: acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant
  ('canon', 'acts', 21, 20, 'apocrypha', '1-maccabees', 2, 27, 'extras', E'*And Mattathias cried throughout the city with a loud voice, saying, Whoever is zealous of the law, and maintaineth the covenant, let him follow me.* (1 Maccabees 2:27). When Paul comes to James, the elders glorify Yahuah (Lord) and say, *Thou seest, brother, how many thousands of Yahudim (Jews) there are which believe; and they are all zealous of the law* (Acts 21:20). The believing thousands carry the same zeal Mattathias called for — zealous of the law and maintaining the covenant. To believe in Yahusha (Jesus) and to be zealous of the law are not set against each other here; the thousands who believe are the thousands who keep, the covenant fidelity of the faithful remnant unbroken.'),
  -- thread: acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense
  ('canon', 'acts', 21, 24, 'canon', 'numbers', 6, 2, 'free', E'*Speak unto the children of Yashar''el (Israel), and say unto them, When either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD):* (Numbers 6:2). The elders'' remedy for the rumor against Paul is the Nazarite vow of Moses: *We have four men which have a vow on them; Them take, and purify thyself with them, and be at charges with them, that they may shave their heads* (Acts 21:23-24). The vow Yahuah (LORD) gave through Moses, that a man might separate himself unto Yahuah — this is the very Torah the rumor said Paul taught men to forsake, and Paul keeps it openly to prove the rumor false.'),
  ('canon', 'acts', 21, 24, 'canon', 'numbers', 6, 18, 'free', E'*And the Nazarite shall shave the head of his separation at the door of the tabernacle of the congregation, and shall take the hair of the head of his separation, and put it in the fire which is under the sacrifice of the peace offerings.* (Numbers 6:18). The four men are to *shave their heads* (Acts 21:24), and Paul enters the temple *to signify the accomplishment of the days of purification, until that an offering should be offered for every one of them* (Acts 21:26) — exactly the close of the Nazarite vow Moses prescribed: the shaving of the head and the offering at the door of the tabernacle. Paul is not abolishing this Torah; he is paying its charges and keeping it to the letter.'),
  ('canon', 'acts', 21, 24, 'canon', 'acts', 24, 14, 'free', E'*But this I confess unto thee, that after the way which they call heresy, so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets:* (Acts 24:14). The elders charge Paul to act *that all may know … that thou thyself also walkest orderly, and keepest the law* (Acts 21:24). And before Felix, Paul confesses exactly that: he worships the Elohim (God) of his fathers, *believing all things which are written in the law and in the prophets.* The temple act of Acts 21 and the confession of Acts 24 are one testimony — the Paul who keeps the law, believing all that is written, the rumor of the forsaken Moses named as false by Paul''s own mouth.'),
  ('canon', 'acts', 21, 24, 'canon', 'acts', 24, 18, 'free', E'*Whereupon certain Yahudim (Jews) from Asia found me purified in the temple, neither with multitude, nor with tumult.* (Acts 24:18). The charge was *purify thyself with them … that thou thyself also walkest orderly, and keepest the law* (Acts 21:24); Paul does it — *purifying himself with them entered into the temple* (Acts 21:26). And later he names it as his defense: the Yahudim (Jews) from Asia *found me purified in the temple.* The purification was not a pretense but the truth of the man: he was found doing the very thing the rumor said he taught against — keeping the Torah of purification in the temple of his fathers.'),
  ('canon', 'acts', 21, 24, 'canon', 'acts', 25, 8, 'free', E'*While he answered for himself, Neither against the law of the Yahudim (Jews), neither against the temple, nor yet against Cæsar, have I offended any thing at all.* (Acts 25:8). The elders sought to show *that thou thyself also … keepest the law* (Acts 21:24); Paul stands by it to the end. Before Festus he answers that he has offended nothing *against the law of the Yahudim (Jews), neither against the temple* — the two things the rumor and the riot accused him of forsaking. The man the mob charged as the teacher against the law and the place declares under trial that he has offended neither.'),
  ('canon', 'acts', 21, 24, 'canon', 'acts', 28, 17, 'free', E'*And it came to pass, that after three days Paul called the chief of the Yahudim (Jews) together: and when they were come together, he said unto them, Men and brethren, though I have committed nothing against the people, or customs of our fathers, yet was I delivered prisoner from Jerusalem into the hands of the Romans.* (Acts 28:17). The rumor said Paul taught men *neither to walk after the customs* (Acts 21:21); the elders moved to prove he *keepest the law* (Acts 21:24). At Rome, in chains, Paul''s final word on the matter is the same: he *committed nothing against the people, or customs of our fathers.* From the temple purification to the Roman imprisonment, one testimony holds — the customs of the fathers kept, the rumor false from first to last.'),
  -- thread: acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen
  ('canon', 'acts', 21, 28, 'canon', 'acts', 6, 13, 'free', E'*And set up false witnesses, which said, This man ceaseth not to speak blasphemous words against this holy place, and the law:* (Acts 6:13). The mob seizes Paul *crying out, Men of Yashar''el (Israel), help: This is the man, that teacheth all men every where against the people, and the law, and this place* (Acts 21:28). It is word for word the charge laid against Stephen by *false witnesses* — *against this holy place, and the law.* The text names the witnesses against Stephen false; the same false charge is now thrown at Paul, who at that very hour was in the temple keeping the law. The accusation is the lie''s old costume: name the Torah-keeper an enemy of the Torah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets',
       E'Bound with Paul''s girdle — the enacted sign of the prophets',
       E'As Paul tarries at Cæsarea, *there came down from Judæa a certain prophet, named Agabus* (Acts 21:10), and *when he was come unto us, he took Paul''s girdle, and bound his own hands and feet, and said, Thus saith the Ruach HaKodesh (Holy Spirit), So shall the Yahudim (Jews) at Jerusalem bind the man that owneth this girdle, and shall deliver him into the hands of the Gentiles* (Acts 21:11). This is the old prophetic manner — the word of Yahuah (LORD) performed in the body before it is spoken aloud. Yahuah (LORD) sent Jeremiah out the same way: *Go and get thee a linen girdle, and put it upon thy loins, and put it not in water* (Jeremiah 13:1), a girdle taken and enacted to declare the marring of Yahudah''s pride. And Ezekiel was bound to bear the sign in his own flesh — *behold, I will lay bands upon thee, and thou shalt not turn thee from one side to another, till thou hast ended the days of thy siege* (Ezekiel 4:8). Agabus stands in that line: the bonds upon the prophet''s own hands and feet declare the bonds to come upon Paul. The sign is the prophecy; the Spirit speaks it in the body first.',
       sv.verse_id, ev.verse_id, 'free', 5775
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender',
       E'The will of Yahuah (Lord) be done — the Gethsemane surrender',
       E'When the company hears that Paul will be bound, *both we, and they of that place, besought him not to go up to Jerusalem* (Acts 21:12). But Paul answers, *What mean ye to weep and to break mine heart? for I am ready not to be bound only, but also to die at Jerusalem for the name of the Lord Yahusha (Lord Jesus)* (Acts 21:13). And when he will not be persuaded, the company ceases, *saying, The will of Yahuah (Lord) be done* (Acts 21:14). It is the very prayer the Master prayed in the garden, set toward his own binding and death: *O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt* (Matthew 26:39), and again, *Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done* (Luke 22:42). The Master drank the cup that was not removed; Paul goes up to the city that will bind him, ready to die for the name. The disciples who would have held him back lay down their own will as the Master laid down his — the cup not taken away, the will of Yahuah (Lord) done.',
       sv.verse_id, ev.verse_id, 'free', 5778
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant',
       E'Zealous of the law — the thousands who believe and keep the covenant',
       E'When Paul has declared *what things Elohim (God) had wrought among the Gentiles by his ministry* (Acts 21:19), the elders glorify Yahuah (Lord) and say, *Thou seest, brother, how many thousands of Yahudim (Jews) there are which believe; and they are all zealous of the law* (Acts 21:20). The believing thousands are not believers who have left the Torah behind; they are zealous of it. This is the zeal Mattathias called for in the day the covenant was under assault: *Whoever is zealous of the law, and maintaineth the covenant, let him follow me* (1 Maccabees 2:27). To believe in Yahusha (Jesus) and to be zealous of the law stand together, not against each other — the thousands who believe are the thousands who keep, and the covenant fidelity of the faithful remnant is unbroken by their faith. It is precisely because the believing thousands are zealous of the law that the rumor against Paul — that he teaches men to forsake Moses — must be answered, and answered by a Torah-keeping act.',
       sv.verse_id, ev.verse_id, 'extras', 5781
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense',
       E'Walkest orderly, and keepest the law — the Nazarite vow and Paul''s own defense',
       E'This is the chapter that breaks the lie of the law-abolishing Paul. A rumor has run ahead of him: *they are informed of thee, that thou teachest all the Yahudim (Jews) which are among the Gentiles to forsake Moses, saying that they ought not to circumcise their children, neither to walk after the customs* (Acts 21:21). The elders'' remedy is not to defend a Paul against the Torah, but to show the Torah-keeping Paul plainly: *We have four men which have a vow on them; Them take, and purify thyself with them, and be at charges with them, that they may shave their heads: and all may know that those things, whereof they were informed concerning thee, are nothing; but that thou thyself also walkest orderly, and keepest the law* (Acts 21:23-24). The vow is the Nazarite vow of Moses — *when either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2) — and its close is exactly what the four men do: *the Nazarite shall shave the head of his separation at the door of the tabernacle of the congregation … and put it in the fire which is under the sacrifice of the peace offerings* (Numbers 6:18). So *Paul took the men, and the next day purifying himself with them entered into the temple, to signify the accomplishment of the days of purification, until that an offering should be offered for every one of them* (Acts 21:26). He pays the charges; he keeps the vow to the letter. And this is no isolated act — it is the testimony of his whole defense. Before Felix: *after the way which they call heresy, so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets* (Acts 24:14), and *certain Yahudim (Jews) from Asia found me purified in the temple* (Acts 24:18). Before Festus: *Neither against the law of the Yahudim (Jews), neither against the temple, nor yet against Cæsar, have I offended any thing at all* (Acts 25:8). And at Rome, in chains: *I have committed nothing against the people, or customs of our fathers* (Acts 28:17). The rumor said he forsook Moses; the man kept a Nazarite vow in the temple and went to his death declaring he had offended nothing against the law, the temple, or the customs of the fathers. The Paul who abolished the Torah does not exist. The text itself names the report *nothing,* and Paul''s own act and his own mouth name it false.',
       sv.verse_id, ev.verse_id, 'free', 5784
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen',
       E'Against the people, and the law, and this place — the same false charge as Stephen',
       E'The Yahudim (Jews) of Asia see Paul in the temple — the temple where he is at that very hour keeping the law — and *stirred up all the people, and laid hands on him, Crying out, Men of Yashar''el (Israel), help: This is the man, that teacheth all men every where against the people, and the law, and this place: and further brought Greeks also into the temple, and hath polluted this holy place* (Acts 21:27-28). It is the same charge, almost word for word, that was laid against Stephen — and the text already named the witnesses who brought it: *they set up false witnesses, which said, This man ceaseth not to speak blasphemous words against this holy place, and the law* (Acts 6:13). Against the holy place, against the law: the accusation does not change because the accusation was never true. Stephen''s accusers were false witnesses; Paul''s accusers supposed a thing they had not seen — *for they had seen before with him in the city Trophimus an Ephesian, whom they supposed that Paul had brought into the temple* (Acts 21:29). The lie wears its old costume: take the man who keeps the Torah and call him the enemy of the Torah, take the man purifying himself in the temple and call him the one who polluted it. The same false charge, the same hour of the law-keeper accused of forsaking the law.',
       sv.verse_id, ev.verse_id, 'free', 5787
  FROM _s217_a21_lookup sv, _s217_a21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=21 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 13:1 — *Go and get thee a linen girdle, and put it upon thy loins* the enacted girdle-sign of the prophet; Agabus takes Paul''s girdle in the same manner (Acts 21:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 4:8 — *I will lay bands upon thee … till thou hast ended the days of thy siege* the prophet bound to bear the sign in his own body, as Agabus binds his own hands and feet (Acts 21:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-bound-with-pauls-girdle-the-enacted-sign-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 26:39 — *let this cup pass from me: nevertheless not as I will, but as thou wilt* the Master set toward his binding and death, as Paul is ready to die at Jerusalem (Acts 21:13).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 22:42 — *not my will, but thine, be done* the garden surrender the company echoes — *The will of Yahuah (Lord) be done* (Acts 21:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-the-will-of-the-lord-be-done-the-gethsemane-surrender'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 2:27 — *Whoever is zealous of the law, and maintaineth the covenant, let him follow me* the same zeal the believing thousands carry — *they are all zealous of the law* (Acts 21:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-zealous-of-the-law-the-thousands-who-believe-and-keep-the-covenant'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 6:2 — *to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* the Torah vow the four men carry, that Paul keeps to prove the rumor false (Acts 21:23-24).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 6:18 — *the Nazarite shall shave the head of his separation at the door of the tabernacle* the close of the vow Paul accomplishes in the temple with the offering (Acts 21:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 24:14 — *so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets* Paul''s own confession that he keeps the law (Acts 21:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 24:18 — *certain Yahudim (Jews) from Asia found me purified in the temple* the purification of Acts 21 named as Paul''s own defense (Acts 21:24,26).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=24 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 25:8 — *Neither against the law of the Yahudim (Jews), neither against the temple … have I offended* the law-keeper''s defense before Festus (Acts 21:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Acts 28:17 — *I have committed nothing against the people, or customs of our fathers* Paul''s last word, in chains at Rome, the rumor false to the end (Acts 21:21,24).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-walkest-orderly-and-keepest-the-law-the-nazarite-vow-and-pauls-own-defense'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 6:13 — *false witnesses, which said, This man ceaseth not to speak … against this holy place, and the law* the same false charge laid against Stephen, now thrown at Paul (Acts 21:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a21_lookup sv, _s217_a21_lookup tv
 WHERE t.slug='acts-21-against-the-people-and-the-law-and-this-place-the-same-false-charge-as-stephen'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=21 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_22.sql (S217 Acts 22) -----
-- =====================================================================
-- S217 minion — ACTS 22 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 22.  Tag: a22 (temp view _s217_a22_lookup).  Sort band: 5800-5824 (step 3).
-- Source is ALWAYS the canon Acts 22 verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- Acts 22 is Paul RETELLING his Damascus-road call in the Hebrew tongue. Acts<->Acts points to
-- Acts 9 (the narrative) and Acts 26 (the Agrippa retelling) where the same event is told. The
-- Acts-9-ANCHORED threads (acts-9-the-light-and-the-voice..., acts-9-a-chosen-vessel...) already
-- exist in minion_acts_08_09.sql; this fragment anchors on the Acts-22 source verses and builds
-- the Acts-22 retelling weave (no duplication of the Acts-9-anchored threads).
--
-- WATCHPOINTS (Red Lines #2/#7/#10/#11, Christology, son-of-Adam):
--  * v.3 — Paul the Torah-trained Pharisee at the feet of Gamaliel, "taught according to the
--    perfect manner of the law of the fathers, zealous toward Elohim (God)": the DROPPED-PAUL
--    correction. Paul never abandoned the Torah; the antinomian Paul is the horn's construction.
--    Phil 3:5 (a Pharisee, of the tribe of Benjamin) + Acts 26:5,7 (the twelve tribes' hope).
--  * v.6-8 — the light and the voice retold; the Formed himself (drawn from the Formless, the God
--    of the OT interactions, who came in flesh as Yahusha of Nazareth) appears and names himself.
--    Acts<->Acts to 9:3-6 and 26:13-15. NT-Lord governing rule preserved as the pull gives it.
--  * v.14 — "see that Just One": the Righteous One / righteous Servant / righteous Branch (Isaiah
--    53:11, Jeremiah 23:5, 1 John 2:1). The Formed seen — the Just One whose voice Saul hears.
--  * v.16 — "wash away thy sins, calling on the name of Yahuah (Lord)": Joel 2:32 / Acts 2:21 /
--    Romans 10:13 — calling on the name where the underlying Hebrew is YHWH. NOT a sola-fide
--    formula (Red Line #10); the calling is the turning home, baptism the door, the name the
--    name Joel named for deliverance in the remnant whom Yahuah shall call.
--  * v.21 — "send thee far hence unto the Gentiles": the DISPERSED / scattered house of Yashar'el
--    made nigh — the preserved of Yashar'el restored, the afar-off made my-people (Hosea/Lo-Ammi)
--    — NOT a graft of non-seed by faith-confession (Red Lines #7/#11). Isaiah 49:6 is load-bearing:
--    raise the tribes of Jacob AND restore the preserved of Yashar'el AND a light to the Gentiles;
--    Isaiah 57:19 / Ephesians 2:13,17 the far-off made nigh; Acts 2:39 the promise to them afar off.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 22:
--   v.1-2   defence in the Hebrew tongue   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative frame)
--   v.3     Gamaliel / perfect manner of the law / zealous   Tanakh: none added (Paul's Torah-credential carried in NT targets)  Extras: none warranted  NT: Philippians 3:5, Acts 26:5, Acts 26:7
--   v.4-5   persecuted this way unto death  Tanakh: none warranted  Extras: none warranted  NT: none added (carried in the light-and-voice retelling thread)
--   v.6-8   the light and the voice retold  Tanakh: none added (the Formed appearing carried in NT Acts-retellings)  Extras: none warranted  NT: Acts 9:4, Acts 9:5, Acts 26:14, Acts 26:15
--   v.9-11  the men saw the light / led blind   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; carried in light-and-voice thread)
--   v.12-13 Ananias devout according to the law  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.14    the God of our fathers / see that Just One   Tanakh: Isaiah 53:11, Jeremiah 23:5  Extras: none warranted  NT: 1 John 2:1
--   v.15    his witness unto all men         Tanakh: none warranted  Extras: none warranted  NT: none added (carried in the chosen-vessel Acts-9 thread)
--   v.16    be baptized, wash away thy sins, calling on the name  Tanakh: Joel 2:32  Extras: none warranted  NT: Acts 2:21, Romans 10:13
--   v.17-20 the trance in the temple         Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.21    far hence unto the Gentiles      Tanakh: Isaiah 49:6, Isaiah 57:19  Extras: none warranted  NT: Ephesians 2:13, Ephesians 2:17, Acts 2:39
--   v.22-23 the crowd's rage at the word     Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; the rage is the false-inclusion-binary defending itself, carried in the v.21 thread prose)
--   v.24-30 scourging / Roman citizenship    Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5800 acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee   (NT)
--   5803 acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth         (NT, Acts<->Acts)
--   5806 acts-22-that-just-one-the-righteous-servant-and-branch-seen             (Tanakh + NT)
--   5809 acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah                (Tanakh + NT)
--   5812 acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh       (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee
  ('canon', 'acts', 22, 3, 'canon', 'philippians', 3, 5, 'free', E'*Circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee;* (Philippians 3:5). Paul tells the crowd the same thing he tells the Philippians: *I am verily a man which am a Yahudi (Jew) … brought up in this city at the feet of Gamaliel, and taught according to the perfect manner of the law of the fathers, and was zealous toward Elohim (God)* (Acts 22:3). This is no man who abandoned the Torah — he is a Pharisee of the tribe of Benjamin, an Hebrew of the Hebrews, trained in the perfect manner of the law. The Paul who threw away the Torah is the horn''s construction; the Paul of the page is the Torah-faithful Yashar''eli (Israelite) the prophets'' hope sent.'),
  ('canon', 'acts', 22, 3, 'canon', 'acts', 26, 5, 'free', E'*Which knew me from the beginning, if they would testify, that after the most straitest sect of our religion I lived a Pharisee.* (Acts 26:5). Before Agrippa, Paul says it the same way he says it to the crowd at Jerusalem — *taught according to the perfect manner of the law of the fathers* (Acts 22:3). He lived *a Pharisee,* after the most straitest sect, observing the law of the fathers; the zeal that drove the persecution was zeal *toward Elohim (God).* The man was always inside the covenant, never outside the Torah.'),
  ('canon', 'acts', 22, 3, 'canon', 'acts', 26, 7, 'free', E'*Unto which promise our twelve tribes, instantly serving Elohim (God) day and night, hope to come. For which hope''s sake, king Agrippa, I am accused of the Yahudim (Jews).* (Acts 26:7). The Torah-trained Pharisee of Acts 22:3 names the hope he stands for: the promise made to the fathers toward which *our twelve tribes* serve day and night. This is the whole of it — not a man who left Yashar''el (Israel) for some new thing, but a man on trial for the twelve-tribe hope, the gathering of all the houses the prophets promised.'),
  -- thread: acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth
  ('canon', 'acts', 22, 7, 'canon', 'acts', 9, 4, 'free', E'*And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:4). Paul now retells it in his own mouth: *I fell unto the ground, and heard a voice saying unto me, Saul, Saul, why persecutest thou me?* (Acts 22:7). The same voice, the same words, the same falling — the One who appeared and spoke through all the history of the fathers, now glorified, speaks Saul''s name from the light, counting the persecution of his disciples as persecution of himself.'),
  ('canon', 'acts', 22, 8, 'canon', 'acts', 9, 5, 'free', E'*And he said, Who art thou, Yahuah (Lord)? And Yahuah (Lord) said, I am Yahusha (Jesus) whom thou persecutest: it is hard for thee to kick against the pricks.* (Acts 9:5). Saul cries the same question in the retelling — *Who art thou, Yahuah (Lord)?* — and hears the same answer: *I am Yahusha (Jesus) of Nazareth, whom thou persecutest* (Acts 22:8). The One in the light who answers to the name Yahuah is Yahusha of Nazareth: the Formed who is Yahuah, drawn from the Formless, who came in the flesh and now appears risen and glorified.'),
  ('canon', 'acts', 22, 7, 'canon', 'acts', 26, 14, 'free', E'*And when we were all fallen to the earth, I heard a voice speaking unto me, and saying in the Hebrew tongue, Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks.* (Acts 26:14). Before Agrippa, Paul adds the detail he gives the Jerusalem crowd by speaking it: the voice came *in the Hebrew tongue.* The same falling to the ground, the same *Saul, Saul, why persecutest thou me?* (Acts 22:7) — told a third time, the Formed speaking the persecutor''s name in the tongue of the fathers.'),
  ('canon', 'acts', 22, 8, 'canon', 'acts', 26, 15, 'free', E'*And I said, Who art thou, Yahuah (Lord)? And he said, I am Yahusha (Jesus) whom thou persecutest.* (Acts 26:15). The question and the answer are identical across all three tellings — *Who art thou, Yahuah (Lord)? … I am Yahusha (Jesus) of Nazareth, whom thou persecutest* (Acts 22:8). The Name that answers from the light is the Formed himself: he who is Yahuah and came in the flesh as Yahusha of Nazareth, persecuted in his disciples and now calling the one who hunted them.'),
  -- thread: acts-22-that-just-one-the-righteous-servant-and-branch-seen
  ('canon', 'acts', 22, 14, 'canon', 'isaiah', 53, 11, 'free', E'*He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* (Isaiah 53:11). Ananias tells Saul that *the Elohim (God) of our fathers hath chosen thee, that thou shouldest know his will, and see that Just One, and shouldest hear the voice of his mouth* (Acts 22:14). The Just One Saul saw in the light is the righteous Servant Isaiah saw — the One who bears the iniquities of many and by his knowledge justifies them. To see the Just One is to see the Servant of the prophet, satisfied in the travail of his soul.'),
  ('canon', 'acts', 22, 14, 'canon', 'jeremiah', 23, 5, 'free', E'*Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth.* (Jeremiah 23:5). The *Just One* Saul was chosen to see (Acts 22:14) is the righteous Branch Jeremiah named — raised unto David, the King who reigns in justice. The One in the glory of the light is the righteous King the prophet promised, the Branch of David come and seen.'),
  ('canon', 'acts', 22, 14, 'canon', '1-john', 2, 1, 'free', E'*My little children, these things write I unto you, that ye sin not. And if any man sin, we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous:* (1 John 2:1). The *Just One* Ananias names (Acts 22:14) is *Yahusha HaMashiach (Jesus Christ) the righteous* — the same Righteous One, the advocate with the Father. The Just One Saul saw and whose voice he heard is the righteous One who stands for his own before the Father.'),
  -- thread: acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah
  ('canon', 'acts', 22, 16, 'canon', 'joel', 2, 32, 'free', E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* (Joel 2:32). Ananias says, *arise, and be baptized, and wash away thy sins, calling on the name of Yahuah (Lord)* (Acts 22:16). The name Saul is told to call upon is the name Joel named for deliverance — and the deliverance is *in the remnant whom Yahuah (LORD) shall call.* The calling is not a formula that earns; it is the turning home of one already called in the remnant, the washing the door he walks through.'),
  ('canon', 'acts', 22, 16, 'canon', 'acts', 2, 21, 'free', E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (Lord) shall be saved.* (Acts 2:21). At Pentecost Peter quoted Joel''s promise — *whosoever shall call on the name of Yahuah (Lord) shall be saved* — and now Ananias bids Saul do exactly that: *wash away thy sins, calling on the name of Yahuah (Lord)* (Acts 22:16). The same name, the same calling, the same deliverance — the persecutor brought to call on the Name he had set out to stamp out.'),
  ('canon', 'acts', 22, 16, 'canon', 'romans', 10, 13, 'free', E'*For whosoever shall call upon the name of Yahuah (Lord) shall be saved.* (Romans 10:13). Saul, told to *wash away thy sins, calling on the name of Yahuah (Lord)* (Acts 22:16), would later write the same Joel-promise into his letter to the Romans — *whosoever shall call upon the name of Yahuah (Lord) shall be saved.* The one who called on the Name at the water preaches the calling on the Name; the Name is Yahuah''s, the deliverance the remnant''s.'),
  -- thread: acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh
  ('canon', 'acts', 22, 21, 'canon', 'isaiah', 49, 6, 'free', E'*And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* (Isaiah 49:6). When Yahusha (Jesus) tells Saul *Depart: for I will send thee far hence unto the Gentiles* (Acts 22:21), the sending is the work Isaiah named: the same Servant raises up the tribes of Jacob AND restores the preserved of Yashar''el (Israel) AND is a light to the Gentiles. The dispersion among the nations is where the preserved of Yashar''el are scattered — and the light goes far hence to gather them, not to splice in a new people.'),
  ('canon', 'acts', 22, 21, 'canon', 'isaiah', 57, 19, 'free', E'*I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him.* (Isaiah 57:19). The sending *far hence unto the Gentiles* (Acts 22:21) carries the peace Isaiah created for *him that is far off, and to him that is near.* The far-off is not a stranger to the covenant but the scattered of the house made distant by the exile; the same Yahuah (LORD) who heals the near heals the far, and the word goes to gather both.'),
  ('canon', 'acts', 22, 21, 'canon', 'ephesians', 2, 13, 'free', E'*But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ).* (Ephesians 2:13). The ones to whom Saul is *sent far hence* (Acts 22:21) are *ye who sometimes were far off* — the dispersed of Yashar''el (Israel), aliens from the commonwealth by the scattering, now *made nigh.* The far-off made nigh is the homecoming of the house that was estranged, the lost sheep brought back to the fold they were always of.'),
  ('canon', 'acts', 22, 21, 'canon', 'ephesians', 2, 17, 'free', E'*And came and preached peace to you which were afar off, and to them that were nigh.* (Ephesians 2:17). The sending *far hence unto the Gentiles* (Acts 22:21) is the preaching of peace *to you which were afar off, and to them that were nigh* — Yosef and Yahudah, the scattered house and the near house, both gathered. The afar-off are the dispersed seed, not the unrelated nations; the peace preached far hence reconciles the two houses into one.'),
  ('canon', 'acts', 22, 21, 'canon', 'acts', 2, 39, 'free', E'*For the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call.* (Acts 2:39). The sending *far hence* (Acts 22:21) reaches *all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call.* The afar-off are within the promise, not added to it — the dispersed children whom Yahuah Eloheinu (the Lord our God) shall call, the hearing revealing what was already true: they are of the called remnant, made nigh.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee',
       E'Brought up at the feet of Gamaliel — the Torah-trained Pharisee',
       E'Paul opens his defence in the Hebrew tongue with his own credential: *I am verily a man which am a Yahudi (Jew), born in Tarsus, a city in Cilicia, yet brought up in this city at the feet of Gamaliel, and taught according to the perfect manner of the law of the fathers, and was zealous toward Elohim (God), as ye all are this day* (Acts 22:3). This is the man the horn''s pulpit later turns into the abolisher of the Torah — and the page will not bear it. He tells the Philippians the same: *circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee* (Philippians 3:5). He tells Agrippa the same: *after the most straitest sect of our religion I lived a Pharisee* (Acts 26:5). And he names the hope the whole defence stands on — *unto which promise our twelve tribes, instantly serving Elohim (God) day and night, hope to come* (Acts 26:7). The man was never outside the Torah and never outside Yashar''el (Israel). He is a Pharisee of Benjamin, Torah-trained in the perfect manner of the law, on trial for the twelve-tribe hope the prophets promised. The Paul who threw away the covenant is a construction; the Paul of the page is the Torah-faithful Yashar''eli the gathering sent.',
       sv.verse_id, ev.verse_id, 'free', 5800
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth',
       E'The light and the voice retold — I am Yahusha (Jesus) of Nazareth',
       E'Paul retells the Damascus road in his own mouth: *as I made my journey, and was come nigh unto Damascus about noon, suddenly there shone from heaven a great light round about me. And I fell unto the ground, and heard a voice saying unto me, Saul, Saul, why persecutest thou me?* (Acts 22:6-7). He cries the question and hears the Name — *Who art thou, Yahuah (Lord)? And he said unto me, I am Yahusha (Jesus) of Nazareth, whom thou persecutest* (Acts 22:8). It is the same event Luke narrates — *he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me? … I am Yahusha (Jesus) whom thou persecutest* (Acts 9:4-5) — and the same event Paul tells Agrippa, adding that the voice came *in the Hebrew tongue, Saul, Saul, why persecutest thou me?* (Acts 26:14), and again the answer, *I am Yahusha (Jesus) whom thou persecutest* (Acts 26:15). Three tellings, one voice. The One in the light who answers to the name Yahuah is Yahusha of Nazareth — the Formed himself, drawn from the Formless, the God of the fathers'' interactions, who came in the flesh and now appears risen and glorified, counting the persecution of his disciples as persecution of himself.',
       sv.verse_id, ev.verse_id, 'free', 5803
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-that-just-one-the-righteous-servant-and-branch-seen',
       E'That Just One — the righteous Servant and Branch seen',
       E'Ananias, *a devout man according to the law, having a good report of all the Yahudim (Jews)* (Acts 22:12), tells Saul what he has been chosen for: *The Elohim (God) of our fathers hath chosen thee, that thou shouldest know his will, and see that Just One, and shouldest hear the voice of his mouth* (Acts 22:14). The Just One Saul saw in the light is the Righteous One the prophets named. He is Isaiah''s righteous Servant — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). He is Jeremiah''s righteous Branch — *I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5). He is the advocate John names — *we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* (1 John 2:1). To see the Just One and hear the voice of his mouth is to see and hear the righteous Servant, the Branch of David, the Righteous One who bears iniquities and stands for his own before the Father.',
       sv.verse_id, ev.verse_id, 'free', 5806
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah',
       E'Wash away thy sins — calling on the name of Yahuah (Lord)',
       E'Ananias''s charge is plain: *And now why tarriest thou? arise, and be baptized, and wash away thy sins, calling on the name of Yahuah (Lord)* (Acts 22:16). The name Saul is told to call upon is the name the prophet named for deliverance: *whosoever shall call on the name of Yahuah (LORD) shall be delivered … and in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). At Pentecost Peter had already quoted it — *whosoever shall call on the name of Yahuah (Lord) shall be saved* (Acts 2:21) — and Saul himself would later write it to the Romans: *whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13). The calling is no formula that purchases what was not; the deliverance is *in the remnant whom Yahuah (LORD) shall call.* The washing is the door the called one walks through, the calling on the Name the turning home of one already named in the remnant. The persecutor who set out to stamp out the Name is brought to call upon it.',
       sv.verse_id, ev.verse_id, 'free', 5809
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh',
       E'Far hence unto the Gentiles — the dispersed house made nigh',
       E'In the trance in the temple the Master tells Saul, *Depart: for I will send thee far hence unto the Gentiles* (Acts 22:21) — and at the word the crowd erupts, *Away with such a fellow from the earth: for it is not fit that he should live* (Acts 22:22). The rage is the two-category lie defending itself, hearing in *far hence unto the Gentiles* a betrayal it never was. For the sending is the very work Isaiah named for the Servant: *It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* (Isaiah 49:6). The same Servant raises the tribes of Jacob, restores the preserved of Yashar''el (Israel), and is a light to the Gentiles — because the dispersion among the nations is exactly where the preserved of Yashar''el are scattered. The far-off are not strangers to the covenant: *Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* (Isaiah 57:19). They are *ye who sometimes were far off* now *made nigh* (Ephesians 2:13), the ones to whom he *came and preached peace … which were afar off, and to them that were nigh* (Ephesians 2:17) — Yosef and Yahudah, the scattered house and the near house, the two made one. The promise reaches *all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts 2:39). The sending far hence is not a graft of a new people; it is the gathering of the dispersed seed, the lost sheep made nigh, the hearing revealing what was already true.',
       sv.verse_id, ev.verse_id, 'free', 5812
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 3:5 — *of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee* Paul''s own credential, the Torah-trained Yashar''eli (Israelite), no abolisher of the law (Acts 22:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 26:5 — *after the most straitest sect of our religion I lived a Pharisee* the same credential before Agrippa; the man always inside the Torah (Acts 22:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 26:7 — *unto which promise our twelve tribes … hope to come* the hope the Torah-trained Pharisee stands trial for: the twelve-tribe gathering (Acts 22:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 9:4 — *Saul, Saul, why persecutest thou me?* the same voice Luke narrates, now retold by Paul himself (Acts 22:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 9:5 — *I am Yahusha (Jesus) whom thou persecutest* the Name that answers to Yahuah from the light, the Formed in the flesh (Acts 22:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 26:14 — *saying in the Hebrew tongue, Saul, Saul, why persecutest thou me?* the third telling, the voice in the tongue of the fathers (Acts 22:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 26:15 — *I am Yahusha (Jesus) whom thou persecutest* the identical answer across all three tellings; he who is Yahuah came in the flesh as Yahusha (Acts 22:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-22-that-just-one-the-righteous-servant-and-branch-seen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:11 — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* the Just One Saul saw is Isaiah''s righteous Servant (Acts 22:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-that-just-one-the-righteous-servant-and-branch-seen'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 23:5 — *I will raise unto David a righteous Branch, and a King shall reign and prosper* the Just One is the righteous Branch of David (Acts 22:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-that-just-one-the-righteous-servant-and-branch-seen'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 2:1 — *an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* the Just One named is the Righteous One, advocate with the Father (Acts 22:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-that-just-one-the-righteous-servant-and-branch-seen'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:32 — *whosoever shall call on the name of Yahuah (LORD) shall be delivered … in the remnant whom Yahuah (LORD) shall call* the Name Saul is told to call on, the deliverance in the called remnant (Acts 22:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 2:21 — *whosoever shall call on the name of Yahuah (Lord) shall be saved* Peter''s Pentecost quotation of Joel; the same calling Saul is now bid to do (Acts 22:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 10:13 — *whosoever shall call upon the name of Yahuah (Lord) shall be saved* Saul who called on the Name later preaches the calling on the Name (Acts 22:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:6 — *to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* the Servant''s one work; the dispersed seed gathered, not a new people grafted (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 57:19 — *Peace, peace to him that is far off, and to him that is near* the far-off is the scattered house made distant by exile, not the unrelated nations (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 2:13 — *ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* the dispersed of Yashar''el (Israel) made nigh, the lost sheep brought home (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 2:17 — *preached peace to you which were afar off, and to them that were nigh* Yosef and Yahudah, the two houses reconciled into one (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 2:39 — *the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* the afar-off within the promise, called and made nigh (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_23.sql (S217 Acts 23) -----
-- =====================================================================
-- S217 minion — ACTS 23 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 23.  Tag: a23 (temp view _s217_a23_lookup).  Sort band: 5825-5849.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
-- (All targets in this fragment are canon — every thread is tier_required='free'.)
--
-- WATCHPOINTS (Red Lines #4/#5, the dropped-Paul note, Christology, son-of-Adam):
--  * Whited wall (v.3): Paul invokes the Torah against the high priest — *commandest me to be
--    smitten contrary to the law?* The wall daubed with untempered mortar is Ezekiel's image of
--    the false-peace builders who seduce the people; the law Paul appeals to is Leviticus 19:15,
--    righteous judgment. This is Torah honored, never Torah set against grace (Red Line #4).
--  * Speak not evil of the ruler (v.5): Paul corrects himself by Torah — *it is written* — the
--    bodily refutation of the dropped-Paul accusation that he taught against Mosheh (Moses). The
--    Torah-observant Yashar'elite submits to the written word even mid-rebuke (Red Line #5).
--  * The resurrection hope (v.6): *of the hope and resurrection of the dead I am called in
--    question* is the Tanakh hope — Daniel's awaking from the dust, Job's living redeemer, Isaiah's
--    dead men shall live. NOT a novel doctrine; the prophets' own promise of the gathering and the
--    first resurrection. The Pharisee/Sadducee split is over whether the prophets are believed.
--  * The Master stands by (v.11): *Yahuah (Lord) stood by him* — the Formed himself, who is
--    Yahuah and came in the flesh as Yahusha (Jesus), keeps the I-am-with-thee promise he made to
--    Yehoshua (Joshua) and Jeremiah, and sends Paul on to bear witness at Rome. The keeper and the
--    sender are one; the same voice stood by at Corinth (Acts 18) and stands by again here.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 23:
--   v.1     good conscience before Elohim   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; the testimony carried in the resurrection-hope thread)
--   v.2-3   whited wall / smitten contrary to law  Tanakh: Ezekiel 13:10, Ezekiel 13:14, Ezekiel 13:15 (untempered mortar / the false-peace wall); Leviticus 19:15 (judge in righteousness — the law Paul invokes)  Extras: none warranted  NT: Matthew 23:27 weighed (whited sepulchres — verbal echo, different image/target; not added, the wall is Ezekiel's)
--   v.4-5   speak not evil of the ruler      Tanakh: Exodus 22:28  Extras: none warranted  NT: none warranted
--   v.6     hope and resurrection of the dead  Tanakh: Daniel 12:2, Job 19:25, Job 19:26, Isaiah 26:19  Extras: none warranted (2 Maccabees 7 weighed — the resurrection confession of the martyrs; the Tanakh witnesses carry it cleaner, not added)  NT: none added (the hope carried in the Tanakh prophets)
--   v.7-8   Pharisees / Sadducees / resurrection, angel, spirit  Tanakh: none added (carried in the resurrection-hope thread)  Extras: none warranted  NT: none warranted (narrative)
--   v.9     if a spirit or an angel hath spoken  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.10    chief captain rescues Paul       Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.11    Yahuah stood by him — witness at Rome  Tanakh: Joshua 1:5, Joshua 1:9, Jeremiah 1:8, Jeremiah 1:19, Isaiah 41:10  Extras: none warranted  NT: Acts 18:9, Acts 18:10, Acts 27:23, Acts 27:24
--   v.12-15 the forty under a curse           Tanakh: none warranted (Psalm-37-wait-on-the-wicked weighed; thin, not added)  Extras: none warranted  NT: none warranted (narrative; the plot foiled is the keeping promise of v.11 made visible)
--   v.16-22 Paul's nephew warns               Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.23-35 night march to Caesarea / letter / Felix  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; the safe arrival is the keeping promise of v.11 carried out)
--
-- THREADS (slug -> target libraries):
--   5825 acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment  (Tanakh)
--   5828 acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah (Tanakh)
--   5831 acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope          (Tanakh)
--   5834 acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome         (Tanakh + NT, Acts<->Acts)
-- =====================================================================

CREATE TEMP VIEW _s217_a23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment
  ('canon', 'acts', 23, 3, 'canon', 'ezekiel', 13, 10, 'free', E'*Because, even because they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter:* (Ezekiel 13:10). When the high priest commands him struck, Paul answers, *Elohim (God) shall smite thee, thou whited wall* (Acts 23:3). The image is Ezekiel''s: a wall built and daubed over with untempered mortar to hide its weakness — the false-peace builders who seduce the people with a covering that cannot stand. The whitewashed wall looks sound and is not; the one who sits to judge by the law and breaks the law to do it is that wall.'),
  ('canon', 'acts', 23, 3, 'canon', 'ezekiel', 13, 14, 'free', E'*So will I break down the wall that ye have daubed with untempered morter, and bring it down to the ground, so that the foundation thereof shall be discovered, and it shall fall, and ye shall be consumed in the midst thereof: and ye shall know that I am Yahuah (LORD).* (Ezekiel 13:14). *Elohim (God) shall smite thee, thou whited wall* (Acts 23:3) — Paul speaks the very sentence Ezekiel spoke over the daubed wall: it shall be smitten, broken down, its hidden foundation laid bare. The smiting Paul names is not his own vengeance but the verdict the prophet already pronounced on the wall that wears a fair covering over rot.'),
  ('canon', 'acts', 23, 3, 'canon', 'ezekiel', 13, 15, 'free', E'*Thus will I accomplish my wrath upon the wall, and upon them that have daubed it with untempered morter, and will say unto you, The wall is no more, neither they that daubed it;* (Ezekiel 13:15). The whited wall and they that daubed it both come to nothing under the wrath Ezekiel names. Paul, struck on the mouth contrary to the law, names the high priest the whited wall (Acts 23:3) — the daubed covering that cannot save the daubers; the fair front falls with those who built it.'),
  ('canon', 'acts', 23, 3, 'canon', 'leviticus', 19, 15, 'free', E'*Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour.* (Leviticus 19:15). Paul''s charge is precise: *sittest thou to judge me after the law, and commandest me to be smitten contrary to the law?* (Acts 23:3). The very Torah the high priest sits to administer forbids him this: judgment is to be done in righteousness, not by striking the accused before the cause is heard. Paul appeals not against the law but to it — the law honored against the one who breaks it from the judgment seat.'),
  -- thread: acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah
  ('canon', 'acts', 23, 5, 'canon', 'exodus', 22, 28, 'free', E'*Thou shalt not revile the gods, nor curse the ruler of thy people.* (Exodus 22:28). When told he had reviled Elohim''s (God''s) high priest, Paul yields at once: *I wist not, brethren, that he was the high priest: for it is written, Thou shalt not speak evil of the ruler of thy people* (Acts 23:5). He does not defend his words; he submits to the written Torah the moment it is brought to bear. The man accused of teaching against Mosheh (Moses) corrects himself by Mosheh''s own book — the Torah-keeping Yashar''elite bound by the word even in the heat of rebuke.'),
  -- thread: acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope
  ('canon', 'acts', 23, 6, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Paul cries in the council, *of the hope and resurrection of the dead I am called in question* (Acts 23:6). The hope is no novelty: Daniel saw the sleepers in the dust awake, some to everlasting life. The resurrection Paul is tried for is the prophets'' own promise — the awaking of those who sleep, which the Sadducees deny and the Pharisees confess (Acts 23:8).'),
  ('canon', 'acts', 23, 6, 'canon', 'job', 19, 25, 'free', E'*For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth:* (Job 19:25). The hope Paul is called in question for (Acts 23:6) is the hope Job confessed out of his ash heap: a living Redeemer who shall stand at the latter day upon the earth. The resurrection of the dead is bound up in a Redeemer who lives — the Formed one who would stand upon the earth, in whom the dust-sleepers'' awaking is sure.'),
  ('canon', 'acts', 23, 6, 'canon', 'job', 19, 26, 'free', E'*And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God):* (Job 19:26). *Of the hope and resurrection of the dead I am called in question* (Acts 23:6). Job names the substance of that hope: though the body be destroyed, *in my flesh shall I see Elohim (God)* — the resurrection of the very flesh, not a flight from it. The hope Paul stands trial for is this hope: the dead raised bodily to see Elohim (God) with their own eyes.'),
  ('canon', 'acts', 23, 6, 'canon', 'isaiah', 26, 19, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). The resurrection Paul is tried for (Acts 23:6) is the song Isaiah set in the mouth of the dust-dwellers: *Thy dead men shall live … Awake and sing, ye that dwell in dust.* This is the prophets'' hope of the gathering — the earth casting out its dead, the sleepers raised; the very thing the Sadducees say cannot be (Acts 23:8).'),
  -- thread: acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome
  ('canon', 'acts', 23, 11, 'canon', 'joshua', 1, 5, 'free', E'*There shall not any man be able to stand before thee all the days of thy life: as I was with Mosheh (Moses), so I will be with thee: I will not fail thee, nor forsake thee.* (Joshua 1:5). *And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul* (Acts 23:11). The One who stood by Paul in the night is the One who stood by Yehoshua (Joshua): *I will not fail thee, nor forsake thee.* The Formed who went with Mosheh (Moses) and Yehoshua keeps the same word now — he stands by, he does not forsake.'),
  ('canon', 'acts', 23, 11, 'canon', 'joshua', 1, 9, 'free', E'*Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest.* (Joshua 1:9). *Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). The charge to Yehoshua (Joshua) — *be strong … be not afraid … for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* — is the charge now to Paul: be of good cheer, for the One with thee will carry thee whithersoever thou goest, even unto Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'jeremiah', 1, 8, 'free', E'*Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD).* (Jeremiah 1:8). To the council that would tear Paul in pieces, the word of the night is *Be of good cheer* (Acts 23:11) — the same word Yahuah (LORD) spoke to Jeremiah when the faces around him were set against him: *I am with thee to deliver thee.* The Master who sent the prophet stands by his witness and delivers him to finish the testimony appointed.'),
  ('canon', 'acts', 23, 11, 'canon', 'jeremiah', 1, 19, 'free', E'*And they shall fight against thee; but they shall not prevail against thee; for I am with thee, saith Yahuah (LORD), to deliver thee.* (Jeremiah 1:19). The forty bind themselves under a curse to kill Paul (Acts 23:12-13), yet the word already stood: *Be of good cheer … so must thou bear witness also at Rome* (Acts 23:11). As Yahuah (LORD) told Jeremiah, *they shall fight against thee; but they shall not prevail against thee; for I am with thee … to deliver thee* — the plot cannot break what the Master has appointed; the witness must reach Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'isaiah', 41, 10, 'free', E'*Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* (Isaiah 41:10). *Be of good cheer, Paul* (Acts 23:11) is the same comfort Isaiah carries: *Fear thou not; for I am with thee … I will uphold thee with the right hand of my righteousness.* The Master who stands by in the night is the upholding right hand; the witness is held up, not by his own strength, but by the One who is with him.'),
  ('canon', 'acts', 23, 11, 'canon', 'acts', 18, 9, 'free', E'*Then spake Yahuah (Lord) to Paul in the night by a vision, Be not afraid, but speak, and hold not thy peace:* (Acts 18:9). This is not the first night the Master has stood by. At Corinth, *Yahuah (Lord)* spoke to Paul *in the night by a vision, Be not afraid, but speak;* now again *the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul* (Acts 23:11). The same voice, the same keeping — the Master who told him to speak at Corinth tells him here he will yet speak at Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'acts', 18, 10, 'free', E'*For I am with thee, and no man shall set on thee to hurt thee: for I have much people in this city.* (Acts 18:10). At Corinth the Master''s word was *I am with thee, and no man shall set on thee to hurt thee* (Acts 18:10); now the forty lie in wait to kill Paul, yet the night word stands — *as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). The One who shielded him at Corinth shields him still: no man shall set on him to stop the testimony appointed for Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'acts', 27, 23, 'free', E'*For there stood by me this night the angel of Elohim (God), whose I am, and whom I serve,* (Acts 27:23). The promise of the night in Jerusalem — *so must thou bear witness also at Rome* (Acts 23:11) — holds through the storm at sea: *there stood by me this night the angel of Elohim (God), whose I am, and whom I serve.* The Master who stood by him in the castle stands by him again on the foundering ship; the witness will not be lost to the deep, for he must yet stand at Rome.'),
  ('canon', 'acts', 23, 11, 'canon', 'acts', 27, 24, 'free', E'*Saying, Fear not, Paul; thou must be brought before Cæsar: and, lo, Elohim (God) hath given thee all them that sail with thee.* (Acts 27:24). The word at Jerusalem, *bear witness also at Rome* (Acts 23:11), is sealed in the storm: *Fear not, Paul; thou must be brought before Cæsar.* What the Master appointed in the night by the council he carries to its end through shipwreck — Paul *must* be brought before Cæsar, and the keeping reaches even to the lives of all who sail with him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment',
       E'Thou whited wall — the untempered morter and righteous judgment',
       E'Brought before the council, Paul says *I have lived in all good conscience before Elohim (God) until this day* (Acts 23:1), and the high priest Ananias commands him struck on the mouth. Paul answers, *Elohim (God) shall smite thee, thou whited wall: for sittest thou to judge me after the law, and commandest me to be smitten contrary to the law?* (Acts 23:3). The whited wall is Ezekiel''s image of the false-peace builders: *they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter* (Ezekiel 13:10) — a wall whitewashed over to hide that it cannot stand. The verdict on that wall is the verdict Paul speaks: *So will I break down the wall that ye have daubed with untempered morter … and ye shall know that I am Yahuah (LORD)* (Ezekiel 13:14), *Thus will I accomplish my wrath upon the wall, and upon them that have daubed it with untempered morter* (Ezekiel 13:15). And the law Paul appeals to is no abolished thing — it is the standing Torah of righteous judgment: *Ye shall do no unrighteousness in judgment … but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). The high priest sits to judge by the law and breaks the law to do it; Paul does not despise the Torah but holds it up against the one who breaks it from the judgment seat.',
       sv.verse_id, ev.verse_id, 'free', 5825
  FROM _s217_a23_lookup sv, _s217_a23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=23 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah',
       E'Thou shalt not speak evil of the ruler — Paul corrected by Torah',
       E'When the bystanders rebuke him — *Revilest thou Elohim''s (God''s) high priest?* (Acts 23:4) — Paul does not stand on his words. He yields at once: *I wist not, brethren, that he was the high priest: for it is written, Thou shalt not speak evil of the ruler of thy people* (Acts 23:5). The word he submits to is Mosheh''s (Moses'') own: *Thou shalt not revile the gods, nor curse the ruler of thy people* (Exodus 22:28). This is the bodily refutation of the slander that Paul taught the people to forsake the Torah. The man accused of teaching against Mosheh (Moses) corrects himself, mid-rebuke, by Mosheh''s book — *for it is written.* The Torah-keeping Yashar''elite is bound by the written word the instant it is brought to bear, and bows to it before the council that hates him. Paul does not weaponize the law selectively; he is governed by it, even against his own outburst.',
       sv.verse_id, ev.verse_id, 'free', 5828
  FROM _s217_a23_lookup sv, _s217_a23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=23 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope',
       E'The hope and resurrection of the dead — the Tanakh hope',
       E'Perceiving the council split, Paul cries, *Men and brethren, I am a Pharisee, the son of a Pharisee: of the hope and resurrection of the dead I am called in question* (Acts 23:6) — *for the Sadducees say that there is no resurrection, neither angel, nor spirit: but the Pharisees confess both* (Acts 23:8). The hope Paul is tried for is not a new doctrine but the prophets'' own promise. Daniel saw it: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Job confessed it out of his suffering: *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth* (Job 19:25), *And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God)* (Job 19:26) — the very flesh raised to see Elohim (God), not a flight from the body. Isaiah set the song in the mouth of the dust-dwellers: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust … and the earth shall cast out the dead* (Isaiah 26:19). This is the hope of the gathering — the sleepers raised, the living Redeemer standing upon the earth, the first resurrection of the worthy of the seed. The Sadducees deny what the prophets promised; Paul stands trial for believing them.',
       sv.verse_id, ev.verse_id, 'free', 5831
  FROM _s217_a23_lookup sv, _s217_a23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=23 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome',
       E'Yahuah (Lord) stood by him — the Master keeps and sends to Rome',
       E'After the council is torn with dissension and Paul is taken by force into the castle, the night comes: *And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). The One who stood by him is the Formed himself — he who is Yahuah and came in the flesh as Yahusha (Jesus) — keeping the promise he has made to his witnesses from the beginning. To Yehoshua (Joshua) he said *as I was with Mosheh (Moses), so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5), *be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). To Jeremiah, with the faces set against him, *Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD)* (Jeremiah 1:8), *they shall fight against thee; but they shall not prevail against thee; for I am with thee … to deliver thee* (Jeremiah 1:19). And through Isaiah, *Fear thou not; for I am with thee … I will uphold thee with the right hand of my righteousness* (Isaiah 41:10). The same voice had already stood by Paul at Corinth — *Be not afraid, but speak, and hold not thy peace: For I am with thee, and no man shall set on thee to hurt thee* (Acts 18:9-10) — and would stand by him again in the storm at sea: *Fear not, Paul; thou must be brought before Cæsar* (Acts 27:24). So when more than forty bind themselves under a curse to kill him (Acts 23:12-13), the plot is already broken: the Master who keeps is also the Master who sends, and the witness appointed for Rome cannot be stopped short of it.',
       sv.verse_id, ev.verse_id, 'free', 5834
  FROM _s217_a23_lookup sv, _s217_a23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=23 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 13:10 — *one built up a wall, and, lo, others daubed it with untempered morter* the false-peace wall whitewashed over its weakness; the whited wall Paul names (Acts 23:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 13:14 — *So will I break down the wall that ye have daubed with untempered morter … and ye shall know that I am Yahuah (LORD)* the verdict Paul speaks over the whited wall (Acts 23:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 13:15 — *Thus will I accomplish my wrath upon the wall, and upon them that have daubed it* the fair front falls with those who built it (Acts 23:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 19:15 — *in righteousness shalt thou judge thy neighbour* the standing Torah of righteous judgment Paul appeals to against the high priest (Acts 23:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-whited-wall-the-untempered-morter-and-righteous-judgment'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 22:28 — *Thou shalt not revile the gods, nor curse the ruler of thy people* the written word Paul submits to mid-rebuke; the Torah-keeper governed by the book (Acts 23:5).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-thou-shalt-not-speak-evil-of-the-ruler-paul-corrected-by-torah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life* the prophets'' own resurrection hope Paul is tried for (Acts 23:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 19:25 — *I know that my redeemer liveth, and that he shall stand at the latter day upon the earth* the living Redeemer in whom the dust-sleepers'' awaking is sure (Acts 23:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 19:26 — *in my flesh shall I see Elohim (God)* the very flesh raised to see Elohim (God), not a flight from the body (Acts 23:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 26:19 — *Thy dead men shall live … Awake and sing, ye that dwell in dust … the earth shall cast out the dead* the gathering hope the Sadducees deny (Acts 23:6,8).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-the-hope-and-resurrection-of-the-dead-the-tanakh-hope'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 1:5 — *as I was with Mosheh (Moses), so I will be with thee: I will not fail thee, nor forsake thee* the Formed who went with Yehoshua (Joshua) stands by Paul (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:9 — *be not afraid … for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* the charge to Yehoshua (Joshua) now carried to Paul, even unto Rome (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 1:8 — *Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD)* the word to the prophet now the word to Paul before the council (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 1:19 — *they shall fight against thee; but they shall not prevail against thee; for I am with thee … to deliver thee* the forty''s plot cannot break what the Master appointed (Acts 23:11-13).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 41:10 — *Fear thou not; for I am with thee … I will uphold thee with the right hand of my righteousness* the upholding hand that holds the witness up (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Acts 18:9 — *Be not afraid, but speak, and hold not thy peace* the same voice stood by at Corinth; told to speak there, told he will speak at Rome (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=18 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Acts 18:10 — *I am with thee, and no man shall set on thee to hurt thee* the One who shielded him at Corinth shields him from the forty (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Acts 27:23 — *there stood by me this night the angel of Elohim (God), whose I am, and whom I serve* the Master stands by again in the storm at sea (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=27 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Acts 27:24 — *Fear not, Paul; thou must be brought before Cæsar* the Jerusalem promise sealed in the storm; the witness must reach Rome (Acts 23:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a23_lookup sv, _s217_a23_lookup tv
 WHERE t.slug='acts-23-yahuah-stood-by-him-the-master-keeps-and-sends-to-rome'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=27 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'Session 217 — Acts 1-7 cross-references complete.'
