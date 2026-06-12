-- ----- fragment: minion_apocalypseofabraham_19.sql (session253 apocalypse-of-abraham 19) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa19 (view _session253_aoa19_lookup). Sort band base 67450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-19-here-am-i-out-of-the-fire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 1, 'canon', 'genesis', 22, 11, 'free', E'Genesis 22:11 — *And the angel of Yahuah (LORD) called unto him out of heaven, and said, Abraham, Abraham: and he said, Here am I.* The same doubled name from heaven that the patriarch heard on Moriah is the voice out of the fire in Apocalypse of Abraham 19:1.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 1, 'canon', 'exodus', 3, 2, 'free', E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The voice that speaks to Abraham from the midst of the fire is the same fire-that-does-not-consume that called Moses at Horeb (Apocalypse of Abraham 19:1).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 2, 'canon', 'isaiah', 6, 8, 'free', E'Isaiah 6:8 — *Also I heard the voice of Yahuah (Lord), saying, Whom shall I send, and who will go for us? Then said I, Here am I; send me.* Abraham''s answer in the throne-room — *Here am I!* — is the standing reply of the elect, the very words Isaiah gives before the throne (Apocalypse of Abraham 19:2).'),
  -- thread: apocalypse-of-abraham-19-fire-living-creatures-throne
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 5, 'canon', 'ezekiel', 1, 13, 'free', E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* The fire widely extended over the living creatures on Abraham''s seventh firmament is the burning-coal fire of Ezekiel''s living creatures (Apocalypse of Abraham 19:5).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 5, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The widely-extended fire and the power of invisible glory Abraham sees is the fiery-flame throne of the Ancient of days (Apocalypse of Abraham 19:5).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 5, 'canon', 'revelation', 4, 6, 'free', E'Revelation 4:6 — *And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind.* The living creatures over which Abraham sees the power of invisible glory are the four living creatures round John''s throne (Apocalypse of Abraham 19:5).'),
  -- thread: apocalypse-of-abraham-19-angels-pure-spirit-carry-commands
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 6, 'canon', 'psalms', 104, 4, 'free', E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Abraham''s angels of pure spirit without bodies, serving the fiery angels, are the very spirits-and-flaming-ministers of the Psalm (Apocalypse of Abraham 19:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 6, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The multitude of angels who carry out the commands of the fiery angels is the thousand-thousand host ministering before the fiery throne (Apocalypse of Abraham 19:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 7, 'canon', 'ezekiel', 1, 12, 'free', E'Ezekiel 1:12 — *And they went every one straight forward: whither the spirit was to go, they went; and they turned not when they went.* That the angels are powers only of pure spirit carrying out commands answers Ezekiel''s creatures who move solely where the Spirit sends them (Apocalypse of Abraham 19:7).'),
  -- thread: apocalypse-of-abraham-19-powers-of-the-stars-obey
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 9, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The powers of the stars that carry out the commands laid upon them are the appointed lights set in the firmament from creation (Apocalypse of Abraham 19:9).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 9, 'enoch', '1-enoch', 18, 13, 'extras', E'1 Enoch 18:13 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* Abraham''s powers of the stars under command match Enoch''s host bound to their commandment and judged when they fail to keep it (Apocalypse of Abraham 19:9).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 9, 'enoch', '1-enoch', 18, 4, 'extras', E'1 Enoch 18:4 — *I saw the winds of heaven which turn and bring the circumference of the sun and all the stars to their setting.* The elements of the earth obeying the powers of the stars echoes Enoch''s winds that govern the sun and all the stars in their courses (Apocalypse of Abraham 19:9).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-19-here-am-i-out-of-the-fire',
       E'The Voice Out of the Fire — "Abraham, Abraham!"',
       E'Out of the burning the Name calls the patriarch by his doubled name, and he answers as the elect always answer: *And a voice came to me out of the midst of the fire, saying: "Abraham, Abraham!"* (Apocalypse of Abraham 19:1) — *I said: "Here am I!"* (Apocalypse of Abraham 19:2). It ain''t new. This is the same doubled call that stayed the knife on Moriah: *And the angel of Yahuah (LORD) called unto him out of heaven, and said, Abraham, Abraham: and he said, Here am I* (Genesis 22:11). It is the voice from the unconsumed fire on Horeb: *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed* (Exodus 3:2). And when the prophet stands in the throne-room and the same voice asks who will go, the elect answer in Abraham''s own words: *Also I heard the voice of Yahuah (Lord), saying, Whom shall I send, and who will go for us? Then said I, Here am I; send me* (Isaiah 6:8). The call comes out of the fire; the man says *Here am I*.',
       sv.verse_id, ev.verse_id, 'extras', 67450
  FROM _session253_aoa19_lookup sv, _session253_aoa19_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=19 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-19-fire-living-creatures-throne',
       E'The Fire, the Living Creatures, and the Glory on the Highest Firmament',
       E'Lifted to the seventh firmament, Abraham sees the throne-fire and the living creatures wrapped in invisible glory: *And I saw upon the seventh firmament upon which I stood a fire widely extended, and light, and dew, and a multitude of angels, and a power of invisible glory over the living creatures which I saw; but no other being did I see there* (Apocalypse of Abraham 19:5). It ain''t new — this is the merkabah Ezekiel saw by the Chebar: *Also out of the midst thereof came the likeness of four living creatures... As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps* (Ezekiel 1:5, 13), and over them the throne: *and upon the likeness of the throne was the likeness as the appearance of a man above upon it* (Ezekiel 1:26). It is the fiery throne Daniel beheld: *his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). And it is the throne John saw, with the living creatures full of fire and the glory: *And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind* (Revelation 4:6). One throne, one fire, one company of living creatures — seen by Abraham, Ezekiel, Daniel, and John alike.',
       sv.verse_id, ev.verse_id, 'extras', 67453
  FROM _session253_aoa19_lookup sv, _session253_aoa19_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=19 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-19-angels-pure-spirit-carry-commands',
       E'Angels of Pure Spirit Who Carry Out the Commands',
       E'Below the highest heaven Abraham sees rank upon rank of bodiless ministers doing the bidding of the fiery angels: *And I looked from the mountain in which I stood downwards to the sixth firmament, and saw there a multitude of angels, of pure spirit, without bodies, who carried out the commands of the fiery angels who were upon the eighth firmament* (Apocalypse of Abraham 19:6). It ain''t new. The Psalm names them exactly so — spirit and flame: *Who maketh his angels spirits; his ministers a flaming fire* (Psalm 104:4). Daniel numbers the same host attending the fiery throne: *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him* (Daniel 7:10). And Ezekiel''s living creatures move only at command, each one going straight on the errand of the Spirit: *And they went every one straight forward: whither the spirit was to go, they went; and they turned not when they went* (Ezekiel 1:12). The angels do not act of themselves; they carry out the commands.',
       sv.verse_id, ev.verse_id, 'extras', 67456
  FROM _session253_aoa19_lookup sv, _session253_aoa19_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=19 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-19-powers-of-the-stars-obey',
       E'The Powers of the Stars That Carry Out the Commands',
       E'On the fifth firmament Abraham sees the host of heaven under orders, and the very elements obeying them: *And I saw there, on the fifth firmament, the powers of the stars which carry out the commands laid upon them, and the elements of the earth obeyed them* (Apocalypse of Abraham 19:9). It ain''t new — the lights were set in the firmament under appointment from the first day: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). And the live witness of Enoch shows the same: the stars are a host bound to their commandment, judged when they keep it not — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times* (1 Enoch 18:13), the winds themselves turning *the circumference of the sun and all the stars to their setting* (1 Enoch 18:4). The powers of heaven are servants under command, not gods to be feared — the very lesson Abraham learned when he forsook Terah''s idols.',
       sv.verse_id, ev.verse_id, 'extras', 67459
  FROM _session253_aoa19_lookup sv, _session253_aoa19_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=19 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-19-here-am-i-out-of-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:11 — *And the angel of Yahuah (LORD) called unto him out of heaven, and said, Abraham, Abraham: and he said, Here am I.* The same doubled name from heaven that the patriarch heard on Moriah is the voice out of the fire in Apocalypse of Abraham 19:1.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-here-am-i-out-of-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The voice that speaks to Abraham from the midst of the fire is the same fire-that-does-not-consume that called Moses at Horeb (Apocalypse of Abraham 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-here-am-i-out-of-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 6:8 — *Also I heard the voice of Yahuah (Lord), saying, Whom shall I send, and who will go for us? Then said I, Here am I; send me.* Abraham''s answer in the throne-room — *Here am I!* — is the standing reply of the elect, the very words Isaiah gives before the throne (Apocalypse of Abraham 19:2).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-here-am-i-out-of-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-19-fire-living-creatures-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* The fire widely extended over the living creatures on Abraham''s seventh firmament is the burning-coal fire of Ezekiel''s living creatures (Apocalypse of Abraham 19:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-fire-living-creatures-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The widely-extended fire and the power of invisible glory Abraham sees is the fiery-flame throne of the Ancient of days (Apocalypse of Abraham 19:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-fire-living-creatures-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:6 — *And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind.* The living creatures over which Abraham sees the power of invisible glory are the four living creatures round John''s throne (Apocalypse of Abraham 19:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-fire-living-creatures-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-19-angels-pure-spirit-carry-commands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Abraham''s angels of pure spirit without bodies, serving the fiery angels, are the very spirits-and-flaming-ministers of the Psalm (Apocalypse of Abraham 19:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-angels-pure-spirit-carry-commands'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The multitude of angels who carry out the commands of the fiery angels is the thousand-thousand host ministering before the fiery throne (Apocalypse of Abraham 19:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-angels-pure-spirit-carry-commands'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 1:12 — *And they went every one straight forward: whither the spirit was to go, they went; and they turned not when they went.* That the angels are powers only of pure spirit carrying out commands answers Ezekiel''s creatures who move solely where the Spirit sends them (Apocalypse of Abraham 19:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-angels-pure-spirit-carry-commands'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-19-powers-of-the-stars-obey
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The powers of the stars that carry out the commands laid upon them are the appointed lights set in the firmament from creation (Apocalypse of Abraham 19:9).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-powers-of-the-stars-obey'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 18:13 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* Abraham''s powers of the stars under command match Enoch''s host bound to their commandment and judged when they fail to keep it (Apocalypse of Abraham 19:9).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-powers-of-the-stars-obey'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 18:4 — *I saw the winds of heaven which turn and bring the circumference of the sun and all the stars to their setting.* The elements of the earth obeying the powers of the stars echoes Enoch''s winds that govern the sun and all the stars in their courses (Apocalypse of Abraham 19:9).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-powers-of-the-stars-obey'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

