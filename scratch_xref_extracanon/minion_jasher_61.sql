-- ----- fragment: minion_jasher_61.sql (session252 jasher 61) -----
-- Source anchor: jasher/jasher ch61. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja61 (view _session252_ja61_lookup). Sort band base 56500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja61_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-61-bondage-begins
  ('jasher', 'jasher', 61, 1, 'canon', 'exodus', 1, 8, 'free', E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* Jasher''s Pharaoh who presses the sons of Jacob into building his palace is Exodus''s new king who knew not Joseph — the turn from welcome to bondage.'),
  ('jasher', 'jasher', 61, 2, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* The sons of Jacob assisting in Pharaoh''s building (Jasher 61:2) is the labor Exodus names as the taskmasters'' affliction and the store-cities.'),
  ('jasher', 'jasher', 61, 2, 'canon', 'exodus', 1, 13, 'free', E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour:* Jasher''s conscription of Jacob''s sons to build for Pharaoh (61:2) is the rigorous service Exodus records as the heart of the bondage.'),
  ('jasher', 'jasher', 61, 2, 'jubilees', 'jubilees', 46, 14, 'extras', E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees carries the identical scene — Israel pressed to build Pharaoh''s cities — confirming Jasher''s opening of the bondage. It ain''t new.'),
  -- thread: jasher-61-sons-of-jacob-die
  ('jasher', 'jasher', 61, 4, 'canon', 'exodus', 1, 6, 'free', E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Jasher''s deaths of Zebulun and Simeon (61:3-4) are the one-line passing Exodus records of Joseph and all his brethren and that whole generation.'),
  ('jasher', 'jasher', 61, 3, 'canon', 'genesis', 50, 26, 'free', E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* Zebulun put into a coffin and given to his children (Jasher 61:3) mirrors the coffin in Egypt with which Genesis closes over Joseph.'),
  ('jasher', 'jasher', 61, 3, 'canon', 'genesis', 50, 24, 'free', E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* As the fathers die in Egypt (Jasher 61:3-4), Joseph''s word of the sworn visitation stands over their coffins — the seed will be brought out.'),
  ('jasher', 'jasher', 61, 4, 'jubilees', 'jubilees', 46, 4, 'extras', E'Jubilees 46:4 — *And he died and all his brethren and all that generation.* Jubilees seals the dying generation in the same words, beside which Jasher''s death-roll of Jacob''s sons (61:3-4) takes its place. It ain''t new.'),
  -- thread: jasher-61-balaam-son-of-beor
  ('jasher', 'jasher', 61, 8, 'canon', 'numbers', 22, 5, 'free', E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* Jasher''s youthful Balaam son of Beor the diviner (61:8) is the same son of Beor Numbers will hire to curse Israel.'),
  ('jasher', 'jasher', 61, 9, 'canon', '2-peter', 2, 15, 'free', E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* Angeas hiring Balaam to conjure the battle''s outcome (Jasher 61:9) is the wages-loving way of Balaam Peter warns against.'),
  ('jasher', 'jasher', 61, 9, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The divination-for-hire Jasher shows in Balaam''s youth (61:9) is the error of Balaam for reward Jude pronounces woe upon.'),
  ('jasher', 'jasher', 61, 8, 'canon', 'numbers', 31, 8, 'free', E'Numbers 31:8 — *And they slew the kings of Midian, beside the rest of them that were slain; namely, Evi, and Rekem, and Zur, and Hur, and Reba, five kings of Midian: Balaam also the son of Beor they slew with the sword.* The sorcerer Jasher introduces (61:8) meets the end Numbers records — Balaam the son of Beor slain with the sword.'),
  -- thread: jasher-61-zepho-esau-edom
  ('jasher', 'jasher', 61, 5, 'canon', 'genesis', 36, 11, 'free', E'Genesis 36:11 — *And the sons of Eliphaz were Teman, Omar, Zepho, and Gatam, and Kenaz.* Jasher''s Zepho son of Eliphaz son of Esau (61:5) is the very Zepho Genesis lists among Eliphaz''s sons in Edom''s line.'),
  ('jasher', 'jasher', 61, 12, 'canon', 'genesis', 36, 9, 'free', E'Genesis 36:9 — *And these are the generations of Esau the father of the Edomites in mount Seir:* Zepho the son of Esau fleeing to Chittim (Jasher 61:12) belongs to the generations of Esau, the Edomite line Genesis sets apart from the chosen seed.'),
  ('jasher', 'jasher', 61, 24, 'canon', 'genesis', 10, 4, 'free', E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* The children of Chittim who make Zepho king (Jasher 61:24) are the Kittim Genesis names among Javan''s sons in the table of nations.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja61_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja61_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-61-bondage-begins',
       E'Pharaoh builds, and the sons of Jacob are pressed — the bondage begins',
       E'Jasher opens the long Egyptian night: *And it came to pass at that time Pharaoh king of Egypt commanded all his people to make for him a strong palace in Egypt* (Jasher 61:1), *And he also commanded the sons of Jacob to assist the Egyptians in the building, and the Egyptians made a beautiful and elegant palace for a royal habitation, and he dwelt in it and he renewed his government and he reigned securely* (Jasher 61:2). This is the very seam where Genesis hands off to Exodus — Joseph''s generation passing and a king rising who owns Israel''s labor. Exodus names the turn: *Now there arose up a new king over Egypt, which knew not Joseph* (Exodus 1:8), and then the affliction Jasher only begins to sketch: *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses* (Exodus 1:11), *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour:* (Exodus 1:13). It ain''t new — Jubilees tells the same conscription with the same store-cities: *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt* (Jubilees 46:14). The forced building of Pharaoh''s house is the seed-people''s affliction foretold to Abraham, the bondage that election will carry through to the visitation.',
       sv.verse_id, ev.verse_id, 'extras', 56500
  FROM _session252_ja61_lookup sv, _session252_ja61_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=61 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-61-sons-of-jacob-die',
       E'Zebulun and Simeon die in Egypt — Joseph''s generation passing',
       E'The tribal fathers begin to die in the land of their sojourn: *And Zebulun the son of Jacob died in that year, that is the seventy-second year of the going down of the Israelites to Egypt, and Zebulun died a hundred and fourteen years old, and was put into a coffin and given into the hands of his children* (Jasher 61:3), *And in the seventy-fifth year died his brother Simeon, he was a hundred and twenty years old at his death, and he was also put into a coffin and given into the hands of his children* (Jasher 61:4). The coffins given into the children''s hands echo the great coffin Genesis set down to close its book: *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt* (Genesis 50:26). Exodus seals the whole generation in a single line — *And Joseph died, and all his brethren, and all that generation* (Exodus 1:6) — and Jubilees keeps the same reckoning: *And he died and all his brethren and all that generation* (Jubilees 46:4). Yet the coffins are not the end; the dying fathers carry forward Joseph''s word of the visitation: *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob* (Genesis 50:24). The seed is kept even as its fathers are laid in Egyptian coffins.',
       sv.verse_id, ev.verse_id, 'extras', 56503
  FROM _session252_ja61_lookup sv, _session252_ja61_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=61 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-61-balaam-son-of-beor',
       E'Balaam son of Beor the sorcerer — the way of Balaam, far off in Africa',
       E'Jasher introduces a name the Torah will make infamous, here a fifteen-year-old diviner in Angeas''s court: *And amongst the servants of Angeas was a youth fifteen years old, Balaam the son of Beor was his name and the youth was very wise and understood the are of witchcraft* (Jasher 61:8), *And Angeas said to Balaam, Conjure for us, I pray you, with the witchcraft, that we may know who will prevail in this battle to which we are now proceeding* (Jasher 61:9). This is the legendary youth of the man Numbers will hire to curse Israel: *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* (Numbers 22:5). The wax-and-water divination Jasher shows is exactly the trade the apostles name as a way and a wage: *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* (2 Peter 2:15), and Jude''s woe — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* (Jude 1:11). His end is already written: *And they slew the kings of Midian, beside the rest of them that were slain; namely, Evi, and Rekem, and Zur, and Hur, and Reba, five kings of Midian: Balaam also the son of Beor they slew with the sword* (Numbers 31:8). Jasher sets the sorcerer-for-hire in the legend long before he meets the chosen seed.',
       sv.verse_id, ev.verse_id, 'extras', 56506
  FROM _session252_ja61_lookup sv, _session252_ja61_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=61 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-61-zepho-esau-edom',
       E'Zepho son of Eliphaz son of Esau — Edom''s line set apart',
       E'The chapter''s war-legend turns on a son of Esau: *And Zepho the son of Eliphaz the son of Esau, captain of the host to Angeas king of Dinhabah, was still daily enticing Angeas to prepare for battle to fight with the sons of Jacob in Egypt* (Jasher 61:5), and when his war fails he flees: *And when Zepho the son of Eliphaz saw that Angeas despaired of going forth to battle with the Egyptians, Zepho fled from Angeas from Africa, and he went and came to Chittim* (Jasher 61:12). Genesis already named this exact line — Esau, Eliphaz, and a son Zepho — when it set Edom apart from the elect: *And these are the generations of Esau the father of the Edomites in mount Seir:* (Genesis 36:9), *And the sons of Eliphaz were Teman, Omar, Zepho, and Gatam, and Kenaz* (Genesis 36:11). Jasher''s whole Zepho saga grows out of that one genealogical name. The seed-war runs underneath the legend: Esau''s children, who hated Jacob''s, carried to Chittim and Italia (Jasher 61:24) — the Kittim that Genesis lists among Javan''s sons in the table of nations: *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim* (Genesis 10:4). Election precedes the nations; Edom is set off from the chosen line even as Jasher follows its wandering captain.',
       sv.verse_id, ev.verse_id, 'extras', 56509
  FROM _session252_ja61_lookup sv, _session252_ja61_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=61 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-61-bondage-begins
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* Jasher''s Pharaoh who presses the sons of Jacob into building his palace is Exodus''s new king who knew not Joseph — the turn from welcome to bondage.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* The sons of Jacob assisting in Pharaoh''s building (Jasher 61:2) is the labor Exodus names as the taskmasters'' affliction and the store-cities.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour:* Jasher''s conscription of Jacob''s sons to build for Pharaoh (61:2) is the rigorous service Exodus records as the heart of the bondage.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees carries the identical scene — Israel pressed to build Pharaoh''s cities — confirming Jasher''s opening of the bondage. It ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-61-sons-of-jacob-die
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Jasher''s deaths of Zebulun and Simeon (61:3-4) are the one-line passing Exodus records of Joseph and all his brethren and that whole generation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-sons-of-jacob-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* Zebulun put into a coffin and given to his children (Jasher 61:3) mirrors the coffin in Egypt with which Genesis closes over Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-sons-of-jacob-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* As the fathers die in Egypt (Jasher 61:3-4), Joseph''s word of the sworn visitation stands over their coffins — the seed will be brought out.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-sons-of-jacob-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:4 — *And he died and all his brethren and all that generation.* Jubilees seals the dying generation in the same words, beside which Jasher''s death-roll of Jacob''s sons (61:3-4) takes its place. It ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-sons-of-jacob-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-61-balaam-son-of-beor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* Jasher''s youthful Balaam son of Beor the diviner (61:8) is the same son of Beor Numbers will hire to curse Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-balaam-son-of-beor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* Angeas hiring Balaam to conjure the battle''s outcome (Jasher 61:9) is the wages-loving way of Balaam Peter warns against.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-balaam-son-of-beor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The divination-for-hire Jasher shows in Balaam''s youth (61:9) is the error of Balaam for reward Jude pronounces woe upon.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-balaam-son-of-beor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 31:8 — *And they slew the kings of Midian, beside the rest of them that were slain; namely, Evi, and Rekem, and Zur, and Hur, and Reba, five kings of Midian: Balaam also the son of Beor they slew with the sword.* The sorcerer Jasher introduces (61:8) meets the end Numbers records — Balaam the son of Beor slain with the sword.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-balaam-son-of-beor'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-61-zepho-esau-edom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:11 — *And the sons of Eliphaz were Teman, Omar, Zepho, and Gatam, and Kenaz.* Jasher''s Zepho son of Eliphaz son of Esau (61:5) is the very Zepho Genesis lists among Eliphaz''s sons in Edom''s line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-zepho-esau-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:9 — *And these are the generations of Esau the father of the Edomites in mount Seir:* Zepho the son of Esau fleeing to Chittim (Jasher 61:12) belongs to the generations of Esau, the Edomite line Genesis sets apart from the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-zepho-esau-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* The children of Chittim who make Zepho king (Jasher 61:24) are the Kittim Genesis names among Javan''s sons in the table of nations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja61_lookup sv, _session252_ja61_lookup tv
 WHERE t.slug='jasher-61-zepho-esau-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=61 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

