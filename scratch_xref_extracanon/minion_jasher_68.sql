-- ----- fragment: minion_jasher_68.sql (session252 jasher 68) -----
-- Source anchor: jasher/jasher ch68. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja68 (view _session252_ja68_lookup). Sort band base 56675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja68_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-68-pharaoh-casts-into-river
  ('jasher', 'jasher', 68, 11, 'canon', 'exodus', 1, 22, 'free', E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* The canon edict that Jasher 68:11 dramatizes as Pharaoh''s officers hunting the Hebrew infants house by house.'),
  ('jasher', 'jasher', 68, 6, 'canon', 'acts', 7, 19, 'free', E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen''s summary of the very conspiracy Jasher 68:6 records, the Egyptians plotting to destroy all the Hebrews.'),
  ('jasher', 'jasher', 68, 6, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The affliction Yahuah foretold to Abraham, now come upon his seed in the bondage Jasher 68 deepens.'),
  ('jasher', 'jasher', 68, 11, 'jubilees', 'jubilees', 47, 2, 'extras', E'Jubilees 47:2 — *And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river.* The Jubilees apparatus carries the identical decree behind Jasher 68:11.'),
  ('jasher', 'jasher', 68, 11, 'canon', 'revelation', 12, 4, 'free', E'Revelation 12:4 — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* Pharaoh''s slaughter of the male children in Jasher 68:11 is the same kingdom-of-man pattern: the serpent waiting to devour the chosen seed at birth.'),
  -- thread: jasher-68-birth-of-moses-goodly-child
  ('jasher', 'jasher', 68, 5, 'canon', 'exodus', 2, 2, 'free', E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* The canon source Jasher 68:5 retells, the mother seeing the child good and hiding him three months.'),
  ('jasher', 'jasher', 68, 4, 'canon', 'acts', 7, 20, 'free', E'Acts 7:20 — *In which time Moses was born, and was exceeding fair, and nourished up in his father''s house three months:* Stephen''s witness to the birth and the three months that Jasher 68:4-5 narrates.'),
  ('jasher', 'jasher', 68, 5, 'canon', 'hebrews', 11, 23, 'free', E'Hebrews 11:23 — *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* The hiding in Jasher 68:5 read as faith — the parents unafraid of Pharaoh''s edict.'),
  ('jasher', 'jasher', 68, 5, 'jubilees', 'jubilees', 47, 3, 'extras', E'Jubilees 47:3 — *And they cast them in for seven months until the day that you were born. And your mother hid you for three months, and they told regarding her.* The Jubilees parallel keeps the same seven-month bondage of casting-in and the three-month hiding behind Jasher 68:5.'),
  -- thread: jasher-68-ark-of-bulrushes
  ('jasher', 'jasher', 68, 13, 'canon', 'exodus', 2, 3, 'free', E'Exodus 2:3 — *And when she could not longer hide him, she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child therein; and she laid it in the flags by the river''s brink.* The canon ark Jasher 68:13 retells almost verbatim, slime and pitch and the flags by the river.'),
  ('jasher', 'jasher', 68, 14, 'canon', 'exodus', 2, 4, 'free', E'Exodus 2:4 — *And his sister stood afar off, to wit what would be done to him.* The watching Miriam of Jasher 68:14 is the sister standing afar off in the canon scene.'),
  ('jasher', 'jasher', 68, 13, 'jubilees', 'jubilees', 47, 4, 'extras', E'Jubilees 47:4 — *And she made an ark for you, and covered it with pitch and asphalt, and placed it in the flags on the bank of the river, and she placed you in it seven days, and your mother came by night and suckled you, and by day Miriam, your sister, guarded you from the birds.* The Jubilees ark and watching Miriam set beside Jasher 68:13-14.'),
  -- thread: jasher-68-drawn-out-by-pharaohs-daughter
  ('jasher', 'jasher', 68, 18, 'canon', 'exodus', 2, 5, 'free', E'Exodus 2:5 — *And the daughter of Pharaoh came down to wash herself at the river; and her maidens walked along by the river''s side; and when she saw the ark among the flags, she sent her maid to fetch it.* The canon scene of Pharaoh''s daughter sending her maid for the ark, retold in Jasher 68:18.'),
  ('jasher', 'jasher', 68, 19, 'canon', 'exodus', 2, 6, 'free', E'Exodus 2:6 — *And when she had opened it, she saw the child: and, behold, the babe wept. And she had compassion on him, and said, This is one of the Hebrews'' children.* Jasher 68:19 carries the same weeping babe, the same compassion, the same words ''one of the Hebrew children.'''),
  ('jasher', 'jasher', 68, 21, 'canon', 'exodus', 2, 7, 'free', E'Exodus 2:7 — *Then said his sister to Pharaoh''s daughter, Shall I go and call to thee a nurse of the Hebrew women, that she may nurse the child for thee?* The sister''s offer in Jasher 68:21 is the canon''s word for word.'),
  ('jasher', 'jasher', 68, 18, 'jubilees', 'jubilees', 47, 5, 'extras', E'Jubilees 47:5 — *And in those days Tharmuth, the daughter of Pharaoh, came to bathe in the river, and she heard your voice crying, and she told her maidens to bring you forth, and they brought you to her.* The Jubilees apparatus names Pharaoh''s daughter coming to bathe and lifting the crying child, parallel to Jasher 68:18-19.'),
  ('jasher', 'jasher', 68, 23, 'canon', 'exodus', 2, 9, 'free', E'Exodus 2:9 — *And Pharaoh''s daughter said unto her, Take this child away, and nurse it for me, and I will give thee thy wages. And the woman took the child, and nursed it.* The wages-for-nursing of Jasher 68:23 (''two bits of silver daily'') is the canon''s commission of the child''s own mother.'),
  -- thread: jasher-68-named-moses-grew-in-pharaohs-house
  ('jasher', 'jasher', 68, 24, 'canon', 'exodus', 2, 10, 'free', E'Exodus 2:10 — *And the child grew, and she brought him unto Pharaoh''s daughter, and he became her son. And she called his name Moses: and she said, Because I drew him out of the water.* The naming in Jasher 68:24 is the canon''s own, the same ''drew him out of the water.'''),
  ('jasher', 'jasher', 68, 32, 'canon', 'acts', 7, 21, 'free', E'Acts 7:21 — *And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son.* Stephen''s witness that Pharaoh''s daughter raised the cast-out child as her own, matching Jasher 68:32.'),
  ('jasher', 'jasher', 68, 32, 'canon', 'acts', 7, 22, 'free', E'Acts 7:22 — *And Moses was learned in all the wisdom of the Egyptians, and was mighty in words and in deeds.* The Egyptian rearing of Jasher 68:32, Moses grown amongst the king''s children, becomes Stephen''s ''learned in all the wisdom of the Egyptians.'''),
  ('jasher', 'jasher', 68, 24, 'jubilees', 'jubilees', 47, 9, 'extras', E'Jubilees 47:9 — *And afterwards, when you were grown up, they brought you to the daughter of Pharaoh, and you did become her son, and Amram your father taught you writing, and after you had completed three weeks they brought you into the royal court.* The Jubilees parallel to Jasher 68:24, the grown child made the daughter''s son and brought into Pharaoh''s court.'),
  ('jasher', 'jasher', 68, 32, 'canon', 'matthew', 2, 16, 'free', E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* As Moses grows safe in Pharaoh''s house (Jasher 68:32) while the king slays the male children, so Herod''s slaughter repeats the pattern — the kingdom-of-man hunts the chosen child while the true deliverer is preserved.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja68_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja68_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-68-pharaoh-casts-into-river',
       E'Every son into the river — the kingdom-of-man hunts the chosen child',
       E'Jasher shows the bondage at its deepest, the Egyptians hunting the Hebrew infants house by house: *In those days the Egyptians conspired to destroy all the Hebrews there.* (Jasher 68:6) and *And Pharaoh sent his officers to take the children and slay them; thus did the Egyptians to the Hebrew women all the days.* (Jasher 68:11). This is the canon''s own edict retold — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* (Exodus 1:22). Stephen names the same king and his cruelty: *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* (Acts 7:19). It was the affliction foretold to Abraham — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* (Genesis 15:13). Jubilees carries the identical command: *And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river.* (Jubilees 47:2). It ain''t new — Pharaoh, like Nimrod and later Herod and the dragon, is the kingdom-of-man seeking to devour the chosen child the moment he is born.',
       sv.verse_id, ev.verse_id, 'extras', 56675
  FROM _session252_ja68_lookup sv, _session252_ja68_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=68 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-68-birth-of-moses-goodly-child',
       E'A son born, the house filled with light — hid three months',
       E'Jasher tells the birth: *And at the end of seven months from her conception she brought forth a son, and the whole house was filled with great light as of the light of the sun and moon at the time of their shining.* (Jasher 68:4) and *And when the woman saw the child that it was good and pleasing to the sight, she hid it for three months in an inner room.* (Jasher 68:5). The canon''s own words stand beside it — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* (Exodus 2:2). Stephen: *In which time Moses was born, and was exceeding fair, and nourished up in his father''s house three months:* (Acts 7:20). And it was an act of faith, not of fear — *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* (Hebrews 11:23). Jubilees keeps the same three months: *And they cast them in for seven months until the day that you were born. And your mother hid you for three months, and they told regarding her.* (Jubilees 47:3). It ain''t new — the deliverer is preserved by the faith of his parents against the king''s commandment.',
       sv.verse_id, ev.verse_id, 'extras', 56678
  FROM _session252_ja68_lookup sv, _session252_ja68_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=68 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-68-ark-of-bulrushes',
       E'The ark of bulrushes — the deliverer set in the river',
       E'Jasher records the ark: *And the woman hastened to take away her son before the officers came, and she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child in it, and she laid it in the flags by the river''s brink.* (Jasher 68:13) and the watching sister *And his sister Miriam stood afar off to know what would be done to him, and what would become of her words.* (Jasher 68:14). This is Exodus quoted nearly word for word — *And when she could not longer hide him, she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child therein; and she laid it in the flags by the river''s brink.* (Exodus 2:3) and *And his sister stood afar off, to wit what would be done to him.* (Exodus 2:4). Jubilees keeps the same ark and the same watching sister: *And she made an ark for you, and covered it with pitch and asphalt, and placed it in the flags on the bank of the river, and she placed you in it seven days, and your mother came by night and suckled you, and by day Miriam, your sister, guarded you from the birds.* (Jubilees 47:4). It ain''t new — the chosen seed is sealed in pitch and committed to the water, kept alive against the kingdom that would drown him.',
       sv.verse_id, ev.verse_id, 'extras', 56681
  FROM _session252_ja68_lookup sv, _session252_ja68_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=68 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-68-drawn-out-by-pharaohs-daughter',
       E'Drawn out of the water — Pharaoh''s daughter and the Hebrew nurse',
       E'Jasher tells the drawing-out: *And Bathia lifted up her eyes to the river, and she saw the ark upon the water, and sent her maid to fetch it.* (Jasher 68:18), *And she opened it and saw the child, and behold the babe wept, and she had compassion on him, and she said, This is one of the Hebrew children.* (Jasher 68:19), and the sister''s offer *And Miriam his sister was at that time amongst the Egyptian women at the river side, and she saw this thing and she said to Pharaoh''s daughter, Shall I go and fetch a nurse of the Hebrew women, that she may nurse the child for you?* (Jasher 68:21). The canon stands beside it — *And the daughter of Pharaoh came down to wash herself at the river; and her maidens walked along by the river''s side; and when she saw the ark among the flags, she sent her maid to fetch it.* (Exodus 2:5) and *And when she had opened it, she saw the child: and, behold, the babe wept. And she had compassion on him, and said, This is one of the Hebrews'' children.* (Exodus 2:6). Jubilees: *And in those days Tharmuth, the daughter of Pharaoh, came to bathe in the river, and she heard your voice crying, and she told her maidens to bring you forth, and they brought you to her.* (Jubilees 47:5). It ain''t new — the very house that decreed his death draws the deliverer out and pays his own mother to nurse him.',
       sv.verse_id, ev.verse_id, 'extras', 56684
  FROM _session252_ja68_lookup sv, _session252_ja68_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=68 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-68-named-moses-grew-in-pharaohs-house',
       E'She called his name Moses — the deliverer grown in Pharaoh''s house',
       E'Jasher gives the naming and the upbringing: *And at the end of two years, when the child grew up, she brought him to the daughter of Pharaoh, and he was to her as a son, and she called his name Moses, for she said, Because I drew him out of the water.* (Jasher 68:24) and *And Moses was in Pharaoh''s house, and was to Bathia, Pharaoh''s daughter, as a son, and Moses grew up amongst the king''s children.* (Jasher 68:32). The canon names him in the same words — *And the child grew, and she brought him unto Pharaoh''s daughter, and he became her son. And she called his name Moses: and she said, Because I drew him out of the water.* (Exodus 2:10). Stephen on his Egyptian rearing: *And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son.* (Acts 7:21) and *And Moses was learned in all the wisdom of the Egyptians, and was mighty in words and in deeds.* (Acts 7:22). Jubilees keeps the household: *And afterwards, when you were grown up, they brought you to the daughter of Pharaoh, and you did become her son, and Amram your father taught you writing, and after you had completed three weeks they brought you into the royal court.* (Jubilees 47:9). It ain''t new — the deliverer is preserved and raised in the very court of the kingdom-of-man, drawn out of the water that was meant to drown him.',
       sv.verse_id, ev.verse_id, 'extras', 56687
  FROM _session252_ja68_lookup sv, _session252_ja68_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=68 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-68-pharaoh-casts-into-river
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* The canon edict that Jasher 68:11 dramatizes as Pharaoh''s officers hunting the Hebrew infants house by house.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-pharaoh-casts-into-river'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen''s summary of the very conspiracy Jasher 68:6 records, the Egyptians plotting to destroy all the Hebrews.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-pharaoh-casts-into-river'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The affliction Yahuah foretold to Abraham, now come upon his seed in the bondage Jasher 68 deepens.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-pharaoh-casts-into-river'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 47:2 — *And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river.* The Jubilees apparatus carries the identical decree behind Jasher 68:11.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-pharaoh-casts-into-river'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 12:4 — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* Pharaoh''s slaughter of the male children in Jasher 68:11 is the same kingdom-of-man pattern: the serpent waiting to devour the chosen seed at birth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-pharaoh-casts-into-river'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-68-birth-of-moses-goodly-child
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* The canon source Jasher 68:5 retells, the mother seeing the child good and hiding him three months.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-birth-of-moses-goodly-child'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:20 — *In which time Moses was born, and was exceeding fair, and nourished up in his father''s house three months:* Stephen''s witness to the birth and the three months that Jasher 68:4-5 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-birth-of-moses-goodly-child'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:23 — *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* The hiding in Jasher 68:5 read as faith — the parents unafraid of Pharaoh''s edict.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-birth-of-moses-goodly-child'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 47:3 — *And they cast them in for seven months until the day that you were born. And your mother hid you for three months, and they told regarding her.* The Jubilees parallel keeps the same seven-month bondage of casting-in and the three-month hiding behind Jasher 68:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-birth-of-moses-goodly-child'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-68-ark-of-bulrushes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:3 — *And when she could not longer hide him, she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child therein; and she laid it in the flags by the river''s brink.* The canon ark Jasher 68:13 retells almost verbatim, slime and pitch and the flags by the river.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-ark-of-bulrushes'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:4 — *And his sister stood afar off, to wit what would be done to him.* The watching Miriam of Jasher 68:14 is the sister standing afar off in the canon scene.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-ark-of-bulrushes'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 47:4 — *And she made an ark for you, and covered it with pitch and asphalt, and placed it in the flags on the bank of the river, and she placed you in it seven days, and your mother came by night and suckled you, and by day Miriam, your sister, guarded you from the birds.* The Jubilees ark and watching Miriam set beside Jasher 68:13-14.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-ark-of-bulrushes'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-68-drawn-out-by-pharaohs-daughter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:5 — *And the daughter of Pharaoh came down to wash herself at the river; and her maidens walked along by the river''s side; and when she saw the ark among the flags, she sent her maid to fetch it.* The canon scene of Pharaoh''s daughter sending her maid for the ark, retold in Jasher 68:18.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-drawn-out-by-pharaohs-daughter'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:6 — *And when she had opened it, she saw the child: and, behold, the babe wept. And she had compassion on him, and said, This is one of the Hebrews'' children.* Jasher 68:19 carries the same weeping babe, the same compassion, the same words ''one of the Hebrew children.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-drawn-out-by-pharaohs-daughter'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:7 — *Then said his sister to Pharaoh''s daughter, Shall I go and call to thee a nurse of the Hebrew women, that she may nurse the child for thee?* The sister''s offer in Jasher 68:21 is the canon''s word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-drawn-out-by-pharaohs-daughter'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 47:5 — *And in those days Tharmuth, the daughter of Pharaoh, came to bathe in the river, and she heard your voice crying, and she told her maidens to bring you forth, and they brought you to her.* The Jubilees apparatus names Pharaoh''s daughter coming to bathe and lifting the crying child, parallel to Jasher 68:18-19.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-drawn-out-by-pharaohs-daughter'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 2:9 — *And Pharaoh''s daughter said unto her, Take this child away, and nurse it for me, and I will give thee thy wages. And the woman took the child, and nursed it.* The wages-for-nursing of Jasher 68:23 (''two bits of silver daily'') is the canon''s commission of the child''s own mother.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-drawn-out-by-pharaohs-daughter'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-68-named-moses-grew-in-pharaohs-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:10 — *And the child grew, and she brought him unto Pharaoh''s daughter, and he became her son. And she called his name Moses: and she said, Because I drew him out of the water.* The naming in Jasher 68:24 is the canon''s own, the same ''drew him out of the water.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-named-moses-grew-in-pharaohs-house'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:21 — *And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son.* Stephen''s witness that Pharaoh''s daughter raised the cast-out child as her own, matching Jasher 68:32.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-named-moses-grew-in-pharaohs-house'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:22 — *And Moses was learned in all the wisdom of the Egyptians, and was mighty in words and in deeds.* The Egyptian rearing of Jasher 68:32, Moses grown amongst the king''s children, becomes Stephen''s ''learned in all the wisdom of the Egyptians.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-named-moses-grew-in-pharaohs-house'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 47:9 — *And afterwards, when you were grown up, they brought you to the daughter of Pharaoh, and you did become her son, and Amram your father taught you writing, and after you had completed three weeks they brought you into the royal court.* The Jubilees parallel to Jasher 68:24, the grown child made the daughter''s son and brought into Pharaoh''s court.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-named-moses-grew-in-pharaohs-house'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=24
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* As Moses grows safe in Pharaoh''s house (Jasher 68:32) while the king slays the male children, so Herod''s slaughter repeats the pattern — the kingdom-of-man hunts the chosen child while the true deliverer is preserved.'
  FROM cross_reference_threads t, cross_references x, _session252_ja68_lookup sv, _session252_ja68_lookup tv
 WHERE t.slug='jasher-68-named-moses-grew-in-pharaohs-house'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=68 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

