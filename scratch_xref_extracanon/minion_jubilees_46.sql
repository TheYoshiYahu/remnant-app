-- ----- fragment: minion_jubilees_46.sql (session251 jubilees 46) -----
-- Source anchor: jubilees/jubilees ch46. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju46 (view _session251_ju46_lookup). Sort band base 54125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju46_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-46-joseph-died-generation
  ('jubilees', 'jubilees', 46, 4, 'canon', 'exodus', 1, 6, 'free', E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Jubilees 46:4 retells Exodus'' opening line verbatim as the patriarchal age closes.'),
  ('jubilees', 'jubilees', 46, 1, 'canon', 'exodus', 1, 7, 'free', E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The exceeding multiplication of Jubilees 46:1 is Exodus'' own account of the kept seed.'),
  ('jubilees', 'jubilees', 46, 1, 'canon', 'exodus', 1, 5, 'free', E'Exodus 1:5 — *And all the souls that came out of the loins of Jacob were seventy souls: for Joseph was in Egypt already.* The seventy of Jacob''s house are the few who, by Jubilees 46:1, become a great nation.'),
  -- thread: jubilees-46-josephs-bones-oath
  ('jubilees', 'jubilees', 46, 5, 'canon', 'genesis', 50, 25, 'free', E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* Jubilees 46:5-6 retells the very oath Joseph sealed in Genesis.'),
  ('jubilees', 'jubilees', 46, 5, 'canon', 'genesis', 50, 24, 'free', E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* The bones-oath of Jubilees 46:5 rests on this sworn visitation and return to the land.'),
  ('jubilees', 'jubilees', 46, 6, 'canon', 'hebrews', 11, 22, 'free', E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The swearing of Jubilees 46:6 is named by the NT as Joseph''s act of faith in the Exodus to come.'),
  -- thread: jubilees-46-new-king-knew-not-joseph
  ('jubilees', 'jubilees', 46, 6, 'canon', 'exodus', 1, 8, 'free', E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The stronger new king of Jubilees 46:6 is Exodus'' king who knew not Joseph.'),
  ('jubilees', 'jubilees', 46, 13, 'canon', 'acts', 7, 18, 'free', E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen names the same new king whose evil device against Israel Jubilees 46:13 records.'),
  ('jubilees', 'jubilees', 46, 13, 'canon', 'acts', 7, 17, 'free', E'Acts 7:17 — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt.* The growth that provokes the king''s device in Jubilees 46:13 is set by Stephen against the nearing promise.'),
  -- thread: jubilees-46-deal-wisely-afflict
  ('jubilees', 'jubilees', 46, 13, 'canon', 'exodus', 1, 9, 'free', E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we.* Jubilees 46:13 opens the king''s speech with Pharaoh''s own words.'),
  ('jubilees', 'jubilees', 46, 13, 'canon', 'exodus', 1, 10, 'free', E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* The ''deal wisely'' / war / join-the-enemy plot of Jubilees 46:13 is Exodus verbatim.'),
  ('jubilees', 'jubilees', 46, 13, 'canon', 'acts', 7, 19, 'free', E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen names as subtilty the very wise dealing Jubilees 46:13 records.'),
  -- thread: jubilees-46-taskmasters-pithom-raamses
  ('jubilees', 'jubilees', 46, 14, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* Jubilees 46:14 names the same taskmasters and the same two store-cities.'),
  ('jubilees', 'jubilees', 46, 15, 'canon', 'exodus', 1, 12, 'free', E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* The thriving-under-affliction of Jubilees 46:15 is Exodus'' own paradox.'),
  ('jubilees', 'jubilees', 46, 14, 'canon', 'exodus', 1, 13, 'free', E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour.* The serving ''with rigour'' of Jubilees 46:14-15 is Exodus'' exact phrase for the bondage.'),
  ('jubilees', 'jubilees', 46, 14, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The slavery imposed in Jubilees 46:14 is the affliction Yahuah foretold to Abram, written before it unfolded.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju46_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju46_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-46-joseph-died-generation',
       E'Joseph died, and all that generation — the seed multiplied',
       E'Jubilees draws the curtain on the patriarchs: *And he died and all his brethren and all that generation* (Jubilees 46:4), the close of the seventy who came down into Egypt. This is Exodus'' opening word for word — *And Joseph died, and all his brethren, and all that generation* (Exodus 1:6) — the retold Torah laid right beside its source. And the increase Jubilees describes, *they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph* (Jubilees 46:1), is Exodus'' own: *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them* (Exodus 1:7). The seed kept and multiplied — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54125
  FROM _session251_ju46_lookup sv, _session251_ju46_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=46 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-46-josephs-bones-oath',
       E'Carry up my bones — Joseph''s oath and the visitation promised',
       E'Before he dies Joseph binds Israel: *And he commanded the children of Yashar''el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt* (Jubilees 46:5), *And he made them swear regarding his bones* (Jubilees 46:6). This is Genesis word for word — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25) — and it rests on the promise *Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob* (Genesis 50:24). The New Testament names this as faith: *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22). The oath looks past the bondage to a deliverance already sworn — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54128
  FROM _session251_ju46_lookup sv, _session251_ju46_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=46 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-46-new-king-knew-not-joseph',
       E'A new king, stronger than he — the favour ends',
       E'Jubilees marks the turning: *another, a new king, had become king of Egypt, and he was stronger than he* (Jubilees 46:6), and where once *all the Egyptians honoured the children of Yashar''el (Israel) all the days of the life of Joseph* (Jubilees 46:2), now *the king of Canaan was victorious over the king of Egypt, and he closed the gates of Egypt. And he devised an evil device against the children of Yashar''el (Israel)* (Jubilees 46:11). Exodus names the man and his ignorance: *Now there arose up a new king over Egypt, which knew not Joseph* (Exodus 1:8). Stephen preaches the same hinge — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt, Till another king arose, which knew not Joseph* (Acts 7:17-18). The favour that protected the seed gives way exactly as the canon tells it.',
       sv.verse_id, ev.verse_id, 'extras', 54131
  FROM _session251_ju46_lookup sv, _session251_ju46_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=46 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-46-deal-wisely-afflict',
       E'Come, let us deal wisely — the bondage devised',
       E'The king''s counsel in Jubilees is Pharaoh''s counsel: *Behold the people of the children of Yashar''el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many, and let us afflict them with slavery before war come upon us... else they will join themselves to our enemies* (Jubilees 46:13). Exodus has it nearly word for word — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we: Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us* (Exodus 1:9-10). Stephen sums the cunning: *The same dealt subtilly with our kindred, and evil entreated our fathers* (Acts 7:19). The fear of the multiplying seed births the affliction — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54134
  FROM _session251_ju46_lookup sv, _session251_ju46_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=46 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-46-taskmasters-pithom-raamses',
       E'Taskmasters, Pithom and Raamses — bondage with rigour',
       E'Jubilees names the works and the cruelty: *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses* (Jubilees 46:14), *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied* (Jubilees 46:15). Exodus matches each stroke — the taskmasters and the same two cities, *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses* (Exodus 1:11); the paradox of the thriving oppressed, *But the more they afflicted them, the more they multiplied and grew* (Exodus 1:12); and the rigour, *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour* (Exodus 1:13). This is the affliction Yahuah foretold to Abram four centuries before: *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). The bondage was on the heavenly tablets before a single brick was laid — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54137
  FROM _session251_ju46_lookup sv, _session251_ju46_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=46 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-46-joseph-died-generation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Jubilees 46:4 retells Exodus'' opening line verbatim as the patriarchal age closes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-joseph-died-generation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The exceeding multiplication of Jubilees 46:1 is Exodus'' own account of the kept seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-joseph-died-generation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:5 — *And all the souls that came out of the loins of Jacob were seventy souls: for Joseph was in Egypt already.* The seventy of Jacob''s house are the few who, by Jubilees 46:1, become a great nation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-joseph-died-generation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-46-josephs-bones-oath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* Jubilees 46:5-6 retells the very oath Joseph sealed in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-josephs-bones-oath'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* The bones-oath of Jubilees 46:5 rests on this sworn visitation and return to the land.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-josephs-bones-oath'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The swearing of Jubilees 46:6 is named by the NT as Joseph''s act of faith in the Exodus to come.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-josephs-bones-oath'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-46-new-king-knew-not-joseph
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The stronger new king of Jubilees 46:6 is Exodus'' king who knew not Joseph.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-new-king-knew-not-joseph'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen names the same new king whose evil device against Israel Jubilees 46:13 records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-new-king-knew-not-joseph'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:17 — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt.* The growth that provokes the king''s device in Jubilees 46:13 is set by Stephen against the nearing promise.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-new-king-knew-not-joseph'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-46-deal-wisely-afflict
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we.* Jubilees 46:13 opens the king''s speech with Pharaoh''s own words.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-deal-wisely-afflict'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* The ''deal wisely'' / war / join-the-enemy plot of Jubilees 46:13 is Exodus verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-deal-wisely-afflict'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen names as subtilty the very wise dealing Jubilees 46:13 records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-deal-wisely-afflict'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-46-taskmasters-pithom-raamses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* Jubilees 46:14 names the same taskmasters and the same two store-cities.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-taskmasters-pithom-raamses'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* The thriving-under-affliction of Jubilees 46:15 is Exodus'' own paradox.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-taskmasters-pithom-raamses'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour.* The serving ''with rigour'' of Jubilees 46:14-15 is Exodus'' exact phrase for the bondage.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-taskmasters-pithom-raamses'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 15:13 — *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The slavery imposed in Jubilees 46:14 is the affliction Yahuah foretold to Abram, written before it unfolded.'
  FROM cross_reference_threads t, cross_references x, _session251_ju46_lookup sv, _session251_ju46_lookup tv
 WHERE t.slug='jubilees-46-taskmasters-pithom-raamses'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=46 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

