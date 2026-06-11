-- ----- fragment: minion_1enoch_71.sql (session250 1-enoch 71) -----
-- Source anchor: enoch/1-enoch ch71. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en71 (view _session250_en71_lookup). Sort band base 51750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en71_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-71-holy-sons-flames-white-raiment
  ('enoch', '1-enoch', 71, 1, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The same burning court of myriads that Enoch ascends into in 71:1 — the holy ones treading flame before the throne.'),
  ('enoch', '1-enoch', 71, 1, 'canon', 'ezekiel', 1, 13, 'free', E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* Ezekiel''s living creatures of fire are the same flame-stepping holy ones Enoch sees in 71:1.'),
  ('enoch', '1-enoch', 71, 1, 'canon', 'psalms', 104, 4, 'free', E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Names what the flame-treaders of 71:1 are: ministering servants of fire, not gods — the framework''s ordered court under the Creator.'),
  ('enoch', '1-enoch', 71, 1, 'enoch', '1-enoch', 70, 1, 'extras', E'1 Enoch 70:1 — *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white [and their raiment], And their faces shone like snow.* Chapter 71 reopens and re-seals the very ascent of 70:1 — the visionary repetition marking the climax of the Parables.'),
  -- thread: 1-enoch-71-head-of-days-two-streams-of-fire
  ('enoch', '1-enoch', 71, 2, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Head of Days enthroned in fire in 71:2 is Daniel''s Ancient of Days — the formless Father whose throne is the fiery flame.'),
  ('enoch', '1-enoch', 71, 2, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The throne Enoch falls before in 71:2 is Isaiah''s throne, encircled by the thrice-holy cry of the seraphim.'),
  ('enoch', '1-enoch', 71, 2, 'canon', 'ezekiel', 1, 28, 'free', E'Ezekiel 1:28 — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* Ezekiel falls on his face before the glory just as Enoch falls before Yahuah of Spirits in 71:2 — the same prophetic prostration.'),
  -- thread: 1-enoch-71-translated-seer-heaven-of-heavens
  ('enoch', '1-enoch', 71, 5, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The canon''s own record of the translation that 71:5 narrates from the inside — Enoch carried into the heaven of heavens, taken by Elohim.'),
  ('enoch', '1-enoch', 71, 5, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The New-Testament seal on 71:5: Enoch the righteous seer translated alive, the man who pleased Elohim — gathered to the place of glory, not made its God.'),
  ('enoch', '1-enoch', 71, 5, 'canon', '2-kings', 2, 11, 'free', E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* Elijah''s fiery translation is the canon''s second witness to the bodily ascent Enoch undergoes in 71:5 — the righteous taken up to heaven.'),
  ('enoch', '1-enoch', 71, 5, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The Head of Days Enoch is carried before is the Ancient of days; the One brought near is *one LIKE the Son of Adam* (kaph kept) — the Formed Messiah whom Enoch is shown, never Enoch himself.'),
  ('enoch', '1-enoch', 71, 5, 'canon', 'revelation', 1, 13, 'free', E'Revelation 1:13 — *And in the midst of the seven candlesticks one like unto the Son of Adam, clothed with a garment down to the foot, and girt about the paps with a golden girdle.* John keeps Daniel''s kaph — *one like unto the Son of Adam* — naming the enthroned Messiah to whom the translated Enoch of 71:5 is gathered as witness.'),
  -- thread: 1-enoch-71-first-fathers-righteous-gathered
  ('enoch', '1-enoch', 71, 7, 'canon', 'hebrews', 12, 23, 'free', E'Hebrews 12:23 — *To the general assembly and church of the firstborn, which are written in heaven, and to Elohim (God) the Judge of all, and to the spirits of just men made perfect.* The spirits of just men made perfect are the very first fathers and righteous Enoch sees dwelling in that place in 71:7.'),
  ('enoch', '1-enoch', 71, 7, 'enoch', '1-enoch', 39, 6, 'extras', E'1 Enoch 39:6 — *And in those days the elect shall dwell upon the earth, and the righteous shall dwell with them, and they shall not be separated.* The same gathering of the elect and righteous Enoch beheld earlier in the Parables, now seen dwelling in their heavenly place in 71:7.'),
  -- thread: 1-enoch-71-storehouses-of-the-winds-weighed
  ('enoch', '1-enoch', 71, 8, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail.* The storehouses of the heavens Enoch is shown in 71:8 are the same treasure-chambers Yahuah challenges Job to enter — the Creator''s hidden ordering of the elements.'),
  ('enoch', '1-enoch', 71, 8, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The winds brought out of Yahuah''s treasures are the storehouses of the winds Enoch sees divided and weighed in 71:8.'),
  ('enoch', '1-enoch', 71, 8, 'canon', 'psalms', 104, 19, 'free', E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The same ordering hand that weighs the winds in 71:8 appoints the lights of the moon — the Creator''s measured order, looking ahead to Enoch''s Luminaries.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en71_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en71_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-71-holy-sons-flames-white-raiment',
       E'The holy sons of Elohim on flames of fire — white raiment, faces like snow',
       E'Enoch''s ascent opens upon the burning host of the heavenly court: *And it came to pass after this that my spirit was carried off and it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white, and their raiment, And their faces shone like snow* (1 Enoch 71:1). This is no new picture — it is the canon''s own throne-room. Daniel sees the same blazing court of myriads attending the throne: *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:10). Ezekiel saw the living creatures of the same fire: *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning* (Ezekiel 1:13). And the Psalm names what these flame-treaders are — ministering servants, not deities: *Who maketh his angels spirits; his ministers a flaming fire* (Psalms 104:4). The ascent of chapter 71 is the renewed seal of the vision already given in the chapter before it: *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white [and their raiment], And their faces shone like snow* (1 Enoch 70:1).',
       sv.verse_id, ev.verse_id, 'extras', 51750
  FROM _session250_en71_lookup sv, _session250_en71_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=71 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-71-head-of-days-two-streams-of-fire',
       E'Two streams of fire and the fall on the face before Yahuah of Spirits',
       E'Enoch comes to the throne itself and falls: *And I saw two streams of fire, And the light of that fire shone like hyacinths, And I fell on my face before Yahuah (God) of Spirits* (1 Enoch 71:2). The Head of Days — the formless Father — sits enthroned in fire, and this is precisely Daniel''s Ancient of Days: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). It is Isaiah''s throne, before which the holy ones cry: *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3). And it is Ezekiel''s glory above the firmament, before which the prophet — like Enoch — is thrown down: *This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake* (Ezekiel 1:28). The seer''s posture is always the same: flat on his face before the One enthroned. Enoch adds no rival glory; he prostrates before the Father of Spirits exactly as the prophets do.',
       sv.verse_id, ev.verse_id, 'extras', 51753
  FROM _session250_en71_lookup sv, _session250_en71_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=71 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-71-translated-seer-heaven-of-heavens',
       E'Translated into the heaven of heavens — the seer shown the One enthroned',
       E'Twice Enoch''s spirit is carried beyond the courts into the innermost place: *And he translated my spirit into the heaven of heavens, And I saw there a structure built of crystals, And between those crystals tongues of living fire* (1 Enoch 71:5). This translation of the living seer is the canon''s own testimony of Enoch — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24) — and its New-Testament seal: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). It is the same ascent later granted to Elijah: *behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven* (2 Kings 2:11). FRAMEWORK GUARD — across the Similitudes the Son of Adam / Elect One is the Messiah: the Formed Son who proceeds from the formless Head of Days, named before creation (ch48), who came in flesh as Yahusha. Enoch is the *translated righteous seer who is shown and gathered to* that One — he is not himself the pre-existent Son of Adam, and he is not deified. The title''s true referent is the enthroned Messiah whom Daniel sees, keeping the kaph: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13) — *one LIKE* the Son of Adam, the Formed who took on flesh, here brought near to the very Head of Days Enoch beholds. John sees Him enthroned and crowned: *And in the midst of the seven candlesticks one like unto the Son of Adam, clothed with a garment down to the foot, and girt about the paps with a golden girdle* (Revelation 1:13). Enoch the seer is carried up to behold the Son of Adam; he is not made into Him.',
       sv.verse_id, ev.verse_id, 'extras', 51756
  FROM _session250_en71_lookup sv, _session250_en71_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=71 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-71-first-fathers-righteous-gathered',
       E'The first fathers and the righteous who dwell there from the beginning',
       E'What Enoch is shown in the heaven of heavens is the assembly of the gathered righteous: *And there I saw the first fathers and the righteous who from the beginning of the world Dwell in that place* (1 Enoch 71:7). This is the company the letter to the Hebrews names as the destination of the redeemed: *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels, To the general assembly and church of the firstborn, which are written in heaven, and to Elohim (God) the Judge of all, and to the spirits of just men made perfect* (Hebrews 12:22-23). Enoch had already been shown this gathering earlier in the Parables, where the elect and the righteous dwell together and are not separated: *And in those days the elect shall dwell upon the earth, and the righteous shall dwell with them, and they shall not be separated. And Yahuah (God) of Spirits shall abide over them, and with them they shall eat and drink and praise Yahuah (God) of Spirits* (1 Enoch 39:6-7). The first fathers are the patriarchal line of the covenant people gathered home — the framework''s regathered righteous, not a class self-selected by confession.',
       sv.verse_id, ev.verse_id, 'extras', 51759
  FROM _session250_en71_lookup sv, _session250_en71_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=71 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-71-storehouses-of-the-winds-weighed',
       E'The hidden things — the storehouses of the winds weighed in the balance',
       E'Beyond the throne Enoch is shown the Creator''s hidden order of the heavens: *And after that I saw the hidden things in heaven, The storehouses of the winds, And how the winds are divided, And how they are weighed in the balance, And how the fountains of the spirits are reckoned* (1 Enoch 71:8). The storehouses of the elements are the canon''s own picture of the Creator''s governance — what Yahuah challenges Job to enter: *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail* (Job 38:22). Jeremiah names the wind drawn from those very chambers: *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures* (Jeremiah 10:13). And the same hand that weighs the winds appoints the lights — the order Enoch''s Luminaries will unfold: *He appointed the moon for seasons: the sun knoweth his going down* (Psalms 104:19). The hidden things are no secret arts of the Watchers but the Creator''s ordered measure — wind, water, and light weighed in His balance.',
       sv.verse_id, ev.verse_id, 'extras', 51762
  FROM _session250_en71_lookup sv, _session250_en71_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=71 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-71-holy-sons-flames-white-raiment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The same burning court of myriads that Enoch ascends into in 71:1 — the holy ones treading flame before the throne.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-holy-sons-flames-white-raiment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* Ezekiel''s living creatures of fire are the same flame-stepping holy ones Enoch sees in 71:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-holy-sons-flames-white-raiment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Names what the flame-treaders of 71:1 are: ministering servants of fire, not gods — the framework''s ordered court under the Creator.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-holy-sons-flames-white-raiment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 70:1 — *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white [and their raiment], And their faces shone like snow.* Chapter 71 reopens and re-seals the very ascent of 70:1 — the visionary repetition marking the climax of the Parables.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-holy-sons-flames-white-raiment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=70 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-71-head-of-days-two-streams-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Head of Days enthroned in fire in 71:2 is Daniel''s Ancient of Days — the formless Father whose throne is the fiery flame.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-head-of-days-two-streams-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The throne Enoch falls before in 71:2 is Isaiah''s throne, encircled by the thrice-holy cry of the seraphim.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-head-of-days-two-streams-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 1:28 — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* Ezekiel falls on his face before the glory just as Enoch falls before Yahuah of Spirits in 71:2 — the same prophetic prostration.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-head-of-days-two-streams-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-71-translated-seer-heaven-of-heavens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The canon''s own record of the translation that 71:5 narrates from the inside — Enoch carried into the heaven of heavens, taken by Elohim.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-translated-seer-heaven-of-heavens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The New-Testament seal on 71:5: Enoch the righteous seer translated alive, the man who pleased Elohim — gathered to the place of glory, not made its God.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-translated-seer-heaven-of-heavens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* Elijah''s fiery translation is the canon''s second witness to the bodily ascent Enoch undergoes in 71:5 — the righteous taken up to heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-translated-seer-heaven-of-heavens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The Head of Days Enoch is carried before is the Ancient of days; the One brought near is *one LIKE the Son of Adam* (kaph kept) — the Formed Messiah whom Enoch is shown, never Enoch himself.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-translated-seer-heaven-of-heavens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 1:13 — *And in the midst of the seven candlesticks one like unto the Son of Adam, clothed with a garment down to the foot, and girt about the paps with a golden girdle.* John keeps Daniel''s kaph — *one like unto the Son of Adam* — naming the enthroned Messiah to whom the translated Enoch of 71:5 is gathered as witness.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-translated-seer-heaven-of-heavens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-71-first-fathers-righteous-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 12:23 — *To the general assembly and church of the firstborn, which are written in heaven, and to Elohim (God) the Judge of all, and to the spirits of just men made perfect.* The spirits of just men made perfect are the very first fathers and righteous Enoch sees dwelling in that place in 71:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-first-fathers-righteous-gathered'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 39:6 — *And in those days the elect shall dwell upon the earth, and the righteous shall dwell with them, and they shall not be separated.* The same gathering of the elect and righteous Enoch beheld earlier in the Parables, now seen dwelling in their heavenly place in 71:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-first-fathers-righteous-gathered'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-71-storehouses-of-the-winds-weighed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail.* The storehouses of the heavens Enoch is shown in 71:8 are the same treasure-chambers Yahuah challenges Job to enter — the Creator''s hidden ordering of the elements.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-storehouses-of-the-winds-weighed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The winds brought out of Yahuah''s treasures are the storehouses of the winds Enoch sees divided and weighed in 71:8.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-storehouses-of-the-winds-weighed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The same ordering hand that weighs the winds in 71:8 appoints the lights of the moon — the Creator''s measured order, looking ahead to Enoch''s Luminaries.'
  FROM cross_reference_threads t, cross_references x, _session250_en71_lookup sv, _session250_en71_lookup tv
 WHERE t.slug='1-enoch-71-storehouses-of-the-winds-weighed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=71 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

