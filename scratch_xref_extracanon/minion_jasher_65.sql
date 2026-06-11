-- ----- fragment: minion_jasher_65.sql (session252 jasher 65) -----
-- Source anchor: jasher/jasher ch65. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja65 (view _session252_ja65_lookup). Sort band base 56600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja65_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-65-counsel-against-the-seed
  ('jasher', 'jasher', 65, 3, 'canon', 'exodus', 1, 9, 'free', E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we:* the very alarm Jasher 65:3 puts in the elders'' mouths.'),
  ('jasher', 'jasher', 65, 6, 'canon', 'exodus', 1, 10, 'free', E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* the fear of Jasher 65:6 that Israel would join an enemy in war is the canon counsel verbatim.'),
  ('jasher', 'jasher', 65, 5, 'canon', 'acts', 7, 18, 'free', E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen names the king behind Jasher 65''s whole scheme of destruction.'),
  ('jasher', 'jasher', 65, 3, 'jubilees', 'jubilees', 46, 13, 'extras', E'Jubilees 46:13 — *“Behold the people of the children of Yashar’el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many, and let us afflict them with slavery before war come upon us and before they too fight against us; else they will join themselves to our enemies and get them up out of our land, for their hearts and faces are towards the land of Canaan.”* Jubilees retells the identical council of Jasher 65:3-6.'),
  -- thread: jasher-65-pithom-rameses-taskmasters
  ('jasher', 'jasher', 65, 8, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* the same two cities Jasher 65:8 names as the pretext for the bondage.'),
  ('jasher', 'jasher', 65, 35, 'canon', 'exodus', 1, 13, 'free', E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour:* the very ''rigor'' of Jasher 65:35.'),
  ('jasher', 'jasher', 65, 36, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* matches Jasher 65:36''s embittered lives in mortar, bricks, and field-work to the word.'),
  ('jasher', 'jasher', 65, 8, 'jubilees', 'jubilees', 46, 14, 'extras', E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong 2 cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees names the same Pithom and Raamses and the same taskmasters of Jasher 65:8,26.'),
  -- thread: jasher-65-bondage-foretold-to-abraham
  ('jasher', 'jasher', 65, 31, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* the affliction Jasher 65:31 says lasted ''many years'' was promised to Abraham beforehand.'),
  ('jasher', 'jasher', 65, 31, 'canon', 'acts', 7, 6, 'free', E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen names the bondage of Jasher 65 as the very thing Elohim had foretold to Abraham.'),
  -- thread: jasher-65-more-afflicted-more-multiplied
  ('jasher', 'jasher', 65, 38, 'canon', 'exodus', 1, 12, 'free', E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* the identical reversal of Jasher 65:38: affliction only increases the seed.'),
  ('jasher', 'jasher', 65, 38, 'jubilees', 'jubilees', 46, 15, 'extras', E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* Jubilees carries the same paradox of Jasher 65:38 — rigour breeds growth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja65_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja65_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-65-counsel-against-the-seed',
       E'The counsel against the multiplying seed',
       E'Jasher opens the bondage with Pharaoh''s council in dread of the covenant seed: *Behold the people of the children of Israel is greater and mightier than we are... Now therefore give us counsel what to do with them, until we gradually destroy them from amongst us, lest they become too numerous for us in the land* (Jasher 65:3,5). It ain''t new — this is the exact counsel of Exodus: *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land* (Exodus 1:10). Stephen names the new king who set it in motion — *Till another king arose, which knew not Joseph* (Acts 7:18) — and Jubilees retells the same speech word for word: *Behold the people of the children of Yashar’el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many...* (Jubilees 46:13). The kingdom of man, like Nimrod before and Herod after, plots against the chosen seed it cannot out-breed.',
       sv.verse_id, ev.verse_id, 'extras', 56600
  FROM _session252_ja65_lookup sv, _session252_ja65_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=65 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-65-pithom-rameses-taskmasters',
       E'Pithom and Rameses; taskmasters and rigour',
       E'The plot becomes brick and mortar. Jasher: *Behold in the land are Pithom and Rameses, cities unfortified against battle, it behooves you and us to build them, and to fortify them* (Jasher 65:8); and once the wages cease, *after all the Egyptians had withdrawn from the children of Israel they returned and became oppressors and officers over them, and some of them stood over the children of Israel as task masters* (Jasher 65:26), until *the Egyptians made the children of Israel work with rigor* (Jasher 65:35). Exodus tells it in two verses: *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses* (Exodus 1:11), and *the Egyptians made the children of Yashar''el (Israel) to serve with rigour* (Exodus 1:13). Jubilees names the same two cities and the same word: *And he set over them taskmasters to afflict them with slavery; and they built strong cities for Pharaoh, Pithom and Raamses* (Jubilees 46:14). The two cities, the taskmasters, the rigour — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56603
  FROM _session252_ja65_lookup sv, _session252_ja65_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=65 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-65-bondage-foretold-to-abraham',
       E'The bondage foretold to Abraham',
       E'Jasher marks the long endurance of the affliction with a promise of its end: *the children of Israel were engaged in work for many years, until the time came when Yahuah (the Lord) remembered them and brought them out of Egypt* (Jasher 65:31). This is no surprise to the covenant — Yahuah had told Abram the whole arc by night: *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). Stephen preaches it as the announced plan of Elohim: *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6). The bondage was foretold, the deliverance certain — the seed kept through the affliction Abraham was shown in advance.',
       sv.verse_id, ev.verse_id, 'extras', 56606
  FROM _session252_ja65_lookup sv, _session252_ja65_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=31
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=65 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-65-more-afflicted-more-multiplied',
       E'The more afflicted, the more they multiplied',
       E'Egypt''s whole strategy backfires. Jasher: *all the work wherein the Egyptians made the children of Israel labor, they exacted with rigor, in order to afflict the children of Israel, but the more they afflicted them, the more they increased and grew, and the Egyptians were grieved because of the children of Israel* (Jasher 65:38). Exodus says it in one breath: *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel)* (Exodus 1:12). Jubilees too: *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied* (Jubilees 46:15). The kingdom of man cannot out-afflict the blessing of multiplication on the chosen seed — the harder Pharaoh presses, the more Yahuah grows the nation He swore to Abraham.',
       sv.verse_id, ev.verse_id, 'extras', 56609
  FROM _session252_ja65_lookup sv, _session252_ja65_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=38
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=65 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-65-counsel-against-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we:* the very alarm Jasher 65:3 puts in the elders'' mouths.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-counsel-against-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* the fear of Jasher 65:6 that Israel would join an enemy in war is the canon counsel verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-counsel-against-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen names the king behind Jasher 65''s whole scheme of destruction.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-counsel-against-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:13 — *“Behold the people of the children of Yashar’el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many, and let us afflict them with slavery before war come upon us and before they too fight against us; else they will join themselves to our enemies and get them up out of our land, for their hearts and faces are towards the land of Canaan.”* Jubilees retells the identical council of Jasher 65:3-6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-counsel-against-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-65-pithom-rameses-taskmasters
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* the same two cities Jasher 65:8 names as the pretext for the bondage.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-pithom-rameses-taskmasters'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour:* the very ''rigor'' of Jasher 65:35.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-pithom-rameses-taskmasters'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* matches Jasher 65:36''s embittered lives in mortar, bricks, and field-work to the word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-pithom-rameses-taskmasters'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:14 — *And he set over them taskmasters to afflict them with slavery; and they built strong 2 cities for Pharaoh, Pithom and Raamses, and they built all the walls and all the fortifications which had fallen in the cities of Egypt.* Jubilees names the same Pithom and Raamses and the same taskmasters of Jasher 65:8,26.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-pithom-rameses-taskmasters'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-65-bondage-foretold-to-abraham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* the affliction Jasher 65:31 says lasted ''many years'' was promised to Abraham beforehand.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-bondage-foretold-to-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen names the bondage of Jasher 65 as the very thing Elohim had foretold to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-bondage-foretold-to-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-65-more-afflicted-more-multiplied
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* the identical reversal of Jasher 65:38: affliction only increases the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-more-afflicted-more-multiplied'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* Jubilees carries the same paradox of Jasher 65:38 — rigour breeds growth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja65_lookup sv, _session252_ja65_lookup tv
 WHERE t.slug='jasher-65-more-afflicted-more-multiplied'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=65 AND sv.verse_number=38
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

