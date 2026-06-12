-- ----- fragment: minion_jasher_78.sql (session252 jasher 78) -----
-- Source anchor: jasher/jasher ch78. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja78 (view _session252_ja78_lookup). Sort band base 56925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja78_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-78-zipporah-gershom-eliezer
  ('jasher', 'jasher', 78, 7, 'canon', 'exodus', 2, 21, 'free', E'Exodus 2:21 — *And Moses was content to dwell with the man: and he gave Moses Zipporah his daughter.* The Exodus source for Jasher 78:7''s marriage of Moses to Zipporah, daughter of Reuel/Jethro the Midianite.'),
  ('jasher', 'jasher', 78, 9, 'canon', 'exodus', 2, 22, 'free', E'Exodus 2:22 — *And she bare him a son, and he called his name Gershom: for he said, I have been a stranger in a strange land.* The same naming of Gershom that Jasher 78:9 records, the stranger-in-a-foreign-land confession word for word.'),
  ('jasher', 'jasher', 78, 9, 'canon', 'acts', 7, 29, 'free', E'Acts 7:29 — *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons.* Stephen counts the two Midian-born sons (Jasher''s Gershom of 78:9 and Eliezer of 78:10), the same exile household.'),
  ('jasher', 'jasher', 78, 7, 'jubilees', 'jubilees', 48, 1, 'extras', E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* The live Jubilees apparatus dates the very Midian sojourn Jasher 78:7 opens.'),
  -- thread: jasher-78-the-elohim-of-thy-fathers-my-help
  ('jasher', 'jasher', 78, 10, 'canon', 'acts', 7, 32, 'free', E'Acts 7:32 — *Saying, I am the Elohim (God) of thy fathers, the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob. Then Moses trembled, and durst not behold.* The Elohim of the fathers whom Jasher 78:10 names Eliezer to honor is the same who speaks from the bush.'),
  ('jasher', 'jasher', 78, 10, 'canon', 'acts', 7, 35, 'free', E'Acts 7:35 — *This Moses whom they refused, saying, Who made thee a ruler and a judge? the same did Elohim (God) send to be a ruler and a deliverer by the hand of the angel which appeared to him in the bush.* The deliverer-from-Pharaoh''s-sword that Eliezer''s name marks in Jasher 78:10.'),
  -- thread: jasher-78-no-straw-the-tale-of-bricks
  ('jasher', 'jasher', 78, 12, 'canon', 'exodus', 5, 7, 'free', E'Exodus 5:7 — *Ye shall no more give the people straw to make brick, as heretofore: let them go and gather straw for themselves.* Pharaoh''s no-straw decree, the source of Jasher 78:12''s proclamation word for word.'),
  ('jasher', 'jasher', 78, 13, 'canon', 'exodus', 5, 8, 'free', E'Exodus 5:8 — *And the tale of the bricks, which they did make heretofore, ye shall lay upon them; ye shall not diminish ought thereof: for they be idle; therefore they cry, saying, Let us go and sacrifice to our Elohim (God).* The undiminished tale of bricks and the idle-charge that Jasher 78:13 records.'),
  ('jasher', 'jasher', 78, 11, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The bitter brick-bondage and heavier yoke Jasher 78:11 says Pharaoh increased.'),
  -- thread: jasher-78-the-cry-and-the-covenant-remembered
  ('jasher', 'jasher', 78, 14, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The cry of Jasher 78:14 heard and answered by the remembered covenant.'),
  ('jasher', 'jasher', 78, 16, 'canon', 'exodus', 3, 8, 'free', E'Exodus 3:8 — *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey; unto the place of the Canaanites, and the Hittites, and the Amorites, and the Perizzites, and the Hivites, and the Jebusites.* Yahuah''s resolve to take them out and give them Canaan, the same purpose Jasher 78:16 declares.'),
  ('jasher', 'jasher', 78, 16, 'canon', 'exodus', 6, 8, 'free', E'Exodus 6:8 — *And I will bring you in unto the land, concerning the which I did swear to give it to Abraham, to Isaac, and to Jacob; and I will give it you for an heritage: I am Yahuah (LORD).* The land of Canaan for a possession that Jasher 78:16 names is the sworn inheritance.'),
  ('jasher', 'jasher', 78, 15, 'jubilees', 'jubilees', 48, 7, 'extras', E'Jubilees 48:7 — *And everything took place according to your words; ten great and terrible judgments came on the land of Egypt that you might execute vengeance on it for Yashar''el (Israel). And Yahuah (God) did everything for Yashar''el''s (Israel''s) sake, and according to His covenant, which He had ordained with Abraham that He would take vengeance on them as they had brought them by force into bondage.* The live Jubilees apparatus reads Yahuah seeing the oppression (Jasher 78:15) as covenant-keeping vengeance for Israel''s sake.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja78_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja78_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-78-zipporah-gershom-eliezer',
       E'Moses in Midian — Zipporah, Gershom and Eliezer',
       E'Jasher carries the Exodus scene at the well''s end forward into Moses'' household in Midian: *In those days Moses, the son of Amram, in Midian, took Zipporah, the daughter of Reuel the Midianite, for a wife* (Jasher 78:7), and *Zipporah conceived and bare a son and he called his name Gershom, for he said, I was a stranger in a foreign land; but he circumcised not his foreskin, at the command of Reuel his father-in-law* (Jasher 78:9). It ain''t new — Exodus tells the same: *And Moses was content to dwell with the man: and he gave Moses Zipporah his daughter* (Exodus 2:21), and *And she bare him a son, and he called his name Gershom: for he said, I have been a stranger in a strange land* (Exodus 2:22). Stephen''s witness counts the two sons as Moses'' exile fruit — *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons* (Acts 7:29). The living Jubilees apparatus dates the same sojourn: *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee* (Jubilees 48:1). The deliverer is being hidden among the Midianites, the covenant seed kept until the appointed return.',
       sv.verse_id, ev.verse_id, 'extras', 56925
  FROM _session252_ja78_lookup sv, _session252_ja78_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=78 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-78-the-elohim-of-thy-fathers-my-help',
       E'Eliezer — the Elohim of the fathers my help',
       E'When the second son is named, Jasher puts the deliverance-confession in Moses'' mouth: *And she conceived again and bare a son, but circumcised his foreskin, and called his name Eliezer, for Moses said, Because the Elohim (God) of your fathers was my help, and delivered me from the sword of Pharaoh* (Jasher 78:10). The naming reaches back to the covenant Elohim of Abraham, Isaac and Jacob — the same Name the bush will speak: *Saying, I am the Elohim (God) of thy fathers, the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob. Then Moses trembled, and durst not behold* (Acts 7:32). And the deliverance from Pharaoh''s sword that Eliezer''s name memorializes is the rescue Stephen records: *This Moses whom they refused, saying, Who made thee a ruler and a judge? the same did Elohim (God) send to be a ruler and a deliverer by the hand of the angel which appeared to him in the bush* (Acts 7:35). It ain''t new — the Elohim of the fathers is the help and the deliverer, named in a child before the plagues ever begin.',
       sv.verse_id, ev.verse_id, 'extras', 56928
  FROM _session252_ja78_lookup sv, _session252_ja78_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=78 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-78-no-straw-the-tale-of-bricks',
       E'Give no more straw — the tale of bricks unchanged',
       E'Jasher tells the burden made heavier exactly as Exodus does: *And Pharaoh king of Egypt greatly increased the labor of the children of Israel in those days, and continued to make his yoke heavier upon the children of Israel* (Jasher 78:11), and *he ordered a proclamation to be made in Egypt, saying, Give no more straw to the people to make bricks with, let them go and gather themselves straw as they can find it* (Jasher 78:12), with *the tale of bricks which they shall make let them give each day, and diminish nothing from them, for they are idle in their work* (Jasher 78:13). It ain''t new — Pharaoh''s own decree in Exodus runs the same: *Ye shall no more give the people straw to make brick, as heretofore: let them go and gather straw for themselves* (Exodus 5:7), and *the tale of the bricks, which they did make heretofore, ye shall lay upon them; ye shall not diminish ought thereof: for they be idle; therefore they cry, saying, Let us go and sacrifice to our Elohim (God)* (Exodus 5:8). This is the kingdom-of-man system grinding the covenant people — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour* (Exodus 1:14). The burden is on Pharaoh''s order, not on the people; Yahuah will dismantle the system.',
       sv.verse_id, ev.verse_id, 'extras', 56931
  FROM _session252_ja78_lookup sv, _session252_ja78_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=78 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-78-the-cry-and-the-covenant-remembered',
       E'The cry heard — Yahuah jealous for his inheritance',
       E'Jasher narrates the cry that turns the Exodus: *And the children of Israel heard this, and they mourned and sighed, and they cried to Yahuah (the Lord) on account of the bitterness of their souls* (Jasher 78:14); *And Yahuah (the Lord) heard the cries of the children of Israel, and saw the oppression with which the Egyptians oppressed them* (Jasher 78:15); *And Yahuah (the Lord) was jealous of his people and his inheritance, and heard their voice, and he resolved to take them out of the affliction of Egypt, to give them the land of Canaan for a possession* (Jasher 78:16). It ain''t new — Exodus says the cry came up and the covenant was remembered: *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob* (Exodus 2:24). The bush confirms the coming-down to deliver: *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey* (Exodus 3:8). And the land-for-a-possession that Jasher 78:16 promises is the oath remembered: *And I will bring you in unto the land, concerning the which I did swear to give it to Abraham, to Isaac, and to Jacob; and I will give it you for an heritage: I am Yahuah (LORD)* (Exodus 6:8). The live Jubilees apparatus reads the deliverance as covenant-keeping: *And Yahuah (God) did everything for Yashar''el''s (Israel''s) sake, and according to His covenant, which He had ordained with Abraham* (Jubilees 48:7, in part). Election precedes the confession; the inheritance is kept.',
       sv.verse_id, ev.verse_id, 'extras', 56934
  FROM _session252_ja78_lookup sv, _session252_ja78_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=78 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-78-zipporah-gershom-eliezer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:21 — *And Moses was content to dwell with the man: and he gave Moses Zipporah his daughter.* The Exodus source for Jasher 78:7''s marriage of Moses to Zipporah, daughter of Reuel/Jethro the Midianite.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-zipporah-gershom-eliezer'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:22 — *And she bare him a son, and he called his name Gershom: for he said, I have been a stranger in a strange land.* The same naming of Gershom that Jasher 78:9 records, the stranger-in-a-foreign-land confession word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-zipporah-gershom-eliezer'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:29 — *Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons.* Stephen counts the two Midian-born sons (Jasher''s Gershom of 78:9 and Eliezer of 78:10), the same exile household.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-zipporah-gershom-eliezer'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 48:1 — *And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt in the second week in the second year in the fiftieth jubilee.* The live Jubilees apparatus dates the very Midian sojourn Jasher 78:7 opens.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-zipporah-gershom-eliezer'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-78-the-elohim-of-thy-fathers-my-help
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 7:32 — *Saying, I am the Elohim (God) of thy fathers, the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob. Then Moses trembled, and durst not behold.* The Elohim of the fathers whom Jasher 78:10 names Eliezer to honor is the same who speaks from the bush.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-the-elohim-of-thy-fathers-my-help'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:35 — *This Moses whom they refused, saying, Who made thee a ruler and a judge? the same did Elohim (God) send to be a ruler and a deliverer by the hand of the angel which appeared to him in the bush.* The deliverer-from-Pharaoh''s-sword that Eliezer''s name marks in Jasher 78:10.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-the-elohim-of-thy-fathers-my-help'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-78-no-straw-the-tale-of-bricks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 5:7 — *Ye shall no more give the people straw to make brick, as heretofore: let them go and gather straw for themselves.* Pharaoh''s no-straw decree, the source of Jasher 78:12''s proclamation word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-no-straw-the-tale-of-bricks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 5:8 — *And the tale of the bricks, which they did make heretofore, ye shall lay upon them; ye shall not diminish ought thereof: for they be idle; therefore they cry, saying, Let us go and sacrifice to our Elohim (God).* The undiminished tale of bricks and the idle-charge that Jasher 78:13 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-no-straw-the-tale-of-bricks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The bitter brick-bondage and heavier yoke Jasher 78:11 says Pharaoh increased.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-no-straw-the-tale-of-bricks'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-78-the-cry-and-the-covenant-remembered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The cry of Jasher 78:14 heard and answered by the remembered covenant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-the-cry-and-the-covenant-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:8 — *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey; unto the place of the Canaanites, and the Hittites, and the Amorites, and the Perizzites, and the Hivites, and the Jebusites.* Yahuah''s resolve to take them out and give them Canaan, the same purpose Jasher 78:16 declares.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-the-cry-and-the-covenant-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 6:8 — *And I will bring you in unto the land, concerning the which I did swear to give it to Abraham, to Isaac, and to Jacob; and I will give it you for an heritage: I am Yahuah (LORD).* The land of Canaan for a possession that Jasher 78:16 names is the sworn inheritance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-the-cry-and-the-covenant-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 48:7 — *And everything took place according to your words; ten great and terrible judgments came on the land of Egypt that you might execute vengeance on it for Yashar''el (Israel). And Yahuah (God) did everything for Yashar''el''s (Israel''s) sake, and according to His covenant, which He had ordained with Abraham that He would take vengeance on them as they had brought them by force into bondage.* The live Jubilees apparatus reads Yahuah seeing the oppression (Jasher 78:15) as covenant-keeping vengeance for Israel''s sake.'
  FROM cross_reference_threads t, cross_references x, _session252_ja78_lookup sv, _session252_ja78_lookup tv
 WHERE t.slug='jasher-78-the-cry-and-the-covenant-remembered'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=78 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

