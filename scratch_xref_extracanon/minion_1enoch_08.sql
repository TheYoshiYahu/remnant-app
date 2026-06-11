-- ----- fragment: minion_1enoch_08.sql (session250 1-enoch 8) -----
-- Source anchor: enoch/1-enoch ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en08 (view _session250_en08_lookup). Sort band base 50175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-8-azazel-craft-and-adornment
  ('enoch', '1-enoch', 8, 1, 'canon', '2-kings', 9, 30, 'free', E'2 Kings 9:30 — *And when Jehu was come to Jezreel, Jezebel heard of it; and she painted her face, and tired her head, and looked out at a window.* The painting of the face and the beautifying of the eyelids that Azâzêl taught in 1 Enoch 8:1 becomes the mark of the harlot-queen at the window.'),
  ('enoch', '1-enoch', 8, 1, 'canon', 'jeremiah', 4, 30, 'free', E'Jeremiah 4:30 — *And when thou art spoiled, what wilt thou do? Though thou clothest thyself with crimson, though thou deckest thee with ornaments of gold, though thou rentest thy face with painting, in vain shalt thou make thyself fair; thy lovers will despise thee, they will seek thy life.* The ornaments of gold and the painting of the face that the Watcher taught in 1 Enoch 8:1 cannot save the spoiled city.'),
  ('enoch', '1-enoch', 8, 1, 'canon', 'ezekiel', 23, 40, 'free', E'Ezekiel 23:40 — *And furthermore, that ye have sent for men to come from far, unto whom a messenger was sent; and, lo, they came: for whom thou didst wash thyself, paintedst thy eyes, and deckedst thyself with ornaments,* — the painted eyes and the ornaments Azâzêl handed down in 1 Enoch 8:1 are here the dress of covenant-breaking adultery.'),
  ('enoch', '1-enoch', 8, 1, 'apocrypha', 'the-wisdom-of-solomon', 14, 12, 'extras', E'The Wisdom of Solomon 14:12 — *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* The costly stones and colouring tinctures Azâzêl taught in 1 Enoch 8:1 are the very craft Wisdom names as the beginning of spiritual fornication.'),
  -- thread: 1-enoch-8-forbidden-arts-divination
  ('enoch', '1-enoch', 8, 2, 'canon', 'deuteronomy', 18, 10, 'free', E'Deuteronomy 18:10 — *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* — Torah forbids by name the enchantments and observing-of-times that Semjâzâ and his fellows teach in 1 Enoch 8:2.'),
  ('enoch', '1-enoch', 8, 2, 'canon', 'jeremiah', 10, 2, 'free', E'Jeremiah 10:2 — *Thus saith Yahuah (LORD), Learn not the way of the heathen, and be not dismayed at the signs of heaven; for the heathen are dismayed at them.* The astrology and the signs of the sun and moon that the Watchers teach in 1 Enoch 8:2 are exactly the signs of heaven the prophet warns Yashar''el not to learn.'),
  ('enoch', '1-enoch', 8, 2, 'jubilees', 'jubilees', 8, 3, 'extras', E'Jubilees 8:3 — *And he found a writing which former (generations) had carved on the rock, and he read what was thereon, and he transcribed it and sinned owing to it; for it contained the teaching of the Watchers in accordance with which they used to observe the omens of the sun and moon and stars in all the signs of heaven.* Jubilees traces the very star-lore of 1 Enoch 8:2 to a surviving Watcher-tablet that re-corrupted men after the Flood.'),
  -- thread: 1-enoch-8-watchers-corruption-of-flesh
  ('enoch', '1-enoch', 8, 2, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The much godlessness and corruption of all ways in 1 Enoch 8:2 is the very wickedness Genesis names as the cause of the Flood.'),
  ('enoch', '1-enoch', 8, 2, 'canon', 'genesis', 6, 12, 'free', E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* The becoming-corrupt-in-all-their-ways of 1 Enoch 8:2 is Genesis''s all flesh corrupting its way.'),
  ('enoch', '1-enoch', 8, 1, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries the Watchers of 1 Enoch 8 forward by name — the rebel angels reserved in chains for judgement.'),
  ('enoch', '1-enoch', 8, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter binds the sinning angels of 1 Enoch 8 to their chains of darkness, reserved for the day of judgement.'),
  ('enoch', '1-enoch', 8, 1, 'enoch', '1-enoch', 7, 1, 'extras', E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The teaching of forbidden arts that erupts in 1 Enoch 8:1-2 began in the previous chapter with the Watchers'' defiling descent.'),
  -- thread: 1-enoch-8-cry-went-up-to-heaven
  ('enoch', '1-enoch', 8, 2, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The cry of those perishing that goes up to heaven in 1 Enoch 8:2 is the same cry of innocent blood that the LORD hears from the ground.'),
  ('enoch', '1-enoch', 8, 2, 'canon', 'exodus', 2, 23, 'free', E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* The cry going up to heaven in 1 Enoch 8:2 is the same cry of the oppressed that comes up unto Elohim and moves Him to deliver.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-8-azazel-craft-and-adornment',
       E'Azâzêl''s forbidden craft — weapons, metals, and painted eyes',
       E'Enoch names the first teacher of war and vanity: *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* (1 Enoch 8:1). This is no neutral arts-and-crafts; it is rebellion against the Creator''s order — the instruments of bloodshed and the apparatus of seduction handed down together. The Tanakh remembers the painted eye as the harlot''s mark: Jezebel *painted her face, and tired her head, and looked out at a window* (2 Kings 9:30); the prophet rebukes the city that *rentest thy face with painting* (Jeremiah 4:30); and Oholibah for whom men came when *thou didst wash thyself, paintedst thy eyes, and deckedst thyself with ornaments* (Ezekiel 23:40). The Wisdom of Solomon traces the worship of the work of hands back to this same fount, *the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life* (The Wisdom of Solomon 14:12) — the antimony, the costly stones, the colouring tinctures of Enoch 8:1 are the seedbed of that fornication. Torah stands: the abomination is the rebellion, not the metal — the same hands that could have built the tabernacle were taught instead to forge the sword.',
       sv.verse_id, ev.verse_id, 'extras', 50175
  FROM _session250_en08_lookup sv, _session250_en08_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-8-forbidden-arts-divination',
       E'Enchantments, root-cuttings, and the reading of the heavens',
       E'The roll of the Watchers'' schools is the roll of every forbidden art Torah will later forbid by name: *Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon.* (1 Enoch 8:2). The covenant draws the line straight through this list: *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* (Deuteronomy 18:10) — the enchanter and the observer of times are the disciples of Semjâzâ and the star-readers. The prophet sets the sign-reading apart from the fear of the Creator: *Thus saith Yahuah (LORD), Learn not the way of the heathen, and be not dismayed at the signs of heaven; for the heathen are dismayed at them.* (Jeremiah 10:2). And Jubilees remembers this exact lore as the Watchers'' own surviving tablet: *And he found a writing which former (generations) had carved on the rock, and he read what was thereon, and he transcribed it and sinned owing to it; for it contained the teaching of the Watchers in accordance with which they used to observe the omens of the sun and moon and stars in all the signs of heaven.* (Jubilees 8:3) — the astrology, the signs of the sun, the course of the moon of Enoch 8:2 carried down on a carved rock. It ain''t new: what Enoch names, Moses forbids and Jubilees traces.',
       sv.verse_id, ev.verse_id, 'extras', 50178
  FROM _session250_en08_lookup sv, _session250_en08_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-8-watchers-corruption-of-flesh',
       E'Much godlessness — the Watchers'' rebellion and Genesis 6',
       E'Enoch sums the fruit of the descent: *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* (1 Enoch 8:2). This is the canon''s own Genesis 6 read from the inside — the same corruption the LORD will judge in the Flood: *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* (Genesis 6:5), for *all flesh had corrupted his way upon the earth* (Genesis 6:12). The New Testament carries the Watchers forward unbroken: Jude remembers *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and Peter that *Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Enoch''s own previous chapter set the scene the apostles inherit: *And all the others together with them took unto themselves wives... and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* (1 Enoch 7:1). The seed-war — tares sown among the wheat — runs from this rebellion against the Creator''s order; the sin is the Watchers'' lawlessness, and the Flood is the judgement for breaking the covenant of creation.',
       sv.verse_id, ev.verse_id, 'extras', 50181
  FROM _session250_en08_lookup sv, _session250_en08_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-8-cry-went-up-to-heaven',
       E'And their cry went up to heaven',
       E'The chapter ends with the voice of the devoured: *And as men perished, they cried, and their cry went up to heaven.* (1 Enoch 8:2). This cry is the canon''s recurring witness that the blood of the oppressed is heard above. From the first murder: *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* (Genesis 4:10) — Abel''s blood cries from the very earth the giants defiled. And in the bondage of Egypt the same ascent: *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* (Exodus 2:23) — the cry that comes up unto Elohim is the cry that will be answered with deliverance and judgement. So here, the cry of those perishing under the Watchers'' violence rises to heaven, and the next chapters of Enoch will show the holy angels carrying that cry before the Most High. The victims, not the systems, are heard; the dismantling that follows is of the rebellion, and the gathering of the righteous is the answer to the cry.',
       sv.verse_id, ev.verse_id, 'extras', 50184
  FROM _session250_en08_lookup sv, _session250_en08_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-8-azazel-craft-and-adornment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 9:30 — *And when Jehu was come to Jezreel, Jezebel heard of it; and she painted her face, and tired her head, and looked out at a window.* The painting of the face and the beautifying of the eyelids that Azâzêl taught in 1 Enoch 8:1 becomes the mark of the harlot-queen at the window.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-azazel-craft-and-adornment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=9 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 4:30 — *And when thou art spoiled, what wilt thou do? Though thou clothest thyself with crimson, though thou deckest thee with ornaments of gold, though thou rentest thy face with painting, in vain shalt thou make thyself fair; thy lovers will despise thee, they will seek thy life.* The ornaments of gold and the painting of the face that the Watcher taught in 1 Enoch 8:1 cannot save the spoiled city.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-azazel-craft-and-adornment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 23:40 — *And furthermore, that ye have sent for men to come from far, unto whom a messenger was sent; and, lo, they came: for whom thou didst wash thyself, paintedst thy eyes, and deckedst thyself with ornaments,* — the painted eyes and the ornaments Azâzêl handed down in 1 Enoch 8:1 are here the dress of covenant-breaking adultery.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-azazel-craft-and-adornment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=23 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'The Wisdom of Solomon 14:12 — *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* The costly stones and colouring tinctures Azâzêl taught in 1 Enoch 8:1 are the very craft Wisdom names as the beginning of spiritual fornication.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-azazel-craft-and-adornment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-8-forbidden-arts-divination
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:10 — *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* — Torah forbids by name the enchantments and observing-of-times that Semjâzâ and his fellows teach in 1 Enoch 8:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-forbidden-arts-divination'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:2 — *Thus saith Yahuah (LORD), Learn not the way of the heathen, and be not dismayed at the signs of heaven; for the heathen are dismayed at them.* The astrology and the signs of the sun and moon that the Watchers teach in 1 Enoch 8:2 are exactly the signs of heaven the prophet warns Yashar''el not to learn.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-forbidden-arts-divination'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 8:3 — *And he found a writing which former (generations) had carved on the rock, and he read what was thereon, and he transcribed it and sinned owing to it; for it contained the teaching of the Watchers in accordance with which they used to observe the omens of the sun and moon and stars in all the signs of heaven.* Jubilees traces the very star-lore of 1 Enoch 8:2 to a surviving Watcher-tablet that re-corrupted men after the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-forbidden-arts-divination'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-8-watchers-corruption-of-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The much godlessness and corruption of all ways in 1 Enoch 8:2 is the very wickedness Genesis names as the cause of the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* The becoming-corrupt-in-all-their-ways of 1 Enoch 8:2 is Genesis''s all flesh corrupting its way.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries the Watchers of 1 Enoch 8 forward by name — the rebel angels reserved in chains for judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter binds the sinning angels of 1 Enoch 8 to their chains of darkness, reserved for the day of judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The teaching of forbidden arts that erupts in 1 Enoch 8:1-2 began in the previous chapter with the Watchers'' defiling descent.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-watchers-corruption-of-flesh'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-8-cry-went-up-to-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The cry of those perishing that goes up to heaven in 1 Enoch 8:2 is the same cry of innocent blood that the LORD hears from the ground.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-cry-went-up-to-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* The cry going up to heaven in 1 Enoch 8:2 is the same cry of the oppressed that comes up unto Elohim and moves Him to deliver.'
  FROM cross_reference_threads t, cross_references x, _session250_en08_lookup sv, _session250_en08_lookup tv
 WHERE t.slug='1-enoch-8-cry-went-up-to-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

