-- ----- fragment: minion_matthew_14.sql (S260 Matthew depth) -----
-- ============================================================================
-- minion_matthew_14.sql — full-library cross-reference threads for MATTHEW 14
-- death of John the Baptist / feeding the five thousand / walking on the sea /
-- it is I be not afraid / Peter / the hem of his garment
-- 4 threads, band 11390 step +3
-- ============================================================================

-- ---- 3a. Temp view ----------------------------------------------------------
CREATE TEMP VIEW _mt14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ---- 3b. The cross_references rows -----------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- THREAD 1 — death of John the Baptist (14:1-12): the Elijah pattern + Torah rebuke
  ('canon','matthew',14,4,'canon','leviticus',18,16, 'free', E'*Thou shalt not uncover the nakedness of thy brother''s wife: it is thy brother''s nakedness* (Leviticus 18:16). This is the very word John stood on: *It is not lawful for thee to have her* (Matthew 14:4). Herod had taken Herodias, his brother Philip''s wife — and John would not soften the Torah to flatter a king.'),
  ('canon','matthew',14,4,'canon','leviticus',20,21, 'free', E'*And if a man shall take his brother''s wife, it is an unclean thing: he hath uncovered his brother''s nakedness; they shall be childless* (Leviticus 20:21). The penalty-statute behind John''s rebuke — the commandment John died defending is the same commandment Yahuah gave Moses. The forerunner upholds the law, he does not loosen it.'),
  ('canon','matthew',14,5,'canon','1-kings',19,2, 'free', E'*Then Jezebel sent a messenger unto Elijah, saying, So let the gods do to me, and more also, if I make not thy life as the life of one of them by to morrow about this time* (1 Kings 19:2). The pattern repeats: a wicked queen hunts the prophet who rebuked the throne. Herodias is the new Jezebel; John is the new Elijah — *he feared the multitude, because they counted him as a prophet* (Matthew 14:5).'),
  ('canon','matthew',14,10,'canon','1-kings',19,10, 'free', E'*...the children of Yashar''el (Israel) have forsaken thy covenant... and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away* (1 Kings 19:10). Elijah''s cry over a covenant forsaken and prophets slain is answered again at the prison: *And he sent, and beheaded John in the prison* (Matthew 14:10). The Elijah who was to come (Matt 11:14) drinks the Elijah cup.'),
  ('canon','matthew',14,1,'apocrypha','ecclesiasticus',48,1, 'extras', E'*Then stood up Elias the prophet as fire, and his word burned like a lamp* (Sirach 48:1). The library remembers Elijah as the burning prophet whose word scorched kings. Herod''s guilty conscience confesses the fire still burns: *This is John the Baptist; he is risen from the dead* (Matthew 14:2) — the Elijah-fire could not be buried in a prison.'),

  -- THREAD 2 — feeding the five thousand (14:13-21): the Shepherd feeds in the wilderness
  ('canon','matthew',14,19,'canon','2-kings',4,43, 'free', E'*And his servitor said, What, should I set this before an hundred men? He said again, Give the people, that they may eat: for thus saith Yahuah (LORD), They shall eat, and shall leave thereof* (2 Kings 4:43). Elisha fed a hundred from twenty barley loaves and there was bread left over. *And they did all eat, and were filled... twelve baskets full* (Matthew 14:20) — a greater than Elisha feeds five thousand, and still the fragments overflow.'),
  ('canon','matthew',14,20,'canon','2-kings',4,44, 'free', E'*So he set it before them, and they did eat, and left thereof, according to the word of Yahuah (LORD)* (2 Kings 4:44). The sign of the prophet: bread multiplied and *left thereof*. Matthew echoes it word for word — *they took up of the fragments that remained twelve baskets full* (Matthew 14:20). The same Yahuah who provided through Elisha now provides through the Formed Son.'),
  ('canon','matthew',14,15,'canon','exodus',16,15, 'free', E'*...This is the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15). The wilderness, the murmuring, the bread that comes down — Matthew sets the scene in *a desert place* (Matthew 14:15) on purpose. The Shepherd spreads the manna-table again, in the wilderness, for a hungry flock.'),
  ('canon','matthew',14,19,'canon','psalms',78,19, 'free', E'*Yea, they spake against Elohim (God); they said, Can Elohim (God) furnish a table in the wilderness?* (Psalm 78:19). Israel''s old taunt is answered before their eyes: he *took the five loaves, and the two fishes, and looking up to heaven, he blessed, and brake, and gave* (Matthew 14:19). Yes — he can furnish a table in the wilderness.'),
  ('canon','matthew',14,20,'canon','psalms',145,16, 'free', E'*Thou openest thine hand, and satisfiest the desire of every living thing* (Psalm 145:16). The hand that opens to fill every living thing is the hand that brake the loaves. *And they did all eat, and were filled* (Matthew 14:20) — the Provider of the Psalm stands feeding the multitude.'),
  ('canon','matthew',14,19,'apocrypha','the-wisdom-of-solomon',16,20, 'extras', E'*Instead of which you feddest your own people with angels'' food, and did send them from heaven bread prepared without their labour, able to content every man''s delight, and agreeing to every taste* (Wisdom 16:20). The library names the manna *angels'' food* sent from heaven without their labour. So here: the loaves come not by labour but by his blessing, *looking up to heaven* (Matthew 14:19) — heaven''s bread, given.'),

  -- THREAD 3 — walking on the sea / it is I, be not afraid (14:22-33)
  ('canon','matthew',14,25,'canon','job',9,8, 'free', E'*Which alone spreadeth out the heavens, and treadeth upon the waves of the sea* (Job 9:8). Job names the One who alone treads the waves — and *in the fourth watch of the night Yahusha (Jesus) went unto them, walking on the sea* (Matthew 14:25). The Creator''s own footstep on the deep is set down in the Formed Son: what only Yahuah does in Job, the Son does on Galilee.'),
  ('canon','matthew',14,25,'canon','psalms',77,19, 'free', E'*Thy way is in the sea, and thy path in the great waters, and thy footsteps are not known* (Psalm 77:19). The path through the sea that no man could trace — the disciples now see footsteps on the water. *They were troubled, saying, It is a spirit* (Matthew 14:26): the Psalm''s untraceable way made visible, and it terrified them.'),
  ('canon','matthew',14,27,'canon','exodus',3,14, 'free', E'*And Elohim (God) said unto Moses, Ehyeh asher Ehyeh (I AM THAT I AM)... I AM hath sent me unto you* (Exodus 3:14). When the Son says *Be of good cheer; it is I; be not afraid* (Matthew 14:27), the divine self-naming sounds again — the Father''s own I AM made present in the Formed Son. Not a second deity striding the waves, but the invisible Father''s Name carried on the lips of the One he sent.'),
  ('canon','matthew',14,32,'canon','psalms',107,29, 'free', E'*He maketh the storm a calm, so that the waves thereof are still* (Psalm 107:29). The cry of the storm-tossed and the Yahuah who hushes the sea — *and when they were come into the ship, the wind ceased* (Matthew 14:32). The Psalm''s deliverer steps into the boat, and the sea obeys.'),
  ('canon','matthew',14,30,'canon','isaiah',43,2, 'free', E'*When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee* (Isaiah 43:2). The promise that the waters shall not swallow his own holds Peter up: *beginning to sink, he cried, saying, Lord, save me* (Matthew 14:30), and the hand was there. The waters do not overflow the one the Master holds.'),

  -- THREAD 4 — the hem of his garment (14:34-36): the tzitzit / wings of Torah
  ('canon','matthew',14,36,'canon','numbers',15,38, 'free', E'*Speak unto the children of Yashar''el (Israel)... that they make them fringes in the borders of their garments throughout their generations, and that they put upon the fringe of the borders a ribband of blue* (Numbers 15:38). The *hem of his garment* (Matthew 14:36) the sick reached for is the tzitzit — the Torah-commanded fringe. They grasped the very edge of the law he kept.'),
  ('canon','matthew',14,36,'canon','numbers',15,39, 'free', E'*And it shall be unto you for a fringe, that ye may look upon it, and remember all the commandments of Yahuah (LORD), and do them* (Numbers 15:39). The fringe exists to call the eye back to the commandments — *to remember... and do them*. The crowds reach for the badge of obedience, and *as many as touched were made perfectly whole* (Matthew 14:36).'),
  ('canon','matthew',14,36,'canon','malachi',4,2, 'free', E'*But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall* (Malachi 4:2). The word for *wings* is the same as the corner of the garment where the fringe hangs. Malachi promised *healing in his wings*; the hem they touched was that very wing, and the healing flowed.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- 3c. The threads -------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18',
       E'The death of John the Baptist — the Elijah pattern and the brother''s wife (Leviticus 18; 1 Kings 19; Sirach 48)',
       E'John the Baptist dies for a commandment. *For John said unto him, It is not lawful for thee to have her* (Matthew 14:4) — and the law he names is plain: *Thou shalt not uncover the nakedness of thy brother''s wife: it is thy brother''s nakedness* (Leviticus 18:16), with its penalty-statute, *And if a man shall take his brother''s wife, it is an unclean thing... they shall be childless* (Leviticus 20:21). Herod had taken Herodias, his brother Philip''s wife; John would not bend the Torah to flatter a throne. He upholds the law; he does not loosen it.\n\nAnd the pattern is older than Herod. *Then Jezebel sent a messenger unto Elijah, saying... if I make not thy life as the life of one of them by to morrow about this time* (1 Kings 19:2): a wicked queen hunting the prophet who rebuked the throne. Herodias is the new Jezebel, John the new Elijah — *he feared the multitude, because they counted him as a prophet* (Matthew 14:5). Elijah''s cry, *they have... slain thy prophets with the sword; and I, even I only, am left; and they seek my life* (1 Kings 19:10), is answered again at the cell: *And he sent, and beheaded John in the prison* (Matthew 14:10). The library remembers Elijah as the burning prophet — *Then stood up Elias the prophet as fire, and his word burned like a lamp* (Sirach 48:1) — and Herod''s guilty conscience confesses the fire is not out: *This is John the Baptist; he is risen from the dead* (Matthew 14:2). The forerunner drinks the Elijah cup, and dies a Torah-keeper''s death.',
       sv.verse_id, ev.verse_id, 'extras', 11390
  FROM _mt14_lookup sv, _mt14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=14 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16',
       E'Feeding the five thousand — greater than Elisha, greater than the manna (2 Kings 4; Exodus 16; Psalm 78; Wisdom 16)',
       E'In *a desert place* (Matthew 14:15) the Shepherd spreads a table. He *took the five loaves, and the two fishes, and looking up to heaven, he blessed, and brake* (Matthew 14:19), *and they did all eat, and were filled... twelve baskets full* (Matthew 14:20). The whole Tanakh is feeding this crowd.\n\nFirst Elisha: *What, should I set this before an hundred men? He said again, Give the people, that they may eat: for thus saith Yahuah (LORD), They shall eat, and shall leave thereof* (2 Kings 4:43), *and they did eat, and left thereof, according to the word of Yahuah (LORD)* (2 Kings 4:44). A hundred fed from twenty barley loaves with bread to spare — and here a greater than Elisha feeds five thousand and the fragments overflow. Then the manna: *This is the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15), the wilderness bread that came down for a murmuring people. Israel''s old taunt, *Can Elohim (God) furnish a table in the wilderness?* (Psalm 78:19), is answered before their eyes — yes, he can. The hand of the Psalm is the hand on the loaves: *Thou openest thine hand, and satisfiest the desire of every living thing* (Psalm 145:16). And the library had already named the manna heaven''s gift: *Instead of which you feddest your own people with angels'' food... bread prepared without their labour* (Wisdom 16:20). Not bread by labour but bread by blessing, *looking up to heaven* — the Shepherd of Israel feeding his flock in the wilderness, greater than Moses, greater than Elisha.',
       sv.verse_id, ev.verse_id, 'extras', 11393
  FROM _mt14_lookup sv, _mt14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=14 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3',
       E'Walking on the sea — it is I, be not afraid (Job 9; Psalm 77; Exodus 3; Isaiah 43; Psalm 107)',
       E'*In the fourth watch of the night Yahusha (Jesus) went unto them, walking on the sea* (Matthew 14:25). What the disciples saw, the Tanakh said only Yahuah could do: *Which alone spreadeth out the heavens, and treadeth upon the waves of the sea* (Job 9:8). The Creator''s own footstep on the deep is set down in the Formed Son — not a second deity striding the water, but the One through whom the Father made the sea now walking upon it. *Thy way is in the sea, and thy path in the great waters, and thy footsteps are not known* (Psalm 77:19): the untraceable path made visible, and it terrified them — *they were troubled, saying, It is a spirit* (Matthew 14:26).\n\nThen the word that quiets the storm in the soul before it quiets the sea: *Be of good cheer; it is I; be not afraid* (Matthew 14:27). In that *it is I* the divine self-naming sounds again — *Ehyeh asher Ehyeh (I AM THAT I AM)... I AM hath sent me unto you* (Exodus 3:14). The Father''s own Name, carried on the lips of the One he sent. And the promises hold: *He maketh the storm a calm, so that the waves thereof are still* (Psalm 107:29) — *and when they were come into the ship, the wind ceased* (Matthew 14:32). When Peter began to sink and cried *Lord, save me* (Matthew 14:30), the hand was there, for *when thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee* (Isaiah 43:2). The waters do not overflow the one the Master holds, and the men in the ship fall down: *Of a truth thou art the Son of Elohim (God)* (Matthew 14:33).',
       sv.verse_id, ev.verse_id, 'free', 11396
  FROM _mt14_lookup sv, _mt14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=14 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-14-the-hem-of-his-garment-the-tzitzit-wings-of-torah-numbers-15-malachi-4',
       E'They touched the hem of his garment — the tzitzit, the wings of Torah (Numbers 15; Malachi 4)',
       E'*And besought him that they might only touch the hem of his garment: and as many as touched were made perfectly whole* (Matthew 14:36). That hem is no ordinary edge — it is the tzitzit, the Torah-commanded fringe: *that they make them fringes in the borders of their garments throughout their generations, and that they put upon the fringe of the borders a ribband of blue* (Numbers 15:38). And the fringe is given for a reason: *that ye may look upon it, and remember all the commandments of Yahuah (LORD), and do them* (Numbers 15:39). The sick reach for the very badge of obedience, the hem of the Master who kept every commandment it points to.\n\nAnd there is healing in that corner. The Hebrew word for the *wings* of a garment is the same as the corner where the fringe hangs — so Malachi''s promise lands exactly here: *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall* (Malachi 4:2). The crowds grasp his wing, the tzitzit-corner of the One who keeps Torah, and the promised healing flows. They were *made perfectly whole* — under the wings of the Sun of righteousness.',
       sv.verse_id, ev.verse_id, 'free', 11399
  FROM _mt14_lookup sv, _mt14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=14 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ---- 3d. The thread_members ------------------------------------------------

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:16 — *Thou shalt not uncover the nakedness of thy brother''s wife: it is thy brother''s nakedness.* The commandment John named when he said *It is not lawful for thee to have her*.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 20:21 — *And if a man shall take his brother''s wife, it is an unclean thing... they shall be childless.* The penalty-statute behind John''s rebuke; the law upheld, not loosened.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 19:2 — *Then Jezebel sent a messenger unto Elijah... if I make not thy life as the life of one of them.* A wicked queen hunts the prophet; Herodias is the new Jezebel.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 19:10 — *...slain thy prophets with the sword; and I, even I only, am left; and they seek my life.* Elijah''s cry over a covenant forsaken, answered again at John''s prison.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 48:1 — *Then stood up Elias the prophet as fire, and his word burned like a lamp.* The library''s memory of the burning Elijah; Herod fears the fire is not out (*This is John the Baptist; he is risen from the dead*).'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-death-of-john-the-baptist-the-elijah-pattern-1-kings-19-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 4:43 — *...Give the people, that they may eat: for thus saith Yahuah (LORD), They shall eat, and shall leave thereof.* Elisha feeds a hundred from twenty loaves with bread to spare — a greater than Elisha feeds five thousand.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 4:44 — *So he set it before them, and they did eat, and left thereof, according to the word of Yahuah (LORD).* Bread multiplied and *left thereof* — Matthew''s *twelve baskets full* echoes it.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 16:15 — *...This is the bread which Yahuah (LORD) hath given you to eat.* The manna in the wilderness; the Shepherd spreads the manna-table again in *a desert place*.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 78:19 — *Can Elohim (God) furnish a table in the wilderness?* Israel''s old taunt, answered before their eyes as he blesses and breaks the loaves.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 145:16 — *Thou openest thine hand, and satisfiest the desire of every living thing.* The hand that fills every living thing is the hand that brake the loaves; *they did all eat, and were filled*.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom 16:20 — *...thou feddest thy own people with angels'' food... bread prepared without their labour.* The library names the manna heaven''s bread; here the loaves come by blessing, *looking up to heaven*.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-feeding-the-five-thousand-the-shepherd-feeds-in-the-wilderness-2-kings-4-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 9:8 — *Which alone spreadeth out the heavens, and treadeth upon the waves of the sea.* What only Yahuah does in Job, the Formed Son does on Galilee, *walking on the sea*.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 77:19 — *Thy way is in the sea... and thy footsteps are not known.* The untraceable path made visible; *they were troubled, saying, It is a spirit*.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=77 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 3:14 — *Ehyeh asher Ehyeh (I AM THAT I AM)... I AM hath sent me unto you.* In *it is I* the divine self-naming sounds — the Father''s own Name on the lips of the One he sent.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 107:29 — *He maketh the storm a calm, so that the waves thereof are still.* The Yahuah who hushes the sea steps into the boat; *the wind ceased*.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 43:2 — *When thou passest through the waters, I will be with thee... they shall not overflow thee.* The promise that holds Peter up when he cries *Lord, save me*.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-walking-on-the-sea-it-is-i-be-not-afraid-job-9-exodus-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 15:38 — *...that they make them fringes in the borders of their garments... a ribband of blue.* The *hem* they reached for is the tzitzit, the Torah-commanded fringe.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-the-hem-of-his-garment-the-tzitzit-wings-of-torah-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 15:39 — *...that ye may look upon it, and remember all the commandments of Yahuah (LORD), and do them.* The fringe is the badge of obedience; the crowds grasp the hem of the One who kept it.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-the-hem-of-his-garment-the-tzitzit-wings-of-torah-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:2 — *...the Sun of righteousness arise with healing in his wings.* The word for *wings* is the corner where the fringe hangs; the hem they touched was that very wing, and healing flowed.'
  FROM cross_reference_threads t, cross_references x, _mt14_lookup sv, _mt14_lookup tv
 WHERE t.slug='matthew-14-the-hem-of-his-garment-the-tzitzit-wings-of-torah-numbers-15-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=14 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
