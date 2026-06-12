-- ----- fragment: minion_jasher_85.sql (session252 jasher 85) -----
-- Source anchor: jasher/jasher ch85. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja85 (view _session252_ja85_lookup). Sort band base 57100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja85_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-85-arad-hormah
  ('jasher', 'jasher', 85, 1, 'canon', 'numbers', 21, 1, 'free', E'Numbers 21:1 — *And when king Arad the Canaanite, which dwelt in the south, heard tell that Yashar''el (Israel) came by the way of the spies; then he fought against Yashar''el (Israel), and took some of them prisoners.* The same Arad who ''dwelt in the south'' and arranged his host against Israel in Jasher 85:1.'),
  ('jasher', 'jasher', 85, 8, 'canon', 'numbers', 21, 3, 'free', E'Numbers 21:3 — *And Yahuah (LORD) hearkened to the voice of Yashar''el (Israel), and delivered up the Canaanites; and they utterly destroyed them and their cities: and he called the name of the place Hormah.* The canon names the same Hormah Jasher 85:8 calls ''the name of the place.'''),
  -- thread: jasher-85-sihon-amorites
  ('jasher', 'jasher', 85, 14, 'canon', 'numbers', 21, 22, 'free', E'Numbers 21:22 — *Let me pass through thy land: we will not turn into the fields, or into the vineyards; we will not drink of the waters of the well: but we will go along by the king’s high way, until we be past thy borders.* The same plea to Sihon that Jasher 85:14 puts on Israel''s lips.'),
  ('jasher', 'jasher', 85, 15, 'canon', 'numbers', 21, 23, 'free', E'Numbers 21:23 — *And Sihon would not suffer Yashar''el (Israel) to pass through his border: but Sihon gathered all his people together, and went out against Yashar''el (Israel) into the wilderness: and he came to Jahaz, and fought against Yashar''el (Israel).* The very battle at Jahaz that Jasher 85:15 recounts.'),
  ('jasher', 'jasher', 85, 17, 'canon', 'numbers', 21, 24, 'free', E'Numbers 21:24 — *And Yashar''el (Israel) smote him with the edge of the sword, and possessed his land from Arnon unto Jabbok, even unto the children of Ammon: for the border of the children of Ammon was strong.* The same Arnon-to-Jabbok inheritance Jasher 85:17 says Israel took possession of.'),
  -- thread: jasher-85-og-bashan-giant
  ('jasher', 'jasher', 85, 21, 'canon', 'numbers', 21, 33, 'free', E'Numbers 21:33 — *And they turned and went up by the way of Bashan: and Og the king of Bashan went out against them, he, and all his people, to the battle at Edrei.* The same march ''by the way of Bashan'' against Og that Jasher 85:21 opens with.'),
  ('jasher', 'jasher', 85, 26, 'canon', 'numbers', 21, 34, 'free', E'Numbers 21:34 — *And Yahuah (LORD) said unto Moses, Fear him not: for I have delivered him into thy hand, and all his people, and his land; and thou shalt do to him as thou didst unto Sihon king of the Amorites, which dwelt at Heshbon.* The very ''Be not afraid of him... as you did to Sihon'' Yahuah speaks in Jasher 85:26.'),
  ('jasher', 'jasher', 85, 22, 'canon', 'deuteronomy', 3, 11, 'free', E'Deuteronomy 3:11 — *For only Og king of Bashan remained of the remnant of giants; behold, his bedstead was a bedstead of iron; is it not in Rabbath of the children of Ammon? nine cubits was the length thereof, and four cubits the breadth of it, after the cubit of a man.* The canon''s own memory of Og as a giant, which Jasher 85:22 magnifies into the ''very powerful man.'''),
  -- thread: jasher-85-balak-balaam
  ('jasher', 'jasher', 85, 45, 'canon', 'numbers', 22, 5, 'free', E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* The same words Balak sends in Jasher 85:45.'),
  ('jasher', 'jasher', 85, 46, 'canon', 'numbers', 22, 6, 'free', E'Numbers 22:6 — *Come now therefore, I pray thee, curse me this people; for they are too mighty for me: peradventure I shall prevail, that we may smite them, and that I may drive them out of the land: for I wot that he whom thou blessest is blessed, and he whom thou cursest is cursed.* The verbatim ''whom you bless is blessed, and whom you curse is cursed'' of Jasher 85:46.'),
  ('jasher', 'jasher', 85, 48, 'canon', 'numbers', 22, 12, 'free', E'Numbers 22:12 — *And Elohim (God) said unto Balaam, Thou shalt not go with them; thou shalt not curse the people: for they are blessed.* Yahuah''s ''Curse not this people for it is blessed'' in Jasher 85:48 — the election the curse cannot touch.'),
  ('jasher', 'jasher', 85, 49, 'canon', '2-peter', 2, 15, 'free', E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* The NT names the very ''way of Balaam'' — the hire-seeking prophet of Jasher 85:49 — as a pattern of warning.'),
  -- thread: jasher-85-baal-peor-phinehas
  ('jasher', 'jasher', 85, 52, 'canon', 'numbers', 25, 1, 'free', E'Numbers 25:1 — *And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab.* The same Shittim whoredom that opens Jasher 85:52.'),
  ('jasher', 'jasher', 85, 59, 'canon', 'numbers', 25, 3, 'free', E'Numbers 25:3 — *And Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel).* The eating of Moab''s sacrifice in Jasher 85:59 is the canon''s joining to Baal-peor.'),
  ('jasher', 'jasher', 85, 61, 'canon', 'numbers', 25, 9, 'free', E'Numbers 25:9 — *And those that died in the plague were twenty and four thousand.* The exact ''twenty-four thousand men'' the pestilence slew in Jasher 85:61.'),
  ('jasher', 'jasher', 85, 63, 'canon', 'numbers', 25, 8, 'free', E'Numbers 25:8 — *And he went after the man of Yashar''el (Israel) into the tent, and thrust both of them through, the man of Yashar''el (Israel), and the woman through her belly. So the plague was stayed from the children of Yashar''el (Israel).* The very spear of Phineas and the staying of the plague that ends Jasher 85:63 — and the book.'),
  ('jasher', 'jasher', 85, 59, 'canon', 'psalms', 106, 28, 'free', E'Psalm 106:28 — *They joined themselves also unto Baal-peor, and ate the sacrifices of the dead.* The Psalm''s verdict on the eating of Moab''s sacrifices in Jasher 85:59.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja85_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja85_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-85-arad-hormah',
       E'King Arad and the vow at Hormah',
       E'Jasher opens its last chapter with the southern king who barred the seed: *And king Arad the Canaanite, who dwelt in the south, heard that the Israelites had come by the way of the spies, and he arranged his forces to fight against the Israelites* (Jasher 85:1). Numbers tells the same scene — *And when king Arad the Canaanite, which dwelt in the south, heard tell that Yashar''el (Israel) came by the way of the spies; then he fought against Yashar''el (Israel), and took some of them prisoners* (Numbers 21:1). And Yashar''el answers with a vow that Yahuah honors: *And Yahuah (LORD) hearkened to the voice of Yashar''el (Israel), and delivered up the Canaanites; and they utterly destroyed them and their cities: and he called the name of the place Hormah* (Numbers 21:3) — the very Hormah Jasher names. It ain''t new: the chosen seed is given the land it was promised, the kingdom-of-Canaan broken before the called people.',
       sv.verse_id, ev.verse_id, 'extras', 57100
  FROM _session252_ja85_lookup sv, _session252_ja85_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=85 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-85-sihon-amorites',
       E'Sihon king of the Amorites refuses passage',
       E'Jasher narrates the embassy and the war: *And the children of Israel sent messengers to Sihon, king of the Amorites, saying, Let us pass through your land* (Jasher 85:13-14), and when *Sihon would not suffer the Israelites to pass* he mustered the Amorites and *fought against Israel in Jahaz* (Jasher 85:14-15). Numbers carries the identical message and refusal — *Let me pass through thy land: we will not turn into the fields, or into the vineyards... but we will go along by the king''s high way* (Numbers 21:22) — and the identical battle at Jahaz: *And Sihon would not suffer Yashar''el (Israel) to pass through his border: but Sihon gathered all his people together, and went out against Yashar''el (Israel) into the wilderness: and he came to Jahaz, and fought against Yashar''el (Israel)* (Numbers 21:23). The land taken ''from Arnon to Jabuk'' (Jasher 85:17) is the canon''s own inheritance line (Numbers 21:24). The seed delivered with a high hand.',
       sv.verse_id, ev.verse_id, 'extras', 57103
  FROM _session252_ja85_lookup sv, _session252_ja85_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=85 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-85-og-bashan-giant',
       E'Og the giant of Bashan',
       E'Jasher expands the conquest of Og with legend — *And Og king of Bashan was a very powerful man* who lifts a stone ''the length of three parsa'' to crush the camp, until *the angel of Yahuah (the Lord) came and pierced the stone upon the head of Og* (Jasher 85:22-25). The canon scene it amplifies is plain: *And they turned and went up by the way of Bashan: and Og the king of Bashan went out against them, he, and all his people, to the battle at Edrei* (Numbers 21:33), with Yahuah''s word of assurance — *Fear him not: for I have delivered him into thy hand* (Numbers 21:34). Where Jasher''s stone-and-angel is legend, the canon still preserves Og as the last of the giants: *For only Og king of Bashan remained of the remnant of giants; behold, his bedstead was a bedstead of iron* (Deuteronomy 3:11). Anchor the legend to the scene it expands; do not force the marvel.',
       sv.verse_id, ev.verse_id, 'extras', 57106
  FROM _session252_ja85_lookup sv, _session252_ja85_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=21
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=85 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-85-balak-balaam',
       E'Balak hires Balaam, but the seed is blessed',
       E'Moab, terrified, makes Balak king and sends for the prophet-for-hire: *Behold there is a people come out from Egypt, behold they cover the face of the earth... Now therefore come and curse this people for me* (Jasher 85:45-46). Word for word the canon: *Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me* (Numbers 22:5) and *curse me this people; for they are too mighty for me... for I wot that he whom thou blessest is blessed, and he whom thou cursest is cursed* (Numbers 22:6). But the election stands — Yahuah forbids the curse, *And Elohim (God) said unto Balaam, Thou shalt not go with them; thou shalt not curse the people: for they are blessed* (Numbers 22:12), exactly Jasher''s *Curse not this people for it is blessed* (Jasher 85:48). The chosen seed cannot be cursed; the way of Balaam (the wages of unrighteousness) is named for warning in the NT — *following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* (2 Peter 2:15). It ain''t new: the blessing on the seed is irrevocable.',
       sv.verse_id, ev.verse_id, 'extras', 57109
  FROM _session252_ja85_lookup sv, _session252_ja85_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=44
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=85 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-85-baal-peor-phinehas',
       E'Baal-Peor, the plague, and the zeal of Phinehas',
       E'Failing to curse, Moab corrupts instead: *And when the children of Israel abode in the plain of Shittim, they began to commit whoredom with the daughters of Moab* (Jasher 85:52), seated and feasted them to *eat of their sacrifice* (Jasher 85:59). The canon is identical — *And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab* (Numbers 25:1), *And Yashar''el (Israel) joined himself unto Baal-peor* (Numbers 25:3). The plague that ''there died of the Israelites twenty-four thousand men'' (Jasher 85:61) is the canon''s *And those that died in the plague were twenty and four thousand* (Numbers 25:9), stayed by Phinehas: *And he went after the man of Yashar''el (Israel) into the tent, and thrust both of them through... So the plague was stayed from the children of Yashar''el (Israel)* (Numbers 25:8) — Jasher''s last named act (Jasher 85:63). The Psalm seals the verdict: *They joined themselves also unto Baal-peor, and ate the sacrifices of the dead* (Psalm 106:28). The seed is kept by the zeal of the priest; the way of Balaam (the snare of fornication and idol-food) is named again in Revelation. So ends the book of Jasher.',
       sv.verse_id, ev.verse_id, 'extras', 57112
  FROM _session252_ja85_lookup sv, _session252_ja85_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=52
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=85 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-85-arad-hormah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 21:1 — *And when king Arad the Canaanite, which dwelt in the south, heard tell that Yashar''el (Israel) came by the way of the spies; then he fought against Yashar''el (Israel), and took some of them prisoners.* The same Arad who ''dwelt in the south'' and arranged his host against Israel in Jasher 85:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-arad-hormah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:3 — *And Yahuah (LORD) hearkened to the voice of Yashar''el (Israel), and delivered up the Canaanites; and they utterly destroyed them and their cities: and he called the name of the place Hormah.* The canon names the same Hormah Jasher 85:8 calls ''the name of the place.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-arad-hormah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-85-sihon-amorites
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 21:22 — *Let me pass through thy land: we will not turn into the fields, or into the vineyards; we will not drink of the waters of the well: but we will go along by the king’s high way, until we be past thy borders.* The same plea to Sihon that Jasher 85:14 puts on Israel''s lips.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-sihon-amorites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:23 — *And Sihon would not suffer Yashar''el (Israel) to pass through his border: but Sihon gathered all his people together, and went out against Yashar''el (Israel) into the wilderness: and he came to Jahaz, and fought against Yashar''el (Israel).* The very battle at Jahaz that Jasher 85:15 recounts.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-sihon-amorites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 21:24 — *And Yashar''el (Israel) smote him with the edge of the sword, and possessed his land from Arnon unto Jabbok, even unto the children of Ammon: for the border of the children of Ammon was strong.* The same Arnon-to-Jabbok inheritance Jasher 85:17 says Israel took possession of.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-sihon-amorites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-85-og-bashan-giant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 21:33 — *And they turned and went up by the way of Bashan: and Og the king of Bashan went out against them, he, and all his people, to the battle at Edrei.* The same march ''by the way of Bashan'' against Og that Jasher 85:21 opens with.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-og-bashan-giant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:34 — *And Yahuah (LORD) said unto Moses, Fear him not: for I have delivered him into thy hand, and all his people, and his land; and thou shalt do to him as thou didst unto Sihon king of the Amorites, which dwelt at Heshbon.* The very ''Be not afraid of him... as you did to Sihon'' Yahuah speaks in Jasher 85:26.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-og-bashan-giant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 3:11 — *For only Og king of Bashan remained of the remnant of giants; behold, his bedstead was a bedstead of iron; is it not in Rabbath of the children of Ammon? nine cubits was the length thereof, and four cubits the breadth of it, after the cubit of a man.* The canon''s own memory of Og as a giant, which Jasher 85:22 magnifies into the ''very powerful man.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-og-bashan-giant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-85-balak-balaam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* The same words Balak sends in Jasher 85:45.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-balak-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 22:6 — *Come now therefore, I pray thee, curse me this people; for they are too mighty for me: peradventure I shall prevail, that we may smite them, and that I may drive them out of the land: for I wot that he whom thou blessest is blessed, and he whom thou cursest is cursed.* The verbatim ''whom you bless is blessed, and whom you curse is cursed'' of Jasher 85:46.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-balak-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 22:12 — *And Elohim (God) said unto Balaam, Thou shalt not go with them; thou shalt not curse the people: for they are blessed.* Yahuah''s ''Curse not this people for it is blessed'' in Jasher 85:48 — the election the curse cannot touch.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-balak-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* The NT names the very ''way of Balaam'' — the hire-seeking prophet of Jasher 85:49 — as a pattern of warning.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-balak-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-85-baal-peor-phinehas
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:1 — *And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab.* The same Shittim whoredom that opens Jasher 85:52.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-baal-peor-phinehas'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:3 — *And Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel).* The eating of Moab''s sacrifice in Jasher 85:59 is the canon''s joining to Baal-peor.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-baal-peor-phinehas'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 25:9 — *And those that died in the plague were twenty and four thousand.* The exact ''twenty-four thousand men'' the pestilence slew in Jasher 85:61.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-baal-peor-phinehas'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=61
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 25:8 — *And he went after the man of Yashar''el (Israel) into the tent, and thrust both of them through, the man of Yashar''el (Israel), and the woman through her belly. So the plague was stayed from the children of Yashar''el (Israel).* The very spear of Phineas and the staying of the plague that ends Jasher 85:63 — and the book.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-baal-peor-phinehas'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=63
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 106:28 — *They joined themselves also unto Baal-peor, and ate the sacrifices of the dead.* The Psalm''s verdict on the eating of Moab''s sacrifices in Jasher 85:59.'
  FROM cross_reference_threads t, cross_references x, _session252_ja85_lookup sv, _session252_ja85_lookup tv
 WHERE t.slug='jasher-85-baal-peor-phinehas'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=85 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

