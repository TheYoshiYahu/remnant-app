-- ----- fragment: minion_jasher_73.sql (session252 jasher 73) -----
-- Source anchor: jasher/jasher ch73. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja73 (view _session252_ja73_lookup). Sort band base 56800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja73_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-73-egypt-sorcerers-withstand-moses
  ('jasher', 'jasher', 73, 29, 'canon', 'exodus', 7, 11, 'free', E'Exodus 7:11 — *Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments.* These are the very sorcerers Jasher 73:29 says stood against Moses when the plagues came upon Egypt.'),
  ('jasher', 'jasher', 73, 29, 'canon', 'exodus', 7, 22, 'free', E'Exodus 7:22 — *And the magicians of Egypt did so with their enchantments: and Pharaoh’s heart was hardened, neither did he hearken unto them; as Yahuah (LORD) had said.* The magicians match Yahuah''s signs awhile, just as Jasher 73:29 names them resisting Moses through the plagues.'),
  ('jasher', 'jasher', 73, 29, 'canon', '2-timothy', 3, 8, 'free', E'2 Timothy 3:8 — *Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith.* The apostle names the tradition Jasher 73:29 records — the sorcerers who withstood Moses in Egypt.'),
  -- thread: jasher-73-seed-line-kept-no-canaanite
  ('jasher', 'jasher', 73, 33, 'canon', 'genesis', 24, 3, 'free', E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell.* This is the very oath of Abraham to Eliezer that Jasher 73:33 says Moses remembered when he kept from the Cushite queen.'),
  ('jasher', 'jasher', 73, 34, 'canon', 'genesis', 28, 1, 'free', E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* This is Isaac''s charge to the fleeing Jacob that Jasher 73:34 recalls as Moses'' reason to guard the seed-line.'),
  ('jasher', 'jasher', 73, 35, 'canon', 'genesis', 9, 25, 'free', E'Genesis 9:25 — *And he said, Cursed be Canaan; a servant of servants shall he be unto his brethren.* Noah''s word on Ham''s line stands behind Jasher 73:35, which gives Ham and his seed as slaves to Shem and Japheth.'),
  -- thread: jasher-73-moses-walked-not-right-or-left
  ('jasher', 'jasher', 73, 37, 'canon', 'deuteronomy', 5, 32, 'free', E'Deuteronomy 5:32 — *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left.* The very measure of walking Jasher 73:37 says Moses kept — declining neither to right nor left from the fathers'' way.'),
  ('jasher', 'jasher', 73, 37, 'canon', 'joshua', 1, 7, 'free', E'Joshua 1:7 — *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest.* The charge Moses himself laid down — the same ''right or left'' walking Jasher 73:37 reports of his own life.'),
  ('jasher', 'jasher', 73, 37, 'canon', 'hebrews', 11, 27, 'free', E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* The apostle reads Moses'' steadfast life by faith — the same fear of Yahuah and unswerving way Jasher 73:37 records.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja73_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja73_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-73-egypt-sorcerers-withstand-moses',
       E'Balaam and the magicians who flee back to Pharaoh',
       E'Jasher''s Cush war is pure legend, but at its edge it names a man the canon knows. When the besieged city falls, *And Balaam the magician, when he saw that the city was taken, he opened the gate and he and his two sons and eight brothers fled and returned to Egypt to Pharaoh king of Egypt* (Jasher 73:28), and the narrator tells us exactly who they are: *They are the sorcerers and magicians who are mentioned in the book of the law, standing against Moses when Yahuah (the Lord) brought the plagues upon Egypt* (Jasher 73:29). Come and see the book of the law it points to: *Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments* (Exodus 7:11); *And the magicians of Egypt did so with their enchantments: and Pharaoh’s heart was hardened, neither did he hearken unto them; as Yahuah (LORD) had said* (Exodus 7:22). The New Testament hands their tradition a name: *Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith* (2 Timothy 3:8). The kingdom-of-man raises its sorcerers, but Yahuah''s hand is mightier — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56800
  FROM _session252_ja73_lookup sv, _session252_ja73_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=73 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-73-seed-line-kept-no-canaanite',
       E'Moses keeps the seed-line — the patriarchal oath against Canaanite wives',
       E'Crowned king of Cush and given the Cushite queen, Moses guards the chosen seed: *And Moses feared Yahuah Elohim (the Lord God) of his fathers, so that he came not to her, nor did he turn his eyes to her* (Jasher 73:32). His reason is the fathers'' own charge: *For Moses remembered how Abraham had made his servant Eliezer swear, saying to him, You shall not take a woman from the daughters of Canaan for my son Isaac* (Jasher 73:33), and *Also what Isaac did when Jacob had fled from his brother, when he commanded him, saying, You shall not take a wife from the daughters of Canaan, nor make alliance with any of the children of Ham* (Jasher 73:34). Come and see those very charges in Genesis: *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell* (Genesis 24:3); *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan* (Genesis 28:1). Jasher grounds the line of Ham in Noah''s word: *And he said, Cursed be Canaan; a servant of servants shall he be unto his brethren* (Genesis 9:25). The covenant seed is kept generation by generation — election before confession, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56803
  FROM _session252_ja73_lookup sv, _session252_ja73_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=32
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=73 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-73-moses-walked-not-right-or-left',
       E'Moses walked before Yahuah in truth, turning not right or left',
       E'Through forty years over Cush, the man kept the way of his fathers: *And Moses feared Yahuah his Elohim (the Lord his God) all his life, and Moses walked before Yahuah (the Lord) in truth, with all his heart and soul, he turned not from the right way all the days of his life; he declined not from the way either to the right or to the left, in which Abraham, Isaac and Jacob had walked* (Jasher 73:37). Come and see the very measure Torah names: *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left* (Deuteronomy 5:32) — the charge Moses himself would lay on Israel and on Joshua: *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest* (Joshua 1:7). And the New Testament reads his whole life as faith: *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible* (Hebrews 11:27). Torah-before-Sinai, the way of the fathers kept — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56806
  FROM _session252_ja73_lookup sv, _session252_ja73_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=37
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=73 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-73-egypt-sorcerers-withstand-moses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:11 — *Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments.* These are the very sorcerers Jasher 73:29 says stood against Moses when the plagues came upon Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja73_lookup sv, _session252_ja73_lookup tv
 WHERE t.slug='jasher-73-egypt-sorcerers-withstand-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 7:22 — *And the magicians of Egypt did so with their enchantments: and Pharaoh’s heart was hardened, neither did he hearken unto them; as Yahuah (LORD) had said.* The magicians match Yahuah''s signs awhile, just as Jasher 73:29 names them resisting Moses through the plagues.'
  FROM cross_reference_threads t, cross_references x, _session252_ja73_lookup sv, _session252_ja73_lookup tv
 WHERE t.slug='jasher-73-egypt-sorcerers-withstand-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 3:8 — *Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith.* The apostle names the tradition Jasher 73:29 records — the sorcerers who withstood Moses in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja73_lookup sv, _session252_ja73_lookup tv
 WHERE t.slug='jasher-73-egypt-sorcerers-withstand-moses'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-73-seed-line-kept-no-canaanite
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell.* This is the very oath of Abraham to Eliezer that Jasher 73:33 says Moses remembered when he kept from the Cushite queen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja73_lookup sv, _session252_ja73_lookup tv
 WHERE t.slug='jasher-73-seed-line-kept-no-canaanite'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* This is Isaac''s charge to the fleeing Jacob that Jasher 73:34 recalls as Moses'' reason to guard the seed-line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja73_lookup sv, _session252_ja73_lookup tv
 WHERE t.slug='jasher-73-seed-line-kept-no-canaanite'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:25 — *And he said, Cursed be Canaan; a servant of servants shall he be unto his brethren.* Noah''s word on Ham''s line stands behind Jasher 73:35, which gives Ham and his seed as slaves to Shem and Japheth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja73_lookup sv, _session252_ja73_lookup tv
 WHERE t.slug='jasher-73-seed-line-kept-no-canaanite'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-73-moses-walked-not-right-or-left
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 5:32 — *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left.* The very measure of walking Jasher 73:37 says Moses kept — declining neither to right nor left from the fathers'' way.'
  FROM cross_reference_threads t, cross_references x, _session252_ja73_lookup sv, _session252_ja73_lookup tv
 WHERE t.slug='jasher-73-moses-walked-not-right-or-left'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:7 — *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest.* The charge Moses himself laid down — the same ''right or left'' walking Jasher 73:37 reports of his own life.'
  FROM cross_reference_threads t, cross_references x, _session252_ja73_lookup sv, _session252_ja73_lookup tv
 WHERE t.slug='jasher-73-moses-walked-not-right-or-left'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* The apostle reads Moses'' steadfast life by faith — the same fear of Yahuah and unswerving way Jasher 73:37 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja73_lookup sv, _session252_ja73_lookup tv
 WHERE t.slug='jasher-73-moses-walked-not-right-or-left'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=73 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

