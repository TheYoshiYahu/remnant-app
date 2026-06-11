-- ----- fragment: minion_jasher_66.sql (session252 jasher 66) -----
-- Source anchor: jasher/jasher ch66. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja66 (view _session252_ja66_lookup). Sort band base 56625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja66_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-66-edom-kings-samlah
  ('jasher', 'jasher', 66, 1, 'canon', 'genesis', 36, 36, 'free', E'Genesis 36:36 — *And Hadad died, and Samlah of Masrekah reigned in his stead.* The Torah''s Edomite king-list names the very succession Jasher 66:1 retells — Hadad dies, Samlah of Masrekah/Mesrekah reigns.'),
  ('jasher', 'jasher', 66, 1, 'canon', 'genesis', 36, 35, 'free', E'Genesis 36:35 — *And Husham died, and Hadad the son of Bedad, who smote Midian in the field of Moab, reigned in his stead: and the name of his city was Avith.* The Hadad son of Bedad whose death Jasher 66:1 records is the same king Genesis already named.'),
  ('jasher', 'jasher', 66, 1, 'canon', 'genesis', 36, 31, 'free', E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* Esau''s kings rise while Israel is still a bondaged seed — the frame against which Jasher 66:1 sets Edom''s succession.'),
  -- thread: jasher-66-esau-brethren-war-fear
  ('jasher', 'jasher', 66, 7, 'canon', 'exodus', 1, 10, 'free', E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* The very war-dread Jasher 66:6-7 dramatizes is the canon''s own stated reason for Egypt''s rigour.'),
  -- thread: jasher-66-seed-multiplies-affliction
  ('jasher', 'jasher', 66, 9, 'canon', 'exodus', 1, 12, 'free', E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* The canon''s line is nearly identical to Jasher 66:9 — labor increased, the seed multiplied all the more.'),
  ('jasher', 'jasher', 66, 9, 'canon', 'exodus', 1, 7, 'free', E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* Israel filling the land of Egypt, as Jasher 66:9-10 records.'),
  ('jasher', 'jasher', 66, 9, 'canon', 'acts', 7, 17, 'free', E'Acts 7:17 — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt.* Stephen reads the multiplying seed of Jasher 66:9 as the promise to Abraham ripening.'),
  ('jasher', 'jasher', 66, 8, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The bondage Jasher 66:8 describes was foretold to Abraham — the affliction is no accident but covenant prophecy.'),
  ('jasher', 'jasher', 66, 9, 'jubilees', 'jubilees', 46, 15, 'extras', E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* Jubilees carries the same paradox as Jasher 66:9 — rigour met with multiplication.'),
  -- thread: jasher-66-pharaoh-counsel-wise-men
  ('jasher', 'jasher', 66, 14, 'canon', 'exodus', 1, 9, 'free', E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we:* Pharaoh''s dread of a more-numerous Israel is the seed of the council Jasher 66:14 stages in full.'),
  ('jasher', 'jasher', 66, 12, 'canon', 'exodus', 1, 8, 'free', E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The king Jasher 66:11-12 shows taking counsel is the canon''s new Pharaoh who knew not Joseph.'),
  ('jasher', 'jasher', 66, 12, 'canon', 'acts', 7, 18, 'free', E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen''s summary of the king behind the bondage Jasher 66 narrates.'),
  ('jasher', 'jasher', 66, 14, 'jubilees', 'jubilees', 46, 13, 'extras', E'Jubilees 46:13 — *"Behold the people of the children of Yashar''el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many, and let us afflict them with slavery before war come upon us and before they too fight against us; else they will join themselves to our enemies and get them up out of our land, for their hearts and faces are towards the land of Canaan."* Jubilees stages the same royal counsel against Israel that Jasher 66:12-14 dramatizes.'),
  -- thread: jasher-66-decree-slay-male-children
  ('jasher', 'jasher', 66, 22, 'canon', 'exodus', 1, 22, 'free', E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* The canon''s decree against the male children is the law Job counsels into being in Jasher 66:21-22.'),
  ('jasher', 'jasher', 66, 22, 'canon', 'acts', 7, 19, 'free', E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen''s witness to the very decree Jasher 66:21-22 records.'),
  ('jasher', 'jasher', 66, 21, 'canon', 'matthew', 2, 16, 'free', E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* Herod''s slaughter of the infants mirrors the Egyptian decree of Jasher 66:21 — the kingdom of man slaying the male child to kill the deliverer.'),
  ('jasher', 'jasher', 66, 22, 'canon', 'revelation', 12, 4, 'free', E'Revelation 12:4 — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* The dragon at the birth is the same war on the seed Jasher 66:22 shows Pharaoh waging.'),
  ('jasher', 'jasher', 66, 21, 'jubilees', 'jubilees', 47, 2, 'extras', E'Jubilees 47:2 — *And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river.* Jubilees records the same river-decree against the male children that Jasher 66:21 has Job propose.'),
  -- thread: jasher-66-midwives-feared-elohim
  ('jasher', 'jasher', 66, 23, 'canon', 'exodus', 1, 15, 'free', E'Exodus 1:15 — *And the king of Egypt spake to the Hebrew midwives, of which the name of the one was Shiphrah, and the name of the other Puah:* The canon names the same two midwives Jasher 66:23 summons before the king.'),
  ('jasher', 'jasher', 66, 25, 'canon', 'exodus', 1, 16, 'free', E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* The king''s command in Jasher 66:25 matches the canon''s word for word — kill the son, spare the daughter.'),
  ('jasher', 'jasher', 66, 27, 'canon', 'exodus', 1, 17, 'free', E'Exodus 1:17 — *But the midwives feared Elohim (God), and did not as the king of Egypt commanded them, but saved the men children alive.* The midwives'' fear of Elohim over Pharaoh, exactly as Jasher 66:27 tells it.'),
  ('jasher', 'jasher', 66, 31, 'canon', 'exodus', 1, 20, 'free', E'Exodus 1:20 — *Therefore Elohim (God) dealt well with the midwives: and the people multiplied, and waxed very mighty.* Elohim''s reward to the midwives and the multiplying people closes both Exodus 1 and Jasher 66:31.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja66_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja66_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-66-edom-kings-samlah',
       E'Samlah reigns in Edom — the kings of Esau before Israel had a king',
       E'Jasher opens the bondage chapter with a note of Edom''s succession: *"At that time died Hadad the son of Bedad king of Edom, and Samlah from Mesrekah, from the country of the children of the east, reigned in his place"* (Jasher 66:1). This is Jasher carrying the same Edomite king-list Moses set down: *"And Husham died, and Hadad the son of Bedad, who smote Midian in the field of Moab, reigned in his stead: and the name of his city was Avith"* (Genesis 36:35), and then *"And Hadad died, and Samlah of Masrekah reigned in his stead"* (Genesis 36:36). The Torah marks these as *"the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel)"* (Genesis 36:31) — Esau''s line crowns kings while the chosen seed is still under the rod in Egypt, election running its quiet course beneath the kingdoms of men. It ain''t new; Jasher only puts flesh on the genealogy already written.',
       sv.verse_id, ev.verse_id, 'extras', 56625
  FROM _session252_ja66_lookup sv, _session252_ja66_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=66 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-66-esau-brethren-war-fear',
       E'Esau the brother — and Egypt''s dread of the Hebrews joining a war',
       E'Samlah marches against Zepho son of Eliphaz and the children of Chittim, *"But he did not engage with him, for the children of Esau prevented him, saying, He was their brother"* (Jasher 66:4) — Esau''s house held back by the bond of brotherhood, the recurring Jacob-and-Esau tie. Pharaoh, hearing of it, *"increased the labor upon the children of Israel, lest the Israelites should do to them as they did to them in their war with the children of Esau"* (Jasher 66:6), and the Egyptians said *"strengthen the land, lest the children of Esau your brethren should come to fight against us"* (Jasher 66:7). This is Jasher''s legendary expansion, but it lands exactly on the canon''s stated motive for the bondage: *"Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land"* (Exodus 1:10). The kingdom of man enslaves the chosen seed out of fear of a war — the same dread Pharaoh confesses in Exodus.',
       sv.verse_id, ev.verse_id, 'extras', 56628
  FROM _session252_ja66_lookup sv, _session252_ja66_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=66 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-66-seed-multiplies-affliction',
       E'The more they afflicted them, the more they multiplied — the seed kept',
       E'*"But as the Egyptians increased the labor upon the children of Israel, so did the children of Israel increase and multiply, and all Egypt was filled with the children of Israel"* (Jasher 66:9). Jasher echoes the canon almost word for word: *"But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel)"* (Exodus 1:12); and earlier, *"the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them"* (Exodus 1:7). Stephen reads it as promise ripening: *"But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt"* (Acts 7:17) — for this affliction was foretold to Abraham himself: *"Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years"* (Genesis 15:13). Jubilees tells the same: *"And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied"* (Jubilees 46:15). The covenant seed cannot be crushed out; affliction only enlarges it.',
       sv.verse_id, ev.verse_id, 'extras', 56631
  FROM _session252_ja66_lookup sv, _session252_ja66_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=66 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-66-pharaoh-counsel-wise-men',
       E'Pharaoh takes counsel of his wise men to deal wisely with Israel',
       E'The elders and wise men of Egypt come before the king: *"Now therefore our Lord and king, the eyes of all Egypt are upon you to give them advice with your wisdom, by which they may prevail over Israel to destroy them, or to diminish them from the land"* (Jasher 66:14). This is Jasher unfolding the canon''s single dense sentence: *"And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we"* (Exodus 1:9), *"Come on, let us deal wisely with them"* (Exodus 1:10) — and behind the new king is the canon''s note, *"Now there arose up a new king over Egypt, which knew not Joseph"* (Exodus 1:8), which Stephen echoes: *"Till another king arose, which knew not Joseph"* (Acts 7:18). Jubilees tells it the same way: *"Behold the people of the children of Yashar''el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many"* (Jubilees 46:13). Jasher simply convenes the council the canon implies — the kingdom of man plotting against the seed it cannot out-number.',
       sv.verse_id, ev.verse_id, 'extras', 56634
  FROM _session252_ja66_lookup sv, _session252_ja66_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=66 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-66-decree-slay-male-children',
       E'The decree to spill the blood of every male child — the dragon at the manger',
       E'Job of Mesopotamia counsels the king: *"If it please the king, let a royal decree go forth, and let it be written in the laws of Egypt which shall not be revoked, that every male child born to the Israelites, his blood shall be spilled upon the ground"* (Jasher 66:21), *"And by your doing this, when all the male children of Israel shall have died, the evil of their wars will cease"* (Jasher 66:22). The canon issues the decree plainly: *"And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive"* (Exodus 1:22), and Stephen names its cruelty: *"The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live"* (Acts 7:19). Jubilees fixes the same edict: *"And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river"* (Jubilees 47:2). This is the antichrist pattern — the kingdom of man slaying the chosen male child to break the seed-line, the same hand Nimrod stretched toward the infant Abraham, that Herod stretched toward the infant Messiah (*"slew all the children that were in Bethlehem"*, Matthew 2:16), that the dragon stretches in the last day: *"and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born"* (Revelation 12:4). It ain''t new; the war on the seed is one war.',
       sv.verse_id, ev.verse_id, 'extras', 56637
  FROM _session252_ja66_lookup sv, _session252_ja66_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=21
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=66 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-66-midwives-feared-elohim',
       E'Shephrah and Puah feared Elohim — the midwives who would not kill',
       E'*"And the king sent for the Hebrew midwives to be called, of which the name of one was Shephrah, and the name of the other Puah"* (Jasher 66:23); commanded to kill every son, *"But the midwives feared Elohim (God) and did not hearken to the king of Egypt nor to his words... then did the midwife do all that was necessary to the child and let it live"* (Jasher 66:27); and *"Elohim dealt well with them, and the people multiplied and waxed exceedingly"* (Jasher 66:31). This is the canon scene quoted almost name for name: *"And the king of Egypt spake to the Hebrew midwives, of which the name of the one was Shiphrah, and the name of the other Puah"* (Exodus 1:15); *"But the midwives feared Elohim (God), and did not as the king of Egypt commanded them, but saved the men children alive"* (Exodus 1:17); *"Therefore Elohim (God) dealt well with the midwives: and the people multiplied, and waxed very mighty"* (Exodus 1:20). The fear of Elohim outranks the decree of Pharaoh — Torah-faithfulness against the kingdom of man, and the seed kept alive by it. It ain''t new; Jasher only sets the canon''s two righteous women side by side with their reward.',
       sv.verse_id, ev.verse_id, 'extras', 56640
  FROM _session252_ja66_lookup sv, _session252_ja66_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=66 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-66-edom-kings-samlah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:36 — *And Hadad died, and Samlah of Masrekah reigned in his stead.* The Torah''s Edomite king-list names the very succession Jasher 66:1 retells — Hadad dies, Samlah of Masrekah/Mesrekah reigns.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-edom-kings-samlah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:35 — *And Husham died, and Hadad the son of Bedad, who smote Midian in the field of Moab, reigned in his stead: and the name of his city was Avith.* The Hadad son of Bedad whose death Jasher 66:1 records is the same king Genesis already named.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-edom-kings-samlah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* Esau''s kings rise while Israel is still a bondaged seed — the frame against which Jasher 66:1 sets Edom''s succession.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-edom-kings-samlah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-66-esau-brethren-war-fear
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* The very war-dread Jasher 66:6-7 dramatizes is the canon''s own stated reason for Egypt''s rigour.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-esau-brethren-war-fear'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-66-seed-multiplies-affliction
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew. And they were grieved because of the children of Yashar''el (Israel).* The canon''s line is nearly identical to Jasher 66:9 — labor increased, the seed multiplied all the more.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-seed-multiplies-affliction'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* Israel filling the land of Egypt, as Jasher 66:9-10 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-seed-multiplies-affliction'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:17 — *But when the time of the promise drew nigh, which Elohim (God) had sworn to Abraham, the people grew and multiplied in Egypt.* Stephen reads the multiplying seed of Jasher 66:9 as the promise to Abraham ripening.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-seed-multiplies-affliction'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The bondage Jasher 66:8 describes was foretold to Abraham — the affliction is no accident but covenant prophecy.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-seed-multiplies-affliction'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 46:15 — *And they made them serve with rigour, and the more they dealt evilly with them, the more they increased and multiplied.* Jubilees carries the same paradox as Jasher 66:9 — rigour met with multiplication.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-seed-multiplies-affliction'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-66-pharaoh-counsel-wise-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we:* Pharaoh''s dread of a more-numerous Israel is the seed of the council Jasher 66:14 stages in full.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-pharaoh-counsel-wise-men'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph.* The king Jasher 66:11-12 shows taking counsel is the canon''s new Pharaoh who knew not Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-pharaoh-counsel-wise-men'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:18 — *Till another king arose, which knew not Joseph.* Stephen''s summary of the king behind the bondage Jasher 66 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-pharaoh-counsel-wise-men'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:13 — *"Behold the people of the children of Yashar''el (Israel) have increased and multiplied more than we. Come and let us deal wisely with them before they become too many, and let us afflict them with slavery before war come upon us and before they too fight against us; else they will join themselves to our enemies and get them up out of our land, for their hearts and faces are towards the land of Canaan."* Jubilees stages the same royal counsel against Israel that Jasher 66:12-14 dramatizes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-pharaoh-counsel-wise-men'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-66-decree-slay-male-children
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* The canon''s decree against the male children is the law Job counsels into being in Jasher 66:21-22.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-decree-slay-male-children'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:19 — *The same dealt subtilly with our kindred, and evil entreated our fathers, so that they cast out their young children, to the end they might not live.* Stephen''s witness to the very decree Jasher 66:21-22 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-decree-slay-male-children'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* Herod''s slaughter of the infants mirrors the Egyptian decree of Jasher 66:21 — the kingdom of man slaying the male child to kill the deliverer.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-decree-slay-male-children'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:4 — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* The dragon at the birth is the same war on the seed Jasher 66:22 shows Pharaoh waging.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-decree-slay-male-children'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 47:2 — *And Pharaoh, king of Egypt, issued a command regarding them that they should cast all their male children which were born into the river.* Jubilees records the same river-decree against the male children that Jasher 66:21 has Job propose.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-decree-slay-male-children'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=21
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=47 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-66-midwives-feared-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:15 — *And the king of Egypt spake to the Hebrew midwives, of which the name of the one was Shiphrah, and the name of the other Puah:* The canon names the same two midwives Jasher 66:23 summons before the king.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-midwives-feared-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* The king''s command in Jasher 66:25 matches the canon''s word for word — kill the son, spare the daughter.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-midwives-feared-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:17 — *But the midwives feared Elohim (God), and did not as the king of Egypt commanded them, but saved the men children alive.* The midwives'' fear of Elohim over Pharaoh, exactly as Jasher 66:27 tells it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-midwives-feared-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 1:20 — *Therefore Elohim (God) dealt well with the midwives: and the people multiplied, and waxed very mighty.* Elohim''s reward to the midwives and the multiplying people closes both Exodus 1 and Jasher 66:31.'
  FROM cross_reference_threads t, cross_references x, _session252_ja66_lookup sv, _session252_ja66_lookup tv
 WHERE t.slug='jasher-66-midwives-feared-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=66 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

