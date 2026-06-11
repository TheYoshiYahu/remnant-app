-- ----- fragment: minion_jasher_59.sql (session252 jasher 59) -----
-- Source anchor: jasher/jasher ch59. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja59 (view _session252_ja59_lookup). Sort band base 56450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja59_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-59-seventy-souls
  ('jasher', 'jasher', 59, 1, 'canon', 'exodus', 1, 1, 'free', E'Exodus 1:1 — *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob.* Exodus opens its bondage account with the same muster-formula Jasher 59:1 uses to head the chapter.'),
  ('jasher', 'jasher', 59, 19, 'canon', 'genesis', 46, 27, 'free', E'Genesis 46:27 — *And the sons of Joseph, which were born him in Egypt, were two souls: all the souls of the house of Jacob, which came into Egypt, were threescore and ten.* The seventy-soul total of Jasher 59:19 is lifted straight from the Genesis census.'),
  ('jasher', 'jasher', 59, 19, 'canon', 'exodus', 1, 5, 'free', E'Exodus 1:5 — *And all the souls that came out of the loins of Jacob were seventy souls: for Joseph was in Egypt already.* Exodus echoes the same seventy-from-the-loins count that closes Jasher''s roll in 59:19.'),
  ('jasher', 'jasher', 59, 19, 'canon', 'acts', 7, 14, 'free', E'Acts 7:14 — *Then sent Joseph, and called his father Jacob to him, and all his kindred, threescore and fifteen souls.* Stephen rehearses the very household-of-Jacob that Jasher 59:19 numbers in Egypt.'),
  -- thread: jasher-59-josephs-bones-oath
  ('jasher', 'jasher', 59, 22, 'canon', 'genesis', 50, 24, 'free', E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* Joseph''s dying declaration of the visitation in Jasher 59:22 reproduces this Genesis charge nearly word for word.'),
  ('jasher', 'jasher', 59, 24, 'canon', 'genesis', 50, 25, 'free', E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* The bones-oath Joseph binds in Jasher 59:24 is the same oath Genesis records.'),
  ('jasher', 'jasher', 59, 23, 'canon', 'exodus', 13, 19, 'free', E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The charge Joseph gives in Jasher 59:23 is fulfilled when Moses lifts the bones at the Exodus.'),
  ('jasher', 'jasher', 59, 22, 'canon', 'hebrews', 11, 22, 'free', E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The dying word and bone-commandment of Jasher 59:22 is the faith the writer of Hebrews honours.'),
  ('jasher', 'jasher', 59, 24, 'jubilees', 'jubilees', 46, 5, 'extras', E'Jubilees 46:5 — *And he commanded the children of Yashar''el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt.* Jubilees records the very bones-charge Joseph swears the seed to in Jasher 59:24.'),
  -- thread: jasher-59-joseph-dies
  ('jasher', 'jasher', 59, 26, 'canon', 'genesis', 50, 26, 'free', E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* The hundred-and-ten-year death and embalming of Jasher 59:26 is the closing verse of Genesis itself.'),
  ('jasher', 'jasher', 59, 25, 'canon', 'exodus', 1, 6, 'free', E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Joseph''s death in Jasher 59:25 is the hinge Exodus uses to turn from the patriarchs to the bondage.'),
  ('jasher', 'jasher', 59, 26, 'jubilees', 'jubilees', 46, 3, 'extras', E'Jubilees 46:3 — *And Joseph died being a hundred and ten years old; seventeen years he lived in the land of Canaan, and ten years he was a servant, and three years in prison, and eighty years he was under the king, ruling all the land of Egypt.* Jubilees gives the same hundred-and-ten-year reckoning of Joseph''s life that Jasher 59:26 records at his death.'),
  -- thread: jasher-59-bondage-begins
  ('jasher', 'jasher', 59, 28, 'canon', 'exodus', 1, 8, 'free', E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The Egyptians beginning to rule over Israel in Jasher 59:28 is the same turn Exodus marks with the new king who knew not Joseph.'),
  ('jasher', 'jasher', 59, 28, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* The rule-over-Israel of Jasher 59:28 hardens into the taskmasters and burdens Exodus names.'),
  ('jasher', 'jasher', 59, 28, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The bondage that begins in Jasher 59:28 was sworn to Abraham long before, the affliction foretold and counted.'),
  ('jasher', 'jasher', 59, 28, 'canon', 'acts', 7, 6, 'free', E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen preaches the very bondage-foretelling that opens in Jasher 59:28.'),
  ('jasher', 'jasher', 59, 28, 'jubilees', 'jubilees', 46, 14, 'extras', E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees opens the same Egyptian affliction that begins in Jasher 59:28.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja59_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja59_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-59-seventy-souls',
       E'The seventy souls who came with Jacob — the tribal census',
       E'Jasher opens with the muster of the house of Jacob: *And these are the names of the sons of Israel who dwelt in Egypt, who had come with Jacob, all the sons of Jacob came to Egypt, every man with his household* (Jasher 59:1), totalling *And all the souls that went forth from the loins of Jacob, were seventy souls; these are they who came with Jacob their father to Egypt to dwell there: and Joseph and all his brethren dwelt securely in Egypt, and they ate of the best of Egypt all the days of the life of Joseph* (Jasher 59:19). It ain''t new — this is the Genesis census set down word for word: *And all the souls of the house of Jacob, which came into Egypt, were threescore and ten* (Genesis 46:27). Exodus repeats the very roll: *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob* (Exodus 1:1) and *And all the souls that came out of the loins of Jacob were seventy souls: for Joseph was in Egypt already* (Exodus 1:5). Stephen carries the same count into the Acts of the apostles: *Then sent Joseph, and called his father Jacob to him, and all his kindred, threescore and fifteen souls* (Acts 7:14). The seed-line is kept and numbered — the twelve-tribe nation forming in Egypt exactly as the canon recorded.',
       sv.verse_id, ev.verse_id, 'extras', 56450
  FROM _session252_ja59_lookup sv, _session252_ja59_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=59 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-59-josephs-bones-oath',
       E'Elohim will surely visit you — Joseph''s bones and the promised visitation',
       E'Dying, Joseph gathers the brethren and swears them to the visitation: *And Joseph said to his brethren and to the whole of his father''s household, Behold I die, and Elohim (God) will surely visit you and bring you up from this land to the land which he swore to your fathers to give to them* (Jasher 59:22), *And it shall be when Elohim shall visit you to bring you up from here to the land of your fathers, then bring up my bones with you from here* (Jasher 59:23), *And Joseph made the sons of Israel to swear for their seed after them, saying, Elohim will surely visit you and you shall bring up my bones with you from here* (Jasher 59:24). It ain''t new — Genesis carries the same dying charge: *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob* (Genesis 50:24) and *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25). The oath is kept centuries later: *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you* (Exodus 13:19). The apostle names it faith: *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22). Jubilees sets down the same swearing: *And he commanded the children of Yashar''el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt* (Jubilees 46:5). The visitation promised to the fathers stands — the seed will be brought up, and the bones go with them.',
       sv.verse_id, ev.verse_id, 'extras', 56453
  FROM _session252_ja59_lookup sv, _session252_ja59_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=22
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=59 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-59-joseph-dies',
       E'Joseph died, an hundred and ten years old — embalmed and mourned',
       E'The patriarch passes: *And it came to pass after this that Joseph died in that year, the seventy-first year of the Israelites going down to Egypt* (Jasher 59:25), *And Joseph was one hundred and ten years old when he died in the land of Egypt, and all his brethren and all his servants rose up and they embalmed Joseph, as was their custom, and his brethren and all Egypt mourned over him for seventy days* (Jasher 59:26). It ain''t new — Genesis closes the same way: *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt* (Genesis 50:26). Exodus marks the generation''s end: *And Joseph died, and all his brethren, and all that generation* (Exodus 1:6). Jubilees gives the matching span of his years: *And Joseph died being a hundred and ten years old; seventeen years he lived in the land of Canaan, and ten years he was a servant, and three years in prison, and eighty years he was under the king, ruling all the land of Egypt* (Jubilees 46:3). The same death, the same hundred-and-ten years, the same coffin in Egypt — the seed carried forward to the bondage that follows.',
       sv.verse_id, ev.verse_id, 'extras', 56456
  FROM _session252_ja59_lookup sv, _session252_ja59_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=59 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-59-bondage-begins',
       E'The Egyptians began to rule over Israel — the bondage foretold to Abraham',
       E'With Joseph gone the affliction begins: *And it came to pass after the death of Joseph, all the Egyptians began in those days to rule over the children of Israel, and Pharaoh, king of Egypt, who reigned in his father''s stead, took all the laws of Egypt and conducted the whole government of Egypt under his counsel, and he reigned securely over his people* (Jasher 59:28). It ain''t new — this is the opening of Exodus'' bondage: *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them* (Exodus 1:7), then *Now there arose up a new king over Egypt, which knew not Joseph* (Exodus 1:8) and *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses* (Exodus 1:11). And it ain''t even new to Exodus — the bondage was sworn to Abraham generations before: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). Stephen preaches the same foretelling: *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6). Jubilees opens the same affliction: *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt* (Jubilees 46:14). The kingdom of man rises over the chosen seed — yet the affliction itself was promised and counted, and the visitation already sworn.',
       sv.verse_id, ev.verse_id, 'extras', 56459
  FROM _session252_ja59_lookup sv, _session252_ja59_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=59 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-59-seventy-souls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:1 — *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob.* Exodus opens its bondage account with the same muster-formula Jasher 59:1 uses to head the chapter.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-seventy-souls'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 46:27 — *And the sons of Joseph, which were born him in Egypt, were two souls: all the souls of the house of Jacob, which came into Egypt, were threescore and ten.* The seventy-soul total of Jasher 59:19 is lifted straight from the Genesis census.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-seventy-souls'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:5 — *And all the souls that came out of the loins of Jacob were seventy souls: for Joseph was in Egypt already.* Exodus echoes the same seventy-from-the-loins count that closes Jasher''s roll in 59:19.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-seventy-souls'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:14 — *Then sent Joseph, and called his father Jacob to him, and all his kindred, threescore and fifteen souls.* Stephen rehearses the very household-of-Jacob that Jasher 59:19 numbers in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-seventy-souls'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-59-josephs-bones-oath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* Joseph''s dying declaration of the visitation in Jasher 59:22 reproduces this Genesis charge nearly word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-josephs-bones-oath'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* The bones-oath Joseph binds in Jasher 59:24 is the same oath Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-josephs-bones-oath'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 13:19 — *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you.* The charge Joseph gives in Jasher 59:23 is fulfilled when Moses lifts the bones at the Exodus.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-josephs-bones-oath'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The dying word and bone-commandment of Jasher 59:22 is the faith the writer of Hebrews honours.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-josephs-bones-oath'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 46:5 — *And he commanded the children of Yashar''el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt.* Jubilees records the very bones-charge Joseph swears the seed to in Jasher 59:24.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-josephs-bones-oath'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=24
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-59-joseph-dies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* The hundred-and-ten-year death and embalming of Jasher 59:26 is the closing verse of Genesis itself.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-joseph-dies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Joseph''s death in Jasher 59:25 is the hinge Exodus uses to turn from the patriarchs to the bondage.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-joseph-dies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 46:3 — *And Joseph died being a hundred and ten years old; seventeen years he lived in the land of Canaan, and ten years he was a servant, and three years in prison, and eighty years he was under the king, ruling all the land of Egypt.* Jubilees gives the same hundred-and-ten-year reckoning of Joseph''s life that Jasher 59:26 records at his death.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-joseph-dies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=26
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-59-bondage-begins
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The Egyptians beginning to rule over Israel in Jasher 59:28 is the same turn Exodus marks with the new king who knew not Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* The rule-over-Israel of Jasher 59:28 hardens into the taskmasters and burdens Exodus names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The bondage that begins in Jasher 59:28 was sworn to Abraham long before, the affliction foretold and counted.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen preaches the very bondage-foretelling that opens in Jasher 59:28.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees opens the same Egyptian affliction that begins in Jasher 59:28.'
  FROM cross_reference_threads t, cross_references x, _session252_ja59_lookup sv, _session252_ja59_lookup tv
 WHERE t.slug='jasher-59-bondage-begins'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=59 AND sv.verse_number=28
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

