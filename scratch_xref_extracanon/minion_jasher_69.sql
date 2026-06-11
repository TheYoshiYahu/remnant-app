-- ----- fragment: minion_jasher_69.sql (session252 jasher 69) -----
-- Source anchor: jasher/jasher ch69. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja69 (view _session252_ja69_lookup). Sort band base 56700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja69_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-69-saul-of-edom
  ('jasher', 'jasher', 69, 2, 'canon', 'genesis', 36, 37, 'free', E'Genesis 36:37 — *And Samlah died, and Saul of Rehoboth by the river reigned in his stead.* The Torah''s Edomite king-list names the same Saul-by-the-river succeeding the same Samlah that Jasher 69:2 records.'),
  ('jasher', 'jasher', 69, 1, 'canon', 'genesis', 36, 31, 'free', E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* The dying king of Edom in Jasher 69:1 belongs to this very dynasty of Esau, kings already enthroned while Israel had none.'),
  -- thread: jasher-69-seed-still-multiplies
  ('jasher', 'jasher', 69, 4, 'canon', 'exodus', 1, 7, 'free', E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The fruitful, multiplying, increasing seed of Jasher 69:4 is Exodus'' own word for the nation Pharaoh''s counsel could not check.'),
  ('jasher', 'jasher', 69, 4, 'canon', 'exodus', 1, 12, 'free', E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* This is exactly why Pharaoh''s counsel ''did not succeed'' in Jasher 69:4 — affliction only multiplied the seed.'),
  ('jasher', 'jasher', 69, 4, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The bondage Pharaoh is deepening in Jasher 69:4 is the very affliction the LORD foretold to Abraham.'),
  ('jasher', 'jasher', 69, 4, 'canon', 'acts', 7, 17, 'free', E'Acts 7:17 — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt,* Stephen names the same growing, multiplying people of Jasher 69:4 as the promise to Abraham drawing near.'),
  ('jasher', 'jasher', 69, 4, 'jubilees', 'jubilees', 46, 1, 'extras', E'Jubilees 46:1 — *And it came to pass that after Jacob died the children of Yashar''el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* Jubilees records the same multiplying nation in Egypt that Jasher 69:4 says Pharaoh''s counsel could not stop.'),
  -- thread: jasher-69-rigour-of-bondage
  ('jasher', 'jasher', 69, 7, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The mortar-and-brick labor strengthened upon Israel in Jasher 69:7 is the very ''morter, and brick... with rigour'' of the Exodus bondage.'),
  ('jasher', 'jasher', 69, 5, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* Pharaoh''s daily-labor proclamation in Jasher 69:5 is the taskmaster-burden of the Exodus building decree.'),
  ('jasher', 'jasher', 69, 6, 'canon', 'exodus', 5, 8, 'free', E'Exodus 5:8 — *And the tale of the bricks, which they did make heretofore, ye shall lay upon them; ye shall not diminish ought thereof: for they be idle; therefore they cry, saying, Let us go and sacrifice to our Elohim (God).* Pharaoh''s ''no man shall diminish'' brick-quota in Jasher 69:6 matches the unyielding ''ye shall not diminish ought'' brick decree of Exodus.'),
  ('jasher', 'jasher', 69, 7, 'canon', 'acts', 7, 19, 'free', E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* The taking of the youngest sons by force in Jasher 69:7 is the same evil-entreating of Israel''s young children Stephen recounts.'),
  ('jasher', 'jasher', 69, 5, 'jubilees', 'jubilees', 46, 15, 'extras', E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* Jubilees gives the same rigorous bondage Jasher 69:5 decrees, with the same paradox — the seed multiplies under the lash.'),
  -- thread: jasher-69-taskmasters-and-counsel
  ('jasher', 'jasher', 69, 8, 'canon', 'exodus', 1, 8, 'free', E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The Egypt that grinds Israel day by day in Jasher 69:8 is the realm of the new king who knew not Joseph.'),
  ('jasher', 'jasher', 69, 8, 'canon', 'exodus', 1, 10, 'free', E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* The relentless daily labor of Jasher 69:8 is the outworking of Pharaoh''s ''deal wisely with them'' counsel against the multiplying seed.'),
  ('jasher', 'jasher', 69, 8, 'canon', 'acts', 7, 18, 'free', E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen marks the same regime change behind the unending bondage of Jasher 69:8.'),
  ('jasher', 'jasher', 69, 8, 'jubilees', 'jubilees', 46, 14, 'extras', E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees names the taskmasters and Pharaoh''s building-cities behind the long, daily Egyptian labor of Jasher 69:8.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja69_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja69_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-69-saul-of-edom',
       E'Saul reigns over Edom in Samlah''s place',
       E'Jasher follows the kings of Esau: *And the king of Edom died in those days, in the eighteenth year of his reign, and was buried in his temple which he had built for himself as his royal residence in the land of Edom.* (Jasher 69:1) *And the children of Esau sent to Pethor, which is upon the river, and they fetched from there a young man of beautiful eyes and comely aspect, whose name was Saul, and they made him king over them in the place of Samlah.* (Jasher 69:2) This is no invention — it is the very succession Moses set down in the Edomite king-list. The Torah names the same man stepping into the same throne: *And Samlah died, and Saul of Rehoboth by the river reigned in his stead.* (Genesis 36:37) Jasher''s ''Pethor upon the river'' is Genesis'' ''Rehoboth by the river''; the kingdom of Esau/Edom runs on, the line the LORD said He had hated set against the chosen seed (Malachi 1:2-3), while Israel groans in Egypt. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56700
  FROM _session252_ja69_lookup sv, _session252_ja69_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=69 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-69-seed-still-multiplies',
       E'The counsel fails — the seed still multiplies',
       E'*And when Pharaoh king of Egypt saw that the counsel which Balaam had advised respecting the children of Israel did not succeed, but that still they were fruitful, multiplied and increased throughout the land of Egypt,* (Jasher 69:4) Jasher only retells what Exodus already declares: the kingdom of man schemes against the chosen seed and the seed grows anyway. *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* (Exodus 1:7) Pharaoh''s whole ''wise'' design was to halt that increase — *Come on, let us deal wisely with them; lest they multiply* (Exodus 1:10) — yet *the more they afflicted them, the more they multiplied and grew.* (Exodus 1:12) This is the bondage foretold to Abraham long before: *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* (Genesis 15:13). Stephen tells it the same way — the promise drawing near, the people growing (Acts 7:17). Jubilees too: the children of Israel a great nation in Egypt (Jubilees 46:1). The kingdom of man cannot extinguish the covenant seed. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56703
  FROM _session252_ja69_lookup sv, _session252_ja69_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=69 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-69-rigour-of-bondage',
       E'The brick and mortar rigour — the bondage deepens',
       E'Jasher details the cruelty of the decree: *Then Pharaoh commanded in those days that a proclamation should be issued throughout Egypt to the children of Israel, saying, No man shall diminish any thing of his daily labor.* (Jasher 69:5) *And the man who shall be found deficient in his labor which he performs daily, whether in mortar or in bricks, then his youngest son shall be put in their place.* (Jasher 69:6) *And the labor of Egypt strengthened upon the children of Israel in those days, and behold if one brick was deficient in any man''s daily labor, the Egyptians took his youngest boy by force from his mother, and put him into the building in the place of the brick which his father had left wanting.* (Jasher 69:7) This is the very rigour Exodus names: *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* (Exodus 1:11), and *they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* (Exodus 1:14). Pharaoh''s brick-quota decree is the same as the later straw decree: *And the tale of the bricks, which they did make heretofore, ye shall lay upon them; ye shall not diminish ought thereof* (Exodus 5:8). Jubilees tells it word for word: *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* (Jubilees 46:15). The kingdom of man grinds the chosen seed in mortar and brick — and the seed only grows. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56706
  FROM _session252_ja69_lookup sv, _session252_ja69_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=69 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-69-taskmasters-and-counsel',
       E'The new king''s counsel and the taskmasters',
       E'Behind Jasher''s brick-decree stands the older scene Jasher and Exodus share — a king who knew not Joseph taking ''wise'' counsel against the seed. Jasher shows the labor falling ''day by day, all the days for a long period'': *And the men of Egypt did so to all the children of Israel day by day, all the days for a long period.* (Jasher 69:8) Exodus names the new king and his fear: *Now there arose up a new king over Egypt, which knew not Joseph.* (Exodus 1:8) and *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* (Exodus 1:10). Stephen marks the same turn: *Till another king arose, which knew not Joseph.* (Acts 7:18). Jubilees records the same wicked device and the same taskmasters: *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* (Jubilees 46:14). Pharaoh is the kingdom-of-man pattern — Nimrod, Herod, the dragon — scheming against the chosen child-people. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56709
  FROM _session252_ja69_lookup sv, _session252_ja69_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=69 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-69-saul-of-edom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:37 — *And Samlah died, and Saul of Rehoboth by the river reigned in his stead.* The Torah''s Edomite king-list names the same Saul-by-the-river succeeding the same Samlah that Jasher 69:2 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-saul-of-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* The dying king of Edom in Jasher 69:1 belongs to this very dynasty of Esau, kings already enthroned while Israel had none.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-saul-of-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-69-seed-still-multiplies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The fruitful, multiplying, increasing seed of Jasher 69:4 is Exodus'' own word for the nation Pharaoh''s counsel could not check.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-seed-still-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* This is exactly why Pharaoh''s counsel ''did not succeed'' in Jasher 69:4 — affliction only multiplied the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-seed-still-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The bondage Pharaoh is deepening in Jasher 69:4 is the very affliction the LORD foretold to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-seed-still-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:17 — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt,* Stephen names the same growing, multiplying people of Jasher 69:4 as the promise to Abraham drawing near.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-seed-still-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 46:1 — *And it came to pass that after Jacob died the children of Yashar''el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* Jubilees records the same multiplying nation in Egypt that Jasher 69:4 says Pharaoh''s counsel could not stop.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-seed-still-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-69-rigour-of-bondage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The mortar-and-brick labor strengthened upon Israel in Jasher 69:7 is the very ''morter, and brick... with rigour'' of the Exodus bondage.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-rigour-of-bondage'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* Pharaoh''s daily-labor proclamation in Jasher 69:5 is the taskmaster-burden of the Exodus building decree.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-rigour-of-bondage'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 5:8 — *And the tale of the bricks, which they did make heretofore, ye shall lay upon them; ye shall not diminish ought thereof: for they be idle; therefore they cry, saying, Let us go and sacrifice to our Elohim (God).* Pharaoh''s ''no man shall diminish'' brick-quota in Jasher 69:6 matches the unyielding ''ye shall not diminish ought'' brick decree of Exodus.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-rigour-of-bondage'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* The taking of the youngest sons by force in Jasher 69:7 is the same evil-entreating of Israel''s young children Stephen recounts.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-rigour-of-bondage'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* Jubilees gives the same rigorous bondage Jasher 69:5 decrees, with the same paradox — the seed multiplies under the lash.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-rigour-of-bondage'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-69-taskmasters-and-counsel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The Egypt that grinds Israel day by day in Jasher 69:8 is the realm of the new king who knew not Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-taskmasters-and-counsel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* The relentless daily labor of Jasher 69:8 is the outworking of Pharaoh''s ''deal wisely with them'' counsel against the multiplying seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-taskmasters-and-counsel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen marks the same regime change behind the unending bondage of Jasher 69:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-taskmasters-and-counsel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees names the taskmasters and Pharaoh''s building-cities behind the long, daily Egyptian labor of Jasher 69:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja69_lookup sv, _session252_ja69_lookup tv
 WHERE t.slug='jasher-69-taskmasters-and-counsel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=69 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

