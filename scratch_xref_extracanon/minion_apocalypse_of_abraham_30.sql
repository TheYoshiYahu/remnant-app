-- ----- fragment: minion_apocalypseofabraham_30.sql (session253 apocalypse-of-abraham 30) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch30. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa30 (view _session253_aoa30_lookup). Sort band base 67725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-30-ten-plagues
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'canon', 'exodus', 9, 14, 'free', E'Exodus 9:14 — *For I will at this time send all my plagues upon thine heart, and upon thy servants, and upon thy people; that thou mayest know that there is none like me in all the earth.* The Egyptian plagues are the template for the ten plagues God says He has prepared beforehand against the heathen in Apocalypse of Abraham 30:3.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'canon', 'deuteronomy', 28, 60, 'free', E'Deuteronomy 28:60 — *Moreover he will bring upon thee all the diseases of Egypt, which thou wast afraid of; and they shall cleave unto thee.* The covenant curses carry the same plague-recompense that Apocalypse of Abraham 30:3 reserves for the heathen at the last hour.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'canon', 'revelation', 16, 1, 'free', E'Revelation 16:1 — *And I heard a great voice out of the temple saying to the seven angels, Go your ways, and pour out the vials of the wrath of Elohim (God) upon the earth.* John''s vials of wrath are the same end-time recompense Abraham is shown prepared beforehand for the heathen in Apocalypse of Abraham 30:3.'),
  -- thread: apocalypse-of-abraham-30-sword-famine-pestilence
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'matthew', 24, 7, 'free', E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The Messiah''s signs of the end name the very plagues — famine, pestilence, earthquake — that Apocalypse of Abraham 30:4 lists among the ten.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'exodus', 9, 3, 'free', E'Exodus 9:3 — *Behold, the hand of Yahuah (LORD) is upon thy cattle which is in the field, upon the horses, upon the asses, upon the camels, upon the oxen, and upon the sheep: there shall be a very grievous murrain.* The pestilence of animals that Apocalypse of Abraham 30:4 lists as the third plague repeats the murrain of Egypt.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'deuteronomy', 28, 22, 'free', E'Deuteronomy 28:22 — *Yahuah (LORD) shall smite thee with a consumption, and with a fever, and with an inflammation, and with an extreme burning, and with the sword, and with blasting, and with mildew; and they shall pursue thee until thou perish.* The hunger, sword, and pestilence of Apocalypse of Abraham 30:4 are gathered already in the covenant-curse catalogue.'),
  -- thread: apocalypse-of-abraham-30-hail-thunder-earthquake
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'exodus', 9, 23, 'free', E'Exodus 9:23 — *And Moses stretched forth his rod toward heaven: and Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground; and Yahuah (LORD) rained hail upon the land of Egypt.* The hail and thunder of Apocalypse of Abraham 30:4 repeat the seventh plague of Egypt.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'revelation', 16, 18, 'free', E'Revelation 16:18 — *And there were voices, and thunders, and lightnings; and there was a great earthquake, such as was not since men were upon the earth, so mighty an earthquake, and so great.* The tenth plague''s thunder, voices, and destructive earthquake in Apocalypse of Abraham 30:4 match the seventh vial exactly.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'revelation', 16, 21, 'free', E'Revelation 16:21 — *And there fell upon men a great hail out of heaven, every stone about the weight of a talent: and men blasphemed Elohim (God) because of the plague of the hail; for the plague thereof was exceeding great.* The hail of Apocalypse of Abraham 30:4 falls again as the final vial-plague upon the heathen.'),
  -- thread: apocalypse-of-abraham-30-day-of-wrath-heathen
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'canon', 'joel', 2, 1, 'free', E'Joel 2:1 — *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* The appointed twelfth hour of Apocalypse of Abraham 30:3 is the prophets'' day of Yahuah, nigh at hand.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'enoch', '1-enoch', 1, 9, 'extras', E'1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* The plagues prepared for the heathen in Apocalypse of Abraham 30:3 are this same judgment Enoch foresaw upon all the ungodly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-30-ten-plagues',
       E'The ten plagues prepared for the heathen',
       E'Back upon the earth, Abraham is shown the end-time recompense: *thou hast sought to see the ten plagues which I have prepared for the heathen, and have prepared beforehand at the passing over of the twelfth hour of the earth* (Apocalypse of Abraham 30:3). It ain''t new — the pattern was set in Egypt, where Yahuah loosed His plagues so that *thou mayest know that there is none like me in all the earth* (Exodus 9:14), and the covenant-witness warned that the unfaithful would meet *all the diseases of Egypt, which thou wast afraid of; and they shall cleave unto thee* (Deuteronomy 28:60). The number ten and the measured *hours* of the earth answer to John''s seven vials of wrath: *Go your ways, and pour out the vials of the wrath of Elohim (God) upon the earth* (Revelation 16:1) — the same cup, *prepared beforehand*, against the heathen at the last hour.',
       sv.verse_id, ev.verse_id, 'extras', 67725
  FROM _session253_aoa30_lookup sv, _session253_aoa30_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=30 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-30-sword-famine-pestilence',
       E'Pestilence, famine, and the sword on the nations',
       E'The catalogue itself is drawn from the prophets'' own woes: *the third, destruction and pestilence of animals; the fourth, hunger of the whole world and of its people... the ninth, punishment by the sword and flight in distress* (Apocalypse of Abraham 30:4). The Messiah named the same triad over the end of the age: *there shall be famines, and pestilences, and earthquakes, in divers places* (Matthew 24:7). The murrain among the beasts repeats Egypt, where Yahuah declared upon the cattle *there shall be a very grievous murrain* (Exodus 9:3). And the covenant-witness had already gathered consumption, fever, *and... the sword* into one sentence: *Yahuah (LORD) shall smite thee with a consumption, and with a fever, and with an inflammation, and with an extreme burning, and with the sword* (Deuteronomy 28:22). It ain''t new — the woes Abraham foresaw are the woes Torah and the prophets had already spoken.',
       sv.verse_id, ev.verse_id, 'extras', 67728
  FROM _session253_aoa30_lookup sv, _session253_aoa30_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=30 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-30-hail-thunder-earthquake',
       E'Hail, thunder, and destructive earthquake',
       E'The last plagues are sky and ground in upheaval: *the sixth, multiplication of hail and snow... the tenth, thunder and voices and destructive earthquake* (Apocalypse of Abraham 30:4). This is the seventh Egyptian plague, when Yahuah *sent thunder and hail, and the fire ran along upon the ground* (Exodus 9:23). John''s seventh vial loosed the same trio against the heathen city: *there were voices, and thunders, and lightnings; and there was a great earthquake, such as was not since men were upon the earth* (Revelation 16:18), and *there fell upon men a great hail out of heaven, every stone about the weight of a talent* (Revelation 16:21). It ain''t new — the thunder, hail, and earthquake that close Abraham''s ten are the thunder, hail, and earthquake that close the prophets'' day of wrath.',
       sv.verse_id, ev.verse_id, 'extras', 67731
  FROM _session253_aoa30_lookup sv, _session253_aoa30_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=30 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-30-day-of-wrath-heathen',
       E'The appointed hour of judgment on the ungodly',
       E'The plagues are not random but timed — *prepared beforehand at the passing over of the twelfth hour of the earth* (Apocalypse of Abraham 30:3). The prophets call this fixed term the day of Yahuah: *for the day of Yahuah (LORD) cometh, for it is nigh at hand; A day of darkness and of gloominess* (Joel 2:1-2). Enoch saw the same coming with His hosts *To execute judgement upon all, And to destroy all the ungodly* (1 Enoch 1:9). It ain''t new — the measured hour at which the heathen are recompensed is the long-foretold day when the Holy One comes forth to judge the earth.',
       sv.verse_id, ev.verse_id, 'extras', 67734
  FROM _session253_aoa30_lookup sv, _session253_aoa30_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=30 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-30-ten-plagues
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:14 — *For I will at this time send all my plagues upon thine heart, and upon thy servants, and upon thy people; that thou mayest know that there is none like me in all the earth.* The Egyptian plagues are the template for the ten plagues God says He has prepared beforehand against the heathen in Apocalypse of Abraham 30:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-ten-plagues'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:60 — *Moreover he will bring upon thee all the diseases of Egypt, which thou wast afraid of; and they shall cleave unto thee.* The covenant curses carry the same plague-recompense that Apocalypse of Abraham 30:3 reserves for the heathen at the last hour.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-ten-plagues'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 16:1 — *And I heard a great voice out of the temple saying to the seven angels, Go your ways, and pour out the vials of the wrath of Elohim (God) upon the earth.* John''s vials of wrath are the same end-time recompense Abraham is shown prepared beforehand for the heathen in Apocalypse of Abraham 30:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-ten-plagues'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-30-sword-famine-pestilence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The Messiah''s signs of the end name the very plagues — famine, pestilence, earthquake — that Apocalypse of Abraham 30:4 lists among the ten.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-sword-famine-pestilence'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 9:3 — *Behold, the hand of Yahuah (LORD) is upon thy cattle which is in the field, upon the horses, upon the asses, upon the camels, upon the oxen, and upon the sheep: there shall be a very grievous murrain.* The pestilence of animals that Apocalypse of Abraham 30:4 lists as the third plague repeats the murrain of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-sword-famine-pestilence'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 28:22 — *Yahuah (LORD) shall smite thee with a consumption, and with a fever, and with an inflammation, and with an extreme burning, and with the sword, and with blasting, and with mildew; and they shall pursue thee until thou perish.* The hunger, sword, and pestilence of Apocalypse of Abraham 30:4 are gathered already in the covenant-curse catalogue.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-sword-famine-pestilence'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-30-hail-thunder-earthquake
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:23 — *And Moses stretched forth his rod toward heaven: and Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground; and Yahuah (LORD) rained hail upon the land of Egypt.* The hail and thunder of Apocalypse of Abraham 30:4 repeat the seventh plague of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-hail-thunder-earthquake'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 16:18 — *And there were voices, and thunders, and lightnings; and there was a great earthquake, such as was not since men were upon the earth, so mighty an earthquake, and so great.* The tenth plague''s thunder, voices, and destructive earthquake in Apocalypse of Abraham 30:4 match the seventh vial exactly.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-hail-thunder-earthquake'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 16:21 — *And there fell upon men a great hail out of heaven, every stone about the weight of a talent: and men blasphemed Elohim (God) because of the plague of the hail; for the plague thereof was exceeding great.* The hail of Apocalypse of Abraham 30:4 falls again as the final vial-plague upon the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-hail-thunder-earthquake'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-30-day-of-wrath-heathen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:1 — *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* The appointed twelfth hour of Apocalypse of Abraham 30:3 is the prophets'' day of Yahuah, nigh at hand.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-day-of-wrath-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* The plagues prepared for the heathen in Apocalypse of Abraham 30:3 are this same judgment Enoch foresaw upon all the ungodly.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-day-of-wrath-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

