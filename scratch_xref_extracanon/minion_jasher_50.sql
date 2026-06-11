-- ----- fragment: minion_jasher_50.sql (session252 jasher 50) -----
-- Source anchor: jasher/jasher ch50. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja50 (view _session252_ja50_lookup). Sort band base 56225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja50_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-50-corn-laid-up
  ('jasher', 'jasher', 50, 7, 'canon', 'genesis', 41, 29, 'free', E'Genesis 41:29 — *Behold, there come seven years of great plenty throughout all the land of Egypt:* the seven plenteous years Jasher 50:7 says Yahuah gave throughout the land are Joseph''s interpreted dream in Genesis.'),
  ('jasher', 'jasher', 50, 8, 'canon', 'genesis', 41, 35, 'free', E'Genesis 41:35 — *And let them gather all the food of those good years that come, and lay up corn under the hand of Pharaoh, and let them keep food in the cities.* Joseph''s officers collecting and heaping the corn year by year in Jasher 50:8 is Joseph''s own counsel to Pharaoh in Genesis.'),
  ('jasher', 'jasher', 50, 10, 'canon', 'genesis', 41, 49, 'free', E'Genesis 41:49 — *And Joseph gathered corn as the sand of the sea, very much, until he left numbering; for it was without number.* Jasher 50:10''s corn ''like the sand of the sea for abundance... could not be numbered'' is the same numberless store.'),
  ('jasher', 'jasher', 50, 7, 'jubilees', 'jubilees', 40, 8, 'extras', E'Jubilees 40:8 — *And Joseph ruled over all the land of Egypt, and all the princes of Pharaoh, and all his servants, and all who did the king’s business loved him, for he walked in uprightness, for he was without pride and arrogance, and he had no respect of persons, and did not accept gifts, but he judged in uprightness all the people of the land.* The Jubilees apparatus carries the same provider-Joseph reigning over Egypt that Jasher 50:7 opens.'),
  -- thread: jasher-50-manasseh-ephraim
  ('jasher', 'jasher', 50, 15, 'canon', 'genesis', 41, 50, 'free', E'Genesis 41:50 — *And unto Joseph were born two sons before the years of famine came, which Asenath the daughter of Poti-pherah priest of On bare unto him.* Jasher 50:15''s two sons by Osnath daughter of Potiphera, born before the famine, are the same birth Genesis sets down.'),
  ('jasher', 'jasher', 50, 15, 'canon', 'genesis', 41, 51, 'free', E'Genesis 41:51 — *And Joseph called the name of the firstborn Manasseh: For Elohim (God), said he, hath made me forget all my toil, and all my father’s house.* Jasher 50:15 names Manasseh as the elder of the two; Genesis gives the meaning of his name.'),
  ('jasher', 'jasher', 50, 15, 'canon', 'genesis', 41, 52, 'free', E'Genesis 41:52 — *And the name of the second called he Ephraim: For Elohim (God) hath caused me to be fruitful in the land of my affliction.* Ephraim, the second son of Jasher 50:15, becomes the great tribe of the northern house — the seed made fruitful in affliction.'),
  -- thread: jasher-50-famine-came
  ('jasher', 'jasher', 50, 18, 'canon', 'genesis', 41, 53, 'free', E'Genesis 41:53 — *And the seven years of plenteousness, that was in the land of Egypt, were ended.* Jasher 50:18''s seven years of plenty ''at an end'' is the same hinge Genesis marks before the dearth.'),
  ('jasher', 'jasher', 50, 18, 'canon', 'genesis', 41, 54, 'free', E'Genesis 41:54 — *And the seven years of dearth began to come, according as Joseph had said: and the dearth was in all lands; but in all the land of Egypt there was bread.* Jasher 50:18''s famine coming ''as Joseph had spoken'' matches Genesis''s ''according as Joseph had said.'''),
  ('jasher', 'jasher', 50, 25, 'canon', 'genesis', 41, 55, 'free', E'Genesis 41:55 — *And when all the land of Egypt was famished, the people cried to Pharaoh for bread: and Pharaoh said unto all the Egyptians, Go unto Joseph; what he saith to you, do.* Pharaoh''s answer in Jasher 50:25 sending the people to Joseph to do whatever he says is the same command Genesis records.'),
  -- thread: jasher-50-stores-opened-nations-come
  ('jasher', 'jasher', 50, 27, 'canon', 'genesis', 41, 56, 'free', E'Genesis 41:56 — *And the famine was over all the face of the earth: and Joseph opened all the storehouses, and sold unto the Egyptians; and the famine waxed sore in the land of Egypt.* Joseph opening all his stores and selling to the people of Egypt in Jasher 50:27 is the same act Genesis records.'),
  ('jasher', 'jasher', 50, 30, 'canon', 'genesis', 41, 57, 'free', E'Genesis 41:57 — *And all countries came into Egypt to Joseph for to buy corn; because that the famine was so sore in all lands.* Canaan, the Philistines, those beyond the Jordan and the children of the east coming to Egypt in Jasher 50:30 is Genesis''s ''all countries.'''),
  ('jasher', 'jasher', 50, 30, 'canon', 'genesis', 42, 5, 'free', E'Genesis 42:5 — *And the sons of Yashar''el (Israel) came to buy corn among those that came: for the famine was in the land of Canaan.* The inhabitants of Canaan coming for corn in Jasher 50:30 include the covenant seed — Israel''s own sons going down for bread.'),
  -- thread: jasher-50-statutes-for-the-brethren
  ('jasher', 'jasher', 50, 32, 'canon', 'genesis', 42, 3, 'free', E'Genesis 42:3 — *And Joseph’s ten brethren went down to buy corn in Egypt.* The brethren Joseph foresaw and laid his gate-statutes to detect in Jasher 50:32 are the ten who go down in Genesis.'),
  ('jasher', 'jasher', 50, 37, 'canon', 'genesis', 42, 6, 'free', E'Genesis 42:6 — *And Joseph was the governor over the land, and he it was that sold to all the people of the land: and Joseph’s brethren came, and bowed down themselves before him with their faces to the earth.* Joseph''s whole apparatus of statutes in Jasher 50:37 ''that he might know when his brethren should come'' culminates in this bowing — the dream fulfilled.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja50_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja50_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-50-corn-laid-up',
       E'Joseph heaps up corn in the seven years of plenty',
       E'Jasher tells the years of abundance: *And at the revolution of the year, in the second year of Joseph’s reigning over Egypt, Yahuah (the Lord) gave great plenty throughout the land for seven years as Joseph had spoken, for Yahuah (the Lord) blessed all the produce of the earth in those days for seven years, and they ate and were greatly satisfied.* (Jasher 50:7) — and Joseph *heaped up corn like the sand of the sea for abundance* (Jasher 50:10), securing it against the famine to come. This is the same scene Genesis sets down: *Behold, there come seven years of great plenty throughout all the land of Egypt* (Genesis 41:29); *And let them gather all the food of those good years that come, and lay up corn under the hand of Pharaoh, and let them keep food in the cities* (Genesis 41:35); *And Joseph gathered corn as the sand of the sea, very much, until he left numbering; for it was without number* (Genesis 41:49). The fathers'' provider walks in the upright way — the Jubilees apparatus names it: *And Joseph ruled over all the land of Egypt... for he walked in uprightness, for he was without pride and arrogance... but he judged in uprightness all the people of the land* (Jubilees 40:8). It ain''t new: the same plenty, the same storing, the seed kept alive by Yahuah''s blessing.',
       sv.verse_id, ev.verse_id, 'extras', 56225
  FROM _session252_ja50_lookup sv, _session252_ja50_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=50 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-50-manasseh-ephraim',
       E'Manasseh and Ephraim born to Joseph',
       E'Jasher records the two sons given before the famine: *And Joseph’s wife Osnath the daughter of Potiphera bare him two sons, Manasseh and Ephraim, and Joseph was thirty-four years old when he begat them.* (Jasher 50:15) — and *the lads grew up and they went in his ways and in his instructions, they did not deviate from the way which their father taught them, either to the right or left.* (Jasher 50:16). Genesis names the same two sons and the same mother: *And unto Joseph were born two sons before the years of famine came, which Asenath the daughter of Poti-pherah priest of On bare unto him* (Genesis 41:50); *And Joseph called the name of the firstborn Manasseh: For Elohim (God), said he, hath made me forget all my toil, and all my father’s house* (Genesis 41:51); *And the name of the second called he Ephraim: For Elohim (God) hath caused me to be fruitful in the land of my affliction* (Genesis 41:52). These are the two tribes that fill out the twelve — the seed multiplying in the land of affliction, the inheritance carried forward. It ain''t new: the same household, the sons walking in the father''s way (Torah-before-Sinai), neither to the right nor the left.',
       sv.verse_id, ev.verse_id, 'extras', 56228
  FROM _session252_ja50_lookup sv, _session252_ja50_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=50 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-50-famine-came',
       E'The seven years of famine come upon the land',
       E'Jasher turns to the dearth: *And the seven years of plenty that were throughout the land were at an end, and the seven years of famine came after them as Joseph had spoken, and the famine was throughout the land.* (Jasher 50:18) — and when the Egyptians opened their own stores they *found all the food that was in their stores, full of vermin and not fit to eat* (Jasher 50:20), crying before Pharaoh. Genesis sets the same turn: *And the seven years of plenteousness, that was in the land of Egypt, were ended* (Genesis 41:53); *And the seven years of dearth began to come, according as Joseph had said: and the dearth was in all lands; but in all the land of Egypt there was bread* (Genesis 41:54); *And when all the land of Egypt was famished, the people cried to Pharaoh for bread: and Pharaoh said unto all the Egyptians, Go unto Joseph; what he saith to you, do* (Genesis 41:55). It ain''t new: the famine comes exactly ''as Joseph had spoken'' — the word of Yahuah''s seer stands, and only Joseph''s storehouse holds bread.',
       sv.verse_id, ev.verse_id, 'extras', 56231
  FROM _session252_ja50_lookup sv, _session252_ja50_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=50 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-50-stores-opened-nations-come',
       E'Joseph opens the stores; all nations come to buy corn',
       E'Jasher shows the storehouse thrown open: *And when Joseph heard all the words of the people of Egypt and what had befallen them, Joseph opened all his stores of the produce and he sold it to the people of Egypt.* (Jasher 50:27) — and the hunger reaching past Egypt: *And all the inhabitants of the land of Canaan and the Philistines, and those beyond the Jordan, and the children of the east and all the cities of the lands far and nigh heard that there was corn in Egypt, and they all came to Egypt to buy corn, for the famine prevailed over them.* (Jasher 50:30). Genesis sets the same: *And the famine was over all the face of the earth: and Joseph opened all the storehouses, and sold unto the Egyptians; and the famine waxed sore in the land of Egypt* (Genesis 41:56); *And all countries came into Egypt to Joseph for to buy corn; because that the famine was so sore in all lands* (Genesis 41:57). Among those countries is Canaan, the seed of Jacob: *And the sons of Yashar''el (Israel) came to buy corn among those that came: for the famine was in the land of Canaan* (Genesis 42:5). It ain''t new — the famine drives all the earth, and the brethren among them, down to the brother they sold.',
       sv.verse_id, ev.verse_id, 'extras', 56234
  FROM _session252_ja50_lookup sv, _session252_ja50_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=27
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=50 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-50-statutes-for-the-brethren',
       E'Joseph''s gate-statutes to catch his brethren coming for corn',
       E'Jasher gives a detail the canon only implies — Joseph foreseeing his brethren and setting watchmen at the gates: *And Joseph knew that his brethren also would come to Egypt to buy corn, for the famine prevailed throughout the earth. And Joseph commanded all his people that they should cause it to be proclaimed throughout the land of Egypt, saying,* (Jasher 50:32) — that every buyer''s name and his father''s name be written down: *And Joseph placed sentinels at the gates of Egypt, and commanded them, saying, Any person who may come to buy corn, suffer him not to enter until his name, and the name of his father, and the name of his father’s father be written down, and whatever is written by day, send their names to me in the evening that I may know their names.* (Jasher 50:35). All these statutes were *in order that he might know when his brethren should come to Egypt to buy corn* (Jasher 50:37). Genesis carries the meeting these statutes were laid to catch: *And Joseph’s ten brethren went down to buy corn in Egypt* (Genesis 42:3); *And Joseph was the governor over the land, and he it was that sold to all the people of the land: and Joseph’s brethren came, and bowed down themselves before him with their faces to the earth* (Genesis 42:6). It ain''t new — Jasher amplifies the providence: the brother they cast out now governs the bread, and the dreams bow before him.',
       sv.verse_id, ev.verse_id, 'extras', 56237
  FROM _session252_ja50_lookup sv, _session252_ja50_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=32
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=50 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-50-corn-laid-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:29 — *Behold, there come seven years of great plenty throughout all the land of Egypt:* the seven plenteous years Jasher 50:7 says Yahuah gave throughout the land are Joseph''s interpreted dream in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-corn-laid-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:35 — *And let them gather all the food of those good years that come, and lay up corn under the hand of Pharaoh, and let them keep food in the cities.* Joseph''s officers collecting and heaping the corn year by year in Jasher 50:8 is Joseph''s own counsel to Pharaoh in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-corn-laid-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 41:49 — *And Joseph gathered corn as the sand of the sea, very much, until he left numbering; for it was without number.* Jasher 50:10''s corn ''like the sand of the sea for abundance... could not be numbered'' is the same numberless store.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-corn-laid-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 40:8 — *And Joseph ruled over all the land of Egypt, and all the princes of Pharaoh, and all his servants, and all who did the king’s business loved him, for he walked in uprightness, for he was without pride and arrogance, and he had no respect of persons, and did not accept gifts, but he judged in uprightness all the people of the land.* The Jubilees apparatus carries the same provider-Joseph reigning over Egypt that Jasher 50:7 opens.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-corn-laid-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-50-manasseh-ephraim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:50 — *And unto Joseph were born two sons before the years of famine came, which Asenath the daughter of Poti-pherah priest of On bare unto him.* Jasher 50:15''s two sons by Osnath daughter of Potiphera, born before the famine, are the same birth Genesis sets down.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-manasseh-ephraim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:51 — *And Joseph called the name of the firstborn Manasseh: For Elohim (God), said he, hath made me forget all my toil, and all my father’s house.* Jasher 50:15 names Manasseh as the elder of the two; Genesis gives the meaning of his name.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-manasseh-ephraim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 41:52 — *And the name of the second called he Ephraim: For Elohim (God) hath caused me to be fruitful in the land of my affliction.* Ephraim, the second son of Jasher 50:15, becomes the great tribe of the northern house — the seed made fruitful in affliction.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-manasseh-ephraim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-50-famine-came
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:53 — *And the seven years of plenteousness, that was in the land of Egypt, were ended.* Jasher 50:18''s seven years of plenty ''at an end'' is the same hinge Genesis marks before the dearth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-famine-came'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=53
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:54 — *And the seven years of dearth began to come, according as Joseph had said: and the dearth was in all lands; but in all the land of Egypt there was bread.* Jasher 50:18''s famine coming ''as Joseph had spoken'' matches Genesis''s ''according as Joseph had said.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-famine-came'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 41:55 — *And when all the land of Egypt was famished, the people cried to Pharaoh for bread: and Pharaoh said unto all the Egyptians, Go unto Joseph; what he saith to you, do.* Pharaoh''s answer in Jasher 50:25 sending the people to Joseph to do whatever he says is the same command Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-famine-came'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=55
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-50-stores-opened-nations-come
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:56 — *And the famine was over all the face of the earth: and Joseph opened all the storehouses, and sold unto the Egyptians; and the famine waxed sore in the land of Egypt.* Joseph opening all his stores and selling to the people of Egypt in Jasher 50:27 is the same act Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-stores-opened-nations-come'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=56
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:57 — *And all countries came into Egypt to Joseph for to buy corn; because that the famine was so sore in all lands.* Canaan, the Philistines, those beyond the Jordan and the children of the east coming to Egypt in Jasher 50:30 is Genesis''s ''all countries.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-stores-opened-nations-come'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=57
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:5 — *And the sons of Yashar''el (Israel) came to buy corn among those that came: for the famine was in the land of Canaan.* The inhabitants of Canaan coming for corn in Jasher 50:30 include the covenant seed — Israel''s own sons going down for bread.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-stores-opened-nations-come'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-50-statutes-for-the-brethren
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:3 — *And Joseph’s ten brethren went down to buy corn in Egypt.* The brethren Joseph foresaw and laid his gate-statutes to detect in Jasher 50:32 are the ten who go down in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-statutes-for-the-brethren'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:6 — *And Joseph was the governor over the land, and he it was that sold to all the people of the land: and Joseph’s brethren came, and bowed down themselves before him with their faces to the earth.* Joseph''s whole apparatus of statutes in Jasher 50:37 ''that he might know when his brethren should come'' culminates in this bowing — the dream fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session252_ja50_lookup sv, _session252_ja50_lookup tv
 WHERE t.slug='jasher-50-statutes-for-the-brethren'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=50 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

