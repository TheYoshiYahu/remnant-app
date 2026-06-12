-- ----- fragment: minion_apocalypseofabraham_17.sql (session253 apocalypse-of-abraham 17) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa17 (view _session253_aoa17_lookup). Sort band base 67400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-17-voice-in-the-fire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 1, 'canon', 'ezekiel', 1, 24, 'free', E'Ezekiel 1:24 — *And when they went, I heard the noise of their wings, like the noise of great waters, as the voice of the Almighty, the voice of speech, as the noise of an host: when they stood, they let down their wings.* Ezekiel''s living-creatures roar the same waters-voice Abraham hears coming in the fire.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 1, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The fire that comes round about Abraham is the fiery throne Daniel beholds set in heaven.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 1, 'canon', 'psalms', 29, 3, 'free', E'Psalms 29:3 — *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters.* David already named the voice in the fire as the voice of Yahuah upon many waters.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 1, 'canon', 'revelation', 1, 15, 'free', E'Revelation 1:15 — *And his feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters.* The selfsame waters-voice that meets Abraham in the fire meets John on Patmos at the end.'),
  -- thread: apocalypse-of-abraham-17-eternal-mighty-holy
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 7, 'canon', 'deuteronomy', 6, 4, 'free', E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* Abraham''s ''El, Elohim only — Supreme!'' is the Shema spoken before Sinai — Elohim only, one.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 7, 'canon', 'isaiah', 44, 6, 'free', E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The ''Elohim only — Supreme'' of the song is Isaiah''s first-and-last beside whom there is no other.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 8, 'canon', 'psalms', 90, 2, 'free', E'Psalms 90:2 — *Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God).* The ''Uncreate, without father, without mother, unbegotten'' One is the everlasting-to-everlasting Elohim of Moses.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 8, 'canon', '1-timothy', 1, 17, 'free', E'1 Timothy 1:17 — *Now unto the King eternal, immortal, invisible, the only wise Elohim (God), be honour and glory for ever and ever. Amen.* Paul''s doxology echoes Abraham''s song word for word — eternal, immortal, the only Elohim.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 9, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* Abraham''s ''holy Sabaoth, very glorious'' is the seraphim''s Holy, holy, holy of the LORD of hosts.'),
  -- thread: apocalypse-of-abraham-17-jaoel-name-bearer
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 10, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* Yahoel who leads Abraham up is the Angel sent before to keep the way and bring to the prepared place.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 10, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* ''Jaoel'' is the very ''my name is in him'' — the Name-bearing angel of the Presence.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 10, 'canon', 'psalms', 104, 4, 'free', E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The fiery angel Yahoel is one of the flaming-fire ministers David sings.'),
  -- thread: apocalypse-of-abraham-17-the-light-before-the-light
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 13, 'canon', '1-john', 1, 5, 'free', E'1 John 1:5 — *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all.* The Light that shines before the morning, needing no other light, is the Elohim-is-light John declares.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 13, 'canon', 'james', 1, 17, 'free', E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* The splendour from the lights of His countenance is the Father of lights, with whom is no shadow of turning.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 13, 'canon', '1-timothy', 6, 16, 'free', E'1 Timothy 6:16 — *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.* The heavenly dwelling-places of unspeakable splendour are the unapproachable light in which He dwells.'),
  -- thread: apocalypse-of-abraham-17-the-sacrifice-prepared
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 14, 'canon', 'genesis', 15, 17, 'free', E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The ''sacrifice which Thou hast prepared through me'' is the very covenant cutting of Genesis 15, where the fire passed between the pieces.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 14, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The accepted sacrifice seals the land-and-seed covenant Yahuah cut with Abram.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 14, 'canon', 'revelation', 4, 5, 'free', E'Revelation 4:5 — *And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God).* The fire that received Abraham''s offering is the lamp-fire burning before the throne he ascends toward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-voice-in-the-fire',
       E'The fire and the voice of many waters',
       E'As Abraham ascends with the angel, the Presence comes not in the seen idol but in fire and a sound: *And while he yet spake, and lo, fire came against us round about, and a voice was in the fire like a voice of many waters, like the sound of the sea in its uproar* (Apocalypse of Abraham 17:1). It ain''t new — this is the merkabah Ezekiel already saw: *And when they went, I heard the noise of their wings, like the noise of great waters, as the voice of the Almighty, the voice of speech, as the noise of an host: when they stood, they let down their wings* (Ezekiel 1:24), and the throne-fire of Daniel: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). David sang the same voice over the waters: *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters* (Psalms 29:3); and the same voice meets John at the end: *His feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters* (Revelation 1:15). One throne, one fire, one voice, from Sinai to the Apocalypse.',
       sv.verse_id, ev.verse_id, 'extras', 67400
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-eternal-mighty-holy',
       E'The song of the One: El, Elohim only, Supreme',
       E'Having forsaken his father''s idols, Abraham is taught the song and sings the One: *Eternal, mighty, Holy, El, Elohim (God) only — Supreme!* (Apocalypse of Abraham 17:7) — *Thou who art self-originated, incorruptible, spotless, Uncreate, immaculate, immortal, Self-complete, self-illuminating, Without father, without mother, unbegotten, Exalted, fiery One!* (Apocalypse of Abraham 17:8). It ain''t new — it is the Shema: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4), and the first-and-last of Isaiah: *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6). The everlasting, unbegotten One is Moses'' Rock: *Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God)* (Psalms 90:2); whom Paul doxes in Abraham''s very words: *Now unto the King eternal, immortal, invisible, the only wise Elohim (God), be honour and glory for ever and ever. Amen* (1 Timothy 1:17). The seraphim''s Holy answers the song: *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3).',
       sv.verse_id, ev.verse_id, 'extras', 67403
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-jaoel-name-bearer',
       E'El, El, El, Jaoel — the angel in whom is the Name',
       E'The climax of the song names the angel-guide by the Name he bears: *El, El, El, El, Jaoel!* (Apocalypse of Abraham 17:10) — *Thou art He whom my soul hath loved!* (Apocalypse of Abraham 17:11). Yahoel is the angel of the Presence in whom the Name dwells. It ain''t new — this is the Angel Yahuah sends before Yashar''el: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20); *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). The ministers of fire that Abraham ascends among are spirits: *Who maketh his angels spirits; his ministers a flaming fire:* (Psalms 104:4) — which Hebrews carries forward: *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire* (Hebrews 1:7).',
       sv.verse_id, ev.verse_id, 'extras', 67406
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=10
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-the-light-before-the-light',
       E'The Light before the morning light',
       E'The song closes adoring the uncreated Light: *Thou, O Light, shinest before the light of the morning upon Thy creatures, so that it becometh a day upon the earth; and in Thy heavenly dwelling-places there is no need of any other light than that of the unspeakable splendour from the lights of Thy countenance* (Apocalypse of Abraham 17:13). It ain''t new — this is the light of the first day before sun or moon, and the message John declares: *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all* (1 John 1:5). Every light flows down from Him: *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17) — He *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen* (1 Timothy 6:16). It is the city''s lamp at the end, where no other light is needed.',
       sv.verse_id, ev.verse_id, 'extras', 67409
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=13
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-the-sacrifice-prepared',
       E'The sacrifice prepared through me',
       E'Abraham ends his song pleading the covenant offering: *Accept my prayer, and be well-pleased with it, likewise also the sacrifice which Thou hast prepared Thee through me who sought Thee!* (Apocalypse of Abraham 17:14). It ain''t new — this is the very scene of Genesis 15, the cut covenant where the fire of the Presence passes between the pieces: *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces* (Genesis 15:17); *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* (Genesis 15:18). And the throne-fire he now ascends toward is the seven-lamp fire before the throne: *And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God)* (Revelation 4:5). The fire that received the covenant sacrifice is the fire of the throne.',
       sv.verse_id, ev.verse_id, 'extras', 67412
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=14
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-17-voice-in-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:24 — *And when they went, I heard the noise of their wings, like the noise of great waters, as the voice of the Almighty, the voice of speech, as the noise of an host: when they stood, they let down their wings.* Ezekiel''s living-creatures roar the same waters-voice Abraham hears coming in the fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-voice-in-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The fire that comes round about Abraham is the fiery throne Daniel beholds set in heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-voice-in-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 29:3 — *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters.* David already named the voice in the fire as the voice of Yahuah upon many waters.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-voice-in-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=29 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 1:15 — *And his feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters.* The selfsame waters-voice that meets Abraham in the fire meets John on Patmos at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-voice-in-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-17-eternal-mighty-holy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* Abraham''s ''El, Elohim only — Supreme!'' is the Shema spoken before Sinai — Elohim only, one.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The ''Elohim only — Supreme'' of the song is Isaiah''s first-and-last beside whom there is no other.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 90:2 — *Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God).* The ''Uncreate, without father, without mother, unbegotten'' One is the everlasting-to-everlasting Elohim of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Timothy 1:17 — *Now unto the King eternal, immortal, invisible, the only wise Elohim (God), be honour and glory for ever and ever. Amen.* Paul''s doxology echoes Abraham''s song word for word — eternal, immortal, the only Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* Abraham''s ''holy Sabaoth, very glorious'' is the seraphim''s Holy, holy, holy of the LORD of hosts.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-17-jaoel-name-bearer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* Yahoel who leads Abraham up is the Angel sent before to keep the way and bring to the prepared place.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-jaoel-name-bearer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* ''Jaoel'' is the very ''my name is in him'' — the Name-bearing angel of the Presence.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-jaoel-name-bearer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The fiery angel Yahoel is one of the flaming-fire ministers David sings.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-jaoel-name-bearer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-17-the-light-before-the-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 1:5 — *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all.* The Light that shines before the morning, needing no other light, is the Elohim-is-light John declares.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-light-before-the-light'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* The splendour from the lights of His countenance is the Father of lights, with whom is no shadow of turning.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-light-before-the-light'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:16 — *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.* The heavenly dwelling-places of unspeakable splendour are the unapproachable light in which He dwells.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-light-before-the-light'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-17-the-sacrifice-prepared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The ''sacrifice which Thou hast prepared through me'' is the very covenant cutting of Genesis 15, where the fire passed between the pieces.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-sacrifice-prepared'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The accepted sacrifice seals the land-and-seed covenant Yahuah cut with Abram.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-sacrifice-prepared'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:5 — *And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God).* The fire that received Abraham''s offering is the lamp-fire burning before the throne he ascends toward.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-sacrifice-prepared'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

