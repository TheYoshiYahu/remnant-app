-- =====================================================================
-- Session 139 — Matt 10 extras-tier cross-references (single chapter)
-- =====================================================================
-- Adds Matt 10's extras-tier rows + threads to the cross-reference
-- corpus. Continues the S131 (Matt 1-2), S132 (Matt 3), S133 (Matt 4),
-- S134 (Matt 5), S135 (Matt 6), S137 (Matt 7-8 paired), and S138 (Matt 9)
-- extras-tier coverage onto the missionary-discourse commissioning of
-- the twelve. Single chapter migration — Matt 10 is dense framework
-- ground (commissioning of the twelve with twelve-tribe architecture,
-- load-bearing lost-sheep mission-scope at vv.5-6, persecution-and-
-- protection disclosure at vv.16-23 with the Ruach-of-the-Father
-- speaking through the persecuted at v.20, fear-not-them-which-kill-
-- the-body at v.28, confess-or-deny at vv.32-33, sword-not-peace
-- household-division at vv.34-39, apostolic-representation at vv.40-42).
--
-- Matt 10 reading-target: the gathering-mission's formal commissioning.
-- The twelve are named for the twelve tribes; the mission-scope is
-- locked at the lost sheep of the house of Yashar'el (Israel); the
-- kingdom-substance is to flow freely; the persecution-expectation
-- discloses what is ahead; the perseverance-and-grace-that-can-be-lost
-- frame at v.22 locks the diagnostic; the *till the Son of Adam be come*
-- at v.23 opens the gathering-mission's present-age tense as a STANDING
-- MISSION across centuries until the Daniel 7:13-14 coming-in-glory.
--
-- Eleven Hebrew-library threads track the chapter's framework moves at
-- the restoration-not-innovation register:
--   * The lost-sheep mission-scope at vv.5-6 — three witnesses to the
--     scattered-seed gathering thesis at extras-tier: 2 Esdras (4 Ezra)
--     13's apocalyptic vision of the ten tribes beyond the river coming
--     home at the latter time; Tobit 13-14's confess-among-the-Gentiles
--     and multi-stage gathering-from-scattering architecture; Sonnini's
--     *Acts of Paul* (Acts 29) naming the gospel preached *to the lost
--     sheep of the House of Yashar'el (Israel)* far hence to the isles
--     afar off where the scattered children had escaped at the time of
--     the Assyrian captivity.
--   * The persecution-and-perseverance cluster at vv.16-23, v.28, v.32-33
--     — five witnesses: Sirach 2 on prepare-the-soul-for-temptation /
--     endure / fall-into-the-hands-of-Yahuah-not-of-men; Wisdom of
--     Solomon 3 and 5 on the souls-of-the-righteous-in-Yahuah's-hand-
--     no-torment-touch-them and the vindication-of-the-righteous after
--     death; 4 Maccabees 8-12 (edition numbering; standard 4 Macc 9-16)
--     on the mother-and-seven-sons *for my soul ye cannot reach, not if
--     ye would* and *men dying for Elohim live unto Elohim, as live
--     Abraham, Isaac, and Jacob*; 4 Maccabees 13 (standard 17) on the
--     prize-of-endurance-in-everlasting-life-given-through-endurance;
--     4 Maccabees 6 and 8 (standard 7 and 9) on Eleazar's confession
--     and *Elohim is a hearer also of the speechless* anchoring Matt
--     10:20's Spirit-of-your-Father-which-speaketh-in-you.
--   * The confess-or-deny / names-not-blotted-out architecture at
--     vv.32-33 — 1 Enoch 103's *I have beheld the books of life, and
--     your names are written in the books of life before the Most High*
--     anchoring Red Line #11's names-can-only-be-blotted-out diagnostic.
--   * The sword-not-peace household-division at vv.34-36 — 1 Enoch 99-
--     100's apocalyptic-register naming of the day-of-destruction
--     family-division-pattern that Matt 10:34-36 walks at the kingdom-
--     citizens-hearing-the-Shepherd-divides-the-household register.
--   * The twelve-apostles-with-one-betrayer architecture at vv.1-4 +
--     persecution-of-the-plant at vv.16-22 — Ascension of Isaiah 4:3's
--     *will persecute the plant which the Twelve Apostles of the Beloved
--     have planted. Of the Twelve one will be delivered into his hands.*
--
-- Editions used at S139: Apocrypha KJV 1611 (`apocrypha` — 2 Esdras /
-- 4 Ezra, Tobit, Ecclesiasticus / Sirach, Wisdom of Solomon), 1 Enoch
-- (`enoch`), Pseudepigrapha Charles vol 2 (`pseudepigrapha` —
-- 4 Maccabees), Sonnini's *Acts of Paul* Chapter 29 (`sonnini-acts-29`),
-- Ascension of Isaiah (`ascension-isaiah`). The S139 lookup view adds
-- `sonnini-acts-29` to the S138 set; all other scripture-level extras
-- editions seeded for V1 remain in the view for forward compatibility
-- (Jasher, Apocrypha Charles vol 1, Adam-Eve Conflict, Apocalypse of
-- Abraham, Jubilees) — these are not targeted in S139 because the Matt
-- 10 readings do not surface a framework-bearing connection from those
-- other editions at the rigour the migration requires. Historical-
-- witness editions (Josephus, M.R. James's apocryphal NT, Lightfoot's
-- Apostolic Fathers) remain deferred from V1 cross-refs per the
-- historical-witness one-way rule.
--
-- 4 Maccabees chapter-numbering note: the `pseudepigrapha` edition's
-- 4 Maccabees parses chapter divisions per Charles vol 2's 14-chapter
-- arrangement (the parsed `number` column runs 1-14, with each chapter's
-- internal `title` field naming the standard 4 Macc chapter number it
-- corresponds to — e.g. edition ch_number 11 carries title "Chapter 15",
-- ch_number 12 carries title "Chapter 16"). The seed-data lookups and
-- the reader-facing chapter URLs use the edition's `chapter_number`
-- column (1-14), matching the S138 precedent that referenced 2 Baruch
-- by its edition chapter_number rather than standard chapter numbering.
-- The note prose below cites verses using the edition's chapter_number
-- to keep the database-query-key and the human-readable-citation aligned.
--
-- Eleven PROPOSED threads at extras-tier:
--   1.  `the-ten-tribes-beyond-the-river-in-4-ezra-13`               (sort 249)
--   2.  `confess-among-the-gentiles-and-gathering-in-tobit-13-14`    (sort 250)
--   3.  `the-gospel-to-the-lost-sheep-far-hence-in-sonnini-acts-29`  (sort 251)
--   4.  `prepare-the-soul-for-temptation-in-sirach-2`                (sort 252)
--   5.  `souls-of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5`    (sort 253)
--   6.  `the-mother-and-seven-sons-soul-unreachable-in-4-maccabees`  (sort 254)
--   7.  `prize-of-endurance-in-everlasting-life-in-4-maccabees-13`   (sort 255)
--   8.  `elohim-hears-the-speechless-eleazar-in-4-maccabees`         (sort 256)
--   9.  `names-in-the-books-of-life-not-blotted-out-in-1-enoch-103`  (sort 257)
--   10. `family-division-in-the-day-of-destruction-in-1-enoch`       (sort 258)
--   11. `the-twelve-apostles-and-the-one-delivered-in-ascension-isaiah` (sort 259)
--
-- 27 new cross_references rows, all at tier_required='extras'. Every
-- member-note passes the 12 Red Lines and the 12-point editorial
-- checklist. Hebrew names with internal apostrophes (Yashar'el,
-- Ya'aqov, Yechezk'el, Yo'el, Ya'ir, Sha'ul, etc.) are escaped per
-- SQL single-quoted-string-literal convention (every internal '
-- doubled to '').
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

\echo 'Session 139 — Matt 10 extras-tier cross-references migration starting...'
BEGIN;

-- Verse-lookup temp view. Extends the S138 view to include the
-- `sonnini-acts-29` edition (the framework's restored *Acts of Paul*
-- chapter 29 used at S139 Thread 3 for the lost-sheep mission-scope
-- anchor at Matt 10:5-6).
CREATE TEMP VIEW _s139_verse_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN (
       'canon',
       'enoch',
       'jubilees',
       'jasher',
       'apocrypha',
       'apocrypha-charles-vol1',
       'pseudepigrapha',
       'adam-eve-conflict',
       'apocalypse-of-abraham',
       'ascension-isaiah',
       'sonnini-acts-29'
   );

-- ---------------------------------------------------------------------
-- Insert 27 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- Thread 1: the-ten-tribes-beyond-the-river-in-4-ezra-13
  ('canon', 'matthew', 10, 6, 'apocrypha', '2-esdras', 13, 40,
   '*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land.* 2 Esdras (4 Ezra) 13:40 names the wisdom-stream''s apocalyptic-register identification of the ten tribes carried into Assyrian captivity over the waters into another land. Matt 10:6''s *lost sheep of the house of Yashar''el (Israel)* names the same body — the scattered northern house Yahuah (the LORD) divorced through the Assyrian captivity, the lost sheep the prophets had named and promised the gathering for. The wisdom-stream had identified the same ten-tribes-carried-into-captivity body at the apocalyptic-register; the King at Matt 10:6 sends the twelve to that body.'),
  ('canon', 'matthew', 10, 6, 'apocrypha', '2-esdras', 13, 41,
   '*But they took this counsel among themselves, that they would leave the multitude of the heathen, and go forth into a further country, where never mankind dwelt, that they might there keep their statutes, which they never kept in their own land.* 2 Esdras (4 Ezra) 13:41-42 names the wisdom-stream''s apocalyptic-register narrative of the scattered ten tribes leaving the heathen-multitude and going to a further country to keep the Torah-statutes they had not kept in the land — the post-Assyrian-captivity remnant carrying covenant-identity into the dispersion. Matt 10:6''s mission-scope to the lost sheep of the house of Yashar''el (Israel) is to the same body — the scattered seed who carried covenant-identity into the further-country territories.'),
  ('canon', 'matthew', 10, 23, 'apocrypha', '2-esdras', 13, 47,
   '*The Highest shall stay the springs of the stream again, that they may go through: therefore sawest you the multitude with peace.* 2 Esdras (4 Ezra) 13:47 names the wisdom-stream''s apocalyptic-register architecture of the gathering-of-the-ten-tribes back through the parted-stream at the latter-time arrival of the Messiah-son. Matt 10:23''s *ye shall not have gone over the cities of Yashar''el (Israel), till the Son of Adam be come* opens the gathering-mission''s present-age-tense as the STANDING MISSION across centuries that the wisdom-stream had named as terminating in the latter-time gathering of the scattered tribes home. The mission Yahusha (Jesus) commissions at Matt 10 and the gathering 4 Ezra 13 names are one architecture continuing across the present age until the King returns.'),

  -- Thread 2: confess-among-the-gentiles-and-gathering-in-tobit-13-14
  ('canon', 'matthew', 10, 6, 'apocrypha', 'tobit', 13, 5,
   '*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* Tobit 13:5 names the wisdom-stream''s direct articulation of the scourge-and-mercy-and-gathering architecture: Yahuah (God) scatters for iniquity, has mercy again, gathers from all the nations of the scattering. Matt 10:6''s mission-scope to the lost sheep of the house of Yashar''el (Israel) is the gathering-mission Tobit had named as Yahuah (God)''s future-tense covenant-action. The mercy-substance at Hosea 6:6 (Matt 9:13) is the same mercy-substance gathering the scattered at Matt 10:6.'),
  ('canon', 'matthew', 10, 32, 'apocrypha', 'tobit', 13, 3,
   '*Confess him before the Gentiles, you children of Yashar''el (Israel): for he has scattered us among them. There declare his greatness, and extol him before all the living: for he is our Elohim (God), and he is Yahuah (God) our Father for ever.* Tobit 13:3-4 names the wisdom-stream''s direct instruction: the children of Yashar''el (Israel) scattered among the Gentiles are to CONFESS Yahuah (God) BEFORE THE GENTILES — to declare his greatness in the territories of the scattering. Matt 10:32''s *whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven* walks the same architecture at the kingdom-citizens level: the scattered seed in the dispersion confess the King before the men of the territories where they are scattered; the King confesses them before the Father.'),
  ('canon', 'matthew', 10, 23, 'apocrypha', 'tobit', 14, 5,
   '*And that again Yahuah (God) will have mercy on them, and bring them again into the land, where they shall build a temple, but not like to the first, until the time of that age be fulfilled; and afterward they shall return from all places of their captivity, and build up Yerushalayim (Jerusalem) gloriously.* Tobit 14:5 names the wisdom-stream''s multi-stage gathering-architecture explicitly: a FIRST return-to-the-land for the temple-rebuilding (the post-Babylon return under Zerubavel/Zerubbabel, Ezra, and Nechemyah/Nehemiah), AND THEN a LATTER return *from all places of their captivity* at the fulness-of-the-age. Matt 10:23''s *till the Son of Adam be come* opens the gathering-mission''s present-age-tense as the standing-work until the Son of Adam returns; Tobit 14:5 names the same multi-stage architecture from the wisdom-stream side. The first stage was the partial Yahudah (Judah)-return; the latter is the still-future gathering-from-all-places-of-the-captivity.'),

  -- Thread 3: the-gospel-to-the-lost-sheep-far-hence-in-sonnini-acts-29
  ('canon', 'matthew', 10, 6, 'sonnini-acts-29', 'sonnini-acts-29', 29, 2,
   '*For he had heard in Phoenicia that certain of the children of Yashar''el (Israel), about the time of the Assyrian captivity, had escaped by sea to "the isles afar off," as spoken by the prophet, and called by the Romans, Britain.* Sonnini Acts 29:2 names Paul''s motivation for the Spain-and-Britain journey: the scattered children of Yashar''el (Israel) had fled by sea at the time of the Assyrian captivity to the isles afar off (the prophetic-language of Isaiah 49:1, Jeremiah 31:10). Matt 10:6''s lost sheep of the house of Yashar''el (Israel) names the same body Sonnini Acts 29 has Paul going FAR HENCE to gather — the apostolic-mission carrying the Matt 10 commission to the actual territories of the Assyrian-dispersion remnant. The wisdom-stream of the restored *Acts of Paul* extension confirms the gathering-of-the-scattered-seed thesis the Matthew commission inaugurates.'),
  ('canon', 'matthew', 10, 6, 'sonnini-acts-29', 'sonnini-acts-29', 29, 3,
   '*And Yahuah (Lord) commanded the gospel to be preached far hence to the Gentiles, and to the lost sheep of the House of Yashar''el (Israel).* Sonnini Acts 29:3 is the direct verbal-anchor for Matt 10:6''s mission-scope in the apostolic-extension territory: the same *lost sheep of the House of Yashar''el (Israel)* phrase the King uses at Matt 10:6 (and at Matt 15:24) is the very phrase the restored Sonnini chapter names as Yahuah (the LORD)''s commissioning of Paul''s far-hence mission. The Matt 10:5-6 commission scope and the Sonnini Acts 29:3 commission scope are identical — one to the disciples in the immediate region of Galilee, the other to Paul in the far-hence territories of the dispersion-isles. Both are the same gathering of the same scattered seed.'),
  ('canon', 'matthew', 10, 23, 'sonnini-acts-29', 'sonnini-acts-29', 29, 13,
   '*And it came to pass that certain of the Druids came unto Paul privately, and showed by their rites and ceremonies they were descended from the Yahudim (Jews) which escaped from bondage in the land of Egypt, and the apostle believed these things, and he gave them the kiss of peace.* Sonnini Acts 29:13 names the apostolic-recognition of the scattered-seed lineage in the British territories — the Druids whose rites and ceremonies disclosed Yashar''el-itish (Israel-itish) descent received the kiss of peace from Paul. The Matt 10:23 standing-mission-across-centuries reaches the territories the wisdom-stream had named as the dispersion-destinations; the gathering finds the scattered where they have been driven. Paul''s reception of the Druid-disclosure is the apostolic-mission walking the Matt 10 architecture in the far-hence territories the King had named at Matt 10:23 as still-to-be-traversed.'),

  -- Thread 4: prepare-the-soul-for-temptation-in-sirach-2
  ('canon', 'matthew', 10, 22, 'apocrypha', 'ecclesiasticus', 2, 1,
   '*My son, if you come to serve Yahuah (God), prepare your soul for temptation. Set your heart aright, and constantly endure, and make not haste in time of trouble.* Sirach (Ecclesiasticus) 2:1-2 names the wisdom-stream''s direct architecture of the disciple-preparing-for-trial: prepare-the-soul, set-the-heart-aright, CONSTANTLY ENDURE. Matt 10:22''s *he that endureth to the end shall be saved* walks the same wisdom-stream architecture at the kingdom-citizens level. The endurance is not innovation; the wisdom-stream had been naming the disciple-of-Yahuah (God) as the one-who-constantly-endures-through-trouble for centuries before the King commissions the twelve.'),
  ('canon', 'matthew', 10, 22, 'apocrypha', 'ecclesiasticus', 2, 5,
   '*For gold is tried in the fire, and acceptable men in the furnace of adversity.* Sirach (Ecclesiasticus) 2:5 names the wisdom-stream''s adversity-as-refining-furnace architecture: gold-tried-in-fire is the figure for the testing of the acceptable-disciple in the furnace of adversity. Matt 10:22''s endure-to-the-end is the same architecture: the trial is the testing-furnace; the disciple endures and is shown acceptable. The wisdom-stream has been carrying the diagnostic since Sirach''s composition; the King at Matt 10:22 names the same diagnostic at the gathering-mission-disciples level.'),
  ('canon', 'matthew', 10, 28, 'apocrypha', 'ecclesiasticus', 2, 18,
   '*Saying, We will fall into the hands of Yahuah (God), and not into the hands of men: for as his majesty is, so is his mercy.* Sirach (Ecclesiasticus) 2:18 names the wisdom-stream''s direct fear-redirect architecture: the disciple who fears Yahuah (God) chooses to fall into HIS hands rather than into the hands of men. Matt 10:28''s *fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in gehenna* walks the same architecture at the kingdom-citizens level. The wisdom-stream had named the fear-of-Yahuah-supersedes-fear-of-men disposition; the King at Matt 10:28 names the same disposition with the eschatological-stakes made explicit.'),

  -- Thread 5: souls-of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5
  ('canon', 'matthew', 10, 28, 'apocrypha', 'the-wisdom-of-solomon', 3, 1,
   '*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Wisdom of Solomon 3:1 names the wisdom-stream''s direct articulation of the souls-of-the-righteous-in-Yahuah (God)''s-hand architecture: the souls of the righteous are in Yahuah (God)''s hand; no torment touches them. Matt 10:28''s *fear not them which kill the body, but are not able to kill the soul* walks the same architecture at the kingdom-citizens level — the persecutors can reach the body but cannot reach the soul, because the soul of the righteous is held in the Father''s hand. The wisdom-stream had named the architecture; the King at Matt 10:28 names the operative-fact at the persecution-encounter.'),
  ('canon', 'matthew', 10, 22, 'apocrypha', 'the-wisdom-of-solomon', 3, 5,
   '*And having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them, and found them worthy for himself.* Wisdom of Solomon 3:5 names the wisdom-stream''s direct architecture of the suffering-as-proving-test: Yahuah (God) proves the righteous through chastisement and finds them worthy. Matt 10:22''s endure-to-the-end perseverance-frame walks the same architecture: the persecution-chastisement is the proving-test; the disciple who endures is found worthy at the Father''s recognition. The wisdom-stream''s suffering-as-proving and the King''s endure-to-be-saved name the same diagnostic from two angles.'),
  ('canon', 'matthew', 10, 32, 'apocrypha', 'the-wisdom-of-solomon', 5, 1,
   '*Then shall the righteous man stand in great boldness before the face of such as have afflicted him, and made no account of his labours.* Wisdom of Solomon 5:1 names the wisdom-stream''s direct architecture of the vindication-of-the-righteous at the eschatological-judgment: the righteous man stands in great boldness before the face of those who afflicted him. Matt 10:32''s *whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven* walks the same architecture at the apostolic-mission level: the lived-confession before the persecutors is recognized by the King at the Father''s eschatological-judgment, and the persecutors who afflicted the confessor are themselves confronted at the same judgment. The wisdom-stream had named the vindication-pattern; the King at Matt 10:32 names the operative-confession that leads into it.'),

  -- Thread 6: the-mother-and-seven-sons-soul-unreachable-in-4-maccabees
  ('canon', 'matthew', 10, 28, 'pseudepigrapha', '4-maccabees', 8, 4,
   '*Therefore if ye have any engine of torment, apply it to this body of mine; for my soul ye cannot reach, not if ye would.* 4 Maccabees (edition chapter 8, verses 4-5; standard 4 Macc 9:4-5) names the Hebrew library''s most direct verbal-anchor for Matt 10:28''s *fear not them which kill the body, but are not able to kill the soul.* The third son of the seven, under Antiochus''s torture, names the diagnostic explicitly: the body can be reached by the engine of torment; the soul cannot. The framework reads the Matt 10:28 fear-redirect as the King naming the operative-fact the Hebrew library had already named at the martyrdom-witness. The persecutors reach the body; the soul is in another hand entirely.'),
  ('canon', 'matthew', 10, 28, 'pseudepigrapha', '4-maccabees', 11, 3,
   '*Her seven sons according to the tyrant''s promise, loved rather religion, which saveth unto eternal life according to Elohim (God).* 4 Maccabees (edition chapter 11, verse 3; standard 4 Macc 15:3) names the wisdom-stream''s direct architecture: the seven sons chose religion-which-saveth-unto-eternal-life over the tyrant''s present-life-saving-promise. Matt 10:28''s fear-redirect to the Father who-is-able-to-destroy-both-soul-and-body is the inverse-naming of the same priority: the kingdom-citizens choose the One who holds the eternal-stakes over the persecutors who hold only the present-life-stakes. The wisdom-stream had named the priority at the martyrdom-witness; the King at Matt 10:28 names it at the commissioning.'),
  ('canon', 'matthew', 10, 28, 'pseudepigrapha', '4-maccabees', 12, 25,
   '*They themselves also knowing well that men dying for Elohim (God) live unto Elohim (God), as live Abraham, and Isaac, and Jacob, and all the patriarchs.* 4 Maccabees (edition chapter 12, verse 25; standard 4 Macc 16:25) names the resurrection-architecture explicitly: men dying for Yahuah (God) live unto Yahuah (God), as the patriarchs Avraham (Abraham), Yitschaq (Isaac), Ya''aqov (Jacob), and all the patriarchs live. The framework''s Red Line #11 reading of the patriarchs-sleeping-awaiting-the-first-resurrection (Romans 11:24''s natural-branches-able-to-be-grafted-in-again) is anchored in this wisdom-stream architecture. Matt 10:28''s *not able to kill the soul* names the same operative-fact: the martyr who dies for the King is not extinguished; the patriarchs-sleeping-awaiting-resurrection precedent applies; the soul is held by the Father.'),

  -- Thread 7: prize-of-endurance-in-everlasting-life-in-4-maccabees-13
  ('canon', 'matthew', 10, 22, 'pseudepigrapha', '4-maccabees', 13, 13,
   '*For on that day virtue, proving them through endurance, set before them the prize of victory in incorruption in everlasting life.* 4 Maccabees (edition chapter 13, verse 13; standard 4 Macc 17:13) names the wisdom-stream''s direct architecture of the endurance-prize: virtue proves the martyrs through endurance, and the prize of victory is incorruption in everlasting life. Matt 10:22''s *he that endureth to the end shall be saved* walks the same architecture at the kingdom-citizens level. The endurance is the proving-substance; the prize is the everlasting-life-resurrection at the King''s recognition. The wisdom-stream and the King name the same diagnostic.'),
  ('canon', 'matthew', 10, 22, 'pseudepigrapha', '4-maccabees', 13, 18,
   '*The tyrant himself and his whole council admired their endurance, whereby they now do both stand beside the throne of Elohim (God) and live the blessed age.* 4 Maccabees (edition chapter 13, verse 18; standard 4 Macc 17:18) names the wisdom-stream''s post-martyrdom-architecture explicitly: the endurance of the seven sons led to their standing beside the throne of Yahuah (God) and living the blessed age. The framework reads the verse against the Red Line #11 first-resurrection architecture: the martyrs who endure to the end are among the first-resurrection-firstfruits at the King''s coming. Matt 10:22''s endure-to-the-end and the Hebrews 11:39-40 *they without us should not be made perfect* and the Revelation 20:4-6 first-resurrection-of-the-beheaded all name the same architecture at different angles; 4 Macc 13:18 names it from the wisdom-stream side at the martyrdom-witness.'),

  -- Thread 8: elohim-hears-the-speechless-eleazar-in-4-maccabees
  ('canon', 'matthew', 10, 32, 'pseudepigrapha', '4-maccabees', 6, 19,
   '*But as many as with their whole heart make righteousness their first thought, these alone are able to master the weakness of the flesh, believing that unto Elohim (God) they die not, as our patriarchs, Abraham and Isaac and Jacob, died not, but that they live unto Elohim (God).* 4 Maccabees (edition chapter 6, verses 18-19; standard 4 Macc 7:18-19) names the wisdom-stream''s direct architecture of the disciples-of-righteousness who confess Yahuah (God) in the body — believing that unto Yahuah (God) they die not as the patriarchs died not. The framework reads Eleazar''s lived-confession (the whole of standard 4 Macc 5-7) as the wisdom-stream''s martyrdom-witness anchor for Matt 10:32''s *whosoever therefore shall confess me before men.* The lived-confession-unto-death is the credentialing-confession the King recognizes.'),
  ('canon', 'matthew', 10, 20, 'pseudepigrapha', '4-maccabees', 8, 18,
   '*Even if thou dost remove my organ of speech, Elohim (God) is a hearer also of the speechless.* 4 Maccabees (edition chapter 8, verse 18; standard 4 Macc 9:18) names the wisdom-stream''s direct architecture for Matt 10:20''s *Spirit of your Father which speaketh in you.* The third son under torture names the operative-fact: even with his tongue cut out, Yahuah (God) hears the speechless — the Father''s direct-hearing of the persecuted-disciple does not depend on the disciple''s organ of speech. Matt 10:19-20''s *take no thought how or what ye shall speak: for it shall be given you in that same hour what ye shall speak. For it is not ye that speak, but the Spirit of your Father which speaketh in you* walks the same architecture at the kingdom-citizens persecution-encounter level. The Father''s direct-presence in the persecution-hour does not depend on the disciple''s pre-prepared-words.'),

  -- Thread 9: names-in-the-books-of-life-not-blotted-out-in-1-enoch-103
  ('canon', 'matthew', 10, 32, 'enoch', '1-enoch', 103, 3,
   '*And your spirits have been found worthy of the lot of the righteous, And your names are written in the books of life before the Most High.* 1 Enoch 103:3 names the wisdom-stream''s direct architecture: the names of the righteous are written in the books of life before the Most High. The framework''s Red Line #11 reading of the names-written-before-the-foundation-of-the-world / names-can-only-be-blotted-out (Exodus 32:33; Psalm 69:28; Revelation 3:5) — names are not added after the foundation; they are written before and can be blotted out for unfaithfulness — is anchored at this wisdom-stream witness. Matt 10:32''s confession-credentialing walks the same architecture: the King confesses the lived-confessor before the Father because the confessor''s name was already written; the verbal-confession-without-Torah-walking is the failure-to-bear-fruit that risks blotting-out.'),
  ('canon', 'matthew', 10, 33, 'enoch', '1-enoch', 103, 8,
   '*And their memorial shall be before the Most High, And their name shall not be blotted out.* 1 Enoch 103:8 names the inverse of the blotting-out architecture: the righteous-who-endure have their memorial preserved before the Most High; their name shall not be blotted out. The framework reads Matt 10:33''s *whosoever shall deny me before men, him will I also deny before my Father which is in heaven* against the same Red Line #11 architecture: the denial-under-pressure is the failure-to-endure that risks the blotting-out. The names of the lived-confessors are preserved (1 Enoch 103:8); the names of the deniers are subject to the Matthew 7:23 *depart from me, ye that work iniquity* dismissal-from-the-Father''s-presence. The wisdom-stream had named the architecture; the King at Matt 10:32-33 names the operative-mechanism at the apostolic-mission level.'),

  -- Thread 10: family-division-in-the-day-of-destruction-in-1-enoch
  ('canon', 'matthew', 10, 35, 'enoch', '1-enoch', 99, 5,
   '*And in those days the destitute shall go forth and carry off their children, And they shall abandon them, so that their children shall perish through them: Yea, they shall abandon their children.* 1 Enoch 99:5 names the wisdom-stream''s apocalyptic-register naming of the day-of-destruction family-disintegration: parents abandoning children, children perishing through parents. Matt 10:35-36''s *I am come to set a man at variance against his father, and the daughter against her mother* walks the same household-division-pattern at the kingdom-citizens-hearing-the-Shepherd-divides-the-household register. The wisdom-stream had named the disintegration-of-the-household as the day-of-destruction signature; the King names the kingdom-hearing-of-his-voice as producing the division-line that runs through the household.'),
  ('canon', 'matthew', 10, 36, 'enoch', '1-enoch', 100, 1,
   '*And in those days in one place the fathers together with their sons shall be smitten, And brothers one with another shall fall in death Till the streams flow with their blood.* 1 Enoch 100:1-2 names the wisdom-stream''s apocalyptic-register naming of the family-betrayal-in-the-day-of-destruction architecture: fathers and sons smitten together, brothers falling on brothers. Matt 10:36''s *a man''s foes shall be they of his own household* (citing Micah 7:6) walks the same architecture. The framework reads the seed-war (Genesis 3:15) as operative at the household-level — the kingdom-citizens'' hearing of the Shepherd''s voice creates a division-line the family-relationship cannot insulate from. The wisdom-stream had named the diagnostic at the apocalyptic-register; the King names it at the commissioning-discourse register.'),

  -- Thread 11: the-twelve-apostles-and-the-one-delivered-in-ascension-isaiah
  ('canon', 'matthew', 10, 4, 'ascension-isaiah', 'ascension-isaiah', 4, 3,
   '*Will persecute the plant which the Twelve Apostles of the Beloved have planted. Of the Twelve one will be delivered into his hands.* The Ascension of Isaiah 4:3 (in the Belial-prediction at the chapter''s mid-section) names the wisdom-stream''s prophetic-witness to the twelve-apostles-with-one-betrayer architecture explicitly — the plant the Twelve plant will be persecuted; one of the Twelve will be delivered into the hand of the persecutor. Matt 10:4''s Yahudah (Judah) Iscariot listed-with-betrayal-note and Matt 10:16-22''s persecution-disclosure walk the same architecture at the commissioning-discourse register. The framework reads the Ascension passage as the wisdom-stream''s confirmation that the inner-circle-betrayal and the persecution-of-the-plant are not surprise-developments but architecture-elements named in advance.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s139_verse_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s139_verse_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 11 new extras-tier threads.
-- ---------------------------------------------------------------------

-- Thread 1 (sort 249): the-ten-tribes-beyond-the-river-in-4-ezra-13
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-ten-tribes-beyond-the-river-in-4-ezra-13',
       'The ten tribes beyond the river — 2 Esdras (4 Ezra) 13 on the gathering at the latter time',
       'Matt 10:5-6''s mission-scope to the lost sheep of the house of Yashar''el (Israel) AND Matt 10:23''s *till the Son of Adam be come* standing-mission-tense — read against 2 Esdras (4 Ezra) 13:40-47''s apocalyptic-register vision of the ten tribes carried away by Salmanasar of Assyria, crossing the waters into Arsareth (the further country), keeping the Torah-statutes they had not kept in the land, and at the latter-time coming back through the parted-stream at the Most High''s gathering-arm. Three explicit moves: the identification of the ten tribes as the body the dispersion carried (13:40); the further-country territory where covenant-identity was preserved (13:41-42); the latter-time gathering at the Highest''s parting of the stream (13:47). The mission Yahusha (Jesus) commissions at Matt 10 to the lost sheep is the gathering 4 Ezra named as the wisdom-stream apocalyptic future-tense; the present-age STANDING mission of Matt 10:23 walks toward the wisdom-stream''s named terminus.',
       sv.verse_id, ev.verse_id, 'extras', 249
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 5
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

-- Thread 2 (sort 250): confess-among-the-gentiles-and-gathering-in-tobit-13-14
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'confess-among-the-gentiles-and-gathering-in-tobit-13-14',
       'Confess Yahuah (God) before the Gentiles, and the multi-stage gathering — Tobit 13-14',
       'Matt 10:6''s mission-scope to the lost sheep of the house of Yashar''el (Israel) + Matt 10:23''s standing-mission-until-the-Son-of-Adam-be-come + Matt 10:32''s confess-me-before-men — read against Tobit 13-14''s wisdom-stream architecture. Tobit 13:3 names the explicit instruction: *confess him before the Gentiles, you children of Yashar''el (Israel)* — the scattered seed in the dispersion confessing Yahuah (God) before the men of the territories where they are scattered. Tobit 13:5 names the gathering-from-all-nations-among-whom-he-has-scattered-us future-tense covenant-action. Tobit 14:5 names the multi-stage gathering-architecture: a FIRST return-to-the-land (the post-Babylon partial-return under Zerubavel/Zerubbabel) AND a LATTER return *from all places of their captivity* at the fulness-of-the-age. The framework reads Matt 10''s gathering-commission as the present-age STANDING-MISSION between Tobit''s two stages, with the latter-stage still future at the Son of Adam''s coming. The mercy-substance (Hosea 6:6, Matt 9:13) is the same mercy-substance gathering the scattered at Matt 10:6.',
       sv.verse_id, ev.verse_id, 'extras', 250
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 6
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 32
ON CONFLICT (slug) DO NOTHING;

-- Thread 3 (sort 251): the-gospel-to-the-lost-sheep-far-hence-in-sonnini-acts-29
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-gospel-to-the-lost-sheep-far-hence-in-sonnini-acts-29',
       'The gospel preached far hence to the lost sheep — Sonnini''s Acts of Paul (Acts 29)',
       'Matt 10:5-6''s lost-sheep mission-scope + Matt 10:23''s standing-mission-tense — read against Sonnini''s restored *Acts of Paul* (Acts 29) naming the apostolic-extension of the same scope into the territories of the Assyrian-dispersion. Sonnini Acts 29:2 names Paul''s motivation for the Spain-and-Britain journey: the scattered children of Yashar''el (Israel) escaped by sea to the isles afar off at the time of the Assyrian captivity (the prophetic-language of Isaiah 49:1, Jeremiah 31:10). Sonnini Acts 29:3 names the commissioning explicitly — *Yahuah (Lord) commanded the gospel to be preached far hence to the Gentiles, and to the lost sheep of the House of Yashar''el (Israel)* — the identical phrase the King uses at Matt 10:6 and Matt 15:24, now operative in the far-hence territories. Sonnini Acts 29:13 names the apostolic-recognition of the Druid-disclosure of Yashar''el-itish (Israel-itish) descent in the British territories; Paul gives the kiss of peace because the gathering finds the scattered where they have been driven. The Matt 10 commission and the Sonnini Acts 29 commission are one commission across different territorial-reaches of the same dispersion.',
       sv.verse_id, ev.verse_id, 'extras', 251
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 5
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

-- Thread 4 (sort 252): prepare-the-soul-for-temptation-in-sirach-2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'prepare-the-soul-for-temptation-in-sirach-2',
       'Prepare the soul for temptation; fall into the hands of Yahuah, not of men — Sirach 2',
       'Matt 10:22''s *he that endureth to the end shall be saved* perseverance-frame + Matt 10:28''s *rather fear him which is able to destroy both soul and body in gehenna* fear-redirect — read against Sirach (Ecclesiasticus) 2''s wisdom-stream direct articulation of the same architecture. Sirach 2:1-2 names the disciple-preparation: *prepare your soul for temptation. Set your heart aright, and constantly endure.* Sirach 2:5 names the proving-furnace: *gold is tried in the fire, and acceptable men in the furnace of adversity.* Sirach 2:18 names the fear-redirect: *we will fall into the hands of Yahuah (God), and not into the hands of men: for as his majesty is, so is his mercy.* The wisdom-stream had been naming the disciple''s endurance-through-temptation and the fear-of-Yahuah-supersedes-fear-of-men architecture for centuries before the King commissioned the twelve; Matt 10:22 + 10:28 walk the same architecture at the kingdom-citizens commissioning-discourse register.',
       sv.verse_id, ev.verse_id, 'extras', 252
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 22
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 28
ON CONFLICT (slug) DO NOTHING;

-- Thread 5 (sort 253): souls-of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'souls-of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5',
       'The souls of the righteous in Yahuah''s hand, and the vindication-of-the-righteous — Wisdom of Solomon 3 and 5',
       'Matt 10:28''s *not able to kill the soul* + Matt 10:22''s endure-to-the-end + Matt 10:32''s confess-me-before-men — read against Wisdom of Solomon 3 and 5''s wisdom-stream articulation of the souls-of-the-righteous-in-Yahuah (God)''s-hand-no-torment and the vindication-of-the-righteous after death. Wisdom 3:1 names the operative-fact: *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Wisdom 3:5 names the proving-substance: *Yahuah (God) proved them, and found them worthy for himself.* Wisdom 5:1 names the eschatological-vindication: *then shall the righteous man stand in great boldness before the face of such as have afflicted him.* The wisdom-stream had named the architecture; Matt 10:28 names the operative-fact at the persecution-encounter (the soul is unreachable to the persecutor); Matt 10:22 names the operative-proving (the endurance is the proving-substance); Matt 10:32 names the operative-vindication (the King confesses the confessor at the Father''s eschatological-judgment, where the persecuted stands in boldness).',
       sv.verse_id, ev.verse_id, 'extras', 253
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 22
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 32
ON CONFLICT (slug) DO NOTHING;

-- Thread 6 (sort 254): the-mother-and-seven-sons-soul-unreachable-in-4-maccabees
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-mother-and-seven-sons-soul-unreachable-in-4-maccabees',
       'The mother and seven sons — for my soul ye cannot reach; men dying for Elohim live unto Elohim, as Abraham, Isaac, and Jacob (4 Maccabees)',
       'Matt 10:28''s *fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in gehenna* — read against the Hebrew library''s strongest verbal-anchor in 4 Maccabees: the mother-and-seven-sons martyrdom under Antiochus. Three witnesses at the wisdom-stream level: 4 Maccabees (edition chapter 8, verse 4 = standard 4 Macc 9:4) — *apply it to this body of mine; for my soul ye cannot reach, not if ye would* — the third son names the diagnostic explicitly. 4 Maccabees (edition chapter 11, verse 3 = standard 4 Macc 15:3) — *her seven sons ... loved rather religion, which saveth unto eternal life* — the priority of eternal-stakes-religion over the tyrant''s present-life-promise. 4 Maccabees (edition chapter 12, verse 25 = standard 4 Macc 16:25) — *men dying for Elohim (God) live unto Elohim (God), as live Abraham, and Isaac, and Jacob, and all the patriarchs* — the resurrection-architecture lined up with the Red Line #11 patriarchs-sleeping-awaiting-first-resurrection / natural-branches-able-to-be-grafted-in-again framework. The wisdom-stream had named the operative-fact at the martyrdom-witness; the King at Matt 10:28 names the same operative-fact at the commissioning-discourse, with the eschatological-stakes made explicit through the gehenna-language.',
       sv.verse_id, ev.verse_id, 'extras', 254
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 28
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 28
ON CONFLICT (slug) DO NOTHING;

-- Thread 7 (sort 255): prize-of-endurance-in-everlasting-life-in-4-maccabees-13
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'prize-of-endurance-in-everlasting-life-in-4-maccabees-13',
       'The prize of endurance in incorruption in everlasting life — 4 Maccabees 13 (standard 17) and the throne of Elohim',
       'Matt 10:22''s *he that endureth to the end shall be saved* — read against 4 Maccabees''s direct articulation of the endurance-prize architecture. 4 Maccabees (edition chapter 13, verse 13 = standard 4 Macc 17:13) names the proving-substance: *virtue, proving them through endurance, set before them the prize of victory in incorruption in everlasting life.* 4 Maccabees (edition chapter 13, verse 18 = standard 4 Macc 17:18) names the post-martyrdom-station: *the endurance, whereby they now do both stand beside the throne of Elohim (God) and live the blessed age.* The framework reads the verses against the Red Line #11 first-resurrection architecture — the martyrs who endure to the end are among the first-resurrection-firstfruits at the King''s coming (Revelation 20:4-6''s beheaded-for-the-witness; Hebrews 11:39-40''s *they without us should not be made perfect*). Matt 10:22''s endure-to-end perseverance-frame walks the same wisdom-stream architecture at the kingdom-citizens commissioning-discourse register.',
       sv.verse_id, ev.verse_id, 'extras', 255
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 22
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 22
ON CONFLICT (slug) DO NOTHING;

-- Thread 8 (sort 256): elohim-hears-the-speechless-eleazar-in-4-maccabees
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'elohim-hears-the-speechless-eleazar-in-4-maccabees',
       'Elohim is a hearer of the speechless; the disciple of righteousness believing they die not — 4 Maccabees (Eleazar)',
       'Matt 10:20''s *it is not ye that speak, but the Spirit of your Father which speaketh in you* + Matt 10:32''s confess-me-before-men — read against 4 Maccabees''s wisdom-stream architecture in Eleazar''s confession and the third son''s torture-witness. 4 Maccabees (edition chapter 6, verse 19 = standard 4 Macc 7:19) names the disciples-of-righteousness who confess Yahuah (God) believing unto Yahuah (God) they die not as the patriarchs Avraham (Abraham), Yitschaq (Isaac), and Ya''aqov (Jacob) died not. 4 Maccabees (edition chapter 8, verse 18 = standard 4 Macc 9:18) names the operative-fact for Matt 10:20: *even if thou dost remove my organ of speech, Elohim (God) is a hearer also of the speechless.* The framework reads Matt 10:19-20''s Ruach-supplied-words-in-the-persecution-encounter architecture as the same wisdom-stream diagnostic — the Father''s direct-hearing of the persecuted-disciple does not depend on the disciple''s organ of speech; the Father supplies the words when the kingdom-citizen''s flesh-capacity reaches its limit.',
       sv.verse_id, ev.verse_id, 'extras', 256
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 20
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 32
ON CONFLICT (slug) DO NOTHING;

-- Thread 9 (sort 257): names-in-the-books-of-life-not-blotted-out-in-1-enoch-103
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'names-in-the-books-of-life-not-blotted-out-in-1-enoch-103',
       'Names in the books of life not blotted out — 1 Enoch 103 and the confess-or-deny architecture',
       'Matt 10:32-33''s confession-and-denial-mirror-pattern — read against 1 Enoch 103''s wisdom-stream articulation of the books-of-life-and-the-name-not-blotted-out architecture. 1 Enoch 103:3 names the operative-fact: *your spirits have been found worthy of the lot of the righteous, And your names are written in the books of life before the Most High.* 1 Enoch 103:8 names the preservation: *their memorial shall be before the Most High, And their name shall not be blotted out.* The framework''s Red Line #11 reading of the names-written-before-the-foundation-of-the-world / names-can-only-be-blotted-out (Exodus 32:33; Psalm 69:28; Revelation 3:5) — names are not added after the foundation but are written before and can be blotted out for unfaithfulness — is anchored at this wisdom-stream witness. Matt 10:32-33''s confess-or-deny walks the same architecture: the lived-confessor is recognized by the King because the name is preserved; the denier under pressure risks the blotting-out the King has named at Matthew 7:23''s *depart from me, ye that work iniquity* dismissal-pattern.',
       sv.verse_id, ev.verse_id, 'extras', 257
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 32
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 33
ON CONFLICT (slug) DO NOTHING;

-- Thread 10 (sort 258): family-division-in-the-day-of-destruction-in-1-enoch
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'family-division-in-the-day-of-destruction-in-1-enoch',
       'Family-division in the day of destruction — 1 Enoch 99-100 and the seed-war at family-level',
       'Matt 10:34-36''s sword-not-peace household-division saying (citing Micah 7:6) — read against 1 Enoch 99-100''s wisdom-stream apocalyptic-register naming of the household-disintegration in the day of destruction. 1 Enoch 99:5 names parents-abandoning-children-perishing-through-them. 1 Enoch 100:1-2 names fathers-and-sons-smitten-together and brothers-falling-on-brothers-in-death. The framework reads the seed-war (Genesis 3:15) as operative at the household-level — the kingdom-citizens'' hearing of the Shepherd''s voice creates a division-line the family-relationship cannot insulate from. The wisdom-stream had named the household-disintegration as the apocalyptic-day-of-destruction signature; the King at Matt 10:34-36 names the kingdom-hearing-of-his-voice as producing the division-line that runs through the household in the present age. Both witnesses name one diagnostic at the household-level from two angles: the apocalyptic-final-disintegration and the present-age-hearing-of-the-Shepherd that prefigures it.',
       sv.verse_id, ev.verse_id, 'extras', 258
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 34
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

-- Thread 11 (sort 259): the-twelve-apostles-and-the-one-delivered-in-ascension-isaiah
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-twelve-apostles-and-the-one-delivered-in-ascension-isaiah',
       'The Twelve Apostles, the plant persecuted, the one delivered — Ascension of Isaiah 4:3',
       'Matt 10:1-4''s naming of the twelve apostles with Yahudah (Judah) Iscariot listed-with-betrayal-note + Matt 10:16-22''s persecution-disclosure to the twelve — read against the Ascension of Isaiah 4:3 prophecy in the Belial-prediction passage of the chapter''s mid-section. *Will persecute the plant which the Twelve Apostles of the Beloved have planted. Of the Twelve one will be delivered into his hands.* Two architecture-elements named at the wisdom-stream level in advance: the persecution-of-the-plant (the kingdom-substance the twelve plant in the gathering-mission) and the inner-circle-betrayal (one of the Twelve delivered into the persecutor''s hand). The framework reads the Ascension passage as the wisdom-stream''s confirmation that the architecture of Matt 10:4 and Matt 10:16-22 is not surprise-development but named-in-advance prophecy of the Belial-pattern operating against the apostolic-mission.',
       sv.verse_id, ev.verse_id, 'extras', 259
  FROM _s139_verse_lookup sv, _s139_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 4
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 10 AND ev.verse_number = 22
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads (27 thread-members).
-- ---------------------------------------------------------------------

-- Thread 1: the-ten-tribes-beyond-the-river-in-4-ezra-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '2 Esdras (4 Ezra) 13:40 — *those are the ten tribes, which were carried away prisoners ... whom Salmanasar the king of Assyria led away captive.* The wisdom-stream identifies the Assyrian-captivity ten tribes as the body the dispersion carried; Matt 10:6''s lost sheep of the house of Yashar''el (Israel) names the same body.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-ten-tribes-beyond-the-river-in-4-ezra-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 40
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '2 Esdras (4 Ezra) 13:41 — *they would leave the multitude of the heathen, and go forth into a further country ... that they might there keep their statutes.* The post-Assyrian-captivity remnant carried covenant-identity into the dispersion-territories; Matt 10:6''s mission-scope is to the same body in those territories.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-ten-tribes-beyond-the-river-in-4-ezra-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 41
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '2 Esdras (4 Ezra) 13:47 — *the Highest shall stay the springs of the stream again, that they may go through.* The latter-time gathering-of-the-ten-tribes through the parted-stream architecture; Matt 10:23''s *till the Son of Adam be come* names the present-age standing-mission walking toward the wisdom-stream''s named terminus.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-ten-tribes-beyond-the-river-in-4-ezra-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 23
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 47
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: confess-among-the-gentiles-and-gathering-in-tobit-13-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Tobit 13:5 — *he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations.* The wisdom-stream''s scourge-mercy-gathering architecture; the same gathering-mission Matt 10:6 commissions.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'confess-among-the-gentiles-and-gathering-in-tobit-13-14'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 13 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Tobit 13:3 — *confess him before the Gentiles, you children of Yashar''el (Israel): for he has scattered us among them.* The wisdom-stream''s direct instruction; Matt 10:32''s *whosoever therefore shall confess me before men* walks the same architecture at the kingdom-citizens level.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'confess-among-the-gentiles-and-gathering-in-tobit-13-14'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 32
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 13 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Tobit 14:5 — *they shall return from all places of their captivity, and build up Yerushalayim (Jerusalem) gloriously.* The multi-stage gathering-architecture: FIRST post-Babylon return, THEN latter-time return from all places of the captivity. Matt 10:23''s standing-mission is the present-age work between the two stages.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'confess-among-the-gentiles-and-gathering-in-tobit-13-14'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 23
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 14 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the-gospel-to-the-lost-sheep-far-hence-in-sonnini-acts-29
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sonnini Acts 29:2 — *certain of the children of Yashar''el (Israel), about the time of the Assyrian captivity, had escaped by sea to "the isles afar off."* Paul''s motivation for the Spain-and-Britain journey; the apostolic-mission carrying the Matt 10 commission to the actual territories of the Assyrian-dispersion.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-gospel-to-the-lost-sheep-far-hence-in-sonnini-acts-29'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 6
   AND tv.edition_slug = 'sonnini-acts-29' AND tv.book_slug = 'sonnini-acts-29' AND tv.chapter_number = 29 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sonnini Acts 29:3 — *Yahuah (Lord) commanded the gospel to be preached far hence to the Gentiles, and to the lost sheep of the House of Yashar''el (Israel).* The identical phrase the King uses at Matt 10:6 and Matt 15:24, now operative in the far-hence territories; one commission across different territorial-reaches of the same dispersion.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-gospel-to-the-lost-sheep-far-hence-in-sonnini-acts-29'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 6
   AND tv.edition_slug = 'sonnini-acts-29' AND tv.book_slug = 'sonnini-acts-29' AND tv.chapter_number = 29 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sonnini Acts 29:13 — *certain of the Druids ... showed by their rites and ceremonies they were descended from the Yahudim (Jews) which escaped from bondage in the land of Egypt.* The apostolic-recognition of the scattered-seed lineage in British territories; Matt 10:23''s standing-mission reaches the dispersion-destinations where the gathering finds the scattered.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-gospel-to-the-lost-sheep-far-hence-in-sonnini-acts-29'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 23
   AND tv.edition_slug = 'sonnini-acts-29' AND tv.book_slug = 'sonnini-acts-29' AND tv.chapter_number = 29 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: prepare-the-soul-for-temptation-in-sirach-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 2:1 — *if you come to serve Yahuah (God), prepare your soul for temptation. Set your heart aright, and constantly endure.* The wisdom-stream''s direct disciple-preparation-for-trial architecture; Matt 10:22''s endure-to-the-end walks the same.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'prepare-the-soul-for-temptation-in-sirach-2'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 22
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 2 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 2:5 — *gold is tried in the fire, and acceptable men in the furnace of adversity.* The wisdom-stream''s adversity-as-refining-furnace; the trial-as-proving the King at Matt 10:22 names at the apostolic-mission persecution-encounter.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'prepare-the-soul-for-temptation-in-sirach-2'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 22
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 2 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 2:18 — *we will fall into the hands of Yahuah (God), and not into the hands of men.* The wisdom-stream''s fear-redirect: choose to fall into Yahuah''s hands rather than men''s. Matt 10:28''s fear-redirect walks the same architecture with the eschatological-stakes made explicit.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'prepare-the-soul-for-temptation-in-sirach-2'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 28
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 2 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: souls-of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Wisdom of Solomon 3:1 — *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The wisdom-stream''s direct operative-fact for Matt 10:28''s *not able to kill the soul* — the persecutors reach the body but cannot reach the soul that is held in the Father''s hand.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'souls-of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 28
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 3 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Wisdom of Solomon 3:5 — *having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them, and found them worthy.* The wisdom-stream''s suffering-as-proving architecture; Matt 10:22''s endure-to-the-end perseverance-frame names the same diagnostic from the kingdom-citizens side.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'souls-of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 22
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 3 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Wisdom of Solomon 5:1 — *then shall the righteous man stand in great boldness before the face of such as have afflicted him.* The wisdom-stream''s eschatological-vindication architecture; Matt 10:32''s confess-me-before-men leads into the same Father-judgment-recognition register where the persecuted stands in boldness before the persecutors.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'souls-of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 32
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 5 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: the-mother-and-seven-sons-soul-unreachable-in-4-maccabees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '4 Maccabees (edition ch 8, v.4 = std 4 Macc 9:4) — *apply it to this body of mine; for my soul ye cannot reach, not if ye would.* The Hebrew library''s most direct verbal-anchor for Matt 10:28''s *not able to kill the soul* — the third son under torture names the diagnostic explicitly at the martyrdom-witness.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-mother-and-seven-sons-soul-unreachable-in-4-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 28
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '4-maccabees' AND tv.chapter_number = 8 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '4 Maccabees (edition ch 11, v.3 = std 4 Macc 15:3) — *her seven sons ... loved rather religion, which saveth unto eternal life according to Elohim (God).* The priority of eternal-stakes-religion over the tyrant''s present-life-promise; Matt 10:28''s fear-redirect names the same priority at the commissioning.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-mother-and-seven-sons-soul-unreachable-in-4-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 28
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '4-maccabees' AND tv.chapter_number = 11 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '4 Maccabees (edition ch 12, v.25 = std 4 Macc 16:25) — *men dying for Elohim (God) live unto Elohim (God), as live Abraham, and Isaac, and Jacob, and all the patriarchs.* The resurrection-architecture; the Red Line #11 patriarchs-sleeping-awaiting-the-first-resurrection precedent at the wisdom-stream witness.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-mother-and-seven-sons-soul-unreachable-in-4-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 28
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '4-maccabees' AND tv.chapter_number = 12 AND tv.verse_number = 25
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: prize-of-endurance-in-everlasting-life-in-4-maccabees-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '4 Maccabees (edition ch 13, v.13 = std 4 Macc 17:13) — *virtue, proving them through endurance, set before them the prize of victory in incorruption in everlasting life.* The wisdom-stream''s endurance-prize architecture; Matt 10:22''s endure-to-the-end is the same diagnostic at the kingdom-citizens commissioning.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'prize-of-endurance-in-everlasting-life-in-4-maccabees-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 22
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '4-maccabees' AND tv.chapter_number = 13 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '4 Maccabees (edition ch 13, v.18 = std 4 Macc 17:18) — *the endurance, whereby they now do both stand beside the throne of Elohim (God) and live the blessed age.* The wisdom-stream''s post-martyrdom station; the Red Line #11 first-resurrection-firstfruits architecture at the wisdom-stream witness.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'prize-of-endurance-in-everlasting-life-in-4-maccabees-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 22
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '4-maccabees' AND tv.chapter_number = 13 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 8: elohim-hears-the-speechless-eleazar-in-4-maccabees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '4 Maccabees (edition ch 6, v.19 = std 4 Macc 7:19) — *believing that unto Elohim (God) they die not, as our patriarchs, Abraham and Isaac and Jacob, died not, but that they live unto Elohim (God).* The wisdom-stream''s lived-confession-of-the-disciple-of-righteousness; Matt 10:32''s confess-me-before-men walks the same architecture.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'elohim-hears-the-speechless-eleazar-in-4-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 32
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '4-maccabees' AND tv.chapter_number = 6 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '4 Maccabees (edition ch 8, v.18 = std 4 Macc 9:18) — *even if thou dost remove my organ of speech, Elohim (God) is a hearer also of the speechless.* The wisdom-stream''s direct operative-fact for Matt 10:20''s *Spirit of your Father which speaketh in you* — the Father''s direct-hearing of the persecuted-disciple does not depend on the disciple''s organ of speech.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'elohim-hears-the-speechless-eleazar-in-4-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 20
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = '4-maccabees' AND tv.chapter_number = 8 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 9: names-in-the-books-of-life-not-blotted-out-in-1-enoch-103
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 103:3 — *your spirits have been found worthy of the lot of the righteous, And your names are written in the books of life before the Most High.* The wisdom-stream''s books-of-life witness; the Red Line #11 names-written-before-the-foundation architecture anchor.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'names-in-the-books-of-life-not-blotted-out-in-1-enoch-103'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 32
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 103 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 103:8 — *their memorial shall be before the Most High, And their name shall not be blotted out.* The wisdom-stream''s preservation-of-the-name witness; Matt 10:33''s denial-warning names the inverse — the denier risks the blotting-out the Matt 7:23 dismissal-pattern enacts.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'names-in-the-books-of-life-not-blotted-out-in-1-enoch-103'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 33
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 103 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 10: family-division-in-the-day-of-destruction-in-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 99:5 — *in those days the destitute shall go forth and carry off their children, And they shall abandon them.* The wisdom-stream''s apocalyptic-day-of-destruction household-disintegration; Matt 10:35''s *I am come to set a man at variance against his father* walks the same household-division-pattern at the kingdom-hearing-of-his-voice register.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'family-division-in-the-day-of-destruction-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 35
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 99 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 100:1 — *the fathers together with their sons shall be smitten, And brothers one with another shall fall in death.* The wisdom-stream''s explicit family-betrayal-in-the-day-of-destruction; Matt 10:36''s *a man''s foes shall be they of his own household* walks the same diagnostic in the present-age kingdom-hearing register.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'family-division-in-the-day-of-destruction-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 36
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 100 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 11: the-twelve-apostles-and-the-one-delivered-in-ascension-isaiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Ascension of Isaiah 4:3 — *will persecute the plant which the Twelve Apostles of the Beloved have planted. Of the Twelve one will be delivered into his hands.* Two architecture-elements named in advance at the wisdom-stream level: persecution-of-the-plant + inner-circle-betrayal. The Matt 10:4 Yahudah (Judah) Iscariot listing-with-betrayal-note and Matt 10:16-22 persecution-disclosure walk the same architecture at the commissioning-discourse register.'
  FROM cross_reference_threads t, cross_references x, _s139_verse_lookup sv, _s139_verse_lookup tv
 WHERE t.slug = 'the-twelve-apostles-and-the-one-delivered-in-ascension-isaiah'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 10 AND sv.verse_number = 4
   AND tv.edition_slug = 'ascension-isaiah' AND tv.book_slug = 'ascension-isaiah' AND tv.chapter_number = 4 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

\echo 'Session 139 — Matt 10 extras-tier cross-references migration complete.'
\echo '  New rows: 27 cross_references at tier_required=extras.'
\echo '  New threads: 11 (sort_order 249-259).'
\echo '  New thread members: 27.'
\echo '  Cumulative Matt 1-10 extras: 71 threads, 205 rows, 206 members.'

COMMIT;
