-- ----- fragment: minion_revelation_04.sql (S224 Revelation 4) -----
-- =====================================================================
-- S224 minion — REVELATION 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 4 (11 verses) — THE THRONE IN HEAVEN. The throne-chariot vision of
--   Ezekiel 1 / 10 re-spoken, the seraphim *Holy holy holy* of Isaiah 6, the sea of glass of
--   Exodus 24, the Maker worshipped of Genesis 1 / Nehemiah 9.
-- Tag: rv04 (temp view _s224_rv04_lookup).
-- Sort band: floor 9075, step 3 (9075, 9078, 9081, 9084, 9087, 9090 used; under 9100).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (CHRISTOLOGY WATCHPOINT):
-- The One on the throne in chapter 4 is *him that liveth for ever and ever* (4:9-10) — the FATHER,
-- the formless Most High shown in vision-form on the throne-chariot of Ezekiel. The Lamb does NOT
-- appear until chapter 5, where he is distinguished from the throne-sitter (5:6-7, *he came and took
-- the book out of the right hand of him that sat upon the throne*). The two are NOT collapsed here:
-- the throne-sitter is the Father; the Formed Son comes forward in ch 5. The four living creatures
-- and the *Holy, holy, holy* are the cherubim/seraphim of Ezekiel 1 and Isaiah 6, the same throne
-- the prophets saw — Revelation never says *it is written*; it is woven entirely out of the Tanakh
-- and the Hebrew library. Read every figure inside the consummation-of-the-covenant frame: the same
-- Yahuah (LORD), the same throne, the same worship the prophets beheld, now opened to the seer.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1   the open door, *Come up hither* — the seer caught up to the throne
--         Tanakh: none warranted (carried into the throne thread at v.2)
--         Extras: 1 Enoch 14:3 (Enoch carried off in a whirlwind into the ends of heaven) — woven in prose of thread 9075
--         NT: none warranted
--   v.2-3 a throne set in heaven, and one sat on it; like jasper and sardine, a rainbow round about
--         Tanakh: Ezekiel 1:26 (the likeness of a throne, the appearance of a man above upon it),
--                 Ezekiel 1:28 (the bow in the cloud, the glory of Yahuah), Ezekiel 10:1 (the sapphire throne)
--         Extras: 1 Enoch 14:15 (the throne of Yahuah, of stibium, the top of sapphire),
--                 Apocalypse of Abraham 18:9 (the chariot with fiery wheels, the throne covered with fire)
--         NT: none warranted (the throne-sitter is the Father; the Lamb is ch 5)
--   v.4   four and twenty elders, white raiment, crowns of gold
--         Tanakh: none warranted (the enthroned council; carried in prose)
--         Extras: 1 Enoch 40:1 (thousands of thousands standing before Yahuah of Spirits) — thread 9087
--         NT: none warranted
--   v.5   seven lamps of fire before the throne, lightnings and thunderings
--         Tanakh: Exodus 19:16 (thunders and lightnings on Sinai) — woven into the throne thread prose
--         Extras: none warranted   NT: none warranted (curated; the menorah/seven-Spirits carried lightly)
--   v.6a  a sea of glass like crystal before the throne
--         Tanakh: Exodus 24:10 (the paved work of sapphire, the body of heaven in clearness),
--                 Ezekiel 1:22 (the firmament as the colour of the terrible crystal over their heads)
--         Extras: none warranted   NT: none warranted
--   v.6-8 four beasts full of eyes; like a lion, calf, man, eagle; six wings; resting not
--         Tanakh: Ezekiel 1:5-6 (four living creatures, four faces), Ezekiel 1:10 (face of man, lion,
--                 ox, eagle), Ezekiel 1:18 (the rings full of eyes), Ezekiel 10:12 (full of eyes round about),
--                 Ezekiel 10:14 (cherub, man, lion, eagle)
--         Extras: Apocalypse of Abraham 18:3 (four fiery living creatures under the throne),
--                 18:4 (lion, man, ox, eagle, six wings)
--         NT: none warranted
--   v.8   Holy, holy, holy, Yahuah Elohim Almighty, which was, and is, and is to come
--         Tanakh: Isaiah 6:2 (the seraphim, six wings), Isaiah 6:3 (Holy, holy, holy, Yahuah Tseva'ot)
--         Extras: 1 Enoch 39:12 (the four presences uttering praises before Yahuah of glory),
--                 1 Enoch 39:13 (the first voice blesses Yahuah of Spirits for ever and ever)
--         NT: none warranted
--   v.9-10 the elders fall down, worship him that liveth for ever and ever, cast their crowns
--         Tanakh: Nehemiah 9:6 (the host of heaven worshippeth thee) — carried in thread 9087 / 9090
--         Extras: 1 Enoch 40:1 (the myriads standing before the throne)
--         NT: none warranted
--   v.11  Thou hast created all things, and for thy pleasure they are and were created
--         Tanakh: Genesis 1:1 (in the beginning Elohim created), Nehemiah 9:6 (thou hast made heaven
--                 and earth and the host of heaven, and thou preservest them all)
--         Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9075 revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1     (Tanakh + Extras)
--   9078 revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1  (Tanakh + Extras)
--   9081 revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6                    (Tanakh + Extras)
--   9084 revelation-4-the-sea-of-glass-before-the-throne-exodus-24                     (Tanakh)
--   9087 revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne   (Tanakh + Extras)
--   9090 revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1
  ('canon', 'revelation', 4, 2, 'canon', 'ezekiel', 1, 26, 'free', E'*And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* (Ezekiel 1:26). This is the throne John is caught up to behold: *and, behold, a throne was set in heaven, and one sat on the throne* (Revelation 4:2). Ezekiel saw it first by the river of Chebar — *the likeness of a throne... and upon the likeness of the throne... the appearance of a man above upon it* — and the seer of the Apocalypse is brought into the same throne-room. The One on the throne here is *him that liveth for ever and ever* (Revelation 4:9), the Father shown in vision-form; the Formed Son comes forward only in the chapter that follows.'),
  ('canon', 'revelation', 4, 3, 'canon', 'ezekiel', 1, 28, 'free', E'*As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* (Ezekiel 1:28). The rainbow round the throne is no new sight — Ezekiel saw *the appearance of the bow that is in the cloud* encircling *the likeness of the glory of Yahuah (LORD)*. So John writes, *and there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3). The same encircling bow, the same glory; the seer beholds what the prophet beheld, the throne of the living Elohim (God) crowned with the bow of the covenant.'),
  ('canon', 'revelation', 4, 3, 'canon', 'ezekiel', 10, 1, 'free', E'*Then I looked, and, behold, in the firmament that was above the head of the cherubims there appeared over them as it were a sapphire stone, as the appearance of the likeness of a throne.* (Ezekiel 10:1). Ezekiel saw the throne again over the cherubim — *as it were a sapphire stone, as the appearance of the likeness of a throne.* It is the throne of Revelation 4, *and he that sat was to look upon like a jasper and a sardine stone* (Revelation 4:3): the same throne above the living creatures, gleaming like precious stone, that the prophet saw mounted over the cherubim above the firmament.'),
  ('canon', 'revelation', 4, 3, 'enoch', '1-enoch', 14, 15, 'extras', E'*But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* (1 Enoch 14:15). Enoch, carried up in a chariot of fire into the ends of heaven, saw *the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* — the same sapphire-gleaming throne Ezekiel saw and John now beholds. *And he that sat was to look upon like a jasper and a sardine stone* (Revelation 4:3): the Hebrew library beheld the throne of precious stone reaching to heaven, the throne of the Most High, before ever the Apocalypse opened its door in heaven.'),
  ('canon', 'revelation', 4, 2, 'apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'extras', E'*And as I stood alone and looked, I saw behind the living creatures a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne, which I saw, and this was covered with fire, and fire encircled it round about, and lo, an indescribable fire environed a fiery host.* (Apocalypse of Abraham 18:9). Abraham too was carried up and saw the throne-chariot — *a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne... covered with fire.* It is the throne John sees set in heaven, *and one sat on the throne* (Revelation 4:2), with the lightnings proceeding out of it (Revelation 4:5). The same fiery throne-chariot of Ezekiel runs through the restored library: the seers of Yashar''el (Israel) beheld one throne, the throne of the living Elohim (God).'),
  -- thread: revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1
  ('canon', 'revelation', 4, 6, 'canon', 'ezekiel', 1, 5, 'free', E'*Also out of the midst thereof came the likeness of four living creatures. And this was their appearance; they had the likeness of a man.* (Ezekiel 1:5). John''s *four beasts full of eyes before and behind* (Revelation 4:6) are Ezekiel''s *four living creatures* — the cherubim that bear the throne. The seer of the Apocalypse beholds the same four that Ezekiel saw come *out of the midst* of the fire by the river of Chebar; the throne-room of Revelation 4 is the throne-chariot of Ezekiel 1, the same living creatures round about the same throne.'),
  ('canon', 'revelation', 4, 7, 'canon', 'ezekiel', 1, 10, 'free', E'*As for the likeness of their faces, they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle.* (Ezekiel 1:10). Here are the four faces John names one by one: *the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:7). The lion, the man, the ox (the calf), the eagle — the very four faces of Ezekiel''s living creatures, the cherubim of the throne. The Apocalypse distributes among the four what Ezekiel gathered into each; the same fourfold face beholds the throne in both.'),
  ('canon', 'revelation', 4, 8, 'canon', 'ezekiel', 1, 18, 'free', E'*As for their rings, they were so high that they were dreadful; and their rings were full of eyes round about them four.* (Ezekiel 1:18). The eyes that fill John''s living creatures — *they were full of eyes within* (Revelation 4:8), *full of eyes before and behind* (Revelation 4:6) — are the eyes Ezekiel saw, *full of eyes round about them four.* Nothing of the throne-bearers escapes their seeing; the cherubim are all eyes, watching every way, the unsleeping watchers of the throne in both the prophet''s vision and the seer''s.'),
  ('canon', 'revelation', 4, 7, 'canon', 'ezekiel', 10, 14, 'free', E'*And every one had four faces: the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle.* (Ezekiel 10:14). When Ezekiel saw the living creatures a second time he named them outright — *I knew that they were the cherubims* (Ezekiel 10:20) — and gave the same four faces: cherub, man, lion, eagle. John''s four beasts, *like a lion... like a calf... a face as a man... like a flying eagle* (Revelation 4:7), are these cherubim; the four-faced throne-bearers of the prophet are the four living creatures of the Apocalypse.'),
  ('canon', 'revelation', 4, 6, 'apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'extras', E'*And as the fire raised itself up, ascending into the height, I saw under the fire a throne of fire, and, round about it, all-seeing ones, reciting the song; and under the throne four fiery living creatures singing, and their appearance was one, each one of them with four faces.* (Apocalypse of Abraham 18:3). The restored library sets the same four beneath the same throne: *under the throne four fiery living creatures singing... each one of them with four faces,* surrounded by *all-seeing ones.* So John sees *in the midst of the throne, and round about the throne... four beasts full of eyes before and behind* (Revelation 4:6). The all-seeing throne-bearers of Abraham''s vision are John''s eye-filled living creatures, the cherubim of the one throne.'),
  ('canon', 'revelation', 4, 8, 'apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'extras', E'*And such was the appearance of their countenances, of a lion, of a man, of an ox, of an eagle: four heads were upon their bodies, so that the four creatures had sixteen faces; and each had six wings from their shoulders, and their sides, and their loins.* (Apocalypse of Abraham 18:4). The Hebrew library names the four faces and the six wings together — *of a lion, of a man, of an ox, of an eagle... and each had six wings.* John beholds exactly this: the four faces *like a lion... like a calf... a face as a man... like a flying eagle* (Revelation 4:7), and *the four beasts had each of them six wings about him; and they were full of eyes within* (Revelation 4:8). The same lion-man-ox-eagle, the same six wings; one throne-vision held across the restored library.'),
  -- thread: revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6
  ('canon', 'revelation', 4, 8, 'canon', 'isaiah', 6, 3, 'free', E'*And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* (Isaiah 6:3). This is the cry the four beasts take up day and night: *Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). Isaiah heard the seraphim cry it about the throne *high and lifted up;* John hears the living creatures cry it about the same throne. The thrice-holy of the prophet is the thrice-holy of the seer — one unceasing worship of the One who fills the whole earth with his glory.'),
  ('canon', 'revelation', 4, 8, 'canon', 'isaiah', 6, 2, 'free', E'*Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* (Isaiah 6:2). The six wings of John''s living creatures are the six wings of Isaiah''s seraphim — *each one had six wings* about the throne. *And the four beasts had each of them six wings about him* (Revelation 4:8). The burning ones who stood above the throne and cried *Holy, holy, holy* are of one order with the four beasts who *rest not day and night* crying the same; the seer sees the seraphim-cherubim worship Isaiah saw.'),
  ('canon', 'revelation', 4, 8, 'enoch', '1-enoch', 39, 12, 'extras', E'*And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory.* (1 Enoch 39:12). Enoch too saw four about the throne of glory and heard their unceasing praise — *the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits* (1 Enoch 39:11), *as they uttered praises before Yahuah (God) of glory.* So the *four beasts... rest not day and night, saying, Holy, holy, holy* (Revelation 4:8). The restored library beheld the same fourfold worship before the same throne, the ceaseless praise of the Most High.'),
  ('canon', 'revelation', 4, 8, 'enoch', '1-enoch', 39, 13, 'extras', E'*And the first voice blesses Yahuah (God) of Spirits for ever and ever.* (1 Enoch 39:13). The praise Enoch heard rises *for ever and ever* — the very note John''s creatures sound, who *give glory and honour and thanks to him that sat on the throne, who liveth for ever and ever* (Revelation 4:9). The blessing of Yahuah (God) of Spirits *for ever and ever* in the Hebrew library and the worship of *him that liveth for ever and ever* in the Apocalypse are one everlasting song before one everlasting throne.'),
  -- thread: revelation-4-the-sea-of-glass-before-the-throne-exodus-24
  ('canon', 'revelation', 4, 6, 'canon', 'exodus', 24, 10, 'free', E'*And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness.* (Exodus 24:10). When Moses and the seventy elders went up, they saw beneath the feet of the Elohim (God) of Yashar''el (Israel) *a paved work of a sapphire stone... as it were the body of heaven in his clearness* — a floor like clear sky before the throne. John sees the same crystalline expanse: *and before the throne there was a sea of glass like unto crystal* (Revelation 4:6). The pavement under the feet of Elohim (God) at Sinai is the sea of glass before the throne in heaven; the elders of Yashar''el (Israel) beheld what the seer beholds.'),
  ('canon', 'revelation', 4, 6, 'canon', 'ezekiel', 1, 22, 'free', E'*And the likeness of the firmament upon the heads of the living creature was as the colour of the terrible crystal, stretched forth over their heads above.* (Ezekiel 1:22). Above the cherubim Ezekiel saw a firmament *as the colour of the terrible crystal* — a shining crystal expanse beneath the throne. John names the same: *a sea of glass like unto crystal* (Revelation 4:6) before the throne, with *the four beasts* in the midst. The crystal firmament over the living creatures in Ezekiel and the crystal sea before the throne in Revelation are the same clear expanse, the floor of the heavenly throne-room.'),
  -- thread: revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne
  ('canon', 'revelation', 4, 10, 'enoch', '1-enoch', 40, 1, 'extras', E'*And after that I saw thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits.* (1 Enoch 40:1). Around the throne Enoch saw a countless host — *thousands of thousands and myriads of myriads... standing before Yahuah (God) of Spirits.* John sees the four and twenty elders among that worshipping host: *the four and twenty elders fall down before him that sat on the throne, and worship him that liveth for ever and ever, and cast their crowns before the throne* (Revelation 4:10). The enthroned council that casts down its crowns belongs to the same numberless worship the Hebrew library beheld before the throne of glory.'),
  ('canon', 'revelation', 4, 9, 'canon', 'nehemiah', 9, 6, 'free', E'*Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* (Nehemiah 9:6). The Levites confessed that *the host of heaven worshippeth thee* — and this is the worship John sees: *when those beasts give glory and honour and thanks to him that sat on the throne, who liveth for ever and ever* (Revelation 4:9). The host that worships the Maker in Nehemiah''s prayer is the host that gives glory before the throne in the Apocalypse; the living creatures and the elders are that worshipping host of heaven.'),
  -- thread: revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9
  ('canon', 'revelation', 4, 11, 'canon', 'genesis', 1, 1, 'free', E'*In the beginning Elohim (God) created the heaven and the earth.* (Genesis 1:1). The ground of all the worship in this chapter is the first verse of the Word: *In the beginning Elohim (God) created the heaven and the earth.* So the elders cast their crowns and cry, *Thou art worthy, O Yahuah (Lord), to receive glory and honour and power: for thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11). He is worthy because he is the Maker; the throne is the throne of the Creator, and the heaven and earth that he made render him his glory.'),
  ('canon', 'revelation', 4, 11, 'canon', 'nehemiah', 9, 6, 'free', E'*Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* (Nehemiah 9:6). Nehemiah''s Levites name the Maker of *heaven... the earth, and all things that are therein* — and not the Maker only but the Preserver, *thou preservest them all.* The elders sound the same note: *thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11). All things were created by him and stand by his pleasure; the One worshipped on the throne is the One who made and upholds the whole host of heaven and earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1',
       E'A throne set in heaven, and one sat on the throne — the throne-chariot of Ezekiel (Ezekiel 1, 10)',
       E'A door opens in heaven and the first voice, *as it were of a trumpet,* says *Come up hither* (Revelation 4:1); and at once the seer is *in the spirit,* and *behold, a throne was set in heaven, and one sat on the throne* (Revelation 4:2). This is no new throne. Ezekiel saw it first by the river of Chebar: *above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it* (Ezekiel 1:26), and over the cherubim again *as it were a sapphire stone, as the appearance of the likeness of a throne* (Ezekiel 10:1). John writes that *he that sat was to look upon like a jasper and a sardine stone* (Revelation 4:3), gleaming like precious stone as Ezekiel''s throne gleamed like sapphire. And round it the same encircling bow the prophet saw: *as the appearance of the bow that is in the cloud in the day of rain... this was the appearance of the likeness of the glory of Yahuah (LORD)* (Ezekiel 1:28) — *and there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3). The Hebrew library beheld the same throne reaching to heaven: *the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* (1 Enoch 14:15), and Abraham saw the throne-chariot entire — *a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne... covered with fire* (Apocalypse of Abraham 18:9), the fire that proceeds out of John''s throne as *lightnings and thunderings and voices* (Revelation 4:5). One throne runs through the prophets and the seers of Yashar''el (Israel): the throne of the living Elohim (God). And mark who sits on it here — *him that liveth for ever and ever* (Revelation 4:9), the Father, the formless Most High shown in vision-form. The Lamb does not appear until the chapter that follows, where he comes forward and *took the book out of the right hand of him that sat upon the throne* (Revelation 5:7); the throne-sitter and the Lamb are not collapsed. In chapter 4 it is the Father on the throne, worshipped as Maker, and the seer beholds what Ezekiel and Enoch and Abraham beheld before him.',
       sv.verse_id, ev.verse_id, 'extras', 9075
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1',
       E'The four living creatures full of eyes — lion, calf, man, eagle: the cherubim of Ezekiel (Ezekiel 1, 10)',
       E'In the midst of the throne and round about it John sees *four beasts full of eyes before and behind* (Revelation 4:6) — the living creatures of Ezekiel, the cherubim that bear the throne. Ezekiel saw them come *out of the midst* of the fire: *the likeness of four living creatures... they had the likeness of a man* (Ezekiel 1:5), and he named their four faces — *the face of a man, and the face of a lion, on the right side: and... the face of an ox on the left side... also... the face of an eagle* (Ezekiel 1:10). John distributes among the four what Ezekiel gathered into each: *the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:7) — the same lion, ox (the calf), man, and eagle. When Ezekiel saw them a second time he knew them by name: *the first face was the face of a cherub, and the second... of a man, and the third... of a lion, and the fourth... of an eagle* (Ezekiel 10:14), *and I knew that they were the cherubims* (Ezekiel 10:20). And the eyes that fill John''s creatures are Ezekiel''s: *their rings were full of eyes round about them four* (Ezekiel 1:18) — *they were full of eyes within* (Revelation 4:8). The restored library beheld the same four beneath the same throne: *under the throne four fiery living creatures singing... each one of them with four faces* (Apocalypse of Abraham 18:3), and named the faces and the wings together — *of a lion, of a man, of an ox, of an eagle... and each had six wings* (Apocalypse of Abraham 18:4) — exactly John''s *four beasts had each of them six wings about him; and they were full of eyes within* (Revelation 4:8). The throne-room of Revelation 4 is the throne-chariot of Ezekiel 1: the same cherubim, the same fourfold face, the same eyes that see every way, the unsleeping bearers of the one throne.',
       sv.verse_id, ev.verse_id, 'extras', 9078
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6',
       E'Holy, holy, holy, Yahuah Elohim (Lord God) Almighty — the thrice-holy of Isaiah 6 (Isaiah 6)',
       E'The four living creatures *rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). This is the cry Isaiah heard about the throne *high and lifted up:* *one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3). The thrice-holy of the seraphim is the thrice-holy of the four beasts — one unceasing worship of the One who fills the earth with his glory. And the wings are the same: *above it stood the seraphims: each one had six wings* (Isaiah 6:2), as *the four beasts had each of them six wings about him* (Revelation 4:8). The burning ones who stood above the throne and the eye-filled creatures who circle it are of one order, the worship-bearers of the Most High. The Hebrew library heard it too: Enoch saw four about the throne of glory and heard *the voices of those four presences as they uttered praises before Yahuah (God) of glory* (1 Enoch 39:12), praise that rises *for ever and ever* — *the first voice blesses Yahuah (God) of Spirits for ever and ever* (1 Enoch 39:13), the very note of those who *give glory and honour and thanks to him that sat on the throne, who liveth for ever and ever* (Revelation 4:9). One throne, one fourfold worship, one everlasting *Holy, holy, holy* sounded by the prophets and the seers of Yashar''el (Israel) and now by the living creatures John beholds.',
       sv.verse_id, ev.verse_id, 'extras', 9081
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-the-sea-of-glass-before-the-throne-exodus-24',
       E'A sea of glass like crystal before the throne — the pavement of sapphire (Exodus 24, Ezekiel 1)',
       E'*And before the throne there was a sea of glass like unto crystal* (Revelation 4:6) — a clear, shining expanse spread out before the One who sits enthroned. The elders of Yashar''el (Israel) saw its likeness at Sinai: when Moses, Aaron, Nadab, Abihu, and the seventy went up, *they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness* (Exodus 24:10) — a pavement like clear sky beneath the feet of Elohim (God). And Ezekiel saw the same crystal expanse beneath the throne: *the likeness of the firmament upon the heads of the living creature was as the colour of the terrible crystal, stretched forth over their heads above* (Ezekiel 1:22). The paved work of sapphire under the feet of Elohim (God), the crystal firmament over the cherubim, and the sea of glass before the throne are one shining floor of the heavenly throne-room. What the seventy elders beheld with Moses, and what Ezekiel beheld by Chebar, John now beholds: the clear expanse before the throne of the living Elohim (God), and the four and twenty elders standing where the elders of old once stood and saw and worshipped.',
       sv.verse_id, ev.verse_id, 'free', 9084
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne',
       E'The elders cast their crowns, and the myriads before the throne (1 Enoch 40, Nehemiah 9)',
       E'Round about the throne sit *four and twenty elders... clothed in white raiment; and they had on their heads crowns of gold* (Revelation 4:4); and when the living creatures give glory, *the four and twenty elders fall down before him that sat on the throne, and worship him that liveth for ever and ever, and cast their crowns before the throne* (Revelation 4:10). They lay down their own crowns before the One who alone is worthy. The Hebrew library beheld the same numberless worship: Enoch saw *thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits* (1 Enoch 40:1) — the great host before the throne of glory, of which the enthroned elders are a part. And Nehemiah''s Levites confessed the ground of it all: *thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host... and the host of heaven worshippeth thee* (Nehemiah 9:6). The host that worships the Maker in the Levites'' prayer is the host that gives *glory and honour and thanks to him that sat on the throne* (Revelation 4:9) in the seer''s vision. The elders cast down their crowns because the throne is the throne of the Creator: every crown of gold returns to the One who made the heads that wear them.',
       sv.verse_id, ev.verse_id, 'extras', 9087
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9',
       E'Thou hast created all things — the Maker worshipped (Genesis 1, Nehemiah 9)',
       E'The chapter ends in the song of the elders: *Thou art worthy, O Yahuah (Lord), to receive glory and honour and power: for thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11). The ground of all this worship is creation itself — the first verse of the Word: *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1). He is worthy because he is the Maker; the throne is the throne of the Creator. Nehemiah''s Levites sounded the same confession, naming him Maker and Preserver alike: *thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee* (Nehemiah 9:6). All things were created by him and *for thy pleasure they are and were created* — made by his will and standing by his will. This is the One on the throne in chapter 4: not a co-equal council, but the living Elohim (God) who made and upholds the whole host of heaven and earth, *him that liveth for ever and ever* (Revelation 4:9), worthy of all glory because every created thing came from his hand and is kept by his pleasure.',
       sv.verse_id, ev.verse_id, 'free', 9090
  FROM _s224_rv04_lookup sv, _s224_rv04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:26 — *upon the likeness of the throne was the likeness as the appearance of a man above upon it* the throne by Chebar that John is caught up to behold, *a throne was set in heaven, and one sat on the throne* (Revelation 4:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:28 — *as the appearance of the bow that is in the cloud... the likeness of the glory of Yahuah (LORD)* the encircling rainbow the prophet saw, *a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 10:1 — *as it were a sapphire stone, as the appearance of the likeness of a throne* the throne over the cherubim, gleaming like the jasper and sardine of *he that sat* (Revelation 4:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 14:15 — *like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* the sapphire throne reaching to heaven Enoch saw, the same precious-stone throne of *he that sat* (Revelation 4:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Apocalypse of Abraham 18:9 — *a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne... covered with fire* the throne-chariot Abraham saw, the fire that proceeds from John''s throne as lightnings (Revelation 4:2, 5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='apocalypse-of-abraham' AND tv.book_slug='apocalypse-of-abraham' AND tv.chapter_number=18 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:5 — *the likeness of four living creatures... they had the likeness of a man* the cherubim of the throne-chariot, John''s *four beasts full of eyes before and behind* (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:10 — *the face of a man, and the face of a lion... the face of an ox... the face of an eagle* the four faces John names one by one, lion, calf, man, eagle (Revelation 4:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 10:14 — *the face of a cherub... of a man... of a lion... of an eagle* the second sighting where Ezekiel knows them as cherubim, the same four faces of John''s beasts (Revelation 4:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 1:18 — *their rings were full of eyes round about them four* the eyes that fill John''s living creatures, *they were full of eyes within* (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Apocalypse of Abraham 18:3 — *under the throne four fiery living creatures singing... each one of them with four faces* the restored library''s four beneath the throne, surrounded by all-seeing ones (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='apocalypse-of-abraham' AND tv.book_slug='apocalypse-of-abraham' AND tv.chapter_number=18 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Apocalypse of Abraham 18:4 — *of a lion, of a man, of an ox, of an eagle... and each had six wings* the four faces and six wings together, exactly John''s six-winged eye-filled beasts (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-four-living-creatures-full-of-eyes-lion-calf-man-eagle-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='apocalypse-of-abraham' AND tv.book_slug='apocalypse-of-abraham' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:3 — *Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* the seraphim''s cry about the throne, the thrice-holy the four beasts take up day and night (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:2 — *the seraphims: each one had six wings* the six wings of the burning ones above the throne, the same six wings of John''s four beasts (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 39:12 — *the voices of those four presences as they uttered praises before Yahuah (God) of glory* the four about the throne of glory whose ceaseless praise Enoch heard (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 39:13 — *the first voice blesses Yahuah (God) of Spirits for ever and ever* praise *for ever and ever,* the note of those who worship *him that liveth for ever and ever* (Revelation 4:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-the-sea-of-glass-before-the-throne-exodus-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 24:10 — *under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness* the pavement the seventy elders saw beneath Elohim (God) at Sinai, the sea of glass before the throne (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-sea-of-glass-before-the-throne-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:22 — *the firmament... was as the colour of the terrible crystal, stretched forth over their heads above* the crystal expanse beneath the throne over the cherubim, John''s sea of glass like crystal (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-sea-of-glass-before-the-throne-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 40:1 — *thousands of thousands and myriads of myriads... standing before Yahuah (God) of Spirits* the numberless host before the throne of glory, of which the enthroned elders are a part (Revelation 4:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=40 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:6 — *the host of heaven worshippeth thee* the host that worships the Maker in the Levites'' confession, giving glory before the throne (Revelation 4:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth* the first verse of the Word, the ground of the elders'' song, *thou hast created all things* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:6 — *thou hast made heaven... the earth, and all things that are therein... and thou preservest them all* the Maker and Preserver of all, worthy because *thou hast created all things* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv04_lookup sv, _s224_rv04_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
