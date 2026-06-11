-- ----- fragment: minion_jasher_64.sql (session252 jasher 64) -----
-- Source anchor: jasher/jasher ch64. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja64 (view _session252_ja64_lookup). Sort band base 56575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja64_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-64-joseph-and-his-brethren-dead
  ('jasher', 'jasher', 64, 8, 'canon', 'genesis', 50, 24, 'free', E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* Joseph''s dying word of the promised visitation stands behind Jasher 64:8''s report that Joseph and his brethren were dead.'),
  ('jasher', 'jasher', 64, 8, 'canon', 'genesis', 50, 25, 'free', E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* The oath over Joseph''s bones is the canon promise that frames the death Jasher 64:8 records.'),
  ('jasher', 'jasher', 64, 8, 'canon', 'exodus', 1, 6, 'free', E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Exodus'' own seam matches Jasher 64:8 word for word — Joseph and his brethren dead, the generation passed.'),
  ('jasher', 'jasher', 64, 8, 'canon', 'exodus', 1, 7, 'free', E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The seed kept and multiplying in Egypt is the canon backdrop to Jasher 64:8''s note that all their children remained in Egypt.'),
  ('jasher', 'jasher', 64, 8, 'jubilees', 'jubilees', 46, 8, 'extras', E'Jubilees 46:8 — *And Joseph died in the forty-sixth jubilee, in the sixth week, in the second year, and they buried him in the land of Egypt, and his brethren died after him.* The Jubilees apparatus narrates the same passing of Joseph and his brethren that Jasher 64:8 reports.'),
  -- thread: jasher-64-esau-edom-set-apart
  ('jasher', 'jasher', 64, 5, 'canon', '1-samuel', 24, 13, 'free', E'1 Samuel 24:13 — *As saith the proverb of the ancients, Wickedness proceedeth from the wicked: but mine hand shall not be upon thee.* The very proverb Jasher 64:5 quotes over Zepho and the wicked children of Esau is the ancient canon proverb David spoke.'),
  ('jasher', 'jasher', 64, 9, 'canon', 'genesis', 36, 8, 'free', E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* Genesis already set Esau-Edom apart from the elect line, the house whose cause Zepho rises to avenge in Jasher 64:9.'),
  ('jasher', 'jasher', 64, 13, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Edom''s vow in Jasher 64:13 to avenge his cause against the children of Jacob is the very violence against his brother Obadiah indicts.'),
  ('jasher', 'jasher', 64, 14, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* As the children of Esau gather to war in Jasher 64:14, Malachi declares the election that set Jacob''s line apart from Esau''s.'),
  -- thread: jasher-64-balaam-divination-confounded
  ('jasher', 'jasher', 64, 27, 'canon', 'numbers', 22, 5, 'free', E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* The same Balaam son of Beor hired against Israel is the diviner Zepho summons in Jasher 64:27.'),
  ('jasher', 'jasher', 64, 29, 'canon', 'numbers', 23, 23, 'free', E'Numbers 23:23 — *Surely there is no enchantment against Jacob, neither is there any divination against Yashar''el (Israel): according to this time it shall be said of Jacob and of Yashar''el (Israel), What hath Elohim (God) wrought!* The canon''s verdict is Jasher 64:29''s whole point — the divination is destroyed in Balaam''s hand because no enchantment stands against the seed.'),
  ('jasher', 'jasher', 64, 29, 'canon', 'deuteronomy', 23, 5, 'free', E'Deuteronomy 23:5 — *Nevertheless Yahuah Elohayka (the LORD thy God) would not hearken unto Balaam; but Yahuah Elohayka (the LORD thy God) turned the curse into a blessing unto thee, because Yahuah Elohayka (the LORD thy God) loved thee.* Yahuah confounding Balaam in Jasher 64:29 is the same love-driven turning the canon records over Israel.'),
  ('jasher', 'jasher', 64, 28, 'canon', '2-peter', 2, 15, 'free', E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* The hireling diviner of Jasher 64:28 is the very way of Balaam the NT marks as the road of those who love the wages of unrighteousness.'),
  ('jasher', 'jasher', 64, 28, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude names the error of Balaam for reward — the hired counsel against the seed that fails in Balaam''s hand in Jasher 64:28.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja64_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja64_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-64-joseph-and-his-brethren-dead',
       E'Joseph and his brethren are dead — the generation passes',
       E'Jasher reports the hinge that opens the bondage: *For Zepho heard that the mighty men of Egypt were dead and that Joseph and his brethren the sons at Jacob were dead, and that all their children the children of Israel remained in Egypt.* (Jasher 64:8). This is the very seam of Exodus 1, where the canon turns the page from the patriarchs to the affliction — it ain''t new. Genesis already set the oath in Joseph''s mouth: *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* (Genesis 50:24), and *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* (Genesis 50:25) — the visitation and the bones promised. Exodus picks up exactly where Jasher stands: *And Joseph died, and all his brethren, and all that generation.* (Exodus 1:6), and the seed kept and multiplying: *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* (Exodus 1:7). The Jubilees apparatus narrates the same passing: *And Joseph died in the forty-sixth jubilee, in the sixth week, in the second year, and they buried him in the land of Egypt, and his brethren died after him.* (Jubilees 46:8).',
       sv.verse_id, ev.verse_id, 'extras', 56575
  FROM _session252_ja64_lookup sv, _session252_ja64_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=64 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-64-esau-edom-set-apart',
       E'Esau and Edom set apart — from the wicked goes forth wickedness',
       E'Jasher names the old grudge of Edom against the elect line. Zepho the son of Eliphaz, son of Esau, *still walked in the ways of the children of Chittim and the wicked children of Esau, to serve other gods which his brethren the children of Esau had taught him; it is therefore said, From the wicked goes forth wickedness.* (Jasher 64:5), and he calls his brethren the children of Esau to *avenge the cause of our brethren* (Jasher 64:9, 13). The proverb Jasher quotes is the canon''s own: *As saith the proverb of the ancients, Wickedness proceedeth from the wicked: but mine hand shall not be upon thee.* (1 Samuel 24:13). Genesis already set Esau apart in his own mountain: *Thus dwelt Esau in mount Seir: Esau is Edom.* (Genesis 36:8). The prophets read the grudge as Edom''s perpetual violence against his brother: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* (Obadiah 1:10), and election standing fast: *Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* (Malachi 1:2). Election precedes confession — the chosen seed is kept and Edom is set outside it, not a people erased but a line not chosen.',
       sv.verse_id, ev.verse_id, 'extras', 56578
  FROM _session252_ja64_lookup sv, _session252_ja64_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=64 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-64-balaam-divination-confounded',
       E'Balaam the diviner confounded — no enchantment against Yashar''el',
       E'Balaam the son of Beor appears here as Zepho''s hired counselor against Israel, and Yahuah breaks his art in his hand. *And Zepho said to Balaam, Try by divination for us that we may know who will prevail in the battle, we or the Egyptians.* (Jasher 64:27); *And Balaam rose up and tried the are of divination, and he was skillful in the knowledge of it, but he was confused and the work was destroyed in his hand.* (Jasher 64:28); *And he tried it again but it did not succeed... for this was from Yahuah (the Lord), in order to cause Zepho and his people to fall into the hand of the children of Israel, who had trusted in Yahuah (the Lord), the Elohim (God) of their ancestors, in their war.* (Jasher 64:29). This is the same Balaam the canon names: *He sent messengers therefore unto Balaam the son of Beor to Pethor... to call him* (Numbers 22:5), and the canon''s verdict over his art against the seed is exactly Jasher''s: *Surely there is no enchantment against Jacob, neither is there any divination against Yashar''el (Israel)...* (Numbers 23:23), for *Yahuah Elohayka (the LORD thy God) turned the curse into a blessing unto thee, because Yahuah Elohayka (the LORD thy God) loved thee.* (Deuteronomy 23:5). The NT seals the way of Balaam as the hireling road: *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* (2 Peter 2:15), and *Woe unto them!... and ran greedily after the error of Balaam for reward...* (Jude 11). It ain''t new — the seed is kept, the divination falls.',
       sv.verse_id, ev.verse_id, 'extras', 56581
  FROM _session252_ja64_lookup sv, _session252_ja64_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=27
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=64 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-64-joseph-and-his-brethren-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* Joseph''s dying word of the promised visitation stands behind Jasher 64:8''s report that Joseph and his brethren were dead.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-joseph-and-his-brethren-dead'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:25 — *And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* The oath over Joseph''s bones is the canon promise that frames the death Jasher 64:8 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-joseph-and-his-brethren-dead'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Exodus'' own seam matches Jasher 64:8 word for word — Joseph and his brethren dead, the generation passed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-joseph-and-his-brethren-dead'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The seed kept and multiplying in Egypt is the canon backdrop to Jasher 64:8''s note that all their children remained in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-joseph-and-his-brethren-dead'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 46:8 — *And Joseph died in the forty-sixth jubilee, in the sixth week, in the second year, and they buried him in the land of Egypt, and his brethren died after him.* The Jubilees apparatus narrates the same passing of Joseph and his brethren that Jasher 64:8 reports.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-joseph-and-his-brethren-dead'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-64-esau-edom-set-apart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 24:13 — *As saith the proverb of the ancients, Wickedness proceedeth from the wicked: but mine hand shall not be upon thee.* The very proverb Jasher 64:5 quotes over Zepho and the wicked children of Esau is the ancient canon proverb David spoke.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-esau-edom-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* Genesis already set Esau-Edom apart from the elect line, the house whose cause Zepho rises to avenge in Jasher 64:9.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-esau-edom-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Edom''s vow in Jasher 64:13 to avenge his cause against the children of Jacob is the very violence against his brother Obadiah indicts.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-esau-edom-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* As the children of Esau gather to war in Jasher 64:14, Malachi declares the election that set Jacob''s line apart from Esau''s.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-esau-edom-set-apart'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-64-balaam-divination-confounded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 22:5 — *He sent messengers therefore unto Balaam the son of Beor to Pethor, which is by the river of the land of the children of his people, to call him, saying, Behold, there is a people come out from Egypt: behold, they cover the face of the earth, and they abide over against me:* The same Balaam son of Beor hired against Israel is the diviner Zepho summons in Jasher 64:27.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-balaam-divination-confounded'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 23:23 — *Surely there is no enchantment against Jacob, neither is there any divination against Yashar''el (Israel): according to this time it shall be said of Jacob and of Yashar''el (Israel), What hath Elohim (God) wrought!* The canon''s verdict is Jasher 64:29''s whole point — the divination is destroyed in Balaam''s hand because no enchantment stands against the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-balaam-divination-confounded'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 23:5 — *Nevertheless Yahuah Elohayka (the LORD thy God) would not hearken unto Balaam; but Yahuah Elohayka (the LORD thy God) turned the curse into a blessing unto thee, because Yahuah Elohayka (the LORD thy God) loved thee.* Yahuah confounding Balaam in Jasher 64:29 is the same love-driven turning the canon records over Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-balaam-divination-confounded'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:15 — *Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* The hireling diviner of Jasher 64:28 is the very way of Balaam the NT marks as the road of those who love the wages of unrighteousness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-balaam-divination-confounded'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude names the error of Balaam for reward — the hired counsel against the seed that fails in Balaam''s hand in Jasher 64:28.'
  FROM cross_reference_threads t, cross_references x, _session252_ja64_lookup sv, _session252_ja64_lookup tv
 WHERE t.slug='jasher-64-balaam-divination-confounded'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=64 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

