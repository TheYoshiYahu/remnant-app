-- ----- fragment: minion_jasher_60.sql (session252 jasher 60) -----
-- Source anchor: jasher/jasher ch60. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja60 (view _session252_ja60_lookup). Sort band base 56475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja60_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-60-zepho-eliphaz-esau-edom
  ('jasher', 'jasher', 60, 1, 'canon', 'genesis', 36, 11, 'free', E'Genesis 36:11 — *And the sons of Eliphaz were Teman, Omar, Zepho, and Gatam, and Kenaz.* Jasher''s war-captain Zepho son of Eliphaz son of Esau is named here in the canon''s own roll of Edom, so the legend hangs on a genuine genealogy.'),
  ('jasher', 'jasher', 60, 1, 'canon', 'genesis', 36, 10, 'free', E'Genesis 36:10 — *These are the names of Esau''s sons; Eliphaz the son of Adah the wife of Esau, Reuel the son of Bashemath the wife of Esau.* Jasher''s "son of Eliphaz, the son of Esau" matches the canon line: Zepho descends through Eliphaz, Esau''s firstborn by Adah.'),
  ('jasher', 'jasher', 60, 4, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* Zepho''s enticing Angeas to war against the sons of Jacob is the old Esau-against-Jacob enmity, which the canon reads as election dividing the two brothers.'),
  ('jasher', 'jasher', 60, 30, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Jasher''s Zepho riding out continually to spoil and to war on Jacob''s sons is the very violence of Edom against his brother that the prophet says shall be cut off.'),
  -- thread: jasher-60-seventy-second-year-after-joseph
  ('jasher', 'jasher', 60, 1, 'canon', 'genesis', 50, 26, 'free', E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* Jasher reckons its seventy-second year "after the death of Joseph," dating from the very death the canon records as the close of Genesis.'),
  ('jasher', 'jasher', 60, 1, 'canon', 'exodus', 1, 6, 'free', E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Jasher''s clock begins where Exodus begins — Joseph and his generation gone — the hinge just before the bondage opens.'),
  ('jasher', 'jasher', 60, 1, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* Jasher''s counting of the years "from the Israelites going down to Egypt" is the running of the very sojourn Yahuah foretold to Abraham.'),
  ('jasher', 'jasher', 60, 1, 'jubilees', 'jubilees', 46, 1, 'extras', E'Jubilees 46:1 — *And it came to pass that after Jacob died the children of Yashar''el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* Jubilees narrates the very years Jasher dates by, the seed multiplying in Egypt after Joseph — the same window from a parallel hand.'),
  ('jasher', 'jasher', 60, 1, 'jubilees', 'jubilees', 46, 3, 'extras', E'Jubilees 46:3 — *And Joseph died being a hundred and ten years old; seventeen years he lived in the land of Canaan, and ten years he was a servant, and three years in prison, and eighty years he was under the king, ruling all the land of Egypt.* Jasher and Jubilees both reckon "after the death of Joseph," agreeing with Genesis on his hundred and ten years.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja60_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja60_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-60-zepho-eliphaz-esau-edom',
       E'Zepho son of Eliphaz — the line of Esau set apart',
       E'Jasher names the war-captain who drives this whole chapter, and the canon already knows his pedigree: *And when the year came round, being the seventy-second year from the Israelites going down to Egypt, after the death of Joseph, Zepho, the son of Eliphaz, the son of Esau, fled from Egypt, he and his men, and they went away* (Jasher 60:1). Genesis set this name in Esau''s house generations earlier — *And the sons of Eliphaz were Teman, Omar, Zepho, and Gatam, and Kenaz* (Genesis 36:11) — sons of *Eliphaz the son of Adah the wife of Esau* (Genesis 36:10), for *these are the generations of Esau the father of the Edomites in mount Seir* (Genesis 36:9). It ain''t new: Zepho is no invention but a son of Edom, and Jasher''s legend traces him *enticing Angeas king of Africa to collect all his army to go and fight with the Egyptians, and with the sons of Jacob* (Jasher 60:4) — the ancient grudge of Esau against Jacob carried forward. From that day forward *Zepho the captain of the host of Angeas would go with them* (Jasher 60:30) to spoil. The prophets read this division as election: *Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob, And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* (Malachi 1:2-3), and Edom''s violence is judged — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10). The seed is kept; the rival line, however great its captains rise, is set outside the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 56475
  FROM _session252_ja60_lookup sv, _session252_ja60_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=60 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-60-seventy-second-year-after-joseph',
       E'The seventy-second year in Egypt — the sojourn clock running after Joseph''s death',
       E'Jasher dates its war-legend by the covenant clock: *And when the year came round, being the seventy-second year from the Israelites going down to Egypt, after the death of Joseph* (Jasher 60:1). The canon marks the same turn — Joseph''s death and the generation passing — as the hinge before the bondage: *And Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt* (Genesis 50:26), *And Joseph died, and all his brethren, and all that generation* (Exodus 1:6). This is the appointed window Yahuah foretold to Abraham: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). Jubilees, narrating the very same years, agrees that after Jacob died the seed multiplied through Joseph''s lifetime — *And it came to pass that after Jacob died the children of Yashar''el (Israel) multiplied in the land of Egypt, and they became a great nation* (Jubilees 46:1) — and that *Joseph died being a hundred and ten years old* (Jubilees 46:3), *And he died and all his brethren and all that generation* (Jubilees 46:4). It ain''t new: while Jasher''s eye wanders off to the wars of Africa and Chittim, the date-line quietly keeps the canon''s countdown — the seed kept and growing toward the promised visitation.',
       sv.verse_id, ev.verse_id, 'extras', 56478
  FROM _session252_ja60_lookup sv, _session252_ja60_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=60 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-60-zepho-eliphaz-esau-edom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:11 — *And the sons of Eliphaz were Teman, Omar, Zepho, and Gatam, and Kenaz.* Jasher''s war-captain Zepho son of Eliphaz son of Esau is named here in the canon''s own roll of Edom, so the legend hangs on a genuine genealogy.'
  FROM cross_reference_threads t, cross_references x, _session252_ja60_lookup sv, _session252_ja60_lookup tv
 WHERE t.slug='jasher-60-zepho-eliphaz-esau-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:10 — *These are the names of Esau''s sons; Eliphaz the son of Adah the wife of Esau, Reuel the son of Bashemath the wife of Esau.* Jasher''s "son of Eliphaz, the son of Esau" matches the canon line: Zepho descends through Eliphaz, Esau''s firstborn by Adah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja60_lookup sv, _session252_ja60_lookup tv
 WHERE t.slug='jasher-60-zepho-eliphaz-esau-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* Zepho''s enticing Angeas to war against the sons of Jacob is the old Esau-against-Jacob enmity, which the canon reads as election dividing the two brothers.'
  FROM cross_reference_threads t, cross_references x, _session252_ja60_lookup sv, _session252_ja60_lookup tv
 WHERE t.slug='jasher-60-zepho-eliphaz-esau-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Jasher''s Zepho riding out continually to spoil and to war on Jacob''s sons is the very violence of Edom against his brother that the prophet says shall be cut off.'
  FROM cross_reference_threads t, cross_references x, _session252_ja60_lookup sv, _session252_ja60_lookup tv
 WHERE t.slug='jasher-60-zepho-eliphaz-esau-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-60-seventy-second-year-after-joseph
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* Jasher reckons its seventy-second year "after the death of Joseph," dating from the very death the canon records as the close of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja60_lookup sv, _session252_ja60_lookup tv
 WHERE t.slug='jasher-60-seventy-second-year-after-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Jasher''s clock begins where Exodus begins — Joseph and his generation gone — the hinge just before the bondage opens.'
  FROM cross_reference_threads t, cross_references x, _session252_ja60_lookup sv, _session252_ja60_lookup tv
 WHERE t.slug='jasher-60-seventy-second-year-after-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* Jasher''s counting of the years "from the Israelites going down to Egypt" is the running of the very sojourn Yahuah foretold to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja60_lookup sv, _session252_ja60_lookup tv
 WHERE t.slug='jasher-60-seventy-second-year-after-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:1 — *And it came to pass that after Jacob died the children of Yashar''el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* Jubilees narrates the very years Jasher dates by, the seed multiplying in Egypt after Joseph — the same window from a parallel hand.'
  FROM cross_reference_threads t, cross_references x, _session252_ja60_lookup sv, _session252_ja60_lookup tv
 WHERE t.slug='jasher-60-seventy-second-year-after-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 46:3 — *And Joseph died being a hundred and ten years old; seventeen years he lived in the land of Canaan, and ten years he was a servant, and three years in prison, and eighty years he was under the king, ruling all the land of Egypt.* Jasher and Jubilees both reckon "after the death of Joseph," agreeing with Genesis on his hundred and ten years.'
  FROM cross_reference_threads t, cross_references x, _session252_ja60_lookup sv, _session252_ja60_lookup tv
 WHERE t.slug='jasher-60-seventy-second-year-after-joseph'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

