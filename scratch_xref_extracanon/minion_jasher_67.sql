-- ----- fragment: minion_jasher_67.sql (session252 jasher 67) -----
-- Source anchor: jasher/jasher ch67. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja67 (view _session252_ja67_lookup). Sort band base 56650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja67_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-67-levi-house-amram
  ('jasher', 'jasher', 67, 1, 'canon', 'exodus', 2, 1, 'free', E'Exodus 2:1 — *And there went a man of the house of Levi, and took to wife a daughter of Levi.* The Torah''s bare notice of Moses'' Levite parents is the very lineage Jasher 67:1-2 names as Amram son of Kehath and Jochebed.'),
  ('jasher', 'jasher', 67, 3, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The embittering that Jasher 67:3 makes the reason for Miriam''s name is the Exodus bondage itself.'),
  ('jasher', 'jasher', 67, 4, 'canon', 'exodus', 1, 22, 'free', E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* The blood-spilling of the male children that frames Aaron''s birth in Jasher 67:4 is Pharaoh''s river-edict.'),
  -- thread: jasher-67-bondage-foretold-to-abraham
  ('jasher', 'jasher', 67, 51, 'canon', 'exodus', 1, 22, 'free', E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* Jasher 67:51-52 retells this proclamation word for word — sons to the river, daughters spared.'),
  ('jasher', 'jasher', 67, 50, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The affliction Pharaoh enacts on Balaam''s counsel in Jasher 67:50 was foretold to Abraham as the covenant''s own appointed sojourn.'),
  ('jasher', 'jasher', 67, 51, 'canon', 'acts', 7, 6, 'free', E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen names the same four-hundred-year bondage that Jasher 67:51 shows reaching its cruelest hour at the river.'),
  ('jasher', 'jasher', 67, 52, 'canon', 'acts', 7, 19, 'free', E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* The casting-out of the Hebrew sons in Jasher 67:52 is exactly the subtlety Stephen lays to the king who knew not Joseph.'),
  ('jasher', 'jasher', 67, 49, 'jubilees', 'jubilees', 47, 2, 'extras', E'Jubilees 47:2 — *And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river.* The Jubilees apparatus carries the same decree that Balaam counsels in Jasher 67:49 — the male children into the river.'),
  -- thread: jasher-67-way-of-balaam
  ('jasher', 'jasher', 67, 8, 'canon', 'numbers', 22, 5, 'free', E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me.* The Balaam son of Beor whom Pharaoh makes counsellor in Jasher 67:8 is the very diviner Moab will hire against Israel.'),
  ('jasher', 'jasher', 67, 49, 'canon', '2-peter', 2, 15, 'free', E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness.* Balaam''s river-counsel for honor and presents in Jasher 67:49 is the same wages-loving way Peter names.'),
  ('jasher', 'jasher', 67, 49, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The error of Balaam for reward that Jude pronounces woe upon is the counsel Jasher 67:49 puts in Balaam''s mouth before Pharaoh.'),
  -- thread: jasher-67-reuel-jethro-defends
  ('jasher', 'jasher', 67, 30, 'canon', 'genesis', 12, 17, 'free', E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* Reuel''s first proof in Jasher 67:30 — the former Pharaoh smitten over Sarah — is this Genesis plague.'),
  ('jasher', 'jasher', 67, 31, 'canon', 'genesis', 20, 18, 'free', E'Genesis 20:18 — *For Yahuah (LORD) had fast closed up all the wombs of the house of Abimelech, because of Sarah Abraham''s wife.* The stopped wombs of Gerar that Jasher 67:31 cites are the Torah''s judgment on Abimelech for Sarah.'),
  ('jasher', 'jasher', 67, 28, 'canon', 'genesis', 22, 13, 'free', E'Genesis 22:13 — *And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* The chosen inheritance Reuel pleads for in Jasher 67:28 is the same Isaac-line the ram redeemed at the binding — election kept by Yahuah''s own hand.'),
  -- thread: jasher-67-seed-multiplies
  ('jasher', 'jasher', 67, 59, 'canon', 'exodus', 1, 12, 'free', E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* The plough that cannot hurt the infants in Jasher 67:59 dramatizes this Exodus paradox of affliction breeding increase.'),
  ('jasher', 'jasher', 67, 55, 'canon', 'exodus', 1, 7, 'free', E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The oath to multiply that Jasher 67:55 invokes is the very multiplying Exodus records filling the land.'),
  ('jasher', 'jasher', 67, 59, 'jubilees', 'jubilees', 46, 15, 'extras', E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* The Jubilees apparatus carries the same wonder Jasher 67:59 stages — evil dealing only multiplies the chosen seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja67_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja67_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-67-levi-house-amram',
       E'A man of the house of Levi — Amram, Jochebed, and the children of the bondage',
       E'Jasher opens the deliverer''s lineage exactly where Exodus does: *There was a man in the land of Egypt of the seed of Levi, whose name was Amram, the son of Kehath, the son of Levi, the son of Israel* (Jasher 67:1), who *took a wife, namely Jochebed* (Jasher 67:2) and *bare a daughter, and she called her name Miriam, because in those days the Egyptians had embittered the lives of the children of Israel* (Jasher 67:3). The Torah carries the same house, plain and unadorned: *And there went a man of the house of Levi, and took to wife a daughter of Levi* (Exodus 2:1). The Levite house and the embittered lives are no new tale — Jasher only fills in the names around the source. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56650
  FROM _session252_ja67_lookup sv, _session252_ja67_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=67 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-67-bondage-foretold-to-abraham',
       E'The seed multiplies and the river-edict — bondage foretold to Abraham',
       E'When Pharaoh decrees *Every male child born to the Hebrews from this day forward shall be thrown into the water* (Jasher 67:51) and that *every son born to the Hebrews shall be cast into the river, but every daughter you shall let live* (Jasher 67:52), Jasher is retelling the Exodus edict — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river* (Exodus 1:22). But the deeper root is the word given to Abraham generations earlier: *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). Stephen preaches the same foretelling — *that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6) — and names the king *which knew not Joseph* who *cast out their young children* (Acts 7:19). The kingdom-of-man slays the chosen child; the covenant word stands above it. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56653
  FROM _session252_ja67_lookup sv, _session252_ja67_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=49
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=67 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-67-way-of-balaam',
       E'Balaam son of Beor, Pharaoh''s counsellor — the way of Balaam',
       E'Jasher seats the diviner at Pharaoh''s elbow: *Balaam the son of Beor fled from the land of Chittim, and he went and came to Egypt to Pharaoh king of Egypt* (Jasher 67:8), and it is he who advises *let him order all their children which shall be born from this day forward, to be thrown into the water, for by this can you wipe away their name* (Jasher 67:49). This is the same Balaam son of Beor the Torah will summon against Israel — *He sent messengers therefore unto Balaam the son of Beor to Pethor* (Numbers 22:5). The apostles name his road the proverb of false counsel sold for reward: *following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* (2 Peter 2:15), they *ran greedily after the error of Balaam for reward* (Jude 1:11). The counsel to slay the chosen seed is the way of Balaam from the first.',
       sv.verse_id, ev.verse_id, 'extras', 56656
  FROM _session252_ja67_lookup sv, _session252_ja67_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=67 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-67-reuel-jethro-defends',
       E'Reuel the Midianite''s plea — none stretch a hand against the chosen seed',
       E'Against Balaam''s malice, Pharaoh''s counsellor Reuel pleads for the Hebrews: *these are they whom Yahuah (the Lord) chose in days of old, and took as the lot of his inheritance from amongst all the nations of the earth... and who is there that stretched his hand against them with impunity?* (Jasher 67:28). His proof is the patriarchs preserved. When Pharaoh took Sarah, *Elohim smote him and his household with heavy plagues* (Jasher 67:30) — the Torah''s own *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17). When Abimelech took her, every womb was stopped (Jasher 67:31) — *For Yahuah (LORD) had fast closed up all the wombs of the house of Abimelech, because of Sarah Abraham''s wife* (Genesis 20:18). Jethro reads the election rightly: the seed is chosen and kept, and no king touches it with impunity. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56659
  FROM _session252_ja67_lookup sv, _session252_ja67_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=67 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-67-seed-multiplies',
       E'The more they afflict, the more they multiply — the seed kept',
       E'Pharaoh ploughs the fields to crush the hidden infants, yet *when they ploughed they were unable to hurt the infants of the children of Israel, so the people increased and waxed exceedingly* (Jasher 67:59), for Yahuah *had sworn to their ancestors to multiply them* (Jasher 67:55). This is the Exodus paradox set on the page: *But the more they afflicted them, the more they multiplied and grew* (Exodus 1:12), because *the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them* (Exodus 1:7). Jubilees preserves the same wonder — *the more they dealt evilly with them, the more they increased and multiplied* (Jubilees 46:15). The covenant oath to multiply the seed cannot be ploughed under. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56662
  FROM _session252_ja67_lookup sv, _session252_ja67_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=55
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=67 AND ev.verse_number=59
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-67-levi-house-amram
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:1 — *And there went a man of the house of Levi, and took to wife a daughter of Levi.* The Torah''s bare notice of Moses'' Levite parents is the very lineage Jasher 67:1-2 names as Amram son of Kehath and Jochebed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-levi-house-amram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The embittering that Jasher 67:3 makes the reason for Miriam''s name is the Exodus bondage itself.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-levi-house-amram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* The blood-spilling of the male children that frames Aaron''s birth in Jasher 67:4 is Pharaoh''s river-edict.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-levi-house-amram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-67-bondage-foretold-to-abraham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* Jasher 67:51-52 retells this proclamation word for word — sons to the river, daughters spared.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-bondage-foretold-to-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The affliction Pharaoh enacts on Balaam''s counsel in Jasher 67:50 was foretold to Abraham as the covenant''s own appointed sojourn.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-bondage-foretold-to-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen names the same four-hundred-year bondage that Jasher 67:51 shows reaching its cruelest hour at the river.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-bondage-foretold-to-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* The casting-out of the Hebrew sons in Jasher 67:52 is exactly the subtlety Stephen lays to the king who knew not Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-bondage-foretold-to-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 47:2 — *And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river.* The Jubilees apparatus carries the same decree that Balaam counsels in Jasher 67:49 — the male children into the river.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-bondage-foretold-to-abraham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=49
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-67-way-of-balaam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me.* The Balaam son of Beor whom Pharaoh makes counsellor in Jasher 67:8 is the very diviner Moab will hire against Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-way-of-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness.* Balaam''s river-counsel for honor and presents in Jasher 67:49 is the same wages-loving way Peter names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-way-of-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The error of Balaam for reward that Jude pronounces woe upon is the counsel Jasher 67:49 puts in Balaam''s mouth before Pharaoh.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-way-of-balaam'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-67-reuel-jethro-defends
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* Reuel''s first proof in Jasher 67:30 — the former Pharaoh smitten over Sarah — is this Genesis plague.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-reuel-jethro-defends'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 20:18 — *For Yahuah (LORD) had fast closed up all the wombs of the house of Abimelech, because of Sarah Abraham''s wife.* The stopped wombs of Gerar that Jasher 67:31 cites are the Torah''s judgment on Abimelech for Sarah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-reuel-jethro-defends'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:13 — *And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* The chosen inheritance Reuel pleads for in Jasher 67:28 is the same Isaac-line the ram redeemed at the binding — election kept by Yahuah''s own hand.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-reuel-jethro-defends'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-67-seed-multiplies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* The plough that cannot hurt the infants in Jasher 67:59 dramatizes this Exodus paradox of affliction breeding increase.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The oath to multiply that Jasher 67:55 invokes is the very multiplying Exodus records filling the land.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* The Jubilees apparatus carries the same wonder Jasher 67:59 stages — evil dealing only multiplies the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja67_lookup sv, _session252_ja67_lookup tv
 WHERE t.slug='jasher-67-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=67 AND sv.verse_number=59
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

