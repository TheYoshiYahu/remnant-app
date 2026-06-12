-- ----- fragment: minion_jasher_77.sql (session252 jasher 77) -----
-- Source anchor: jasher/jasher ch77. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja77 (view _session252_ja77_lookup). Sort band base 56900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja77_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-77-increased-burden-bricks
  ('jasher', 'jasher', 77, 11, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* The canon''s taskmasters and imposed burdens are the very yoke Jasher 77:11 says Adikam strengthened with a fixed daily measure of bricks.'),
  ('jasher', 'jasher', 77, 13, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* Jasher 77:13''s daily measure of bricks ''diminish not anything'' is the same brick-and-mortar rigour Exodus names.'),
  ('jasher', 'jasher', 77, 13, 'canon', 'exodus', 5, 7, 'free', E'Exodus 5:7 — *Ye shall no more give the people straw to make brick, as heretofore: let them go and gather straw for themselves.* The Pharaoh of Exodus tightens the brick-quota exactly as Adikam does in Jasher 77:13, demanding the full tale without easing the work.'),
  ('jasher', 'jasher', 77, 11, 'jubilees', 'jubilees', 46, 14, 'extras', E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees narrates the same Egyptian taskmasters and forced building that Jasher 77:11 says Adikam intensified over Goshen.'),
  -- thread: jasher-77-cry-covenant-remembered
  ('jasher', 'jasher', 77, 23, 'canon', 'exodus', 2, 23, 'free', E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* The sighing under hard labor and the cry rising to Elohim in Jasher 77:23 is the very groan Exodus says came up to God.'),
  ('jasher', 'jasher', 77, 24, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* Jasher 77:24 names the same remembered covenant with Abraham, Isaac and Jacob, the seed kept by promise.'),
  ('jasher', 'jasher', 77, 25, 'canon', 'exodus', 2, 25, 'free', E'Exodus 2:25 — *And Elohim (God) looked upon the children of Yashar''el (Israel), and Elohim (God) had respect unto them.* God''s seeing of the burden and respect for His people matches Jasher 77:25, where Elohim sees the heavy work and determines to deliver them.'),
  ('jasher', 'jasher', 77, 25, 'canon', 'exodus', 3, 8, 'free', E'Exodus 3:8 — *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey...* The determination to deliver in Jasher 77:25 is the very ''I am come down to deliver'' the bush declares.'),
  -- thread: jasher-77-moses-midian-zipporah
  ('jasher', 'jasher', 77, 26, 'canon', 'exodus', 2, 15, 'free', E'Exodus 2:15 — *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well.* Jasher 77:26 places Moses in the house of Reuel the Midianite, the same Midian refuge Exodus says he fled to from Pharaoh''s sword.'),
  ('jasher', 'jasher', 77, 51, 'canon', 'exodus', 2, 21, 'free', E'Exodus 2:21 — *And Moses was content to dwell with the man: and he gave Moses Zipporah his daughter.* The canon''s gift of Zipporah to Moses is the very marriage Jasher 77:51 records when Reuel sees the stick in Moses'' hand.'),
  ('jasher', 'jasher', 77, 26, 'canon', 'hebrews', 11, 25, 'free', E'Hebrews 11:25 — *Choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season.* Moses imprisoned yet faithful in Jasher 77:26 embodies the faith Hebrews praises — affliction with God''s people over Pharaoh''s pleasures.'),
  ('jasher', 'jasher', 77, 26, 'jubilees', 'jubilees', 48, 1, 'extras', E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* Jubilees dates Moses'' Midian dwelling, the same sojourn in Reuel''s house Jasher 77:26 narrates.'),
  -- thread: jasher-77-stick-rod-patriarchs
  ('jasher', 'jasher', 77, 43, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Jasher 77:43 takes up this exile, saying Adam carried the stick as he went to till the ground from which he was taken.'),
  ('jasher', 'jasher', 77, 47, 'canon', 'genesis', 25, 34, 'free', E'Genesis 25:34 — *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright.* Jacob taking the staff ''by force from his brother Esau'' in Jasher 77:47 rests on the despised birthright Genesis records.'),
  ('jasher', 'jasher', 77, 47, 'canon', 'genesis', 27, 36, 'free', E'Genesis 27:36 — *And he said, Is not he rightly named Jacob? for he hath supplanted me these two times: he took away my birthright; and, behold, now he hath taken away my blessing. And he said, Hast thou not reserved a blessing for me?* Esau''s complaint that Jacob took birthright and blessing is the ''force'' by which Jasher 77:47 says the stick passed to Jacob.'),
  ('jasher', 'jasher', 77, 41, 'canon', 'exodus', 4, 20, 'free', E'Exodus 4:20 — *And Moses took his wife and his sons, and set them upon an ass, and he returned to the land of Egypt: and Moses took the rod of Elohim (God) in his hand.* The stick Moses plucks in Jasher 77:41 is the canon''s rod of Elohim he carries back to Egypt for the signs.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja77_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja77_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-77-increased-burden-bricks',
       E'Adikam strengthens the yoke — the daily measure of bricks',
       E'Jasher sets the new Pharaoh hardening the bondage: *And he placed over them a measure of bricks for them to do according to that number, day by day, and he turned back and went to Egypt.* (Jasher 77:11) — and the cruelty deepens when a deficiency is found: *Thus says Pharaoh, Do your work each day, and finish your task, and observe the daily measure of bricks; diminish not anything.* (Jasher 77:13). This is the canon''s own affliction-in-brick amplified. Exodus shows the taskmasters set over Israel — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* (Exodus 1:11) — and the bondage in mortar and brick: *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* (Exodus 1:14). The same straw-and-brick tightening returns in Exodus 5: *Ye shall no more give the people straw to make brick, as heretofore: let them go and gather straw for themselves.* (Exodus 5:7). Jubilees carries the identical scene — the taskmasters and the treasure cities — *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* (Jubilees 46:14). It ain''t new: Jasher is retelling Exodus 1 and 5, the kingdom-of-man grinding the covenant seed.',
       sv.verse_id, ev.verse_id, 'extras', 56900
  FROM _session252_ja77_lookup sv, _session252_ja77_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=77 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-77-cry-covenant-remembered',
       E'The cry ascends — Elohim remembers the covenant',
       E'Under the crushing labor the people groan and cry out, and Jasher records the turn of heaven: *But they increased the latter work more than the former, and the children of Israel sighed at this and their cry ascended to Elohim (God) on account of their labor.* (Jasher 77:23). Then the covenant is remembered — *And Elohim heard the voice of the children of Israel and their cry, in those days, and Elohim remembered to them his covenant which he had made with Abraham, Isaac and Jacob.* (Jasher 77:24) — and the deliverance is determined: *And Elohim saw the burden of the children of Israel, and their heavy work in those days, and he determined to deliver them.* (Jasher 77:25). This is Exodus 2 word for word in substance: *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* (Exodus 2:23); *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* (Exodus 2:24); *And Elohim (God) looked upon the children of Yashar''el (Israel), and Elohim (God) had respect unto them.* (Exodus 2:25). At the bush the same ''I am come down'' answers it: *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large...* (Exodus 3:8). The covenant with Abraham/Isaac/Jacob is kept — election precedes confession; the seed is remembered.',
       sv.verse_id, ev.verse_id, 'extras', 56903
  FROM _session252_ja77_lookup sv, _session252_ja77_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=77 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-77-moses-midian-zipporah',
       E'Moses in Midian — Reuel, the dungeon, and Zipporah',
       E'Jasher''s legend sets Moses long imprisoned in Reuel the Midianite''s house, kept alive in secret by Zipporah: *And Moses the son of Amram was still confined in the dungeon in those days, in the house of Reuel the Midianite, and Zipporah the daughter of Reuel did support him with food secretly day by day.* (Jasher 77:26). When he is at last released and reckoned worthy, Reuel gives him his daughter — and the wedding closes the chapter: *And when Reuel saw the stick in the hand of Moses, he wondered at it, and he gave him his daughter Zipporah for a wife.* (Jasher 77:51). The canon frame is Exodus 2: Moses flees Pharaoh and comes to Midian and to Reuel — *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well.* (Exodus 2:15); *And Moses was content to dwell with the man: and he gave Moses Zipporah his daughter.* (Exodus 2:21). Hebrews names the faith behind the flight — Moses refusing Pharaoh''s house, choosing affliction with the covenant people: *Choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season* (Hebrews 11:25). Jubilees marks the same Midian sojourn before the return: *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian...* (Jubilees 48:1). Jasher amplifies the canon''s Midian scene; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56906
  FROM _session252_ja77_lookup sv, _session252_ja77_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=77 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-77-stick-rod-patriarchs',
       E'The sapphire stick — the rod of the patriarchs bearing the Name',
       E'Jasher''s signature legend: in Reuel''s garden Moses finds a sapphire stick engraved with the Name — *And he approached the stick and he looked, and behold the name of Yahuah Elohim (the Lord God) of hosts was engraved on it, written and developed upon the stick.* (Jasher 77:40) — and only the rightful one can pluck it: *And he read it and stretched forth his hand and he plucked it like a forest tree from the thicket, and the stick was in his hand.* (Jasher 77:41). Jasher then traces the rod down the seed-line: *And when Elohim had driven Adam from the garden of Eden, he took the stick in his hand and went and tilled the ground from which he was taken.* (Jasher 77:43) — the very expulsion the canon records: *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* (Genesis 3:23). The stick passes through Noah, Shem, Abraham, Isaac, Jacob — Jacob who took the birthright from Esau: *Also when he went down to Egypt he took it into his hand and gave it to Joseph, one portion above his brethren, for Jacob had taken it by force from his brother Esau.* (Jasher 77:47). The canon knows that taking — *And he said, Is not he rightly named Jacob? for he hath supplanted me these two times: he took away my birthright; and, behold, now he hath taken away my blessing...* (Genesis 27:36). And the rod that ends in Moses'' hand is the canon''s rod of Elohim: *And Moses took his wife and his sons, and set them upon an ass, and he returned to the land of Egypt: and Moses took the rod of Elohim (God) in his hand.* (Exodus 4:20). Election runs through the staff — the chosen seed kept Adam to Moses.',
       sv.verse_id, ev.verse_id, 'extras', 56909
  FROM _session252_ja77_lookup sv, _session252_ja77_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=39
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=77 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-77-increased-burden-bricks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* The canon''s taskmasters and imposed burdens are the very yoke Jasher 77:11 says Adikam strengthened with a fixed daily measure of bricks.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-increased-burden-bricks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* Jasher 77:13''s daily measure of bricks ''diminish not anything'' is the same brick-and-mortar rigour Exodus names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-increased-burden-bricks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 5:7 — *Ye shall no more give the people straw to make brick, as heretofore: let them go and gather straw for themselves.* The Pharaoh of Exodus tightens the brick-quota exactly as Adikam does in Jasher 77:13, demanding the full tale without easing the work.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-increased-burden-bricks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees narrates the same Egyptian taskmasters and forced building that Jasher 77:11 says Adikam intensified over Goshen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-increased-burden-bricks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-77-cry-covenant-remembered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:23 — *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* The sighing under hard labor and the cry rising to Elohim in Jasher 77:23 is the very groan Exodus says came up to God.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-cry-covenant-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* Jasher 77:24 names the same remembered covenant with Abraham, Isaac and Jacob, the seed kept by promise.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-cry-covenant-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:25 — *And Elohim (God) looked upon the children of Yashar''el (Israel), and Elohim (God) had respect unto them.* God''s seeing of the burden and respect for His people matches Jasher 77:25, where Elohim sees the heavy work and determines to deliver them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-cry-covenant-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 3:8 — *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey...* The determination to deliver in Jasher 77:25 is the very ''I am come down to deliver'' the bush declares.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-cry-covenant-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-77-moses-midian-zipporah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:15 — *Now when Pharaoh heard this thing, he sought to slay Moses. But Moses fled from the face of Pharaoh, and dwelt in the land of Midian: and he sat down by a well.* Jasher 77:26 places Moses in the house of Reuel the Midianite, the same Midian refuge Exodus says he fled to from Pharaoh''s sword.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-moses-midian-zipporah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:21 — *And Moses was content to dwell with the man: and he gave Moses Zipporah his daughter.* The canon''s gift of Zipporah to Moses is the very marriage Jasher 77:51 records when Reuel sees the stick in Moses'' hand.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-moses-midian-zipporah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:25 — *Choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season.* Moses imprisoned yet faithful in Jasher 77:26 embodies the faith Hebrews praises — affliction with God''s people over Pharaoh''s pleasures.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-moses-midian-zipporah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* Jubilees dates Moses'' Midian dwelling, the same sojourn in Reuel''s house Jasher 77:26 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-moses-midian-zipporah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=26
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-77-stick-rod-patriarchs
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Jasher 77:43 takes up this exile, saying Adam carried the stick as he went to till the ground from which he was taken.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-stick-rod-patriarchs'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:34 — *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright.* Jacob taking the staff ''by force from his brother Esau'' in Jasher 77:47 rests on the despised birthright Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-stick-rod-patriarchs'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 27:36 — *And he said, Is not he rightly named Jacob? for he hath supplanted me these two times: he took away my birthright; and, behold, now he hath taken away my blessing. And he said, Hast thou not reserved a blessing for me?* Esau''s complaint that Jacob took birthright and blessing is the ''force'' by which Jasher 77:47 says the stick passed to Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-stick-rod-patriarchs'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 4:20 — *And Moses took his wife and his sons, and set them upon an ass, and he returned to the land of Egypt: and Moses took the rod of Elohim (God) in his hand.* The stick Moses plucks in Jasher 77:41 is the canon''s rod of Elohim he carries back to Egypt for the signs.'
  FROM cross_reference_threads t, cross_references x, _session252_ja77_lookup sv, _session252_ja77_lookup tv
 WHERE t.slug='jasher-77-stick-rod-patriarchs'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=77 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

