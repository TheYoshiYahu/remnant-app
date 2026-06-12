-- ----- fragment: minion_apocalypseofabraham_18.sql (session253 apocalypse-of-abraham 18) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa18 (view _session253_aoa18_lookup). Sort band base 67425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-18-throne-of-fire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'canon', 'ezekiel', 1, 26, 'free', E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The same throne of fire Abraham sees above the living creatures is what Ezekiel saw above the firmament over the cherubim.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'canon', 'isaiah', 6, 1, 'free', E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* Isaiah''s high and lifted-up throne is the throne of fire Abraham beholds the all-seeing ones encircling with song.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne of fire with its fiery wheels is exactly what Daniel saw the Ancient of days seated upon.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'canon', 'revelation', 4, 2, 'free', E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John, like Abraham, is carried up in the spirit to behold the one enthroned amid fire.'),
  -- thread: apocalypse-of-abraham-18-four-living-creatures
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'canon', 'ezekiel', 1, 10, 'free', E'Ezekiel 1:10 — *As for the likeness of their faces, they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle.* Abraham''s living creatures with the four faces of lion, man, ox, and eagle are Ezekiel''s four-faced creatures by the river Chebar.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'canon', 'ezekiel', 10, 14, 'free', E'Ezekiel 10:14 — *And every one had four faces: the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle.* Ezekiel names these same four-faced creatures the cherubim, the living beings that bear the throne Abraham now beholds.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'canon', 'revelation', 4, 7, 'free', E'Revelation 4:7 — *And the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle.* The four beasts round the heavenly throne in John''s vision are the same lion, ox, man, and eagle Abraham sees under the throne of fire.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'enoch', '1-enoch', 39, 11, 'extras', E'1 Enoch 39:11 — *And I saw the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits, and they intercede for the children of men.* Enoch too saw four presences encircling the throne of glory, the same fourfold company Abraham beholds round the throne of fire.'),
  -- thread: apocalypse-of-abraham-18-six-wings-covered
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 5, 'canon', 'isaiah', 6, 2, 'free', E'Isaiah 6:2 — *Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* Abraham''s creatures cover face and feet and spread wings to fly exactly as Isaiah''s six-winged seraphim do before the throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The six-winged creatures Abraham sees are the four six-winged beasts John saw, ceaselessly singing the holy before the throne.'),
  -- thread: apocalypse-of-abraham-18-chariot-wheels-of-eyes
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'canon', 'ezekiel', 1, 18, 'free', E'Ezekiel 1:18 — *As for their rings, they were so high that they were dreadful; and their rings were full of eyes round about them four.* Abraham''s fiery wheels full of eyes round about are Ezekiel''s dreadful wheel-rings full of eyes.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'canon', 'ezekiel', 10, 12, 'free', E'Ezekiel 10:12 — *And their whole body, and their backs, and their hands, and their wings, and the wheels, were full of eyes round about, even the wheels that they four had.* The chariot-wheels covered with eyes that Abraham sees are the eye-covered wheels of the cherubim in Ezekiel''s temple vision.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne over fiery wheels encircled with fire that Abraham beholds is the fiery-wheeled throne of the Ancient of days.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'enoch', '1-enoch', 14, 3, 'extras', E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* Enoch too was carried up by a chariot of fire to behold the throne, the same fiery chariot Abraham sees bearing the throne of the Eternal.'),
  -- thread: apocalypse-of-abraham-18-the-song
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 8, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The song of peace the living creatures recite is the seraphim''s antiphonal Holy, holy, holy before the throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 8, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The unceasing song Abraham hears the creatures recite is the unresting Holy of the four beasts before the heavenly throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 8, 'enoch', '1-enoch', 39, 12, 'extras', E'1 Enoch 39:12 — *And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory.* Enoch likewise heard the four presences uttering praise before the throne of glory, the same song of peace Abraham hears taught by Yahoel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-throne-of-fire',
       E'The throne of fire above the host',
       E'Abraham, led up by Yahoel, beholds what Ezekiel and Isaiah and John beheld — *And as the fire raised itself up, ascending into the height, I saw under the fire a throne of fire, and, round about it, all-seeing ones, reciting the song* (Apocalypse of Abraham 18:3). It ain''t new: the prophet by the river Chebar saw the same — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it* (Ezekiel 1:26), and *I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1). The Ancient of days sits on the same fiery seat — *his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9) — and the seer of Patmos was carried up to it: *a throne was set in heaven, and one sat on the throne* (Revelation 4:2). One throne, one vision, across the witnesses.',
       sv.verse_id, ev.verse_id, 'extras', 67425
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-four-living-creatures',
       E'The four living creatures: lion, man, ox, eagle',
       E'Under the throne Abraham sees *four fiery living creatures... each one of them with four faces* — *of a lion, of a man, of an ox, of an eagle* (Apocalypse of Abraham 18:3-4). It ain''t new: this is the merkabah of Ezekiel, whose creatures *had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle* (Ezekiel 1:10), the same creatures he names cherubim — *the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle* (Ezekiel 10:14). And the four beasts before the throne in heaven are these very four — *the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:7). One company of living creatures bears the throne in every seeing.',
       sv.verse_id, ev.verse_id, 'extras', 67428
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-six-wings-covered',
       E'Six wings: covering face and feet, spread to fly',
       E'Each creature has *six wings from their shoulders* — *with the two wings from their shoulders they covered their faces, and with the two wings which sprang from their loins they covered their feet, while the two middle wings they spread out for flying* (Apocalypse of Abraham 18:4-5). It ain''t new: this is precisely the seraphim of Isaiah — *each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly* (Isaiah 6:2) — and the four beasts of the throne — *the four beasts had each of them six wings about him; and they were full of eyes within* (Revelation 4:8). The same reverent posture before the same throne: the face veiled, the feet veiled, the wings spread to serve.',
       sv.verse_id, ev.verse_id, 'extras', 67431
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-chariot-wheels-of-eyes',
       E'The chariot of fiery wheels full of eyes',
       E'Behind the living creatures Abraham sees *a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne... covered with fire* (Apocalypse of Abraham 18:9). It ain''t new: Ezekiel''s merkabah is this very wheelwork — *their rings were full of eyes round about them four* (Ezekiel 1:18), the wheel within the wheel — *and their whole body, and their backs, and their hands, and their wings, and the wheels, were full of eyes round about, even the wheels that they four had* (Ezekiel 10:12). Daniel saw the Ancient of days with these same flaming wheels — *his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). And Enoch was borne to the throne in this very chariot — *I Enoch was carried off in a whirlwind, with a chariot of fire* (1 Enoch 14:3). One fiery chariot bears the throne in every ascent.',
       sv.verse_id, ev.verse_id, 'extras', 67434
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-the-song',
       E'The unceasing song before the throne',
       E'The all-seeing ones and the living creatures are *reciting the song* without ceasing, and Yahoel *taught them the song of peace which hath its origin in the Eternal One* (Apocalypse of Abraham 18:3,8). It ain''t new: before the throne the seraphim cry the everlasting Holy — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3) — and the four beasts take it up day and night — *they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). Enoch too heard the four presences before the throne — *I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory* (1 Enoch 39:12). The same song of peace, sung from the foundation, surrounds the throne in every heaven.',
       sv.verse_id, ev.verse_id, 'extras', 67437
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-18-throne-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The same throne of fire Abraham sees above the living creatures is what Ezekiel saw above the firmament over the cherubim.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-throne-of-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* Isaiah''s high and lifted-up throne is the throne of fire Abraham beholds the all-seeing ones encircling with song.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-throne-of-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne of fire with its fiery wheels is exactly what Daniel saw the Ancient of days seated upon.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-throne-of-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John, like Abraham, is carried up in the spirit to behold the one enthroned amid fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-throne-of-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-18-four-living-creatures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:10 — *As for the likeness of their faces, they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle.* Abraham''s living creatures with the four faces of lion, man, ox, and eagle are Ezekiel''s four-faced creatures by the river Chebar.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-four-living-creatures'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 10:14 — *And every one had four faces: the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle.* Ezekiel names these same four-faced creatures the cherubim, the living beings that bear the throne Abraham now beholds.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-four-living-creatures'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:7 — *And the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle.* The four beasts round the heavenly throne in John''s vision are the same lion, ox, man, and eagle Abraham sees under the throne of fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-four-living-creatures'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 39:11 — *And I saw the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits, and they intercede for the children of men.* Enoch too saw four presences encircling the throne of glory, the same fourfold company Abraham beholds round the throne of fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-four-living-creatures'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-18-six-wings-covered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:2 — *Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* Abraham''s creatures cover face and feet and spread wings to fly exactly as Isaiah''s six-winged seraphim do before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-six-wings-covered'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The six-winged creatures Abraham sees are the four six-winged beasts John saw, ceaselessly singing the holy before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-six-wings-covered'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-18-chariot-wheels-of-eyes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:18 — *As for their rings, they were so high that they were dreadful; and their rings were full of eyes round about them four.* Abraham''s fiery wheels full of eyes round about are Ezekiel''s dreadful wheel-rings full of eyes.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-chariot-wheels-of-eyes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 10:12 — *And their whole body, and their backs, and their hands, and their wings, and the wheels, were full of eyes round about, even the wheels that they four had.* The chariot-wheels covered with eyes that Abraham sees are the eye-covered wheels of the cherubim in Ezekiel''s temple vision.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-chariot-wheels-of-eyes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne over fiery wheels encircled with fire that Abraham beholds is the fiery-wheeled throne of the Ancient of days.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-chariot-wheels-of-eyes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* Enoch too was carried up by a chariot of fire to behold the throne, the same fiery chariot Abraham sees bearing the throne of the Eternal.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-chariot-wheels-of-eyes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-18-the-song
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The song of peace the living creatures recite is the seraphim''s antiphonal Holy, holy, holy before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-the-song'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The unceasing song Abraham hears the creatures recite is the unresting Holy of the four beasts before the heavenly throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-the-song'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 39:12 — *And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory.* Enoch likewise heard the four presences uttering praise before the throne of glory, the same song of peace Abraham hears taught by Yahoel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-the-song'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

