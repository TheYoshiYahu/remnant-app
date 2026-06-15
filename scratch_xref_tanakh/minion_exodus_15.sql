-- ----- fragment: minion_exodus_15.sql (Exodus 15) -----
-- Chapter: Exodus 15 — the Song of the Sea
-- Tag: ex15   Session: s305   Sort band base: 29350 (step 3)
-- Bind AROUND pre-existing live thread id 441 at 15:6 (right-hand-glorious-in-power / Formed-as-agency-of-Formless) — NOT duplicated, no new thread anchored at 15:6.
--
-- Exodus 15 coverage:
--   v.1   NT:     Revelation 15:3 (song of Moses + song of the Lamb), Rev 15:4
--         Extras: Jasher 81:43-44 (Then sang Moses... the same hymn-line), Jubilees 48 (Red-Sea retelling)
--         Tanakh: — (the hymn itself is the source)
--   v.2   NT:     none warranted (sung forward laterally in Tanakh)
--         Extras: none warranted
--         Tanakh: Isaiah 12:2, Isaiah 12:5, Psalm 118:14 (the same strength-song-salvation line re-sung)
--   v.3   NT:     bound into the song-of-Moses thread (Rev 15:3 "thy works... thou King of saints")
--         Extras: none warranted
--         Tanakh: — (Yahuah is his name; held in thread 1)
--   v.4-5,10  NT: none warranted
--         Extras: Wisdom 19:7-8 (dry land / way without impediment), Jubilees 48:14 (cast into the depths of the abyss)
--         Tanakh: — (held with the crossing thread)
--   v.11  NT:     none warranted
--         Extras: none warranted
--         Tanakh: Micah 7:18, Micah 7:19 (Who is a Elohim like unto thee / cast sins into the depths of the sea)
--   v.13  NT:     none warranted
--         Extras: none warranted
--         Tanakh: Psalm 78:52, Psalm 78:54 (guided his people / brought to the border of his sanctuary)
--   v.16-17 NT:   Revelation 11:15 (he shall reign for ever and ever)
--         Extras: none warranted
--         Tanakh: Isaiah 11:11, Isaiah 11:12 (second-time ingathering, two-house), Psalm 78:54, Psalm 78:68 (mount Zion sanctuary)
--   v.18  NT:     Revelation 11:15 (the everlasting reign)
--         Extras: none warranted
--         Tanakh: held with the reign/plant thread
--   v.19  NT:     none warranted
--         Extras: Wisdom 10:18, Wisdom 10:19, Wisdom 19:7; Jubilees 48:12, Jubilees 48:14; Jasher 81:43
--         Tanakh: — (the crossing recapped; held with extras thread)
--   v.20-21 NT:   bound into song thread (Miriam's refrain = the song re-sung)
--         Extras: Jasher 81:44 (all Israel sang in concert, I will sing to Yahuah)
--         Tanakh: —
--   v.22-27 NT:   none warranted (Marah/Elim narrative; statute-and-ordinance / Yahuah-Rapha — left for a future Marah thread, not this Song-anchored set)
--         Extras: Jasher 81:45 (statutes and judgments at Marah) — recorded, not threaded here
--         Tanakh: none warranted in this Song-of-the-Sea band
--
-- Threads (6):
--   1. exodus-15-i-will-sing-unto-yahuah-the-song-of-moses-and-the-lamb   [NT + Extras]  29350
--        v.1,3,21 -> Rev 15:3, Rev 15:4, Jasher 81:43, Jasher 81:44
--   2. exodus-15-yahuah-is-my-strength-and-song-and-my-salvation          [Tanakh/canon] 29353
--        v.2 -> Isaiah 12:2, Isaiah 12:5, Psalm 118:14
--   3. exodus-15-who-is-like-unto-thee-glorious-in-holiness               [Tanakh/canon] 29356
--        v.11 -> Micah 7:18, Micah 7:19
--   4. exodus-15-thou-hast-redeemed-and-guided-them-unto-thy-holy-habitation [Tanakh/canon] 29359
--        v.13 -> Psalm 78:52, Psalm 78:54
--   5. exodus-15-plant-them-in-the-mountain-yahuah-shall-reign-for-ever   [NT + Tanakh]  29362
--        v.17,18 -> Rev 11:15, Isaiah 11:11, Isaiah 11:12, Psalm 78:68
--   6. exodus-15-the-red-sea-crossing-wisdom-led-them-through            [Extras]       29365
--        v.19,4,10 -> Wisdom 10:18, Wisdom 10:19, Wisdom 19:7, Jubilees 48:14
--
-- Framework notes: song-of-the-Sea = the FIRST song of the redeemed, re-sung at the consummation
-- by the victors over the beast (Rev 15) in the OLD-exodus words = the new exodus. Yahuah a man of
-- war / glorious in holiness = the Formed Son who led Yashar'el (Israel) and bears the Name. Plant-them-
-- in-the-mountain = the two-house ingathering (Isa 11 second-time recovery) to the sanctuary not made
-- with hands; Yahuah shall reign for ever = Rev 11:15. Extras (Wisdom/Jubilees/Jasher) retell the crossing.

CREATE TEMP VIEW _s305_ex15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the song of Moses and the song of the Lamb
    ('canon','exodus',15,1,'canon','revelation',15,3,'free',
     E'*And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways, thou King of saints.* (Revelation 15:3) The victors who overcame the beast sing the SAME song Moses sang at the sea — *I will sing unto Yahuah (LORD), for he hath triumphed gloriously* (Exodus 15:1). The new exodus is sung in the old-exodus words: one deliverance, one Deliverer, the Formed Son who drowned the horse and his rider now bringing his redeemed up out of the last Egypt.'),
    ('canon','exodus',15,1,'canon','revelation',15,4,'free',
     E'*Who shall not fear thee, O Yahuah (Lord), and glorify thy name? for thou only art holy: for all nations shall come and worship before thee; for thy judgments are made manifest.* (Revelation 15:4) The sea-song answered at the end of the age — *the horse and his rider hath he thrown into the sea* (Exodus 15:1) becomes the judgment made manifest before which all nations bow. The triumph hymn was always a prophecy.'),
    ('canon','exodus',15,1,'jasher','jasher',81,43,'extras',
     E'*Then sang Moses and the children of Israel this song to Yahuah (the Lord), on the day when Yahuah (the Lord) caused the Egyptians to fall before them.* (Jasher 81:43) The restored chronicle records the same moment as *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD)* (Exodus 15:1) — the redeemed broke into song the very hour the sea closed over Pharaoh''s host.'),
    ('canon','exodus',15,21,'jasher','jasher',81,44,'extras',
     E'*And all Israel sang in concert, saying, I will sing to Yahuah (the Lord) for He is greatly exalted, the horse and his rider has he cast into the sea; behold it is written in the book of the law of Elohim.* (Jasher 81:44) Miriam''s refrain — *Sing ye to Yahuah (LORD), for he hath triumphed gloriously; the horse and his rider hath he thrown into the sea* (Exodus 15:21) — is the whole congregation singing as one, the women answering the men antiphonally; Jasher names it as already written in the Torah.'),
    -- Thread 2: Yahuah is my strength and song and my salvation
    ('canon','exodus',15,2,'canon','isaiah',12,2,'free',
     E'*Behold, Elohim (God) is my salvation; I will trust, and not be afraid: for Yahuah (LORD) JEHOVAH is my strength and my song; he also is become my salvation.* (Isaiah 12:2) Isaiah sets the redeemed of the LATTER ingathering singing the very line Moses sang at the sea — *Yahuah (LORD) is my strength and song, and he is become my salvation* (Exodus 15:2). The second exodus opens its mouth in the words of the first.'),
    ('canon','exodus',15,2,'canon','isaiah',12,5,'free',
     E'*Sing unto Yahuah (LORD); for he hath done excellent things: this is known in all the earth.* (Isaiah 12:5) The command to sing in that day echoes Moses'' opening — *I will sing unto Yahuah (LORD), for he hath triumphed gloriously* (Exodus 15:1-2) — binding the wells-of-salvation song to the sea-song as one continuous praise of the redeemed.'),
    ('canon','exodus',15,2,'canon','psalms',118,14,'free',
     E'*Yahuah (LORD) is my strength and song, and is become my salvation.* (Psalm 118:14) The Hallel takes Moses'' line up word-for-word — *Yahuah (LORD) is my strength and song, and he is become my salvation* (Exodus 15:2) — the festival psalm of the temple making the sea-triumph the perpetual confession of Yashar''el (Israel).'),
    -- Thread 3: Who is like unto thee, glorious in holiness
    ('canon','exodus',15,11,'canon','micah',7,18,'free',
     E'*Who is a Elohim (God) like unto thee, that pardoneth iniquity, and passeth by the transgression of the remnant of his heritage? he retaineth not his anger for ever, because he delighteth in mercy.* (Micah 7:18) Micah answers the sea-song''s question — *Who is like unto thee, O Yahuah (LORD), among the gods? who is like thee, glorious in holiness* (Exodus 15:11) — turning the incomparable Warrior into the incomparable Pardoner of his scattered remnant.'),
    ('canon','exodus',15,11,'canon','micah',7,19,'free',
     E'*He will turn again, he will have compassion upon us; he will subdue our iniquities; and thou wilt cast all their sins into the depths of the sea.* (Micah 7:19) The same hand that *didst blow with thy wind, the sea covered them* and they *sank as lead in the mighty waters* (Exodus 15:10-11) drowns Yashar''el''s (Israel''s) sins in that same depth — the Red-Sea judgment becomes the figure of forgiveness.'),
    -- Thread 4: redeemed and guided unto thy holy habitation
    ('canon','exodus',15,13,'canon','psalms',78,52,'free',
     E'*But made his own people to go forth like sheep, and guided them in the wilderness like a flock.* (Psalm 78:52) Asaph retells the sea-song line — *Thou in thy mercy hast led forth the people which thou hast redeemed: thou hast guided them in thy strength* (Exodus 15:13) — the Formed Son as the Shepherd leading the redeemed flock out of Egypt.'),
    ('canon','exodus',15,13,'canon','psalms',78,54,'free',
     E'*And he brought them to the border of his sanctuary, even to this mountain, which his right hand had purchased.* (Psalm 78:54) The destination of the leading is named — *unto thy holy habitation* (Exodus 15:13) — the right hand that dashed the enemy now PURCHASES a people and plants them at the mountain-sanctuary.'),
    -- Thread 5: plant them in the mountain / Yahuah shall reign for ever
    ('canon','exodus',15,18,'canon','revelation',11,15,'free',
     E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever.* (Revelation 11:15) The sea-song''s closing acclamation — *Yahuah (LORD) shall reign for ever and ever* (Exodus 15:18) — is the seventh-trumpet shout: the reign declared at the Red Sea is the reign consummated at the end.'),
    ('canon','exodus',15,17,'canon','isaiah',11,11,'free',
     E'*And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt...* (Isaiah 11:11) The planting *in the mountain of thine inheritance* (Exodus 15:17) is enacted a SECOND time — the first exodus from Egypt prefiguring the latter-day recovery of the scattered remnant of both houses.'),
    ('canon','exodus',15,17,'canon','isaiah',11,12,'free',
     E'*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12) *Thou shalt bring them in, and plant them in the mountain of thine inheritance* (Exodus 15:17) is the two-house ingathering — the outcasts of Yashar''el (Israel) and the dispersed of Yahudah (Judah) planted together in the one sanctuary.'),
    ('canon','exodus',15,17,'canon','psalms',78,68,'free',
     E'*But chose the tribe of Yahudah (Judah), the mount Zion which he loved.* (Psalm 78:68) The mountain Moses sang of — *the Sanctuary, O Yahuah (Lord), which thy hands have established* (Exodus 15:17) — is identified as mount Zion which Yahuah chose and built his sanctuary like high palaces, the hands-established dwelling.'),
    -- Thread 6: the Red Sea crossing, Wisdom led them through (extras)
    ('canon','exodus',15,19,'apocrypha','the-wisdom-of-solomon',10,18,'extras',
     E'*Brought them through the Red sea, and led them through much water:* (Wisdom of Solomon 10:18) Wisdom retells the crossing Moses sang of — *the children of Yashar''el (Israel) went on dry land in the midst of the sea* (Exodus 15:19) — naming the same Wisdom (the Formed Son, the first-formed agency of the Father) as the One who led them through.'),
    ('canon','exodus',15,19,'apocrypha','the-wisdom-of-solomon',10,19,'extras',
     E'*But she drowned their enemies, and cast them up out of the bottom of the deep.* (Wisdom of Solomon 10:19) The sea-song''s judgment — *Yahuah (LORD) brought again the waters of the sea upon them* (Exodus 15:19) and *they sank into the bottom as a stone* (Exodus 15:5) — is recounted: the enemies drowned and cast up out of the deep.'),
    ('canon','exodus',15,19,'apocrypha','the-wisdom-of-solomon',19,7,'extras',
     E'*As namely, a cloud shadowing the camp; and where water stood before, dry land appeared; and out of the Red sea a way without impediment; and out of the violent stream a green field:* (Wisdom of Solomon 19:7) The marvel Moses sang — *the children of Yashar''el (Israel) went on dry land in the midst of the sea* (Exodus 15:19) — described as the very elements re-fashioned: dry land where water stood, a way without impediment out of the Red sea.'),
    ('canon','exodus',15,4,'jubilees','jubilees',48,14,'extras',
     E'*And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel)...* (Jubilees 48:14) Jubilees retells *Pharaoh''s chariots and his host hath he cast into the sea: his chosen captains also are drowned in the Red sea* (Exodus 15:4) — the pursuers cast into the depths of the abyss in just recompense for drowning Yashar''el''s (Israel''s) children in the river.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-15-i-will-sing-unto-yahuah-the-song-of-moses-and-the-lamb',
       E'I Will Sing unto Yahuah — the Song of Moses and the Song of the Lamb',
       E'*Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD)... I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea... Yahuah (LORD) is a man of war: Yahuah (LORD) is his name* (Exodus 15:1-3). This is the FIRST song of the redeemed — sung the hour the sea closed over Pharaoh, *the horse and his rider hath he thrown into the sea* (15:1), and answered antiphonally by the women: *And Miriam answered them, Sing ye to Yahuah (LORD), for he hath triumphed gloriously* (15:21).\n\nIt is sung again at the end of the age. *And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways, thou King of saints* (Revelation 15:3) — the victors over the beast, standing on the sea of glass, singing the OLD-exodus words for the NEW exodus. *Who shall not fear thee, O Yahuah (Lord), and glorify thy name? ... for all nations shall come and worship before thee; for thy judgments are made manifest* (Revelation 15:4). The man of war who bears the Name (15:3) is the Formed Son who led Yashar''el (Israel) through the sea and will lead his redeemed up out of the last Egypt.\n\nThe restored chronicle records the same hour: *Then sang Moses and the children of Israel this song to Yahuah (the Lord), on the day when Yahuah (the Lord) caused the Egyptians to fall before them* (Jasher 81:43), and *all Israel sang in concert, saying, I will sing to Yahuah (the Lord) for He is greatly exalted, the horse and his rider has he cast into the sea; behold it is written in the book of the law of Elohim* (Jasher 81:44).',
       sv.verse_id, ev.verse_id, 'extras', 29350
  FROM _s305_ex15_lookup sv, _s305_ex15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=15 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-15-yahuah-is-my-strength-and-song-and-my-salvation',
       E'Yahuah Is My Strength and Song, and He Is Become My Salvation',
       E'*Yahuah (LORD) is my strength and song, and he is become my salvation: he is my Elohim (God), and I will prepare him an habitation; my father''s Elohim (God), and I will exalt him* (Exodus 15:2). This single line of the sea-song became the perpetual confession of the redeemed, taken up verbatim by prophet and psalmist.\n\nIsaiah sets the latter-day ingathering singing it: *Behold, Elohim (God) is my salvation; I will trust, and not be afraid: for Yahuah (LORD) JEHOVAH is my strength and my song; he also is become my salvation* (Isaiah 12:2), and commands, *Sing unto Yahuah (LORD); for he hath done excellent things: this is known in all the earth* (Isaiah 12:5). The Hallel of the temple takes it up word-for-word: *Yahuah (LORD) is my strength and song, and is become my salvation* (Psalm 118:14). The first exodus and the last are sung in one breath — the same strength, the same song, the same salvation.',
       sv.verse_id, ev.verse_id, 'free', 29353
  FROM _s305_ex15_lookup sv, _s305_ex15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-15-who-is-like-unto-thee-glorious-in-holiness',
       E'Who Is Like unto Thee, O Yahuah — Glorious in Holiness',
       E'*Who is like unto thee, O Yahuah (LORD), among the gods? who is like thee, glorious in holiness, fearful in praises, doing wonders?* (Exodus 15:11). The sea-song asks the question the whole Tanakh answers: Yahuah is incomparable — among the gods of Egypt who were judged, there is none like him.\n\nMicah hears the same question and turns it from the Warrior to the Pardoner of his scattered remnant: *Who is a Elohim (God) like unto thee, that pardoneth iniquity, and passeth by the transgression of the remnant of his heritage? he retaineth not his anger for ever, because he delighteth in mercy* (Micah 7:18). And the hand that drowned Pharaoh''s host — *they sank as lead in the mighty waters* (Exodus 15:10) — drowns Yashar''el''s (Israel''s) own sins in that same depth: *He will turn again, he will have compassion upon us; he will subdue our iniquities; and thou wilt cast all their sins into the depths of the sea* (Micah 7:19). The Red-Sea judgment becomes the very figure of forgiveness for the two-house remnant.',
       sv.verse_id, ev.verse_id, 'free', 29356
  FROM _s305_ex15_lookup sv, _s305_ex15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=15 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-15-thou-hast-redeemed-and-guided-them-unto-thy-holy-habitation',
       E'Thou Hast Redeemed and Guided Them unto Thy Holy Habitation',
       E'*Thou in thy mercy hast led forth the people which thou hast redeemed: thou hast guided them in thy strength unto thy holy habitation* (Exodus 15:13). The Formed Son who threw the horse and his rider into the sea now leads the redeemed flock — not abandoning them at the water''s edge, but guiding them toward the sanctuary.\n\nAsaph retells it: *But made his own people to go forth like sheep, and guided them in the wilderness like a flock* (Psalm 78:52) — the Shepherd leading the redeemed out of Egypt. And the destination is named: *And he brought them to the border of his sanctuary, even to this mountain, which his right hand had purchased* (Psalm 78:54). The right hand that *dashed in pieces the enemy* (Exodus 15:6) is the same right hand that PURCHASES a people and plants them at the mountain-sanctuary — redemption and inheritance in one motion.',
       sv.verse_id, ev.verse_id, 'free', 29359
  FROM _s305_ex15_lookup sv, _s305_ex15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=15 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-15-plant-them-in-the-mountain-yahuah-shall-reign-for-ever',
       E'Plant Them in the Mountain — Yahuah Shall Reign for Ever and Ever',
       E'*Thou shalt bring them in, and plant them in the mountain of thine inheritance, in the place, O Yahuah (LORD), which thou hast made for thee to dwell in, in the Sanctuary, O Yahuah (Lord), which thy hands have established. Yahuah (LORD) shall reign for ever and ever* (Exodus 15:17-18). The sea-song ends looking past the wilderness to the sanctuary and the everlasting reign.\n\nThe planting is the two-house ingathering, enacted a SECOND time: *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt* (Isaiah 11:11), to *assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The mountain is identified: *But chose the tribe of Yahudah (Judah), the mount Zion which he loved* (Psalm 78:68) — the hands-established sanctuary.\n\nAnd the closing acclamation — *Yahuah (LORD) shall reign for ever and ever* (15:18) — is the seventh-trumpet shout: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The reign declared at the Red Sea is the reign consummated at the end of the age.',
       sv.verse_id, ev.verse_id, 'free', 29362
  FROM _s305_ex15_lookup sv, _s305_ex15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=15 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- Thread 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-15-the-red-sea-crossing-wisdom-led-them-through',
       E'The Red Sea Crossing — Wisdom Led Them Through on Dry Land',
       E'*For the horse of Pharaoh went in with his chariots and with his horsemen into the sea, and Yahuah (LORD) brought again the waters of the sea upon them; but the children of Yashar''el (Israel) went on dry land in the midst of the sea* (Exodus 15:19). The restored library retells the crossing the sea-song celebrates, naming the agency behind it.\n\nThe Wisdom of Solomon attributes it to Wisdom herself — the first-formed expression of the Father, the Formed Son: *Brought them through the Red sea, and led them through much water: But she drowned their enemies, and cast them up out of the bottom of the deep* (Wisdom of Solomon 10:18-19). The very elements were re-fashioned for the passage: *where water stood before, dry land appeared; and out of the Red sea a way without impediment; and out of the violent stream a green field* (Wisdom of Solomon 19:7). And Jubilees recounts the just recompense — *Pharaoh''s chariots and his host hath he cast into the sea* (Exodus 15:4) — *Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel)* (Jubilees 48:14), measure for measure against those who had drowned Yashar''el''s (Israel''s) children in the river.',
       sv.verse_id, ev.verse_id, 'extras', 29365
  FROM _s305_ex15_lookup sv, _s305_ex15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=15 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- Members: Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.n, m.member_note
  FROM (VALUES
    (15,1,'canon','revelation',15,3,1,E'Revelation 15:3 — the victors over the beast sing *the song of Moses... and the song of the Lamb*; the old-exodus words for the new exodus.'),
    (15,1,'canon','revelation',15,4,2,E'Revelation 15:4 — *all nations shall come and worship... for thy judgments are made manifest*; the sea-triumph answered as end-time judgment.'),
    (15,1,'jasher','jasher',81,43,3,E'Jasher 81:43 — *Then sang Moses and the children of Israel this song to Yahuah*, the same hour the Egyptians fell.'),
    (15,21,'jasher','jasher',81,44,4,E'Jasher 81:44 — *all Israel sang in concert... I will sing to Yahuah*; Miriam''s refrain as the whole congregation answering.')
  ) AS m(src_v_x,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,n,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-15-i-will-sing-unto-yahuah-the-song-of-moses-and-the-lamb'
  JOIN _s305_ex15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=m.src_v
  JOIN _s305_ex15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.n, m.member_note
  FROM (VALUES
    (15,2,'canon','isaiah',12,2,1,E'Isaiah 12:2 — *Yahuah JEHOVAH is my strength and my song; he also is become my salvation*; the latter ingathering re-singing the sea-line.'),
    (15,2,'canon','isaiah',12,5,2,E'Isaiah 12:5 — *Sing unto Yahuah; for he hath done excellent things*; the command to sing echoing Moses'' opening.'),
    (15,2,'canon','psalms',118,14,3,E'Psalm 118:14 — *Yahuah is my strength and song, and is become my salvation*; the Hallel taking the line up word-for-word.')
  ) AS m(src_v_x,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,n,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-15-yahuah-is-my-strength-and-song-and-my-salvation'
  JOIN _s305_ex15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=m.src_v
  JOIN _s305_ex15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.n, m.member_note
  FROM (VALUES
    (15,11,'canon','micah',7,18,1,E'Micah 7:18 — *Who is a Elohim like unto thee, that pardoneth iniquity*; the incomparable Warrior as the incomparable Pardoner.'),
    (15,11,'canon','micah',7,19,2,E'Micah 7:19 — *thou wilt cast all their sins into the depths of the sea*; the Red-Sea judgment as the figure of forgiveness.')
  ) AS m(src_v_x,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,n,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-15-who-is-like-unto-thee-glorious-in-holiness'
  JOIN _s305_ex15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=m.src_v
  JOIN _s305_ex15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.n, m.member_note
  FROM (VALUES
    (15,13,'canon','psalms',78,52,1,E'Psalm 78:52 — *guided them in the wilderness like a flock*; the Formed Son as Shepherd of the redeemed.'),
    (15,13,'canon','psalms',78,54,2,E'Psalm 78:54 — *brought them to the border of his sanctuary... which his right hand had purchased*; redemption ending in inheritance.')
  ) AS m(src_v_x,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,n,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-15-thou-hast-redeemed-and-guided-them-unto-thy-holy-habitation'
  JOIN _s305_ex15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=m.src_v
  JOIN _s305_ex15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.n, m.member_note
  FROM (VALUES
    (15,18,'canon','revelation',11,15,1,E'Revelation 11:15 — *he shall reign for ever and ever*; the seventh-trumpet shout consummating the sea-song''s reign.'),
    (15,17,'canon','isaiah',11,11,2,E'Isaiah 11:11 — *the second time to recover the remnant of his people*; the planting enacted again in the latter day.'),
    (15,17,'canon','isaiah',11,12,3,E'Isaiah 11:12 — *the outcasts of Yashar''el... the dispersed of Yahudah*; the two-house ingathering planted in one sanctuary.'),
    (15,17,'canon','psalms',78,68,4,E'Psalm 78:68 — *the mount Zion which he loved*; the hands-established sanctuary identified as Zion.')
  ) AS m(src_v_x,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,n,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-15-plant-them-in-the-mountain-yahuah-shall-reign-for-ever'
  JOIN _s305_ex15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=m.src_v
  JOIN _s305_ex15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.n, m.member_note
  FROM (VALUES
    (15,19,'apocrypha','the-wisdom-of-solomon',10,18,1,E'Wisdom of Solomon 10:18 — *Brought them through the Red sea, and led them through much water*; Wisdom (the Formed Son) as the One who led them.'),
    (15,19,'apocrypha','the-wisdom-of-solomon',10,19,2,E'Wisdom of Solomon 10:19 — *she drowned their enemies, and cast them up out of the bottom of the deep*; the enemies sunk as a stone.'),
    (15,19,'apocrypha','the-wisdom-of-solomon',19,7,3,E'Wisdom of Solomon 19:7 — *out of the Red sea a way without impediment*; the elements re-fashioned for the dry-land passage.'),
    (15,4,'jubilees','jubilees',48,14,4,E'Jubilees 48:14 — *cast them into the midst of the sea, into the depths of the abyss*; measure-for-measure recompense for drowning Israel''s children.')
  ) AS m(src_v_x,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,n,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-15-the-red-sea-crossing-wisdom-led-them-through'
  JOIN _s305_ex15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=15 AND sv.verse_number=m.src_v
  JOIN _s305_ex15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
