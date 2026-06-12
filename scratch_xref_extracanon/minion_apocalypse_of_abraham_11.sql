-- ----- fragment: minion_apocalypseofabraham_11.sql (session253 apocalypse-of-abraham 11) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa11 (view _session253_aoa11_lookup). Sort band base 67250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-11-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who grasps Abraham''s right hand and leads him is this same sent Angel who goes before to bring the elect into the prepared place.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Yahoel, the angel of Apocalypse of Abraham 11:1, is precisely the One in whom the Name dwells — the Name-bearer the Torah commanded Israel to obey.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'daniel', 10, 6, 'free', E'Daniel 10:6 — *His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* Daniel by the Hiddekel beholds the same gem-bodied, fire-eyed glory Abraham beholds in his angelic guide.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'revelation', 1, 14, 'free', E'Revelation 1:14 — *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* The snow-white hair of Abraham''s guide is the snow-white hair John sees — one continuous vision of the same glorious Lord.'),
  -- thread: apocalypse-of-abraham-11-fear-not-set-on-feet
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 4, 'canon', 'daniel', 8, 17, 'free', E'Daniel 8:17 — *So he came near where I stood: and when he came, I was afraid, and fell upon my face: but he said unto me, Understand, O son of Adam: for at the time of the end shall be the vision.* As Gabriel calms Daniel''s fright before the vision, so Yahoel tells Abraham not to let his look affright him.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 4, 'canon', 'daniel', 10, 12, 'free', E'Daniel 10:12 — *Then said he unto me, Fear not, Daniel: for from the first day that thou didst set thine heart to understand, and to chasten thyself before thy Elohim (God), thy words were heard, and I am come for thy words.* The "Fear not" to the trembling seer is the very word the angel speaks over Abraham''s perturbed soul.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 4, 'canon', 'daniel', 10, 10, 'free', E'Daniel 10:10 — *And, behold, an hand touched me, which set me upon my knees and upon the palms of my hands.* The angelic hand that raises the fallen prophet is the same hand that grasped Abraham by the right hand and set him upon his feet (11:1).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 3, 'canon', 'ezekiel', 1, 28, 'free', E'Ezekiel 1:28 — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* Ezekiel falls before the rainbow-glory and hears a voice — Abraham answers that voice, "Here am I, thy servant."'),
  -- thread: apocalypse-of-abraham-11-rainbow-throne-glory
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'ezekiel', 1, 26, 'free', E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The sapphire body of Abraham''s angel is the sapphire-stone throne and the man-likeness upon it that Ezekiel beheld.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'revelation', 4, 3, 'free', E'Revelation 4:3 — *And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald.* The rainbow-turban on Yahoel''s head is the rainbow round about the throne John saw — the same covenant-token crowning the glory.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'revelation', 10, 1, 'free', E'Revelation 10:1 — *And I saw another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head, and his face was as it were the sun, and his feet as pillars of fire:* John''s mighty angel wears the rainbow on his head exactly as Abraham''s angel wears the turban like the rainbow.'),
  -- thread: apocalypse-of-abraham-11-led-to-the-sacrifice
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 5, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The "sacrifice" Yahoel leads Abraham toward is this very covenant offering of the heifer, goat, ram, turtledove and pigeon.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 5, 'canon', 'genesis', 15, 17, 'free', E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The Presence "visible" at the sacrifice is the smoking furnace and burning lamp that passed between the pieces of Abraham''s covenant.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 6, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* The same God of glory who called Abraham out of Mesopotamia now sends His Name-bearing angel to say "come with me."'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 6, 'canon', 'joshua', 5, 14, 'free', E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The captain of Yahuah''s host who is worshipped by Joshua is the same Name-bearing angel Abraham follows with "Here am I, thy servant."')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-11-name-bearing-angel',
       E'Yahoel — the angel in whom is the Name',
       E'Abraham is raised by the angel who took his right hand, and the description is the description of the glory: *And I rose up and saw him who had grasped me by my right hand and set me up upon my feet; and the appearance of his body was like sapphire, and the look of his countenance like chrysolite, and the hair of his head like snow, and the turban upon his head like the appearance of the rainbow, and the clothing of his garments like purple; and a golden sceptre was in his right hand.* (Apocalypse of Abraham 11:1). It ain''t new. This is the angel the Torah already named — the One who carries the Name itself: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* (Exodus 23:20), of whom Yahuah says, *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* (Exodus 23:21) — the Name-bearer, Yahoel, the Yah-El. Daniel saw the same figure by the great river: *His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* (Daniel 10:6). And John on Patmos: *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* (Revelation 1:14) — the snow-white hair, the same glory, the same Lord.',
       sv.verse_id, ev.verse_id, 'extras', 67250
  FROM _session253_aoa11_lookup sv, _session253_aoa11_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-11-fear-not-set-on-feet',
       E'Fear not — the prophet raised and named',
       E'The angel calls Abraham by name and stills his dread: *And he said to me: "Abraham!" And I said: "Here am I, thy servant." And he said: "Let not my look affright thee, nor my speech, that thy soul be not perturbed."* (Apocalypse of Abraham 11:2-4). It ain''t new — this is how heaven always meets the seer who falls before its glory. Daniel could not stand: *So he came near where I stood: and when he came, I was afraid, and fell upon my face: but he said unto me, Understand, O son of Adam: for at the time of the end shall be the vision.* (Daniel 8:17), and again he was strengthless until *behold, an hand touched me, which set me upon my knees and upon the palms of my hands.* (Daniel 10:10), and the word came, *Fear not, Daniel: for from the first day that thou didst set thine heart to understand... thy words were heard.* (Daniel 10:12). Abraham''s "Here am I, thy servant" is the servant-posture Ezekiel knew when *I fell upon my face, and I heard a voice of one that spake.* (Ezekiel 1:28). The man is unmade by the glory, then set on his feet and named — that the vision may be understood.',
       sv.verse_id, ev.verse_id, 'extras', 67253
  FROM _session253_aoa11_lookup sv, _session253_aoa11_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-11-rainbow-throne-glory',
       E'The turban like the rainbow — the throne-glory',
       E'The crown of the angel is the sign of the covenant: *the turban upon his head like the appearance of the rainbow* (Apocalypse of Abraham 11:1). It ain''t new — the rainbow round the head and round the throne is the unbroken token of the glory. Ezekiel saw it over the firmament: *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* (Ezekiel 1:26) — the very sapphire of Abraham''s angel. John saw it ring the throne: *And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald.* (Revelation 4:3), and crowning the mighty angel: *And I saw another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head, and his face was as it were the sun, and his feet as pillars of fire:* (Revelation 10:1). The rainbow on Yahoel''s head is the throne brought down to lead Abraham up to the throne.',
       sv.verse_id, ev.verse_id, 'extras', 67256
  FROM _session253_aoa11_lookup sv, _session253_aoa11_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-11-led-to-the-sacrifice',
       E'Come with me — led to the covenant sacrifice',
       E'The angel''s whole errand is to bring Abraham to the offering: *Come with me and I will go with thee, until the sacrifice, visible; but after the sacrifice, invisible for ever. Be of good cheer, and come!* (Apocalypse of Abraham 11:5-6). It ain''t new — this is the road to Genesis 15, the cutting of the covenant: *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* (Genesis 15:9), and the glory that passed between the pieces: *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* (Genesis 15:17) — the visible Presence at the sacrifice. The God of glory had already called Abraham out by this same summons: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* (Acts 7:2) saying *Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* (Acts 7:3). And the man-with-the-sword who met Joshua is the same captain who is worshipped: *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship...* (Joshua 5:14) — the angel who bears the Name, leading the elect to the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67259
  FROM _session253_aoa11_lookup sv, _session253_aoa11_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-11-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who grasps Abraham''s right hand and leads him is this same sent Angel who goes before to bring the elect into the prepared place.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Yahoel, the angel of Apocalypse of Abraham 11:1, is precisely the One in whom the Name dwells — the Name-bearer the Torah commanded Israel to obey.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 10:6 — *His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* Daniel by the Hiddekel beholds the same gem-bodied, fire-eyed glory Abraham beholds in his angelic guide.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 1:14 — *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* The snow-white hair of Abraham''s guide is the snow-white hair John sees — one continuous vision of the same glorious Lord.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-11-fear-not-set-on-feet
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 8:17 — *So he came near where I stood: and when he came, I was afraid, and fell upon my face: but he said unto me, Understand, O son of Adam: for at the time of the end shall be the vision.* As Gabriel calms Daniel''s fright before the vision, so Yahoel tells Abraham not to let his look affright him.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-fear-not-set-on-feet'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 10:12 — *Then said he unto me, Fear not, Daniel: for from the first day that thou didst set thine heart to understand, and to chasten thyself before thy Elohim (God), thy words were heard, and I am come for thy words.* The "Fear not" to the trembling seer is the very word the angel speaks over Abraham''s perturbed soul.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-fear-not-set-on-feet'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 10:10 — *And, behold, an hand touched me, which set me upon my knees and upon the palms of my hands.* The angelic hand that raises the fallen prophet is the same hand that grasped Abraham by the right hand and set him upon his feet (11:1).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-fear-not-set-on-feet'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 1:28 — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* Ezekiel falls before the rainbow-glory and hears a voice — Abraham answers that voice, "Here am I, thy servant."'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-fear-not-set-on-feet'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-11-rainbow-throne-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The sapphire body of Abraham''s angel is the sapphire-stone throne and the man-likeness upon it that Ezekiel beheld.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-rainbow-throne-glory'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 4:3 — *And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald.* The rainbow-turban on Yahoel''s head is the rainbow round about the throne John saw — the same covenant-token crowning the glory.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-rainbow-throne-glory'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 10:1 — *And I saw another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head, and his face was as it were the sun, and his feet as pillars of fire:* John''s mighty angel wears the rainbow on his head exactly as Abraham''s angel wears the turban like the rainbow.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-rainbow-throne-glory'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-11-led-to-the-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The "sacrifice" Yahoel leads Abraham toward is this very covenant offering of the heifer, goat, ram, turtledove and pigeon.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-led-to-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The Presence "visible" at the sacrifice is the smoking furnace and burning lamp that passed between the pieces of Abraham''s covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-led-to-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* The same God of glory who called Abraham out of Mesopotamia now sends His Name-bearing angel to say "come with me."'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-led-to-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The captain of Yahuah''s host who is worshipped by Joshua is the same Name-bearing angel Abraham follows with "Here am I, thy servant."'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-led-to-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

