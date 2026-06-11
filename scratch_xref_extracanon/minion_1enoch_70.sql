-- ----- fragment: minion_1enoch_70.sql (session250 1-enoch 70) -----
-- Source anchor: enoch/1-enoch ch70. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en70 (view _session250_en70_lookup). Sort band base 51725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en70_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-70-enoch-translated
  ('enoch', '1-enoch', 70, 1, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The canon''s single line of Enoch''s removal is the event 1 Enoch 70:1 narrates from the inside as his spirit is translated and ascends into the heavens.'),
  ('enoch', '1-enoch', 70, 1, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The New Testament names the manner — translation, not death — which is exactly the "my spirit was translated And it ascended" of 1 Enoch 70:1.'),
  ('enoch', '1-enoch', 70, 1, 'apocrypha', 'ecclesiasticus', 44, 16, 'extras', E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* Sirach keeps the same verb "translated" for Enoch''s removal that 1 Enoch 70:1 unfolds as an ascent into the heavens.'),
  ('enoch', '1-enoch', 70, 1, 'apocrypha', 'ecclesiasticus', 49, 14, 'extras', E'Ecclesiasticus 49:14 — *But upon the earth was no man created like Enoch; for he was taken from the earth.* Sirach marks Enoch''s removal as without equal among the earth-born, matching the singular lifting-out narrated in 1 Enoch 70:1.'),
  ('enoch', '1-enoch', 70, 2, 'canon', '2-kings', 2, 11, 'free', E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* Elijah''s bodily ascent into heaven is the only canonical parallel to Enoch''s translation, and both are surrounded by fire as in 1 Enoch 70:2''s two streams of fire.'),
  ('enoch', '1-enoch', 70, 1, 'jubilees', 'jubilees', 4, 23, 'extras', E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees confirms Enoch was conducted away to a heavenly dwelling, the same removal 1 Enoch 70:1 describes as his spirit ascending into the heavens.'),
  -- thread: 1-enoch-70-throne-of-fire
  ('enoch', '1-enoch', 70, 2, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s white-as-snow, fiery-flame throne of the Ancient of Days is the same scene of white garments and streams of fire before which Enoch falls in 1 Enoch 70:1-2.'),
  ('enoch', '1-enoch', 70, 2, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The fiery stream from the throne matches the two streams of fire Enoch sees in 1 Enoch 70:2 before the Yahuah of Spirits.'),
  ('enoch', '1-enoch', 70, 1, 'canon', 'revelation', 1, 14, 'free', E'Revelation 1:14 — *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* John''s glorified vision keeps the white-as-snow and flame-of-fire of the throne, the same imagery in which Enoch sees the holy ones with faces shining like snow in 1 Enoch 70:1.'),
  -- thread: 1-enoch-70-michael-the-secrets
  ('enoch', '1-enoch', 70, 3, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The same archangel Michael who guards the covenant people in Daniel takes Enoch by the right hand to show him the secrets of righteousness in 1 Enoch 70:3.'),
  ('enoch', '1-enoch', 70, 4, 'canon', 'daniel', 10, 6, 'free', E'Daniel 10:6 — *His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* Daniel''s fiery angelic revealer parallels the heavenly guide who shows Enoch the ends of heaven and the chambers of the stars in 1 Enoch 70:4.'),
  -- thread: 1-enoch-70-dwelling-of-the-righteous
  ('enoch', '1-enoch', 70, 7, 'canon', 'hebrews', 12, 23, 'free', E'Hebrews 12:23 — *To the general assembly and church of the firstborn, which are written in heaven, and to Elohim (God) the Judge of all, and to the spirits of just men made perfect,* The "spirits of just men made perfect" written in heaven are the first fathers and righteous Enoch sees dwelling in that place in 1 Enoch 70:7.'),
  ('enoch', '1-enoch', 70, 7, 'canon', 'hebrews', 12, 22, 'free', E'Hebrews 12:22 — *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels,* The heavenly Jerusalem with its company of angels is the crystal dwelling among living fire and holy ones that Enoch longs to remain in at 1 Enoch 70:5-7.'),
  ('enoch', '1-enoch', 70, 7, 'canon', 'luke', 16, 22, 'free', E'Luke 16:22 — *And it came to pass, that the beggar died, and was carried by the angels into Abraham''s bosom: the rich man also died, and was buried;* The righteous carried by angels to Abraham''s bosom is the same gathering of the first fathers and the righteous whom Enoch finds dwelling in that place in 1 Enoch 70:7.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en70_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en70_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-70-enoch-translated',
       E'Enoch translated — taken, that he should not see death',
       E'The Book of Parables closes as Enoch is carried out of the earth: *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God).* (1 Enoch 70:1). The canon tells the same removal in a single breath: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* (Genesis 5:24), and the New Testament names the manner of it — not death but translation: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* (Hebrews 11:5). The wisdom of Sirach holds the same memory — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* (Ecclesiasticus 44:16) — and underlines how singular it was: *But upon the earth was no man created like Enoch; for he was taken from the earth.* (Ecclesiasticus 49:14). Only one other walks this same path bodily out of the world: *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* (2 Kings 2:11). Jubilees even keeps the destination Enoch describes — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* (Jubilees 4:23). It ain''t new: the canon''s terse "Elohim took him" is here unfolded as the very ascent Enoch saw.',
       sv.verse_id, ev.verse_id, 'extras', 51725
  FROM _session250_en70_lookup sv, _session250_en70_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=70 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-70-throne-of-fire',
       E'Streams of fire and garments white as snow — the throne theophany',
       E'As Enoch is lifted he sees the holy ones in fire and white: *I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white [and their raiment], And their faces shone like snow.* (1 Enoch 70:1), and *I saw two streams of fire, And the light of that fire shone like hyacinths, And I fell on my face before Yahuah (God) of Spirits.* (1 Enoch 70:2). This is the same vision Daniel was given of the throne of the Head of Days: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9), with its issuing river of fire — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* (Daniel 7:10). John sees the glorified One in the same colors and flame: *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* (Revelation 1:14). The whiteness-as-snow and the streams of fire are not Enoch''s private symbolism — they are the fixed furniture of the throne-room the prophets all saw, where the Head of Days is the Father (formless), before whom Enoch falls on his face.',
       sv.verse_id, ev.verse_id, 'extras', 51728
  FROM _session250_en70_lookup sv, _session250_en70_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=70 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-70-michael-the-secrets',
       E'Michael leads Enoch into the secrets',
       E'It is Michael who escorts Enoch through the hidden things: *And the angel Michael seized me by my right hand, And lifted me up and led me forth into all the secrets, And he showed me all the secrets of righteousness.* (1 Enoch 70:3), unveiling the ends of heaven and the storehouses of the stars (1 Enoch 70:4). The canon knows this same Michael as the great prince who stands for the covenant people: *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). Daniel too is taken in hand by a shining heavenly being who reveals what is hidden: *His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* (Daniel 10:6). The angelic guide who seizes the prophet''s hand and unfolds the secrets of righteousness is the same ministering order across both books — the Watchers fell from this service, but Michael keeps it.',
       sv.verse_id, ev.verse_id, 'extras', 51731
  FROM _session250_en70_lookup sv, _session250_en70_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=70 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-70-dwelling-of-the-righteous',
       E'Where the first fathers and the righteous dwell',
       E'At the height of his ascent Enoch finds the home of the saints: *And there I saw the first fathers and the righteous who from the beginning of the world Dwell in that place.* (1 Enoch 70:7), a longing-filled crystal dwelling shot through with living fire (1 Enoch 70:5-6). The New Testament names this very assembly — the gathered fathers and perfected righteous in the heavenly city: *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels,* (Hebrews 12:22), *To the general assembly and church of the firstborn, which are written in heaven, and to Elohim (God) the Judge of all, and to the spirits of just men made perfect,* (Hebrews 12:23). The Gospel shows the same resting-place of the righteous dead carried there by angels: *And it came to pass, that the beggar died, and was carried by the angels into Abraham''s bosom: the rich man also died, and was buried;* (Luke 16:22). The first fathers do not perish into nothing — the righteous, written in heaven from the beginning of the world, dwell in the place Enoch was permitted to see. Election precedes confession: these are named and gathered, not self-chosen.',
       sv.verse_id, ev.verse_id, 'extras', 51734
  FROM _session250_en70_lookup sv, _session250_en70_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=70 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-70-enoch-translated
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The canon''s single line of Enoch''s removal is the event 1 Enoch 70:1 narrates from the inside as his spirit is translated and ascends into the heavens.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-enoch-translated'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The New Testament names the manner — translation, not death — which is exactly the "my spirit was translated And it ascended" of 1 Enoch 70:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-enoch-translated'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* Sirach keeps the same verb "translated" for Enoch''s removal that 1 Enoch 70:1 unfolds as an ascent into the heavens.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-enoch-translated'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 49:14 — *But upon the earth was no man created like Enoch; for he was taken from the earth.* Sirach marks Enoch''s removal as without equal among the earth-born, matching the singular lifting-out narrated in 1 Enoch 70:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-enoch-translated'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=49 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* Elijah''s bodily ascent into heaven is the only canonical parallel to Enoch''s translation, and both are surrounded by fire as in 1 Enoch 70:2''s two streams of fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-enoch-translated'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* Jubilees confirms Enoch was conducted away to a heavenly dwelling, the same removal 1 Enoch 70:1 describes as his spirit ascending into the heavens.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-enoch-translated'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-70-throne-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s white-as-snow, fiery-flame throne of the Ancient of Days is the same scene of white garments and streams of fire before which Enoch falls in 1 Enoch 70:1-2.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-throne-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The fiery stream from the throne matches the two streams of fire Enoch sees in 1 Enoch 70:2 before the Yahuah of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-throne-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 1:14 — *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* John''s glorified vision keeps the white-as-snow and flame-of-fire of the throne, the same imagery in which Enoch sees the holy ones with faces shining like snow in 1 Enoch 70:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-throne-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-70-michael-the-secrets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The same archangel Michael who guards the covenant people in Daniel takes Enoch by the right hand to show him the secrets of righteousness in 1 Enoch 70:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-michael-the-secrets'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 10:6 — *His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* Daniel''s fiery angelic revealer parallels the heavenly guide who shows Enoch the ends of heaven and the chambers of the stars in 1 Enoch 70:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-michael-the-secrets'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-70-dwelling-of-the-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 12:23 — *To the general assembly and church of the firstborn, which are written in heaven, and to Elohim (God) the Judge of all, and to the spirits of just men made perfect,* The "spirits of just men made perfect" written in heaven are the first fathers and righteous Enoch sees dwelling in that place in 1 Enoch 70:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-dwelling-of-the-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:22 — *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels,* The heavenly Jerusalem with its company of angels is the crystal dwelling among living fire and holy ones that Enoch longs to remain in at 1 Enoch 70:5-7.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-dwelling-of-the-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 16:22 — *And it came to pass, that the beggar died, and was carried by the angels into Abraham''s bosom: the rich man also died, and was buried;* The righteous carried by angels to Abraham''s bosom is the same gathering of the first fathers and the righteous whom Enoch finds dwelling in that place in 1 Enoch 70:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en70_lookup sv, _session250_en70_lookup tv
 WHERE t.slug='1-enoch-70-dwelling-of-the-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=70 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

