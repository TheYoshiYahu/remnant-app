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
--                 + ACTS 3-5      (fragment minion_acts_03_05.sql).
-- Every target tuple verified verbatim against the parsed editions
-- (scratch_xref_acts/verify_fidelity.py). Idempotent: ON CONFLICT DO NOTHING.
-- Apply (from Yoshi's Mac Terminal):
--   python3 api/apply_migration.py data-schema/migrations/session217_acts_cross_references.sql
-- =====================================================================

\echo 'Session 217 — Acts 1-5 full-library cross-references starting...'
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


COMMIT;
\echo 'Session 217 — Acts 1-5 cross-references complete.'
