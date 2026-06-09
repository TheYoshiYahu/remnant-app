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
