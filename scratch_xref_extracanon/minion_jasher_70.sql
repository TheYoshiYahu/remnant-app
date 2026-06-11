-- ----- fragment: minion_jasher_70.sql (session252 jasher 70) -----
-- Source anchor: jasher/jasher ch70. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja70 (view _session252_ja70_lookup). Sort band base 56725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja70_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-70-balaam-counsel-slay-the-child
  ('jasher', 'jasher', 70, 5, 'canon', 'numbers', 22, 5, 'free', E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* The Torah''s Balaam son of Beor is the same magician Jasher seats at Pharaoh''s table, hired again against the seed.'),
  ('jasher', 'jasher', 70, 19, 'canon', '2-peter', 2, 15, 'free', E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* Balaam''s counsel to spill the child''s blood for the king''s favor is the very wages-of-unrighteousness way Peter names.'),
  ('jasher', 'jasher', 70, 19, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude pronounces woe on the error of Balaam for reward — the same reward Jasher''s Balaam seeks in advising Moses'' murder.'),
  -- thread: jasher-70-bondage-foretold-seed-multiplies
  ('jasher', 'jasher', 70, 15, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* Joseph''s descent into Egypt, which Balaam recounts, is the door into the affliction foretold to Abram at the covenant of the pieces.'),
  ('jasher', 'jasher', 70, 19, 'canon', 'exodus', 1, 8, 'free', E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The Pharaoh whose counsellors plot the child''s death is the new king of Exodus who forgot Joseph and turned on the seed.'),
  ('jasher', 'jasher', 70, 19, 'canon', 'exodus', 1, 7, 'free', E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The very multiplying of the seed is what makes Egypt fear and Balaam counsel murder.'),
  ('jasher', 'jasher', 70, 19, 'canon', 'acts', 7, 19, 'free', E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen names the casting-out of the children that frames Jasher''s whole scene — the kingdom of man against the seed.'),
  ('jasher', 'jasher', 70, 19, 'canon', 'matthew', 2, 16, 'free', E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* Pharaoh seeking the chosen child''s blood is the same pattern Herod repeats — the dragon ever seeking to slay the deliverer.'),
  -- thread: jasher-70-moses-preserved-coal-and-angel
  ('jasher', 'jasher', 70, 31, 'canon', 'exodus', 2, 2, 'free', E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* The canon''s plain account of the child kept alive stands beneath Jasher''s coal-legend of why the king spared him.'),
  ('jasher', 'jasher', 70, 31, 'canon', 'hebrews', 11, 23, 'free', E'Hebrews 11:23 — *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* Hebrews reads Moses'' preservation as faith that did not fear the king''s commandment — the same deliverer Jasher shows kept in Pharaoh''s house.'),
  ('jasher', 'jasher', 70, 31, 'canon', 'acts', 7, 21, 'free', E'Acts 7:21 — *And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son.* Stephen names the favor that keeps Moses in the king''s house — Jasher''s *Yahuah was with him* in Pharaoh''s hall.'),
  -- thread: jasher-70-drawn-out-nursed-jubilees
  ('jasher', 'jasher', 70, 33, 'canon', 'exodus', 2, 10, 'free', E'Exodus 2:10 — *And the child grew, and she brought him unto Pharaoh''s daughter, and he became her son. And she called his name Moses: and she said, Because I drew him out of the water.* Jasher''s Bathia who considers the grown boy a son is Exodus'' daughter of Pharaoh who drew Moses out and made him her son.'),
  ('jasher', 'jasher', 70, 33, 'canon', 'acts', 7, 22, 'free', E'Acts 7:22 — *And Moses was learned in all the wisdom of the Egyptians, and was mighty in words and in deeds.* Stephen names the wisdom Moses gained growing in the king''s house, the very upbringing Jasher narrates.'),
  ('jasher', 'jasher', 70, 33, 'jubilees', 'jubilees', 47, 9, 'extras', E'Jubilees 47:9 — *And afterwards, when you were grown up, they brought you to the daughter of Pharaoh, and you did become her son, and Amram your father taught you writing, and after you had completed three weeks they brought you into the royal court.* The Jubilees apparatus narrates the same grown-in-the-court scene, the Angel of the Presence telling Moses his own preservation.'),
  -- thread: jasher-70-moses-sees-the-burdens
  ('jasher', 'jasher', 70, 34, 'canon', 'exodus', 2, 11, 'free', E'Exodus 2:11 — *And it came to pass in those days, when Moses was grown, that he went out unto his brethren, and looked on their burdens: and he spied an Egyptian smiting an Hebrew, one of his brethren.* Jasher''s daily going-forth to see the burdens is the going-out Exodus records, the prince claiming the slaves as his brethren.'),
  ('jasher', 'jasher', 70, 41, 'canon', 'acts', 7, 23, 'free', E'Acts 7:23 — *And when he was full forty years old, it came into his heart to visit his brethren the children of Yashar''el (Israel).* Stephen names the heart that turns to visit the brethren — the grief Jasher shows Moses bearing over their hard labor.'),
  ('jasher', 'jasher', 70, 41, 'canon', 'acts', 7, 25, 'free', E'Acts 7:25 — *For he supposed his brethren would have understood how that Elohim (God) by his hand would deliver them: but they understood not.* The deliverer''s heart is already set on his people, the very compassion Jasher narrates before the slaying and the flight.'),
  -- thread: jasher-70-sabbath-rest-granted
  ('jasher', 'jasher', 70, 47, 'canon', 'genesis', 2, 2, 'free', E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* The seventh-day rest Moses obtains for Israel is the rest set in creation, kept long before Sinai.'),
  ('jasher', 'jasher', 70, 47, 'canon', 'exodus', 20, 8, 'free', E'Exodus 20:8 — *Remember the sabbath day, to keep it holy.* The command later graven in stone is the same six-days-labor, seventh-day-rest Jasher shows proclaimed in Goshen.'),
  ('jasher', 'jasher', 70, 47, 'canon', 'exodus', 20, 10, 'free', E'Exodus 20:10 — *But the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God): in it thou shalt not do any work, thou, nor thy son, nor thy daughter, thy manservant, nor thy maidservant, nor thy cattle, nor thy stranger that is within thy gates:* The proclamation''s seventh-day rest from all work is the Sabbath of the fourth word, here kept before Sinai.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja70_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja70_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-70-balaam-counsel-slay-the-child',
       E'Balaam the son of Beor counsels Pharaoh to slay the Hebrew child',
       E'*And Balaam the son of Beor the magician answered before the king and princes, and he said, Remember now, O my Lord and king, the dream which you did dream many days since, and that which your servant interpreted to you.* (Jasher 70:5) Jasher names the man at Pharaoh''s right hand: not a homonym but *Balaam the son of Beor*, the same magician the Torah will name when Moab and Midian send for him to curse the seed — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* (Numbers 22:5). Jasher shows the man''s character from the start: *If it please the king, let us now spill his blood upon the ground, lest he grow up and take away the government from your hand, and the hope of Egypt perish after he shall have reigned.* (Jasher 70:19) — counsel of murder for the wages of the king''s favor. The apostles weigh that way and find it cursed: *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* (2 Peter 2:15), and *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* (Jude 1:11). It ain''t new — the way of Balaam is the way of the kingdom of man, hired against the chosen seed.',
       sv.verse_id, ev.verse_id, 'extras', 56725
  FROM _session252_ja70_lookup sv, _session252_ja70_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=70 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-70-bondage-foretold-seed-multiplies',
       E'The seed multiplies, the new king casts the male children into the river',
       E'Behind Jasher''s Balaam-scene stands the bondage itself, foretold to Abraham and now come upon the seed. Balaam recounts the fathers'' history — *His sons sold their brother Joseph, who went down into Egypt and became a slave, and was placed in the prison house for twelve years.* (Jasher 70:15) — the very story Jasher retells from Genesis, leading into the affliction Yahuah named at the covenant of the pieces: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* (Genesis 15:13). Exodus opens the bondage Jasher''s chapter assumes: *Now there arose up a new king over Egypt, which knew not Joseph.* (Exodus 1:8) — and the seed grows the more it is crushed: *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* (Exodus 1:7). Stephen sets the same scene before the council: *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* (Acts 7:19). The kingdom of man casts the chosen seed into the river — the same pattern Herod will repeat: *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem...* (Matthew 2:16). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56728
  FROM _session252_ja70_lookup sv, _session252_ja70_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=70 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-70-moses-preserved-coal-and-angel',
       E'The child preserved: the angel turns Moses'' hand to the coal',
       E'*And they placed the boy before them, and the lad endeavored to stretch forth his hand to the onyx stone, but the angel of Yahuah (the Lord) took his hand and placed it upon the coal, and the coal became extinguished in his hand, and he lifted it up and put it into his mouth, and burned part of his lips and part of his tongue, and he became heavy in mouth and tongue.* (Jasher 70:29) Here is Jasher''s legend for why Moses was *slow of speech* — and beneath the legend, the canon''s bedrock truth: the chosen child is kept alive against the king''s intent. *So the king and princes refrained from slaying the child, so Moses remained in Pharaoh''s house, growing up, and Yahuah (the Lord) was with him.* (Jasher 70:31). Exodus tells the keeping plainly: *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* (Exodus 2:2). The writer to the Hebrews reads it as faith: *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* (Hebrews 11:23). And Stephen names the favor on the preserved child: *And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son.* (Acts 7:21). The deliverer is preserved in the house of the very king who sought his death.',
       sv.verse_id, ev.verse_id, 'extras', 56731
  FROM _session252_ja70_lookup sv, _session252_ja70_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=29
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=70 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-70-drawn-out-nursed-jubilees',
       E'Drawn out, nursed, and grown in Pharaoh''s house',
       E'*And whilst the boy was in the king''s house, he was robed in purple and he grew amongst the children of the king.* (Jasher 70:32) — *And when Moses grew up in the king''s house, Bathia the daughter of Pharaoh considered him as a son, and all the household of Pharaoh honored him, and all the men of Egypt were afraid of him.* (Jasher 70:33). Jasher''s growing-up scene retells Exodus 2: *And the child grew, and she brought him unto Pharaoh''s daughter, and he became her son. And she called his name Moses: and she said, Because I drew him out of the water.* (Exodus 2:10). Stephen rolls the same education into one verse: *And Moses was learned in all the wisdom of the Egyptians, and was mighty in words and in deeds.* (Acts 7:22). And the SAME scene stands in the Jubilees apparatus, told as the Angel of the Presence to Moses himself: *And afterwards, when you were grown up, they brought you to the daughter of Pharaoh, and you did become her son, and Amram your father taught you writing, and after you had completed three weeks they brought you into the royal court.* (Jubilees 47:9). Three witnesses, one preserved deliverer — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56734
  FROM _session252_ja70_lookup sv, _session252_ja70_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=32
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=70 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-70-moses-sees-the-burdens',
       E'Moses goes out to his brethren and sees their burdens',
       E'*And he daily went forth and came into the land of Goshen, where his brethren the children of Israel were, and Moses saw them daily in shortness of breath and hard labor.* (Jasher 70:34) — *And the day arrived when Moses went to Goshen to see his brethren, that he saw the children of Israel in their burdens and hard labor, and Moses was grieved on their account.* (Jasher 70:41). This is the turning of Moses'' heart that Exodus records in a single verse: *And it came to pass in those days, when Moses was grown, that he went out unto his brethren, and looked on their burdens: and he spied an Egyptian smiting an Hebrew, one of his brethren.* (Exodus 2:11). Stephen frames it as the visiting of a deliverer: *And when he was full forty years old, it came into his heart to visit his brethren the children of Yashar''el (Israel).* (Acts 7:23) — *For he supposed his brethren would have understood how that Elohim (God) by his hand would deliver them: but they understood not.* (Acts 7:25). The prince of Egypt owns the slaves as his brethren; the deliverer is grieved with the afflicted seed.',
       sv.verse_id, ev.verse_id, 'extras', 56737
  FROM _session252_ja70_lookup sv, _session252_ja70_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=34
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=70 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-70-sabbath-rest-granted',
       E'Moses obtains a day of rest for Israel — the seventh day',
       E'*And Moses said to Pharaoh, Let there be given to your servants the children of Israel who are in Goshen, one day to rest in it from their labor.* (Jasher 70:44) — and the proclamation that follows is Sabbath itself: *To you, all the children of Israel, thus says the king, for six days you shall do your work and labor, but on the seventh day you shall rest, and shall not preform any work, thus shall you do all the days, as the king and Moses the son of Bathia have commanded.* (Jasher 70:47). The seventh-day rest is no new commandment given at Sinai — it is the rest set in the creation, *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* (Genesis 2:2), and the word later graven in stone: *Remember the sabbath day, to keep it holy.* (Exodus 20:8) — *But the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God): in it thou shalt not do any work...* (Exodus 20:10). Jasher reckons it from Yahuah''s own remembering: *For this thing was from Yahuah (the Lord) to the children of Israel, for Yahuah (the Lord) had begun to remember the children of Israel to save them for the sake of their fathers.* (Jasher 70:49). Torah-before-Sinai — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56740
  FROM _session252_ja70_lookup sv, _session252_ja70_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=44
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=70 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-70-balaam-counsel-slay-the-child
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* The Torah''s Balaam son of Beor is the same magician Jasher seats at Pharaoh''s table, hired again against the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-balaam-counsel-slay-the-child'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* Balaam''s counsel to spill the child''s blood for the king''s favor is the very wages-of-unrighteousness way Peter names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-balaam-counsel-slay-the-child'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude pronounces woe on the error of Balaam for reward — the same reward Jasher''s Balaam seeks in advising Moses'' murder.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-balaam-counsel-slay-the-child'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-70-bondage-foretold-seed-multiplies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* Joseph''s descent into Egypt, which Balaam recounts, is the door into the affliction foretold to Abram at the covenant of the pieces.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-bondage-foretold-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The Pharaoh whose counsellors plot the child''s death is the new king of Exodus who forgot Joseph and turned on the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-bondage-foretold-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The very multiplying of the seed is what makes Egypt fear and Balaam counsel murder.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-bondage-foretold-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen names the casting-out of the children that frames Jasher''s whole scene — the kingdom of man against the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-bondage-foretold-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* Pharaoh seeking the chosen child''s blood is the same pattern Herod repeats — the dragon ever seeking to slay the deliverer.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-bondage-foretold-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-70-moses-preserved-coal-and-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* The canon''s plain account of the child kept alive stands beneath Jasher''s coal-legend of why the king spared him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-moses-preserved-coal-and-angel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:23 — *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* Hebrews reads Moses'' preservation as faith that did not fear the king''s commandment — the same deliverer Jasher shows kept in Pharaoh''s house.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-moses-preserved-coal-and-angel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:21 — *And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son.* Stephen names the favor that keeps Moses in the king''s house — Jasher''s *Yahuah was with him* in Pharaoh''s hall.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-moses-preserved-coal-and-angel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-70-drawn-out-nursed-jubilees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:10 — *And the child grew, and she brought him unto Pharaoh''s daughter, and he became her son. And she called his name Moses: and she said, Because I drew him out of the water.* Jasher''s Bathia who considers the grown boy a son is Exodus'' daughter of Pharaoh who drew Moses out and made him her son.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-drawn-out-nursed-jubilees'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:22 — *And Moses was learned in all the wisdom of the Egyptians, and was mighty in words and in deeds.* Stephen names the wisdom Moses gained growing in the king''s house, the very upbringing Jasher narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-drawn-out-nursed-jubilees'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 47:9 — *And afterwards, when you were grown up, they brought you to the daughter of Pharaoh, and you did become her son, and Amram your father taught you writing, and after you had completed three weeks they brought you into the royal court.* The Jubilees apparatus narrates the same grown-in-the-court scene, the Angel of the Presence telling Moses his own preservation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-drawn-out-nursed-jubilees'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=33
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-70-moses-sees-the-burdens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:11 — *And it came to pass in those days, when Moses was grown, that he went out unto his brethren, and looked on their burdens: and he spied an Egyptian smiting an Hebrew, one of his brethren.* Jasher''s daily going-forth to see the burdens is the going-out Exodus records, the prince claiming the slaves as his brethren.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-moses-sees-the-burdens'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:23 — *And when he was full forty years old, it came into his heart to visit his brethren the children of Yashar''el (Israel).* Stephen names the heart that turns to visit the brethren — the grief Jasher shows Moses bearing over their hard labor.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-moses-sees-the-burdens'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:25 — *For he supposed his brethren would have understood how that Elohim (God) by his hand would deliver them: but they understood not.* The deliverer''s heart is already set on his people, the very compassion Jasher narrates before the slaying and the flight.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-moses-sees-the-burdens'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-70-sabbath-rest-granted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* The seventh-day rest Moses obtains for Israel is the rest set in creation, kept long before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-sabbath-rest-granted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:8 — *Remember the sabbath day, to keep it holy.* The command later graven in stone is the same six-days-labor, seventh-day-rest Jasher shows proclaimed in Goshen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-sabbath-rest-granted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:10 — *But the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God): in it thou shalt not do any work, thou, nor thy son, nor thy daughter, thy manservant, nor thy maidservant, nor thy cattle, nor thy stranger that is within thy gates:* The proclamation''s seventh-day rest from all work is the Sabbath of the fourth word, here kept before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja70_lookup sv, _session252_ja70_lookup tv
 WHERE t.slug='jasher-70-sabbath-rest-granted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=70 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

